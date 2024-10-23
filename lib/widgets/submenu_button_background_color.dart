import 'package:nurse_department/resource/resource.dart';

class SubmenuBtn {
  static Color activedBackgroundColor({
    required int currentMenuState,
    required int currentSubmenuState,
    required MenuProvider menuProvider,
  }) {
    if (menuProvider.menuState == null) {
      return Colors.white;
    } else if (menuProvider.menuState == currentMenuState &&
        menuProvider.submenuState == currentSubmenuState) {
      return AppColor.color;
    }
    return Colors.white;
  }

  static Color activedTextColor(
      {required int currentMenuState,
      required int currentSubmenuState,
      required MenuProvider menuProvider}) {
    if (menuProvider.menuState == null) {
      return Colors.black;
    } else if (menuProvider.menuState == currentMenuState &&
        menuProvider.submenuState == currentSubmenuState) {
      return Colors.white;
    }
    return Colors.black;
  }
}
