package main

import (
	"context"
	"log"
	"net"

	"gitlab.com/superherointj/barquinho/ent"
	"gitlab.com/superherointj/barquinho/ent/proto/entpb"
	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"

	_ "github.com/mattn/go-sqlite3"
)

func main() {

	log.Printf("Starting...")

	client, err := ent.Open("sqlite3", "file:ent?mode=memory&cache=shared&_fk=1")
	if err != nil {
		log.Fatalf("failed opening connection to sqlite: %v", err)
	}
	defer client.Close()

	ctx := context.Background()

	if err := client.Schema.Create(ctx); err != nil {
		log.Fatalf("failed creating schema resources: %v", err)
	}

	// Initialize the generated User service.
	svc := entpb.NewPlayerService(client)

	// Create a new gRPC server (you can wire multiple services to a single server).
	server := grpc.NewServer()

	reflection.Register(server)

	// Register the User service with the server.
	entpb.RegisterPlayerServiceServer(server, svc)

	// Open port 5000 for listening to traffic.
	log.Printf("listening to port tcp/:5000")
	lis, err := net.Listen("tcp", ":5000")
	if err != nil {
		log.Fatalf("failed listening: %s", err)
	}

	// Listen for traffic indefinitely.
	if err := server.Serve(lis); err != nil {
		log.Fatalf("failed to serve: %s", err)
	}

}
