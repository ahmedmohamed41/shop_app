import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/module/search/cubit/search_cubit.dart';
import 'package:shop_app/widgets/custom_search_view_builder.dart';
import 'package:shop_app/widgets/custom_separator.dart';
import 'package:shop_app/widgets/custom_text_from_filed.dart';

class SearchScreen extends StatelessWidget {
 const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = SearchCubit.get(context);
          return Scaffold(
              body: Padding(
            padding: const EdgeInsets.only(
              top: 70,
              left: 15,
              right: 15,
            ),
            child: Form(
              key: cubit.formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    controller: cubit.searchController,
                    labelText: 'Search',
                    inputType: TextInputType.text,
                    prefixIcon: const Icon(Icons.search),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your search';
                      } else {
                        return null;
                      }
                    },
                    // onSubmit: (String text) {
                    //   cubit.getSearch(text: text);
                    // },
                    onChanged: (text) {
                      cubit.getSearch(text: text);
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  if (state is SearchLoadingStates)
                    const LinearProgressIndicator(),
                  const SizedBox(
                    height: 15,
                  ),
                  if (state is SearchSuccessStates)
                    Expanded(
                      child: ConditionalBuilder(
                        condition: state is! SearchLoadingStates,
                        builder: (context) => ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) =>
                              CustomSearchViewBuilder(
                                  model: SearchCubit.get(context)
                                      .searchModel!
                                      .data!
                                      .data[index]),
                          separatorBuilder: (context, index) =>
                              const CustomMyDivider(),
                          itemCount: SearchCubit.get(context)
                              .searchModel!
                              .data!
                              .data
                              .length,
                        ),
                        fallback: (context) =>
                            const Center(child: CircularProgressIndicator()),
                      ),
                    ),
                ],
              ),
            ),
          ));
        },
      ),
    );
  }
}
