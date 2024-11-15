import 'package:agri_guru/layout/homeLayout/cubit.dart';
import 'package:agri_guru/layout/homeLayout/states.dart';
import 'package:agri_guru/models/card.dart';
import 'package:agri_guru/models/cardModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class NewSensors extends StatelessWidget {
  const NewSensors({super.key});

  @override
  Widget build(BuildContext context) {
  List<CardModel> sensors = [
    
      CardModel(
        nameSensor: AppLocalizations.of(context)!.humidity,
        imgSensor: "assets/images/sensor2.png",
      ),
      CardModel(
        nameSensor: AppLocalizations.of(context)!.soilMoisture,
        imgSensor: "assets/images/sensor3.png",
      ),
      CardModel(
        nameSensor: AppLocalizations.of(context)!.gasSensor,
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
