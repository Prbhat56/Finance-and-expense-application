import 'package:equatable/equatable.dart';

abstract class BudgetEvent extends Equatable {
  const BudgetEvent();

  @override
  List<Object> get props => [];
}

class LoadBudgets extends BudgetEvent {}

class AddBudget extends BudgetEvent {
  final String category;
  final double limit;
  
  const AddBudget({required this.category, required this.limit});
  
  @override
  List<Object> get props => [category, limit];
}

class UpdateBudget extends BudgetEvent {
  final String category;
  final double limit;
  
  const UpdateBudget({required this.category, required this.limit});
  
  @override
  List<Object> get props => [category, limit];
}

class DeleteBudget extends BudgetEvent {
  final String category;
  
  const DeleteBudget({required this.category});
  
  @override
  List<Object> get props => [category];
}