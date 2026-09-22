# Extra Instructions

Rules the LLM follows when it writes SQL for `listings`.

- `price` is the nightly price in U.S. dollars. When the user asks what something costs, use `price` and round money to whole dollars in the answer.
- `host_is_superhost` and `instant_bookable` both take text values 't' and 'f', and are not recognized as boolean values
- when the user inputs a city, match the city name to the `city` column
- when the user asks for data within a specific city, filter the listings with the `city` column
- when searching a `name`, treat uppercase and lowercase letters the same, assume there is no difference between in values
- when calculating an average rating for a listing, ignore null values in the `review_scores_rating` column

