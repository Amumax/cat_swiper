import 'dart:async';

class ConnectivityService {
  final StreamController<bool> _connectivityController = 
      StreamController<bool>.broadcast();

  Stream<bool> get connectivityStream => _connectivityController.stream;

  ConnectivityService() {
    // Initialize with connected state
    _connectivityController.add(true);
  }

  Future<bool> checkConnectivity() async {
    // Simple implementation for now
    return true;
  }

  void dispose() {
    _connectivityController.close();
  }
}
