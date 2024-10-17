import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:nurse_department/constants/color_constant.dart';
import 'package:nurse_department/constants/desktop_size.dart';
import 'package:nurse_department/constants/menu_data_constant.dart';
import 'package:nurse_department/constants/image_path.dart';

class DesktopLayout extends StatefulWidget {
  const DesktopLayout({super.key});

  @override
  State<DesktopLayout> createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout> {
  List<Color> hoverMenuColor = List.filled(8, Colors.black);
  int? _menuIndex = 0;
  bool _isSubmenuOpen = true;
  double subMenuHeight = 240;

  @override
  Widget build(BuildContext context) {
    // GridView Size
    double gridViewWidth =
        MediaQuery.of(context).size.width * 0.55; // 55% of the screen width
    double gridViewHeight = 140;
    double crossAxisSpacing = 10.0;
    double mainAxisSpacing = 10.0;

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
          for (int i = 0; i < 8; i++)
            SizedBox(
              height: DesktopSize.appBarHeight,
              child: MouseRegion(
                onEnter: (_) => setState(() {
                  hoverMenuColor[i] = AppColor.color;
                  _menuIndex = i;
                  _isSubmenuOpen = true;
                  subMenuHeight = DesktopSize.submenu.maxHeight;
                }),
                onExit: (_) => setState(() {
                  hoverMenuColor[i] = Colors.black;
                  _isSubmenuOpen = false;
                  subMenuHeight = DesktopSize.submenu.minHeight;
                }),
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    overlayColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero),
                  ),
                  child: Text(
                    _getMenuText(i),
                    style: TextStyle(
                      color: hoverMenuColor[i],
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
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
                padding: const EdgeInsets.only(top: 12, left: 10, right: 10),
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
              shape:
                  const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
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
                hoverMenuColor[_menuIndex!] = AppColor.color;
                _isSubmenuOpen = true;
                subMenuHeight = DesktopSize.submenu.maxHeight;
              }),
              onExit: (_) {
                setState(() {
                  hoverMenuColor[_menuIndex!] = Colors.black;
                });
                Future.delayed(const Duration(milliseconds: 300), () {
                  setState(() {
                    subMenuHeight = DesktopSize.submenu.minHeight;
                    _isSubmenuOpen = false;
                  });
                  log('onExit $subMenuHeight');
                });
                log('onExit');
              },
              child: AnimatedContainer(
                width: MediaQuery.of(context).size.width,
                height: subMenuHeight,
                decoration: const BoxDecoration(
                  // color: Colors.red,
                  color: Color(0xFFF4F4F4),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                duration: const Duration(milliseconds: 300),
                curve: Curves.linear,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      height: subMenuHeight,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                        ),
                      ),
                      padding: const EdgeInsets.only(left: 200),
                      child: Center(
                        child: AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 300),
                          style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w800,
                          ),
                          child: Text(
                            _menuIndex != null
                                ? titleMenu[_menuIndex!]
                                : '학과안내',
                          ),
                          curve: Curves.easeOut,
                        ),
                      ),
                    ),
                    if (_menuIndex != null)
                      Container(
                        width: gridViewWidth,
                        height: gridViewHeight,
                        margin: const EdgeInsets.only(top: 80),
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: crossAxisSpacing,
                            mainAxisSpacing: mainAxisSpacing,
                            childAspectRatio: 5,
                          ),
                          itemCount: subMenu[_menuIndex!].length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, i) {
                            String text = subMenu[_menuIndex!][i];
                            return TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              child: Text(
                                text,
                                style: TextStyle(
                                  fontSize: DesktopSize.fontSize.submenu,
                                ),
                              ),
                            );
                          },
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
  }

  Widget _menuButton(String text) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Colors.grey),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  String _getMenuText(int index) {
    return titleMenu[index];
  }
}
