import 'package:nurse_department/resource/resource.dart';

class TabletSubmenuButton extends StatefulWidget {
  const TabletSubmenuButton({
    super.key,
    required this.text,
    required this.currentMenuState,
    required this.submenuIndex,
  });

  final String text;
  final int currentMenuState;
  final int submenuIndex;

  @override
  State<TabletSubmenuButton> createState() => TabletSubmenuButtonState();
}

class TabletSubmenuButtonState extends State<TabletSubmenuButton> {
  bool isSubmenuHover = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuProvider>(
      builder: (context, menuProvider, child) {
        return MouseRegion(
          onEnter: (_) => setState(() {
            isSubmenuHover = true;
          }),
          onExit: (_) => setState(() {
            isSubmenuHover = false;
          }),
          child: TextButton(
            onPressed: () {
              menuProvider.menuState = widget.currentMenuState;
              menuProvider.submenuState = widget.submenuIndex;
            },
            style: TextButton.styleFrom(
              backgroundColor: activedBackgroundColor(menuProvider),
              foregroundColor: activedTextColor(menuProvider),
              overlayColor: Colors.transparent,
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(
                  color: isSubmenuHover ? AppColor.color : Colors.transparent,
                  width: 2,
                ),
              ),
            ),
            child: Text(
              widget.text,
              style: TextStyle(
                fontSize: LaptopSize.fontSize.submenu,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }

  Color activedBackgroundColor(MenuProvider menuProvider) {
    if (menuProvider.menuState == null) {
      return Colors.white;
    } else if (MenuData.subMenu[menuProvider.menuState!]
            [menuProvider.submenuState] ==
        widget.text) {
      return AppColor.color;
    }
    return Colors.white;
  }

  Color activedTextColor(MenuProvider menuProvider) {
    if (menuProvider.menuState == null) {
      return Colors.black;
    } else if (MenuData.subMenu[menuProvider.menuState!]
            [menuProvider.submenuState] ==
        widget.text) {
      return Colors.white;
    }
    return Colors.black;
  }
}
