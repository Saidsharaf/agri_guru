import 'dart:math';
import 'package:agri_guru/models/cardModelSec.dart';
import 'package:flutter/material.dart';

class SensorCardSec extends StatefulWidget {
  const SensorCardSec({
    super.key,
    required this.model,
  });
  final CardModelSec model;

  @override
  State<SensorCardSec> createState() => _SensorCard2State();
}

class _SensorCard2State extends State<SensorCardSec> {
  @override
  Widget build(BuildContext context) {
  // ignore: unused_element
  String getRandomNumber() {
  final random = Random();
  return (20 + random.nextInt(51)).toString(); // Generates a number from 20 to 70 (inclusive)
}
    return Padding(
      padding: const EdgeInsets.only(
        top: 5,
        left: 3,
      ),
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 2,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  widget.model.imgSensor,
                  height: 65,
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  widget.model.nameSensor,
                  style: TextStyle(fontFamily: "Body", fontSize: 12),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.attach_money_rounded,
                    ),
                    Text(
                      getRandomNumber(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontFamily: "Body"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
