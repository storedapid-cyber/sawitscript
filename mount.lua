-- Script Teleport Langsung ke Summit
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")

-- Mencari objek bernama Summit atau Checkpoint terakhir (19)
-- Kita cari di folder Checkpoints atau langsung di Workspace
local summit = workspace:FindFirstChild("Summit") 
    or workspace.Checkpoints:FindFirstChild("19") 
    or workspace.Stages:FindFirstChild("19")

if summit then
    print("Otw Puncak Pokoknya!")
    rootPart.CFrame = summit.CFrame + Vector3.new(0, 5, 0)
else
    -- Jika tidak ketemu, script akan mencari objek yang ada kata "Summit" nya
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj.Name == "Summit" or obj.Name == "Puncak" then
            rootPart.CFrame = obj.CFrame + Vector3.new(0, 5, 0)
            break
        end
    end
end
