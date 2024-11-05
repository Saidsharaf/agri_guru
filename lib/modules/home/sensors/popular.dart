import 'package:agri_guru/layout/homeLayout/cubit.dart';
import 'package:agri_guru/layout/homeLayout/states.dart';
import 'package:agri_guru/models/card.dart';
import 'package:agri_guru/models/cardModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Popular extends StatelessWidget {
  const Popular({super.key});

  @override
  Widget build(BuildContext context) {
  List<CardModel> sensors = [
      CardModel(
        nameSensor: "Temperature",
        imgSensor: "assets/images/sensor1.png",
      ),
      CardModel(
        nameSensor: "Humidity",
        imgSensor: "assets/images/sensor2.png",
      ),
      CardModel(
        nameSensor: "Soil moisture",
        imgSensor: "assets/images/sensor3.png",
      ),
      CardModel(
        nameSensor: "Gas sensor",
        imgSensor: "assets/images/sensor4.png",
      ),
    ];
    return   SizedBox(
              height: 200,
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  width: 7,
                ),
                itemBuilder: (context, index) {
                    return BlocBuilder<AppCubit, AppStates>(
                      builder: (context, state) {
                        return SensorCard(
                          model: CardModel(
                              nameSensor: sensors[index].nameSensor,
                              imgSensor: sensors[index].imgSensor,
                              isFav: context.read<AppCubit>().sensors[index].isFav
                              ),
                              index: index,
                        );
                      },
                    );
                },
                itemCount: sensors.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
              ),
            );
  }
}
