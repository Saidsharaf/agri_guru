import 'dart:math';

import 'package:agri_guru/shared/component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Degree extends StatefulWidget {
  const Degree({super.key});

  @override
  State<Degree> createState() => _DegreeState();
}

class _DegreeState extends State<Degree> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  var searchController = TextEditingController();


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(text: AppLocalizations.of(context)!.topHome),
                    TextSpan(
                      text: AppLocalizations.of(context)!.topHomeNTwo,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "Reg",
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              buildTextField(
                textEditingController: searchController,
                text: AppLocalizations.of(context)!.search,
                icon: Icons.search,
                onPressed: () {},
              ),
              SizedBox(height: 15),
              Text(
                AppLocalizations.of(context)!.readings,
                style: TextStyle(
                  fontFamily: "Body",
                  fontWeight: FontWeight.w300,
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 15),
                Container(
                  color: Colors.white,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(100))),
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 25,
                      mainAxisSpacing: 30,
                      children: [
                        itemDashboard(
                            title: AppLocalizations.of(context)!.temperature,
                            img: "assets/images/sensor1.png",
                            background: Colors.purple,
                            txt: "°C",
                            random: getRandomTwo(),
                            onPress: () {
                            }),
                        itemDashboard(
                            title: AppLocalizations.of(context)!.gasSensor,
                            img: "assets/images/sensor4.png",
                            background: Colors.brown,
                            random: generateRandomNumber(),
                            txt: " ",
                            onPress: () {
                              
                            },
                            ),
                        itemDashboard(
                          title: AppLocalizations.of(context)!.soilMoisture,
                          img: "assets/images/sensor3.png",
                          background: Colors.indigo,
                          random: getRandomLight(),
                          txt: "%",
                          onPress: () {},
                        ),
                        itemDashboard(
                            title: AppLocalizations.of(context)!.humidity,
                            img: "assets/images/humidity.png",
                            background: Colors.teal,
                            txt: "%",
                            random: getRandomTwo(),
                            onPress: () {},
                            ),
                        itemDashboard(
                            title: AppLocalizations.of(context)!.ldr,
                            img: "assets/images/sensor2.png",
                            background: Colors.teal,
                            random: getRandomLight(),
                            txt: "%",
                            onPress: () {},
                            ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20)
              

            ],
          ),
        ),
      ),
    );
  }

    itemDashboard(
          {String? title,
          String? img,
          String? txt,
          String? random,
          Color? background,
          Function()? onPress}) =>
      GestureDetector(
        onTap: onPress,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 5),
                    color: Colors.green.withOpacity(.2),
                    spreadRadius: 2,
                    blurRadius: 5)
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(img!,height: 55,),
              const SizedBox(height: 8),
              Text(
                title!.toUpperCase(),
                // style: ,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(random!),
                  SizedBox(width: 2,),
                  Text(txt!),
                ],
              ),
            ],
          ),
        ),
      );
      String getRandom(){
         final random = Random();
        return (20 + random.nextInt(51)).toString();
      }
      String getRandomTwo(){
         final random = Random();
        return (15 + random.nextInt(23)).toString();
      }
      String getRandomLight(){
         final random = Random();
        return (6 + random.nextInt(85)).toString();
      }
      String generateRandomNumber() {
  return Random().nextDouble().toStringAsFixed(2);
}
}
