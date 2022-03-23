package graph

// This file will be automatically regenerated based on the schema, any resolver implementations
// will be copied through when generating and any unknown code will be moved to the end.

import (
	"context"
	"fmt"
	"safety-network/graph/generated"
	"safety-network/graph/model"
)

func (r *mutationResolver) AddUser(ctx context.Context, input model.NewUser) (*model.User, error) {
	panic(fmt.Errorf("not implemented"))
}

func (r *mutationResolver) NewRequest(ctx context.Context, input model.NewRequest) (*model.ConnectionRequest, error) {
	panic(fmt.Errorf("not implemented"))
}

func (r *mutationResolver) ConnectionDecision(ctx context.Context, input model.ConnectionDecision) (bool, error) {
	panic(fmt.Errorf("not implemented"))
}

func (r *queryResolver) User(ctx context.Context, input string) (*model.User, error) {
	panic(fmt.Errorf("not implemented"))
}

func (r *queryResolver) Connections(ctx context.Context, input string) ([]*model.Connection, error) {
	panic(fmt.Errorf("not implemented"))
}

func (r *queryResolver) Requests(ctx context.Context, input string) ([]*model.ConnectionRequest, error) {
	panic(fmt.Errorf("not implemented"))
}

// Mutation returns generated.MutationResolver implementation.
func (r *Resolver) Mutation() generated.MutationResolver { return &mutationResolver{r} }

// Query returns generated.QueryResolver implementation.
func (r *Resolver) Query() generated.QueryResolver { return &queryResolver{r} }

type mutationResolver struct{ *Resolver }
type queryResolver struct{ *Resolver }
