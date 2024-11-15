import 'package:agri_guru/layout/homeLayout/home_layout.dart';
import 'package:agri_guru/modules/forgetPassword/forget_password.dart';
import 'package:agri_guru/modules/register/register.dart';
import 'package:agri_guru/shared/component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool checkBoxValue = false;
  bool showPassword = true;
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

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
             Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    AppLocalizations.of(context)!.logIn,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontFamily: "Tabela",
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context)!.msgLogin,
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
                  padding: const EdgeInsets.only(top: 20, left: 14, right: 14),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Form(
                      key: formKey,
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
                                  child:  Text(
                                    AppLocalizations.of(context)!.email,
                                    style: TextStyle(
                                        fontFamily: "Body",
                                        fontSize: 14,
                                        color: Colors.black54),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  child: buildTextField(
                                    textEditingController: emailController,
                                    onPressed: () {
                                      print(emailController.toString());
                                    },
                                    text: "example@gmail.com",
                                    type: TextInputType.emailAddress,
                                    validate: (value) {
                                      if (value!.isEmpty
                                          ) {
                                        return AppLocalizations.of(context)!.msgEmptyEmail;
                                      }else if(emailController.text != "admin1@gmail.com"){
                                        return AppLocalizations.of(context)!.msgValidEmail;
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 10),
                                  child:  Text(
                                    AppLocalizations.of(context)!.password,
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
                                    textEditingController: passwordController,
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
                                    validate: (value) {
                                      if (value!.isEmpty) {
                                        return AppLocalizations.of(context)!.msgEmptyPassword;
                                      }
                                      return null;
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
                                AppLocalizations.of(context)!.remember,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
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
                                    AppLocalizations.of(context)!.forgot,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Frank",
                                      fontSize: 12,
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
                              textBtn: AppLocalizations.of(context)!.logInBtn,
                              onPress: () {
                                if (formKey.currentState!.validate()) {
                                  navigateAndFinish(
                                      context, const HomeLayout());
                                }
                              }),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                               Text(
                                AppLocalizations.of(context)!.doNot,
                                style: TextStyle(
                                    fontFamily: "Body",
                                    color: Colors.grey,
                                    fontSize: 13),
                              ),
                              InkWell(
                                onTap: () {
                                  navigate(context, const Register());
                                },
                                child:  Text(
                                  AppLocalizations.of(context)!.signUp,
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
                               Text(
                                AppLocalizations.of(context)!.or,
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
                                child:
                                    Image.asset("assets/images/facebook.png"),
                              ),
                              CircleAvatar(
                                //backgroundColor:const Color.fromARGB(255, 0, 128, 255),
                                child: Image.asset("assets/images/twitter.png"),
                              ),
                              CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(255, 27, 31, 47),
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
            ),
          ],
        ),
      ),
    );
  }
}
