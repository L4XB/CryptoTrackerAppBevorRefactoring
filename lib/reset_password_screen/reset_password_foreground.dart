import 'package:chaining/overall_widgets/widgets/button.dart';
import 'package:chaining/overall_widgets/widgets/go_back_button.dart';
import 'package:chaining/overall_widgets/widgets/text_box.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    //Controller
    TextEditingController controllerEmail = TextEditingController();
    TextEditingController controllerEmailCode = TextEditingController();
    TextEditingController controllerPhone = TextEditingController();
    TextEditingController controllerPhoneCode = TextEditingController();
    TextEditingController controllerPassword = TextEditingController();
    TextEditingController controllerConfirmPassword = TextEditingController();

    return Scaffold(
      backgroundColor: const Color.fromARGB(80, 56, 56, 56),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: GoBackButton(onPressed: () {
                Navigator.pop(context);
              }),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Center(
                child: Text("Change Password",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Center(
                child: TextBoxLogIn(
                    controller: controllerEmail, inputText: "E-mail"),
              ),
            ),
            Stack(children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Center(
                  child: TextBoxLogIn(
                      controller: controllerEmailCode, inputText: "Code"),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(330, 48, 0, 0),
                child: Text(
                  "GET",
                  style: TextStyle(
                      color: Color.fromARGB(210, 161, 255, 208),
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Center(
                  child: TextBoxLogIn(
                      controller: controllerPhone, inputText: "Phone")),
            ),
            Stack(children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Center(
                  child: TextBoxLogIn(
                      controller: controllerPhoneCode, inputText: "Code"),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(330, 48, 0, 0),
                child: Text(
                  "GET",
                  style: TextStyle(
                      color: Color.fromARGB(210, 161, 255, 208),
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Center(
                child: TextBoxLogIn(
                    controller: controllerPassword, inputText: "New Password"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Center(
                child: TextBoxLogIn(
                    controller: controllerConfirmPassword,
                    inputText: "Confirm new Password"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Center(
                child: ButtonLogIn(
                    color: Color.fromARGB(210, 161, 255, 208),
                    text: "Change Password",
                    onPressed: () {}),
              ),
            )
          ],
        ),
      ),
    );
  }
}
