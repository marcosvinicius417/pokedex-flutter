class HttpErrorMessages {
  static final defaultError = {
    "code": "INTERNAL_SERVER_ERROR",
    "execution": DateTime.now().toString(),
    "message": "Erro interno, tente novamente mais tarde.",
    "thread": "",
  };

  static final connectionError = {
    "code": "NETWORK_SERVER_ERROR",
    "execution": DateTime.now().toString(),
    "message": "Sem conexão, verifique sua rede",
    "thread": "",
  };
}
