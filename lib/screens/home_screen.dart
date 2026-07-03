import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';
import '../core/theme/theme_colors_helper.dart';
import '../data/template_data.dart';
import 'template_list_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_icons/simple_icons.dart';
import 'my_templates_screen.dart';
import 'favorites_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final bgColor = ThemeColors.getBackground(context);

    return Scaffold(
      backgroundColor: bgColor,
      body: IndexedStack(
        index: _currentIndex,
        children: [
          _buildHomeTab(),
          _buildFavoritesTab(),
          _buildMyTemplatesTab(),
          _buildSettingsTab(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textSecondary,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            activeIcon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder_outlined),
            activeIcon: Icon(Icons.folder),
            label: 'My Templates',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            activeIcon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  // HOME TAB
  Widget _buildHomeTab() {
    return Builder(
      builder: (context) {
        final cardColor = ThemeColors.getCardBackground(context);
        final textPrimary = ThemeColors.getTextPrimary(context);
        final textSecondary = ThemeColors.getTextSecondary(context);
        final borderColor = ThemeColors.getBorder(context);

        return Column(
          children: [
            // Blue Header with Branding
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
                  Row(
                    children: [
                      // ✅ UPDATED: App Icon Image instead of mail icon
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Image.asset(
                          'assets/icon/app_icon.png',
                          height: 32,
                          width: 32,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'MailCraft',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Craft professional messages with confidence',
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),

            // Main Content - Template Categories
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  // Section Header
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16, top: 8),
                    child: Row(
                      children: [
                        Text(
                          'Template Categories',
                          style: AppTextStyles.h3.copyWith(
                            fontSize: 20,
                            color: textPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Main Categories
                  _buildMainCategory(
                    icon: Icons.email_outlined,
                    iconColor: AppColors.primary,
                    title: 'Email Templates',
                    description: 'Professional emails for all occasions',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TemplateListScreen(
                            categoryTitle: 'Email Templates',
                            categoryColor: AppColors.primary,
                            templates: EmailTemplatesData.getTemplates(),
                          ),
                        ),
                      );
                    },
                    cardColor: cardColor,
                    textPrimary: textPrimary,
                    textSecondary: textSecondary,
                    borderColor: borderColor,
                  ),
                  _buildMainCategory(
                    icon: FontAwesomeIcons.linkedin,
                    iconColor: AppColors.primary,
                    title: 'LinkedIn Messages',
                    description: 'Network and connect professionally',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TemplateListScreen(
                            categoryTitle: 'LinkedIn Messages',
                            categoryColor: AppColors.primary,
                            templates: LinkedInMessagesData.getTemplates(),
                          ),
                        ),
                      );
                    },
                    cardColor: cardColor,
                    textPrimary: textPrimary,
                    textSecondary: textSecondary,
                    borderColor: borderColor,
                  ),
                  _buildMainCategory(
                    icon: Icons.work_outline,
                    iconColor: AppColors.primary,
                    title: 'Workplace Messages',
                    description: 'Internal team communication',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TemplateListScreen(
                            categoryTitle: 'Workplace Messages',
                            categoryColor: AppColors.primary,
                            templates: WorkplaceMessagesData.getTemplates(),
                          ),
                        ),
                      );
                    },
                    cardColor: cardColor,
                    textPrimary: textPrimary,
                    textSecondary: textSecondary,
                    borderColor: borderColor,
                  ),
                  _buildMainCategory(
                    icon: Icons.school_outlined,
                    iconColor: AppColors.primary,
                    title: 'Student Emails & Requests',
                    description: 'Academic communication and requests',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TemplateListScreen(
                            categoryTitle: 'Student Emails & Requests',
                            categoryColor: AppColors.primary,
                            templates: StudentEmailsData.getTemplates(),
                          ),
                        ),
                      );
                    },
                    cardColor: cardColor,
                    textPrimary: textPrimary,
                    textSecondary: textSecondary,
                    borderColor: borderColor,
                  ),

                  const SizedBox(height: 8),

                  // Browse All Categories Card
                  _buildBrowseAllCard(
                    cardColor,
                    textPrimary,
                    textSecondary,
                    borderColor,
                  ),

                  const SizedBox(height: 20),

                  // Pro Tip
                  _buildProTip(textPrimary, textSecondary),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildMainCategory({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String description,
    required VoidCallback onTap,
    required Color cardColor,
    required Color textPrimary,
    required Color textSecondary,
    required Color borderColor,
  }) {
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
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Icon with colored background
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: iconColor, size: 28),
              ),
              const SizedBox(width: 16),
              // Title and Description
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.h4.copyWith(
                        fontSize: 17,
                        color: textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: AppTextStyles.bodySmall.copyWith(
                        fontSize: 13,
                        color: textSecondary,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              // Arrow
              Icon(Icons.arrow_forward_ios, color: textSecondary, size: 18),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBrowseAllCard(
    Color cardColor,
    Color textPrimary,
    Color textSecondary,
    Color borderColor,
  ) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary.withOpacity(0.1), AppColors.lightBlue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.primary.withOpacity(0.3),
          width: 1.5,
        ),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TemplateListScreen(
                categoryTitle: 'All Categories',
                categoryColor: AppColors.primary,
                templates: [
                  ...EmailTemplatesData.getTemplates(),
                  ...LinkedInMessagesData.getTemplates(),
                  ...WorkplaceMessagesData.getTemplates(),
                  ...StudentEmailsData.getTemplates(),
                ],
              ),
            ),
          );
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.apps,
                  color: AppColors.primary,
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Browse All Categories',
                      style: AppTextStyles.h4.copyWith(
                        color: AppColors.primary,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Explore 20+ template categories',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward,
                color: AppColors.primary,
                size: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProTip(Color textPrimary, Color textSecondary) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFEF3C7), // Light yellow - keep consistent
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFFBBF24), width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.lightbulb_outline,
            color: Color(0xFFD97706),
            size: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pro Tip',
                  style: AppTextStyles.h4.copyWith(
                    fontSize: 15,
                    color: const Color(0xFFD97706),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Save your favorite templates for quick access anytime!',
                  style: AppTextStyles.bodySmall.copyWith(
                    fontSize: 13,
                    color: const Color(0xFF92400E),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // FAVORITES TAB
  Widget _buildFavoritesTab() {
    return const FavoritesScreen();
  }

  // MY TEMPLATES TAB
  Widget _buildMyTemplatesTab() {
    return const MyTemplatesScreen();
  }

  // SETTINGS TAB
  Widget _buildSettingsTab() {
    return const SettingsScreen();
  }
}