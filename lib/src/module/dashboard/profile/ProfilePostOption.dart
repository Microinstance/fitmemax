import 'package:fitmemax/styles.dart';
import 'package:flutter/material.dart';

class ProfilePostOption extends StatefulWidget {
  @override
  _ProfilePostOptionState createState() => _ProfilePostOptionState();
}

class _ProfilePostOptionState extends State<ProfilePostOption> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
          maxHeight: 400
      ),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
      ),
      child: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20,bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 5,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: borderRadious.primeryRadious,
                    color: ColorPalette.Grey.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Report",style: TextStyles.RegulerProfile,),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Copy Link",style: TextStyles.RegulerProfile,),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Share",style: TextStyles.RegulerProfile,),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Unfollow ",style: TextStyles.RegulerProfile,),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Mute",style: TextStyles.RegulerProfile,),
              ],
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Block",style: TextStyles.RegulerProfile,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
