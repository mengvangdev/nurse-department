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
    return Consumer<ResponsiveProvider>(
      builder: (context, responsive, child) {
        final gridViewWidth =
            responsive.gridViewWidth * MediaQuery.of(context).size.width;
        double gridViewTwoRowsHeight = responsive.gridViewTwoRowsHeight;
        double gridViewOneRowHeight = responsive.gridViewOneRowHeight;

        // Calculate grid dimensions
        int crossAxisCount = responsive.crossAxisCount.toInt();
        double crossAxisSpacing = responsive.crossAxisSpacing;
        double mainAxisSpacing = responsive.mainAxisSpacing;
        // Calculate item width and height
        var itemWidth =
            (gridViewWidth - (crossAxisCount - 1) * crossAxisSpacing) /
                crossAxisCount;
        var itemHeight =
            (gridViewTwoRowsHeight - mainAxisSpacing) / 2; // Assuming 2 rows
        var childAspectRatio = itemWidth / itemHeight;

        bool isTwoRows =
            MenuData.subMenu[widget.menuIndex].length > crossAxisCount;

        var gridViewHeight =
            isTwoRows ? gridViewTwoRowsHeight : gridViewOneRowHeight;

        return Container(
          width: gridViewWidth,
          height: gridViewHeight,
          // color: Colors.red,
          margin: EdgeInsets.only(
            top: responsive.gridViewMarginTop,
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
              return DesktopSubmenuButton(
                text: text,
                currentMenuState: widget.menuIndex,
                submenuIndex: index,
              );
            },
          ),
        );
      },
    );
  }
}
