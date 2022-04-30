import 'package:flutter/material.dart';

/// Grid Formula : Lets suppose the entire width is 360px
/// Default columns width wise : 36 i.e. 360 / 36 = 10px square units
/// to calculate the per square unit as per device is x = Width of the device / number of columns(36)
class GridUtil {
  static late double _width;

  static Orientation? _orientation;

  void init(BoxConstraints constraints, Orientation orientation) {
    _orientation = orientation;
    if (orientation == Orientation.portrait) {
      _width = constraints.maxWidth;
    } else {
      _width = constraints.maxHeight;
    }
  }

  static dynamic sizeTo(var i) {
    return (i * (_width / 360));
  }

  static Orientation? get orientation => _orientation;
}

extension GridExt on double {
  ///Extention on double to convert the double value.
  ///Whenever you use grid layout then use this method like this => [20.0.s]
  double get s => GridUtil.sizeTo(this);
}
