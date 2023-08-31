import 'dart:convert';

import 'package:daum_postcode/src/model/daum_postcode_model.dart';
import 'package:daum_postcode/src/options/daum_postcode_options.dart';
import 'package:flutter/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DaumPostcodeView extends StatelessWidget {
  final void Function(DaumPostcodeModel) onComplete;
  final DaumPostcodeOptions? options;

  const DaumPostcodeView({
    Key? key,
    required this.onComplete,
    this.options,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WebViewController postcodePageWebViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel(
        "onComplete",
        onMessageReceived: _onMessageReceived,
      )
      ..loadRequest(_postcodePageUri());

    return SafeArea(
      child: WebViewWidget(
        controller: postcodePageWebViewController,
      ),
    );
  }

  void _onMessageReceived(JavaScriptMessage message) {
    final model = DaumPostcodeModel.fromJson(jsonDecode(message.message));
    onComplete(model);
  }

  Uri _postcodePageUri() => Uri.https(
        "onehunnitconst.github.io",
        "/daum_postcode/pages/postcode.html",
        options?.toJson(),
      );
}
