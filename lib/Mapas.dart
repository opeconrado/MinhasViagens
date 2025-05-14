import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

class Mapas extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<Mapas> {
  final MapController _mapController = MapController();
  LatLng? _currentLocation;
  bool _isLoading = true;
  String _errorMessage = '';
  bool _mapInitialized = false;
  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      bool serviceEnabled;
      LocationPermission permission;
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        setState(() {
          _isLoading = false;
          _errorMessage = 'Serviço de localização desabilitado';
        });
        return;
      }
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          setState(() {
            _isLoading = false;
            _errorMessage = 'Permissão de localização negada';
          });
          return;
        }
      }
      if (permission == LocationPermission.deniedForever) {
        setState(() {
          _isLoading = false;
          _errorMessage =
              'Permissão de localização está permanentemente negada';
        });
        return;
      }
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );
      setState(() {
        _currentLocation = LatLng(position.latitude, position.longitude);
        _isLoading = false;
      });
// Only move the map if it's already initialized
      if (_mapInitialized) {
        _mapController.move(_currentLocation!, 16);
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Erro ao buscar localização: ${e.toString()}';
      });
    }
  }

  Future<void> _refreshLocation() async {
    setState(() {
      _isLoading = true;
    });
    await _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Minha Localização",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _refreshLocation,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage.isNotEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(_errorMessage),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _refreshLocation,
                        child: const Text('Tente Novamente'),
                      ),
                    ],
                  ),
                )
              : FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(
                    initialCenter: _currentLocation!,
                    initialZoom: 16,
                    onMapReady: () {
                      setState(() {
                        _mapInitialized = true;
                      });
                      _mapController.move(_currentLocation!, 16);
                    },
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                      subdomains: const ['a', 'b', 'c'],
                      userAgentPackageName: 'com.example.app',
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          point: _currentLocation!,
                          width: 50,
                          height: 50,
                          child: const Icon(
                            Icons.location_pin,
                            size: 50,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
      floatingActionButton: _currentLocation != null && _mapInitialized
          ? FloatingActionButton(
              child: const Icon(Icons.my_location),
              onPressed: () {
                _mapController.move(_currentLocation!, 16);
              },
            )
          : null,
    );
  }
}
