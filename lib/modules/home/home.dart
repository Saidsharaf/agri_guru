import 'package:agri_guru/layout/homeLayout/cubit.dart';
import 'package:agri_guru/layout/homeLayout/states.dart';
import 'package:agri_guru/models/card.dart';
import 'package:agri_guru/models/cardModel.dart';
import 'package:agri_guru/modules/home/sensors/hottest.dart';
import 'package:agri_guru/modules/home/sensors/newSensors.dart';
import 'package:agri_guru/modules/home/sensors/popular.dart';
import 'package:agri_guru/shared/component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  var searchController = TextEditingController();

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
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> tabs = [
      Tab(
        child: Text(AppLocalizations.of(context)!.hottest, style: TextStyle(fontSize: 13)),
      ),
      Tab(
        child: Text(AppLocalizations.of(context)!.popular, style: TextStyle(fontSize: 12)),
      ),
      Tab(
        child: Text(AppLocalizations.of(context)!.newP, style: TextStyle(fontSize: 13)),
      ),
    ];

    List<CardModel> sensors = [
      CardModel(
        nameSensor: AppLocalizations.of(context)!.temperature,
        imgSensor: "assets/images/sensor1.png",
      ),
      CardModel(
        nameSensor: AppLocalizations.of(context)!.ldr,
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
                      text: AppLocalizations.of(context)!.topHomeN,
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
                AppLocalizations.of(context)!.recommendedSensors,
                style: TextStyle(
                  fontFamily: "Body",
                  fontWeight: FontWeight.w300,
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                height: 200,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(width: 7),
                  itemBuilder: (context, index) {
                    return BlocBuilder<AppCubit, AppStates>(
                      builder: (context, state) {
                        return SensorCard(
                          model: CardModel(
                            nameSensor: sensors[index].nameSensor,
                            imgSensor: sensors[index].imgSensor,
                            isFav: context.read<AppCubit>().sensors[index].isFav,
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
