import 'package:agri_guru/layout/homeLayout/states.dart';
import 'package:agri_guru/models/cardModel.dart';
import 'package:agri_guru/modules/delivery/delivery.dart';
import 'package:agri_guru/modules/diseaseknowledge/disease_knowledge.dart';
import 'package:agri_guru/modules/home/home.dart';
import 'package:agri_guru/modules/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(NewsInitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.sensors),
      label: "Sensors",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.camera_alt),
      label: "Recognize",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.delivery_dining_outlined),
      label: "Delivery",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: "Settings",
    ),
  ];

  List<Widget> Screens = [
    Home(),
    Diseaseknowledge(),
    Delivery(),
    Settings(),
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
    emit(isFavState()); // Emit a new state
  }
  List<CardModel> sensors = [
    CardModel(nameSensor: "Temperature", imgSensor: "assets/images/sensor1.png", isFav: false),
    CardModel(nameSensor: "Humidity", imgSensor: "assets/images/sensor2.png", isFav: false),
    CardModel(nameSensor: "Soil Moisture", imgSensor: "assets/images/sensor3.png", isFav: false),
    CardModel(nameSensor: "Light", imgSensor: "assets/images/sensor4.png", isFav: false),
  ];
  List<CardModel> Hottest = [
    CardModel(nameSensor: "Temperature", imgSensor: "assets/images/sensor1.png", isFav: false),
    CardModel(nameSensor: "Humidity", imgSensor: "assets/images/sensor2.png", isFav: false),
    CardModel(nameSensor: "Soil Moisture", imgSensor: "assets/images/sensor3.png", isFav: false),
    CardModel(nameSensor: "Light", imgSensor: "assets/images/sensor4.png", isFav: false),
  ];

}
