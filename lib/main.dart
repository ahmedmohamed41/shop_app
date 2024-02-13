import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/cubit/news_cubit.dart';
import 'package:shop_app/layout/on_boarding_screen.dart';
import 'package:shop_app/module/home/shop_screen.dart';
import 'package:shop_app/module/login/login_screen.dart';
import 'package:shop_app/shared/bloc_observer.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';
import 'package:shop_app/shared/style/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();

  await CacheHelper.init();

  Widget widget;

  bool? isDark = CacheHelper.getBoolean(key: 'isDark');
  bool onBoarding = CacheHelper.getDate(key: 'onBoarding');
  dynamic token = CacheHelper.getDate(key: 'token');

  if (onBoarding ) {
    if (token != null) {
      widget = const ShopScreen();
    } else {
      widget = LoginScreen();
    }
  } else {
    widget = const OnBoardingScreen();
  }

  runApp(ShopApp(isDark, widget));
}

class ShopApp extends StatelessWidget {
  final bool? isDark;
  final Widget widget;
  const ShopApp(this.isDark, this.widget, {super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopCubit()..changeAppMode(fromShared: isDark),
      child: BlocConsumer<ShopCubit, ShopState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ThemeMode.light
            // ShopCubit.get(context).isDark
            //     ? ThemeMode.dark
            //     : ThemeMode.light,
            ,
            home: widget,
          );
        },
      ),
    );
  }
}
