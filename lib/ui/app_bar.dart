import 'package:flutter/material.dart';
import './my_platform.dart';
import './colors.dart';
import './texts.dart';

AppBar buildHomeAppBar(BuildContext context, String title,
    {TabBar? tabBar, bool noActions = false}) {
  List<Widget> actions = [
    IconButton(
        icon: Icon(
          Icons.my_library_books,
          color: Colors.white,
        ),
        onPressed: () => {}
    ), //MyNavigator.pushNamed(context, Routes.setting)),
    IconButton(
        icon: Icon(Icons.person, color: Colors.white),
        onPressed: () => {}
        /*onPressed: () async {
          await MyNavigator.pushNamed(context, Routes.myPage);
          MyProfileNotifier.getNoListenerNotifier(context).update(context);
        }*/
    )
  ].where((element) => element != null).toList();
  return AppBar(
    title: buildH3Text(title),//, colors: TextColors.WHITE),
    backgroundColor: getAppColors().primary,
    centerTitle: (MyPlatform.isIOS || MyPlatform.isWeb),
    leading: Container(),
    actions: noActions ? null : actions,
    bottom: tabBar,
  );
}

AppBar buildNormalAppBar(BuildContext context, String title,
    {List<Widget>? actions,
      dynamic Function()? popResult,
      bool iosCloseButtonVisible = true}) {
  return AppBar(
    title: buildH3Text(title),//, colors: TextColors.WHITE),
    backgroundColor: getAppColors().primary,
    centerTitle: (MyPlatform.isIOS || MyPlatform.isWeb),
    leading: (MyPlatform.isIOS || MyPlatform.isWeb) && iosCloseButtonVisible
        ? IconButton(
      icon: Icon(Icons.close, color: Colors.white),
      onPressed: () {
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        Navigator.pop(context, popResult?.call());
      },
    )
        : Container(),
    actions: actions,
  );
}
