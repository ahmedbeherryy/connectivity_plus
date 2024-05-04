// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const ConnectivityApp());
// }
//
// class ConnectivityApp extends StatelessWidget {
//   const ConnectivityApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: StreamBuilder<ConnectivityResult>(
//           stream: Connectivity().onConnectivityChanged,
//           builder: (context, snapshot) {
//             return Scaffold(
//               body: snapshot.data == ConnectivityResult.none
//                   ? const Center(child: Text('no connection'))
//                   : const Center(child: Text('connection')),
//             );
//           }),
//     );
//   }
// }

//*************************************


import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ConnectivityApp());
}

class ConnectivityApp extends StatelessWidget {
  const ConnectivityApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamBuilder<ConnectivityResult>(
        stream: Connectivity().onConnectivityChanged,
        builder: (context, snapshot) {
          final connectivityResult = snapshot.data;
          String connectionStatus = '';

          if (connectivityResult == ConnectivityResult.wifi) {
            connectionStatus = 'Connect to wifi';
          } else if (connectivityResult == ConnectivityResult.mobile) {
            connectionStatus = 'Connect to Data';
          } else {
            connectionStatus = 'No Connection';
          }
          return Scaffold(
            body: Center(child: Text(connectionStatus)),
          );
        },
      ),
    );
  }
}