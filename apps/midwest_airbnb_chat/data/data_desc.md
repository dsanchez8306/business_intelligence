# Midwest Airbnb Listings: Data Dictionary

**Dataset:** `listings` table in `midwest_airbnb.db` (SQLite), 14,887 rows and 29 columns
**Source:** Inside Airbnb (https://insideairbnb.com/get-the-data/), the detailed `listings.csv.gz` file for each of three regions: Chicago (snapshot 2026-07-20), Columbus (snapshot 2026-07-23), and Twin Cities MSA (snapshot 2026-07-21). Column meanings follow Inside Airbnb's data dictionary and assumptions (https://insideairbnb.com/data-assumptions/).
**Course:** ISA 401, Miami University

> One row is one listing that showed a nightly price on the snapshot date; listings with no price were dropped. Empty cells are stored as SQL `NULL`.

---

## Field Definitions

| Field | Type | Description |
|---|---|---|
| `city` | text | Which Inside Airbnb region the listing came from: `Chicago` (7,439 rows), `Columbus` (2,587), or `Twin Cities` (4,861). The Twin Cities file covers the Minneapolis-St. Paul metro area, not just the two cities. |
| `snapshot_date` | text | Date Inside Airbnb compiled the file, stored as an ISO text string, not a date: `2026-07-20` for Chicago, `2026-07-23` for Columbus, `2026-07-21` for Twin Cities. Every row of a city shares the same value. |
| `id` | text | Airbnb's listing id. Unique across the table (14,887 distinct values). Stored as text even though it looks numeric, so compare it to a quoted string. |
| `name` | text | Listing title as shown on Airbnb (for example "Tiny Studio Apartment 94 Walk Score"). Never empty. |
| `price` | real | Nightly price in U.S. dollars on the snapshot date, with the dollar sign and commas removed. Ranges from 2.56 to 11,412; never `NULL` (rows without a price were dropped). |
| `room_type` | text | Airbnb's four listing categories: `Entire home/apt` (11,652 rows), `Private room` (2,951), `Hotel room` (246), or `Shared room` (38). |
| `host_id` | integer | Airbnb's unique identifier for the host/user. |
| `host_name` | text | Name of the host. Usually just the first name(s). |
| `host_since` | date | The date the host/user was created. For hosts that are Airbnb guests this could be the date they registered as a guest. |
| `host_is_superhost` | boolean | `[t=true; f=false]` Whether the host is a Superhost. |
| `neighbourhood` | text | The neighbourhood as geocoded using the latitude and longitude against neighborhoods as defined by open or public digital shapefiles. |
| `latitude` | numeric | Uses the World Geodetic System (WGS84) projection for latitude and longitude. |
| `longitude` | numeric | Uses the World Geodetic System (WGS84) projection for latitude and longitude. |
| `property_type` | text | Self selected property type. Hotels and Bed and Breakfasts are described as such by their hosts in this field. |
| `accommodates` | integer | The maximum capacity of the listing. |
| `bedrooms` | numeric | The number of bedrooms. |
| `beds` | integer | The number of bed(s). |
| `bathrooms_text` | string | The number of bathrooms in the listing. On the Airbnb web-site, the bathrooms field has evolved from a number to a textual description. |
| `minimum_nights` | integer | minimum number of night stay for the listing (calendar rules may be different). |
| `availability_365` | integer | The availability of the listing 365 days in the future as determined by the calendar. Note a listing may not be available because it has been booked by a guest or blocked by the host. |
| `number_of_reviews` | integer | The number of reviews the listing has. |
| `number_of_reviews_ltm` | integer | The number of reviews the listing has (in the last 12 months). |
| `first_review` | date | The date of the first/oldest review. |
| `last_review` | date | The date of the last/newest review. |
| `review_scores_rating` | numeric | The average review score for the listing. |
| `reviews_per_month` | numeric | The average number of reviews per month the listing has over the lifetime of the listing. |
| `instant_bookable` | boolean | `[t=true; f=false]` Whether the guest can automatically book the listing without the host requiring to accept their booking request. |
| `estimated_revenue_l365d` | numeric | Estimated revenue for the listing over the last 365 days. |
| `amenities_count` | integer | Number of items in each listing's amenities list. |


