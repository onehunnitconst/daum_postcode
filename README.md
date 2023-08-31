# 다음 우편번호 서비스 For Flutter

다음 우편번호 서비스를 Flutter에서 편리하게 사용하기 위한 패키지입니다.

## 사용법
`daum_postcode_view`를 [프로젝트의 pubspec.yaml에 추가](https://pub.dev/packages/daum_postcode_view/install)합니다.

그런 다음 사용하고자 하는 위젯 내부에 다음과 같이 작성합니다.

```dart
DaumPostcodeView(
  onComplete: (model) {
    // onComplete 정의
  },
  options: const DaumPostcodeOptions(
    // options 정의 (선택)
  ),
);
```

## 속성

### onComplete
주소를 선택한 후에 동작하는 콜백 함수를 정의합니다. 주소를 선택할 시 반환하는 JSON 문자열을 Dart 객체로 변환하여 `model` 파라미터로 제공합니다.

해당 모델의 속성은 다음 우편번호 서비스의 [**속성** 항목](https://postcode.map.daum.net/guide#attributes)의 `oncomplete` 콜백에서 제공하는 정보와 일치합니다.

> 구 우편번호 (`postcode`, `postcode1`, `postcode2`, `postcodeSeq`) 속성은 제외하였습니다.

### options
다음 우편번호 서비스를 개인화(Customize)하여 사용하기 위한 옵션입니다.

옵션에 대한 설명은 다음 우편번호 서비스의 [**속성** 항목](https://postcode.map.daum.net/guide#attributes)의 `width`부터 `theme` 까지의 설명을 참조해주세요.

* `theme`
  * 문자열 대신 Dart 기본 UI 패키지의 `Color` 속성을 사용합니다.
  * Color 속성의 Alpha 값은 무시되며, RGB 값만 반영됩니다.
* `themeType`
  * 위의 링크에서 설명하지 않는 항목입니다.
  * 기본 테마(`DaumPostcodeThemeType.defaultTheme`)와 어두운 테마(`DaumPostcodeThemeType.darknessTheme`) 두 가지를 사용할 수 있습니다.
  * `themeType` 속성을 사용할 시 `theme` 속성은 무시됩니다.

> 구 우편번호 관련 속성(`zonecodeOnly`)은 제외하였습니다.

## 사용 예시

```dart
import 'package:flutter/material.dart';
import 'package:daum_postcode_view/daum_postcode_view.dart';

class SearchPostcodePage extends StatelessWidget {
  static const String routeName = '/postcode';

  const SearchPostcodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DaumPostcodeView(
        onComplete: (model) {
          Navigator.of(context).pop(model);
        },
        options: const DaumPostcodeOptions(
          animation: true,
          hideEngBtn: true,
          themeType: DaumPostcodeThemeType.darknessTheme,
        ),
      ),
    );
  }
}
```

## 주의사항

이 패키지는 내부적으로 [webview_flutter](https://pub.dev/packages/webview_flutter) 를 사용하고 있습니다. 따라서 안드로이드에서 사용하는 경우 `android/app/build.gradle`의 `minSdkVersion`을 19 이상으로 설정해야 합니다.

```groovy
android {
    defaultConfig {
        minSdkVersion 19
    }
}
```

안드로이드 Release 모드로 빌드 시에는 `android/app/src/main/AndroidManifest.xml` 에 다음과 같이 권한을 추가하여야 합니다.

```xml
<uses-permission android:name="android.permission.INTERNET"/>
```