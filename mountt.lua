local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")

-- Fungsi cari puncak
local function teleportKePuncak()
    -- Cari objek bernama Summit atau nomor 19
    local target = workspace:FindFirstChild("Summit", true) 
                or workspace:FindFirstChild("19", true) 
                or workspace:FindFirstChild("Finish", true)

    if target then
        root.CFrame = target.CFrame + Vector3.new(0, 5, 0)
        print("Berhasil ke puncak!")
    else
        -- Jika tidak ketemu, kita paksa teleport ke posisi tinggi banget (asumsi puncak ada di atas)
        root.CFrame = root.CFrame + Vector3.new(0, 5000, 0)
        print("Mencoba terbang ke atas!")
    end
end

teleportKePuncak()
