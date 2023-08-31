import 'dart:convert';

import 'package:daum_postcode/src/model/daum_postcode_model.dart';
import 'package:daum_postcode/src/options/daum_postcode_options.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DaumPostcodeView extends StatefulWidget {
  final void Function(DaumPostcodeModel) onComplete;
  final DaumPostcodeOptions? options;

  const DaumPostcodeView({
    Key? key,
    required this.onComplete,
    this.options,
  }) : super(key: key);

  @override
  State<DaumPostcodeView> createState() => _DaumPostcodeViewState();
}

class _DaumPostcodeViewState extends State<DaumPostcodeView> {
  bool _isLoading = true;
  late final WebViewController _postcodePageWebViewController;

  @override
  void initState() {
    super.initState();
    _postcodePageWebViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel(
        "onComplete",
        onMessageReceived: _onMessageReceived,
      )
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: _onPageFinished,
        ),
      )
      ..loadRequest(_postcodePageUri());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        // fit: StackFit.expand,
        children: [
          WebViewWidget(
            controller: _postcodePageWebViewController,
          ),
          if (_isLoading) _loadingWidget(),
        ],
      ),
    );
  }

  Widget _loadingWidget() => const Center(child: CircularProgressIndicator());

  void _onPageFinished(String message) {
    setState(() {
      _isLoading = false;
    });
  }

  void _onMessageReceived(JavaScriptMessage message) {
    final model = DaumPostcodeModel.fromJson(jsonDecode(message.message));
    widget.onComplete(model);
  }

  Uri _postcodePageUri() => Uri.https(
        "onehunnitconst.github.io",
        "/daum_postcode/pages/postcode.html",
        widget.options?.toJson(),
      );
}
