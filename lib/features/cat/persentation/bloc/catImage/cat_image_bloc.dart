import 'package:bloc/bloc.dart';
import 'package:cat/features/cat/domain/entities/cat_image.dart';
import 'package:cat/features/cat/domain/usecase/get_cat_image_usecase.dart';
import 'package:meta/meta.dart';

part 'cat_image_event.dart';
part 'cat_image_state.dart';

class CatImageBloc extends Bloc<CatImageEvent, CatImageState> {
  final GetCatImageUsecase _getCatImageUsecase;
  CatImageBloc({
    required GetCatImageUsecase getCatImageUsecase,
  })  : _getCatImageUsecase = getCatImageUsecase,
        super(CatImageInitial()) {
    on<CatImageEvent>((event, emit) => emit(CatImageInitial()));
    on<GetCatImageEvent>(_getRandomCatImage);
  }

  void _getRandomCatImage(
      GetCatImageEvent event, Emitter<CatImageState> emit) async {
    final res = await _getCatImageUsecase(CatLimit(event.limit));
    res.fold(
      (l) => emit(CatImageFailure(message: l.message)),
      (r) => emit(
        CatImageLoaded(catImage: r),
      ),
    );
  }
}

