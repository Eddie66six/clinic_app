import 'package:flutter/widgets.dart';

class MenuItemModel{
  MenuItemModel(this.title, this.icon, this.pageType, this.headerBackground, this.messageHeader);
  String title;
  String icon;
  Type pageType;
  String headerBackground;
  Widget messageHeader;
}