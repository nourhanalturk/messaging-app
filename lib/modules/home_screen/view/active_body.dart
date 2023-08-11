import 'package:flutter/cupertino.dart';

class ActiveContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        // Your Active content here
        child: Center(
          child: Text("Active Content"),
        ),
      ),
    );
  }
}