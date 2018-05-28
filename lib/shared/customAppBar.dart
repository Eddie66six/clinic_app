import 'package:flutter/material.dart';

import '../models/menuItemModel.dart';
import 'backgroundHeaderBar.dart';
import 'defaultHeaderBar.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar(this._menu, this._size, this._scaffoldKey, this._pageSelected,this.title,{this.function,this.logoSize});
  final MenuItemModel _menu;
  final Size _size;
  final GlobalKey<ScaffoldState> _scaffoldKey;
  final Widget _pageSelected;
  final Function function;
  final String title;
  final bool logoSize;
  @override
  Widget build(BuildContext context) {
    return (_menu != null && _menu.headerBackground != null
        ? new BackgroundHeaderBar(
            _pageSelected,
            _scaffoldKey,
            _size,
            _menu.headerBackground,
            _menu.offset,
            _menu.details,
            _menu.header,
            logoSize,
            title,
            function: function,
          )
        : new DefaultHeaderBar(_pageSelected, _scaffoldKey, function, title));
  }
}