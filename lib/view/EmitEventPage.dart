import 'package:flutter/material.dart';
import '../event/EventBus.dart';

class EmitEventPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('触发事件'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('触发事件'),
          onPressed: (){
            eventBus.emit('login', '蔡徐坤');
          },
        ),
      ),
    );
  }
}
