// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble(this.message, this.userName, this.isMe, {required this.key});

  @override
  final Key key;
  final String message;
  final String userName;
  final bool isMe;
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  color: isMe ? Colors.grey[300] : Colors.blue[300],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                    bottomLeft:
                        !isMe ? Radius.circular(0) : Radius.circular(12),
                    bottomRight:
                        isMe ? Radius.circular(0) : Radius.circular(12),
                  )),
              width: 140,
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 16,
              ),
              margin: EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 8,
              ),
              child: Column(
                crossAxisAlignment:
                    isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    userName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    message,
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              )),
        ]);
  }
}

// ignore_for_file: prefer_const_constructors
// ignore_for_file: deprecated_member_use, prefer_const_constructors_in_immutables, use_key_in_widget_constructors