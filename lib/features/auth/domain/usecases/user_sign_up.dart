import 'package:fpdart/fpdart.dart';
import 'package:untitled2/core/common/entities/user.dart';
import 'package:untitled2/core/error/failures.dart';
import 'package:untitled2/core/usecases/usecase.dart';
import 'package:untitled2/features/auth/domain/repository/auth_repository.dart';

class UserSignUp implements UseCase<User, UserSignUpParams>{
  final AuthRepository authRepository;
  const UserSignUp(this.authRepository);

  @override
  Future<Either<Failure, User>> call(UserSignUpParams params) async {
   return await authRepository.signUpWithEmailPassword(name: params.name, email: params.email, password: params.password);
  }
}

class UserSignUpParams {
  final String email;
  final String name;
  final String password;
  UserSignUpParams({
    required this.email,
    required this.name,
    required this.password,
});

}