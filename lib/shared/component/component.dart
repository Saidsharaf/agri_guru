import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void navigateAndFinish(context, Widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => Widget,
      ),
      (route) => false,
    );
void navigate(context, Widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Widget),
    );

Widget buildTextField(
    {@required String? text,
    bool isSecure = false,
    TextInputType? type,
    IconData? icon,
    Border? border,
    String? Function(String?)? validate,
    @required TextEditingController? textEditingController,
    void Function()? onPressed}) {
  return TextFormField(
    validator: validate,
    controller: textEditingController,
    obscureText: isSecure,
    keyboardType: type,
    decoration: InputDecoration(
      suffixIcon: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: Colors.grey,
          )),
      fillColor: Colors.grey[300],
      hintText: text,
      hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide.none,
      ),
      filled: true,
    ),
  );
}

Widget buildButton({
  @required String? textBtn,
  VoidCallback? onPress,
}) {
  return MaterialButton(
    onPressed: onPress,
    height: 50,
    color: Color.fromARGB(255, 88, 211, 184),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    ),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Text(
          textBtn!.toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: "Tabela",
          ),
        ),
      ),
    ),
  );
}

Widget defultFormField({
  @required TextEditingController? controller,
  @required TextInputType? type,
  @required String? lable,
  String? msg,
  @required IconData? prefix,
  IconData? suffix,
  bool isScure = false,
  VoidCallback? iconPress,
  VoidCallback? onTap,
  void Function(String)? onChange,
  void Function(String)? onSumbmit,
}) =>
    Container(
      height: 85,
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        obscureText: isScure,
        style: TextStyle(
          fontSize: 13,
        ),
        onTap: onTap,
        onFieldSubmitted: onSumbmit,
        onChanged: onChange,
        validator: (value) {
          if (value!.isEmpty) {
            return msg;
          }
          return null;
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          labelText: lable,
          prefixIcon: Icon(
            prefix,
          ),
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: iconPress,
                  icon: Icon(
                    suffix,
                  ))
              : null,
        ),
      ),
    );

void bottomSheet(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      var controller = TextEditingController();
      return Container(
        height: 450,
        color: Colors.grey[300],
        child: Padding(
          padding: const EdgeInsetsDirectional.all(20),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                'Forgot password',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '  Enter your email for verification process',
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              defultFormField(
                lable: "Email",
                prefix: Icons.email,
                type: TextInputType.emailAddress,
                controller: controller,
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: ElevatedButton(
                  child: const Text('Close BottomSheet'),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

void showToast({
  @required String? msg,
  @required toastStates? state,
}) {
  Fluttertoast.showToast(
    msg: msg!,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: chooseToastColor(state!),
    textColor: Colors.white,
    fontSize: 13.0,
  );
}

enum toastStates { SUCCESS, WARNING, ERROR }

Color chooseToastColor(toastStates state) {
  Color color;
  switch (state) {
    case toastStates.SUCCESS:
      color = Colors.green;
      break;
    case toastStates.ERROR:
      color = Colors.red;
      break;
    case toastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}
