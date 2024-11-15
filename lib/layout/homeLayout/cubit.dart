import 'package:agri_guru/layout/homeLayout/home_layout.dart';
import 'package:agri_guru/layout/homeLayout/states.dart';
import 'package:agri_guru/models/cardModel.dart';
import 'package:agri_guru/modules/degree/degree.dart';
import 'package:agri_guru/modules/delivery/delivery.dart';
import 'package:agri_guru/modules/diseaseknowledge/disease_knowledge.dart';
import 'package:agri_guru/modules/home/home.dart';
import 'package:agri_guru/modules/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(NewsInitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  // Method to retrieve bottom navigation items
  List<BottomNavigationBarItem> getBottomItems(BuildContext context) {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.sensors),
        label: AppLocalizations.of(context)!.sensors,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.camera_alt),
        label: AppLocalizations.of(context)!.recognize,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings_input_svideo_rounded),
        label: AppLocalizations.of(context)!.degree,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.delivery_dining_outlined),
        label: AppLocalizations.of(context)!.delivery,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: AppLocalizations.of(context)!.settings,
      ),
    ];
  }

  List<Widget> screens = [
    Home(),
    Diseaseknowledge(),
    Degree(),
    Delivery(),
    Settings(startWidget: HomeLayout(),),
  ];

  void changeNavBar(int index) {
    currentIndex = index;
    emit(NewsBottomNavState());
  }

  bool isFav = false;
  
  void changeIsFav() {
    isFav = !isFav;
    emit(isFavState());
  }

  void toggleFavorite(int index) {
    sensors[index].isFav = !sensors[index].isFav;
    emit(isFavState());
  }

  List<CardModel> sensors = [
    CardModel(nameSensor: "Temperature", imgSensor: "assets/images/sensor1.png", isFav: false),
    CardModel(nameSensor: "Humidity", imgSensor: "assets/images/sensor2.png", isFav: false),
    CardModel(nameSensor: "Soil Moisture", imgSensor: "assets/images/sensor3.png", isFav: false),
    CardModel(nameSensor: "Light", imgSensor: "assets/images/sensor4.png", isFav: false),
  ];
  List<CardModel> hottest = [
    CardModel(nameSensor: "Temperature", imgSensor: "assets/images/sensor1.png", isFav: false),
    CardModel(nameSensor: "Humidity", imgSensor: "assets/images/sensor2.png", isFav: false),
    CardModel(nameSensor: "Soil Moisture", imgSensor: "assets/images/sensor3.png", isFav: false),
    CardModel(nameSensor: "Light", imgSensor: "assets/images/sensor4.png", isFav: false),
  ];
}
