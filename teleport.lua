local player = game.Players.LocalPlayer
local checkpoints = workspace:FindFirstChild("Checkpoints") or workspace:FindFirstChild("Stages")

for i = 1, 19 do
    local stage = checkpoints:FindFirstChild(tostring(i))
    if stage and player.Character then
        player.Character.HumanoidRootPart.CFrame = stage.CFrame + Vector3.new(0, 3, 0)
    end
    task.wait(1) -- Jeda 1 detik biar aman
end
