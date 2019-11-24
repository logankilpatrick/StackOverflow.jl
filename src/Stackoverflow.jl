module Stackoverflow

using HTTP
using CodecZlib
using JSON

include("requests.jl")
export
    getrecentquestionsfortag

include("privilages.jl")
export
    checkmyprivilages,
    getprivilages

include("utils.jl")
export
    convert_HTTP_Response_To_JSON

end # module
