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

    # use name as hostname if we have a name in the config
    if name then hostname = name
    else hostname = fs.readFileSync("/etc/hostname", "utf8")

    hostname = hostname.replaceAll("\n", "")
    hostname = hostname.replaceAll(" ", "")

    bot = new Slimbot(token)
    return

############################################################
export send = (message) ->
    log "send"
    try bot.sendMessage(chatId, "#{hostname}: #{message}")
    catch err then log err
    return
