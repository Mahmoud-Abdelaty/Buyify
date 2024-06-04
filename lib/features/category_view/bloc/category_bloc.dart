import 'package:Buyify/features/category_view/data/repo/category_repo.dart';
import 'package:Buyify/features/home/data/models/home_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepo categoryRepo;
  CategoryBloc(this.categoryRepo) : super(CategoryInitial()) {
    on<GetCategoryData>((event, emit) async {
      emit(GetCategoryLoading());
      try {
        var result = await categoryRepo.fetchCategoryData(event.id);
        result.fold((l) => emit(GetCategoryError()), (result) {
          emit(GetCategorySuccess(result));
        });
      } catch (e) {
        emit(GetCategoryError());
      }
    });
  }
}
