# Movie Recommender Web App

<img width="901" alt="Captura de pantalla 2023-11-13 a las 23 26 35" src="https://github.com/ADS-2023-TH3/falcon_ml/assets/114001733/bd2aabd3-4160-48bd-b656-ee3fb1f1e4b6">


Welcome to our Movie Recommender Web App! This web application allows users to input a movie title and receive personalized movie recommendations based on our advanced recommendation algorithm. It's powered by cutting-edge data science techniques, making your movie-watching experience even better!

## Features

- **User-Friendly Interface:** Simple and intuitive interface for easy navigation.
- **Personalized Recommendations:** Get tailored movie suggestions based on your input.
- **Data-Driven Recommendations:** Powered by our powerful data science model, ensuring high-quality suggestions.
- **Quick and Responsive:** Fast processing to provide instant recommendations.

## How to Use

1. **Input Movie Title:** Enter the title of a movie you like into the input field.
2. **Receive Recommendations:** Instantly get a list of top movie recommendations based on your input.

## Tech Stack

- **Backend:** Python, Streamlit 
- **Frontend:** HTML, CSS, JavaScript 
- **Data Science:** Pytorch, Scikit-learn, Pandas 

## Setup Instructions

1. Download the [Dockerfile](https://github.com/ADS-2023-TH3/falcon_ml/blob/main/Dockerfile). Or clone the repository:

```
git clone https://github.com/ADS-2023-TH3/falcon_ml.git && cd falcon_ml
```

2. Build the Docker image:

```
docker build --no-cache -t falcon-deploy .
```

3. Run the Docker image at port 8501:

```
docker run --rm -p 8501:8501 --name falcon-deploy falcon-deploy
```

4. Open the web app in your browser: [http://localhost:8501](http://localhost:8501)

## Contributing

We welcome contributions from the community! If you find any issues or have suggestions for improvements, feel free to open an issue or create a pull request.

## License

This project is licensed under the [MIT License](LICENSE.md) - see the [LICENSE.md](LICENSE.md) file for details.

