part of 'userfeeling_bloc.dart';

// @immutable
abstract class UserfeelingState extends Equatable {
  @override
  List<Object> get props => [];
}

class UserfeelingInitial extends UserfeelingState {}

class UserFeelingLoaded extends UserfeelingState {
  final FeelingModel? feelings;
  final Exception? exception;
  UserFeelingLoaded({this.feelings, this.exception});
  @override
  List<Object> get props => [];
}
