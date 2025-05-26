

import 'package:fpdart/fpdart.dart';
import 'package:untitled2/core/error/failures.dart';
import 'package:untitled2/core/usecases/usecase.dart';
import 'package:untitled2/features/auth/domain/entities/user.dart';
import 'package:untitled2/features/auth/domain/repository/auth_repository.dart';

class CurrentUser implements UseCase<User, NoParams> {
  final AuthRepository authRepository;
  CurrentUser(this.authRepository);

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await authRepository.currentUser();
  }
}