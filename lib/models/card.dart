import 'package:agri_guru/models/cardModel.dart';
import 'package:flutter/material.dart';

Widget SensorCard(CardModel model){
    return Stack(
      alignment: Alignment.topRight,
      children: [
        
        Padding(
          padding: const EdgeInsets.only(top: 5,left: 3,),
          child: Container(
            height: 160,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 2,
                //  offset: Offset(5, 2),
          
                //  blurStyle: BlurStyle.solid,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(11.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    model.imgSensor,
                    height: 70,
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    model.nameSensor,
                    style: TextStyle(fontFamily: "Body", fontSize: 12),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.attach_money_rounded,
                      ),
                      Text(
                        "10",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontFamily: "Body"),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.favorite_outline,
            color: Color.fromARGB(255, 88, 211, 184),
          ),
        ),
      ],
    );
  }

