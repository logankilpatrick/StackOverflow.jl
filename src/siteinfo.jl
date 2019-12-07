using StackOverflow

mutable struct SiteInfo
    new_active_users::Int
    total_users::Int
    badges_per_minute::Float64
    total_badges::Int
    total_votes::Int
    total_comments::Int
    answers_per_minute::Float64
    questions_per_minute::Float64
    total_answers::Int
    total_accepted::Int
    total_unanswered::Int
    total_questions::Int
end

"""
    getsiteinfo(;site::String = "stackoverflow")

Will return a collection of statistics about the site (StackOverflow).
"""
function getsiteinfo(;site::String = "stackoverflow")


    r = HTTP.request("GET", "https://api.stackexchange.com/2.2/info?site=$(site)")

    json_obj = StackOverflow.convert_HTTP_Response_To_JSON(r)

    newitem = json_obj["items"]
    
    for item in newitem

        new_active_users = 0
        total_users = 0
        badges_per_minute = 0
        total_badges = 0
        total_votes = 0
        total_comments = 0
        answers_per_minute = 0
        questions_per_minute = 0
        total_answers = 0
        total_accepted = 0
        total_unanswered = 0
        total_questions = 0


        for (key, value) in item
            if occursin("total_users", key)
                total_users = value
            elseif occursin("total_badges", key)
                total_badges = value
            elseif occursin("total_answers", key)
                total_answers = value
            elseif occursin("total_comments", key)
                total_comments = value
            elseif occursin("questions_per_minute", key)
                questions_per_minute = value
            elseif occursin("total_accepted", key)
                total_accepted = value
            elseif occursin("total_votes", key)
                total_votes = value
            elseif occursin("badges_per_minute", key)
                badges_per_minute = value
            elseif occursin("total_unanswered", key)
                total_unanswered = value
            elseif occursin("new_active_users", key)
                new_active_users = value
            elseif occursin("answers_per_minute", key)
                answers_per_minute = value
            elseif occursin("total_questions", key)
                total_questions = value
            end
        end

        site_info = SiteInfo(new_active_users, total_users, badges_per_minute, total_badges, total_votes, total_comments, answers_per_minute, questions_per_minute, total_answers, total_accepted, total_unanswered, total_questions)

        return site_info
    end
end