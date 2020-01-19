using StackOverflow

mutable struct Person
    view_count::Vector
    down_vote_count::Vector
    up_vote_count::Vector
    answer_count::Vector
    question_count::Vector
    account_id::Vector
    is_employee::Vector
    last_modified_date::Vector
    last_access_date::Vector
    reputation_change_year::Vector
    reputation_change_quarter::Vector
    reputation_change_month::Vector
    reputation_change_week::Vector
    reputation_change_day::Vector
    reputation::Vector
    creation_date::Vector
    user_type::Vector
    user_id::Vector
    accept_rate::Vector
    about_me::Vector
    location::Vector
    website_url::Vector
    link::Vector
    profile_image::Vector
    display_name::Vector
    badge_counts::Vector
    
    Person(view_count::Vector = [], down_vote_count::Vector = [], up_vote_count::Vector = [],
        answer_count::Vector = [], question_count::Vector = [], account_id::Vector = [],
        is_employee::Vector = [], last_modified_date::Vector = [], last_access_date::Vector = [],
        reputation_change_year::Vector = [], reputation_change_quarter::Vector = [],
        reputation_change_month::Vector = [], reputation_change_week::Vector = [],
        reputation_change_day::Vector = [], reputation::Vector = [], creation_date::Vector = [],
        user_type::Vector = [], user_id::Vector = [], accept_rate::Vector = [], about_me::Vector = [],
        location::Vector = [], website_url::Vector = [], link::Vector = [], profile_image::Vector = [],
        display_name::Vector = [], badge_counts::Vector = []) =
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
                
                view_count =                Vector()
                down_vote_count =           Vector()
                up_vote_count =             Vector()
                answer_count =              Vector()
                question_count =            Vector()
                account_id =                Vector()
                is_employee =               Vector()
                last_modified_date =        Vector()
                last_access_date =          Vector()
                reputation_change_year =    Vector()
                reputation_change_quarter = Vector()
                reputation_change_month =   Vector()
                reputation_change_week =    Vector()
                reputation_change_day =     Vector()
                reputation =                Vector()
                creation_date =             Vector()
                user_type =                 Vector()
                user_id =                   Vector()
                accept_rate =               Vector()
                about_me =                  Vector()
                location =                  Vector()
                website_url =               Vector()
                link =                      Vector()
                profile_image =             Vector()
                display_name =              Vector()
                badge_counts =              Vector()
                
                for (key, value) in item
                    if occursin("view_count", key)
                        push!(view_count, value)
                    elseif occursin("view_count", key)
                        push!(view_count, value)
                    elseif occursin("down_vote_count", key)
                        push!(down_vote_count, value)
                    elseif occursin("up_vote_count", key)
                        push!(up_vote_count, value)
                    elseif occursin("answer_count", key)
                        push!(answer_count, value)
                    elseif occursin("question_count", key)
                        push!(question_count, value)
                    elseif occursin("account_id", key)
                        push!(account_id, value)
                    elseif occursin("is_employee", key)
                        push!(is_employee, value)
                    elseif occursin("last_modified_date", key)
                        push!(last_modified_date, value)
                    elseif occursin("last_access_date", key)
                        push!(last_access_date, value)
                    elseif occursin("reputation_change_year", key)
                        push!(reputation_change_year, value)
                    elseif occursin("reputation_change_quarter", key)
                        push!(reputation_change_quarter, value)
                    elseif occursin("reputation_change_month", key)
                        push!(reputation_change_month, value)
                    elseif occursin("reputation_change_week", key)
                        push!(reputation_change_week, value)
                    elseif occursin("reputation_change_day", key)
                        push!(reputation_change_day, value)
                    elseif occursin("reputation", key)
                        push!(reputation, value)
                    elseif occursin("creation_date", key)
                        push!(creation_date, value)
                    elseif occursin("user_type", key)
                        push!(user_type, value)
                    elseif occursin("user_id", key)
                        push!(user_id, value)
                    elseif occursin("accept_rate", key)
                        push!(accept_rate, value)
                    elseif occursin("about_me", key)
                        push!(about_me, value)
                    elseif occursin("location", key)
                        push!(location, value)
                    elseif occursin("website_url", key)
                        push!(website_url, value)
                    elseif occursin("link", key)
                        push!(link, value)
                    elseif occursin("profile_image", key)
                        push!(profile_image, value)
                    elseif occursin("display_name", key)
                        push!(display_name, value)
                    elseif occursin("badge_counts", key)
                        push!(badge_counts, value)
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
