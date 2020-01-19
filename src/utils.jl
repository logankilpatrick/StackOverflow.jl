using StackOverflow


function convert_HTTP_Response_To_JSON(response)
    compressed = HTTP.payload(response);

    decompressed = transcode(GzipDecompressor, compressed);

    json = JSON.parse(IOBuffer(decompressed))

    return json
end
