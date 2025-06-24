import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webkit/controller/employees/member_controller.dart';
import 'package:webkit/helpers/utils/ui_mixins.dart';
import 'package:webkit/helpers/widgets/my_breadcrumb.dart';
import 'package:webkit/helpers/widgets/my_breadcrumb_item.dart';
import 'package:webkit/helpers/widgets/my_spacing.dart';
import 'package:webkit/helpers/widgets/my_text.dart';
import 'package:webkit/helpers/widgets/responsive.dart';
import 'package:webkit/views/layouts/layout.dart';

class InviteMember extends StatefulWidget {
  const InviteMember({super.key});

  @override
  State<InviteMember> createState() => _InviteMemberState();
}

class _InviteMemberState extends State<InviteMember> with SingleTickerProviderStateMixin, UIMixin{
   late MemberController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(MemberController());
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
                          "Invites",
                          fontSize: 18,
                          fontWeight: 600,
                        ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: "Employees"),
                        MyBreadcrumbItem(name: "Invite Members", active: true),
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
                
                //InviteTable()
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

  