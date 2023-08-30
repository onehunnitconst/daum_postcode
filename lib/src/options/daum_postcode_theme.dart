import 'dart:ui';

class DaumPostcodeTheme {
  final Color? bgColor;
  final Color? searchBgColor;
  final Color? contentBgColor;
  final Color? pageBgColor;
  final Color? textColor;
  final Color? queryTextColor;
  final Color? postcodeTextColor;
  final Color? emphTextColor;
  final Color? outlineColor;

  const DaumPostcodeTheme({
    this.bgColor,
    this.searchBgColor,
    this.contentBgColor,
    this.pageBgColor,
    this.textColor,
    this.queryTextColor,
    this.postcodeTextColor,
    this.emphTextColor,
    this.outlineColor,
  });

  static Map<String, dynamic> toJson(DaumPostcodeTheme instance) => {
    'bgColor': _colorToHexString(instance.bgColor),
    'searchBgColor': _colorToHexString(instance.searchBgColor),
  }

  static String _colorToHexString(Color? color) => color != null ? '#'
    '${color.red.toRadixString(16).padLeft(2, '0')}'
    '${color.green.toRadixString(16).padLeft(2, '0')}'
    '${color.blue.toRadixString(16).padLeft(2, '0')}'.toUpperCase() : '';
}
