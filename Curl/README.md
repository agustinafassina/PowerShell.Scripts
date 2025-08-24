# Curl scripts
Curl (Client URL) is a command-line tool used to transfer data to or from a web server. It is very useful for making HTTP, HTTPS, FTP, and other protocol requests. With curl, you can download files, submit form data, fetch information from APIs, test web services, and more.

## Scripts detail
1. Get the content of a web page:
2. Download a file and save it with a specific name:
3. Send data in a POST request (e.g., login form):
```
curl -X POST -d "user=name&password=1234" http://example.com/login
```

4. Make a GET request to an API and display the response in JSON format:
```
curl -H "Accept: application/json" http://api.example.com/data
```

5.Send a PUT request with data from a file:
```
curl -X PUT -d "@data.json" http://api.example.com/update
```

6.Perform a request with Basic Authentication:
```
curl -u user:password http://example.com/private
```