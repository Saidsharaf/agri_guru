import 'package:agri_guru/layout/homeLayout/home_layout.dart';
import 'package:agri_guru/modules/login/login.dart';
import 'package:flutter/material.dart';
import 'package:agri_guru/shared/component/component.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool checkBoxValue = false;
  bool showPassword = true;
  bool showRetypePassword = true;
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmController = TextEditingController();
  final regex = RegExp(r'^[a-zA-Z]+[0-9]+\@gmail\.com$');
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
                 Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        AppLocalizations.of(context)!.signUpP,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontFamily: "Tabela",
                        ),
                      ),
                      Text(
                        AppLocalizations.of(context)!.msgSignUp,
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
                      padding:
                          const EdgeInsets.only(top: 20, left: 15, right: 15),
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
                                        AppLocalizations.of(context)!.name,
                                        style: TextStyle(
                                            fontFamily: "Body",
                                            fontSize: 14,
                                            color: Colors.black54),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      child: buildTextField(
                                        textEditingController: nameController,
                                        text: "john doe",
                                        type: TextInputType.name,
                                        validate: (value) {
                                          if (value!.isEmpty) {
                                            return AppLocalizations.of(context)!.msgEmptyName;
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(left: 10),
                                      child:  Text(
                                        AppLocalizations.of(context)!.emailR,
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
                                        text: "example@gmail.com",
                                        type: TextInputType.emailAddress,
                                        validate: (value) {
                                          if (value!.isEmpty) {
                                            return AppLocalizations.of(context)!.msgEmptyEmailR;
                                          } else if (!regex.hasMatch(value)) {
                                            return AppLocalizations.of(context)!.msgValidEmailR;
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(left: 10),
                                      child:  Text(
                                        AppLocalizations.of(context)!.passwordR,
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
                                        textEditingController:
                                            passwordController,
                                        text: "*  *  *  *  *  *  *  *",
                                        isSecure: showPassword,
                                        validate: (value) {
                                          if (value!.isEmpty) {
                                            return AppLocalizations.of(context)!.msgEmptyPasswordR;
                                          }
                                          return null;
                                        },
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
                                      child:  Text(
                                        AppLocalizations.of(context)!.rePass,
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
                                        textEditingController:
                                            confirmController,
                                        text: "*  *  *  *  *  *  *  *",
                                        isSecure: showRetypePassword,
                                        validate: (value) {
                                          if (value!.isEmpty ||
                                              value !=
                                                  passwordController.text) {
                                            return AppLocalizations.of(context)!.msgRePass;
                                          }
                                          return null;
                                        },
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
                                textBtn: AppLocalizations.of(context)!.signUpBtn,
                                onPress: () {
                                  if (formKey.currentState!.validate()) {
                                    showToast(
                                        msg:AppLocalizations.of(context)!.afterSignUpBtn,
                                        state: toastStates.SUCCESS);
                                    navigateAndFinish(
                                        context, const HomeLayout());
                                  }
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
