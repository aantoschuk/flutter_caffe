// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'filters_state.dart';

class FiltersCubit extends Cubit<FiltersState> {
  FiltersCubit() : super(const FiltersInitial());

  void addFilter(String filter) {
    var state = this.state;

    if (state is FiltersInitial) {
      List<String> filters = [...state.filters, filter];

      emit(FiltersInitial(filters: filters));
    }
  }

  void removeFilter(String filter) {
    var state = this.state;
    if (state is FiltersInitial) {
      List<String> filters = List.from(state.filters)..remove(filter);
      emit(FiltersInitial(filters: filters));
    }
  }
}
