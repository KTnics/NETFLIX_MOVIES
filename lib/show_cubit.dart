
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled6/show_model.dart';
import 'package:untitled6/show_repository.dart';


abstract class ShowState {}

class ShowInitial extends ShowState {}

class ShowLoading extends ShowState {}

class ShowLoaded extends ShowState {
  final List<Show> shows;

  ShowLoaded(this.shows);
}

class ShowError extends ShowState {
  final String error;

  ShowError(this.error);
}

class ShowCubit extends Cubit<ShowState> {
  final ShowRepository repository;

  ShowCubit(this.repository) : super(ShowInitial());

  void fetchShows() async {
    emit(ShowLoading());
    try {
      final shows = await repository.fetchShows();
      emit(ShowLoaded(shows));
    } catch (e) {
      emit(ShowError('Failed to load shows'));
    }
  }
}
