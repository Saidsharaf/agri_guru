import 'package:agri_guru/layout/homeLayout/cubit.dart';
import 'package:agri_guru/layout/homeLayout/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Image.asset(
            "assets/images/basket.png",
            width: 23,
          ),
          SizedBox(
            width: 20,
          ),
        ],
        leading: Icon(
          Icons.menu,
        ),
      ),
            body: cubit.Screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.bottomItems,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeNavBar(index);
              },
            ),
          );
        },
      ),
    );
  }
}
