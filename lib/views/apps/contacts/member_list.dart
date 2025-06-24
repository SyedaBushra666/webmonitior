import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webkit/controller/employees/member_controller.dart';
import 'package:webkit/helpers/utils/ui_mixins.dart';
import 'package:webkit/helpers/widgets/my_breadcrumb.dart';
import 'package:webkit/helpers/widgets/my_breadcrumb_item.dart';
import 'package:webkit/helpers/widgets/my_button.dart';
import 'package:webkit/helpers/widgets/my_spacing.dart';
import 'package:webkit/helpers/widgets/my_text.dart';
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
                          "Members",
                          fontSize: 18,
                          fontWeight: 600,
                        ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: "Employees"),
                        MyBreadcrumbItem(name: "Members ", active: true),
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
                 EmployeeTable()
               // InviteTable()
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

class _FilterDialogContent extends StatefulWidget {
  @override
  State<_FilterDialogContent> createState() => _FilterDialogContentState();
}

class _FilterDialogContentState extends State<_FilterDialogContent> {
  String? selectedRole;
  String? selectedProject;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MySpacing.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText.titleMedium("Apply Filters", fontWeight: 700),
              IconButton(
                icon: Icon(Icons.close, size: 20),
                onPressed: () => Get.back(),
              ),
            ],
          ),
          MySpacing.height(16),

          // Role Filter
          _buildFilterField(
            label: "Role",
            child: DropdownButtonFormField<String>(
              decoration: _inputDecoration(),
              value: selectedRole,
              hint: Text("Select role"),
              items: ["Admin", "Member", "Viewer"]
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (val) => setState(() => selectedRole = val),
            ),
          ),

          MySpacing.height(16),

          // Project Filter
          _buildFilterField(
            label: "Project",
            child: DropdownButtonFormField<String>(
              decoration: _inputDecoration(),
              value: selectedProject,
              hint: Text("Select project"),
              items: ["Alpha", "Beta", "Gamma"]
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (val) => setState(() => selectedProject = val),
            ),
          ),

          MySpacing.height(24),

          // Apply Button
          Align(
            alignment: Alignment.centerRight,
            child: MyButton(
              padding: MySpacing.xy(24, 12),
              onPressed: () {
                Get.back();
                // Show applied filters as snack or chips
                Get.snackbar(
                    "Filters Applied", "Your filters have been updated",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.green.withOpacity(0.1),
                    colorText: Colors.green[900],
                    margin: EdgeInsets.all(16),
                    duration: Duration(seconds: 2));
              },
              child: MyText.bodyMedium("Apply"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterField({required String label, required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText.labelMedium(label, fontWeight: 600),
        MySpacing.height(8),
        child,
      ],
    );
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    );
  }
}