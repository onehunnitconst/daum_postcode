import 'package:json_annotation/json_annotation.dart';

part 'daum_postcode_model.g.dart';

@JsonSerializable()
class DaumPostcodeModel {
  final String zonecode;
  final String address;
  final String addressEnglish;
  final String addressType;
  final String bcode;
  final String bname;
  final String bname1;
  final String bname2;
  final String sido;
  final String sigungu;
  final String sigunguCode;
  final String userLanguageType;
  final String query;
  final String buildingName;
  final String buildingCode;
  final String apartment;
  final String jibunAddress;
  final String jibunAddressEnglish;
  final String roadAddress;
  final String roadAddressEnglish;
  final String autoRoadAddress;
  final String autoRoadAddressEnglish;
  final String autoJibunAddress;
  final String autoJibunAddressEnglish;
  final String userSelectedType;
  final String noSelected;
  final String hname;
  final String roadnameCode;
  final String roadname;

  const DaumPostcodeModel({
    required this.zonecode,
    required this.address,
    required this.addressEnglish,
    required this.addressType,
    required this.bcode,
    required this.bname,
    required this.bname1,
    required this.bname2,
    required this.sido,
    required this.sigungu,
    required this.sigunguCode,
    required this.userLanguageType,
    required this.query,
    required this.buildingName,
    required this.buildingCode,
    required this.apartment,
    required this.jibunAddress,
    required this.jibunAddressEnglish,
    required this.roadAddress,
    required this.roadAddressEnglish,
    required this.autoRoadAddress,
    required this.autoRoadAddressEnglish,
    required this.autoJibunAddress,
    required this.autoJibunAddressEnglish,
    required this.userSelectedType,
    required this.noSelected,
    required this.hname,
    required this.roadnameCode,
    required this.roadname,
  });

  factory DaumPostcodeModel.fromJson(Map<String, dynamic> json) =>
      _$DaumPostcodeModelFromJson(json);

  Map<String, dynamic> toJson() => _$DaumPostcodeModelToJson(this);
}
