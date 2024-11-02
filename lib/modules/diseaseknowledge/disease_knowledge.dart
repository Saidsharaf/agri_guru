import 'dart:io';

import 'package:agri_guru/shared/component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:camera/camera.dart';


class Diseaseknowledge extends StatefulWidget {
  const Diseaseknowledge({super.key});

  @override
  State<Diseaseknowledge> createState() => _DiseaseknowledgeState();
}

class _DiseaseknowledgeState extends State<Diseaseknowledge> {
  File? selectedImage;
  bool ssa = true;
    // selectedImage != null
    //             ? Image.file(selectedImage!)
    //             : Text("please select an image"),
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration:  BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitWidth,
              alignment: Alignment.topRight,
              image:selectedImage != null?FileImage(selectedImage!): AssetImage(
                "assets/images/launch.png",
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.49,
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          /* ______________________________________________________________________________-------*/
                          buildButton(
                            textBtn: "Upload photo from gallary",
                            onPress: () {
                              pickImageFromGallary();
                            },
                          ),
                          SizedBox(height: 10,),
                          buildButton(
                            textBtn: "Upload photo from camera",
                            onPress: () {
                              pickImageFromCamera();
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future pickImageFromGallary() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
    });
  }
  
Future<void> pickImageFromCamera() async {
    try {
      final isCameraAvailable = await availableCameras();
      if (isCameraAvailable.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("No camera available on this device.")),
        );
        return;
      }

      final returnImage = await ImagePicker().pickImage(source: ImageSource.camera);
      if (returnImage == null) return;
      setState(() {
        selectedImage = File(returnImage.path);
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to access camera: $e")),
      );
    }
  }
}
