 local fsButtonlib = {};

    function fsButtonlib:CreateButton(name, color, signalcallback)
        local gui = game:service'Players'.LocalPlayer.PlayerGui:WaitForChild'HUD'.Bottom.SideMenu;
        local clon;
        local yloltbl = {};

    for i,v in next, gui:children() do
    if ( v:FindFirstChildWhichIsA'TextLabel') then
        yloltbl[v] = v.Position.Y.Scale; 
        end;
    end;

    local biggestscale;
    for i,x in next, yloltbl do
        local tabal = {};
        local broken = false;
        for i,v in next, yloltbl do
            if (v~=x) then
                tabal[#tabal+1] = v;
            end;
        end;
        for i,v in next, tabal do
            if (x<v) then
            broken=true;
            end;
        end;
        if not broken then
        biggestscale = i;
        break;
        end
    end;

        
    clon = biggestscale:Clone();
        if (clon~=nil) and name~=nil and color~=nil then
            clon.Visible = false;
            clon:FindFirstChildWhichIsA'TextLabel'.Text = tostring(name):upper();
            clon.ImageColor3 = color;
            
        end;
        --positioning
        local clonepos = clon.Position + UDim2.new(0,0,0.1,0);
        for i,v in next, gui:children() do
        end;
        clon.Position = clonepos;
        clon.Name = "Open Gui"
        if (gui:FindFirstChild(tostring(name))) then
            clon.Name = tostring(name).. '_clon';
        else
            clon.Name = tostring(name):gsub(' ', '_');
        end;
        clon.Parent = gui;
        clon.Visible = true;
        --signals
    -- local oldoofidx = getmetatable(oof).__index;
    --local adida = getfenv(1);
    --adida[#adida+1] = {button = clon};
        clon.MouseButton1Down:connect(signalcallback);
        local oldimgc = clon.ImageColor3;
        clon.MouseEnter:connect(function()
            clon.ImageColor3 = Color3.new(oldimgc.r*.8, oldimgc.g*.8, oldimgc.b*.8);
        end);
        clon.MouseLeave:connect(function()
            clon.ImageColor3 = oldimgc;
        end);
        
    end;
