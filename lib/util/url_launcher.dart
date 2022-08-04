import 'package:url_launcher/url_launcher.dart';

class UrlLauncherUtil {
  static Future<bool> launchUrl(String url, {forceWebView = false}) async {
    final canLaunchUrl = await canLaunch(url);
    if (canLaunchUrl) {
      return launch(url, forceWebView: forceWebView);
    } else {
      return false;
    }
  }
}
