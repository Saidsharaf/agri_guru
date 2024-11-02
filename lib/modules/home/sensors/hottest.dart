import 'package:agri_guru/models/card.dart';
import 'package:agri_guru/models/cardModel.dart';
import 'package:flutter/material.dart';

class Hottest extends StatelessWidget {
  const Hottest({super.key});

  @override
  Widget build(BuildContext context) {
    List<CardModel> sensors = [
      CardModel(nameSensor: "Temperature", imgSensor: "assets/images/sensor3.png"),
      CardModel(nameSensor: "Temperature", imgSensor: "assets/images/sensor4.png"),
      CardModel(nameSensor: "Temperature", imgSensor: "assets/images/sensor1.png"),
      CardModel(nameSensor: "Temperature", imgSensor: "assets/images/sensor2.png"),
    ];
    return   SizedBox(
              height: 200,
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  width: 7,
                ),
                itemBuilder: (context, index) => SensorCard(
                    CardModel(nameSensor: sensors[index].nameSensor, imgSensor: sensors[index].imgSensor,),

                ),
                itemCount: sensors.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
              ),
            );
  }
}
