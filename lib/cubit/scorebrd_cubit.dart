import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:teste_cubit/data/model/score.dart';
import 'package:teste_cubit/data/repositories/score_repositorie.dart';
part 'scorebrd_state.dart';

class ScorebrdCubit extends Cubit<ScorebrdState> {

  ScorebrdCubit({required this.scoreRepo}) : super(InitialState()){
    fetchScores();
  }

  final ScoreRepo scoreRepo;

  void fetchScores() async{
    try{
      emit(LoadingState());
      await Future<void>.delayed(const Duration(seconds: 2));
      final scores = scoreRepo.scoreList;
      emit(LoadedState(scores));
    } catch (e){
      emit(ErrorState());
    }
  }

  void setErrorState(){
    emit(ErrorState());
  }
}
