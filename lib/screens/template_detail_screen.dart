import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';
import '../core/theme/theme_colors_helper.dart';
import '../data/template_data.dart';
import 'package:share_plus/share_plus.dart';

class TemplateDetailScreen extends StatefulWidget {
  final String templateTitle;
  final Color categoryColor;
  final String templateId;
  final TemplateVersions versions;

  const TemplateDetailScreen({
    Key? key,
    required this.templateTitle,
    required this.categoryColor,
    required this.templateId,
    required this.versions,
  }) : super(key: key);

  @override
  State<TemplateDetailScreen> createState() => _TemplateDetailScreenState();
}

class _TemplateDetailScreenState extends State<TemplateDetailScreen> {
  String _selectedVersion = 'Formal';
  bool _isFavorite = false;
  late TextEditingController _subjectController;
  late TextEditingController _messageController;

  @override
  void initState() {
    super.initState();
    _loadVersion('Formal');
  }

  void _loadVersion(String version) {
    String subject = '';
    String message = '';

    switch (version) {
      case 'Formal':
        subject = widget.versions.formal.subject;
        message = widget.versions.formal.message;
        break;
      case 'Polite':
        subject = widget.versions.polite.subject;
        message = widget.versions.polite.message;
        break;
      case 'Short':
        subject = widget.versions.short.subject;
        message = widget.versions.short.message;
        break;
    }

    _subjectController = TextEditingController(text: subject);
    _messageController = TextEditingController(text: message);
  }

  @override
  void dispose() {
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _changeVersion(String version) {
    setState(() {
      _selectedVersion = version;
      _loadVersion(version);
    });
  }

  void _copyToClipboard() {
    final fullText = 'Subject: ${_subjectController.text}\n\n${_messageController.text}';
    Clipboard.setData(ClipboardData(text: fullText));

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Template copied to clipboard!'),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _shareTemplate() async {
    final subject = _subjectController.text.trim();
    final message = _messageController.text.trim();

    if (subject.isEmpty && message.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Template is empty!'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    await Share.share(
      message,
      subject: subject,
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
          // Blue Header with Title and Favorite
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
                    widget.templateTitle,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _isFavorite = !_isFavorite;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          _isFavorite ? 'Added to favorites!' : 'Removed from favorites',
                        ),
                        behavior: SnackBarBehavior.floating,
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                  icon: Icon(
                    _isFavorite ? Icons.star : Icons.star_outline,
                    color: AppColors.white,
                    size: 28,
                  ),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
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
                  // Version Selector
                  Text(
                    'Choose Version',
                    style: AppTextStyles.label.copyWith(
                      fontSize: 14,
                      color: textSecondary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      _buildVersionButton('Formal', inputFill, textPrimary),
                      const SizedBox(width: 12),
                      _buildVersionButton('Polite', inputFill, textPrimary),
                      const SizedBox(width: 12),
                      _buildVersionButton('Short', inputFill, textPrimary),
                    ],
                  ),

                  const SizedBox(height: 24),

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
                            'Tip: Replace placeholders like [Name], [Company], [Date] with actual information.',
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

  Widget _buildVersionButton(String version, Color inputFill, Color textPrimary) {
    final isSelected = _selectedVersion == version;
    return Expanded(
      child: InkWell(
        onTap: () => _changeVersion(version),
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : inputFill,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected ? AppColors.primary : ThemeColors.getBorder(context),
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Center(
            child: Text(
              version,
              style: AppTextStyles.button.copyWith(
                fontSize: 14,
                color: isSelected ? AppColors.white : textPrimary,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}