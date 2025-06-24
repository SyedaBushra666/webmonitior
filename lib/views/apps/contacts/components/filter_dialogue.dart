import 'package:flutter/material.dart';

Future<void> showMemberFilterDialog(
  BuildContext context, {
  required String? currentRole,
  required String? currentProject,
  required String? currentStatus,
  required List<String> roleOptions,
  required List<String> projectOptions,
  required List<String> statusOptions,
  required Function(String? role, String? project, String? status) onApply,
}) async {
  String? tempRole = currentRole;
  String? tempProject = currentProject;
  String? tempStatus = currentStatus;

  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Apply Filters"),
        content: SizedBox(
          width: 400,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField<String>(
                value: tempRole,
                decoration: const InputDecoration(labelText: "Select Role"),
                items: roleOptions
                    .map((role) => DropdownMenuItem(value: role, child: Text(role)))
                    .toList(),
                onChanged: (val) => tempRole = val,
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: tempProject,
                decoration: const InputDecoration(labelText: "Select Project"),
                items: projectOptions
                    .map((proj) => DropdownMenuItem(value: proj, child: Text(proj)))
                    .toList(),
                onChanged: (val) => tempProject = val,
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: tempStatus,
                decoration: const InputDecoration(labelText: "Select Status"),
                items: statusOptions
                    .map((status) => DropdownMenuItem(value: status, child: Text(status)))
                    .toList(),
                onChanged: (val) => tempStatus = val,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              onApply(null, null, null); // clear all
            },
            child: const Text("Clear"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              onApply(tempRole, tempProject, tempStatus);
            },
            child: const Text("Apply"),
          ),
        ],
      );
    },
  );
}
