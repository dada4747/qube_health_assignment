part of 'userfeeling_bloc.dart';

// @immutable
abstract class UserfeelingEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchUserFeeling extends UserfeelingEvent {}
