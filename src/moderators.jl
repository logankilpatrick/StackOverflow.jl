using StackOverflow

mutable struct Person
    view_count::Int
    down_vote_count::Int
    up_vote_count::Int
    answer_count::Int
    question_count::Int
    account_id::String
    is_employee::Bool
    last_modified_date::String
    last_access_date::String
    reputation_change_year::String
    reputation_change_quarter::String
    reputation_change_month::String
    reputation_change_week::String
    reputation_change_day::String
    reputation::Int
    creation_date::String
    user_type::String
    user_id::String
    accept_rate::String
    about_me::String
    location::String
    website_url::String
    link::String
    profile_image::String
    display_name::String
    badge_counts::Dict
    
    Person(view_count::Int = 0, down_vote_count::Int = 0, up_vote_count::Int = 0, answer_count::Int = 0, question_count::Int  = 0,
            account_id::String = "", is_employee::Bool = false, last_modified_date::String = "", last_access_date::String = "",
            reputation_change_year::String = "", reputation_change_quarter::String = "", reputation_change_month::String = "",
            reputation_change_week::String = "", reputation_change_day::String = "", reputation::Int = 0, creation_date::String = "",
            user_type::String = "", user_id::String = "", accept_rate::String = "", about_me::String = "", location::String = "",
            website_url::String = "", link::String = "", profile_image::String = "", display_name::String = "", badge_counts::Dict = Dict()) =
    new(view_count, down_vote_count, up_vote_count, answer_count,
                question_count, account_id, is_employee, last_modified_date, last_access_date,
                reputation_change_year, reputation_change_quarter, reputation_change_month,
                reputation_change_week, reputation_change_day, reputation, creation_date,
                user_type, user_id, accept_rate, about_me, location, website_url, link,
                profile_image, display_name, badge_counts)
end


"""
    getmoderators(page::Int = 1, pagesize::Int = 1, fromdate::String = "", todate::String = "",
                order::String = "desc", site::String = "stackoverflow", sort::String = "creation")

Returns moderators on a `site`. Returns `pagesize` moderators on `page`.

Possible order values: "desc" or "asc"
Possible sort values: "reputation", "creation", "name", "modified"
"""
function getmoderators(page::Int = 1, pagesize::Int = 1, fromdate::String = "", todate::String = "",
                        order::String = "desc", site::String = "stackoverflow", sort::String = "creation")

    if fromdate != "" && todate != ""
        r = HTTP.request("GET", "https://api.stackexchange.com/2.2/users/moderators?page=$page&pagesize=$pagesize&fromdate=$fromdate&todate=$todate&order=$order&sort=$sort&site=$site")
    else
        r = HTTP.request("GET", "https://api.stackexchange.com/2.2/users/moderators?page=$page&pagesize=$pagesize&order=$order&sort=$sort&site=$site")
    end

    json = StackOverflow.convert_HTTP_Response_To_JSON(r)

    moderators = []
    for (k, v) in json
        if occursin("items", k)
            for item in v
                
                view_count = 0
                down_vote_count = 0
                up_vote_count = 0
                answer_count = 0
                question_count = 0
                account_id = ""
                is_employee = false
                last_modified_date = ""
                last_access_date = ""
                reputation_change_year = ""
                reputation_change_quarter = ""
                reputation_change_month = ""
                reputation_change_week = ""
                reputation_change_day = ""
                reputation = 0
                creation_date = ""
                user_type = ""
                user_id = ""
                accept_rate = ""
                about_me = ""
                location = ""
                website_url = ""
                link = ""
                profile_image = ""
                display_name = ""
                badge_counts = Dict()
                
                for (key, value) in item
                    if occursin("view_count", key)
                        view_count = value
                    elseif occursin("down_vote_count", key)
                        down_vote_count = value
                    elseif occursin("up_vote_count", key)
                        up_vote_count = value
                    elseif occursin("answer_count", key)
                        answer_count = value
                    elseif occursin("question_count", key)
                        question_count = value
                    elseif occursin("account_id", key)
                        account_id = string(value)
                    elseif occursin("is_employee", key)
                        is_employee = value
                    elseif occursin("last_modified_date", key)
                        last_modified_date = string(value)
                    elseif occursin("last_access_date", key)
                        last_access_date = string(value)
                    elseif occursin("reputation_change_year", key)
                        reputation_change_year = string(value)
                    elseif occursin("reputation_change_quarter", key)
                        reputation_change_quarter = string(value)
                    elseif occursin("reputation_change_month", key)
                        reputation_change_month = string(value)
                    elseif occursin("reputation_change_week", key)
                        reputation_change_week = string(value)
                    elseif occursin("reputation_change_day", key)
                        reputation_change_day = string(value)
                    elseif occursin("reputation", key)
                        reputation = value
                    elseif occursin("creation_date", key)
                        creation_date = string(value)
                    elseif occursin("user_type", key)
                        user_type = string(value)
                    elseif occursin("user_id", key)
                        user_id = string(value)
                    elseif occursin("accept_rate", key)
                        accept_rate = string(value)
                    elseif occursin("about_me", key)
                        about_me = string(value)
                    elseif occursin("location", key)
                        location = string(value)
                    elseif occursin("website_url", key)
                        website_url = string(value)
                    elseif occursin("link", key)
                        link = string(value)
                    elseif occursin("profile_image", key)
                        profile_image = string(value)
                    elseif occursin("display_name", key)
                        display_name = string(value)
                    elseif occursin("badge_counts", key)
                        badge_counts = value
                    end
                end
                person_data = Person(view_count, down_vote_count, up_vote_count, answer_count,
                    question_count, account_id, is_employee, last_modified_date, last_access_date,
                    reputation_change_year, reputation_change_quarter, reputation_change_month,
                    reputation_change_week, reputation_change_day, reputation, creation_date,
                    user_type, user_id, accept_rate, about_me, location, website_url, link,
                    profile_image, display_name, badge_counts)
                push!(moderators, person_data)
            end
        end
    end
    return moderators
end
