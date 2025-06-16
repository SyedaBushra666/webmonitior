import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:webkit/helpers/theme/app_style.dart';
import 'package:webkit/helpers/utils/ui_mixins.dart';
import 'package:webkit/helpers/widgets/my_spacing.dart';
import 'package:webkit/helpers/widgets/my_text.dart';
import 'package:webkit/helpers/widgets/my_text_style.dart';
import 'package:webkit/helpers/widgets/my_button.dart';
import 'package:webkit/helpers/widgets/my_container.dart';

class AddMemberDialog extends StatefulWidget {
  const AddMemberDialog({super.key});

  @override
  State<AddMemberDialog> createState() => _AddMemberDialogState();
}

class _AddMemberDialogState extends State<AddMemberDialog> with UIMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final ImagePicker picker = ImagePicker();
  XFile? imageFile;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Padding(
            padding: MySpacing.xy(24, 16),
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          InkWell(
                            onTap: () async {
                              imageFile = await picker.pickImage(source: ImageSource.gallery);
                              setState(() {});
                            },
                            child: MyContainer.rounded(
                              height: 100,
                              width: 100,
                              paddingAll: 0,
                              border: Border.all(color:contentTheme.primary ),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: imageFile != null
                                  ? Image.file(File(imageFile!.path), fit: BoxFit.cover)
                                  : const Icon(Icons.person, size: 60),
                            ),
                          ),
                          MyContainer.rounded(
                            height: 28,
                            width: 28,
                            paddingAll: 0,
                            color: contentTheme.primary,
                            child: const Icon(
                              LucideIcons.camera,
                              size: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    MySpacing.height(20),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: nameController,
                            decoration: InputDecoration(
                              hintText: 'Full Name',
                              hintStyle: MyTextStyle.bodySmall(xMuted: true),
                              border: outlineInputBorder,
                              enabledBorder: outlineInputBorder,
                              focusedBorder: focusedInputBorder,
                            ),
                            validator: (val) => val != null && val.isEmpty ? 'Required' : null,
                          ),
                          MySpacing.height(16),
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              hintText: 'Email Address',
                              hintStyle: MyTextStyle.bodySmall(xMuted: true),
                              border: outlineInputBorder,
                              enabledBorder: outlineInputBorder,
                              focusedBorder: focusedInputBorder,
                            ),
                            validator: (val) => val != null && val.isEmpty ? 'Required' : null,
                          ),
                          MySpacing.height(24),
                          MyButton.block(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // Save logic
                                Get.back();
                              }
                            },
                            backgroundColor: contentTheme.primary,
                            padding: MySpacing.xy(20, 16),
                            borderRadiusAll: AppStyle.buttonRadius.medium,
                            child: MyText.bodySmall(
                              'Add Member',
                              color: contentTheme.onPrimary,
                              fontWeight: 600,
                            ),
                          ),
                          MySpacing.height(12),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                    icon: const Icon(Icons.close, size: 20),
                    onPressed: () => Get.back(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String fieldTitle, String hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText.labelMedium(
          fieldTitle,
        ),
        MySpacing.height(8),
        TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: MyTextStyle.bodySmall(xMuted: true),
            border: outlineInputBorder,
            contentPadding: MySpacing.all(16),
            isCollapsed: true,
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
        ),
      ],
    );
  }
}

class PhoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text.replaceAll(RegExp(r'\D'), '');

    return newValue.copyWith(
      text: text.isNotEmpty ? text : '',
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}


