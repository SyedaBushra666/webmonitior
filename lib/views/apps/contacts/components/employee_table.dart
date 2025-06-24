import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:get/get.dart';
import 'package:webkit/controller/employees/member_controller.dart';
import 'package:webkit/helpers/utils/ui_mixins.dart';
import 'package:webkit/helpers/widgets/my_card.dart';
import 'package:webkit/helpers/widgets/my_flex_item.dart';
import 'package:webkit/helpers/widgets/my_spacing.dart';
import 'package:webkit/helpers/widgets/responsive.dart';
import 'package:webkit/models/member.dart';
import 'package:webkit/views/apps/contacts/components/alert_dialogue_delete.dart';
import 'package:webkit/views/apps/contacts/components/member_header_bar.dart';
import 'package:webkit/views/apps/contacts/edit_member.dart';

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
          paddingAll: 0,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Header(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14, bottom: 14, right: 20),
                child: MemberHeaderBar(),
              ),
              MySpacing.height(5),
              Table(
                columnWidths: {
                  0: FlexColumnWidth(1), //name
                  1: FlexColumnWidth(1), //email
                  2: FlexColumnWidth(1),
                  3: FlexColumnWidth(1),
                  4: FlexColumnWidth(1),
                },
                children: [
                  _buildHeaderRow(),
                  
                  ...controller.members.asMap().entries.map((entry) {
                    final user = entry.value;
                    return _buildDataRow(user);
                  }),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  TableRow _buildHeaderRow() {
    return TableRow(
      decoration: BoxDecoration(color: Colors.grey.shade400),
      children: [
        Padding(
            padding: EdgeInsets.only(top: 8, left: 12, right: 8, bottom: 8),
            child: Text("Name", style: TextStyle(fontWeight: FontWeight.bold))),
        Padding(
            padding: EdgeInsets.all(8),
            child:
                Text("Email", style: TextStyle(fontWeight: FontWeight.bold))),
        Padding(
            padding: EdgeInsets.all(8),
            child: Text("Role", style: TextStyle(fontWeight: FontWeight.bold))),
        Padding(
            padding: EdgeInsets.all(8),
            child: Text("Projects",
                style: TextStyle(fontWeight: FontWeight.bold))),
        Padding(
            padding: EdgeInsets.all(8),
            child:
                Text("Status", style: TextStyle(fontWeight: FontWeight.bold))),
        Padding(
            padding: EdgeInsets.all(8),
            child:
                Text("Actions", style: TextStyle(fontWeight: FontWeight.bold))),
      ],
    );
  }

  Widget _buildInlineActions(String id) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _actionIcon(LucideIcons.eye, Colors.blueGrey, "View", () {
           Get.toNamed('/view-member');
        }),
        _actionIcon(LucideIcons.pencil, Colors.orange, "Edit", () {
          Get.toNamed('/edit_member/$id');


        }),
        _actionIcon(LucideIcons.trash, Colors.redAccent, "Delete", () {
          showAlertDialogDelete(
            context: context,
            userName: "Bushra Syeda",
            userEmail: "bushra@example.com",
            onDelete: () {
              // Your delete logic here
            },
          );
        }),
      ],
    );
  }

  Widget _actionIcon(
      IconData icon, Color color, String tooltip, VoidCallback onTap) {
    return Tooltip(
      message: tooltip,
      waitDuration: Duration(milliseconds: 300),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Material(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Icon(icon, size: 16, color: color),
            ),
          ),
        ),
      ),
    );
  }

  TableRow _buildDataRow(Member user) {
    return TableRow(
      children: [
        Padding(
            padding: EdgeInsets.only(top: 8, left: 12, right: 8, bottom: 8),
            child: Text("${user.firstName}  ${user.lastName}")),
        Padding(padding: EdgeInsets.all(8), child: Text(user.email)),
        Padding(padding: EdgeInsets.all(8), child: Text(user.role)),
        Padding(padding: EdgeInsets.all(8), child: Text(user.project)),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: _buildStatusCell(user.isActive),
        ),
        Padding(padding: EdgeInsets.all(8), child: _buildInlineActions(user.id))
      ],
    );
  }
}

Widget _buildStatusCell(bool isActive) {
  return Row(
    children: [
      Container(
        width: 6,
        height: 6,
        margin: EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive ? Colors.green : Colors.yellow,
        ),
      ),
      Text(
        isActive ? "Active" : "Inactive",
      ),
    ],
  );
}

class InviteTable extends StatelessWidget {
  const InviteTable({super.key});

  @override
  Widget build(BuildContext context) {
    return MyCard(
      child: MyFlexItem(
        child: Table(
          columnWidths: {
            0: FlexColumnWidth(1),
            1: FlexColumnWidth(1),
            2: FlexColumnWidth(1),
          },
          children: [
            TableRow(
              children: [
                Padding(
                    padding: EdgeInsets.all(8),
                    child: Text("Name",
                        style: TextStyle(fontWeight: FontWeight.bold))),
                Padding(
                    padding: EdgeInsets.all(8),
                    child: Text("Email",
                        style: TextStyle(fontWeight: FontWeight.bold))),
                Padding(
                    padding: EdgeInsets.all(8),
                    child: Text("Role",
                        style: TextStyle(fontWeight: FontWeight.bold))),
                Padding(
                    padding: EdgeInsets.all(8),
                    child: Text("Status",
                        style: TextStyle(fontWeight: FontWeight.bold))),
              ],
            ),
            TableRow(
              children: [
                Padding(padding: EdgeInsets.all(8), child: Text("Ali")),
                Padding(
                    padding: EdgeInsets.all(8), child: Text("ali@example.com")),
                Padding(padding: EdgeInsets.all(8), child: Text("Admin")),
                Padding(padding: EdgeInsets.all(8), child: Text("Pending")),
              ],
            ),
            // More rows...
          ],
        ),
      ),
    );
  }
}
