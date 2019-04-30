import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import '../view/random_string.dart';
import '../view/text.dart';
import '../view/button.dart';
import '../view/image.dart';
import '../view/checkbox.dart';
import '../view/textfield.dart';
import '../view/layout.dart';
import '../view/Menu.dart';
import '../view/Scroll.dart';
import '../view/ScrollListener.dart';
import '../view/WillPopScopePage.dart';
import '../view/ShareDataPage.dart';
import '../view/Theme.dart';

Object routes = {
  'web_blog': (_) => new WebviewScaffold(
    url: 'https://likun.fun',
    userAgent: 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36',
  ),
  'random_string': (context) => RandomString(title: 'random string'),
  'Text': (context) => TextPage(),
  'Button': (context) => ButtonPage(),
  'Image': (context) => ImagePage(),
  'Checkbox': (context) => SwitchAndCheckBox(),
  'TextField': (context) => TextFieldPage(),
  'Layout': (context) => LayoutPage(),
  'menu': (context) => MenuPage(),
  'scroll': (context) => ScrollPage(),
  'scrollListener': (context) => ScrollListenerPage(),
  'willPopScope': (context) => WillPopScopePage(),
  'shareData': (context) => ShareDataPage(),
  'theme': (context) => ThemePage(),
  
};