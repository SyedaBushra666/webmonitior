import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:webkit/controller/apps/contact/member_list_controller.dart';
import 'package:webkit/helpers/theme/app_style.dart';
import 'package:webkit/helpers/utils/my_shadow.dart';
import 'package:webkit/helpers/utils/ui_mixins.dart';
import 'package:webkit/helpers/widgets/my_breadcrumb.dart';
import 'package:webkit/helpers/widgets/my_breadcrumb_item.dart';
import 'package:webkit/helpers/widgets/my_button.dart';
import 'package:webkit/helpers/widgets/my_card.dart';
import 'package:webkit/helpers/widgets/my_container.dart';
import 'package:webkit/helpers/widgets/my_spacing.dart';
import 'package:webkit/helpers/widgets/my_text.dart';
import 'package:webkit/helpers/widgets/my_text_style.dart';
import 'package:webkit/helpers/widgets/responsive.dart';
import 'package:webkit/views/apps/contacts/components/add_member_dialog.dart';

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
                    MyText.titleMedium(
                      "Member List",
                      fontWeight: 600,
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
                        MyButton(
                          onPressed: () {
                             //Get.toNamed(widget.route!);
                               Get.dialog(const AddMemberDialog());
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
                        SizedBox(
                          width: 200,
                          child: TextFormField(
                            maxLines: 1,
                            style: MyTextStyle.bodyMedium(),
                            decoration: InputDecoration(
                                hintText: "search",
                                hintStyle: MyTextStyle.bodySmall(xMuted: true),
                                border: outlineInputBorder,
                                enabledBorder: outlineInputBorder,
                                focusedBorder: focusedInputBorder,
                                prefixIcon: const Align(
                                    alignment: Alignment.center,
                                    child: Icon(
                                      LucideIcons.search,
                                      size: 14,
                                    )),
                                prefixIconConstraints: const BoxConstraints(
                                    minWidth: 36,
                                    maxWidth: 36,
                                    minHeight: 32,
                                    maxHeight: 32),
                                contentPadding: MySpacing.xy(16, 12),
                                isCollapsed: true,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never),
                          ),
                        ),
                      ],
                    ),
                    MySpacing.height(flexSpacing),
          
                    Padding(
                      padding: MySpacing.x(flexSpacing),
                      child: Column(
                        children: [
                          // Header Row (matches the ListView.builder items)
                          MyCard(
                            borderRadius:BorderRadius.circular(0),
                            shadow: MyShadow(elevation: 1),
                            paddingAll: 16,
                            child: Row(
                              children: [
                                // Avatar header (empty space to match avatar column)
                                SizedBox(width: 50),
                                MySpacing.width(16),
                                
                                // Info section headers
                                Expanded(
                                  child: Row(
                                    children: [
                                      // Name & Email header
                                      Expanded(
                                        flex: 2,
                                        child: MyText.bodySmall(
                                          "MEMBER",
                                          fontWeight: 700,
                                          muted: true,
                                        ),
                                      ),
                                      
                                      // Role header
                                      Expanded(
                                        child: MyText.bodySmall(
                                          "ROLE",
                                          fontWeight: 700,
                                          muted: true,
                                        ),
                                      ),
                                      
                                      // Time Today header
                                      Expanded(
                                        child: MyText.bodySmall(
                                          "TIME TODAY",
                                          fontWeight: 700,
                                          muted: true,
                                        ),
                                      ),
                                      
                                      // Activity % header
                                      Expanded(
                                        child: MyText.bodySmall(
                                          "ACTIVITY",
                                          fontWeight: 700,
                                          muted: true,
                                        ),
                                      ),
                                      
                                      // Last Active header
                                      Expanded(
                                        child: MyText.bodySmall(
                                          "LAST ACTIVE",
                                          fontWeight: 700,
                                          muted: true,
                                        ),
                                      ),
                                      
                                      // Status header
                                      Expanded(
                                        child: MyText.bodySmall(
                                          "STATUS",
                                          fontWeight: 700,
                                          muted: true,
                                        ),
                                      ),
                                      
                                      // Actions header (empty space to match actions column)
                                      Expanded(flex: 2, child: Container()),
                                    ],
                                  ),
                                ),
                                
                                // Empty space for popup menu column
                                SizedBox(width: 40),
                              ],
                            ),
                          ),
                          
                          //MySpacing.height(8),
                          
                          // Your existing ListView.builder
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller.discover.length,
                            itemBuilder: (context, index) {
                              return MyCard(
                                borderRadius:BorderRadius.circular(0),
                                shadow: MyShadow(elevation: 1),
                                paddingAll: 16,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // Avatar
                                    MyContainer.roundBordered(
                                      height: 50,
                                      width: 50,
                                      paddingAll: 0,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(25),
                                        child: Image.asset(
                                          controller.discover[index].image,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    MySpacing.width(16),
                                    
                                    // Info section
                                    Expanded(
                                      child: Row(
                                        children: [
                                          // Name & Email
                                          Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText.bodyMedium(
                            controller.discover[index].name,
                            fontWeight: 600),
                        MyText.bodySmall(
                            controller.opportunities[index].email,
                            muted: true),
                      ],
                    ),
                                          ),
                                          
                                          // Role
                                          Expanded(
                    child: MyText.bodySmall("Developer"),
                                          ),
                                          
                                          // Time Today
                                          Expanded(
                    child: MyText.bodySmall("4h 32m"),
                                          ),
                                          
                                          // Activity %
                                          Expanded(
                    child: MyText.bodySmall("82%"),
                                          ),
                                          
                                          // Last Active
                                          Expanded(
                    child: MyText.bodySmall("10 min ago"),
                                          ),
                                          
                                          // Status
                                          Expanded(
                    child: Row(
                      children: [
                        Icon(Icons.circle,
                            color: Colors.green, size: 10),
                        MySpacing.width(6),
                        MyText.bodySmall("Active"),
                      ],
                    ),
                                          ),
                                          
                                          // Actions
                                          Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(LucideIcons.image,
                              size: 16),
                          label: const Text("Screenshots"),
                        ),
                        TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(LucideIcons.mail,
                              size: 16),
                          label: const Text("Message"),
                        ),
                      ],
                    ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    
                                    // Popup menu
                                    PopupMenuButton(
                                      offset: const Offset(0, 10),
                                      itemBuilder: (BuildContext context) => [
                                        PopupMenuItem(
                                          padding: MySpacing.xy(16, 8),
                                          height: 10,
                                          child: MyText.bodySmall("View Detail"),
                                        ),
                                        PopupMenuItem(
                                          padding: MySpacing.xy(16, 8),
                                          height: 10,
                                          child: MyText.bodySmall("Send Message"),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
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


//  MyContainer.none(
//                                   paddingAll: 8,
//                                   borderRadiusAll: 5,
//                                   child: PopupMenuButton(
//                                     offset: const Offset(0, 10),
//                                     position: PopupMenuPosition.under,
//                                     itemBuilder: (BuildContext context) => [
//                                       PopupMenuItem(
//                                           padding: MySpacing.xy(16, 8),
//                                           height: 10,
//                                           child: MyText.bodySmall("Action")),
//                                       PopupMenuItem(
//                                           padding: MySpacing.xy(16, 8),
//                                           height: 10,
//                                           child:
//                                               MyText.bodySmall("Another action")),
//                                       PopupMenuItem(
//                                           padding: MySpacing.xy(16, 8),
//                                           height: 10,
//                                           child: MyText.bodySmall(
//                                               "Somethings else here"))
//                                     ],
//                                     child: Icon(LucideIcons.ellipsis, size: 18),
//                                   ),
//                                 ),