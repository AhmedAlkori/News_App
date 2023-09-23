import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebScreen extends StatelessWidget {

  String url;
  var webController;
  WebScreen(this.url)
  {
     webController=WebViewController()..loadRequest(Uri.parse(url));
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: WebViewWidget(
          controller: webController,
      )
    );
  }
}
