import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:nurse_department/constants/color_constant.dart';
import 'package:nurse_department/constants/menu_data_constant.dart';
import 'package:nurse_department/constants/size_data_constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late List<Color> _hoverMenuColor;
  bool _isSubmenuOpen = false;
  int? _menuIndex;
  double subMenuHeight = 0;
  double subMenuMinHeight = 0;

  double crossAxisSpacing = 20;
  double mainAxisSpacing = 14;

  Color fontColor = Colors.white;

  @override
  void initState() {
    super.initState();
    _hoverMenuColor = List<Color>.filled(8, Colors.black);
  }

  @override
  Widget build(BuildContext context) {
    double gridWidth =
        MediaQuery.of(context).size.width * 0.55; // 55% of the screen width
    double gridHeight = 140;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: AppBarSize.height,
        titleSpacing: 50,
        title: Image.asset(
          'assets/images/logo.png',
          width: LogoSize.width,
          height: LogoSize.height,
          fit: BoxFit.contain,
        ),
        actions: [
          for (int i = 0; i < 8; i++)
            SizedBox(
              height: AppBarSize.height,
              child: MouseRegion(
                onEnter: (_) => setState(() {
                  _hoverMenuColor[i] = AppColor.color;
                  _menuIndex = i;
                  _isSubmenuOpen = true;
                  subMenuHeight = SubMenuSize.height;
                  fontColor = Colors.black;
                }),
                onExit: (_) => setState(() {
                  _hoverMenuColor[i] = Colors.black;
                  _isSubmenuOpen = false;
                  // Remove these lines:
                  subMenuHeight = subMenuMinHeight;

                  // fontColor = Color(0xFFF4F4F4);
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
                      color: _hoverMenuColor[i],
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
            height: AppBarSize.height,
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
              fixedSize: const Size(64, AppBarSize.height),
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
              fixedSize: const Size(64, AppBarSize.height),
            ),
          ),
          const SizedBox(width: 35),
        ],
      ),
      body: Stack(
        children: [
          // Body Content
          Container(
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
                _hoverMenuColor[_menuIndex!] = AppColor.color;
                _isSubmenuOpen = true;
                subMenuHeight = SubMenuSize.height;
              }),
              onExit: (_) {
                setState(() {
                  _hoverMenuColor[_menuIndex!] = Colors.black;
                });
                Future.delayed(const Duration(milliseconds: 300), () {
                  setState(() {
                    subMenuHeight = subMenuMinHeight;
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
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                        ),
                      ),
                      padding: const EdgeInsets.only(left: 200),
                      child: Center(
                        child: AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 300),
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w800,
                            color: fontColor,
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
                        // color: Colors.blue,
                        width: gridWidth,
                        height: gridHeight,
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
                                style: const TextStyle(
                                  fontSize: 20,
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
