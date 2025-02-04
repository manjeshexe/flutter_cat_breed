import 'package:bloc/bloc.dart';
import 'package:cat/core/usecase/usecase.dart';
import 'package:cat/features/cat/domain/entities/cat_breed.dart';
import 'package:cat/features/cat/domain/usecase/get_cat_breed_usecase.dart';
import 'package:meta/meta.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetCatBreedUsecase _getCatBreedUsecase;

  SearchBloc({
    required GetCatBreedUsecase getCatBreedUsecase,
  })  : _getCatBreedUsecase = getCatBreedUsecase,
        super(SearchInitial()) {
    on<SearchEvent>((event, emit) => emit(SearchLoading()));
    on<SearchEventChanged>(_onCatBreedLoaded);
  }

  void _onCatBreedLoaded(
    SearchEventChanged event,
    Emitter<SearchState> emit,
  ) async {
    final res = await _getCatBreedUsecase(NoParams());
    res.fold((l) => emit(SearchError(message: l.message)), (r) {
      final breed = r.firstWhere(
        (element) => element.name!.toLowerCase() == event.query.toLowerCase(),
        orElse: () => throw Exception('Breed not found'),
      );

      emit(
        SearchLoaded(catBreed: breed),
      );
    });
  }
}
