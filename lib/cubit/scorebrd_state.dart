
part of 'scorebrd_cubit.dart';

@immutable
abstract class ScorebrdState extends Equatable {}

class InitialState extends ScorebrdState {
  @override
  List<Object> get props => [];
}

class LoadingState extends ScorebrdState {
  @override
  List<Object> get props => [];
}

class LoadedState extends ScorebrdState {
  LoadedState(this.scores);

  final List<Score> scores;

  @override
  List<Object> get props => [scores];
}

class ErrorState extends ScorebrdState {
  @override
  List<Object> get props => [];
}