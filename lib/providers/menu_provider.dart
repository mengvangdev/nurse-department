import 'package:nurse_department/resource/resource.dart';

class MenuProvider extends ChangeNotifier {
  int? _menuState;
  int? get menuState => _menuState;
  set menuState(int? value) {
    if (value == _menuState) return;
    _menuState = value;
    notifyListeners();
  }

  int? _submenuState;
  int get submenuState => _submenuState!;
  set submenuState(int value) {
    _submenuState = value;
    notifyListeners();
  }

  // submenu of department overview
  // List<String> _departmentOverview = MenuData.departmentOverview;
  // List<String> get departmentOverview => _departmentOverview;
  // set departmentOverview(List<String> value) {
  //   _departmentOverview = value;
  //   notifyListeners();
  // }

  // // current state or actived: submenu of department overview
  // int? _departmentOvervievCurrentState;
  // int? get departmentOvervievCurrentState => _departmentOvervievCurrentState;
  // set departmentOvervievCurrentState(int? value) {
  //   _departmentOvervievCurrentState = value;
  //   notifyListeners();
  // }

  // // submenu of centers
  // List<String> _centers = MenuData.centers;
  // List<String> get centers => _centers;
  // set centers(List<String> value) {
  //   _centers = value;
  //   notifyListeners();
  // }

  // // submenu of admissions
  // List<String> _admissions = MenuData.admissions;
  // List<String> get admissions => _admissions;
  // set admissions(List<String> value) {
  //   _admissions = value;
  //   notifyListeners();
  // }

  // // submenu of department administration
  // List<String> _departmentAdministration = MenuData.departmentAdministration;
  // List<String> get departmentAdministration => _departmentAdministration;
  // set departmentAdministration(List<String> value) {
  //   _departmentAdministration = value;
  //   notifyListeners();
  // }

  // // submenu of student activities
  // List<String> _studentActivities = MenuData.studentActivities;
  // List<String> get studentActivities => _studentActivities;
  // set studentActivities(List<String> value) {
  //   _studentActivities = value;
  //   notifyListeners();
  // }

  // // submenu of career services
  // List<String> _careerServices = MenuData.careerServices;
  // List<String> get careerServices => _careerServices;
  // set careerServices(List<String> value) {
  //   _careerServices = value;
  //   notifyListeners();
  // }

  // // submenu of teacher certification
  // List<String> _teacherCertification = MenuData.teacherCertification;
  // List<String> get teacherCertification => _teacherCertification;
  // set teacherCertification(List<String> value) {
  //   _teacherCertification = value;
  //   notifyListeners();
  // }

  // // submenu of graduate programs
  // List<String> _graduatePrograms = MenuData.graduatePrograms;
  // List<String> get graduatePrograms => _graduatePrograms;
  // set graduatePrograms(List<String> value) {
  //   _graduatePrograms = value;
  //   notifyListeners();
  // }
}
