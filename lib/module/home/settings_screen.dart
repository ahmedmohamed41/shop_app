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
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                CustomText(
                  text: '${cubit.userDataModel!.data!.name}',
                  icon: Icons.person,
                ),
                CustomText(
                  text: '${cubit.userDataModel!.data!.email}',
                  icon: Icons.email,
                ),
                CustomText(
                  text: '${cubit.userDataModel!.data!.phone}',
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
