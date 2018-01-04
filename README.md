# Running a local environment

The app expects 2 environment variables:

* `MAPS_KEY`
* `ROUTING_KEY`

These are necessary for presenting the journey map to the user, and to geocode the postcodes to display back to the admin.

You can run a rails server with these variables using the following command:

```
ROUTING_KEY=123ABC MAPS_KEY=ABC123 bin/rails s
```
