# Stackoverflow.jl

This package is designed as a wrapped for the [StackOverflow API](https://api.stackexchange.com).

Support from the community would be welcomed in order to expedite coverage of all of the basic abilities.


## Usage

```julia

julia> using Stackoverflow

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
