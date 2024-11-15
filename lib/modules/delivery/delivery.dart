import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Delivery extends StatefulWidget {
  const Delivery({super.key});

  @override
  State<Delivery> createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(29.9773, 31.1325),
    zoom: 14.4746,
  );
  @override
  Widget build(BuildContext context) {
    return 
    Column(
      children: [
        Expanded(
          child: Container(
            height: 300, // Set a fixed height for the map container
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey[100],
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: Icon(
                  Icons.person_pin,
                  color: Color.fromARGB(255, 88, 211, 184),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.deliveryName,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Tabela",
                      )),
                  Text(
                    AppLocalizations.of(context)!.deliveryMan,
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Container(
                width: 40,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: Icon(
                  Icons.call,
                  color: Color.fromARGB(255, 88, 211, 184),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                width: 40,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: Icon(
                  Icons.message,
                  color: Color.fromARGB(255, 88, 211, 184),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey[100],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.delivery_dining,
                          color: Color.fromARGB(255, 88, 211, 184),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(AppLocalizations.of(context)!.deliveryWay,
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Tabela",
                                ),),
                            Text(
                              AppLocalizations.of(context)!.deliveryAddress,
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(color: Colors.grey[200],),
                  Text(AppLocalizations.of(context)!.order,
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Tabela",
                                ),),
                  Row(
                    children: [
                      Text(AppLocalizations.of(context)!.orderOne,
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 10,
                                color: Colors.grey,
                              ),),
                              Spacer(),
                      Text(AppLocalizations.of(context)!.orderPrice,
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 10,
                                color: Colors.grey,
                              ),),
                
                    ],
                  ),
                  Row(
                    children: [
                      Text(AppLocalizations.of(context)!.orderOne,
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 10,
                                color: Colors.grey,
                              ),),
                              Spacer(),
                      Text(AppLocalizations.of(context)!.orderPrice,
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 10,
                                color: Colors.grey,
                              ),),
                
                    ],
                  ),
                  Divider(color: Colors.grey[200],),
                  Row(
                    children: [
                      Text(AppLocalizations.of(context)!.total,
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 10,
                                color: Colors.grey,
                              ),),
                              Spacer(),
                      Text(AppLocalizations.of(context)!.totalPrice,
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 10,
                                color: Colors.grey,
                              ),),
                
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
