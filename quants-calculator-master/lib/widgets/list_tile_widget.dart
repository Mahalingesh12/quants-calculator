import 'package:flutter/material.dart';

class ListTileWidget extends StatefulWidget {
  ListTileWidget(
      {required this.title, required this.url, required this.ontap, super.key});

  Function ontap;
  String url;
  String title;

  @override
  State<ListTileWidget> createState() => _ListTileWidgetState();
}

class _ListTileWidgetState extends State<ListTileWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        onTap: () => widget.ontap(),
        leading: Image.asset(widget.url),
        title: Text(widget.title),
        subtitle: Text("Learn more"),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
