import 'dart:async';
import 'dart:io' as io;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../util/url_launcher.dart';

class WebViewPage extends StatefulWidget {
  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> with WidgetsBindingObserver {

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.black));
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return const Scaffold(body: WebViewContent());
    });
  }
}

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueAccent,
        child: const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
      ),
    );
  }
}

class WebViewContent extends StatefulWidget {
  const WebViewContent({Key? key}) : super(key: key);

  @override
  _WebViewContentState createState() => _WebViewContentState();
}

class _WebViewContentState extends State<WebViewContent>
    with WidgetsBindingObserver {
  final _url =
      "https://web.cittamobi.com.br/?id=\$2a\$12\$sASJZT6yD4YvC%2F0UecFui.XU5RiUPM9dZxbPVXTv6VaZkbGcRDURW";
  bool showErrorPage = false;

  late InAppWebViewController inAppWebView;
  late ContextMenu contextMenu;
  double progress = 0;
  String error = "";
  bool firstLoad = false;

  void requestPermission() async {
    Map<Permission, PermissionStatus> statuses =
    await [Permission.location].request();
  }

  @override
  void initState() {
    super.initState();

    requestPermission();

    contextMenu = ContextMenu(
        menuItems: [
          ContextMenuItem(
              androidId: 1,
              iosId: "1",
              title: "Special",
              action: () async {
                print("Menu item Special clicked!");
                print(await inAppWebView.getSelectedText());
                await inAppWebView.clearFocus();
              })
        ],
        options: ContextMenuOptions(hideDefaultSystemContextMenuItems: true),
        onCreateContextMenu: (hitTestResult) async {
          print("onCreateContextMenu");
          print(hitTestResult.extra);
          print(await inAppWebView.getSelectedText());
        },
        onHideContextMenu: () {
          print("onHideContextMenu");
        },
        onContextMenuActionItemClicked: (contextMenuItemClicked) async {
          var id = (io.Platform.isAndroid)
              ? contextMenuItemClicked.androidId
              : contextMenuItemClicked.iosId;
          print("onContextMenuActionItemClicked: " +
              id.toString() +
              " " +
              contextMenuItemClicked.title);
        });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        inAppWebView.evaluateJavascript(source: "document.body.dispatchEvent(new KeyboardEvent('keydown', {'key': 'Escape'}));");
        inAppWebView.goBack();
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: <Widget>[
                  Container(
                      child: progress < 1.0
                          ? LinearProgressIndicator(value: progress)
                          : Container()),
                  Expanded(
                    child: InAppWebView(
                      initialUrlRequest: URLRequest(url: Uri.parse(_url)),
                      initialOptions: InAppWebViewGroupOptions(
                        crossPlatform: InAppWebViewOptions(
                            supportZoom: false,
                            useShouldOverrideUrlLoading: true,
                            javaScriptEnabled: true,
                            javaScriptCanOpenWindowsAutomatically: true
                        ),
                        android: AndroidInAppWebViewOptions(
                          geolocationEnabled: true,
                          useHybridComposition: true,
                        ),
                      ),
                      androidOnPermissionRequest:
                          (controller, origin, resources) async {
                        return PermissionRequestResponse(
                            resources: resources,
                            action: PermissionRequestResponseAction.GRANT);
                      },
                      androidOnGeolocationPermissionsShowPrompt:
                          (InAppWebViewController controller,
                          String origin) async {
                        bool result = true;
                        if (result) {
                          return Future.value(
                              GeolocationPermissionShowPromptResponse(
                                  origin: origin, allow: true, retain: true));
                        } else {
                          return Future.value(
                              GeolocationPermissionShowPromptResponse(
                                  origin: origin, allow: false, retain: false));
                        }
                      },
                      shouldOverrideUrlLoading:
                          (controller, navigationAction) async {
                        if (!firstLoad) {
                          firstLoad = true;
                          return NavigationActionPolicy.ALLOW;
                        } else {
                          final url = navigationAction.request.url.toString();
                          await UrlLauncherUtil.launchUrl(url);
                        }
                        return NavigationActionPolicy.CANCEL;
                      },
                      onWebViewCreated: (InAppWebViewController controller) {
                        inAppWebView = controller;
                        inAppWebView.canGoBack();
                        print("onWebViewCreated");
                      },
                      onProgressChanged:
                          (InAppWebViewController controller, int progress) {
                        setState(() {
                          this.progress = progress / 100;
                        });
                      },
                      onConsoleMessage: (controller, consoleMessage) {
                        print(consoleMessage);
                      },
                      // onLoadError: (InAppWebViewController controller, Uri url,
                      //     int i, String s) async {
                      //   error = 'Erro: $i, $s';
                      //   showError();
                      // },
                      // onLoadHttpError: (InAppWebViewController controller,
                      //     Uri url, int i, String s) async {
                      //   error = 'Erro: $i, $s';
                      //   print(error);
                      //   showError();
                      // },
                    ),
                  )
                ],
              ),
              // showErrorPage
              //     ? Center(child: ErrorPage(error))
              //     : const SizedBox(height: 0, width: 0),
            ],
          ),
        ),
      ),
    );
  }

  void showError() {
    setState(() {
      showErrorPage = true;
    });
  }

  void hideError() {
    setState(() {
      showErrorPage = false;
    });
  }
}
