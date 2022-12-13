import 'package:flutter/material.dart';

class PasswordCard extends StatefulWidget {
  final snapshot;
  const PasswordCard({Key? key, required this.snapshot}) : super(key: key);

  @override
  State<PasswordCard> createState() => _PasswordCardState();
}

class _PasswordCardState extends State<PasswordCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(children: [
      Text(widget.snapshot['sito']),
      Text(widget.snapshot['username']),
      Text(widget.snapshot['password']),
      Text(widget.snapshot['email']),
      Text(widget.snapshot['altro']),
      Text(widget.snapshot['link']),
      Text(widget.snapshot['categoria'])
    ]));
  }
}
