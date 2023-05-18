# Create a new dotnet REST API project
# Usage: dotnetNew -Name MyProject -FolderName MyProjectFolder

if (!(Get-Command -Name dotnet -ErrorAction SilentlyContinue)) {
    Write-Host "DotNet is not installed" -ForegroundColor Yellow
}
else {
    function New-RestAPI {
        param(
            [Parameter(Mandatory=$false)]
            [string]$Name = "RestAPI",
            [string]$FolderName = "RestAPI"
        )

        # Create the folder structure
        New-Item -Path "." -Name $FolderName -ItemType "directory"
        New-Item -Path $FolderName -Name "src" -ItemType "directory"
        New-Item -Path $FolderName -Name "docs" -ItemType "directory"
        Set-Location -Path $FolderName

        # Create the dotnet projects and solution
        dotnet new webapi -n $Name -o ".\src\$Name"
        dotnet new xunit -n "$Name.Tests" -o ".\src\$Name.Tests"
        dotnet new sln -n "$Name" -o ".\src"

        # Add the projects to the solution
        dotnet sln ".\src\$Name.sln" add ".\src\$Name\$Name.csproj"
        dotnet sln ".\src\$Name.sln" add ".\src\$Name.Tests\$Name.Tests.csproj"

        # Add the project references
        dotnet add ".\src\$Name.Tests\$Name.Tests.csproj" reference ".\src\$Name\$Name.csproj"
        dotnet add ".\src\$Name.Tests\$Name.Tests.csproj" package Microsoft.AspNetCore.App

        # Add .gitignore and .editorconfig
        try {
            Invoke-WebRequest -Uri "https://raw.githubusercontent.com/github/gitignore/master/VisualStudio.gitignore" -OutFile ".gitignore"
            Invoke-WebRequest -Uri "https://raw.githubusercontent.com/dotnet/runtime/master/.editorconfig" -OutFile ".editorconfig"
        } catch {
            Write-Host "Error downloading files `n$($_.Exception.Message) skiping" -ForegroundColor Yellow
        }

        # Build and Run the solution
        dotnet build ".\src\$Name.sln"
        dotnet run --project ".\src\$Name\$Name.csproj"
    }

    Set-Alias -Name newRestApi -Value New-RestAPI
}
