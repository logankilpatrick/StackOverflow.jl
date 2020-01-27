![logo](assets/logo.png)

![GitHub commit activity](https://img.shields.io/github/commit-activity/m/logankilpatrick/StackOverflow.jl?style=for-the-badge) 

[![alt text](https://img.shields.io/badge/slack-join%20the%20StackOverflow%20channel%20on%20Slack-9d72b1?style=for-the-badge&logo=slack)](https://slackinvite.julialang.org) 

[![codecov](https://codecov.io/gh/logankilpatrick/StackOverflow.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/logankilpatrick/StackOverflow.jl)

![GitHub followers](https://img.shields.io/github/followers/logankilpatrick?label=Follow&style=social)


This package is designed as a wrapped for the [StackOverflow API](https://api.stackexchange.com).

Support from the community would be welcomed in order to expedite coverage of all of the basic abilities.
I am also very aware that my approach to implementing this API in Julia is likely not the best approach. This repo and my Julia capabilities are always a WIP.

## Installation

![logo](assets/install.png)

_Note_: Typing `]` into the Julia Repl will put you in the package manager. 

## Usage

```julia

julia> using StackOverflow

julia> qHolder = getrecentquestionsfortag()

julia> qHolder[1]
Questions(Any["https://stackoverflow.com/questions/59010720/how-to-make-a-request-to-a-specific-url-in-julia"], Any[15], Any[1574532755], Any[true], Any[Dict{String,Any}("user_type" => "registered","display_name" => "logankilpatrick","reputation" => 2135,"user_id" => 7619808,"link" => "https://stackoverflow.com/users/7619808/logankilpatrick","profile_image" => "https://i.stack.imgur.com/gHvtS.png?s=128&g=1")], Any[1574534113], Any[0], Any[59010920], Any[59010720], Any[Any["julia"]], Any["How to make a request to a specific URL in Julia?"], Any[1])

julia> qHolder[1].link
1-element Array{Any,1}:
 "https://stackoverflow.com/questions/59010720/how-to-make-a-request-to-a-specific-url-in-julia"

julia> qHolder[1].view_count
1-element Array{Any,1}:
 15

julia> qHolder[1].owner
1-element Array{Any,1}:
 Dict{String,Any}("user_type" => "registered","display_name" => "logankilpatrick","reputation" => 2135,"user_id" => 7619808,"link" => "https://stackoverflow.com/users/7619808/logankilpatrick","profile_image" => "https://i.stack.imgur.com/gHvtS.png?s=128&g=1")

julia> qHolder[1].score
1-element Array{Any,1}:
 0

julia> qHolder[1].title
1-element Array{Any,1}:
 "How to make a request to a specific URL in Julia?"

julia> qHolder[1].answer_count
1-element Array{Any,1}:
 1

julia> qHolder[2]
Questions(Any["https://stackoverflow.com/questions/58956518/how-can-i-view-profiling-information-visually"], Any[145], Any[1574259575], Any[true], Any[Dict{String,Any}("user_type" => "registered","display_name" => "Marouane1994","reputation" => 173,"user_id" => 12078089,"link" => "https://stackoverflow.com/users/12078089/marouane1994","profile_image" => "https://www.gravatar.com/avatar/67241161f774e0fd40923e37c370fb26?s=128&d=identicon&r=PG&f=1")], Any[1574519259], Any[0], Any[], Any[58956518], Any[Any["julia"]], Any["How can I view profiling information visually?"], Any[1])
```

Another example:

```julia

julia> using StackOverflow

julia> checkmyprivileges("logankilpatrick")
Your current rep is 2165 and your privileges are as follows:


description: Ask a question or contribute an answer
short_description: create posts

description: Discuss the site itself,  bugs, feedback, and governance
short_description: participate in meta

description: Post more links, answer protected questions
short_description: answer protected questions

description: Create answers that can be easily edited by most users
short_description: create wiki posts

description: Bring content to the attention of the community via flags
short_description: flag posts

description: Indicate when questions and answers are useful
short_description: vote up

description: Participate in this site's chat rooms
short_description: talk in chat

description: Leave comments on other people's posts
short_description: comment everywhere

description: Offer some of your reputation as bounty on a question
short_description: set bounties

description: Collaborate on the editing and improvement of wiki posts
short_description: edit community wikis

description: Create new chat rooms
short_description: create chat rooms

description: Indicate when questions and answers are not useful
short_description: vote down

description: Some ads are now automatically disabled
short_description: see reduced ads

description: View and cast close/reopen votes on your own questions
short_description: view close votes

description: Access first posts and late answers review queues
short_description: access review queues

description: See vote breakout, expandable usercard
short_description: see votes, expandable usercard

description: Create chat rooms where only specific users may talk
short_description: create gallery chat rooms

description: Add new tags to the site
short_description: create new tags

description: Edits to any question or answer are applied immediately
short_description: edit questions and answers
```
