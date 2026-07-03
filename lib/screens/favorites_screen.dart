import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';
import '../core/theme/theme_colors_helper.dart';
import '../data/template_data.dart';
import '../helpers/favorites_storage_helper.dart';
import 'template_detail_screen.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> with WidgetsBindingObserver {
  Set<String> _favoriteIds = {};
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _loadFavorites();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _loadFavorites();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final favorites = await FavoritesStorageHelper.loadFavorites();
    if (mounted) {
      setState(() {
        _favoriteIds = favorites.toSet();
        _isLoading = false;
      });
    }
  }

  Future<void> _removeFavorite(String templateId) async {
    await FavoritesStorageHelper.removeFavorite(templateId);
    await _loadFavorites();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Removed from favorites'),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
      ),
    );
  }

  List<TemplateItem> _getFavoriteTemplates() {
    List<TemplateItem> allTemplates = [];
    allTemplates.addAll(EmailTemplatesData.getTemplates());
    allTemplates.addAll(LinkedInMessagesData.getTemplates());
    allTemplates.addAll(WorkplaceMessagesData.getTemplates());
    allTemplates.addAll(StudentEmailsData.getTemplates());

    return allTemplates
        .where((template) => _favoriteIds.contains(template.id))
        .toList();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final favorites = _getFavoriteTemplates();
    final bgColor = ThemeColors.getBackground(context);
    final textPrimary = ThemeColors.getTextPrimary(context);
    final textSecondary = ThemeColors.getTextSecondary(context);
    final cardColor = ThemeColors.getCardBackground(context);
    final borderColor = ThemeColors.getBorder(context);

    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        children: [
          // Blue Header
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Favorites',
                  style: AppTextStyles.h2.copyWith(color: AppColors.white),
                ),
                const SizedBox(height: 8),
                Text(
                  '${favorites.length} favorite template${favorites.length != 1 ? 's' : ''}',
                  style: const TextStyle(
                    fontSize: 15,
                    color: AppColors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),

          // Favorites List
          Expanded(
            child: favorites.isEmpty
                ? _buildEmptyState(textPrimary, textSecondary)
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: favorites.length,
                    itemBuilder: (context, index) {
                      final template = favorites[index];
                      return _buildFavoriteCard(
                        template,
                        cardColor,
                        textPrimary,
                        textSecondary,
                        borderColor,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildFavoriteCard(
    TemplateItem template,
    Color cardColor,
    Color textPrimary,
    Color textSecondary,
    Color borderColor,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor, width: 1),
        boxShadow: [
          BoxShadow(
            color: AppColors.blackOverlay,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TemplateDetailScreen(
                templateTitle: template.title,
                categoryColor: AppColors.primary,
                templateId: template.id,
                versions: template.versions,
              ),
            ),
          );
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      template.title,
                      style: AppTextStyles.h4.copyWith(
                        fontSize: 17,
                        color: textPrimary,
                      ),
                    ),
                  ),
                  // 
                  IconButton(
                    onPressed: () {
                      _removeFavorite(template.id);
                    },
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 24,
                    ),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                template.description,
                style: AppTextStyles.bodySmall.copyWith(
                  fontSize: 14,
                  color: textSecondary,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState(Color textPrimary, Color textSecondary) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite_outline,
            size: 64,
            color: textSecondary.withOpacity(0.5),
          ),
          const SizedBox(height: 16),
          // ✅ FIXED: Explicitly set color to textPrimary (white in dark mode)
          Text(
            'No favorites yet',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: textPrimary,  // ← Explicitly white in dark mode
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Add templates to favorites by tapping the heart icon',
            style: AppTextStyles.bodyMedium.copyWith(
              color: textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}