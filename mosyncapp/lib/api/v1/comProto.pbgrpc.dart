///
//  Generated code. Do not modify.
//  source: comProto.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'comProto.pb.dart' as $0;
export 'comProto.pb.dart';

class commandServiceClient extends $grpc.Client {
  static final _$topCommand =
      $grpc.ClientMethod<$0.commandMessage, $0.commandMessage>(
          '/commandService/topCommand',
          ($0.commandMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.commandMessage.fromBuffer(value));

  commandServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.commandMessage> topCommand($0.commandMessage request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$topCommand, request, options: options);
  }
}

abstract class commandServiceBase extends $grpc.Service {
  $core.String get $name => 'commandService';

  commandServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.commandMessage, $0.commandMessage>(
        'topCommand',
        topCommand_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.commandMessage.fromBuffer(value),
        ($0.commandMessage value) => value.writeToBuffer()));
  }

  $async.Future<$0.commandMessage> topCommand_Pre(
      $grpc.ServiceCall call, $async.Future<$0.commandMessage> request) async {
    return topCommand(call, await request);
  }

  $async.Future<$0.commandMessage> topCommand(
      $grpc.ServiceCall call, $0.commandMessage request);
}
