import 'package:flutter/material.dart';

class SystemColors {
  //system
  static const PRIMARY_SWATCH = Colors.blue;
  //buttons
  static const ACCEPT_BUTTON = const Color.fromARGB(255, 20, 133, 204);
  static const ACCEPT_BUTTON_LABEL = const Color.fromARGB(255, 255, 255, 255);

  static const CANCEL_BUTTON = const Color.fromARGB(255, 178, 18, 18);

  static const ALERT_BUTTON = const Color.fromARGB(255, 255, 191, 5);
  //label

  //menu
  static const TOP_MENU_BACKGROUND = const Color.fromARGB(255, 20, 133, 204);
  static const SELECTED_MENU_BACKGROUND = const Color.fromARGB(255, 161,206,234);

  //progress bar
  static const PROGRESS_BAR_BACKGROUND =  Colors.grey;
  static const PROGRESS_BAR_STATUS =  PRIMARY_SWATCH;
}

class SystemRadius {
  //buttons
  static const NORMAL_BUTTON =
      const BorderRadius.all(const Radius.circular(5.0));
}