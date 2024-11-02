import 'package:agri_guru/modules/forgetPassword/verification_password.dart';
import 'package:agri_guru/modules/login/login.dart';
import 'package:agri_guru/shared/component/component.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

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
                        "Forget Password",
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
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            /* ______________________________________________________________________________-------*/
                            buildButton(
                              textBtn: "Send Code",
                              onPress: () {
                                showToast(
                                    msg: "code send successfully",
                                    state: toastStates.SUCCESS);
                                navigateAndFinish(
                                    context, const VerificationPassword());
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
