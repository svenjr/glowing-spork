## DB Design

We will use this document as a way to keep track of what we think the DB schema should look like and what connections exists between data.

There are a few basic building blocks in our network. We will have:
1. User: our network is made-up of users. The user is the most basic and **required** item in our DB. A single `users` table will represent them and the following information will be tracked:
  - ID [**required**]: the users unique ID
  - firstName [**required**]: The first name of the user
  - lastName [**required**]: The last name of the user
  - phoneNumber [**required**]: The user's phone number (potential to verify with Firebase)
  - dateOfBirth [**required**]: The user's date of birth
  - organDonor [_optional_]: True/False for the user
  - medicalInfo [_optional_]: Extra info the user can add for when an event is triggered
  - createdAt [**auto**]: auto-generated createdAt column
  - updatedAt [**auto**]: auto-updated updatedAt column
2. Connection: User's can connect to each other and this table holds **one row for each bi-directional user connection**. This means that we need just a single row for when two users have a connection. You can think of each row as an edge between two nodes (users). The big plus side with out network is that users do not follow or follow back. A user will request to be apart of someone's network and if the receiving user chooses to accept their request, only then will a row be created in this table.
  - ID [**required**]: the connection's unique ID
  - requesterID [**required**]: The unique user ID for the user who requested the connection
  - accepterID [**required**]: The unique user ID for the user who accepted the request (cannot be the same as the requester)
  - createdAt [**auto**]: auto-generated createdAt column

3. Connection Requests: When a user wishes to establish a connection with another user, the connection cannot be established until the receiving user approves. To make this simple, the intermediary table `connection_requests` will serve as a type of queue for pre-approved or per-denied requests. A row in the requests table represents a **current** pending request for connecting two users. This means rows will be **removed** if and when the request is either denied or accepted and moved to the connections table.
  - ID [**required**]: the requests unique ID
  - requesterID [**required**]: The unique user ID for the user who requested the connection
  - accepterID [**required**]: The unique user ID for the user who accepted the request (cannot be the same as the requester)
  - createdAt [**auto**]: auto-generated createdAt column