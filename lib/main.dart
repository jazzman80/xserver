import 'package:get_server/get_server.dart';

void main() {
  runApp(GetServerApp(
    home: const Home()
  ));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Hello, Docker!!!');
  }
}
