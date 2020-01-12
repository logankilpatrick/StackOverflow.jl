
using StackOverflow

"""
    searchtag(intitle::String)
Adding the ability to search for an tag through StackOverflow.jl while in the Julia Terminal.
"""
function searchtag(intitle::String)
    data = replace(intitle, " " => "%20")
    r = HTTP.request("GET", "https://api.stackexchange.com/2.2/tags?order=desc&sort=popular&inname=$(data)&site=stackoverflow")
    json_obj = StackOverflow.convert_HTTP_Response_To_JSON(r)
    for (k, v) in json_obj
        if occursin("items", k)
            for item in v
                for (key, value) in item
                    if key == "name" || key == "count"
                        println("$(key) $(value)")
                    end
                end
                println("\n")
            end
        end
    end
end
