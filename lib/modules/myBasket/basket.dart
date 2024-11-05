import 'package:agri_guru/modules/payment/payment.dart';
import 'package:agri_guru/shared/component/component.dart';
import 'package:flutter/material.dart';

class MyBasket extends StatelessWidget {
  const MyBasket({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Basket"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            navigate(context, Payment());
          },
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color.fromARGB(255, 88, 211, 184))),
            child: Row(
              children: [
                Image.asset(
                  "assets/images/sensor1.png",
                  height: 80,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Temperature",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "2024-011-10 20:18:04Z",
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                  ],
                ),
                Spacer(),
                Expanded(child: Text("70 le")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
