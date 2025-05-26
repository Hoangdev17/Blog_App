import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;
import 'package:untitled2/core/error/exception.dart';
import 'package:untitled2/core/error/failures.dart';
import 'package:untitled2/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:untitled2/features/auth/domain/entities/user.dart';
import 'package:untitled2/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  AuthRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<Failure, User>> loginWithEmailPassword({required String email, required String password}) async {
    try {
      final user = await remoteDataSource.loginWithEmailPassword(
          email: email,
          password: password
      );

      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, User>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    return _getUser(
          () async => await remoteDataSource.signUpWithEmailPassword(
        name: name,
        email: email,
        password: password,
      ),
    );
  }

  Future<Either<Failure, User>> _getUser(
      Future<User> Function() fn,
      ) async {
    try {
      final user = await fn();

      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
