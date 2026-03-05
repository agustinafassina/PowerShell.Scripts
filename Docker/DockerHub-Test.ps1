$env:DOCKERHUB_USERNAME = ""
$env:DOCKERHUB_TOKEN = "replace_with_your_token"

docker login -u $env:DOCKERHUB_USERNAME -p $env:DOCKERHUB_TOKEN

docker pull hello-world