import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;
late User loggedInUser;

class ChatScreen extends StatefulWidget {
  static String id="chat_screen";
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;

  late String messageText;
  final messageTextController = TextEditingController();


  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }
  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    }
    catch(e){
      print("Some error");
      print(e);
    }
  }


  // void messageStream() async{
  //   await for(var snapshot in _firestore.collection('messages').snapshots()){
  //     for(var message in snapshot.docs){
  //         try{
  //           print(message.data()['text']);
  //         }
  //         catch(e){
  //           print("some error");
  //         }
  //     }
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                //Implement logout functionality
                _auth.signOut();
                Navigator.pop(context);
                // messageStream(); //this function was for testing
              }),
        ],
        title: Center(child: Text('⚡️Chat')),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessageStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController, //Controller is used to control the text field
                      //and it is done with the help of TextEditingController();
                      onChanged: (value) {
                        //Do something with the user input.
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      //Implement send functionality.
                      messageTextController.clear(); //clearing text field after user has send the text.
                      _firestore.collection("messages").add({
                        "text":messageText,
                        "sender":loggedInUser.email,
                      });
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
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
}

class MessageStream extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>( //SreamBuilder is used to create widget from the data we are getting from snapshot that is coming from firebase
      //every time the new data comes stream builder gets updated using setState
      //StreamBuilder can be of dynamic type but we can set it to QuerySnapshot type
      stream: _firestore.collection('messages').snapshots(),
      //builder is used to created widget from snapshot that we are getting
      //builder build everytime we get a new snapshot or in our chat new message/chat
      builder: (context,snapshot ){
        // snapshot from firebase is of type querySnapshot
        // but snapshot inside builder is AsyncSnapshot - and it contain firebase snapshot inside it, in it's data property
        if(snapshot.hasData){
          final messages = snapshot.data!.docs.reversed; //checking if docs is not null with ! sign
          List<MessageBubble> messageWidgets = [];
          for(var message in messages) {
            final messageText = message['text'];
            final messageSender = message['sender'];

            final currentUser = loggedInUser.email;

            final messageWidget = MessageBubble(text: messageText,
                sender: messageSender,
                isMe: currentUser == messageSender);
            //if logged in use is messageSender then we can change the color of message on basis of this and align it differently
            messageWidgets.add(messageWidget);
          }
          return Expanded(
            child: ListView(
              reverse: true, //reversing the list view.
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              children: messageWidgets,
            ),
          );
        }
        else{
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.lightBlueAccent,
              ),
            );
        }
        // final messages = snapshot.data!.docs.reversed;
        // for(var message in messages){
        //   print(message["text"]);
        // }
        // return Center(
        //   child: Text("Hello"),
        // );
      }
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble({required this.text,required this.sender,required this.isMe});

  final dynamic text;
  final dynamic sender;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: isMe? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
              "$sender",
              style:TextStyle(
                color:Colors.grey.shade600
              )
          ),
          SizedBox(height: 4,),
          Material(
            elevation: 10,
            borderRadius: isMe ? BorderRadius.only(topLeft: Radius.circular(30), bottomLeft:Radius.circular(30), bottomRight: Radius.circular(30)) : BorderRadius.only(topRight: Radius.circular(30), bottomLeft:Radius.circular(30), bottomRight: Radius.circular(30)),
            color: isMe ? Colors.blueAccent: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                "$text",
                style: TextStyle(
                  fontSize: 15,
                  color: isMe ? Colors.white: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
