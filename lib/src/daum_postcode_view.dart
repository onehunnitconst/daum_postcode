import 'dart:convert';

import 'package:daum_postcode/src/model/daum_postcode_model.dart';
import 'package:flutter/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DaumPostcodeView extends StatelessWidget {
  final void Function(DaumPostcodeModel) onComplete;

  const DaumPostcodeView({
    Key? key,
    required this.onComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WebViewController postcodePageWebViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel(
        "onComplete",
        onMessageReceived: (message) {
          final model = DaumPostcodeModel.fromJson(jsonDecode(message.message));
          onComplete(model);
        },
      )
      ..loadRequest(
        Uri.https("onehunnitconst.github.io", "/FlutterDaumPostalCode/index.html"),
      );

    return SafeArea(
      child: WebViewWidget(
        controller: postcodePageWebViewController,
      ),
    );
  }
}
