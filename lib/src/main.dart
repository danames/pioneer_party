import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'menu.dart';
import 'navigation_controls.dart';
import 'web_view_stack.dart';

void main() {
  runApp(
      const MaterialApp(
        home:WebViewApp(),
      )
  );
}

class WebViewApp extends StatefulWidget {
  const WebViewApp({super.key});

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
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
        //actions: [
        //  NavigationControls(controller: controller),
        //],
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

      setState(() {


      });
    }

  }
}

