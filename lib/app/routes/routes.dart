import 'package:flutter/widgets.dart';
import 'package:quietroom/app/app.dart';
import 'package:quietroom/home/home.dart';
import 'package:quietroom/login/login.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomePage.page()];
    case AppStatus.unauthenticated:
      return [LoginPage.page()];
  }
}
