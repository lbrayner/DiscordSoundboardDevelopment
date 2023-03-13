vim.cmd.packadd "nvim-jdtls"

return {
    get_config = function()
        return {
            cmd = {
                "jdtls",
                "-configuration",
                vim.env.HOME.."/.apps/DiscordSoundboard/jdtls/.cache/jdtls/config",
                "-data",
                vim.env.HOME.."/.apps/DiscordSoundboard/jdtls/.cache/jdtls/workspace",
                "--jvm-arg=-javaagent:"..vim.env.HOME.."/.apps/DiscordSoundboard/lib/lombok.jar",
                "--jvm-arg=-Xbootclasspath/a:"..vim.env.HOME.."/.apps/DiscordSoundboard/lib/lombok.jar",
            },
            root_dir = require("jdtls.setup").find_root({".git", "mvnw", "gradlew"}),
            url = (function()
                local prefs = vim.env.HOME.."/.config/nvim/config/jdtls/settings.prefs"
                if vim.fn.filereadable(prefs) == 1 then
                    return prefs
                end
            end)(),
        }
    end,
}
