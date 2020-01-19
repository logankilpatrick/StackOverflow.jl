using StackOverflow

"""
    makeanswersarray(json_obj::Dict)

Returns a Vector of `Answer` type extracted from a json object from stackexchange API.
"""
function makeanswersarray(json_obj::Dict)
    answerholder = Vector()
    for (k, v) in json_obj
        if occursin("items", k)
            for item in v
                creation_date = 0
                owner = Dict()
                last_activity_date = 0
                score = 0
                question_id = 0
                answer_id = 0
                locked_date = 0
                community_owned_date = 0
                is_accepted = 0
                last_edit_date = 0

                for (key, value) in item
                    if occursin("locked_date", key)
                        locked_date = value
                    elseif occursin("community_owned_date", key)
                        community_owned_date = value
                    elseif occursin("creation_date", key)
                        creation_date = value
                    elseif occursin("last_edit_date", key)
                        last_edit_date = value
                    elseif occursin("owner", key)
                        owner = value
                    elseif occursin("last_activity_date", key)
                        last_activity_date = value
                    elseif occursin("score", key)
                        score = value
                    elseif occursin("answer_id", key)
                        answer_id = value
                    elseif occursin("question_id", key)
                        question_id = value
                    end
                end
                answer = Answer(owner,
                 is_accepted,
                 score,
                 last_activity_date,
                 last_edit_date,
                 community_owned_date,
                 locked_date,
                 creation_date,
                 answer_id,
                 question_id
                 )
                push!(answerholder, answer)

            end
        end
    end
    answerholder
end

"""
    makequestionsarray(json_obj::Dict)

Returns a Vector of `Question`s extracted from a json object from stackexchange API.
"""
function makequestionsarray(json_obj::Dict)
    questionholder = Vector()
    for (k, v) in json_obj
        if occursin("items", k)
            for item in v
                link = ""
                view_count = 0
                creation_date = 0
                is_answered = false
                owner = Dict()
                last_activity_date = 0
                score = 0
                accepted_answer_id = 0
                question_id = 0
                title = 0
                answer_count = 0
                tags = []
                title = ""

                for (key, value) in item
                    if occursin("link", key)
                        link = value
                    elseif occursin("view_count", key)
                        view_count = value
                    elseif occursin("creation_date", key)
                        creation_date = value
                    elseif occursin("is_answered", key)
                        is_answered = value
                    elseif occursin("owner", key)
                        owner = value
                    elseif occursin("last_activity_date", key)
                        last_activity_date = value
                    elseif occursin("score", key)
                        score = value
                    elseif occursin("accepted_answer_id", key)
                        accepted_answer_id = value
                    elseif occursin("question_id", key)
                        question_id = value
                    elseif occursin("tags", key)
                        tags = value
                    elseif occursin("title", key)
                        title = value
                    elseif occursin("answer_count", key)
                        answer_count = value
                    end
                end

                question = Question(link, view_count, creation_date, is_answered, owner,
                        last_activity_date, score, accepted_answer_id, question_id, tags, title,
                        answer_count)
                push!(questionholder, question)

            end
        end
    end
    questionholder
end


function convert_HTTP_Response_To_JSON(response)
    compressed = HTTP.payload(response);

    decompressed = transcode(GzipDecompressor, compressed);

    json = JSON.parse(IOBuffer(decompressed))

    return json
end
