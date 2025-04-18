import 'dart:async';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:homework_1/services/connectivity_service.dart';

class MockConnectivity extends Mock implements Connectivity {
  final StreamController<ConnectivityResult> _controller = 
      StreamController<ConnectivityResult>.broadcast();
  
  Stream<ConnectivityResult> get onConnectivityChanged => _controller.stream;
  
  void simulateConnectivityChange(ConnectivityResult result) {
    _controller.add(result);
  }
  
  @override
  Future<ConnectivityResult> checkConnectivity() async {
    return ConnectivityResult.wifi;
  }
  
  void dispose() {
    _controller.close();
  }
}

void main() {
  late ConnectivityService connectivityService;
  late MockConnectivity mockConnectivity;

  setUp(() {
    mockConnectivity = MockConnectivity();
    connectivityService = ConnectivityService();
  });

  tearDown(() {
    mockConnectivity.dispose();
  });

  test('Initial connectivity state should be true', () {
    expect(connectivityService.isConnected, true);
  });

  test('checkConnectivity should return true when connected', () async {
    when(mockConnectivity.checkConnectivity())
        .thenAnswer((_) async => ConnectivityResult.wifi);
    
    final result = await connectivityService.checkConnectivity();
    
    expect(result, true);
  });

  test('checkConnectivity should return false when disconnected', () async {
    when(mockConnectivity.checkConnectivity())
        .thenAnswer((_) async => ConnectivityResult.none);
    
    final result = await connectivityService.checkConnectivity();
    
    expect(result, false);
  });

  test('connectivityStream should emit values when connectivity changes', () async {
    final connectivityService = ConnectivityService();
    final mockConnectivity = MockConnectivity();
    
    expectLater(
      connectivityService.connectivityStream,
      emitsInOrder([false, true]),
    );
    
    mockConnectivity.simulateConnectivityChange(ConnectivityResult.none);
    mockConnectivity.simulateConnectivityChange(ConnectivityResult.wifi);
  });
}
