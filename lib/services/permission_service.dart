import '../core/constants.dart';
import '../models/organization.dart';

enum UserRole {
  reader(1), commenter(2), writer(3);
  final int level;
  const UserRole(this.level);
}

class PermissionService {
  static UserRole roleOf({required dynamic item, required String currentUid, required String currentEmail, Organization? org}) {
    if (item.uid == currentUid) return UserRole.writer;
    if (org != null && (org.isOwner(currentEmail) || org.isFounder(currentEmail))) return UserRole.writer;
    return UserRole.reader;
  }
}