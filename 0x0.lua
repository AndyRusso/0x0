local mp = require('mp')

local function upload()
    local file = io.popen(
        '0x0 ' .. mp.get_property('path') .. [[ 2>&1 | stdbuf -oL tr '\r' '\n']]
    )

    mp.osd_message('Uploading: 0.0%')

    ---@cast file -nil
    for line in file:lines() do
        if line:sub(-1) == '%' then
            line = line:reverse()
            line = line
                :sub(1, line:find(' ') - 1)
                :reverse()

            mp.osd_message(
                'Uploading: ' .. line, line ~= '100.0%' and 10000 or nil
            )
        end
    end
end

mp.add_key_binding('U', '0x0', upload)

