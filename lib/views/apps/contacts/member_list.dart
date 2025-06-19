import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:webkit/controller/apps/contact/member_list_controller.dart';
import 'package:webkit/helpers/theme/app_style.dart';
import 'package:webkit/helpers/utils/ui_mixins.dart';
import 'package:webkit/helpers/widgets/my_breadcrumb.dart';
import 'package:webkit/helpers/widgets/my_breadcrumb_item.dart';
import 'package:webkit/helpers/widgets/my_button.dart';
import 'package:webkit/helpers/widgets/my_spacing.dart';
import 'package:webkit/helpers/widgets/my_text.dart';
import 'package:webkit/helpers/widgets/my_text_style.dart';
import 'package:webkit/helpers/widgets/responsive.dart';
import 'package:webkit/views/apps/contacts/components/employee_table.dart';
import 'package:webkit/views/layouts/layout.dart';


class MemberList extends StatefulWidget {
  const MemberList({super.key});

  @override
  State<MemberList> createState() => _MemberListState();
}

class _MemberListState extends State<MemberList>
    with SingleTickerProviderStateMixin, UIMixin {
  late MemberListController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(MemberListController());
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
                    Row(
                      children: [
                        MyText.titleMedium(
                          "Members(10)",
                          fontWeight: 600,
                        ),
                        MySpacing.width(16),
                        MyText.titleMedium(
                          "Invites(2)",
                          fontWeight: 600,
                          color: contentTheme.primary,
                        ),
                      ],
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: "Employees"),
                        MyBreadcrumbItem(name: "Members List", active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 250,
                          child: TextFormField(
                            maxLines: 1,
                            style: MyTextStyle.bodyMedium(),
                            decoration: InputDecoration(
                              hintText: "Search here",
                              hintStyle: MyTextStyle.bodySmall(xMuted: true),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 10),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: BorderSide(
                                    color: contentTheme.primary, width: 0.5),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: BorderSide(
                                    color: contentTheme.primary, width: 1.5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: BorderSide(
                                    color: contentTheme.primary, width: 0.5),
                              ),
                              suffixIcon: Container(
                                decoration: BoxDecoration(
                                  color: contentTheme.primary,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Icon(
                                  LucideIcons.search,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                              suffixIconConstraints: const BoxConstraints(
                                minWidth: 44,
                                minHeight: 35,
                              ),
                              isDense: true,
                            ),
                          ),
                        ),

                        // SizedBox(
                        //   width: 200,
                        //   child: TextFormField(
                        //     maxLines: 1,
                        //     style: MyTextStyle.bodyMedium(),
                        //     decoration: InputDecoration(
                        //         hintText: "search",
                        //         hintStyle: MyTextStyle.bodySmall(xMuted: true),
                        //         border: outlineInputBorder,
                        //         enabledBorder: outlineInputBorder,
                        //         focusedBorder: focusedInputBorder,
                        //         prefixIcon: const Align(
                        //             alignment: Alignment.center,
                        //             child: Icon(
                        //               LucideIcons.search,
                        //               size: 14,
                        //             )),
                        //         prefixIconConstraints: const BoxConstraints(
                        //             minWidth: 36,
                        //             maxWidth: 36,
                        //             minHeight: 32,
                        //             maxHeight: 32),
                        //         contentPadding: MySpacing.xy(16, 12),
                        //         isCollapsed: true,
                        //         floatingLabelBehavior:
                        //             FloatingLabelBehavior.never),
                        //   ),
                        // ),
                        Row(
                          children: [
                            MyButton.outlined(
                              onPressed: () {},
                              elevation: 0,
                              padding: MySpacing.xy(20, 16),
                              borderColor: contentTheme.primary,
                              splashColor:
                                  contentTheme.primary.withOpacity(0.1),
                              borderRadiusAll: AppStyle.buttonRadius.medium,
                              child: Row(
                                children: [
                                  Icon(
                                    LucideIcons.list_filter,
                                    color: contentTheme.primary,
                                    size: 16,
                                  ),
                                  MySpacing.width(16),
                                  MyText.bodySmall(
                                    'Apply Filters',
                                    color: contentTheme.primary,
                                  ),
                                ],
                              ),
                            ),
                            MySpacing.width(16),
                            MyButton(
                              onPressed: () {
                                //Get.toNamed(widget.route!);
                              },
                              elevation: 0,
                              padding: MySpacing.xy(12, 16),
                              backgroundColor: contentTheme.primary,
                              borderRadiusAll: AppStyle.buttonRadius.medium,
                              child: Row(
                                children: [
                                  Icon(
                                    LucideIcons.circle_plus,
                                    color: contentTheme.light,
                                    size: 16,
                                  ),
                                  MySpacing.width(16),
                                  MyText.bodySmall(
                                    "Add New Member",
                                    color: contentTheme.onPrimary,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    MySpacing.height(flexSpacing),
                    EmployeeTable(),
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
