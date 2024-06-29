part of 'cat_bloc.dart';

sealed class CatState extends Equatable {
  const CatState();

  @override
  List<Object> get props => [];
}

final class CatInitial extends CatState {}

class CatLoading extends CatState {}

class CatLoaded extends CatState {
  final List<CatImage> catImages;

  const CatLoaded(this.catImages);

  @override
  List<Object> get props => [catImages];
}

class CatError extends CatState {
  final String message;

  const CatError(this.message);

  @override
  List<Object> get props => [message];
}
