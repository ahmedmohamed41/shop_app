import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/cubit/on_boarding_cubit.dart';
import 'package:shop_app/module/login/login_screen.dart';
import 'package:shop_app/shared/components/constaints.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';
import 'package:shop_app/widgets/custom_boarding_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void submit() {
      CacheHelper.saveData(
        key: 'onBoarding',
        value: true,
      ).then((value) {
        if (value) {
          navigateAndFinish(context, LoginScreen());
        }
      });
    }

    return BlocProvider(
      create: (context) => OnBoardingCubit(),
      child: BlocConsumer<OnBoardingCubit, OnBoardingState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = OnBoardingCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              actions: [
                TextButton(
                  onPressed: () {
                    submit();
                  },
                  child: const Text(
                    'SKIP',
                    style: TextStyle(
                      color: defaultColor,
                    ),
                  ),
                )
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: cubit.boardController,
                      physics: const BouncingScrollPhysics(),
                      onPageChanged: (index) {
                        if (index == cubit.boarding.length - 1) {
                          cubit.isLast = true;
                        } else {
                          cubit.isLast = false;
                        }
                      },
                      itemCount: cubit.boarding.length,
                      itemBuilder: (context, index) =>
                          BoardingItem(model: cubit.boarding[index]),
                    ),
                  ),
                  Row(
                    children: [
                      SmoothPageIndicator(
                        controller: cubit.boardController,
                        count: cubit.boarding.length,
                        effect: const ExpandingDotsEffect(
                          dotColor: Colors.grey,
                          activeDotColor: defaultColor,
                          expansionFactor: 4,
                          dotHeight: 10,
                          dotWidth: 10,
                          spacing: 5.0,
                        ),
                      ),
                      const Spacer(),
                      FloatingActionButton(
                        onPressed: () {
                          if (cubit.isLast) {
                            submit();
                          } else {
                            cubit.boardController.nextPage(
                                duration: const Duration(milliseconds: 750),
                                curve: Curves.fastLinearToSlowEaseIn);
                          }
                        },
                        child: const Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
