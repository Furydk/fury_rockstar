RegisterCommand("rockstar", function()
    lib.registerContext({
        id = "editor_menu",
        title = "Rockstar Editor",
        options = {
            {
                title = Config.buttonRecord,
                description = "Start optagelse",
                icon = "video",
                value = "record",
                onSelect = function()
                    StartRecording(1) -- https://docs.fivem.net/natives/?_0xC3AC2FFF9612AC81
                    lib.notify({
                        description = "Optagelse startet",
                        type = "success"
                    })
                end
            },
            {
                title = Config.buttonSaveClip,
                description = "Gem optagelse",
                icon = "file",
                value = "saveclip",
                onSelect = function()
                    StartRecording(0)          -- https://docs.fivem.net/natives/?_0xC3AC2FFF9612AC81
                    StopRecordingAndSaveClip() -- https://docs.fivem.net/natives/?_0x071A5197D6AFC8B3
                    lib.notify({
                        description = "Optagelse Gemt",
                        type = "success"
                    })
                end
            },
            {
                title = Config.buttonDelClip,
                description = "Stop og slet optagelse",
                icon = "video-slash",
                value = "delclip",
                onSelect = function()
                    StopRecordingAndDiscardClip() -- https://docs.fivem.net/natives/?_0x88BB3507ED41A240
                    lib.notify({
                        description = "Optagelse Slettet",
                        type = "success"
                    })
                end
            },
            {
                title = Config.buttonEditor,
                description = "Tilgå Rockstar Editor Menu for at redigere dine Optagelser.",
                icon = "gear",
                value = "editor",
                onSelect = function()
                    NetworkSessionLeaveSinglePlayer() -- https://docs.fivem.net/natives/?_0x3442775428FD2DAA
                    ActivateRockstarEditor()          -- https://docs.fivem.net/natives/?_0x49DA8145672B2725
                end
            },
        }
    })
    lib.showContext("editor_menu")
end)



-- [[ Register Events ]] --
RegisterNetEvent("nad_rockstar:record")
AddEventHandler("nad_rockstar:record", function()
    StartRecording(1) -- https://docs.fivem.net/natives/?_0xC3AC2FFF9612AC81
    notify(Config.record)
end)

RegisterNetEvent("nad_rockstar:saveclip")
AddEventHandler("nad_rockstar:saveclip", function()
    StartRecording(0)          -- https://docs.fivem.net/natives/?_0xC3AC2FFF9612AC81
    StopRecordingAndSaveClip() -- https://docs.fivem.net/natives/?_0x071A5197D6AFC8B3
    notify(Config.saveclip)
end)

RegisterNetEvent("nad_rockstar:delclip")
AddEventHandler("nad_rockstar:delclip", function()
    StopRecordingAndDiscardClip() -- https://docs.fivem.net/natives/?_0x88BB3507ED41A240
    notify(Config.delclip)
end)

RegisterNetEvent("nad_rockstar:editor")
AddEventHandler("nad_rockstar:editor", function()
    notify(Config.editor)
    NetworkSessionLeaveSinglePlayer() -- https://docs.fivem.net/natives/?_0x3442775428FD2DAA
    ActivateRockstarEditor()          -- https://docs.fivem.net/natives/?_0x49DA8145672B2725
end)

function notify(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(true, true)
end
