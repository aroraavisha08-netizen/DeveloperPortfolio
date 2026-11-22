# API Interaction Summary

## 1. What is a REST API?

A REST API (Representational State Transfer Application Programming Interface) allows different software applications to communicate over the internet using HTTP methods. It helps applications request and exchange data in formats such as JSON.

## 2. HTTP Status Codes

- **200 OK:** The request was successful and the server returned the requested data.
- **404 Not Found:** The requested resource could not be found on the server.

## 3. jq Filter Used

Command:

    cat API/github_profile.json | jq '{name:.name, repos:.public_repos, followers:.followers, joined:.created_at}'

Explanation:

- `cat` reads the JSON file.
- `|` passes the output to jq.
- `jq` processes JSON data.
- `name:.name` extracts the profile name.
- `repos:.public_repos` extracts public repository count.
- `followers:.followers` extracts follower count.
- `joined:.created_at` extracts account creation date.
