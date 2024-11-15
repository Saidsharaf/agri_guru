import 'dart:io';
import 'dart:math';

import 'package:agri_guru/shared/component/component.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:camera/camera.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Diseaseknowledge extends StatefulWidget {
  const Diseaseknowledge({super.key});

  @override
  State<Diseaseknowledge> createState() => _DiseaseknowledgeState();
}

class _DiseaseknowledgeState extends State<Diseaseknowledge> {
  File? selectedImage;

  // Define texts as a class-level variable.
  late final List<String> texts;



  void didChangeDependencies() {
    super.didChangeDependencies();
    texts = [
      AppLocalizations.of(context)!.randomAnswer1,
      AppLocalizations.of(context)!.randomAnswer2,
      AppLocalizations.of(context)!.randomAnswer3,
      AppLocalizations.of(context)!.randomAnswer4,
      AppLocalizations.of(context)!.randomAnswer5,
      AppLocalizations.of(context)!.randomAnswer6,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitWidth,
          alignment: Alignment.topRight,
          image: selectedImage != null
              ? FileImage(selectedImage!)
              : AssetImage("assets/images/launch.png"),
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
                      buildButton(
                        textBtn: AppLocalizations.of(context)!.uploadGallary,
                        onPress: () {
                          pickImageFromGallary();
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      buildButton(
                        textBtn: AppLocalizations.of(context)!.uploadCamera,
                        onPress: () {
                          pickImageFromCamera();
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      selectedImage != null
                          ? Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black38,
                                      blurRadius: 5,
                                    )
                                  ]),
                              child: Text(
                                getRandomText(),
                                style: TextStyle(
                                  fontFamily: "Body",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          : Text(AppLocalizations.of(context)!.selectPhoto),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
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

      final returnImage =
          await ImagePicker().pickImage(source: ImageSource.camera);
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

  String getRandomText() {
    final random = Random();
    int index = random.nextInt(texts.length); // Generate a random index.
    return texts[index]; // Return the text at the random index.
  }
}
