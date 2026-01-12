# 1. Clean and Run the Generator
Write-Host "--- Step 1: Running SteamApi.Generator ---" -ForegroundColor Cyan
dotnet run --project ./SteamApi.Generator/SteamApi.Generator.csproj

# 2. Build 64-bit (win-x64)
Write-Host "`n--- Step 2: Building 64-bit steam_api64.dll ---" -ForegroundColor Cyan
# We pass TARGET_64BIT via Properties to ensure ArchConfig.cs selects Pack=8
dotnet publish ./steam_api/steam_api.csproj `
    -r win-x64 `
    -c Release `
    -p:PublishAot=true `
    -p:DefineConstants="TARGET_64BIT" `
    --output "./Out/x64"

# 3. Build 32-bit (win-x86)
Write-Host "`n--- Step 3: Building 32-bit steam_api.dll ---" -ForegroundColor Cyan
# We do NOT pass TARGET_64BIT so ArchConfig.cs selects Pack=4
dotnet publish ./steam_api/steam_api.csproj `
    -r win-x86 `
    -c Release `
    -p:PublishAot=true `
    --output "./Out/x86"

Write-Host "`n--- Build Complete ---" -ForegroundColor Green
Write-Host "64-bit: ./Out/x64/steam_api64.dll"
Write-Host "32-bit: ./Out/x86/steam_api.dll"