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
        return TextButton(
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
              fontSize: TabletSize.fontSize.submenu,
            ),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
