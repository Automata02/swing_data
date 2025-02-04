import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';
import 'swing_state.dart';
import '../models/swing.dart';
import 'package:flutter/services.dart' show rootBundle;

class SwingsCubit extends Cubit<SwingsState> {
  SwingsCubit() : super(SwingsInitial());

  Future<void> loadSwings(BuildContext context) async {
    emit(SwingsLoading());
    try {
      final manifestContent =
          await DefaultAssetBundle.of(context).loadString('AssetManifest.json');
      final Map<String, dynamic> manifestMap = json.decode(manifestContent);
      final files = manifestMap.keys
          .where((String key) =>
              key.startsWith('jsonData/') && key.endsWith('.json'))
          .toList()
        ..sort();
      emit(SwingsLoaded(files));
    } catch (e) {
      print('Error loading files: $e');
      emit(SwingsLoaded([]));
    }
  }

  Future<void> loadSwingData(String filePath) async {
    try {
      final jsonString = await rootBundle.loadString(filePath);
      final swing = swingFromJson(jsonString);

      if (state is SwingsLoaded) {
        final currentState = state as SwingsLoaded;
        emit(SwingsLoaded(currentState.files, currentSwing: swing));
      }
    } catch (e) {
      print('Error loading swing data: $e');
    }
  }

  String? getFilePath(int index) {
    if (state is SwingsLoaded) {
      final loadedState = state as SwingsLoaded;
      if (index >= 0 && index < loadedState.files.length) {
        return loadedState.files[index];
      }
    }
    return null;
  }

  void deleteSwing(int index) {
    if (state is SwingsLoaded) {
      final currentState = state as SwingsLoaded;
      final newFiles = List<String>.from(currentState.files);
      newFiles.removeAt(index);
      if (newFiles.isEmpty) {
        emit(SwingsInitial());
      } else {
        emit(SwingsLoaded(newFiles));
      }
    }
  }
}
