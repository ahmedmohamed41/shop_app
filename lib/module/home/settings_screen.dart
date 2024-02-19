import 'dart:math';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/module/home/cubit/shop_cubit.dart';
import 'package:shop_app/module/login/login_screen.dart';
import 'package:shop_app/shared/components/constaints.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';
import 'package:shop_app/widgets/custom_button.dart';
import 'package:shop_app/widgets/custom_condition_builder.dart';
import 'package:shop_app/widgets/custom_text_from_filed.dart';

class SettingsScreeen extends StatelessWidget {
  SettingsScreeen({super.key});
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context).userSettingDataModel;
        nameController.text = cubit!.data!.name!;
        emailController.text = cubit.data!.email!;
        phoneController.text = cubit.data!.phone!;
        return ConditionalBuilder(
          condition: ShopCubit.get(context).userSettingDataModel != null,
          builder: (context) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  if(state is ShopLoadingGetUpdatesStates)
                  const LinearProgressIndicator(),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    controller: nameController,
                    labelText: 'Name',
                    inputType: TextInputType.name,
                    prefixIcon: const Icon(Icons.person),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextFormField(
                    controller: emailController,
                    labelText: 'Email Address',
                    inputType: TextInputType.emailAddress,
                    prefixIcon: const Icon(Icons.email),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email address';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextFormField(
                    controller: phoneController,
                    labelText: 'phone',
                    inputType: TextInputType.phone,
                    prefixIcon: const Icon(Icons.phone),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your phone';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomButton(
                    text: 'UPDATE',
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        ShopCubit.get(context).updateUserData(
                            name: nameController.text,
                            phone: phoneController.text,
                            email: emailController.text);
                      }
                    },
                  ),
                  const SizedBox(
                    height: 15,
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
          ),
          fallback: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
