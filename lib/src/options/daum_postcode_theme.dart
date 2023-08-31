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

  Map<String, dynamic> toJson() => {
        'bgColor': _colorToHexString(bgColor),
        'searchBgColor': _colorToHexString(searchBgColor),
        'contentBgColor': _colorToHexString(contentBgColor),
        'pageBgColor': _colorToHexString(pageBgColor),
        'textColor': _colorToHexString(queryTextColor),
        'queryTextColor': _colorToHexString(queryTextColor),
        'postcodeTextColor': _colorToHexString(postcodeTextColor),
        'emphTextColor': _colorToHexString(emphTextColor),
        'outlineColor': _colorToHexString(outlineColor),
      };

  factory DaumPostcodeTheme.fromJson(Map<String, dynamic> json) =>
      DaumPostcodeTheme(
        bgColor: _hexStringToColor(json['bgColor']),
        searchBgColor: _hexStringToColor(json['searchBgColor']),
        contentBgColor: _hexStringToColor(json['contentBgColor']),
        pageBgColor: _hexStringToColor(json['pageBgColor']),
        textColor: _hexStringToColor(json['textBgColor']),
        queryTextColor: _hexStringToColor(json['queryTextColor']),
        postcodeTextColor: _hexStringToColor(json['postcodeTextColor']),
        emphTextColor: _hexStringToColor(json['emphTextColor']),
        outlineColor: _hexStringToColor(json['outlineColor']),
      );

  String _colorToHexString(Color? color) => color != null
      ? '#'
              '${color.red.toRadixString(16).padLeft(2, '0')}'
              '${color.green.toRadixString(16).padLeft(2, '0')}'
              '${color.blue.toRadixString(16).padLeft(2, '0')}'
          .toUpperCase()
      : '';

  static Color? _hexStringToColor(String? colorValue) =>
      colorValue != null && colorValue.isNotEmpty
          ? Color(int.parse("0xFF${colorValue.substring(1)}", radix: 16))
          : null;
}
