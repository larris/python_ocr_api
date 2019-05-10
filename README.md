## Python OCR Docker


### Get the repo from GitHub
```
git clone https://github.com/larris/python_ocr_api.git
```

#### Build the Docker image:
From the python_ocr_api folder, do:
```docker build --rm -t docker-ocr .```

#### Run either the  App:
```docker run -p 80:5000 docker-ocr```

### Usage
Download a REST Client either insomnia
```https://insomnia.rest```
or postman
```https://www.getpostman.com```

and point to ```localhost/ocr```.
Add the JSON parameters
```
{
	"image_url" : "<IMAGE URL>",
	"lang" :  "ell"
}
```
If the lang parameter is not specified it will only convert english ocr.
Example urls ar on /test forder