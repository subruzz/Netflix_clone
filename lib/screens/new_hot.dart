import 'package:flutter/material.dart';

class NewAndHotPage extends StatefulWidget {
  const NewAndHotPage({super.key});

  @override
  State<NewAndHotPage> createState() => _NewAndHotPageState();
}

class _NewAndHotPageState extends State<NewAndHotPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('new Nd hot'),
      ),
    );
  }
}
