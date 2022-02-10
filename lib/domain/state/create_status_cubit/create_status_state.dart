part of 'create_status_cubit.dart';

abstract class CreateStatusState extends Equatable {
  const CreateStatusState();

  @override
  List<Object> get props => [];
}

class CreateStatusInitial extends CreateStatusState {}

class CreateStatusLoading extends CreateStatusState {}

class CreateStatusLoaded extends CreateStatusState {
  final UserCreateStatus createStatus;

  const CreateStatusLoaded(this.createStatus);
}

class CreateStatusError extends CreateStatusState {
  final String? error;

  const CreateStatusError(this.error);
}
