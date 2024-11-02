import 'package:agri_guru/modules/login/login.dart';
import 'package:agri_guru/shared/component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerificationPassword extends StatefulWidget {
  const VerificationPassword({super.key});

  @override
  State<VerificationPassword> createState() => _VerificationPasswordState();
}

class _VerificationPasswordState extends State<VerificationPassword> {
  var controller1 = TextEditingController();
  var controller2 = TextEditingController();
  var controller3 = TextEditingController();
  var controller4 = TextEditingController();
  var controller5 = TextEditingController();
  var controller6 = TextEditingController();
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
                  padding: EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Verification Password",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontFamily: "Tabela",
                        ),
                      ),
                      Text(
                        "We have sent a code to your email",
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
                      padding: const EdgeInsets.all(30),
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
                                  Form(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          height: 68,
                                          width: 50,
                                          child: TextFormField(
                                            onChanged: (value) {
                                              if (value.length == 1) {
                                                FocusScope.of(context)
                                                    .nextFocus();
                                              }
                                            },
                                            controller: controller1,
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.grey[200],
                                              border: UnderlineInputBorder(
                                                  borderSide: BorderSide.none),
                                            ),
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 23,
                                            ),
                                            keyboardType: TextInputType.number,
                                            textAlign: TextAlign.center,
                                            inputFormatters: [
                                              LengthLimitingTextInputFormatter(
                                                  1),
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 68,
                                          width: 50,
                                          child: TextFormField(
                                            onChanged: (value) {
                                              if (value.length == 1) {
                                                FocusScope.of(context)
                                                    .nextFocus();
                                              }
                                            },
                                            controller: controller2,
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.grey[200],
                                              border: UnderlineInputBorder(
                                                  borderSide: BorderSide.none),
                                            ),
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 23,
                                            ),
                                            keyboardType: TextInputType.number,
                                            textAlign: TextAlign.center,
                                            inputFormatters: [
                                              LengthLimitingTextInputFormatter(
                                                  1),
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 68,
                                          width: 50,
                                          child: TextFormField(
                                            onChanged: (value) {
                                              if (value.length == 1) {
                                                FocusScope.of(context)
                                                    .nextFocus();
                                              }
                                            },
                                            controller: controller5,
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.grey[200],
                                              border: UnderlineInputBorder(
                                                  borderSide: BorderSide.none),
                                            ),
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 23,
                                            ),
                                            keyboardType: TextInputType.number,
                                            textAlign: TextAlign.center,
                                            inputFormatters: [
                                              LengthLimitingTextInputFormatter(
                                                  1),
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 68,
                                          width: 50,
                                          child: TextFormField(
                                            onChanged: (value) {},
                                            controller: controller6,
                                            onFieldSubmitted: (value) {
                                              var code = controller1.text +
                                                  controller2.text +
                                                  controller3.text +
                                                  controller4.text +
                                                  controller5.text +
                                                  controller6.text;
                                              print(code);
                                            },
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.grey[200],
                                              border: UnderlineInputBorder(
                                                  borderSide: BorderSide.none),
                                            ),
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 23,
                                            ),
                                            keyboardType: TextInputType.number,
                                            textAlign: TextAlign.center,
                                            inputFormatters: [
                                              LengthLimitingTextInputFormatter(
                                                  1),
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                          ),
                                        ),
                                      ],
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
                                  msg: "Something went wrong, write the code again!",
                                  state: toastStates.ERROR,
                                );
                              
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
