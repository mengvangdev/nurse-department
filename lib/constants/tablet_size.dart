class TabletSize {
  // *----- AppBar Height -----
  static const double appBarHeight = 50;
  static const double menuPadding = 10;
  static const double appBarRightPadding = 5;
  static const double appBarLeftPadding = 5;
  // *----- Logo -----
  static const double logoWidth = 300;
  static const double logoHeight = 45.16;
  static const TabletFontSize fontSize = TabletFontSize();

  // *----- SubMenu (body) -----
  static const TabletSubMenuSize submenu = TabletSubMenuSize();

  static const double searchIconHeight = 50;
  static const double searchIconWidth = 40;

  // all menu button
  static const double allMenuIconSize = 30;
  static const double allMenuHeight = 50;
  static const double allMenuWidth = 50;
}

class TabletFontSize {
  final double menu = 16;
  final double subLeadingTitle = 24;
  final double submenu = 14;
  const TabletFontSize();
}

// *----- SubMenu -----
class TabletSubMenuSize {
  final double maxHeight = 150;
  final double minHeight = 0;
  const TabletSubMenuSize();
}
