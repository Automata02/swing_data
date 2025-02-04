import '../models/swing.dart';

abstract class SwingsState {}

class SwingsInitial extends SwingsState {}

class SwingsLoading extends SwingsState {}

class SwingsLoaded extends SwingsState {
  final List<String> files;
  final Swing? currentSwing;
  SwingsLoaded(this.files, {this.currentSwing});
}