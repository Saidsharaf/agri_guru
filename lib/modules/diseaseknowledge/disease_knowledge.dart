import 'dart:io';
import 'dart:math';

import 'package:agri_guru/shared/component/component.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:camera/camera.dart';

class Diseaseknowledge extends StatefulWidget {
  const Diseaseknowledge({super.key});

  @override
  State<Diseaseknowledge> createState() => _DiseaseknowledgeState();
}

class _DiseaseknowledgeState extends State<Diseaseknowledge> {
  File? selectedImage;

 final List<String> texts = [
    "Plant disease-resistant cultivars. If the fungus is prevalent, remove infected leaves or entire plants. Avoid overhead watering and irrigating plants in the evening. Rotate edible crops every year and avoid crowding plants.",
    "Viral infections have no efficient control, but some resistant varieties exist. Remove infected plants immediately to prevent disease spread. The mosaic virus can survive in the soil for some period. ",
    "Give plants proper drainage and avoid planting in areas with poor air circulation and ample shade. Additionally, you can spray plants with a solution of baking soda and water. If fungus becomes established, remove infected leaves from plants to stop the spores from spreading. Commercial fungicides to treat powdery mildew are also available. For complete plant protection",
    "Plant resistant varieties in well-draining soil. The fungus spores overwinter in fallen leaves, so remove dead and infected leaves around the plants. Don't add them to the compost pile. Spray copper or sulfur-based fungicide in spring and early summer",
    "Plant disease-resistant cultivars. Once the disease infects a plant, there's no effective treatment. Remove and destroy affected plants immediately, and don't plant the same variety in that area for five years.",
    "Prevention and good sanitation practices will help control this fungal disease because fungicides are not very effective, and there is no cure for an infected plant. Remove and destroy dead plants, including the infected roots and soil, and replant disease-resistant species. Avoid flooding or underwatering on mature trees. Furthermore",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitWidth,
              alignment: Alignment.topRight,
              image: selectedImage != null
                  ? FileImage(selectedImage!)
                  : AssetImage(
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
                    padding:
                        const EdgeInsets.only(top: 20, left: 15, right: 15),
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
                          SizedBox(
                            height: 10,
                          ),
                          buildButton(
                            textBtn: "Upload photo from camera",
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
                                  ]
                                ),
                                child: Text(getRandomText().toString(),style: TextStyle(
                                  fontFamily: "Body",
                                  fontWeight: FontWeight.w600,
                                ),),
                              )
                              : Text("please select an image"),
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
