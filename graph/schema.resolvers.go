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

func (r *queryResolver) User(ctx context.Context, ksuid string) (*model.User, error) {
	user := &model.User{
		ID:          "a87agsa987cas8",
		FirstName:   "Sven",
		LastName:    "McCall",
		PhoneNumber: "123456789",
		DateOfBirth: "1995/12/21",
		CreatedAt:   "2022/04/01",
		UpdatedAt:   "2022/04/01",
	}

	return user, nil
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
