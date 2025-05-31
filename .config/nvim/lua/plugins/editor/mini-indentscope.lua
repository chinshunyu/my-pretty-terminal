return {
    "echasnovski/mini.indentscope",
    version = false,
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("mini.indentscope").setup({
            draw = {
                animation = require("mini.indentscope").gen_animation.none()
            }
        })
    end
}

