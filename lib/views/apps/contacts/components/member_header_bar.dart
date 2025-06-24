import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:get/get.dart';
import 'package:webkit/controller/employees/member_controller.dart';
import 'package:webkit/helpers/theme/app_style.dart';
import 'package:webkit/helpers/utils/ui_mixins.dart';
import 'package:webkit/helpers/widgets/my_button.dart';
import 'package:webkit/helpers/widgets/my_spacing.dart';
import 'package:webkit/helpers/widgets/my_text.dart';
import 'package:webkit/helpers/widgets/my_text_style.dart';
import 'package:webkit/helpers/widgets/responsive.dart';
import 'package:webkit/views/apps/contacts/components/role_drop_drown.dart';
import 'package:webkit/views/apps/contacts/components/user_filter_bar.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header>
    with SingleTickerProviderStateMixin, UIMixin {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText.headlineMedium(
              "Members List",
              fontSize: 18,
              fontWeight: 800,
            ),
            Row(
              children: [
                Icon(LucideIcons.circle_user,
                    color: contentTheme.dark, size: 16),
                MySpacing.width(12),
                MyText.bodySmall("total users 18", color: contentTheme.primary),
              ],
            )
          ],
        ),
        MyButton(
          onPressed: () {
            Get.toNamed("/contacts/addmember");
          },
          elevation: 0,
          padding: MySpacing.xy(12, 16),
          backgroundColor: contentTheme.primary,
          borderRadiusAll: AppStyle.buttonRadius.medium,
          child: Row(
            children: [
              Icon(LucideIcons.circle_plus,
                  color: contentTheme.light, size: 16),
              MySpacing.width(12),
              MyText.bodySmall("Add Member", color: contentTheme.onPrimary),
            ],
          ),
        ),
      ],
    );
  }
}

class MemberHeaderBar extends StatefulWidget {
  const MemberHeaderBar({super.key});

  @override
  State<MemberHeaderBar> createState() => _MemberHeaderBarState();
}

class _MemberHeaderBarState extends State<MemberHeaderBar>
    with SingleTickerProviderStateMixin, UIMixin {
  late MemberController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(MemberController());
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
           SizedBox(
          width: 250,
          child: TextFormField(
            maxLines: 1,
            style: MyTextStyle.bodyMedium(),
            decoration: InputDecoration(
                prefixIcon: Icon(LucideIcons.search,size: 14,),
                prefixIconColor: contentTheme.dark,
                hintText: "Search by name or email... ",
                hintStyle: MyTextStyle.titleSmall(color: contentTheme.dark,fontSize: 12),
                border: outlineInputBorder,
                enabledBorder: outlineInputBorder,
                focusedBorder: focusedInputBorder,
                contentPadding: MySpacing.xy(12, 12),
                isCollapsed: true,
                floatingLabelBehavior: FloatingLabelBehavior.never),
          ),
        ),
        MySpacing.width(flexSpacing),
        SizedBox(
          width: 500,
          child: RoleDropDown()),
        ],),
        
          ChatGptStyleFilterMenu()
      ],
    );
  }
}
