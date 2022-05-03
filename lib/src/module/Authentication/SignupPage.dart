import 'package:fitmemax/API/APIClient.dart';
import 'package:fitmemax/Objects/Backgrounds.dart';
import 'package:fitmemax/Objects/ButtonOne.dart';
import 'package:fitmemax/Objects/PasswordFieldOne.dart';
import 'package:fitmemax/Objects/SocialButton.dart';
import 'package:fitmemax/Objects/TextFieldOne.dart';
import 'package:fitmemax/src/ListData/ListData.dart';
import 'package:fitmemax/src/module/Authentication/SigninPage.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import '../dashboard/Dashboard.dart';
import 'Onboarding/GoalChoice.dart';
import 'Onboarding/MedicalCondition.dart';
import 'Onboarding/PhysicalCondition.dart';
import 'SignupVerify.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_login_facebook/flutter_login_facebook.dart';

import 'SocialSignUP.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  String _CountryValue = "+91";

  String name = "";
  String email = "";
  String phone = "";
  String password = "";

  APIClient client;

  GoogleSignInAccount _currentUser;
  String _contactText = '';

  GoogleSignIn _googleSignIn = GoogleSignIn(
    // Optional clientId
    clientId: '883112733921-jbjo6f25sm80ofpn3k7aejbsc04ojdrg.apps.googleusercontent.com',
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  // Facebook
  final plugin = FacebookLogin(debug: true);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    client = new APIClient();

    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        _currentUser = account;
      });
      if (_currentUser != null) {
        _handleGetContact(_currentUser);
      }
    });
    _googleSignIn.signInSilently();

  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
    ));
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Backgrounds(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Container(
                  width: _width * 0.6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Image.asset(
                          'assets/logo/splash-Screen.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 3.0, spreadRadius: 3.0),
                  ],
                  borderRadius: borderRadious.primeryRadious,
                ),
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  removeBottom: true,
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding:  EdgeInsets.only(bottom: 20),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Create Account!',
                              style: TextStyles.HeadingBlack,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20,top: 10),
                        child: TextFieldOne(
                          hint: 'Name',
                          onChanged: (v) {
                            setState(() {
                              name = v;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20,top: 10),
                        child: TextFieldOne(
                          hint: 'Email Id',
                          onChanged: (v) {
                            setState(() {
                              email = v;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20,top: 10),
                        child: SizedBox(
                          width: _width-80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 75,
                                child: Container(
                                  padding: EdgeInsets.only(
                                    top: 8,
                                    bottom: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                    borderRadius: borderRadious.primeryRadious,
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: ButtonTheme(
                                      alignedDropdown: true,
                                      child: DropdownButton(
                                        isDense: true,
                                        hint: Text("+91",style: TextStyles.BodyBlack,
                                        ),
                                        value: _CountryValue,
                                        items: Data().countryCode.map((value) {
                                          return DropdownMenuItem(
                                            value: value,
                                            child: Text(value,style: TextStyles.BodyBlack,
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            _CountryValue = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: _width-80-95,
                                child: TextFieldOne(
                                  hint: 'Phone Number',
                                  onChanged: (v) {
                                    setState(() {
                                      phone = v;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20,top: 10),
                        child: PasswordFieldOne(
                          hint: 'Password',
                          onChanged: (v) {
                            setState(() {
                              password = v;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25,left: 20,right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: _width-90,
                              child: ButtonOne(
                                title: 'Sign Up',
                                colors: ColorPalette.PrimaryColor,
                                onPressed: signUP,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20,top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 1,
                              width: (_width/2)-80,
                              color: Colors.black.withOpacity(0.3),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 5, right: 5),
                              child: Text(
                                'Or',
                                style: TextStyles.BodyMediumPrimary,
                              ),
                            ),
                            Container(
                              height: 1,
                              width: (_width/2)-80,
                              color: Colors.black.withOpacity(0.3),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20,right: 20,top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SocialButton(
                              colors: Colors.black,
                              onPressed: signUP,
                              image:  'assets/sign/apple.png',
                            ),
                            SocialButton(
                              colors: Colors.blue[900],
                              onPressed: _onPressedLogInButton,
                              image: 'assets/sign/facebook.png',
                            ),
                            SocialButton(
                              colors: ColorPalette.GreyLightest,
                              onPressed: _handleSignIn,
                              image:  'assets/sign/google.png',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10,top: 20,bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Already Have an Account?",
                    style: TextStyles.RegulerBlack,),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: SigninPage()));
                    },
                    child: Text(
                      "Sign In!",
                      style: TextStyles.BodyMediumPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  signUP() async {
    if(name == ""){
      client.error("Please enter your name");
    } else if( email == ""){
      client.error("Please enter your email");
    } else if (phone == ""){
      client.error("Please enter your phone");
    } else if(password == ""){
      client.error("Please enter your password");
    } else {
      showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        isDismissible: false,
        builder: (BuildContext context) {
          return SignupVerify(name: name, email: email, password: password, phone: phone,);
        },
        isScrollControlled: true,
      );
    }
  }


  googleSignIn() async {


  }
  Future<void> _handleGetContact(GoogleSignInAccount user) async {
    setState(() {
      _contactText = 'Loading contact info...';
    });
    final http.Response response = await http.get(
      Uri.parse('https://people.googleapis.com/v1/people/me/connections'
          '?requestMask.includeField=person.names'),
      headers: await user.authHeaders,
    );
    if (response.statusCode != 200) {
      setState(() {
        _contactText = 'People API gave a ${response.statusCode} '
            'response. Check logs for details.';
      });
      print('People API ${response.statusCode} response: ${response.body}');
      return;
    }
    final Map<String, dynamic> data =
    json.decode(response.body) as Map<String, dynamic>;
    final String namedContact = _pickFirstNamedContact(data);
    setState(() {
      if (namedContact != null) {
        _contactText = 'I see you know $namedContact!';
      } else {
        _contactText = 'No contacts to display.';
      }
    });
  }
  String _pickFirstNamedContact(Map<String, dynamic> data) {
    final List<dynamic> connections = data['connections'] as List<dynamic>;
    final Map<String, dynamic> contact = connections?.firstWhere(
          (dynamic contact) => contact['names'] != null,
      orElse: () => null,
    ) as Map<String, dynamic>;
    if (contact != null) {
      final Map<String, dynamic> name = contact['names'].firstWhere(
            (dynamic name) => name['displayName'] != null,
        orElse: () => null,
      ) as Map<String, dynamic>;
      if (name != null) {
        return name['displayName'] as String;
      }
    }
    return null;
  }
  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
      print(_currentUser);
    } catch (error) {
      print(error);
    }
  }
  Future<void> _handleSignOut() => _googleSignIn.disconnect();

  // Facebook

  Future<void> _onPressedLogInButton() async {

    await plugin.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email,
    ]);

    final token = await plugin.accessToken;
    FacebookUserProfile profile;
    String email;
    String imageUrl;

    if (token != null) {
      profile = await plugin.getUserProfile();
      if (token.permissions.contains(FacebookPermission.email.name)) {
        email = await plugin.getUserEmail();
      }
      imageUrl = await plugin.getProfileImageUrl(width: 100);
    }

    final result = await client.socialLogin({
      'email' : email.toString()
    });

    if(result['status'] == "success"){
      final physical_condition = result['data']['profile']['physical_condition'];
      final medical_condition = result['data']['profile']['medical_condition'];
      final gole = result['data']['profile']['gole'];

      if(physical_condition == 0){
        Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: PhysicalCondition()));
      } else if(medical_condition == 0){
        Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: MedicalCondition()));
      } else if(gole == 0){
        Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: GoalChoice()));
      } else {
        Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: Dashboard()));
      }
    } else {
      Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: SocialSignUp(email: email, name: profile.name,)));
    }

  }

}
