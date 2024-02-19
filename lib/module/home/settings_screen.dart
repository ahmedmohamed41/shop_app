import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/module/home/cubit/shop_cubit.dart';
import 'package:shop_app/module/login/login_screen.dart';
import 'package:shop_app/shared/components/constaints.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';
import 'package:shop_app/widgets/custom_button.dart';
import 'package:shop_app/widgets/custom_text.dart';

class SettingsScreeen extends StatelessWidget {
  const SettingsScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    String? name;
    String? email;
    String? phone;
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {
        if (state is ShopSuccessGetSettingsStates) {
          name = state.loginModel.data!.name;
          email = state.loginModel.data!.email;
          phone = state.loginModel.data!.phone;
          print(name);
          print(email);
          print(phone);
        }
      },
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        name = cubit.userSettingDataModel!.data!.name;
        email = cubit.userSettingDataModel!.data!.email;
        phone = cubit.userSettingDataModel!.data!.phone;
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                CustomText(
                  text: name!,
                  icon: Icons.person,
                ),
                CustomText(
                  text:email!,
                  icon: Icons.email,
                ),
                CustomText(
                  text: phone!,
                  icon: Icons.phone,
                ),
                CustomButton(
                  text: 'LOGOUT',
                  onTap: () {
                    CacheHelper.removeData(key: 'token');
                    navigateAndFinish(context, LoginScreen());
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
