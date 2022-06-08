part of 'filters_cubit.dart';

abstract class FiltersState extends Equatable {
  const FiltersState();

  @override
  List<Object> get props => [];
}

class FiltersInitial extends FiltersState {
  final List<String> filters;
  const FiltersInitial({this.filters = const []});

  @override
  List<Object> get props => [filters];
}

class AddFilter extends FiltersState {
  final List<String> filters;
  const AddFilter({this.filters = const []});

  @override
  List<Object> get props => [filters];
}

class RemoveFilter extends FiltersState {
  final List<String> filters;
  const RemoveFilter({this.filters = const []});

  @override
  List<Object> get props => [filters];
}
