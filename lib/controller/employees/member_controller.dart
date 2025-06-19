import 'package:get/get.dart';
import 'package:webkit/models/member.dart';


class MemberController extends GetxController {
  // Observable list of members
  RxList<Member> members = <Member>[].obs;

  // Currently selected member (for editing)
  Member? selectedMember;

  // Selected dropdown values
  RxnString selectedRole = RxnString();
  RxnString selectedProject = RxnString();

  void loadDummyData() {
    members.value = [
      Member(
        id: '1',
        firstName: 'Ali',
        lastName: 'Raza',
        email: 'ali@example.com',
        role: 'Admin',
        project: 'Project A',
      ),
      Member(
        id: '2',
        firstName: 'Sara',
        lastName: 'Khan',
        email: 'sara@example.com',
        role: 'Member',
        project: 'Project B',
        isActive: false,
      ),
    ];
  }

  void selectRole(String role) => selectedRole.value = role;
  void selectProject(String project) => selectedProject.value = project;

  void addMember(Member member) {
    members.add(member);
    update();
  }

  void updateMember(Member updated) {
    final index = members.indexWhere((m) => m.id == updated.id);
    if (index != -1) {
      members[index] = updated;
      update();
    }
  }

  void deleteMember(String id) {
    members.removeWhere((m) => m.id == id);
    update();
  }
}
