import 'package:firebase_auth/firebase_auth.dart';
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
  MobileVerificatonState currentState = MobileVerificatonState.SHOW_MOBILE_FROM_STATE;
  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  var verificationId;
  bool showLoading = false;

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
              onPressed: ()async{
                setState((){
                  showLoading =true;
                });
               await _auth.verifyPhoneNumber(
                   phoneNumber: phoneController.text,
                   verificationCompleted: (phoneAuthCredential)async{
                     setState((){
                       showLoading =false;
                     });
                   },
                    verificationFailed: (verificationFailed)async{
                      setState((){
                        showLoading =false;
                      });
                      _scaffoldKey.currentState?.showSnackBar(content : Text(verificationFailed.message));
                    },
                    codeSent: (verificationId , resendingToken)async{
                     setState((){
                       showLoading = false;
                       currentState = MobileVerificatonState.SHOW_MOBILE_FROM_STATE;
                       this.verificationId=verificationId;
                     });
                    },
                    codeAutoRetrievalTimeout: (verificationId)async{

                    });
                },
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
              labelText: "Enter OTP ",
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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        child: showLoading ? Center(child: CircularProgressIndicator(),) : currentState == MobileVerificatonState.SHOW_MOBILE_FROM_STATE
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