module gitlab.com/superherointj/barquinho

go 1.18

replace gitlab.com/superherointj/barquinho => ./.

replace gitlab.com/superherointj/barquinho/ent => ./ent

replace gitlab.com/superherointj/barquinho/ent/proto/entpb => ./ent/proto/entpb

require (
	entgo.io/contrib v0.3.2
	entgo.io/ent v0.11.3
	github.com/mattn/go-sqlite3 v1.14.15
	google.golang.org/grpc v1.49.0
	google.golang.org/protobuf v1.28.1
)

require (
	ariga.io/atlas v0.7.2 // indirect
	github.com/agext/levenshtein v1.2.3 // indirect
	github.com/apparentlymart/go-textseg/v13 v13.0.0 // indirect
	github.com/go-openapi/inflect v0.19.0 // indirect
	github.com/golang/protobuf v1.5.2 // indirect
	github.com/google/go-cmp v0.5.9 // indirect
	github.com/google/uuid v1.3.0 // indirect
	github.com/hashicorp/hcl/v2 v2.14.1 // indirect
	github.com/jhump/protoreflect v1.13.0 // indirect
	github.com/kr/pretty v0.3.1 // indirect
	github.com/mitchellh/go-wordwrap v1.0.1 // indirect
	github.com/mitchellh/mapstructure v1.5.0 // indirect
	github.com/zclconf/go-cty v1.11.0 // indirect
	go.uber.org/atomic v1.10.0 // indirect
	go.uber.org/multierr v1.8.0 // indirect
	golang.org/x/mod v0.6.0-dev.0.20220419223038-86c51ed26bb4 // indirect
	golang.org/x/net v0.0.0-20220927171203-f486391704dc // indirect
	golang.org/x/sys v0.0.0-20220928140112-f11e5e49a4ec // indirect
	golang.org/x/text v0.3.7 // indirect
	golang.org/x/tools v0.1.13-0.20220819182638-587a15310bdd // indirect
	google.golang.org/genproto v0.0.0-20220929141241-1ce7b20da813 // indirect
)
