import 'package:flutter/widgets.dart';

class MenuItemModel{
  MenuItemModel(this.title, this.icon, this.pageType, this.headerBackground, this.header, this.details, this.offset);
  String title;
  String icon;
  Type pageType;
  String headerBackground;
  Widget header;
  Widget details;
  double offset;
}