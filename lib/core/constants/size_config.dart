import 'package:flutter/widgets.dart';

const double _baseWidth = 375.0;
const double _baseHeight = 812.0;

extension SizeConfig on BuildContext {
  double sw(double value) => value * MediaQuery.of(this).size.width / _baseWidth;
  double sh(double value) => value * MediaQuery.of(this).size.height / _baseHeight;
  double sp(double value) => value * MediaQuery.of(this).size.width / _baseWidth;
}
