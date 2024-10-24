import 'dart:developer';
import 'package:nurse_department/resource/resource.dart';

class DesktopLayout extends StatefulWidget {
  const DesktopLayout({super.key});

  @override
  State<DesktopLayout> createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout> {
  List<Color> menuTextHoverColor = List.filled(8, Colors.black);
  int? _currentMenuState;
  bool _isSubmenuOpen = false;
  double submenuHeight = DesktopSize.submenu.minHeight;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Consumer2<ResponsiveProvider, MenuProvider>(
      builder: (context, responsive, menuProvider, child) {
        var leadingWidth = responsive.leadingSubtitleWidth * screenWidth;

        return Scaffold(
          appBar: AppBar(
            toolbarHeight: responsive.appBarHeight,
            titleSpacing: responsive.appBarPaddingLeft,
            title: Image.asset(
              ImagePath.logo,
              width: responsive.logoWidth,
              height: responsive.logoHeight,
            ),
            actions: [
              for (int index = 0; index < MenuData.titleMenu.length; index++)
                SizedBox(
                  height: responsive.appBarHeight,
                  child: MouseRegion(
                    onEnter: (_) {
                      setState(() {
                        menuTextHoverColor[index] = AppColor.color;
                        _currentMenuState = index;
                        _isSubmenuOpen = true;
                        submenuHeight = DesktopSize.submenu.maxHeight;
                      });
                    },
                    onExit: (_) {
                      setState(() {
                        menuTextHoverColor[index] = Colors.black;
                        _isSubmenuOpen = false;
                        submenuHeight = DesktopSize.submenu.minHeight;
                      });
                    },
                    child: TextButton.icon(
                      onPressed: () {},
                      style: buttonStyle(responsive),
                      label: text(index, menuProvider, responsive),
                      iconAlignment: IconAlignment.end,
                      icon: index == 2
                          ? Container(
                              margin: const EdgeInsets.only(left: 0),
                              child: Image.asset(
                                ImagePath.linkIcon,
                                width: responsive.menuTextButtonLinkIconWidth,
                                height: responsive.menuTextButtonLinkIconHeight,
                                color: _currentMenuState == 2
                                    ? menuTextHoverColor[index]
                                    : Colors.grey.shade700,
                              ),
                            )
                          : null,
                    ),
                  ),
                ),

              SizedBox(width: responsive.spaceBetweenIcon),

              // HOME button
              Container(
                margin: EdgeInsets.only(top: responsive.homeMarginTop),
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    overlayColor: Colors.transparent,
                  ),
                  child: Text(
                    'HOME',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: responsive.homeButtonFontSize,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              // space between icon
              SizedBox(width: responsive.spaceBetweenIcon),

              // search icon button
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  ImagePath.searchIcon,
                  width: responsive.searchIconWidth,
                  height: responsive.searchIconHeight,
                  color: Colors.black54,
                ),
                padding: const EdgeInsets.only(top: 10),
                style: IconButton.styleFrom(
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  fixedSize: Size(
                    responsive.searchIconSizeWidth,
                    responsive.searchIconSizeHeight,
                  ),
                ),
              ),

              // space between icon
              SizedBox(width: responsive.spaceBetweenIcon),

              // menu icon button
              IconButton(
                onPressed: () {
                  menuIconButton(
                      context, responsive, screenWidth, screenHeight);
                },
                icon: Image.asset(
                  ImagePath.menuIconButton,
                  color: Colors.white,
                  width: responsive.menuIconWidth,
                  height: responsive.menuIconHeight,
                ),
                padding: EdgeInsets.only(top: responsive.menuIconPaddingTop),
                style: IconButton.styleFrom(
                  backgroundColor: AppColor.color,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  fixedSize: Size(
                    responsive.menuIconSizeWidth,
                    responsive.menuIconSizeHeight,
                  ),
                ),
              ),

              SizedBox(width: responsive.appBarPaddingRight),
            ],
          ),
          body: Stack(
            children: [
              // Body Content

              Container(),
              if (_isSubmenuOpen) // Show barrier only when submenu is open
                const ModalBarrier(
                  dismissible: false, // Prevent dismissing the barrier
                  color: Colors.black38, // Semi-transparent color
                ),

              // Submenu
              submenuContainer(responsive, screenWidth, leadingWidth),
            ],
          ),
        );
      },
    );
  }

  // Menu TextButton Style
  ButtonStyle? buttonStyle(ResponsiveProvider responsive) {
    return TextButton.styleFrom(
      overlayColor: Colors.transparent,
      backgroundColor: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: responsive.menuTextButtonPadding,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
    );
  }

  // Menu TextButton Text
  Widget text(
      int index, MenuProvider menuProvider, ResponsiveProvider responsive) {
    return Text(
      MenuData.titleMenu[index],
      style: TextStyle(
        color: menuProvider.menuState == index
            ? AppColor.color
            : menuTextHoverColor[index],
        fontSize: responsive.menuTextButtonFontSize,
        fontWeight:
            menuProvider.menuState == index ? FontWeight.w800 : FontWeight.bold,
      ),
    );
  }

  // Submenu Container
  Widget submenuContainer(
      ResponsiveProvider resonpive, double screenWidth, double leadingWidth) {
    String leadingTitle = "";
    Widget gridView = Container();
    if (_currentMenuState != null) {
      leadingTitle = MenuData.titleMenu[_currentMenuState!];
      gridView = DesktopGridview(menuIndex: _currentMenuState!);
    }

    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            menuTextHoverColor[_currentMenuState!] = AppColor.color;
            _isSubmenuOpen = true;
            submenuHeight = DesktopSize.submenu.maxHeight;
          });
        },
        onExit: (_) {
          setState(() {
            menuTextHoverColor[_currentMenuState!] = Colors.black;
            _isSubmenuOpen = false;
            submenuHeight = DesktopSize.submenu.minHeight;
          });
        },
        child: AnimatedContainer(
          width: screenWidth,
          height: submenuHeight,
          duration: const Duration(milliseconds: 300),
          curve: Curves.linear,
          decoration: const BoxDecoration(
            color: Color(0xFFF4F4F4),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          padding: EdgeInsets.only(top: resonpive.submenuPaddingTop),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: leadingWidth,
                height: submenuHeight,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                  ),
                ),
                padding: EdgeInsets.only(
                  left: resonpive.leadingSubtitlePaddingLeft,
                ),
                child: Text(
                  leadingTitle,
                  style: TextStyle(
                    fontSize: resonpive.leadingSubtitleFontSize,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              gridView,
            ],
          ),
        ),
      ),
    );
  }

  // Show all menu dialog
  void menuIconButton(BuildContext context, ResponsiveProvider responsive,
      double screenWidth, double screenHeight) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        double marginHorizontal =
            screenWidth * responsive.dialogMarginHorizontal;
        double marginVertical = screenHeight * responsive.dialogMarginVertical;
        double paddingHorizontal = screenWidth * 0.03;
        return Center(
          child: Container(
            width: screenWidth,
            height: screenHeight,
            margin: EdgeInsets.symmetric(
              horizontal: marginHorizontal,
              vertical: marginVertical,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              // color: Colors.amber,
              color: const Color(0xFFF4F4F4),
              border: Border.all(
                width: 0,
                color: Colors.transparent,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                // ----- Header -----
                Container(
                  width: screenWidth - marginHorizontal * 2,
                  height: responsive.dialogHeaderHeight,
                  padding: EdgeInsets.symmetric(
                    horizontal: responsive.dialogHeaderPaddingHor,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    border: Border.all(
                      width: 0,
                      color: Colors.transparent,
                    ),
                    color: AppColor.alertColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "전체메뉴",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: responsive.dialogHeaderTitleFontSize,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: IconButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          fixedSize: Size(
                            responsive.closeButtonSizeWidth,
                            responsive.closeButtonSizeHeight,
                          ),
                          backgroundColor: Colors.white,
                        ),
                        color: AppColor.alertColor,
                        icon: Image.asset(
                          ImagePath.closeIcon,
                          color: AppColor.alertColor,
                          width: responsive.closeIconWidth,
                          height: responsive.closeButtonSizeHeight,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: responsive.dialogSpaceBetweenHeaderAndList),

                // Menu List
                Expanded(
                  child: ListView.builder(
                    itemCount: MenuData.titleMenu.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: screenWidth - marginHorizontal,
                            // color: Colors.amber,
                            margin: EdgeInsets.symmetric(
                              horizontal: marginHorizontal,
                              vertical: 10,
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: paddingHorizontal,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  MenuData.titleMenu[index],
                                  style: const TextStyle(
                                    fontSize: 34,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                DesktopGridview(menuIndex: index),
                              ],
                            ),
                          ),

                          // visible divider at last menu
                          if (MenuData.titleMenu[index] !=
                              MenuData.titleMenu.last)
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: marginHorizontal),
                              child: Divider(
                                height: 5,
                                thickness: 4,
                                color: const Color.fromARGB(94, 128, 81, 229)
                                    .withOpacity(0.4),
                              ),
                            ),
                          if (MenuData.titleMenu[index] ==
                              MenuData.titleMenu.last)
                            const SizedBox(height: 50),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, -1.0); // Start from top-right corner
        const end = Offset.zero; // End at the center
        const curve = Curves.easeInOutCubic;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: ScaleTransition(
            scale: Tween<double>(
              begin: 0.5,
              end: 1.0,
            ).animate(CurvedAnimation(
              parent: animation,
              curve: curve,
            )),
            child: child,
          ),
        );
      },
    );
  }
}
