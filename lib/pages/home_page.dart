import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState(); // Changed to public
}

class HomePageState extends State<HomePage> {
  late List<Color> _hoveredButtonColors; // Marked as late

  @override
  void initState() {
    super.initState();
    _hoveredButtonColors = List<Color>.filled(
        8, Colors.black); // Initialize with black for all buttons
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          flexibleSpace: SafeArea(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Image.asset('assets/logo.png', height: 70),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Button 1
                      SizedBox(
                        height: 70,
                        child: MouseRegion(
                          onEnter: (_) => setState(() {
                            _hoveredButtonColors[0] = const Color(0xFF2E3092);
                          }),
                          onExit: (_) => setState(() {
                            _hoveredButtonColors[0] = Colors.black;
                          }),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              overlayColor: Colors
                                  .transparent, // Keep overlay transparent
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero),
                            ),
                            child: Text(
                              '학과안내',
                              style: TextStyle(
                                color: _hoveredButtonColors[
                                    0], // Use hover color for text
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Button 2
                      SizedBox(
                        height: 70,
                        child: MouseRegion(
                          onEnter: (_) => setState(() {
                            _hoveredButtonColors[1] = const Color(0xFF2E3092);
                          }),
                          onExit: (_) => setState(() {
                            _hoveredButtonColors[1] = Colors.black;
                          }),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              overlayColor: Colors
                                  .transparent, // Keep overlay transparent
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero),
                            ),
                            child: Text(
                              '센터',
                              style: TextStyle(
                                color: _hoveredButtonColors[1],
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Button 3
                      SizedBox(
                        height: 70,
                        child: MouseRegion(
                          onEnter: (_) => setState(() {
                            _hoveredButtonColors[2] = const Color(0xFF2E3092);
                          }),
                          onExit: (_) => setState(() {
                            _hoveredButtonColors[2] = Colors.black;
                          }),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              overlayColor: Colors
                                  .transparent, // Keep overlay transparent
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '입학안내',
                                  style: TextStyle(
                                    color: _hoveredButtonColors[2],
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                    width:
                                        5), // Add some space between text and icon
                                SvgPicture.asset(
                                  'assets/icons/link.svg',
                                  colorFilter: ColorFilter.mode(
                                    _hoveredButtonColors[2],
                                    BlendMode.srcIn,
                                  ),
                                  width: 30.0,
                                  height: 30.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Button 4
                      SizedBox(
                        height: 70,
                        child: MouseRegion(
                          onEnter: (_) => setState(() {
                            _hoveredButtonColors[3] = const Color(0xFF2E3092);
                          }),
                          onExit: (_) => setState(() {
                            _hoveredButtonColors[3] = Colors.black;
                          }),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              overlayColor: Colors
                                  .transparent, // Keep overlay transparent
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero),
                            ),
                            child: Text(
                              '학과행정',
                              style: TextStyle(
                                color: _hoveredButtonColors[3],
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Button 5
                      SizedBox(
                        height: 70,
                        child: MouseRegion(
                          onEnter: (_) => setState(() {
                            _hoveredButtonColors[4] = const Color(0xFF2E3092);
                          }),
                          onExit: (_) => setState(() {
                            _hoveredButtonColors[4] = Colors.black;
                          }),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              overlayColor: Colors
                                  .transparent, // Keep overlay transparent
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero),
                            ),
                            child: Text(
                              '학생활동',
                              style: TextStyle(
                                color: _hoveredButtonColors[4],
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Button 6
                      SizedBox(
                        height: 70,
                        child: MouseRegion(
                          onEnter: (_) => setState(() {
                            _hoveredButtonColors[5] = const Color(0xFF2E3092);
                          }),
                          onExit: (_) => setState(() {
                            _hoveredButtonColors[5] = Colors.black;
                          }),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              overlayColor: Colors
                                  .transparent, // Keep overlay transparent
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero),
                            ),
                            child: Text(
                              '취업정보',
                              style: TextStyle(
                                color: _hoveredButtonColors[5],
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Button 7
                      SizedBox(
                        height: 70,
                        child: MouseRegion(
                          onEnter: (_) => setState(() {
                            _hoveredButtonColors[6] = const Color(0xFF2E3092);
                          }),
                          onExit: (_) => setState(() {
                            _hoveredButtonColors[6] = Colors.black;
                          }),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              overlayColor: Colors
                                  .transparent, // Keep overlay transparent
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero),
                            ),
                            child: Text(
                              '교육과정',
                              style: TextStyle(
                                color: _hoveredButtonColors[6],
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Button 8
                      SizedBox(
                        height: 70,
                        child: MouseRegion(
                          onEnter: (_) => setState(() {
                            _hoveredButtonColors[7] = const Color(0xFF2E3092);
                          }),
                          onExit: (_) => setState(() {
                            _hoveredButtonColors[7] = Colors.black;
                          }),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              overlayColor: Colors
                                  .transparent, // Keep overlay transparent
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero),
                            ),
                            child: Text(
                              '간호학과',
                              style: TextStyle(
                                color: _hoveredButtonColors[7],
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // HOME
                      SizedBox(
                        height: 70,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            overlayColor:
                                Colors.transparent, // Keep overlay transparent
                            padding: const EdgeInsets.only(left: 30, top: 12),
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero),
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
                      IconButton(
                        icon: const Icon(CupertinoIcons.search),
                        iconSize: 46,
                        onPressed: () {},
                      ),
                      IconButton(
                          icon: const Icon(Icons.menu), onPressed: () {}),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // Removed body
    );
  }
}
