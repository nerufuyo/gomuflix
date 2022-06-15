import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:gomucore/gomucore.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

class HttpSSLPiningHelper {
  static Future<http.Client> get _instance async =>
      _clientInstance ??= await createLEClient();

  static http.Client? _clientInstance;

  static http.Client get client => _clientInstance ?? http.Client();

  static Future<void> init() async {
    _clientInstance = await _instance;
  }

  static Future<HttpClient> customHttpClient({
    bool isTestMode = false,
  }) async {
    SecurityContext context = SecurityContext(withTrustedRoots: false);

    try {
      List<int> bytes = [];

      if (isTestMode) {
        bytes = utf8.encode(certificate);
      } else {
        bytes = (await rootBundle.load('certificates/certificate.cer'))
            .buffer
            .asUint8List();
      }

      context.setTrustedCertificatesBytes(bytes);
    } on TlsException catch (e) {
      if (e.osError?.message != null &&
          e.osError!.message.contains('Certificate already in hash table')) {
        log('createHttpClient() - certificate already trusted.');
      } else {
        log('createHttpClient().setTrustedCertificateBytes EXCEPTION: $e');

        rethrow;
      }
    } catch (e) {
      log('unexpected error $e');

      rethrow;
    }
    HttpClient httpClient = HttpClient(context: context);

    httpClient.badCertificateCallback =
        (X509Certificate cert, String host, int port) => false;

    return httpClient;
  }

  static Future<http.Client> createLEClient({bool isTestMode = false}) async {
    IOClient client = IOClient(await customHttpClient(isTestMode: isTestMode));

    return client;
  }
}
