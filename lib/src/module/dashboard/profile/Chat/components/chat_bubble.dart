import 'package:fitmemax/src/module/dashboard/profile/Chat/models/chat_message.dart';
import 'package:fitmemax/src/module/dashboard/profile/Chat/page/chat_detail_page.dart';
import 'package:fitmemax/src/widgets/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatBubble extends StatefulWidget{
  ChatMessage chatMessage;
  ChatBubble({@required this.chatMessage});
  @override
  _ChatBubbleState createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
      child: Align(
        alignment: (widget.chatMessage.type == MessageType.Receiver?Alignment.topLeft:Alignment.topRight),
        child: Container(
          // width: _width*0.6,
          constraints: BoxConstraints(
            maxWidth: _width*0.6,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: (widget.chatMessage.type  == MessageType.Receiver?Colors.black:Colors.black),
          ),
          padding: EdgeInsets.only(left: 14,bottom: 7,top: 7,right: 14),
          child: Text(widget.chatMessage.message,style: GoogleFonts.openSans(color: widget.chatMessage.type  == MessageType.Receiver?Colors.green[100]:Palette.x1Color,fontSize: 15),),
        ),
      ),
    );
  }
}