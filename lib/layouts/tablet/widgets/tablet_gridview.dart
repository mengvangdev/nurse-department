import 'package:nurse_department/resource/resource.dart';

class TabletGridView extends StatefulWidget {
  const TabletGridView({super.key, required this.menuIndex});

  final int menuIndex;

  @override
  State<TabletGridView> createState() => TabletGridViewState();
}

class TabletGridViewState extends State<TabletGridView> {
  @override
  Widget build(BuildContext context) {
    final gridViewWidth = MediaQuery.of(context).size.width * 0.55;
    double gridViewTwoRowsHeight = 90;
    double gridViewOneRowHeight = 45;

    // Calculate grid dimensions
    int crossAxisCount = 4;
    double crossAxisSpacing = 14.0;
    double mainAxisSpacing = 10.0;
    // Calculate item width and height
    var itemWidth = (gridViewWidth - (crossAxisCount - 1) * crossAxisSpacing) /
        crossAxisCount;
    var itemHeight =
        (gridViewTwoRowsHeight - mainAxisSpacing) / 2; // Assuming 2 rows
    var childAspectRatio = itemWidth / itemHeight;

    bool isTwoRows = MenuData.subMenu[widget.menuIndex].length > crossAxisCount;

    var gridViewHeight =
        isTwoRows ? gridViewTwoRowsHeight : gridViewOneRowHeight;

    return Container(
      width: gridViewWidth,
      height: gridViewHeight,
      margin: const EdgeInsets.only(
        top: 10,
      ),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: crossAxisSpacing,
          mainAxisSpacing: mainAxisSpacing,
          childAspectRatio: childAspectRatio,
        ),
        itemCount: MenuData.subMenu[widget.menuIndex].length,
        itemBuilder: (context, index) {
          String text = MenuData.subMenu[widget.menuIndex][index];
          return LaptopSubmenuButton(
            text: text,
            currentMenuState: widget.menuIndex,
            submenuIndex: index,
          );
        },
      ),
    );
  }
}
