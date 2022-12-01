import 'package:flutter/material.dart';
import 'package:email_auth/email_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailcontroller =TextEditingController();
  final TextEditingController _otpcontroller =TextEditingController();



  void sendOTP()async{
    EmailAuth emailAuth=EmailAuth(sessionName: "Test session");
    var res=await emailAuth.sendOtp(recipientMail: _emailcontroller.text);
    if(res)print("Otp Sent");
    else print("Problem With Otp Sending");
  }
  void verifyOTP() {
    EmailAuth emailAuth = EmailAuth(sessionName: "sessionName");
    var res = emailAuth.validateOtp(
        recipientMail:_emailcontroller.text, userOtp: _otpcontroller.text);
    if(res)print("Hey Otp Verified sucessfully!");
    else print("Please Check your Otp!!");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Verify Email",
              style: TextStyle( color: Colors.black,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: Colors.orange.shade700),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0)),
          Image.asset("images/bms.png",fit:BoxFit.fill),
          SizedBox(height: 20.0),
          Padding(padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: _emailcontroller,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: "Enter Email",
                        labelText: "Email",
                        suffixIcon:TextButton(
                          child: Text("Sent Otp",),
                          onPressed: ()=>sendOTP(),
                        )
                    ),
                  ),
                  SizedBox(height: 30.0),
                  TextField(
                      controller: _otpcontroller,
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "ENTER OTP",
                          labelText: "OTP" )),
                  SizedBox(height: 30.0),
                  ElevatedButton(
                    child: Text("Verify OTP",),
                    onPressed: ()=>verifyOTP(),
                  )
                ],
              )


          ),


        ],
      ),
    );
  }


}



/*import 'package:flutter/material.dart';
import 'package:email_auth/email_auth.dart';

class LoginPage extends StatefulWidget{

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _otpController = TextEditingController();

 // EmailAuth emailAuth =  new EmailAuth(sessionName: "Sample session");
  void sendOTP() async {
    EmailAuth emailAuth =  new EmailAuth(sessionName: "Sample session");

    var res = await emailAuth.sendOtp(
        recipientMail: _emailController.value.text, otpLength: 5
    );
    if(res){
      print("OTP sent");
    }
    else("We could not sent the otp");
  }

  void verifyOTP() {
    EmailAuth emailAuth =  new EmailAuth(sessionName: "Sample session");
    var res = emailAuth.validateOtp(
        recipientMail: _emailController.text,
        userOtp: _otpController.text);
    if(res){
      print("OTP verified");

    }
    else{
      print("Invalid OTP");
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Verify Email"),
      ),

      body: Column(

        children: [
          TextField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          //obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Enter Email",
                            labelText: "Email",
                            suffixIcon: TextButton(
                              child: Text("Send Otp"),
                              onPressed: () => sendOTP(),
                            )
                          ),


                        ),

                        SizedBox(
                          height: 50.0,
                        ),

          TextField(
            controller: _otpController,
            keyboardType: TextInputType.number,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Enter Otp",
              labelText: "Otp",
            ),


          ),

          SizedBox(
            height: 50.0,
          ),

          ElevatedButton(
              child: Text("Verify Otp"),
            onPressed: () => verifyOTP(),
          )


        ],
      ),

    );
  }

} */