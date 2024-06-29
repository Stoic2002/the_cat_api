import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:the_cat_api/data/datasource/api_repository.dart';
import 'package:the_cat_api/data/models/cat_model.dart';

part 'cat_event.dart';
part 'cat_state.dart';

class CatBloc extends Bloc<CatEvent, CatState> {
  final ApiRepository repository;

  CatBloc({required this.repository}) : super(CatInitial()) {
    on<FetchCatImages>(_onFetchCatImages);
  }

  Future<void> _onFetchCatImages(
      FetchCatImages event, Emitter<CatState> emit) async {
    emit(CatLoading());
    try {
      final catImages = await repository.getRandomCatImages();
      emit(CatLoaded(catImages));
    } catch (e) {
      emit(CatError(e.toString()));
    }
  }
}
