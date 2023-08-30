import 'package:daum_postcode/src/options/daum_postcode_theme.dart';
import 'package:json_annotation/json_annotation.dart';

part 'daum_postcode_options.g.dart';

@JsonSerializable(explicitToJson: true)
class DaumPostcodeOptions {
  final String? width;
  final String? height;
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

  DaumPostcodeOptions({
    this.width,
    this.height,
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
  });
}
