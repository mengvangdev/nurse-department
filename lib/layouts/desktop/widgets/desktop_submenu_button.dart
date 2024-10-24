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
    return Consumer2<MenuProvider, ResponsiveProvider>(
      builder: (context, menuProvider, responsive, child) {
        return MouseRegion(
          onEnter: (_) => setState(() {
            isSubmenuHover = true;
          }),
          onExit: (_) => setState(() {
            isSubmenuHover = false;
          }),
          child: TextButton.icon(
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
            label: Text(
              widget.text,
              style: TextStyle(
                fontSize: responsive.submenuTextButtonFontSize,
              ),
              textAlign: TextAlign.center,
            ),
            iconAlignment: IconAlignment.end,
            icon: widget.currentMenuState == 2 && widget.submenuIndex != 2
                ? Image.asset(
                    ImagePath.linkIcon,
                    width: responsive.submenuTextButtonLinkIconWidth,
                    height: responsive.submenuTextButtonLinkIconHeight,
                    color: activedLinkIconColor(
                      currentMenuState: widget.currentMenuState,
                      currentSubmenuState: widget.submenuIndex,
                      menuProvider: menuProvider,
                    ),
                  )
                : null,
          ),
        );
      },
    );
  }

  Color activedLinkIconColor(
      {required int currentMenuState,
      required int currentSubmenuState,
      required MenuProvider menuProvider}) {
    if (menuProvider.menuState == null) {
      return Colors.grey.shade700;
    } else if (menuProvider.menuState == currentMenuState &&
        menuProvider.submenuState == currentSubmenuState) {
      return Colors.white;
    }
    return Colors.grey.shade700;
  }
}
