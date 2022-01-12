---
    Project: Capstone - Use Case Profile
    Alias: UCPro
    Developer: Wes Vesprini
    Date Updated: 7/06/2021
---
## Objective
Create an app allowing the build of use cases, clients and ultimately client profiles of those use cases

## Requirements

### Models
1. Client
   1. id
   2. name
   3. alias
   4. status (live, opportunity)
2. Use Case
   1. id
   2. description
   3. status (live, queued, pending)
   4. clients
   5. original requests (foreign key)
   6. project_id
3.  Original Request (These will be reviewed and linked to a use case)
    1.  id
    2.  description
    3.  use case (foreign key)
    4.  status (supported, unsupported, not reviewed)
4. ? User Story ?
5. Comments
   1. id
   2. user (foreign key)
   3. comment
   4. date
   5. time
   6. client
6. Product
   1. id
   2. name
   3. group
7. Requriements
8. ? Test Cases ?
9. Votes (should this be merged with Use Case itself?)
   1. id
   2. use case (foreign key)
   3. upvotes
   4. downvotes
10. Project (compilation of unsupported Use Cases)
    1.  id
    2.  name
11. User
    1.  id
    2.  name
    3.  email
    4.  votes_cast
    5.  requests_made
    6.  supported_requests
    7.  total_comments
12. Watchlist
    1.  id
    2.  