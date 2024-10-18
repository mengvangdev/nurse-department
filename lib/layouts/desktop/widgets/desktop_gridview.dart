import 'package:nurse_department/resource/resource.dart';

class DesktopGridview extends StatefulWidget {
  const DesktopGridview({super.key, required this.menuIndex});

  final int menuIndex;

  @override
  State<DesktopGridview> createState() => _DesktopGridviewState();
}

class _DesktopGridviewState extends State<DesktopGridview> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
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
    return Container(
      width: gridViewWidth,
      height: gridViewHeight,
      color: Colors.red,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: crossAxisSpacing,
          mainAxisSpacing: mainAxisSpacing,
          childAspectRatio: itemWidth / itemHeight,
        ),
        itemCount: MenuData.subMenu[widget.menuIndex].length,
        itemBuilder: (context, index) {
          String text = MenuData.subMenu[0][index];
          return DesktopSubmenuButton(
            text: text,
            currentMenuState: 0,
            submenuIndex: index,
          );
        },
      ),
    );
  }
}
