import 'package:get_server/get_server.dart';

void main() {
  runApp(
    GetServerApp(
      port: 443,
      home: Home(),
    ),
  );
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Welcome to fucking GetX!');
  }
}