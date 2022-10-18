{ pkgs ? import <nixpkgs> { }, entproto }:

with pkgs;

mkShell {
  name = "barquinho-shell";

  buildInputs = [
    go
    gox
    gotools
    gopls
    go-outline
    gocode
    gopkgs
    gocode-gomod
    godef
    golint
    grpcui
    protobuf3_20 # protoc-gen-js is unavailable in latest protobuf.
    ent-go
    entproto # includes: protoc-gen-ent protoc-gen-entgrpc
    protoc-gen-go
    protoc-gen-go-grpc
    protoc-gen-grpc-web
    #nodejs_latest
    #nodePackages.webpack-cli
    #nodePackages.webpack
    #envoy
  ];
}
