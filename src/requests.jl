using HTTP
using Revise

r = HTTP.request("GET", "https://api.stackexchange.com/2.2/questions?order=desc&sort=activity&tagged=Julia&site=stackoverflow"; verbose=3)
println(typeof(r))
r = Vector(r)

#println(r.status)
#println(String(r.body))
