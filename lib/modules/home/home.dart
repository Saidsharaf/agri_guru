import 'package:agri_guru/models/card.dart';
import 'package:agri_guru/models/cardModel.dart';
import 'package:agri_guru/modules/home/sensors/hottest.dart';
import 'package:agri_guru/modules/home/sensors/newSensors.dart';
import 'package:agri_guru/modules/home/sensors/popular.dart';
import 'package:agri_guru/shared/component/component.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<Widget> tabs = [
    Tab(
      child: Text("Hottest"),
      // icon: Icon(
      //   Icons.fireplace_rounded,
      //   color:  Color.fromARGB(255, 88, 211, 184),
      // ),
    ),
    Tab(
      child: Text("Popular"),
      // icon: Icon(
      //   Icons.workspaces_filled,
      //   color:  Color.fromARGB(255, 88, 211, 184),
      // ),
    ),
    Tab(
      child: Text("NewSensor"),
      // icon: Icon(
      //   Icons.auto_awesome_mosaic_rounded,
      //   color:  Color.fromARGB(255, 88, 211, 184),
      // ),
    ),
  ];

  //pages
  final List<Widget> tabBarViews = [
    //posts
    Hottest(),

    // footprint
    Popular(),

    //savedpost
    NewSensors(),
  ];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    
    List<CardModel> sensors = [
      CardModel(nameSensor: "Temperature", imgSensor: "assets/images/sensor1.png"),
      CardModel(nameSensor: "Temperature", imgSensor: "assets/images/sensor2.png"),
      CardModel(nameSensor: "Temperature", imgSensor: "assets/images/sensor3.png"),
      CardModel(nameSensor: "Temperature", imgSensor: "assets/images/sensor4.png"),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
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
                    TextSpan(text: 'Hello Kante, '),
                    TextSpan(
                      text: 'Which sensor do you want today ?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "Reg",
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              buildTextField(
                text: "Search for new sensors",
                icon: Icons.search,
                onPressed: () {},
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Recommended Sensors",
                style: TextStyle(
                    fontFamily: "Body",
                    fontWeight: FontWeight.w300,
                    fontSize: 15),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 200,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    width: 7,
                  ),
                  itemBuilder: (context, index) => SensorCard(
                      CardModel(nameSensor: sensors[index].nameSensor, imgSensor: sensors[index].imgSensor,)),
                  itemCount: sensors.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                ),
              ),
              Container(
                height: 300,
                child: Column(
                  children: [
                    TabBar(
                      controller: _tabController,
                      tabs: tabs,
                      labelColor: Color.fromARGB(255, 88, 211, 184),
                      indicatorColor: Color.fromARGB(255, 3, 134, 117),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: tabBarViews,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
