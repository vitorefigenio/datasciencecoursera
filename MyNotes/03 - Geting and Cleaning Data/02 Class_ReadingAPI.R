# Read from API
# We need create an app on twitter
library(twitteR)
myapp = oauth_app("twitter",
                  key="appKey",
                  secret="appKeySecret")
sig = sign_oauth1.0(myapp,
                    token="appToken",
                    token_secret="appTokenSecret")
homeTL = GET("https://api.twitter.com/1.1/statuses/home_timeline.json", sig)

# Converting Json to Object
json1 = content(homeTL)
json2 = jsonlite::fromJSON(toJSON(json1))
json2[1,1:4]