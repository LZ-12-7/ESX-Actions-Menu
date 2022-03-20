local open = false
ESX = nil

Citizen.CreateThread(function() 
    while ESX == nil do 
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) 
        Citizen.Wait(0) 
    end 
end)

Keys = {
    ["ESC"]       = 322,  ["F1"]        = 288,  ["F2"]        = 289,  ["F3"]        = 170,  ["F5"]  = 166,  ["F6"]  = 167,  ["F7"]  = 168,  ["F8"]  = 169,  ["F9"]  = 56,   ["F10"]   = 57, 
    ["~"]         = 243,  ["1"]         = 157,  ["2"]         = 158,  ["3"]         = 160,  ["4"]   = 164,  ["5"]   = 165,  ["6"]   = 159,  ["7"]   = 161,  ["8"]   = 162,  ["9"]     = 163,  ["-"]   = 84,   ["="]     = 83,   ["BACKSPACE"]   = 177, 
    ["TAB"]       = 37,   ["Q"]         = 44,   ["W"]         = 32,   ["E"]         = 38,   ["R"]   = 45,   ["T"]   = 245,  ["Y"]   = 246,  ["U"]   = 303,  ["P"]   = 199,  ["["]     = 116,  ["]"]   = 40,   ["ENTER"]   = 18,
    ["CAPS"]      = 137,  ["A"]         = 34,   ["S"]         = 8,    ["D"]         = 9,    ["F"]   = 23,   ["G"]   = 47,   ["H"]   = 74,   ["K"]   = 311,  ["L"]   = 182,
    ["LEFTSHIFT"] = 21,   ["Z"]         = 20,   ["X"]         = 73,   ["C"]         = 26,   ["V"]   = 0,    ["B"]   = 29,   ["N"]   = 249,  ["M"]   = 244,  [","]   = 82,   ["."]     = 81,
    ["LEFTCTRL"]  = 36,   ["LEFTALT"]   = 19,   ["SPACE"]     = 22,   ["RIGHTCTRL"] = 70,
    ["HOME"]      = 213,  ["PAGEUP"]    = 10,   ["PAGEDOWN"]  = 11,   ["DELETE"]    = 178,
    ["LEFT"]      = 174,  ["RIGHT"]     = 175,  ["UP"]        = 27,   ["DOWN"]      = 173,
    ["NENTER"]    = 201,  ["N4"]        = 108,  ["N5"]        = 60,   ["N6"]        = 107,  ["N+"]  = 96,   ["N-"]  = 97,   ["N7"]  = 117,  ["N8"]  = 61,   ["N9"]  = 118
}

Citizen.CreateThread(function()
    while true do
        Wait(0)
        if IsControlJustReleased(0, Keys['M']) then
			openMenu()
		end
		if IsControlJustReleased(0, 57) and open or IsControlJustReleased(0, 177) and open then
				SendNUIMessage({
					action = "close"
				})
				open = false
			end
	end
end)

function openMenu()
    local elems = {
    {label = 'Cargar', value = 'cargar'},
    {label = 'Caballito', value = 'caballito'},
    {label = 'Caerse al suelo', value = 'caeraselo'},
    {label = 'Apuntar con pistola a persona', value = 'th'},
}

ESX.UI.Menu.CloseAll()

ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'actionsmenuLZ',{
    title = 'Menu Acciones',
    align = 'right',
    elements = elems
},
function(data, menu)
    if data.current.value == 'cargar' then
        ExecuteCommand('cargar')
        ExecuteCommand('me Lo carga en el hombro')
    elseif data.current.value == 'caballito' then
        ExecuteCommand('caballito')
        ExecuteCommand('me Le carga/Le a las espaldas')
        elseif data.current.value == 'th' then
        ExecuteCommand('th')
        ExecuteCommand('me Le apunta con una pistola en la cabeza')
	elseif data.current.value == 'caerasuelo' then
        ExecuteCommand('suelo')
    end
end,
function(data, menu)
    menu.close()
    end)
end
