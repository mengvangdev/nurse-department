class LaptopSize {
  // *----- AppBar Height -----
  static const double appBarHeight = 70;
  static const double menuPadding = 15;
  static const double appBarRightPadding = 5;
  static const double appBarLeftPadding = 5;
  // *----- Logo -----
  static const double logoWidth = 300;
  static const double logoHeight = 45.16;
  static const LaptopFontSize fontSize = LaptopFontSize();

  // *----- SubMenu (body) -----
  static const LaptopSubMenuSize submenu = LaptopSubMenuSize();

  static const double searchIconHeight = 70;
  static const double searchIconWidth = 60;

  // all menu button
  static const double allMenuIconSize = 34;
  static const double allMenuHeight = 70;
  static const double allMenuWidth = 60;
}

class LaptopFontSize {
  final double menu = 20;
  final double subLeadingTitle = 40;
  final double submenu = 18;
  const LaptopFontSize();
}

// *----- SubMenu -----
class LaptopSubMenuSize {
  final double maxHeight = 240;
  final double minHeight = 0;
  const LaptopSubMenuSize();
}
