// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apiclient.dart';

// **************************************************************************
// JaguarHttpGenerator
// **************************************************************************

abstract class _$InstiAppApiClient implements ApiClient {
  final String basePath = "";
  Future<List<Hostel>> getHostelMess() async {
    var req = base.get.path(basePath).path("/mess");
    return req.list(convert: serializers.oneFrom);
  }

  Future<Session> login(String code, String redir) async {
    var req = base.get
        .path(basePath)
        .path("/login")
        .query("code", code)
        .query("redir", redir);
    return req.one(convert: serializers.oneFrom);
  }
}