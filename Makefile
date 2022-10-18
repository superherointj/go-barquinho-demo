DEFAULT: run

build:
	(cd src; go build *.go)

run: gen
	(cd src; go run *.go)

clean: gen-clean clean-cache

clean-cache:
	go clean -modcache
	rm -fr .go-build vendor result*

gen: gen-api gen-entpb

gen-clean: gen-api-clean

gen-api-clean:
	rm -rf src/ent

gen-api: gen-api-clean
	mkdir -p src/ent && true
	echo "package ent" > src/ent/generate.go
	cp -r src/schema src/ent/
	(cd src/ent; ent generate --target . ./schema)
	(cd src/ent; entproto -path ./schema)

gen-entpb:
	(cd src/ent; \
	protoc -I=proto/entpb \
		--go_out=proto/entpb/ \
		--go-grpc_out=proto/entpb/ \
		--entgrpc_out=proto/entpb/ \
		--go_opt=paths=source_relative \
		--go-grpc_opt=paths=source_relative \
		--entgrpc_opt=paths=source_relative,schema_path=./schema \
		entpb.proto )

watch:
	clear; ls *.go | entr -c sh -c 'reset'
# To clear buffer:
# reset && clear
# http://eradman.com/entrproject/

ui:
	grpcui -plaintext localhost:5000
	#grpcui -plaintext -proto src/ent/proto/entpb/entpb.proto localhost:5000
