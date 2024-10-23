import 'dart:developer';

import 'package:nurse_department/resource/resource.dart';

class TabletLayout extends StatefulWidget {
  const TabletLayout({super.key});

  @override
  State<TabletLayout> createState() => _TabletLayoutState();
}

class _TabletLayoutState extends State<TabletLayout> {
  List<Color> hoverMenuColor = List.filled(8, Colors.black);
  int? _currentMenuState;
  bool _isSubmenuOpen = false;
  double subMenuHeight = TabletSize.submenu.minHeight;
  @override
  Widget build(BuildContext context) {
    // Calculate sizes
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final leadingWidth = screenWidth * 0.35;

    return Consumer<MenuProvider>(
      builder: (context, menuProvider, child) {
        bool isCurrentState = menuProvider.menuState != null;

        return Scaffold(
          appBar: AppBar(
            toolbarHeight: TabletSize.appBarHeight,
            titleSpacing: TabletSize.appBarRightPadding,
            title: Image.asset(
              ImagePath.logo,
              width: TabletSize.logoWidth,
              height: TabletSize.logoHeight,
              fit: BoxFit.contain,
            ),
            actions: [
              for (int index = 0; index < MenuData.titleMenu.length; index++)
                SizedBox(
                  height: TabletSize.appBarHeight,
                  child: MouseRegion(
                    onEnter: (_) => setState(() {
                      // hoverMenuColor[index] = AppColor.color;
                      // _currentMenuState = index;
                      // _isSubmenuOpen = true;
                      // subMenuHeight = TabletSize.submenu.maxHeight;
                    }),
                    onExit: (_) => setState(() {
                      // hoverMenuColor[index] = Colors.black;
                      // _isSubmenuOpen = false;
                      // subMenuHeight = TabletSize.submenu.minHeight;
                    }),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          log(index.toString());
                          // if (_currentMenuState == index) return;

                          if (_currentMenuState == index) {
                            hoverMenuColor[index] = Colors.black;
                            _isSubmenuOpen = false;
                            subMenuHeight = TabletSize.submenu.minHeight;
                            _currentMenuState = null;
                          } else {
                            _currentMenuState = index;
                            for (var i = 0; i < hoverMenuColor.length; i++) {
                              if (i != _currentMenuState) {
                                hoverMenuColor[i] = Colors.black;
                              }
                            }
                            hoverMenuColor[index] = AppColor.color;
                            _isSubmenuOpen = true;
                            subMenuHeight = TabletSize.submenu.maxHeight;
                          }
                        });
                      },
                      style: TextButton.styleFrom(
                        overlayColor: Colors.transparent,
                        padding: const EdgeInsets.symmetric(
                            horizontal: TabletSize.menuPadding),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        // backgroundColor: Colors.amber,
                      ),
                      child: index != 2
                          ? Text(
                              MenuData.titleMenu[index],
                              style: TextStyle(
                                color: isCurrentState &&
                                        menuProvider.menuState == index
                                    ? AppColor.color
                                    : hoverMenuColor[index],
                                fontSize: TabletSize.fontSize.menu,
                                fontWeight: menuProvider.menuState == index
                                    ? FontWeight.w800
                                    : FontWeight.bold,
                              ),
                            )
                          : Row(
                              children: [
                                Text(
                                  MenuData.titleMenu[index],
                                  style: TextStyle(
                                    color: isCurrentState &&
                                            menuProvider.menuState == index
                                        ? AppColor.color
                                        : hoverMenuColor[index],
                                    fontSize: TabletSize.fontSize.menu,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SvgPicture.asset(
                                  ImagePath.menuIcon,
                                  width: 16,
                                  height: 16,
                                  colorFilter: ColorFilter.mode(
                                    _currentMenuState == 2
                                        ? hoverMenuColor[index]
                                        : Colors.black54,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ),
                ),

              //
              // const SizedBox(width: 5),

              // HOME button
              SizedBox(
                height: TabletSize.appBarHeight,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.only(top: 12, left: 5, right: 5),
                    overlayColor: Colors.transparent,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    // backgroundColor: Colors.pink,
                  ),
                  child: const Text(
                    'HOME',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              //
              // const SizedBox(width: 5),

              // Search header button
              IconButton(
                onPressed: () {},
                style: IconButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  fixedSize: const Size(
                    TabletSize.searchIconWidth,
                    TabletSize.searchIconHeight,
                  ),
                ),
                padding: const EdgeInsets.only(top: 10),
                icon: Image.asset(
                  'assets/images/header1_search.png',
                  width: 40,
                  height: 40,
                ),
              ),

              const SizedBox(width: 5),

              // Show all menu button
              IconButton(
                onPressed: () {
                  showAllMenu(context, screenWidth, screenHeight);
                },
                icon: const Icon(Icons.menu),
                color: Colors.white,
                iconSize: TabletSize.allMenuIconSize,
                padding: const EdgeInsets.only(top: 5),
                style: IconButton.styleFrom(
                  backgroundColor: AppColor.color,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero),
                  fixedSize: const Size(
                    TabletSize.allMenuWidth,
                    TabletSize.allMenuHeight,
                  ),
                ),
              ),
              const SizedBox(width: TabletSize.appBarRightPadding),
            ],
          ),
          body: Stack(
            children: [
              // Body Content
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 400,
                // color: Colors.yellow, // Add a color for visibility
              ),

              // Barrier to prevent interaction with the background
              if (_isSubmenuOpen) // Show barrier only when submenu is open
                const ModalBarrier(
                  dismissible: false, // Prevent dismissing the barrier
                  color: Colors.black38, // Semi-transparent color
                ),

              // Drop down menu when hover menu TextButton
              submenuContainer(screenWidth, leadingWidth),
            ],
          ),
        );
      },
    );
  }

  // Submenu Container
  Widget submenuContainer(double screenWidth, double leadingWidth) {
    String leadingTitle = "";
    Widget gridView = Container();
    if (_currentMenuState != null) {
      leadingTitle = MenuData.titleMenu[_currentMenuState!];
      gridView = TabletGridView(menuIndex: _currentMenuState!);
    }

    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: AnimatedContainer(
        width: screenWidth,
        height: subMenuHeight,
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
        decoration: const BoxDecoration(
          color: Color(0xFFF4F4F4),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        padding: const EdgeInsets.only(top: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: leadingWidth,
              height: subMenuHeight,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                ),
                // color: Colors.amber,
              ),
              padding: const EdgeInsets.only(left: 180, top: 10),
              child: Text(
                leadingTitle,
                style: TextStyle(
                  fontSize: TabletSize.fontSize.subLeadingTitle,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            gridView,
          ],
        ),
      ),
    );
  }

  // Show all menu dialog
  void showAllMenu(
      BuildContext context, double screenWidth, double screenHeight) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        double marginHorizontal = screenWidth * 0.06;
        double marginVertical = screenHeight * 0.05;
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
                  height: 80,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
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
                      const Text(
                        "전체메뉴",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
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
                          fixedSize: const Size(45, 45),
                          backgroundColor: Colors.white,
                        ),
                        color: AppColor.alertColor,
                        iconSize: 30,
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

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
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                TabletGridView(menuIndex: index),
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
                                thickness: 2.5,
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
