import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/module/home/cubit/shop_cubit.dart';
import 'package:shop_app/module/login/login_screen.dart';
import 'package:shop_app/shared/components/constaints.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';
import 'package:shop_app/widgets/custom_button.dart';
import 'package:shop_app/widgets/custom_text_from_filed.dart';

class SettingsScreeen extends StatelessWidget {
  const SettingsScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {
        if (state is ShopSuccessGetUpdatesStates) {
          if (state.updateModel.status!) {
            CacheHelper.saveData(
                    key: 'token', value: state.updateModel.data!.token)
                .then((value) {
              token = state.updateModel.data!.token!;

              flutterToastShowUpdate(state, Colors.green);
            });
          } else {
            print((state.updateModel.message));
            flutterToastShowUpdate(state, Colors.red);
          }
        }
      },
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        if (cubit.userSettingDataModel!.data != null) {
          cubit.nameController.text = cubit.userSettingDataModel!.data!.name!;
          cubit.emailController.text = cubit.userSettingDataModel!.data!.email!;
          cubit.phoneController.text = cubit.userSettingDataModel!.data!.phone!;
        }

        return ConditionalBuilder(
          condition: ShopCubit.get(context).userSettingDataModel != null,
          builder: (context) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Form(
              key: ShopCubit.get(context).formKey,
              child: ListView(
                children: [
                  if (state is ShopLoadingGetUpdatesStates)
                    const LinearProgressIndicator(),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    controller: ShopCubit.get(context).nameController,
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
                    controller: ShopCubit.get(context).emailController,
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
                    controller: ShopCubit.get(context).phoneController,
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
                      if (ShopCubit.get(context)
                          .formKey
                          .currentState!
                          .validate()) {
                        ShopCubit.get(context).updateUserData(
                            name: ShopCubit.get(context).nameController.text,
                            phone: ShopCubit.get(context).phoneController.text,
                            email: ShopCubit.get(context).emailController.text);
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
