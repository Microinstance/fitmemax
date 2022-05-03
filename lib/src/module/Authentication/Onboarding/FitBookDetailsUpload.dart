import 'package:fitmemax/API/APIClient.dart';
import 'package:fitmemax/Objects/Backgrounds.dart';
import 'package:fitmemax/Objects/ButtonOne.dart';
import 'package:fitmemax/Objects/TextFieldOne.dart';
import 'package:fitmemax/src/module/dashboard/Dashboard.dart';
import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:image_picker/image_picker.dart';

class FitBookDetailsUpload extends StatefulWidget {
  @override
  _FitBookDetailsUploadState createState() => _FitBookDetailsUploadState();
}

class _FitBookDetailsUploadState extends State<FitBookDetailsUpload> {

  String imagePath = "images/userImage5.jpeg";
  String feetbookID = "";
  APIClient client;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    client = new APIClient();
  }

  @override
  Widget build(BuildContext context) {
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
                  removeBottom: true,
                  removeTop: true,
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'FitBook Details',
                              style: TextStyles.HeadingBlack,
                            ),
                          ],
                        ),
                      ),
                         Padding(
                           padding: const EdgeInsets.only(top: 20,bottom: 10),
                           child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                GestureDetector(
                                  onTap: pickAvatar,
                                  child: CircleAvatar(
                                    radius: 50,
                                    backgroundColor: ColorPalette.PrimaryColor.withOpacity(0.4),
                                    child: CircleAvatar(
                                      radius: 48,
                                      //backgroundImage: AssetImage(imagePath),
                                      backgroundImage: AssetImage(imagePath),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: CircleAvatar(
                                      radius: 10,
                                      backgroundColor: Colors.black,
                                      child: Icon(Icons.add,color: Colors.white,size: 20,)),
                                ),
                              ],
                            ),
                        ],
                      ),
                         ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20,top: 15),
                        child: TextFieldOne(
                          hint: 'FitBook Id',
                          onChanged: (v) {
                            setState(() {
                              feetbookID = v;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: _width-90,
                              child: ButtonOne(
                                title: 'Finish',
                                colors: ColorPalette.PrimaryColor,
                                onPressed: finishRegistration,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  pickAvatar() async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.getImage(source: ImageSource.camera, maxWidth: 200, maxHeight: 300);
    setState(() {
      imagePath = image.path.toString();
    });
  }

  finishRegistration() async {
    if(feetbookID == ""){
      client.error("Please enter your feetbook id");
    } else {
      final user = await client.getLocal();
      final result = await client.finishRegistration({
        'users_id' : user['id'].toString(),
        'feetbook_id' : feetbookID
      });
      if(result['status'] == "success"){
        Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: Dashboard()));
      } else {
        client.error(result['message']);
      }
    }
  }

}
