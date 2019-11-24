module Stackoverflow

using HTTP
using CodecZlib
using JSON

include("requests.jl")
export
    getrecentquestionsfortag

include("privileges.jl")
export
    checkmyprivileges,
    getprivileges

include("utils.jl")
export
    convert_HTTP_Response_To_JSON

end # module
