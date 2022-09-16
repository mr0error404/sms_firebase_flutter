import 'package:flutter/material.dart';

enum MobileVerificatonState {
  SHOW_MOBILE_FROM_STATE,
  SHOW_OTP_FROM_STATE,
}
class LoginSecreen extends StatefulWidget {
  const  LoginSecreen({Key? key}) : super(key: key);

  @override
  State<LoginSecreen> createState() => _LoginSecreenState();
}

class _LoginSecreenState extends State<LoginSecreen> {
  final currentState = MobileVerificatonState.SHOW_MOBILE_FROM_STATE;
  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  getMobileFromWidget(context){
    return  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:25.0,),
            child: TextFormField(
              controller:phoneController,
              decoration: InputDecoration(
                labelText: "Phone Number ",
                icon: Icon(Icons.phone,),
                // hintText: "Phone Number ",
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          MaterialButton(
              onPressed: (){},
              child: Text("SEND",),
              color: Colors.lightBlue,
              textColor: Colors.white,
          ),
        ],
      );
  }
  getOtpFromWidget(context){
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:25.0,),
          child: TextFormField(
            controller:otpController,
            decoration: InputDecoration(
              labelText: "OTP Number ",
              icon: Icon(Icons.phone,),
              // hintText: "Phone Number ",
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        MaterialButton(
          onPressed: (){},
          child: Text("VERIFY",),
          color: Colors.lightBlue,
          textColor: Colors.white,
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        child: currentState == MobileVerificatonState.SHOW_MOBILE_FROM_STATE
            ? getMobileFromWidget(context) : getOtpFromWidget(context),
        padding: const EdgeInsets.all(16),
      ),
    );
  }
}
/*'''
currentState == MobileVerificatonState.SHOW_MOBILE_FROM_STATE ?
          getMobileFromWidget(context) :
          getOtpFromWidget(context)
'''*/