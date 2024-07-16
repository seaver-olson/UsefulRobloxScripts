--[[
USAGE INSTRUCTIONS:
	place script in same folder or location as the two teleporting pads
	the pads can be any part just make sure the names match the variables
	
	

]]
local pad1 = script.Parent:FindFirstChild("Pad1")
local pad2 = script.Parent:FindFirstChild("Pad2")

local TweenService = game:GetService("TweenService")-- used to smoothly teleport instead of instant movement

local function disablePad(Part) --used to make sure the player isnt stuck in a constant loop of teleporting
	Part.canTouch = false
	wait(1)--change variable to match how long you want the teleporter cooldown to be
	Part.canTouch = true
end


pad1.Touched:Connect(function(character)
	local person = character.Parent:findFirstChild("HumanoidRootPart")
	local goal = {}
	goal.CFrame = pad2.CFrame + Vector3.new(0,10,0)
	local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Linear)
	local tween = TweenService:Create(person, tweenInfo, goal)
	tween:Play()
	disablePad(pad2)
end)

pad2.Touched:Connect(function(character)
	local person = character.Parent:FindFirstChild("HumanoidRootPart")
	local goal = {}
	goal.CFrame = pad1.CFrame + Vector3.new(0,10,0)
	local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Linear)
	local tween = TweenService:Create(person, tweenInfo, goal)
	tween:Play()
	disablePad(pad1)
end)


--[[  
If you want instant teleportation delete the above functions and replace with these.  WARNING roblox physics engine might not be able to handle it.

pad1.Touched:Connect(function(character)
	local person = character.Parent:findFirstChild("HumanoidRootPart")
	person.CFrame = pad2.CFrame + Vector3.new(0,10,0)
	disablePad(pad2)
end)

pad2.Touched:Connect(function(character)
	local person = character.Parent:FindFirstChild("HumanoidRootPart")
	person.CFrame = pad1.CFrame + Vector3.new(0,10,0)
	disablePad(pad1)
end)

]]
