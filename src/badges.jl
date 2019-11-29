using StackOverflow

"""
    getrecentbadgerecipients()

Returns recently awarded badges in the system.
"""
function getrecentbadgerecipients()
    r = HTTP.request("GET", "https://api.stackexchange.com/2.2/badges/recipients?site=stackoverflow")
    #TODO: add fromdate and todate.

    json_obj = StackOverflow.convert_HTTP_Response_To_JSON(r)

    for (k, v) in json_obj
        if occursin("items", k)
            for item in v
                for (key, value) in item
                    println("$(key) $(value)")
                end
                println("\n")
            end
        end
    end

    #TODO: May want to return the data in an array so it can be used.
    # The data can just be printed and/or pushed to a array then returned. 

end
