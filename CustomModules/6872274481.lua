loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/CustomModules/6872274481.lua"))()
if shared.noboline then
	task.spawn(function()
		repeat
			task.wait()
			if GuiLibrary["MainGui"].Parent ~= nil then
				GuiLibrary["MainGui"].ScaledGui.Visible = false
				GuiLibrary["MainGui"].ScaledGui.ClickGui.Visible = false
				GuiLibrary["MainBlur"].Enabled = false
			else
				break
			end
		until true == false
	end)
	runcode(function()
		local function removeTags(str)
			str = str:gsub("<br%s*/>", "\n")
			str = str:gsub("Vape", "Noboline")
			str = str:gsub("vape", "noboline")
			return (str:gsub("<[^<>]->", ""))
		end
		GuiLibrary["CreateNotification"] = function(top, bottom, duration, customicon)
			game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = "Noboline",
				Text = removeTags(bottom),
				Duration = duration,
			})
		end
	end)
	task.spawn(function()
		task.wait(2)
		local ImageLabel = Instance.new("ImageLabel")
		ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ImageLabel.BackgroundTransparency = 1.000
		ImageLabel.BorderSizePixel = 0
		ImageLabel.Position = UDim2.new(0.5, -120, 0.5, -120)
		ImageLabel.Size = UDim2.new(0, 240, 0, 240)
		ImageLabel.ImageTransparency = 1
		ImageLabel.Image = "http://www.roblox.com/asset/?id=7211055081"
		ImageLabel.Parent = GuiLibrary["MainGui"]
		ImageLabel.Visible = isblatant()
		local TextMessage = Instance.new("TextLabel")
		TextMessage.TextSize = 24
		TextMessage.Font = Enum.Font.SourceSans
		TextMessage.TextStrokeTransparency = 0
		TextMessage.Text = ""
		TextMessage.TextColor3 = Color3.new(1, 1, 1)
		TextMessage.Position = UDim2.new(0.5, 0, 1, 20)
		TextMessage.TextStrokeColor3 = Color3.fromRGB(0,0,0)
		TextMessage.Parent = ImageLabel
		TextMessage.Visible = isblatant()
		for i = 1, 0, -0.1 do 
			wait(0.05)
			ImageLabel.ImageTransparency = i
		end
		task.wait(0.2)
		TextMessage.Text = "Loading dependencies..."
		task.wait(1)
		TextMessage.Text = "Loading tables..."
		task.wait(3)
		TextMessage:Remove()
		ImageLabel:Remove()
		
		
		
		local kavo = loadstring(game:HttpGet("https://raw.githubusercontent.com/NTDCore/NightBedCommunityOfficial/main/Theme/Night/bed/lol/XD/Chill/long/Kavo.lua"))()
		local window = kavo.CreateLib("Noboline "..(shared.VapePrivate and " - PRIVATE" or ""), "Ocean")
		local realgui = game:GetService("CoreGui")[debug.getupvalue(kavo.ToggleUI, 1)]
		if not is_sirhurt_closure and syn and syn.protect_gui then
			syn.protect_gui(realgui)
		elseif gethui then
			realgui.Parent = gethui()
		end
		fakeuiconnection = uis.InputBegan:connect(function(input1)
			if bettergetfocus() == nil then
				if input1.KeyCode == Enum.KeyCode[GuiLibrary["GUIKeybind"]] and GuiLibrary["KeybindCaptured"] == false then
					realgui.Enabled = not realgui.Enabled
					uis.OverrideMouseIconBehavior = (realgui.Enabled and Enum.OverrideMouseIconBehavior.ForceShow or game:GetService("VRService").VREnabled and Enum.OverrideMouseIconBehavior.ForceHide or Enum.OverrideMouseIconBehavior.None)
				end
			end
		end)
		realgui.Enabled = isblatant()
		game.CoreGui.ChildRemoved:connect(function(obj)
			if obj == realgui then
				GuiLibrary["SelfDestruct"]()
			end
		end)
		local windowtabs = {
			Combat = window:NewTab("Combat ⚔"),
			Blatant = window:NewTab("Blatant ☠"),
			Render = window:NewTab("Render 👁"),
			Utility = window:NewTab("Utility 🛠"),
			World = window:NewTab("World 🌍"),
		}
		local windowsections = {}
		local tab = {}
		local tab2 = {}
		for i,v in pairs(GuiLibrary["ObjectsThatCanBeSaved"]) do 
			if v.Type == "OptionsButton" then
				table.insert(tab, v)
			end
			if v.Type == "Toggle" then
				table.insert(tab2, v)
			end
			if v.Type == "Slider" then
				table.insert(tab2, v)
			end
			if v.Type == "Dropdown" then
				table.insert(tab2, v)
			end
			if v.Type == "ColorSlider" then
				table.insert(tab2, v)
			end
		end
		table.sort(tab, function(a, b) 
			if a.Type ~= "OptionsButton" then
				a = {Object = {Name = tostring(a["Object"].Parent):gsub("Children", "")..a["Object"].Name}}
			else
				a = {Object = {Name = a["Object"].Name}}
			end
			if b.Type ~= "OptionsButton" then
				b = {Object = {Name = tostring(b["Object"].Parent):gsub("Children", "")..b["Object"].Name}}
			else
				b = {Object = {Name = b["Object"].Name}}
			end
			return a["Object"].Name:lower() < b["Object"].Name:lower() 
		end)
		table.sort(tab2, function(a, b) 
			a = {Object = {Name = tostring(a["Object"].Parent):gsub("Children", "")..a["Object"].Name}}
			b = {Object = {Name = tostring(b["Object"].Parent):gsub("Children", "")..b["Object"].Name}}
			return a["Object"].Name:lower() < b["Object"].Name:lower() 
		end)
		for i,v in pairs(tab) do 
			if v.Type == "OptionsButton" then 
				local old = v["Api"]["ToggleButton"]
				local newstr = tostring(v["Object"]):gsub("Button", "")
				windowsections[newstr] = windowtabs[tostring(v["Object"].Parent.Parent)]:NewSection(newstr)
				local tog = windowsections[newstr]:NewToggle(newstr, "", function(callback)
					if callback ~= v["Api"]["Enabled"] then
						old(true)
					end
				end)
				local keybind = windowsections[newstr]:NewKeybind("Keybind", "", {Name = v["Api"]["Keybind"] ~= "" and v["Api"]["Keybind"] or "None"}, function(key)
					GuiLibrary["KeybindCaptured"] = true
					v["Api"]["SetKeybind"](key == "None" and "" or key)
					task.delay(0.1, function() GuiLibrary["KeybindCaptured"] = false end)
				end)
				v["Api"]["ToggleButton"] = function(clicked, toggle)
					local res = old(clicked, toggle)
					tog:UpdateToggle(tostring(v["Object"]):gsub("Button", ""), v["Api"]["Enabled"])
					return res
				end
				tog:UpdateToggle(tostring(v["Object"]):gsub("Button", ""), v["Api"]["Enabled"])
			end
		end
		for i,v in pairs(tab2) do 
			if v.Type == "Toggle" and tostring(v["Object"].Parent.Parent.Parent) ~= "ClickGui" and GuiLibrary["ObjectsThatCanBeSaved"][tostring(v["Object"].Parent):gsub("Children", "OptionsButton")] and GuiLibrary["ObjectsThatCanBeSaved"][tostring(v["Object"].Parent):gsub("Children", "OptionsButton")]["ChildrenObject"] == v["Object"].Parent then
				local newstr = tostring(v["Object"].Parent):gsub("Children", "")
				local old = v["Api"]["ToggleButton"]
				local tog = windowsections[newstr]:NewToggle(tostring(v["Object"]):gsub("Button", ""), "", function(callback)
					if callback ~= v["Api"]["Enabled"] then
						old(true)
					end
				end)
				v["Api"]["ToggleButton"] = function(clicked, toggle)
					local res = old(clicked, toggle)
					tog:UpdateToggle(tostring(v["Object"]):gsub("Button", ""), v["Api"]["Enabled"])
					return res
				end
				tog:UpdateToggle(tostring(v["Object"]):gsub("Button", ""), v["Api"]["Enabled"])
			end
			if v.Type == "Slider" and GuiLibrary["ObjectsThatCanBeSaved"][tostring(v["Object"].Parent):gsub("Children", "OptionsButton")] and GuiLibrary["ObjectsThatCanBeSaved"][tostring(v["Object"].Parent):gsub("Children", "OptionsButton")]["ChildrenObject"] == v["Object"].Parent then
				local newstr = tostring(v["Object"].Parent):gsub("Children", "")
				local old = v["Api"]["SetValue"]
				local slider = windowsections[newstr]:NewSlider(v["Object"].Name, "", v["Api"]["Max"], v["Api"]["Min"], function(s)
					if s ~= v["Api"]["Value"] then
						old(s)
					end
				end)
				v["Api"]["SetValue"] = function(value, ...)
					local res = old(value, ...)
					slider:UpdateSlider(value)
					return res
				end
				v["Api"]["SetValue"](tonumber(v["Api"]["Value"]))
			end
			if v.Type == "ColorSlider" and GuiLibrary["ObjectsThatCanBeSaved"][tostring(v["Object"].Parent):gsub("Children", "OptionsButton")] and GuiLibrary["ObjectsThatCanBeSaved"][tostring(v["Object"].Parent):gsub("Children", "OptionsButton")]["ChildrenObject"] == v["Object"].Parent then
				local newstr = tostring(v["Object"].Parent):gsub("Children", "")
				local old = v["Api"]["SetValue"]
				v["Api"]["RainbowValue"] = false
				local slider = windowsections[newstr]:NewColorPicker(v["Object"].Name, "", Color3.fromHSV(v["Api"]["Hue"], v["Api"]["Sat"], v["Api"]["Value"]), function(col)
					old(col:ToHSV())
				end)
			end
			if v.Type == "Dropdown" and GuiLibrary["ObjectsThatCanBeSaved"][tostring(v["Object"].Parent):gsub("Children", "OptionsButton")] and GuiLibrary["ObjectsThatCanBeSaved"][tostring(v["Object"].Parent):gsub("Children", "OptionsButton")]["ChildrenObject"] == v["Object"].Parent then
				local newstr = tostring(v["Object"].Parent):gsub("Children", "")
				local old = v["Api"]["SetValue"]
				local dropdown = windowsections[newstr]:NewDropdown(v["Object"].Name, "", debug.getupvalue(v["Api"]["SetValue"], 4)["List"], function(currentOption)
					if currentOption ~= v["Api"]["Value"] then
						v["Api"]["SetValue"](currentOption)
					end
				end)
				dropdown:SetValue(v["Api"]["Value"])
			end
		end
	end)
end
