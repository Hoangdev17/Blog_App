import 'package:fpdart/fpdart.dart';
import 'package:untitled2/core/error/failures.dart';
import 'package:untitled2/features/auth/domain/entities/user.dart';

abstract interface class AuthRepository {
    Future<Either<Failure, User>> signUpWithEmailPassword({
      required String name,
      required String email,
      required String password,
  });

  Future<Either<Failure, User>> loginWithEmailPassword({
    required String email,
    required String password,
  });

}
