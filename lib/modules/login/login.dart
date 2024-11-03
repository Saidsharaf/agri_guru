import 'package:agri_guru/modules/diseaseknowledge/disease_knowledge.dart';
import 'package:agri_guru/modules/forgetPassword/forget_password.dart';
import 'package:agri_guru/modules/register/register.dart';
import 'package:agri_guru/shared/component/component.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool checkBoxValue = false;
  bool showPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                    "Log In",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontFamily: "Tabela",
                    ),
                  ),
                  Text(
                    "sign in to your existing account",
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
                                            color: Colors.grey.shade200))),
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
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Checkbox(
                              activeColor: Color.fromARGB(255, 88, 211, 184),
                              onChanged: (value) {
                                setState(() {
                                  checkBoxValue = value!;
                                });
                              },
                              value: checkBoxValue,
                            ),
                            Text(
                              "Remember me",
                              style: TextStyle(
                                color: Colors.grey,
                                
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  navigate(context, const ForgetPassword());
                                },
                                child: Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 88, 211, 184),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        /* ______________________________________________________________________________-------*/
                        buildButton(
                          textBtn: "Log in",
                          onPress: () =>
                              navigateAndFinish(context, const Diseaseknowledge()),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "  Don't have an account ?",
                              style: TextStyle(
                                  fontFamily: "Body",
                                  color: Colors.grey,
                                  fontSize: 13),
                            ),
                            InkWell(
                              onTap: () {
                                navigate(context, const Register());
                              },
                              child: const Text(
                                " SIGN UP",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 88, 211, 184),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 1,
                              width: MediaQuery.sizeOf(context).width / 4,
                              color: Colors.grey[300],
                            ),
                            const Text(
                              "Or",
                              style: TextStyle(
                                  fontFamily: "Body",
                                  color: Colors.grey,
                                  fontSize: 14),
                            ),
                            Container(
                              height: 1,
                              width: MediaQuery.sizeOf(context).width / 4,
                              color: Colors.grey[300],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              backgroundColor:
                                  const Color.fromARGB(255, 0, 128, 255),
                              child: Image.asset("assets/images/facebook.png"),
                            ),
                            CircleAvatar(
                              //backgroundColor:const Color.fromARGB(255, 0, 128, 255),
                              child: Image.asset("assets/images/twitter.png"),
                            ),
                            CircleAvatar(
                              backgroundColor: Color.fromARGB(255, 27, 31, 47),
                              child: Image.asset(
                                "assets/images/apple2.png",
                                width: 25,
                              ),
                            ),
                          ],
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
    );
  }
}
