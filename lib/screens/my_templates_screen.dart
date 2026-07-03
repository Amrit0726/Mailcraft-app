import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';
import '../core/theme/theme_colors_helper.dart';
import '../helpers/template_storage_helper.dart';
import 'create_template_screen.dart';
import 'edit_template_screen.dart';
import 'custom_template_detail_screen.dart';

class MyTemplatesScreen extends StatefulWidget {
  const MyTemplatesScreen({Key? key}) : super(key: key);

  @override
  State<MyTemplatesScreen> createState() => _MyTemplatesScreenState();
}

class _MyTemplatesScreenState extends State<MyTemplatesScreen> {
  List<CustomTemplate> _customTemplates = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadTemplates();
  }

  Future<void> _loadTemplates() async {
    setState(() {
      _isLoading = true;
    });

    final List<Map<String, dynamic>> savedData = 
        await TemplateStorageHelper.loadTemplates();
    
    final List<CustomTemplate> loadedTemplates = 
        savedData.map((json) => CustomTemplate.fromJson(json)).toList();

    setState(() {
      _customTemplates = loadedTemplates;
      _isLoading = false;
    });
  }

  Future<void> _saveTemplates() async {
    final List<Map<String, dynamic>> jsonList = 
        _customTemplates.map((template) => template.toJson()).toList();
    
    await TemplateStorageHelper.saveTemplates(jsonList);
  }

  void _navigateToCreateTemplate() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CreateTemplateScreen(),
      ),
    );

    if (result != null && result is CustomTemplate) {
      setState(() {
        _customTemplates.add(result);
      });
      _saveTemplates();
    }
  }

  void _deleteTemplate(int index) {
    setState(() {
      _customTemplates.removeAt(index);
    });
    _saveTemplates();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Template deleted'),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _editTemplate(int index) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditTemplateScreen(
          template: _customTemplates[index],
          templateIndex: index,
        ),
      ),
    );

    if (result != null && result is Map<String, dynamic>) {
      final updatedTemplate = result['template'] as CustomTemplate;
      final templateIndex = result['index'] as int;

      setState(() {
        _customTemplates[templateIndex] = updatedTemplate;
      });
      _saveTemplates();
    }
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = ThemeColors.getBackground(context);
    
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
                const Text(
                  'My Templates',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  _customTemplates.isEmpty
                      ? 'Your personal saved templates'
                      : '${_customTemplates.length} custom template${_customTemplates.length == 1 ? '' : 's'}',
                  style: const TextStyle(
                    fontSize: 15,
                    color: AppColors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),

          // Main Content
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _customTemplates.isEmpty
                    ? _buildEmptyState()
                    : _buildTemplatesList(),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    final textPrimary = ThemeColors.getTextPrimary(context);
    final textSecondary = ThemeColors.getTextSecondary(context);
    
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.description_outlined,
                size: 80,
                color: AppColors.primary.withOpacity(0.7),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'No Templates Yet',
              style: AppTextStyles.h3.copyWith(
                fontSize: 22,
                color: textPrimary,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Create your first custom template to get started',
              style: AppTextStyles.bodyMedium.copyWith(
                color: textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: _navigateToCreateTemplate,
              icon: const Icon(Icons.add, size: 22),
              label: const Text('Create Template'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildTemplatesList() {
    final cardColor = ThemeColors.getCardBackground(context);
    final textPrimary = ThemeColors.getTextPrimary(context);
    final textSecondary = ThemeColors.getTextSecondary(context);
    final borderColor = ThemeColors.getBorder(context);
    
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _navigateToCreateTemplate,
              icon: const Icon(Icons.add, size: 20),
              label: const Text('Create New Template'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ),

        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: _customTemplates.length,
            itemBuilder: (context, index) {
              final template = _customTemplates[index];
              return _buildTemplateCard(
                template,
                index,
                cardColor,
                textPrimary,
                textSecondary,
                borderColor,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTemplateCard(
    CustomTemplate template,
    int index,
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
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (context) => Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: textSecondary.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    template.title,
                    style: AppTextStyles.h4.copyWith(
                      fontSize: 18,
                      color: textPrimary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),

                  ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.visibility_outlined,
                        color: AppColors.primary,
                        size: 24,
                      ),
                    ),
                    title: Text(
                      'View & Use Template',
                      style: TextStyle(color: textPrimary),
                    ),
                    subtitle: Text(
                      'Copy and use this template',
                      style: TextStyle(color: textSecondary),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CustomTemplateDetailScreen(
                            template: template,
                          ),
                        ),
                      );
                    },
                  ),

                  ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF059669).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.edit_outlined,
                        color: Color(0xFF059669),
                        size: 24,
                      ),
                    ),
                    title: Text(
                      'Edit Template',
                      style: TextStyle(color: textPrimary),
                    ),
                    subtitle: Text(
                      'Modify this template',
                      style: TextStyle(color: textSecondary),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      _editTemplate(index);
                    },
                  ),

                  ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.delete_outline,
                        color: Colors.red,
                        size: 24,
                      ),
                    ),
                    title: const Text(
                      'Delete Template',
                      style: TextStyle(color: Colors.red),
                    ),
                    subtitle: Text(
                      'Remove this template',
                      style: TextStyle(color: textSecondary),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Delete Template'),
                          content: Text(
                            'Are you sure you want to delete "${template.title}"?',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                _deleteTemplate(index);
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.red,
                              ),
                              child: const Text('Delete'),
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 10),
                ],
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
              Text(
                template.title,
                style: AppTextStyles.h4.copyWith(
                  fontSize: 17,
                  color: textPrimary,
                ),
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
}

class CustomTemplate {
  final String id;
  final String title;
  final String description;
  final String subject;
  final String message;
  final DateTime createdAt;

  CustomTemplate({
    required this.id,
    required this.title,
    required this.description,
    required this.subject,
    required this.message,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'subject': subject,
      'message': message,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory CustomTemplate.fromJson(Map<String, dynamic> json) {
    return CustomTemplate(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      subject: json['subject'] as String,
      message: json['message'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }
}