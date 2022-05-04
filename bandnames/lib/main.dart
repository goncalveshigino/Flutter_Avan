import 'package:bandnames/pages/status.dart';
import 'package:bandnames/services/socket_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/home.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {

  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
          ChangeNotifierProvider(create: (_) => SocketService() )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'status',
        routes: {
          'home': ( _ ) => const HomePage(),
          'status': (_) => const StatusPage()
        },
      ),
    );
  }
}