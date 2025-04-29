import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/bloc/cubit.dart';
import 'package:islami_app/bloc/states.dart';
import 'package:islami_app/models/mytheme.dart';
import 'package:islami_app/repository/repo_impl.dart';
import 'package:islami_app/widgets/radioitem.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(repo: RepoImplemtation())..getRadio(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is RadioLoadingState) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return Center(
                  child: CircularProgressIndicator(
                    color: MyThemeData.primarycolor,
                  ),
                );
              },
            );
          } else if (state is RadioErrorState) {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(
                      "Error",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: MyThemeData.blackColor),
                    ),
                    content: Text(
                      state.messageError,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.grey[800]),
                    ),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[900],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.r))),
                          child: Text(
                            "Ok",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: Colors.white),
                          )),
                    ],
                  );
                });
          }
        },
        builder: (context, state) {
          var bloc = BlocProvider.of<HomeCubit>(context);
          var data = bloc.radioResponseModel;
          if (data == null || data.radios!.isEmpty) {
            return Center(
              child: CircularProgressIndicator(
                color: MyThemeData.primarycolor,
              ),
            );
          }
          return ListView.separated(
            itemBuilder: (context, index) {
              return RadioItem(
                name: data.radios![index].name ?? "",
                url: data.radios![index].url ?? "",
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 16.h,
              );
            },
            itemCount: data.radios!.length ?? 0,
          );
        },
      ),
    );
  }
}
