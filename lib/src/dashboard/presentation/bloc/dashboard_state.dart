import 'package:equatable/equatable.dart';
import 'package:finanace_and_expense_app/src/transaction/domain/entities/transaction.dart';

enum DashboardStatus { initial, loading, success, error }

class DashboardState extends Equatable {
  final DashboardStatus status;
  final List<Transaction> transactions;
  final String? errorMessage;
  final double totalIncome;
  final double totalExpense;
  final double balance;
  final Map<String, double> expensesByCategory;
  
  const DashboardState({
    this.status = DashboardStatus.initial,
    this.transactions = const [],
    this.errorMessage,
    this.totalIncome = 0.0,
    this.totalExpense = 0.0,
    this.balance = 0.0,
    this.expensesByCategory = const {},
  });
  
  List<Transaction> get recentTransactions {
    return transactions.take(5).toList();
  }
  
  DashboardState copyWith({
    DashboardStatus? status,
    List<Transaction>? transactions,
    String? errorMessage,
    double? totalIncome,
    double? totalExpense,
    double? balance,
    Map<String, double>? expensesByCategory,
  }) {
    return DashboardState(
      status: status ?? this.status,
      transactions: transactions ?? this.transactions,
      errorMessage: errorMessage ?? this.errorMessage,
      totalIncome: totalIncome ?? this.totalIncome,
      totalExpense: totalExpense ?? this.totalExpense,
      balance: balance ?? this.balance,
      expensesByCategory: expensesByCategory ?? this.expensesByCategory,
    );
  }
  
  @override
  List<Object?> get props => [
    status,
    transactions,
    errorMessage,
    totalIncome,
    totalExpense,
    balance,
    expensesByCategory,
  ];
}