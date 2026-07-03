import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';
import '../core/theme/theme_colors_helper.dart';
import 'my_templates_screen.dart';

class CustomTemplateDetailScreen extends StatefulWidget {
  final CustomTemplate template;

  const CustomTemplateDetailScreen({
    Key? key,
    required this.template,
  }) : super(key: key);

  @override
  State<CustomTemplateDetailScreen> createState() => _CustomTemplateDetailScreenState();
}

class _CustomTemplateDetailScreenState extends State<CustomTemplateDetailScreen> {
  late TextEditingController _subjectController;
  late TextEditingController _messageController;

  @override
  void initState() {
    super.initState();
    _subjectController = TextEditingController(text: widget.template.subject);
    _messageController = TextEditingController(text: widget.template.message);
  }

  @override
  void dispose() {
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _copyToClipboard() {
    final fullText = 'Subject: ${_subjectController.text}\n\n${_messageController.text}';
    Clipboard.setData(ClipboardData(text: fullText));
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Template copied to clipboard!'),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _shareTemplate() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Share functionality coming soon!'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = ThemeColors.getBackground(context);
    final inputFill = ThemeColors.getInputFill(context);
    final textPrimary = ThemeColors.getTextPrimary(context);
    final textSecondary = ThemeColors.getTextSecondary(context);
    final borderColor = ThemeColors.getBorder(context);

    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        children: [
          // Blue Header with Title
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            padding: const EdgeInsets.fromLTRB(16, 50, 16, 24),
            child: Row(
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
                    widget.template.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Main Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Description (if exists)
                  if (widget.template.description.isNotEmpty) ...[
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.info_outline,
                            color: AppColors.primary,
                            size: 20,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              widget.template.description,
                              style: AppTextStyles.bodySmall.copyWith(
                                fontSize: 13,
                                color: textPrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],

                  // Subject Line
                  Text(
                    'Subject Line',
                    style: AppTextStyles.label.copyWith(fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _subjectController,
                    style: AppTextStyles.bodyMedium.copyWith(color: textPrimary),
                    maxLines: 2,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: inputFill,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: borderColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: borderColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: AppColors.primary, width: 2),
                      ),
                      contentPadding: const EdgeInsets.all(16),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Message
                  Text(
                    'Message',
                    style: AppTextStyles.label.copyWith(fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _messageController,
                    style: AppTextStyles.bodyMedium.copyWith(color: textPrimary),
                    maxLines: 15,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: inputFill,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: borderColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: borderColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: AppColors.primary, width: 2),
                      ),
                      contentPadding: const EdgeInsets.all(16),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Pro Tip
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: ThemeColors.isDarkMode(context)
                          ? AppColors.darkSurfaceLight.withOpacity(0.5)
                          : AppColors.lightGray.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: borderColor, width: 1),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: AppColors.primary,
                          size: 20,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Tip: Edit the text above as needed, then tap Copy to use this template.',
                            style: AppTextStyles.bodySmall.copyWith(
                              fontSize: 13,
                              color: textSecondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Action Buttons
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: _copyToClipboard,
                          icon: const Icon(Icons.copy, size: 20),
                          label: const Text('Copy'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: _shareTemplate,
                          icon: const Icon(Icons.share, size: 20),
                          label: const Text('Share'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.primary,
                            side: const BorderSide(color: AppColors.primary, width: 2),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}