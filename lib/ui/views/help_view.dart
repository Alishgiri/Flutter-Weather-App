import 'dart:async';

import 'package:flutter/material.dart';

import 'package:weatherapp/ui/views/home_view.dart';

class HelpView extends StatefulWidget {
  _HelpViewState createState() => _HelpViewState();
}

class _HelpViewState extends State<HelpView> {
  Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer(Duration(seconds: 5), onSkip);
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void onSkip() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => HomeView()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(50.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/frame.jpg'),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("We show weather for you", style: theme.textTheme.headline2),
              Align(
                alignment: Alignment.centerRight,
                child: FlatButton(onPressed: onSkip, child: Text('Skip…')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
