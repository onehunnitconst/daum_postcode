import 'package:daum_postcode/src/options/daum_postcode_theme.dart';
import 'package:flutter/widgets.dart';

enum DaumPostcodeThemeType {
  defaultTheme(value: DaumPostcodeTheme(
    bgColor: Color(0xFFECECEC),
    searchBgColor: Color(0xFFFFFFFF),
    contentBgColor: Color(0xFFFFFFFF),
    pageBgColor: Color(0xFFFAFAFA),
    textColor: Color(0xFF333333),
    queryTextColor: Color(0xFF222222),
    postcodeTextColor: Color(0xFFFA4256),
    emphTextColor: Color(0xFF008BD3),
    outlineColor: Color(0xFFE0E0E0),
  )),
  darknessTheme(value: DaumPostcodeTheme(
    bgColor: Color(0xFF162525),
    searchBgColor: Color(0xFF162525),
    contentBgColor: Color(0xFF162525),
    pageBgColor: Color(0xFF162525),
    textColor: Color(0xFFFFFFFF),
    queryTextColor: Color(0xFFFFFFFF),
    postcodeTextColor: Color(0xFFFA4256),
    emphTextColor: Color(0xFF008BD3),
    outlineColor: Color(0xFF444444),
  ));

  final DaumPostcodeTheme value;

  const DaumPostcodeThemeType({required this.value});
}
