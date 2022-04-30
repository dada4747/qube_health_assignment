import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:qube_health_assignment/Model/UserFeelingModel.dart';

import '../Services/repository.dart';

part 'userfeeling_event.dart';
part 'userfeeling_state.dart';

//
class UserfeelingBloc extends Bloc<UserfeelingEvent, UserfeelingState> {
  final ActivityRepository activityRepository;

  UserfeelingBloc({required this.activityRepository})
      : super(UserfeelingInitial()) {
    on<FetchUserFeeling>((event, emit) async {
      try {
        // await activityRepository.getActivity();
        FeelingModel? data = await activityRepository.getActivity();
        if (data != null) {
          emit(UserFeelingLoaded(feelings: data));
        }
      } catch (e) {
        emit(UserFeelingLoaded(exception: e as Exception));
      }
    });
  }
}
