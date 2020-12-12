import 'package:fitmemax/src/widgets/palette.dart';
import 'package:flutter/material.dart';

class FollowActivity extends StatefulWidget {
  final String followerUsername;
  final String followerImageUrl;
  final bool isFollowed ;
  FollowActivity({this.followerUsername, this.followerImageUrl, this.isFollowed = false});
  @override
  _FollowActivityState createState() => _FollowActivityState();
}

class _FollowActivityState extends State<FollowActivity> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return ListTile(
      contentPadding: EdgeInsets.all(8),
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: AssetImage(widget.followerImageUrl),
      ),
      title: RichText(
        text: TextSpan(
            children: [
              TextSpan(
                text: widget.followerUsername,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: ' started following  you.',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              TextSpan(
                text: '  2d',
                style: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
            ]),
      ),
      trailing:
      MaterialButton(
        height: 35,
        splashColor: Colors.green[200],
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5)),
        onPressed: (){},
        color: widget.isFollowed ? Palette.primaryColor : Colors.pink,
        child: Text(
          widget.isFollowed ? 'Following' : 'Follow',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

//

class CommentActivity extends StatefulWidget {

  final String commentedOnMediaUrl;
  final String otherUserProfileImageUrl;
  final String otherUsername;
  final String comment;
  final bool isMention;

  CommentActivity({this.commentedOnMediaUrl, this.otherUserProfileImageUrl, this.otherUsername, this.comment, this.isMention}) ;

  @override
  _CommentActivityState createState() => _CommentActivityState();
}

class _CommentActivityState extends State<CommentActivity> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: true,
      contentPadding: EdgeInsets.only(left: 10),
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: AssetImage(widget.otherUserProfileImageUrl),
      ),
      title: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: widget.otherUsername,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: widget.isMention
                  ? ' mentioned you in a comment:'
                  : ' liked your comment:',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            TextSpan(
              text: widget.isMention ? ' @gyakhoe' : '',
              style: TextStyle(
                color: Colors.blue[100],
              ),
            ),
            TextSpan(
              text: widget.comment,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            TextSpan(
              text: ' 3d',
              style: TextStyle(
                color: Colors.grey[400],
              ),
            ),
          ],
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.favorite_border,
              size: 12,
              color: Colors.grey[400],
            ),
            SizedBox(width: 10),
            Text(
              'Reply',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[400]),
            ),
          ],
        ),
      ),
      //* Need some gesture detection over here to convert follow to following
      trailing: Container(
        margin: EdgeInsets.only(right: 10),
        width: 45,
        height: 45,
        color: Colors.pink,
        child: Image(
          image: AssetImage(widget.commentedOnMediaUrl),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

//

class LikeActivity extends StatefulWidget {
  final String likedUsernames;
  final String postUrl;
  final String likedUserImageUrls;

  LikeActivity({this.likedUsernames, this.postUrl, this.likedUserImageUrls});

  @override
  _LikeActivityState createState() => _LikeActivityState();
}

class _LikeActivityState extends State<LikeActivity> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 10),
      leading:
        CircleAvatar(
        radius: 25,
        backgroundImage: AssetImage(widget.likedUserImageUrls),
      ),
      title: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: widget.likedUsernames,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: ' liked your post.',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            TextSpan(
              text: ' 3d',
              style: TextStyle(
                color: Colors.grey[400],
              ),
            ),
          ],
        ),
      ),
      trailing: Container(
        margin: EdgeInsets.only(right: 10),
        width: 45,
        height: 45,
        color: Colors.pink,
        child: Image(
          image: AssetImage(widget.postUrl),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}


