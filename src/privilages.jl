using Stackoverflow

"""
    checkmyprivilages(username::String)

Takes in a username and returns the privilages said user has.
"""
function checkmyprivilages(username::String)
    println("TODO")
    #https://api.stackexchange.com/docs/users#order=desc&sort=reputation&inname=logankilpatrick&filter=default&site=stackoverflow&run=true
    #Query this to get the rep and then do some basic math to see level. 
end

"""
    getprivilages()

Prints out the various privilage levels in Stack Overflow and the rep
required to have said privilages.
"""
function getprivilages()
    r = HTTP.request("GET", "https://api.stackexchange.com/2.2/privileges?site=stackoverflow"; verbose=3)
    json_obj = Stackoverflow.convert_HTTP_Response_To_JSON(r)

    for (k, v) in json_obj
        if occursin("items", k)
            for item in v
                for (key, value) in item
                    println("$(key): $(value)")
                end
                println("\n")
            end
        end
    end

end
