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
        log("isCurrentState: $isCurrentState");
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: DesktopSize.appBarHeight,
            titleSpacing: 50,
            title: Image.asset(
              ImagePath.logo,
              width: DesktopSize.logoWidth,
              height: DesktopSize.logoHeight,
              fit: BoxFit.contain,
            ),
            actions: [
              for (int index = 0; index < MenuData.titleMenu.length; index++)
                if (menuProvider.menuState == 3)
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
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        child: index != 2
                            ? Text(
                                _getMenuText(index),
                                style: TextStyle(
                                  color: isCurrentState &&
                                          menuProvider.menuState == index
                                      ? AppColor.color
                                      : Colors.black,
                                  fontSize: DesktopSize.fontSize.menu,
                                  fontWeight: menuProvider.menuState == index
                                      ? FontWeight.w800
                                      : FontWeight.bold,
                                ),
                              )
                            : Row(
                                children: [
                                  Text(
                                    _getMenuText(index),
                                    style: TextStyle(
                                      color: hoverMenuColor[index],
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
                onPressed: () {},
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
                                "Hello",
                                style: const TextStyle(
                                  fontSize: 40,
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

                                  return MouseRegion(
                                    onEnter: (_) => setState(() {
                                      hoverMenuColor[submenuIndex] =
                                          AppColor.color;
                                    }),
                                    onExit: (_) => setState(() {
                                      hoverMenuColor[submenuIndex] =
                                          Colors.black;
                                    }),
                                    child: AnimatedOpacity(
                                      opacity: isGridVisible ? 1.0 : 0.0,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      child: TextButton(
                                        onPressed: () {
                                          menuProvider.menuState =
                                              _currentMenuState!;
                                          menuProvider.submenuState =
                                              submenuIndex;
                                        },
                                        style: TextButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          foregroundColor: Colors.black,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            side: BorderSide(
                                              // color:  ?AppColor.color: Colors.white,
                                              width: 2,
                                            ),
                                          ),
                                          padding: EdgeInsets.zero,
                                        ),
                                        child: Text(
                                          text,
                                          style: TextStyle(
                                            fontSize:
                                                DesktopSize.fontSize.submenu,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
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

  String _getMenuText(int index) {
    return MenuData.titleMenu[index];
  }
}
