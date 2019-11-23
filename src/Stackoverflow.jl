module Stackoverflow

using HTTP
using Revise
using CodecZlib
using JSON

include("requests.jl")
export
    getrecentquestionsfortag

include("privilages.jl")
export
    getprivilages
    checkmyprivilages

include("utils.jl")
export
    convert_HTTP_Response_To_JSON

end # module
