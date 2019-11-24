using Stackoverflow

"""
    checkmyprivilages(username::String)

Takes in a username and returns the privilages said user has.
"""
function checkmyprivilages(username::String = "")


    r = HTTP.request("GET", "https://api.stackexchange.com/2.2/users?order=desc&sort=reputation&inname=$(username)&site=stackoverflow")

    json_obj = Stackoverflow.convert_HTTP_Response_To_JSON(r)

    for (k, v) in json_obj
        if occursin("items", k)
            for item in v
                for (key, value) in item
                    if key == "reputation"
                        println(value)
                    end
                end
            end
        end
    end

end

"""
    getprivilages()

Prints out the various privilage levels in Stack Overflow and the rep
required to have said privilages.
"""
function getprivilages()
    r = HTTP.request("GET", "https://api.stackexchange.com/2.2/privileges?site=stackoverflow")
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
