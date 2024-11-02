import 'package:agri_guru/shared/component/component.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
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
            Text("Recommended Sensors",style: TextStyle(
              fontFamily: "Body",
              fontWeight: FontWeight.w300,
              fontSize: 15
            ),),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 200,
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  width: 7,
                ),
                itemBuilder: (context, index) => SensorCard(),
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SensorCard extends StatelessWidget {
  const SensorCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                    "assets/images/sensor1.png",
                    height: 70,
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    "Temperature sensor ",
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
}
