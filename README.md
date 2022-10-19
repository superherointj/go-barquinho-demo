# barquinho demo

## Building

> nix build .#barquinho

Errors as:

> load package info: err: exit status 1: stderr: go: inconsistent vendoring in /build/src:
>         gitlab.com/superherointj/barquinho: is marked as replaced in vendor/modules.txt, but not replaced in go.mod
> 
>         To ignore the vendor directory, use -mod=readonly or -mod=mod.
>         To sync the vendor directory, run:
>                 go mod vendor


Update:

go install github.com/superherointj/go-barquinho-demo/src@latest

Also fails.

But:

git clone github.com/superherointj/go-barquinho-demo

cd src; GOBIN=./ go install

Works!

## For development

> nix develop .#barquinho

To generate ent files, run:

> make

## Question

1) How to handle go modules (in [go.mod](https://github.com/superherointj/go-barquinho-demo/blob/master/src/go.mod)) that have `replace` in Nix?

Problem was being causes by `go install` that does not accept `replace` in `go.mod`. Solution could be to git clone repository and run `go install` instead of relying on buildGoModule which uses `go install`.