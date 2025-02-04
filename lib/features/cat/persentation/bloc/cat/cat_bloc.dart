import 'package:bloc/bloc.dart';
import 'package:cat/core/usecase/usecase.dart';
import 'package:cat/features/cat/domain/entities/cat_breed.dart';
import 'package:cat/features/cat/domain/entities/cat_image.dart';
import 'package:cat/features/cat/domain/usecase/get_cat_breed_By_id_usecase.dart';
import 'package:cat/features/cat/domain/usecase/get_cat_breed_usecase.dart';
import 'package:meta/meta.dart';

part 'cat_event.dart';
part 'cat_state.dart';

class CatBloc extends Bloc<CatEvent, CatState> {
  final GetCatBreedUsecase _getCatBreedUsecase;
  final GetCatBreedByIdUsecase _getCatBreedByIdUsecase;
  

  CatBloc({
    required GetCatBreedUsecase getCatBreedUsecase,
    required GetCatBreedByIdUsecase getCatBreedByIdUsecase,
   
  })  : _getCatBreedUsecase = getCatBreedUsecase,
        _getCatBreedByIdUsecase = getCatBreedByIdUsecase,
      
        super(CatInitial()) {
    on<CatEvent>((event, emit) => emit(CatLoading()));
    on<GetCatBreedEvent>(_onCatBreed);
    on<GetCatBreedByIdEvent>(_onCatBreedById);
  }

  void _onCatBreed(GetCatBreedEvent event, Emitter<CatState> emit) async {
    final res = await _getCatBreedUsecase(NoParams());
    res.fold(
      (l) => emit(CatFailure(message: l.message)),
      (r) => emit(
        CatLoaded(catBreeds: r),
      ),
    );
  }

  void _onCatBreedById(
      GetCatBreedByIdEvent event, Emitter<CatState> emit) async {
    final res = await _getCatBreedByIdUsecase(CatBreedId(event.breadId));
    res.fold(
      (l) => emit(CatFailure(message: l.message)),
      (r) => emit(
        CatLoaded(catBreeds: [r]),
      ),
    );
  }

  
}
