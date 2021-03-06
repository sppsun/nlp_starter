import 'dart:async';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lottie/flutter_lottie.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nlp_starter/common/dao/user_dao.dart';
import 'package:nlp_starter/common/redux/gsy_state.dart';
import 'package:nlp_starter/common/style/gsy_style.dart';
import 'package:nlp_starter/common/utils/common_utils.dart';
import 'package:nlp_starter/common/utils/navigator_utils.dart';
import 'package:redux/redux.dart';

/**
 * 欢迎页
 * Created by sppsun
 * Date: 2019-06-06
 */

class WelcomePage extends StatefulWidget {
  static final String sName = "/";

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool hadInit = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (hadInit) {
      return;
    }
    hadInit = true;

    ///防止多次进入
    Store<GSYState> store = StoreProvider.of(context);
    CommonUtils.initStatusBarHeight(context);
    new Future.delayed(const Duration(seconds: 2, milliseconds: 500), () {
      NavigatorUtils.goHome(context);
//      UserDao.initUserInfo(store).then((res) {
//        if (res != null && res.result) {
//          NavigatorUtils.goHome(context);
//        } else {
//          NavigatorUtils.goLogin(context);
//        }
//        return true;
//      }
//      );
    });
  }

  void onViewCreatedFile(LottieController controller) {}

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<GSYState>(
      builder: (context, store) {
        double size = 160;
        return new Container(
          color: Color(GSYColors.white),
          child: Stack(
            children: <Widget>[
              new Center(
                child: new Image(
                    image: new AssetImage('static/images/welcome.png')),
              ),
              new Align(
                alignment: Alignment.bottomCenter,
                child: new Container(
                  width: size,
                  height: size,
                  child: new FlareActor("static/file/flare_flutter_logo_.flr",
                      alignment: Alignment.topCenter,
                      fit: BoxFit.fill,
                      animation: "Placeholder"),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
