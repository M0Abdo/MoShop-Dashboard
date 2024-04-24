import 'package:electronic_shop_dashboard/Controller/Screen/LoginControoler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/Color.dart';
import '../Controller/ValidInput.dart';
class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LogInController());
    return Scaffold(
     
      body: 
      GetBuilder<LogInController>(builder: (controller) => Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Form(
          key: controller.formstate,
          child: ListView(children: [
             
                    Padding(
                        padding: const EdgeInsets.only(top: 60.0,bottom: 80.0),
                        child: Text("Hello",style: const TextStyle(fontSize: 90,color: Colors.black),textAlign: TextAlign.center,)
                      ),
              
                    Padding(
                      padding: const EdgeInsets.only(left:45.0,right: 45.0),
                      child: Row(
                        children: [
                          Text("Login to your Account",style: const TextStyle(fontSize: 20.0,color: Color.fromARGB(255, 114, 114, 114),fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                    Padding(
              padding: const EdgeInsets.only(left: 50.0, right: 50.0, top: 25.0),
              child: TextFormField(
          validator: (value) {
            return validInput(value!, 5, 100, "");
          },
               controller: controller.emailControler,
          textInputAction: TextInputAction.next,
          cursorColor: const Color.fromARGB(255, 0, 0, 0),
          decoration: InputDecoration(
            errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 255, 0, 0))),
            focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 215, 0, 0))),
            suffixIcon: const Icon(
              Icons.person,
            ),
            suffixIconColor: Appcolor.primaryColor,
            floatingLabelStyle:
                const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            label:
                Text("Username", style: const TextStyle(fontWeight: FontWeight.bold)),
            contentPadding: const EdgeInsets.only(right: 15.0, left: 15.0),
            hintText: "Enter Username",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black12)),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0))),
          ),
              ),
            ),
                     Padding(
          padding: const EdgeInsets.only(left: 50.0, right: 50.0, top: 25.0),
          child: TextFormField(
            validator: (value) {
              return validInput(value!, 5, 100, "Password");
            },
            controller: controller.passControler,
           cursorColor: const Color.fromARGB(255, 0, 0, 0),
            obscureText: (controller.f == true) ? false : true,
            obscuringCharacter: "•",
            decoration: InputDecoration(
              errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 255, 0, 0))),
              focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 215, 0, 0))),
              suffixIcon: GestureDetector(
                child:(controller.f == true)? const Icon(Icons.visibility): 
                    const Icon(Icons.visibility_off),
                onTap: () {
                  controller.SeeHied();
                },
              ),
              suffixIconColor: Appcolor.primaryColor,
              floatingLabelStyle:
                  const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              label: Text(
                "Password",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              contentPadding: const EdgeInsets.only(right: 15.0, left: 15.0),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: "Enter Password",
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black12)),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0))),
            ),
          ),
              ),
                    Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: GestureDetector(
            onTap: () {
              controller.GoToSingIn();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 180,
                  decoration: BoxDecoration(
                      color: Appcolor.primaryColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                      child: Text(
                    "Sign in",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                        ),
                  )),
                ),
              ],
            )),
            )
          ],),
        ),
      ),)
    );
  }
}
