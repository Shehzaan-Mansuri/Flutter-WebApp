import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';


void main() => runApp(MyApp());

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  WebViewController controller;

  void customLaunch(command) async {
    if(await canLaunch(command)) {
      await launch(command);
    }else{
      print('could not launch $command');
    }
  }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WillPopScope(
        onWillPop: ()async{
          String url=await controller.currentUrl();
          if(url=="https:google.com") {
            return true;
          }else{
            controller.goBack();
            return false;
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Center(child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Just one call..' , style: TextStyle(color: Colors.white ,
                    fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            )
            ),
            backgroundColor: Colors.red.shade400,
          ),
            body: Container(
              child: SafeArea(
                child: WebView(
                  initialUrl: "https:www.carewellservices.in",
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (WebViewController wc){
                    controller=wc;
                  },
                ),
              ),
            ),
        ),
      ),
    );
  }
}