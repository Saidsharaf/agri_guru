import 'package:agri_guru/modules/login/login.dart';
import 'package:agri_guru/shared/component/component.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 88, 211, 184),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(70),
                    bottomRight: Radius.circular(70),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.only(
                    top: 90,
                  ),
                  height: 150,
                  width: 288,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border:
                        Border.all(color: Color.fromARGB(255, 88, 211, 184)),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(38, 41, 37, 0.29),
                        blurRadius: 15,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: Color.fromARGB(255, 88, 211, 184),
                        child: CircleAvatar(
                          radius: 33.3,
                          backgroundImage: AssetImage("assets/images/girl.jpg"),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        AppLocalizations.of(context)!.deliveryName,
                        style: TextStyle(
                          fontFamily: "Body",
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 150,
                          decoration: BoxDecoration(
                              //color:  Color.fromARGB(255, 88, 211, 184),
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: Color.fromARGB(255, 88, 211, 184))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.edit,
                                size: 16,
                                color: Color.fromARGB(255, 53, 92, 83),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                AppLocalizations.of(context)!.editProfile,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 53, 92, 83),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: SettingsList(
              sections: [
                SettingsSection(
                  title: Text(AppLocalizations.of(context)!.system),
                  tiles: [
                    SettingsTile(
                      title: Text(AppLocalizations.of(context)!.language),
                      leading: Icon(Icons.language),
                      onPressed: (BuildContext context) {},
                    ),
                    SettingsTile.switchTile(
                      initialValue: true,
                      title: Text(AppLocalizations.of(context)!.useSystemTheme),
                      leading: Icon(Icons.phone_android),
                      onToggle: (value) {
                        setState(() {
                          //isSwitched = value;
                        });
                      },
                    ),
                  ],
                ),
                SettingsSection(
                  title: Text(AppLocalizations.of(context)!.security),
                  tiles: [
                    SettingsTile(
                      title: Text(AppLocalizations.of(context)!.security),
                      leading: Icon(Icons.lock),
                      onPressed: (BuildContext context) {},
                    ),
                    SettingsTile.switchTile(
                      initialValue: true,
                      title: Text(AppLocalizations.of(context)!.usefingerprint),
                      leading: Icon(Icons.fingerprint),
                      onToggle: (value) {},
                    ),
                  ],
                ),
                SettingsSection(
                  title: Text(AppLocalizations.of(context)!.logOut),
                  tiles: [
                    SettingsTile(
                      title: Text(AppLocalizations.of(context)!.logOut),
                      leading: Icon(Icons.logout_outlined),
                      onPressed: (BuildContext context) {
                        navigateAndFinish(context, Login());
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
