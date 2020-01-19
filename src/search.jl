using StackOverflow

"""
    searcherror(intitle::String)

Adding the ability to search for an error through StackOverflow.jl while in the Julia Terminal.
"""
function searcherror(intitle::String)
    data = replace(intitle, " " => "%20")
    r = HTTP.request("GET", "https://api.stackexchange.com/2.2/search?order=desc&sort=activity&intitle=$(data)&site=stackoverflow")
    json_obj = StackOverflow.convert_HTTP_Response_To_JSON(r)
    makequestionsarray(json_obj)
end
