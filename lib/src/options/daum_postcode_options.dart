import 'dart:convert';

import 'daum_postcode_theme.dart';
import 'daum_postcode_theme_type.dart';

class DaumPostcodeOptions {
  final String width;
  final String height;
  final bool? animation;
  final bool? focusInput;
  final bool? autoMappingRoad;
  final bool? autoMappingJibun;
  final bool? shorthand;
  final int? pleaseReadGuide;
  final int? pleaseReadGuideTimer;
  final int? maxSuggestItems;
  final bool? showModeHName;
  final bool? hideMapBtn;
  final bool? hideEngBtn;
  final bool? alwaysShowEngAddr;
  final bool? submitMode;
  final bool? useBannerLink;
  final DaumPostcodeTheme? theme;
  final DaumPostcodeThemeType? themeType;

  const DaumPostcodeOptions({
    this.width = '100%',
    this.height = '100%',
    this.animation,
    this.focusInput,
    this.autoMappingRoad,
    this.autoMappingJibun,
    this.shorthand,
    this.pleaseReadGuide,
    this.pleaseReadGuideTimer,
    this.maxSuggestItems,
    this.showModeHName,
    this.hideMapBtn,
    this.hideEngBtn,
    this.alwaysShowEngAddr,
    this.submitMode,
    this.useBannerLink,
    this.theme,
    this.themeType,
  });

  Map<String, dynamic> toJson() => {
        'width': width,
        'height': height,
        'animation': animation?.toString(),
        'focusInput': focusInput?.toString(),
        'autoMappingRoad': autoMappingRoad?.toString(),
        'autoMappingJibun': autoMappingJibun?.toString(),
        'shorthand': shorthand?.toString(),
        'pleaseReadGuide': pleaseReadGuide?.toString(),
        'pleaseReadGuideTimer': pleaseReadGuideTimer?.toString(),
        'maxSuggestItems': maxSuggestItems?.toString(),
        'showModeHName': showModeHName?.toString(),
        'hideMapBtn': hideMapBtn?.toString(),
        'hideEngBtn': hideEngBtn?.toString(),
        'alwaysShowEngAddr': alwaysShowEngAddr?.toString(),
        'submitMode': submitMode?.toString(),
        'useBannerLink': useBannerLink?.toString(),
        'theme': jsonEncode(
            themeType != null ? themeType!.value.toJson() : theme?.toJson()),
      };

  factory DaumPostcodeOptions.fromJson(Map<String, dynamic> json) =>
      DaumPostcodeOptions(
        width: json['width'] as String,
        height: json['height'] as String,
        animation: json['animation'] as bool?,
        focusInput: json['focusInput'] as bool?,
        autoMappingRoad: json['autoMappingRoad'] as bool?,
        autoMappingJibun: json['autoMappingJibun'] as bool?,
        shorthand: json['shorthand'] as bool?,
        pleaseReadGuide: json['pleaseReadGuide'] as int?,
        pleaseReadGuideTimer: json['pleaseReadGuideTimer'] as int?,
        maxSuggestItems: json['maxSuggestItems'] as int?,
        showModeHName: json['showModeHName'] as bool?,
        hideMapBtn: json['hideMapBtn'] as bool?,
        hideEngBtn: json['hideEngBtn'] as bool?,
        alwaysShowEngAddr: json['alwaysShowEngAddr'] as bool?,
        submitMode: json['submitMode'] as bool?,
        useBannerLink: json['useBannerLink'] as bool?,
        theme: json['theme'] == null
            ? null
            : DaumPostcodeTheme.fromJson(json['theme'] as Map<String, dynamic>),
      );
}
