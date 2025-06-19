import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:get/get.dart';
import 'package:webkit/controller/employees/member_controller.dart';
import 'package:webkit/helpers/utils/ui_mixins.dart';
import 'package:webkit/helpers/widgets/my_card.dart';
import 'package:webkit/helpers/widgets/my_spacing.dart';
import 'package:webkit/helpers/widgets/my_text.dart';
import 'package:webkit/helpers/utils/my_shadow.dart';
import 'package:webkit/models/member.dart';

class EmployeeTable extends StatefulWidget {
  const EmployeeTable({super.key});

  @override
  State<EmployeeTable> createState() => _EmployeeTableState();
}

class _EmployeeTableState extends State<EmployeeTable> with UIMixin {
  late final MemberController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(MemberController());
    controller.loadDummyData();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MemberController>(
      builder: (controller) {
        return MyCard(
          paddingAll: 20,
          borderRadiusAll: 12,
          shadow: MyShadow(elevation: 0.5),
          child: Column(
            children: [
              _buildHeaderRow(),
              const Divider(height: 1),
              ...controller.members.asMap().entries.map((entry) {
                final user = entry.value;
                final isLast = entry.key == controller.members.length - 1;
                return Column(
                  children: [
                    _buildDataRow(user),
                    if (!isLast) const Divider(height: 1),
                  ],
                );
              }),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeaderRow() {
    return Padding(
      padding: MySpacing.xy(12, 14),
      child: Row(
        children: const [
          _HeaderCell("Name", flex: 2),
          _HeaderCell("Role"),
          _HeaderCell("Project"),
          _HeaderCell("Email", flex: 2),
          _HeaderCell("Status"),
          _HeaderCell("Actions", flex: 2),
        ],
      ),
    );
  }

  Widget _buildDataRow(Member user) {
    return Padding(
      padding: MySpacing.xy(12, 14),
      child: Row(
        children: [
          _nameCell("${user.firstName} ${user.lastName}"),
          _dataCell(user.role),
          _dataCell(user.project),
          _dataCell(user.email, flex: 2),
          _statusCell(user.isActive),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                _iconBtn(Icons.edit_outlined, contentTheme.primary, "Edit"),
                _iconBtn(Icons.delete_outline, contentTheme.red, "Delete"),
                _iconBtn(LucideIcons.ellipsis, contentTheme.primary, "View"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _nameCell(String name) {
    return Expanded(
      flex: 2,
      child: Row(
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: contentTheme.primary.withOpacity(0.1),
            child: MyText.labelLarge(
              name.isNotEmpty ? name[0] : "?",
              color: contentTheme.primary,
            ),
          ),
          MySpacing.width(12),
          MyText.bodyMedium(name),
        ],
      ),
    );
  }

  Widget _dataCell(String? value, {int flex = 1}) {
    return Expanded(
      flex: flex,
      child: MyText.bodyMedium(value ?? "-", fontWeight: 500),
    );
  }

  Widget _statusCell(bool isActive) {
    return Expanded(
      flex: 1,
      child: MyText.bodyMedium(
        isActive ? "Active" : "Inactive",
        color: isActive ? contentTheme.success : contentTheme.red,
        fontWeight: 600,
      ),
    );
  }

  Widget _iconBtn(IconData iconData, Color color, String tooltip) {
    return Tooltip(
      message: tooltip,
      child: IconButton(
        icon: Icon(iconData, size: 18, color: color),
        onPressed: () {},
        splashRadius: 18,
      ),
    );
  }
}

class _HeaderCell extends StatelessWidget {
  final String title;
  final int flex;

  const _HeaderCell(this.title, {this.flex = 1, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Align(
        alignment: Alignment.centerLeft,
        child: MyText.labelMedium(
          title.toUpperCase(),
          fontWeight: 700,
          color: Colors.black87,
        ),
      ),
    );
  }
}
