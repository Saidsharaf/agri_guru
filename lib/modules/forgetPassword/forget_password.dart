import 'package:agri_guru/modules/forgetPassword/verification_password.dart';
import 'package:agri_guru/modules/login/login.dart';
import 'package:agri_guru/shared/component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    var forgetController = TextEditingController();
    var formKey = GlobalKey<FormState>();

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
                  padding: EdgeInsets.all(35),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        AppLocalizations.of(context)!.forgetPassword,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: "Tabela",
                        ),
                      ),
                      Text(
                        AppLocalizations.of(context)!.existAcc,
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
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Form(
                                key: formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
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
                                        textEditingController: forgetController,
                                        validate: (value) {
                                          if (value!.isEmpty) {
                                            return AppLocalizations.of(context)!
                                                .msgEmptyEmail;
                                          } else if (forgetController.text !=
                                              "admin1@gmail.com") {
                                            return AppLocalizations.of(context)!
                                                .msgValidEmail;
                                          }
                                          return null;
                                        },
                                        text: "example@gmail.com",
                                        type: TextInputType.emailAddress,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            /* ______________________________________________________________________________-------*/
                            buildButton(
                              textBtn: AppLocalizations.of(context)!.sendCode,
                              onPress: () {
                                if (formKey.currentState!.validate()) {
                                  showToast(
                                      msg: AppLocalizations.of(context)!
                                          .msgSendCode,
                                      state: toastStates.SUCCESS);
                                  navigateAndFinish(
                                      context, const VerificationPassword());
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
