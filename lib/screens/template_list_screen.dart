import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';
import '../core/theme/theme_colors_helper.dart';
import '../helpers/favorites_storage_helper.dart';
import 'template_detail_screen.dart';
import '../data/template_data.dart';

class TemplateListScreen extends StatefulWidget {
  final String categoryTitle;
  final Color categoryColor;
  final List<TemplateItem> templates;

  const TemplateListScreen({
    Key? key,
    required this.categoryTitle,
    required this.categoryColor,
    required this.templates,
  }) : super(key: key);

  @override
  State<TemplateListScreen> createState() => _TemplateListScreenState();
}

class _TemplateListScreenState extends State<TemplateListScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<TemplateItem> _filteredTemplates = [];
  Set<String> _favoriteIds = {};
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _filteredTemplates = widget.templates;
    _loadFavoritesAndInit();
  }

  Future<void> _loadFavoritesAndInit() async {
    final favorites = await FavoritesStorageHelper.loadFavorites();
    setState(() {
      _favoriteIds = favorites.toSet();
      _isLoading = false;
    });
  }

  Future<void> _toggleFavorite(String templateId) async {
    if (_favoriteIds.contains(templateId)) {
      await FavoritesStorageHelper.removeFavorite(templateId);
      setState(() {
        _favoriteIds.remove(templateId);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Removed from favorites'),
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 1),
        ),
      );
    } else {
      await FavoritesStorageHelper.addFavorite(templateId);
      setState(() {
        _favoriteIds.add(templateId);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Added to favorites'),
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 1),
        ),
      );
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterTemplates(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredTemplates = widget.templates;
      } else {
        _filteredTemplates = widget.templates
            .where((template) =>
                template.title.toLowerCase().contains(query.toLowerCase()) ||
                template.description.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = ThemeColors.getBackground(context);
    final cardColor = ThemeColors.getCardBackground(context);
    final textPrimary = ThemeColors.getTextPrimary(context);
    final textSecondary = ThemeColors.getTextSecondary(context);
    final borderColor = ThemeColors.getBorder(context);

    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        children: [
          // Blue Header with Back Button
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: widget.categoryColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            padding: const EdgeInsets.fromLTRB(16, 50, 16, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back Button + Title
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: AppColors.white,
                        size: 24,
                      ),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        widget.categoryTitle,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Search Bar
                TextField(
                  controller: _searchController,
                  onChanged: _filterTemplates,
                  style: const TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                    hintText: 'Search templates...',
                    hintStyle: TextStyle(
                      color: textSecondary.withOpacity(0.7),
                      fontSize: 15,
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: AppColors.textSecondary,
                      size: 22,
                    ),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(
                              Icons.clear,
                              color: AppColors.textSecondary,
                              size: 20,
                            ),
                            onPressed: () {
                              _searchController.clear();
                              _filterTemplates('');
                            },
                          )
                        : null,
                    filled: true,
                    fillColor: AppColors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Templates List
          Expanded(
            child: _filteredTemplates.isEmpty
                ? _buildEmptyState(textSecondary)
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: _filteredTemplates.length,
                    itemBuilder: (context, index) {
                      final template = _filteredTemplates[index];
                      return _buildTemplateCard(
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

  Widget _buildTemplateCard(
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
                categoryColor: widget.categoryColor,
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
                  // Favorite Icon
                  IconButton(
                    onPressed: () {
                      _toggleFavorite(template.id);
                    },
                    icon: Icon(
                      _favoriteIds.contains(template.id)
                          ? Icons.favorite
                          : Icons.favorite_outline,
                      color: _favoriteIds.contains(template.id)
                          ? Colors.red
                          : textSecondary,
                      size: 22,
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

  Widget _buildEmptyState(Color textSecondary) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off,
            size: 64,
            color: textSecondary.withOpacity(0.5),
          ),
          const SizedBox(height: 16),
          Text(
            'No templates found',
            style: AppTextStyles.h3.copyWith(fontSize: 18),
          ),
          const SizedBox(height: 8),
          Text(
            'Try a different search term',
            style: AppTextStyles.bodyMedium.copyWith(
              color: textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}