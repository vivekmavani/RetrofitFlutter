part of 'yearbook_cubit.dart';

@immutable
abstract class YearbookState {}

class YearbookInitial extends YearbookState {}

class YearbookLoading extends YearbookState{
  final BookResponses bookResponses;
  YearbookLoading({required this.bookResponses});
}


  