import 'package:nurse_department/resource/resource.dart';

class ResponsiveProvider extends ChangeNotifier {
  final BuildContext context;
  ResponsiveProvider(this.context);

  // appBar or Header
  double appBarHeight = 70;
  double appBarPaddingRight = 50;
  double appBarPaddingLeft = 50;
  double iconMargin = 10;

  double spaceBetweenIcon = 10;

  // logo
  double logoWidth = 310;
  double logoHeight = 40;

  // home button
  double homeButtonHeight = 70;
  double homeButtonWidth = 60;
  double homeButtonFontSize = 18;
  double homeMarginTop = 10;

  // search icon button
  double searchIconWidth = 32;
  double searchIconHeight = 32;
  double searchIconSizeHeight = 60;
  double searchIconSizeWidth = 60;
  double searchIconMargin = 10;

  // menu icon button
  double menuIconWidth = 40;
  double menuIconHeight = 40;
  double menuIconSizeHeight = 70;
  double menuIconSizeWidth = 70;
  double menuIconPaddingTop = 5;

  // menu text button
  double menuTextButtonPadding = 30;
  double menuTextButtonFontSize = 22;

  // menu text button link icon
  double menuTextButtonLinkIconWidth = 20;
  double menuTextButtonLinkIconHeight = 20;

  //----- start submenu -----
  // submenu container
  double subMenuMaxHeight = 200;
  double subMenuMinHeight = 0;
  double submenuPaddingTop = 80;

  // leading subtitle
  double leadingSubtitleWidth = 0.35; // percentage of screen width
  double leadingSubtitleFontSize = 40;
  double leadingSubtitlePaddingLeft = 300;

  // gridview
  double gridViewWidth = 0.55; // percentage of screen width
  double gridViewMarginTop = 10;
  double gridViewTwoRowsHeight = 100;
  double gridViewOneRowHeight = 50;
  int crossAxisCount = 4;
  double crossAxisSpacing = 16.0;
  double mainAxisSpacing = 12.0;

  // submenu text button
  double submenuTextButtonFontSize = 20;

  // submenu text button link icon
  double submenuTextButtonLinkIconWidth = 18;
  double submenuTextButtonLinkIconHeight = 18;

  //----- end submenu -----

  // dialog
  double dialogMarginHorizontal = 0.05; // percentage of screen width
  double dialogMarginVertical = 0.05; // percentage of screen width
  double dialogHeaderHeight = 130;
  double dialogHeaderPaddingHor = 50;
  double dialogHeaderTitleFontSize = 36;
  double closeButtonSizeWidth = 70;
  double closeButtonSizeHeight = 70;
  double closeIconWidth = 50;
  double closeIconHeight = 50;
  double dialogSpaceBetweenHeaderAndList = 20;

  void laptop() {
    notifyListeners();
  }

  void tablet() {
    notifyListeners();
  }
}
