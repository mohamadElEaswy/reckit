import 'package:flutter/material.dart';
// ignore: deprecated_member_use, avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:ui_web' as ui;

class CustomImageRenderWeb extends StatelessWidget {
  const CustomImageRenderWeb(this.url, {super.key});
  final String url;

  @override
  Widget build(BuildContext context) {
    ui.platformViewRegistry.registerViewFactory('image-html-$url', (
      int viewId,
    ) {
      final html.ImageElement img = html.ImageElement()
        ..src = url
        ..style.width = '100%'
        ..style.height = '100%';
      return img;
    });
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.all(Radius.circular(100)),
      child: HtmlElementView(viewType: 'image-html-$url'),
    );
  }
}
