############################################################
#region debug
import { createLogFunctions } from "thingy-debug"
{log, olog} = createLogFunctions("telegrambotmodule")
#endregion


############################################################
import fs from "fs"
import Slimbot from "slimbot"
import * as c from "./configmodule.js"

############################################################
bot = null
chatId = null
hostname = ""

############################################################
export initialize = () ->
    log "initialize"
    chatId = c.get("telegramChatId")
    token = c.get("telegramToken")
    name = c.get("name")

    if name then hostname = name
    else hostname = fs.readFileSync("/etc/hostname", "utf8")

    hostname = hostname.replaceAll("\n", "")
    hostname = hostname.replaceAll(" ", "")

    bot = new Slimbot(token)
    return

############################################################
export send = (message) ->
    log "send"
    bot.sendMessage(chatId, "#{hostname}: #{message}")
    return
