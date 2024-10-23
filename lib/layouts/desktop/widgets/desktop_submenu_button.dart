import 'package:nurse_department/resource/resource.dart';

class DesktopSubmenuButton extends StatefulWidget {
  const DesktopSubmenuButton({
    super.key,
    required this.text,
    required this.currentMenuState,
    required this.submenuIndex,
  });

  final String text;
  final int currentMenuState;
  final int submenuIndex;

  @override
  State<DesktopSubmenuButton> createState() => _DesktopSubmenuButtonState();
}

class _DesktopSubmenuButtonState extends State<DesktopSubmenuButton> {
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
              backgroundColor: SubmenuBtn.activedBackgroundColor(
                currentMenuState: widget.currentMenuState,
                currentSubmenuState: widget.submenuIndex,
                menuProvider: menuProvider,
              ),
              foregroundColor: SubmenuBtn.activedTextColor(
                currentMenuState: widget.currentMenuState,
                currentSubmenuState: widget.submenuIndex,
                menuProvider: menuProvider,
              ),
              overlayColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
                side: BorderSide(
                  color: isSubmenuHover ? AppColor.color : Colors.transparent,
                  width: 2,
                ),
              ),
              shadowColor: AppColor.color,
              padding: EdgeInsets.zero,
            ),
            child: Text(
              widget.text,
              style: TextStyle(
                fontSize: DesktopSize.fontSize.submenu,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }

  // Color activedBackgroundColor(MenuProvider menuProvider) {
  //   if (menuProvider.menuState == null) {
  //     return Colors.white;
  //   } else if (menuProvider.menuState == widget.currentMenuState &&
  //       menuProvider.submenuState == widget.submenuIndex) {
  //     return AppColor.color;
  //   }
  //   return Colors.white;
  // }

  // Color activedTextColor(MenuProvider menuProvider) {
  //   if (menuProvider.menuState == null) {
  //     return Colors.black;
  //   } else if (menuProvider.menuState == widget.currentMenuState &&
  //       menuProvider.submenuState == widget.submenuIndex) {
  //     return Colors.white;
  //   }
  //   return Colors.black;
  // }
}
