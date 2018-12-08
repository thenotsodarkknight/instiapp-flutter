import 'package:http/io_client.dart';
import 'package:instiapp/src/api/model/mess.dart';
import 'package:instiapp/src/api/model/user.dart';
import 'package:jaguar_resty/jaguar_resty.dart';
import 'package:jaguar_resty/jaguar_resty.dart' as resty;
import 'package:jaguar_retrofit/jaguar_retrofit.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:instiapp/src/api/model/serializers.dart';

part 'apiclient.jretro.dart';

@GenApiClient()
class InstiAppApi extends _$InstiAppApiClient implements ApiClient {
  final resty.Route base = Route("https://api.insti.app/api");
  final SerializerRepo serializers = standardSerializers;

  static InstiAppApi _instance = InstiAppApi.internal();
  InstiAppApi.internal() {
    globalClient = IOClient();
  }
  factory InstiAppApi() => _instance;

  Future<List<Hostel>> getSortedHostelMess() async {
    var hostels = await getHostelMess();
    hostels.sort((h1, h2) => h1.compareTo(h2));
    return hostels;
  }

  @GetReq(path: "/mess")
  Future<List<Hostel>> getHostelMess();

  @GetReq(path: "/login")
  Future<Session> login(@QueryParam() String code, @QueryParam() String redir);
}