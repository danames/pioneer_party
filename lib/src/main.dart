import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'menu.dart';
import 'navigation_controls.dart';
import 'web_view_stack.dart';

void main() {
  runApp(
      const MaterialApp(
        home: MyApp()
        //home:PioneerPartyApp(),
      )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  late WebViewController _controller;
  @override

  var _currentIndex = 0;
  var loadingPercentage = 0;

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pioneer Party Gift & Copy'),
          backgroundColor: const Color(0xff00427c),
          centerTitle: true,
        ),
      body: Stack(
        children:[
          WebView(
            initialUrl: 'https://www.pioneerparty.net',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller = webViewController;
            },
            onPageStarted: (url) {
              setState(() {
                loadingPercentage = 0;
              });
            },
            onProgress: (progress) {
              setState(() {
                loadingPercentage = progress;
              });
            },
            onPageFinished: (url) {
              setState(() {
                loadingPercentage = 100;
              });
            },
          ),
          if (loadingPercentage < 100)
            LinearProgressIndicator(
              value: loadingPercentage / 100.0,
            ),

        ]
      ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          backgroundColor: Colors.amber,
          unselectedItemColor: const Color(0xff98cdcf),
          showUnselectedLabels: true,
          selectedItemColor: const Color(0xff00427c),

          items: const [
            BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home),),
            BottomNavigationBarItem(label: "Deals", icon: Icon(Icons.attach_money),),
            BottomNavigationBarItem(label: "Profile", icon: Icon(Icons.account_circle),),
            BottomNavigationBarItem(label: "Cart", icon: Icon(Icons.shopping_cart),)
          ],
          onTap: onTabTapped ,
        )
    );
  }
  void onTabTapped(int index) {
    //Set the variable state to update stuff
    setState(() {
      _currentIndex = index;
    });

    //Decide what action to take
    switch(index) {
      case 0:
        {
          _controller.loadUrl('https://www.pioneerparty.net');
          setState(() {

          });
        }
        break;

      case 1:
        {
          _controller.loadUrl('https://www.google.com');
        }
        break;

      case 2:
        {
          _controller.loadUrl('https://pioneerparty.net/account');
        }
        break;

      case 3:
        {
          _controller.loadUrl('https://pioneerparty.net/cart');
        }
        break;


    }

  }
}


class PioneerPartyApp extends StatefulWidget {
  const PioneerPartyApp({super.key});
  @override
  State<PioneerPartyApp> createState() => _PioneerPartyAppState();
}

class _PioneerPartyAppState extends State<PioneerPartyApp> {
  final controller = Completer<WebViewController>();

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pioneer Party Gift & Copy'),
        actions: [
          NavigationControls(controller: controller),
          Menu(controller: controller),
        ],
        backgroundColor: const Color(0xff00427c),
        centerTitle: true,
      ),
      body: WebViewStack(controller: controller),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          backgroundColor: Colors.amber,
          unselectedItemColor: const Color(0xff98cdcf),
          showUnselectedLabels: true,
          selectedItemColor: const Color(0xff00427c),

          items: const [
            BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home),),
            BottomNavigationBarItem(label: "Deals", icon: Icon(Icons.attach_money),),
            BottomNavigationBarItem(label: "Profile", icon: Icon(Icons.account_circle),),
            BottomNavigationBarItem(label: "Cart", icon: Icon(Icons.shopping_cart),)
          ],
          onTap: onTabTapped ,
      )

    );
  }



  void onTabTapped(int index) {
    if(_currentIndex == 0) {

    }

  }
}

