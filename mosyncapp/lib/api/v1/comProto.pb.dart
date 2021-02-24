///
//  Generated code. Do not modify.
//  source: comProto.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class commandMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'commandMessage', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'one')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'two')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'three')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'four')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'five')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'passcode')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'getCommand', protoName: 'getCommand')
    ..hasRequiredFields = false
  ;

  commandMessage._() : super();
  factory commandMessage({
    $core.String? one,
    $core.String? two,
    $core.String? three,
    $core.String? four,
    $core.String? five,
    $core.String? id,
    $core.String? passcode,
    $core.String? getCommand,
  }) {
    final _result = create();
    if (one != null) {
      _result.one = one;
    }
    if (two != null) {
      _result.two = two;
    }
    if (three != null) {
      _result.three = three;
    }
    if (four != null) {
      _result.four = four;
    }
    if (five != null) {
      _result.five = five;
    }
    if (id != null) {
      _result.id = id;
    }
    if (passcode != null) {
      _result.passcode = passcode;
    }
    if (getCommand != null) {
      _result.getCommand = getCommand;
    }
    return _result;
  }
  factory commandMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory commandMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  commandMessage clone() => commandMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  commandMessage copyWith(void Function(commandMessage) updates) => super.copyWith((message) => updates(message as commandMessage)) as commandMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static commandMessage create() => commandMessage._();
  commandMessage createEmptyInstance() => create();
  static $pb.PbList<commandMessage> createRepeated() => $pb.PbList<commandMessage>();
  @$core.pragma('dart2js:noInline')
  static commandMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<commandMessage>(create);
  static commandMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get one => $_getSZ(0);
  @$pb.TagNumber(1)
  set one($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOne() => $_has(0);
  @$pb.TagNumber(1)
  void clearOne() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get two => $_getSZ(1);
  @$pb.TagNumber(2)
  set two($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTwo() => $_has(1);
  @$pb.TagNumber(2)
  void clearTwo() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get three => $_getSZ(2);
  @$pb.TagNumber(3)
  set three($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasThree() => $_has(2);
  @$pb.TagNumber(3)
  void clearThree() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get four => $_getSZ(3);
  @$pb.TagNumber(4)
  set four($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFour() => $_has(3);
  @$pb.TagNumber(4)
  void clearFour() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get five => $_getSZ(4);
  @$pb.TagNumber(5)
  set five($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasFive() => $_has(4);
  @$pb.TagNumber(5)
  void clearFive() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get id => $_getSZ(5);
  @$pb.TagNumber(6)
  set id($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasId() => $_has(5);
  @$pb.TagNumber(6)
  void clearId() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get passcode => $_getSZ(6);
  @$pb.TagNumber(7)
  set passcode($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasPasscode() => $_has(6);
  @$pb.TagNumber(7)
  void clearPasscode() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get getCommand => $_getSZ(7);
  @$pb.TagNumber(8)
  set getCommand($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasGetCommand() => $_has(7);
  @$pb.TagNumber(8)
  void clearGetCommand() => clearField(8);
}

