import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:online_mobile_banking_system/ui/route/route.dart';

class HomePage2222 extends StatelessWidget {
 final box = GetStorage();
 final FirebaseAuth _auth = FirebaseAuth.instance;

  void logOut(context) async {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("are u sure to logout?"),
          content: Row(
            children: [
              ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut().then(
                        (value) => Fluttertoast.showToast(
                        msg: "Logout Successful"),
                  );
                  await box.remove('uid');
                  await box.remove('phnum');
                  Get.toNamed(loginSignUpScreen);
                },
                child: Text("Yes"),
              ),
              SizedBox(
                width: 10.w,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("No"),
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: (){
            logOut(context);
          }, child: Text('Logout')),

          Text('${_auth.currentUser!.email}')
        ],
      ),
    );
  }
}
