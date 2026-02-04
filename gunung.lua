local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")
local folder = workspace:FindFirstChild("Checkpoints") or workspace:FindFirstChild("Stages")

for i = 1, 19 do
    local cp = folder:FindFirstChild(tostring(i))
    if cp then
        rootPart.CFrame = cp.CFrame + Vector3.new(0, 3, 0)
    end
    task.wait(1.2)
end
