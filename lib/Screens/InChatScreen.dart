import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:whatsappclone/Models/ChatUser.dart';
import 'package:whatsappclone/Models/Message.dart';
import 'package:whatsappclone/Models/my_flutter_app_icons.dart';

class InChatScreen extends StatefulWidget {
  ChatUser user;

  InChatScreen({@required this.user});
  @override
  _InChatScreenState createState() => _InChatScreenState();
}

class _InChatScreenState extends State<InChatScreen> {
  TextEditingController _messageController;
  @override
  void initState() {
    super.initState();
    _messageController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Theme.of(context).accentColor,
        appBar: new AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 0.0,
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.videocam), onPressed: () {}),
            new IconButton(icon: new Icon(Icons.call), onPressed: () {}),
            new IconButton(icon: new Icon(Icons.more_vert), onPressed: () {}),
          ],
          title: new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              new Container(
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.circular(60.0)),
                width: ScreenUtil().setWidth(165.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new Container(
                      child: new IconButton(
                          icon: new Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ),
                    new ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: Image.asset(
                        widget.user.imageURL,
                        fit: BoxFit.cover,
                        height: ScreenUtil().setHeight(55.0),
                        width: ScreenUtil().setWidth(67.0),
                      ),
                    ),
                    new SizedBox(width: ScreenUtil().setWidth(2.0))
                  ],
                ),
              ),
              new Expanded(
                child: new Container(
                  padding: EdgeInsets.fromLTRB(
                      ScreenUtil().setWidth(10.0), 0.0, 0.0, 0.0),
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  child: new Text(
                    widget.user.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: new TextStyle(fontSize: ScreenUtil().setSp(30.0)),
                  ),
                ),
              )
            ],
          ),
        ),
        body: new Column(
          children: <Widget>[
            new Expanded(
                flex: 12,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: ScreenUtil().setWidth(20.0),
                    right: ScreenUtil().setWidth(20.0),
                  ),
                  child: new ListView.builder(
                    itemCount: msgs.length,
                    reverse: true,
                    itemBuilder: (context, index) {
                      return msgs[index].isMe
                          ? new Bubble(
                              margin: BubbleEdges.only(
                                  top: (index < msgs.length - 1 &&
                                          msgs[index + 1].isMe)
                                      ? ScreenUtil().setHeight(5.0)
                                      : ScreenUtil().setHeight(20.0),
                                  left: ScreenUtil().setWidth(100.0),
                                  bottom: index == 0
                                      ? ScreenUtil().setHeight(10.0)
                                      : ScreenUtil().setHeight(0.0)),
                              nip: (index < msgs.length - 2 &&
                                      msgs[index + 1].isMe)
                                  ? BubbleNip.no
                                  : BubbleNip.rightTop,
                              color: Color.fromRGBO(225, 255, 199, 1.0),
                              nipHeight: ScreenUtil().setHeight(12.0),
                              alignment: Alignment.centerRight,
                              elevation: 0.4,
                              child: new Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  new Text(
                                    msgs[index].msg,
                                  ),
                                  new SizedBox(
                                    height: ScreenUtil().setHeight(10.0),
                                  ),
                                  new Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        msgs[index].time,
                                        style: new TextStyle(
                                            fontSize: ScreenUtil().setSp(20.0),
                                            color: Colors.grey),
                                      ),
                                      new SizedBox(
                                        width: ScreenUtil().setWidth(10.0),
                                      ),
                                      new Icon(
                                        msgs[index].sent
                                            ? Icons.check
                                            : MyFlutterApp
                                                .icons8_double_tick_50,
                                        color: msgs[index].seen
                                            ? Colors.blue
                                            : Colors.grey,
                                        size: ScreenUtil().setSp(27.0),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          : new Bubble(
                              margin: BubbleEdges.only(
                                  top: (index < msgs.length - 2 &&
                                          msgs[index + 1].isMe)
                                      ? ScreenUtil().setHeight(20.0)
                                      : ScreenUtil().setHeight(5.0),
                                  right: ScreenUtil().setWidth(100.0)),
                              nip: (index < msgs.length - 1 &&
                                      msgs[index + 1].isMe)
                                  ? BubbleNip.leftTop
                                  : BubbleNip.no,
                              nipHeight: ScreenUtil().setHeight(12.0),
                              alignment: Alignment.centerLeft,
                              elevation: 0.4,
                              child: new Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  new Text(
                                    msgs[index].msg,
                                  ),
                                  new SizedBox(
                                    height: ScreenUtil().setHeight(10.0),
                                  ),
                                  new Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        msgs[index].time,
                                        style: new TextStyle(
                                            fontSize: ScreenUtil().setSp(20.0),
                                            color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                    },
                  ),
                )),
            new Container(
              padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(5.0)),
              height: ScreenUtil().setHeight(75.0),
              decoration: new BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: new BorderRadius.circular(30.0)),
              child: new Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(10.0),
                    vertical: ScreenUtil().setHeight(0.0)),
                child: Row(
                  children: <Widget>[
                    new Expanded(
                      flex: 15,
                      child: new Container(
                        height: double.infinity,
                        decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius: new BorderRadius.circular(50.0)),
                        child: new Align(
                          alignment: Alignment.center,
                          child: new TextField(
                            controller: _messageController,
                            cursorColor: Theme.of(context).primaryColor,
                            decoration: new InputDecoration(
                                hintText: "Type a message",
                                border: InputBorder.none,
                                suffixIcon: Padding(
                                  padding: EdgeInsets.only(
                                      right: ScreenUtil().setWidth(20.0)),
                                  child: new Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Icon(
                                        Icons.attachment,
                                        color: Colors.grey,
                                      ),
                                      new SizedBox(
                                          width: ScreenUtil().setWidth(15.0)),
                                      new Icon(
                                        Icons.camera_alt,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                ),
                                prefixIcon: new Icon(
                                  Icons.sentiment_satisfied,
                                  size: ScreenUtil().setSp(45.0),
                                  color: Colors.grey,
                                )),
                          ),
                        ),
                      ),
                    ),
                    new SizedBox(
                      width: ScreenUtil().setWidth(10.0),
                    ),
                    new Expanded(
                        flex: 2,
                        child: new Container(
                            height: double.infinity,
                            decoration: new BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: new BorderRadius.circular(50.0)),
                            child: Center(
                              child: new Icon(
                                Icons.send,
                                size: ScreenUtil().setSp(40.0),
                                color: Colors.white,
                              ),
                            )))
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
