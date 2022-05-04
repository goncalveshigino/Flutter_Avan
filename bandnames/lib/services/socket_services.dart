
import 'package:flutter/widgets.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;



enum ServerStatus {
  online, 
  offline, 
  connecting
}

class SocketService with ChangeNotifier {

    ServerStatus _serverStatus = ServerStatus.connecting;

    get serverStatus => _serverStatus;

   SocketService(){
     _initConfig();
   }


    void _initConfig(){

        // Dart client
        IO.Socket socket = IO.io('https://192.168.43.42:8000',{
          'transports': ['websocket'], 
          'autoConnect': true
        });
     

          socket.on('connect',(_) {
          _serverStatus = ServerStatus.online;
          notifyListeners();
        });
        
     
        socket.on('disconnect',(_) {
             _serverStatus = ServerStatus.offline;
          notifyListeners();
        });
        
    }

}