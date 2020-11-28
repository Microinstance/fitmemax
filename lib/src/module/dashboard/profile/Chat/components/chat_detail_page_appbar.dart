import 'package:fitmemax/src/widgets/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatDetailPageAppBar extends StatelessWidget implements PreferredSizeWidget{
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Palette.x2Color,
      // flexibleSpace: SafeArea(
      //   child: Container(
      //     padding: EdgeInsets.only(right: 16),
      //     child: Row(
      //       children: <Widget>[
      //         IconButton(
      //           onPressed: (){
      //             Navigator.pop(context);
      //           },
      //           icon: Icon(Icons.arrow_back,color: Colors.black,),
      //         ),
      //         SizedBox(width: 2,),
      //         CircleAvatar(
      //           backgroundImage: AssetImage("images/userImage1.jpeg"),
      //           maxRadius: 20,
      //         ),
      //         SizedBox(width: 12,),
      //         Expanded(
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: <Widget>[
      //               Text("Jane Russel",style: TextStyle(fontWeight: FontWeight.w600),),
      //               SizedBox(height: 6,),
      //               Text("Online",style: TextStyle(color: Colors.green,fontSize: 12),),
      //             ],
      //           ),
      //         ),
      //         Icon(Icons.more_vert,color: Colors.grey.shade700,),
      //       ],
      //     ),
      //   ),
      // ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(15),
        ),
      ),
      leading: IconButton(
        onPressed: (){
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back,color: Colors.white,size: 25),
      ),
      actions: [
        IconButton(
          onPressed: (){

          },
          icon: Icon(Icons.more_vert,color: Colors.white,size: 25),
        ),
      ],
      title:   Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 26,
            backgroundColor: Colors.blue[200].withOpacity(0.5),
            child: CircleAvatar(
              radius: 24,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage("assets/profile/me.png"),
            ),
          ),
          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  Text("Jane Russel",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,),),
                ],
              ),
              SizedBox(height: 5,),
              Row(
                children: [
                  Text("Online",style: GoogleFonts.openSans(color: Colors.green,fontSize: 12,fontWeight: FontWeight.bold),),
                  SizedBox(width: 3,),
                  CircleAvatar(
                    radius: 3,
                    backgroundColor: Palette.x1Color,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(70);
}