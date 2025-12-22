# Load the JSON data from the file
$jsonData = Get-Content -Path "projects.json" | ConvertFrom-Json

# Create an array to hold the selected project information
$projectInfo = @()

# Iterate through each project and select the desired properties
foreach ($project in $jsonData) {
    $projectInfo += [PSCustomObject]@{
        ProjectTag    = $project.projectTag
        Environment   = $project.environment
        CreationDate  = $project.createdTerraformDate
    }
}

# Sort the project information by CreationDate and display it in a table format
$projectInfo | Sort-Object CreationDate | Format-Table -AutoSize