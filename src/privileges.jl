using Stackoverflow

"""
    checkmyprivileges(username::String)

Takes in a username and returns the privileges said user has.
"""
function checkmyprivileges(username::String = "")


    r = HTTP.request("GET", "https://api.stackexchange.com/2.2/users?order=desc&sort=reputation&inname=$(username)&site=stackoverflow")
    #TODO: May return multiple names.

    json_obj = Stackoverflow.convert_HTTP_Response_To_JSON(r)

    for (k, v) in json_obj
        if occursin("items", k)
            for item in v
                for (key, value) in item
                    if key == "reputation"

                        println("Your current rep is $(value) and your privileges are as follows: \n")
                        if value >= 1

                            println("\ndescription: Ask a question or contribute an answer")
                            println("short_description: create posts")
                        end

                        if value >= 5

                            println("\ndescription: Discuss the site itself,  bugs, feedback, and governance")
                            println("short_description: participate in meta")
                        end

                        if value >= 10

                            println("\ndescription: Post more links, answer protected questions")
                            println("short_description: answer protected questions")

                            println("\ndescription: Create answers that can be easily edited by most users")
                            println("short_description: create wiki posts")
                        end

                        if value >= 15

                            println("\ndescription: Bring content to the attention of the community via flags")
                            println("short_description: flag posts")

                            println("\ndescription: Indicate when questions and answers are useful")
                            println("short_description: vote up")
                        end

                        if value >= 20

                            println("\ndescription: Participate in this site's chat rooms")
                            println("short_description: talk in chat")
                        end

                        if value >= 50

                            println("\ndescription: Leave comments on other people's posts")
                            println("short_description: comment everywhere")
                        end

                        if value >= 75

                            println("\ndescription: Offer some of your reputation as bounty on a question")
                            println("short_description: set bounties")
                        end

                        if value >= 100

                            println("\ndescription: Collaborate on the editing and improvement of wiki posts")
                            println("short_description: edit community wikis")

                            println("\ndescription: Create new chat rooms")
                            println("short_description: create chat rooms")
                        end

                        if value >= 125

                            println("\ndescription: Indicate when questions and answers are not useful")
                            println("short_description: vote down")
                        end

                        if value >= 200

                            println("\ndescription: Some ads are now automatically disabled")
                            println("short_description: see reduced ads")
                        end

                        if value >= 250

                            println("\ndescription: View and cast close/reopen votes on your own questions")
                            println("short_description: view close votes")
                        end

                        if value >= 500

                            println("\ndescription: Access first posts and late answers review queues")
                            println("short_description: access review queues")
                        end

                        if value >= 1000

                            println("\ndescription: See vote breakout, expandable usercard")
                            println("short_description: see votes, expandable usercard")


                            println("\ndescription: Create chat rooms where only specific users may talk")
                            println("short_description: create gallery chat rooms")
                        end

                        if value >= 1500

                            println("\ndescription: Add new tags to the site")
                            println("short_description: create new tags")
                        end

                        if value >= 2000

                            println("\ndescription: Edits to any question or answer are applied immediately")
                            println("short_description: edit questions and answers")
                        end

                        if value >= 2500

                            println("\ndescription: Decide which tags have the same meaning as others")
                            println("short_description: create tag synonyms")
                        end

                        if value >= 3000

                            println("\ndescription: Help decide whether posts are off-topic or duplicates")
                            println("short_description: cast close & reopen votes")
                        end

                        if value >= 5000

                            println("\ndescription: Approve edits to tag wikis made by regular users")
                            println("short_description: approve tag wiki edits")
                        end

                        if value >= 10000

                            println("\ndescription: Access reports, delete questions, review reviews")
                            println("short_description: access moderator tools")
                        end

                        if value >= 15000

                            println("\ndescription: Mark questions as protected")
                            println("short_description: protect questions")
                        end

                        if value >= 20000

                            println("\ndescription: Expanded editing, deletion and undeletion privileges")
                            println("short_description: access 'trusted user' tools")
                        end

                        if value >= 25000

                            println("\ndescription: Access to internal and Google site analytics")
                            println("short_description: access to site analytics")
                        end

                        if value == 0
                            println("You have no privileges currently.")
                        end

                    end
                end
            end
        end
    end

end

"""
    getprivileges()

Prints out the various privilege levels in Stack Overflow and the rep
required to have said privileges.
"""
function getprivileges()
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
