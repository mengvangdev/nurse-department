import 'dart:developer';
import 'package:nurse_department/resource/resource.dart';

class DesktopLayout extends StatefulWidget {
  const DesktopLayout({super.key});

  @override
  State<DesktopLayout> createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout> {
  List<Color> hoverMenuColor = List.filled(8, Colors.black);
  int? _currentMenuState;
  bool _isSubmenuOpen = false;
  double subMenuHeight = 0;
  bool isGridVisible = false;

  @override
  Widget build(BuildContext context) {
    // Calculate sizes
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final leadingWidth = screenWidth * 0.35;
    final gridViewWidth = screenWidth * 0.55;
    double gridViewHeight = 100; // Subtracting top margin

    // Calculate grid dimensions
    const int crossAxisCount = 4;
    const double crossAxisSpacing = 16.0;
    const double mainAxisSpacing = 12.0;

    // Calculate item width and height
    final double itemWidth =
        (gridViewWidth - (crossAxisCount - 1) * crossAxisSpacing) /
            crossAxisCount;
    final double itemHeight =
        (gridViewHeight - mainAxisSpacing) / 2; // Assuming 2 rows

    return Consumer<MenuProvider>(
      builder: (context, menuProvider, child) {
        bool isCurrentState = menuProvider.menuState != null;

        return Scaffold(
          appBar: AppBar(
            toolbarHeight: DesktopSize.appBarHeight,
            titleSpacing: 50,
            title: Image.asset(
              ImagePath.logo,
              width: DesktopSize.logoWidth,
              height: DesktopSize.logoHeight,
              // fit: BoxFit.contain,
            ),
            actions: [
              for (int index = 0; index < MenuData.titleMenu.length; index++)
                SizedBox(
                  height: DesktopSize.appBarHeight,
                  child: MouseRegion(
                    onEnter: (_) => setState(() {
                      hoverMenuColor[index] = AppColor.color;
                      _currentMenuState = index;
                      _isSubmenuOpen = true;
                      subMenuHeight = DesktopSize.submenu.maxHeight;
                      isGridVisible = true;
                    }),
                    onExit: (_) => setState(() {
                      hoverMenuColor[index] = Colors.black;
                      _isSubmenuOpen = false;
                      subMenuHeight = DesktopSize.submenu.minHeight;
                    }),
                    child: TextButton(
                      onPressed: null,
                      style: TextButton.styleFrom(
                        overlayColor: Colors.transparent,
                        padding: const EdgeInsets.symmetric(
                            horizontal: DesktopSize.menuPadding),
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      child: index != 2
                          ? Text(
                              getMenuText(index),
                              style: TextStyle(
                                color: isCurrentState &&
                                        menuProvider.menuState == index
                                    ? AppColor.color
                                    : hoverMenuColor[index],
                                fontSize: DesktopSize.fontSize.menu,
                                fontWeight: menuProvider.menuState == index
                                    ? FontWeight.w800
                                    : FontWeight.bold,
                              ),
                            )
                          : Row(
                              children: [
                                Text(
                                  getMenuText(index),
                                  style: TextStyle(
                                    color: isCurrentState &&
                                            menuProvider.menuState == index
                                        ? AppColor.color
                                        : hoverMenuColor[index],
                                    fontSize: DesktopSize.fontSize.menu,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SvgPicture.asset(
                                  ImagePath.menuIcon,
                                  width: 22,
                                  height: 22,
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
              const SizedBox(width: 15),

              // HOME button
              SizedBox(
                height: DesktopSize.appBarHeight,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding:
                        const EdgeInsets.only(top: 12, left: 10, right: 10),
                    overlayColor: Colors.transparent,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: const Text(
                    'HOME',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),

              // Search header button
              IconButton(
                onPressed: () {},
                style: IconButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  fixedSize: const Size(64, DesktopSize.appBarHeight),
                ),
                padding: const EdgeInsets.only(top: 10),
                icon: Image.asset(
                  'assets/images/header1_search.png',
                  width: 50,
                  height: 50,
                ),
              ),

              const SizedBox(width: 10),

              // Show all menu button
              IconButton(
                onPressed: () {
                  showAllMenu(context, screenWidth, screenHeight);
                },
                icon: const Icon(Icons.menu),
                color: Colors.white,
                iconSize: 38,
                padding: const EdgeInsets.only(top: 5),
                style: IconButton.styleFrom(
                  backgroundColor: AppColor.color,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero),
                  fixedSize: const Size(64, DesktopSize.appBarHeight),
                ),
              ),
              const SizedBox(width: 35),
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
              Positioned(
                // Use Positioned to control the placement
                top: 0, // Position it at the top
                left: 0,
                right: 0,
                child: MouseRegion(
                  onEnter: (_) => setState(() {
                    hoverMenuColor[_currentMenuState!] = AppColor.color;
                    _isSubmenuOpen = true;
                    subMenuHeight = DesktopSize.submenu.maxHeight;
                  }),
                  onExit: (_) {
                    setState(() {
                      hoverMenuColor[_currentMenuState!] = Colors.black;
                      subMenuHeight = DesktopSize.submenu.minHeight;
                      _isSubmenuOpen = false;
                      isGridVisible = false;
                    });
                  },
                  child: AnimatedContainer(
                    width: screenWidth,
                    height: subMenuHeight,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF4F4F4),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.linear,
                    child: Row(
                      children: [
                        Container(
                          width: leadingWidth,
                          height: subMenuHeight,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                            ),
                            // color: Colors.red,
                          ),
                          padding: const EdgeInsets.only(left: 200),
                          child: Center(
                            child: AnimatedOpacity(
                              opacity: isGridVisible ? 1.0 : 0.0,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeOut,
                              child: Text(
                                _currentMenuState != null
                                    ? getMenuText(_currentMenuState!)
                                    : '',
                                style: TextStyle(
                                  fontSize:
                                      DesktopSize.fontSize.subLeadingTitle,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (_currentMenuState != null)
                          AnimatedOpacity(
                            opacity: isGridVisible ? 1.0 : 0.0,
                            duration: const Duration(milliseconds: 200),
                            child: Container(
                              width: gridViewWidth,
                              height: gridViewHeight,
                              // color: Colors.red,
                              margin: const EdgeInsets.only(top: 50),
                              child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: crossAxisCount,
                                  crossAxisSpacing: crossAxisSpacing,
                                  mainAxisSpacing: mainAxisSpacing,
                                  childAspectRatio: itemWidth / itemHeight,
                                ),
                                itemCount:
                                    MenuData.subMenu[_currentMenuState!].length,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, submenuIndex) {
                                  String text =
                                      MenuData.subMenu[_currentMenuState!]
                                          [submenuIndex];

                                  return DesktopSubmenuButton(
                                    text: text,
                                    currentMenuState: _currentMenuState!,
                                    submenuIndex: submenuIndex,
                                  );
                                },
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String getMenuText(int index) {
    return MenuData.titleMenu[index];
  }

  void showAllMenu(
      BuildContext context, double screenWidth, double screenHeight) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        double marginHorizontal = screenWidth * 0.05;
        double marginVertical = screenHeight * 0.05;
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
                  height: 130,
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
                      // ignore: use_build_context_synchronously
                      const Text(
                        "전체메뉴",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
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
                          fixedSize: const Size(70, 70),
                          backgroundColor: Colors.white,
                        ),
                        color: AppColor.alertColor,
                        iconSize: 38,
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                ),

                // Menu List
                Expanded(
                  child: ListView.builder(
                    itemCount: MenuData.titleMenu.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: screenWidth - marginHorizontal,
                            height:
                                MenuData.subMenu[index].length > 4 ? 140 : 80,
                            color: Colors.amber,
                            margin: EdgeInsets.symmetric(
                              horizontal: marginHorizontal,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 50,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  MenuData.titleMenu[index],
                                  style: const TextStyle(
                                    fontSize: 30,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                DesktopGridview(menuIndex: index),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
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
                          SizedBox(height: 10),
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
        return SlideTransition(
          position: Tween<Offset>(
            begin: Offset(0, 1), // Slide from bottom
            end: Offset(0, 0),
          ).animate(animation),
          child: child,
        );
      },
    );
  }
}
