import 'package:Buyify/features/home/data/models/category_model.dart';
import 'package:Buyify/features/home/data/models/home_model.dart';
import 'package:Buyify/features/home/data/repo/home_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepo homeRepo;

  HomeBloc(this.homeRepo) : super(HomeInitial()) {
    on<GetHomeDataEvent>((event, emit) async {
      emit(HomeLoading());
      try {
        var result = await homeRepo.fetchHomeData();
        result.fold(
          (failure) => emit(HomeError()),
          (banners) => emit(HomeSuccess(banners)),
        );
      } catch (e) {
        emit(HomeError());
      }
    });

    on<GetCategoryDataEvent>((event, emit) async {
      emit(CategoryLoading());
      try {
        var result = await homeRepo.fetchCategoryData();
        result.fold((failure) => emit(CategoryError()), (category) {
          emit(CategorySuccess(category));
        });
      } catch (e) {
        emit(CategoryError());
      }
    });
  }
}
