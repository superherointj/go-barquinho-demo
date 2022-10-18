{ lib
, buildGoModule
, entproto
, ent-go
, protobuf3_20
, protoc-gen-grpc-web
, protoc-gen-go
, protoc-gen-go-grpc
}:

buildGoModule rec {
  pname = "barquinho";
  version = "0.0.1";

  src = ./src/.;

  vendorSha256 = "sha256-MTtIC6FvyldhpUBcImOePkhD7hqrv57JvCSqrUGaulI=";

  subPackages = [ "." ];

  nativeBuildInputs = [
    entproto # includes protoc-gen-entgrpc
    ent-go
    protobuf3_20 # protoc-gen-js is unavailable in latest protobuf
    protoc-gen-grpc-web
    protoc-gen-go
    protoc-gen-go-grpc
  ];

  preBuild = ''
    pwd
    rm -rf ent
    mkdir ent
    echo "package ent" > ent/generate.go
    cp -r schema ent/
	  (cd ent; ent generate --target . ./schema)
	  (cd ent; entproto -path ./schema)
  '';

  # checkPhase = ''
  #   go test ./tests
  # '';

  meta = with lib; {
    description = "Barquinho";
    homepage = "https://gitlab.com/superherointj/barquinho";
    license = licenses.mit;
    maintainers = with maintainers; [ superherointj ];
  };
}
