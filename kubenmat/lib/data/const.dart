const bool dev = true; // use env

const String serverScheme = dev ? "http" : "https";
const int? serverPort = dev ? 8000 : null;
const String serverUrl = dev ? "10.0.0.14" : r"kubenmat.com";
const String basePath = "/api/v1";
const String fullServerUrl =
    "$serverScheme://$serverUrl:${serverPort ?? ''}$basePath";
