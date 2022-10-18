# barquinho demo

To see error message:

nix build .#barquinho

Errors as:

> load package info: err: exit status 1: stderr: go: inconsistent vendoring in /build/src:
>         gitlab.com/superherointj/barquinho: is marked as replaced in vendor/modules.txt, but not replaced in go.mod
> 
>         To ignore the vendor directory, use -mod=readonly or -mod=mod.
>         To sync the vendor directory, run:
>                 go mod vendor


For development environment:

> nix develop .#barquinho

To generate ent files, execute:

> make
