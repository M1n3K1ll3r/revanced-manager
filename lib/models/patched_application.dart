import 'dart:convert';
import 'dart:typed_data';
import 'package:json_annotation/json_annotation.dart';

part 'patched_application.g.dart';

@JsonSerializable()
class PatchedApplication {
  final String name;
  final String packageName;
  final String version;
  final String apkFilePath;
  @JsonKey(
    fromJson: decodeBase64,
    toJson: encodeBase64,
  )
  final Uint8List icon;
  DateTime patchDate;
  final bool isRooted;
  final bool isFromStorage;
  List<String> appliedPatches;

  PatchedApplication({
    required this.name,
    required this.packageName,
    required this.version,
    required this.apkFilePath,
    required this.icon,
    required this.patchDate,
    required this.isRooted,
    required this.isFromStorage,
    required this.appliedPatches,
  });

  factory PatchedApplication.fromJson(Map<String, dynamic> json) =>
      _$PatchedApplicationFromJson(json);

  Map toJson() => _$PatchedApplicationToJson(this);

  static Uint8List decodeBase64(String icon) => base64.decode(icon);

  static String encodeBase64(Uint8List bytes) => base64.encode(bytes);
}
