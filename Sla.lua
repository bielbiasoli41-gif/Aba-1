-- ABA CRÉDITOS - Godzilla Hub
-- Este script será carregado via loadstring do GitHub

return function(ContentContainer, LocalPlayer, Players, RunService, MarketplaceService, startTime)
    -- Função auxiliar para criar labels
    local function createLabel(text, parent, size, bold)
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, -20, 0, size or 20)
        label.BackgroundTransparency = 1
        label.Text = text
        label.TextColor3 = Color3.fromRGB(255, 255, 255)
        label.Font = bold and Enum.Font.GothamBold or Enum.Font.Gotham
        label.TextSize = size or 14
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.TextWrapped = true
        label.Parent = parent
        return label
    end

    -- Função auxiliar para criar espaçadores
    local function createSpacer(height, parent)
        local spacer = Instance.new("Frame")
        spacer.Size = UDim2.new(1, 0, 0, height)
        spacer.BackgroundTransparency = 1
        spacer.Parent = parent
        return spacer
    end

    -- Função auxiliar para criar botões
    local function createButton(text, callback, parent)
        local button = Instance.new("TextButton")
        button.Size = UDim2.new(1, -20, 0, 40)
        button.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
        button.Text = text
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.Font = Enum.Font.GothamBold
        button.TextSize = 18
        button.Parent = parent
        
        local buttonCorner = Instance.new("UICorner")
        buttonCorner.CornerRadius = UDim.new(0, 8)
        buttonCorner.Parent = button
        
        button.MouseButton1Click:Connect(callback)
        
        button.MouseEnter:Connect(function()
            button.BackgroundColor3 = Color3.fromRGB(0, 140, 235)
        end)
        
        button.MouseLeave:Connect(function()
            button.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
        end)
        
        return button
    end

    -- CONTEÚDO DA ABA CRÉDITOS

    -- Link do Discord (pequeno no topo)
    local discordLinkTop = createLabel("https://discord.gg/PDc8bHsT", ContentContainer, 12, false)
    discordLinkTop.TextColor3 = Color3.fromRGB(200, 200, 200)
    discordLinkTop.TextXAlignment = Enum.TextXAlignment.Center

    createSpacer(10, ContentContainer)

    -- Box com ID da imagem
    local imageIdBox = Instance.new("Frame")
    imageIdBox.Size = UDim2.new(0, 300, 0, 80)
    imageIdBox.Position = UDim2.new(0.5, -150, 0, 0)
    imageIdBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    imageIdBox.BorderSizePixel = 0
    imageIdBox.Parent = ContentContainer

    local imageIdCorner = Instance.new("UICorner")
    imageIdCorner.CornerRadius = UDim.new(0, 5)
    imageIdCorner.Parent = imageIdBox

    local imageIdLabel = Instance.new("TextLabel")
    imageIdLabel.Size = UDim2.new(1, 0, 1, 0)
    imageIdLabel.BackgroundTransparency = 1
    imageIdLabel.Text = "Id da imagem:\n110586608819666"
    imageIdLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
    imageIdLabel.Font = Enum.Font.GothamBold
    imageIdLabel.TextSize = 24
    imageIdLabel.Parent = imageIdBox

    createSpacer(90, ContentContainer)

    -- Título Godzilla Hub
    local titleLabel = createLabel("Godzilla Hub", ContentContainer, 24, true)
    titleLabel.TextXAlignment = Enum.TextXAlignment.Center

    -- Link do Discord (abaixo do título)
    local discordLinkBottom = createLabel("https://discord.gg/PDc8bHsT", ContentContainer, 12, false)
    discordLinkBottom.TextColor3 = Color3.fromRGB(200, 200, 200)
    discordLinkBottom.TextXAlignment = Enum.TextXAlignment.Center

    createSpacer(10, ContentContainer)

    -- Botão Copy Link
    createButton("Copy Link", function()
        setclipboard("https://discord.gg/PDc8bHsT")
        game.StarterGui:SetCore("SendNotification", {
            Title = "Godzilla Hub";
            Text = "Link copiado!";
            Duration = 3;
        })
    end, ContentContainer)

    createSpacer(20, ContentContainer)

    -- Informações do Script
    createLabel("Informações do Script", ContentContainer, 20, true)
    createSpacer(5, ContentContainer)
    createLabel("Criadores:", ContentContainer, 14, true)
    createLabel("sereireconhecido", ContentContainer, 14, false)
    createLabel("Godzilla_eoking1", ContentContainer, 14, false)
    createSpacer(5, ContentContainer)
    createLabel("By:", ContentContainer, 14, true)
    createLabel("Godzilla Studios", ContentContainer, 14, false)
    createSpacer(5, ContentContainer)
    createLabel("Você está usando:", ContentContainer, 14, true)
    createLabel("Godzilla Hub", ContentContainer, 14, false)
    createSpacer(5, ContentContainer)
    createLabel("Executor Utilizado:", ContentContainer, 14, true)
    local executorLabel = createLabel("Detectando...", ContentContainer, 14, false)
    
    -- Detectar executor
    spawn(function()
        wait(0.5)
        local executor = identifyexecutor and identifyexecutor() or "Executor Desconhecido"
        executorLabel.Text = executor
    end)

    createSpacer(20, ContentContainer)

    -- Informações
    createLabel("Informações", ContentContainer, 20, true)
    createSpacer(5, ContentContainer)
    
    -- Data e Hora
    createLabel("Hoje é dia:", ContentContainer, 14, true)
    local dateLabel = createLabel(os.date("%d/%m/%Y - %H:%M:%S"), ContentContainer, 14, false)
    
    -- Atualizar hora
    spawn(function()
        while ContentContainer and dateLabel and dateLabel.Parent do
            dateLabel.Text = os.date("%d/%m/%Y - %H:%M:%S")
            wait(1)
        end
    end)
    
    createSpacer(3, ContentContainer)
    
    -- Nickname
    createLabel("Seu Nickname:", ContentContainer, 14, true)
    createLabel(LocalPlayer.Name, ContentContainer, 14, false)
    createSpacer(3, ContentContainer)
    
    -- ID
    createLabel("Seu ID:", ContentContainer, 14, true)
    createLabel(tostring(LocalPlayer.UserId), ContentContainer, 14, false)
    createSpacer(3, ContentContainer)
    
    -- Jogo
    createLabel("Seu Jogo:", ContentContainer, 14, true)
    local gameLabel = createLabel("Carregando...", ContentContainer, 14, false)
    spawn(function()
        local success, gameInfo = pcall(function()
            return MarketplaceService:GetProductInfo(game.PlaceId)
        end)
        if success and gameInfo then
            gameLabel.Text = gameInfo.Name
        else
            gameLabel.Text = "Não foi possível obter nome do jogo"
        end
    end)
    createSpacer(3, ContentContainer)
    
    -- Tempo de uso
    createLabel("Tempo de uso do script:", ContentContainer, 14, true)
    local timeLabel = createLabel("00:00:00", ContentContainer, 14, false)
    spawn(function()
        while ContentContainer and timeLabel and timeLabel.Parent do
            local elapsed = tick() - startTime
            local hours = math.floor(elapsed / 3600)
            local minutes = math.floor((elapsed % 3600) / 60)
            local seconds = math.floor(elapsed % 60)
            timeLabel.Text = string.format("%02d:%02d:%02d", hours, minutes, seconds)
            wait(1)
        end
    end)
    createSpacer(3, ContentContainer)
    
    -- FPS
    createLabel("Seu Fps:", ContentContainer, 14, true)
    local fpsLabel = createLabel("0", ContentContainer, 14, false)
    spawn(function()
        local lastTime = tick()
        local frameCount = 0
        
        local connection
        connection = RunService.RenderStepped:Connect(function()
            if not ContentContainer or not fpsLabel or not fpsLabel.Parent then
                connection:Disconnect()
                return
            end
            
            frameCount = frameCount + 1
            local currentTime = tick()
            
            if currentTime - lastTime >= 1 then
                fpsLabel.Text = tostring(frameCount)
                frameCount = 0
                lastTime = currentTime
            end
        end)
    end)
    createSpacer(3, ContentContainer)
    
    -- Jogadores
    createLabel("Quantidade de jogadores no serv:", ContentContainer, 14, true)
    local playerCountLabel = createLabel(#Players:GetPlayers() .. " jogadores", ContentContainer, 14, false)
    
    Players.PlayerAdded:Connect(function()
        if ContentContainer and playerCountLabel and playerCountLabel.Parent then
            playerCountLabel.Text = #Players:GetPlayers() .. " jogadores"
        end
    end)
    
    Players.PlayerRemoving:Connect(function()
        wait(0.1)
        if ContentContainer and playerCountLabel and playerCountLabel.Parent then
            playerCountLabel.Text = #Players:GetPlayers() .. " jogadores"
        end
    end)

    print("✅ Aba Créditos carregada com sucesso!")
end
