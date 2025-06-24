import 'package:get/get.dart';
import 'package:webkit/models/member.dart';


class MemberController extends GetxController {
  // Observable list of members
  RxList<Member> members = <Member>[].obs;

  // Currently selected member (for editing)
  Member? selectedMember;

  // for tabs 

   var selectedTab = 0.obs;

  void selectTab(int index) {
    selectedTab.value = index;
  }

  // Selected dropdown values
  RxnString selectedRole = RxnString();
  RxnString selectedProject = RxnString();
  String selectSize = "All";
   String selectedStatus = "All";

   void onSelectedSize(String size) {
    selectSize = size;
    update();
  }

   void onSelectedStatus(String status) {
    selectedStatus = status;
    update();
  }
  void loadDummyData() {
    members.value = [
      Member(
        id: '1',
        firstName: 'Ali',
        lastName: 'Raza',
        email: 'ali@example.com',
        role: 'Organization Admin',
        project: 'Project A',
      ),
        Member(
        id: '1',
        firstName: 'Ali',
        lastName: 'Raza',
        email: 'ali@example.com',
        role: 'Organization Admin',
        project: 'Project A',
      ),
        Member(
        id: '1',
        firstName: 'Ali',
        lastName: 'Raza',
        email: 'ali@example.com',
        role: 'Organization Admin',
        project: 'Project A',
      ),
      Member(
        id: '2',
        firstName: 'Sara',
        lastName: 'Khan',
        email: 'sara@example.com',
        role: 'Team Member',
        project: 'Project B',
        isActive: false,
      ),
         Member(
        id: '4',
        firstName: 'Umer',
        lastName: 'Raza',
        email: 'raxa@example.com',
        role: 'Team Lead',
        project: 'Project A',
        isActive: false,
      ),
      Member(
        id: '3',
        firstName: 'Sara',
        lastName: 'Khan',
        email: 'sara@example.com',
        role: ' Team Member',
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

  Member? findMemberById(String id) {
  return members.firstWhereOrNull((m) => m.id == id);

}


  void deleteMember(String id) {
    members.removeWhere((m) => m.id == id);
    update();
  }
}
