class DesktopSize {
  // *----- AppBar Height -----
  static const double appBarHeight = 70;
  static const double menuPadding = 30;
  // *----- Logo -----
  static const double logoWidth = 350;
  static const double logoHeight = 45.16;
  static const FontSize fontSize = FontSize();

  // *----- SubMenu (body) -----
  static const SubMenuSize submenu = SubMenuSize();
}

class FontSize {
  final double menu = 22;
  final double subLeadingTitle = 40;
  final double submenu = 20;
  const FontSize();
}

// *----- SubMenu -----
class SubMenuSize {
  final double maxHeight = 240;
  final double minHeight = 0;
  const SubMenuSize();
}
