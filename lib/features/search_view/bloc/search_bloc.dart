import 'package:Buyify/features/home/data/models/home_model.dart';
import 'package:Buyify/features/search_view/data/repo/search_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepo searchRepo;

  SearchBloc(this.searchRepo) : super(SearchInitial()) {
    on<SearchProductEvent>((event, emit) async {
      emit(SearchLoading());
      try {
        var result = await searchRepo
            .searchProduct(productName: {'text': event.productName});
        result.fold((failure) => emit(SearchError()), (product) {
          emit(SearchSuccess(product));
        });
      } catch (e) {
        emit(SearchError());
      }
    });
  }
}
