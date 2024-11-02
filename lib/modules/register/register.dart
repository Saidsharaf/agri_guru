import 'package:agri_guru/layout/homeLayout/home_layout.dart';
import 'package:agri_guru/modules/login/login.dart';
import 'package:flutter/material.dart';
import 'package:agri_guru/shared/component/component.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool checkBoxValue = false;
  bool showPassword = true;
  bool showRetypePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/images/bg3.jpg",
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 70,
                ),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontFamily: "Tabela",
                        ),
                      ),
                      Text(
                        "Please sign up to get start",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20,left: 15,right: 15),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: const Text(
                                      "NAME",
                                      style: TextStyle(
                                          fontFamily: "Body",
                                          fontSize: 14,
                                          color: Colors.black54),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    child: buildTextField(
                                      text: "john doe",
                                      type: TextInputType.name,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: const Text(
                                      "EMAIL",
                                      style: TextStyle(
                                          fontFamily: "Body",
                                          fontSize: 14,
                                          color: Colors.black54),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    child: buildTextField(
                                      text: "example@gmail.com",
                                      type: TextInputType.emailAddress,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: const Text(
                                      "PASSWORD",
                                      style: TextStyle(
                                          fontFamily: "Body",
                                          fontSize: 14,
                                          color: Colors.black54),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color:
                                                    Colors.grey.shade200))),
                                    child: buildTextField(
                                      text: "*  *  *  *  *  *  *  *",
                                      isSecure: showPassword,
                                      icon: showPassword
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      onPressed: () {
                                        setState(() {
                                          showPassword = !showPassword;
                                        });
                                      },
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: const Text(
                                      "RE-TYPE PASSWORD",
                                      style: TextStyle(
                                        fontFamily: "Body",
                                        fontSize: 14,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Colors.grey.shade200,
                                        ),
                                      ),
                                    ),
                                    child: buildTextField(
                                      text: "*  *  *  *  *  *  *  *",
                                      isSecure: showRetypePassword,
                                      icon: showRetypePassword
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      onPressed: () {
                                        setState(() {
                                          showRetypePassword =
                                              !showRetypePassword;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            /* ______________________________________________________________________________-------*/
                            buildButton(
                              textBtn: "Log in",
                              onPress: () => navigateAndFinish(
                                  context, const HomeLayout()),
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
          Padding(
            padding: const EdgeInsets.only(top: 45, left: 35),
            child: CircleAvatar(
              child: IconButton(
                onPressed: () {
                  navigateAndFinish(context, const Login());
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 17,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
