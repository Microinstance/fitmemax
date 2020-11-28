import 'package:fitmemax/src/module/dashboard/profile/Chat/page/chat_detail_page.dart';
import 'package:fitmemax/src/widgets/palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatUsersList extends StatefulWidget{
  String text;
  String secondaryText;
  String image;
  String time;
  bool isMessageRead;
  ChatUsersList({@required this.text,@required this.secondaryText,@required this.image,@required this.time,@required this.isMessageRead});
  @override
  _ChatUsersListState createState() => _ChatUsersListState();
}

class _ChatUsersListState extends State<ChatUsersList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return ChatDetailPage();
        }));
      },
      child: Container(
        padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Stack(
                    overflow: Overflow.visible,
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 32,
                        backgroundColor: Colors.blue[200].withOpacity(0.5),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage(widget.image),
                        ),
                      ),
                      Positioned(
                          bottom: -1,
                          child: Icon(
                            Icons.check_circle,
                            color: Colors.blueAccent,
                            size: 18,
                          ))
                    ],
                  ),
                  // CircleAvatar(
                  //   backgroundImage: AssetImage(widget.image),
                  //   maxRadius: 30,
                  // ),
                  SizedBox(width: 16,),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(widget.text,style: GoogleFonts.raleway(fontSize: 20,color: Colors.white),),
                          SizedBox(height: 6,),
                          Text(widget.secondaryText,style: TextStyle(fontSize: 15,color: Colors.grey.withOpacity(0.9)),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(widget.time,style: TextStyle(fontSize: 14,color: widget.isMessageRead?Palette.x1Color:Colors.grey.shade500),),
          ],
        ),
      ),
    );
  }
}