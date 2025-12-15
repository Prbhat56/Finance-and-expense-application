import 'package:dartz/dartz.dart';
import 'package:finanace_and_expense_app/core/error/failures.dart';
import 'package:finanace_and_expense_app/src/transaction/domain/entities/transaction.dart';

abstract class TransactionRepository {
  Future<Either<Failure, List<Transaction>>> getTransactions({int? limit});
  Future<Either<Failure, Transaction>> getTransactionById(String id);
  Future<Either<Failure, void>> addTransaction(Transaction transaction);
  Future<Either<Failure, void>> updateTransaction(Transaction transaction);
  Future<Either<Failure, void>> deleteTransaction(String id);
  Future<Either<Failure, List<Transaction>>> getTransactionsByCategory(String category);
  Future<Either<Failure, List<Transaction>>> getTransactionsByDateRange(
    DateTime start,
    DateTime end,
  );
  Future<Either<Failure, double>> getTotalIncome();
  Future<Either<Failure, double>> getTotalExpense();
  Future<Either<Failure, Map<String, double>>> getExpensesByCategory();
}