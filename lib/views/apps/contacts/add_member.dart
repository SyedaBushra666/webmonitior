import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/src/extensions/string_extensions.dart';
import 'package:get/instance_manager.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:webkit/controller/forms/basic_controller.dart';
import 'package:webkit/helpers/extensions/string.dart';
import 'package:webkit/helpers/theme/app_style.dart';
import 'package:webkit/helpers/theme/app_theme.dart';
import 'package:webkit/helpers/utils/ui_mixins.dart';
import 'package:webkit/helpers/widgets/my_breadcrumb.dart';
import 'package:webkit/helpers/widgets/my_breadcrumb_item.dart';
import 'package:webkit/helpers/widgets/my_button.dart';
import 'package:webkit/helpers/widgets/my_container.dart';
import 'package:webkit/helpers/widgets/my_flex.dart';
import 'package:webkit/helpers/widgets/my_flex_item.dart';
import 'package:webkit/helpers/widgets/my_spacing.dart';
import 'package:webkit/helpers/widgets/my_text.dart';
import 'package:webkit/helpers/widgets/my_text_style.dart';
import 'package:webkit/helpers/widgets/responsive.dart';
import 'package:webkit/views/layouts/layout.dart';

class AddMember extends StatefulWidget {
  const AddMember({super.key});

  @override
  State<AddMember> createState() => _AddMemberState();
}

class _AddMemberState extends State<AddMember>
    with SingleTickerProviderStateMixin, UIMixin {
  late BasicController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(BasicController());
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder(
        init: controller,
        builder: (controller) {
          return Column(
            children: [
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText.titleMedium(
                      "Add Member".tr().capitalizeWords,
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'employees'.tr()),
                        MyBreadcrumbItem(name: 'add member'.tr(), active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing / 2),
                child: MyFlex(
                  children: [
                    MyFlexItem(
                      sizes: "lg-7",
                      child: MyContainer.bordered(
                        paddingAll: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: MySpacing.x(8),
                              child: MyContainer(
                                child: MyText.titleMedium(
                                  "Add New Member",
                                  fontWeight: 600,
                                ),
                              ),
                            ),
                            Padding(
                              padding: MySpacing.nTop(flexSpacing),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            MyText.labelMedium(
                                              "first_name".tr().capitalizeWords,
                                            ),
                                            MySpacing.height(8),
                                            TextFormField(
                                              decoration: InputDecoration(
                                                  hintText: "First Name",
                                                  hintStyle:
                                                      MyTextStyle.bodySmall(
                                                          xMuted: true),
                                                  border: outlineInputBorder,
                                                  enabledBorder:
                                                      outlineInputBorder,
                                                  focusedBorder:
                                                      focusedInputBorder,
                                                  contentPadding:
                                                      MySpacing.all(16),
                                                  isCollapsed: true,
                                                  floatingLabelBehavior:
                                                      FloatingLabelBehavior
                                                          .never),
                                            ),
                                          ],
                                        ),
                                      ),
                                      MySpacing.width(16),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            MyText.labelMedium(
                                              "last_name".tr().capitalizeWords,
                                            ),
                                            MySpacing.height(8),
                                            TextFormField(
                                              decoration: InputDecoration(
                                                  hintText: "Last Name",
                                                  hintStyle:
                                                      MyTextStyle.bodySmall(
                                                          xMuted: true),
                                                  border: outlineInputBorder,
                                                  enabledBorder:
                                                      outlineInputBorder,
                                                  focusedBorder:
                                                      focusedInputBorder,
                                                  contentPadding:
                                                      MySpacing.all(16),
                                                  isCollapsed: true,
                                                  floatingLabelBehavior:
                                                      FloatingLabelBehavior
                                                          .never),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  MySpacing.height(20),
                                  MyText.labelMedium(
                                    "email_address".tr().capitalizeWords,
                                  ),
                                  MySpacing.height(8),
                                  TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                        hintText: "demo@getappui.com",
                                        hintStyle:
                                            MyTextStyle.bodySmall(xMuted: true),
                                        border: outlineInputBorder,
                                        enabledBorder: outlineInputBorder,
                                        focusedBorder: focusedInputBorder,
                                        prefixIcon: const Icon(
                                          LucideIcons.mail,
                                          size: 20,
                                        ),
                                        contentPadding: MySpacing.all(16),
                                        isCollapsed: true,
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never),
                                  ),
                                  MySpacing.height(20),
                                  IntrinsicHeight(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        // Role Dropdown
                                        Expanded(
                                          child: PopupMenuButton<UserRole>(
                                            onSelected: controller.onSelectRole,
                                            itemBuilder:
                                                (BuildContext context) {
                                              return UserRole.values
                                                  .map((role) {
                                                return PopupMenuItem(
                                                  value: role,
                                                  height: 32,
                                                  child: MyText.bodySmall(
                                                    role.name.capitalize!,
                                                    color: theme
                                                        .colorScheme.onSurface,
                                                    fontWeight: 600,
                                                  ),
                                                );
                                              }).toList();
                                            },
                                            color: theme.cardTheme.color,
                                            child: MyContainer.bordered(
                                              padding: MySpacing.xy(12, 8),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: MyText.labelMedium(
                                                        controller
                                                                .selectedRole
                                                                ?.name
                                                                .capitalize! ??
                                                            "Select Role",
                                                        color: theme.colorScheme
                                                            .onSurface,
                                                      ),
                                                    ),
                                                  ),
                                                  Icon(
                                                    LucideIcons.chevron_down,
                                                    size: 22,
                                                    color: theme
                                                        .colorScheme.onSurface,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        MySpacing.width(
                                            12), // space between the two dropdowns

                                        // Project Dropdown
                                        Expanded(
                                          child: PopupMenuButton<Project>(
                                            onSelected:
                                                controller.onSelectProject,
                                            itemBuilder:
                                                (BuildContext context) {
                                              return controller.projectList
                                                  .map((project) {
                                                return PopupMenuItem(
                                                  value: project,
                                                  height: 32,
                                                  child: MyText.bodySmall(
                                                    project.name,
                                                    color: theme
                                                        .colorScheme.onSurface,
                                                    fontWeight: 600,
                                                  ),
                                                );
                                              }).toList();
                                            },
                                            color: theme.cardTheme.color,
                                            child: MyContainer.bordered(
                                              padding: MySpacing.xy(12, 8),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: MyText.labelMedium(
                                                        controller
                                                                .selectedProject
                                                                ?.name ??
                                                            "Select Project",
                                                        color: theme.colorScheme
                                                            .onSurface,
                                                      ),
                                                    ),
                                                  ),
                                                  Icon(
                                                    LucideIcons.chevron_down,
                                                    size: 22,
                                                    color: theme
                                                        .colorScheme.onSurface,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                   MySpacing.height(20),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: MyButton(
                                      onPressed: () {},
                                      elevation: 0,
                                      padding: MySpacing.xy(20, 16),
                                      backgroundColor: contentTheme.primary,
                                      borderRadiusAll:
                                          AppStyle.buttonRadius.medium,
                                      child: MyText.bodySmall(
                                        'Add Member'.tr(),
                                        color: contentTheme.onPrimary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                    //stop
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
