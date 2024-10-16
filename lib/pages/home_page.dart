import 'dart:developer';

import 'package:flutter/material.dart';

final List<String> titleMenu = [
  '학과안내',
  '센터',
  '입학안내',
  '학과행정',
  '학생활동',
  '취업정보',
  '교직과정',
  '대학원'
];

// '학과안내',
List<String> departmentInfo = [
  '학과소개',
  '학과장인사말',
  '교육체계',
  '교육철학 및 교표',
  '학과연혁',
  '교수소개',
  '졸업 후 진로',
  '오시는 길',
];

// '센터',
List<String> center = [
  '센터 설명',
];

// '입학안내',
List<String> admissionInfo = [
  '신입학',
  '편입학',
  '장학제도',
];

// '학과행정',
List<String> departmentAdmin = [
  '공지사항',
  '학사일정',
  '교과과장',
  '교직과정',
  '자료실',
  '간호교육인증평가',
];

// '학생활동',
List<String> studentActivities = [
  '학생회사진',
  '사진첩',
  '학과동아리',
];

// '취업정보',
List<String> tmploymentInfo = [
  '국가고시자격증',
  '취업정보시이트',
  '취업공고문',
];

// '교직과정',
List<String> teachingCourse = [
  '교육과정',
  '공지사항',
];

// '대학원',
List<String> departmentNursing = [
  '교육과정',
  '석사존문',
  '졸업자격시험',
  '대학원 공지사항',
  '행정서식',
];

List<List<String>> subMenu = [
  departmentInfo,
  center,
  admissionInfo,
  departmentAdmin,
  studentActivities,
  tmploymentInfo,
  teachingCourse,
  departmentNursing,
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  double appBarHeight = 70; // header height
  late List<Color> _hoverMenuColor;
  bool _isSubmenuOpen = false;
  int? _menuIndex;
  double subMenuHeight = 0;
  double subMenuMinHeight = 0;
  double subMenuMaxHeight = 240;
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
        toolbarHeight: appBarHeight,
        backgroundColor: Colors.white,
        titleSpacing: 50,
        title: Row(
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 310,
              height: 40,
            ),
          ],
        ),
        actions: [
          Container(
            child: Row(
              children: [
                for (int i = 0; i < 8; i++)
                  SizedBox(
                    height: appBarHeight,
                    child: MouseRegion(
                      onEnter: (_) => setState(() {
                        _hoverMenuColor[i] = const Color(0xFF2E3092);
                        _menuIndex = i;
                        _isSubmenuOpen = true;
                        subMenuHeight = subMenuMaxHeight;
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
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                const SizedBox(width: 10),

                // HOME button
                SizedBox(
                  height: appBarHeight,
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
                    fixedSize: const Size(64, 70),
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
                    backgroundColor: const Color(0xFF2E3092),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero),
                    fixedSize: const Size(64, 70),
                  ),
                ),
                const SizedBox(width: 35),
              ],
            ),
          ),
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
              color: Colors.black26, // Semi-transparent color
            ),

          // Drop down menu when hover menu TextButton
          Positioned(
            // Use Positioned to control the placement
            top: 0, // Position it at the top
            left: 0,
            right: 0,
            child: MouseRegion(
              onEnter: (_) => setState(() {
                _hoverMenuColor[_menuIndex!] = const Color(0xFF2E3092);
                _isSubmenuOpen = true;
                subMenuHeight = subMenuMaxHeight;
              }),
              onExit: (_) {
                setState(() {
                  _isSubmenuOpen = false;
                  _hoverMenuColor[_menuIndex!] = Colors.black;
                });
                Future.delayed(const Duration(milliseconds: 300), () {
                  setState(() {
                    subMenuHeight = subMenuMinHeight;
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
