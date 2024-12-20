import 'package:firebase_storage_tuto/feature/authentication/domain/model/authentication.model.dart';
import 'package:firebase_storage_tuto/feature/user/data/provider/firebase.app.user.provider.dart';
import 'package:firebase_storage_tuto/feature/user/domain/model/user.model.dart';
import 'package:firebase_storage_tuto/feature/user/domain/repository/user.repository.dart';
import 'package:get_it/get_it.dart';

class UserRepositoryImpl extends UserRepository {
  final FirebaseAppUserProvider firebaseAppUserProvider =
      GetIt.instance<FirebaseAppUserProvider>();

  @override
  Future<AppUser?> createUser(AppUserCredential credentials) async {
    return await firebaseAppUserProvider.createUser(credentials);
  }

  @override
  Future<AppUser?> getUserById(String id) async {
    return firebaseAppUserProvider.getUserByUid(id);
  }
}
