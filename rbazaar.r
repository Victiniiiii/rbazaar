library(httr)
library(jsonlite)

url <- "https://api.hypixel.net/v2/skyblock/bazaar"
response <- GET(url)

if (http_type(response) == "application/json") {
  data <- content(response, "text", encoding = "UTF-8")
  parsed_data <- fromJSON(data)  
  sell_price <- parsed_data$products$BOOSTER_COOKIE$quick_status$sellPrice
  
  cat("The sell price of the Booster Cookie is:", sell_price)
} else {
  cat("Error fetching data from the API.")
}
