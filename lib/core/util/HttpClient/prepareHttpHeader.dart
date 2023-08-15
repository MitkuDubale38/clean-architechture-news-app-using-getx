class PrepareHeader {
  bool isAuthorizationRequired;
  String contentType = "";
  Map<String, String> header = {};
  String? token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIwMDAwMDAwMCIsImp0aSI6IjdmY2I4NjM1LWFiNjAtNDM1Yy04YjQ0LWQzYmE0ZjM5NjJiNSIsImlhdCI6MTY4NjgzODE5NCwibmJmIjoxNjg2ODM4MTkzLCJleHAiOjE2ODgwNDc3OTMsImlzcyI6IkJhY2tlbmQiLCJhdWQiOiJDb25zdW1lclVzZXIifQ.MMMJXpYyW43pbAqteCeC7INq75tMf_lIsu9xR63KrMU";
  PrepareHeader({
    required this.contentType,
    required this.isAuthorizationRequired,
  }) {
    header = {
      'Content-type': contentType,
    };
    if (isAuthorizationRequired) {
      header.addAll({'Authorization': "Bearer $token"});
    }
  }
}
