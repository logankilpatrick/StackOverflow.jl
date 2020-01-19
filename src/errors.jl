using StackOverflow
using HTTP 

# the function 'geterrors' returns a 2d array containing the error_names, error ids and description in that order.

function geterrors()
    error_id = []
    description = []
    error_name = []

    r = HTTP.request("GET", "https://api.stackexchange.com/2.2/errors")
    

    json_obj = StackOverflow.convert_HTTP_Response_To_JSON(r)

    for (k, v) in json_obj
        if occursin("items", k)
            for item in v
                for (key, value) in item
                    if key == "error_id"
                        push!(error_id, value)
                    elseif key == "description"
                        push!(description, value)
                    elseif key == "error_name"
                        push!(error_name, value)
                    end
                end
                
            end
            return [error_name, error_id, description]
        end
    end

end


