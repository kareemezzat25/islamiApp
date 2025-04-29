import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/bloc/cubit.dart';
import 'package:islami_app/bloc/states.dart';
import 'package:islami_app/models/mytheme.dart';
import 'package:islami_app/repository/repo_impl.dart';
import 'package:islami_app/widgets/recitersItem.dart';

class RecitersTab extends StatelessWidget {
  const RecitersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(repo: RepoImplemtation())..getReciters(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is RecitersLoadingState) {
            showDialog(
                context: context,
                builder: (context) {
                  return CircularProgressIndicator(
                    color: MyThemeData.primarycolor,
                  );
                });
          } else if (state is RecitersErrorState) {
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
          var data = bloc.recitersModel;
          if (data == null || data.reciters == null) {
            return Center(
                child: CircularProgressIndicator(
              color: MyThemeData.primarycolor,
            ));
          }

          return ListView.separated(
            itemBuilder: (context, index) {
              return RecitersItem(
                reciterModel: data.reciters![index],
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 16.h,
              );
            },
            itemCount: data.reciters!.length,
          );
        },
      ),
    );
  }
}
