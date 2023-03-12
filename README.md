
<a name="readme-top"></a>

![Rails](https://img.shields.io/badge/rails-%23CC0000.svg?style=for-the-badge&logo=ruby-on-rails&logoColor=white) ![](https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white) ![Postgres](https://img.shields.io/badge/postgres-%23316192.svg?style=for-the-badge&logo=postgresql&logoColor=white) ![](https://img.shields.io/badge/RuboCop-000000.svg?style=for-the-badge&logo=RuboCop&logoColor=white)

<div align="center">
  <h3><b>Real-Time Search Box</b></h3>
</div>

<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
  - [🚀 Live Demo](#live-demo)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [Usage](#usage)
  - [Run tests](#run-tests)
  - [Deployment](#triangular_flag_on_post-deployment)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [❓ FAQ (OPTIONAL)](#faq)
- [📝 License](#license)

<!-- PROJECT DESCRIPTION -->

# 📖 Real-time Search Box <a name="about-project"></a>

**Real-Time Search Box** is an app that enables This app enables users to search for articles in real-time and provides analytics on their search queries.

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
  <summary>Client</summary>
  <ul>
    <li><a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript">JavaScript</a></li>
    <li><a href="https://guides.rubyonrails.org/layouts_and_rendering.html">Embedded RuBy</a></li>
  </ul>
</details>

<details>
  <summary>Server</summary>
  <ul>
    <li><a href="https://rubyonrails.org/">Ruby on Rails</a></li>
  </ul>
</details>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

<!-- Features -->

### Key Features <a name="key-features"></a>

- Search for articles and view results as you type
- Automatically save search history
- Access previous searches on the Latest Search page

#### Steps I followed to build this app 

The user interface for the search box and search results was designed using erb and JavaScript. JavaScript was chosen because it's difficult to listen to user typing with only erb. By utilizing JavaScript events, the search function can respond immediately to user input. When a search query matches an article, the corresponding article is immediately displayed. In cases where the user stops typing for more than 5 seconds, the search query is recorded and sent to the backend for processing.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LIVE DEMO -->

## 🚀 Live Demo <a name="live-demo"></a>

- [Live Demo Link](https://shielded-taiga-31074.herokuapp.com/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

- Ruby version: 3.2.1
- Ruby on Rails version: 7.0.3.1

### Setup

Clone this repository to your desired folder:

```sh
  cd my-folder
  git clone https://github.com/medaminedev66/real-time-search-box.git
  cd real-time-search-box
```


### Install

Install this project with:

```sh
bundle install

# create migrations with activerecord
rails db:migrate

# if you would like to use seed data
rails db:seed
```

### Usage

To run the project, execute the following command:

```sh
# start server
rails s
```
RoR uses port 3000 by default
### Run tests

To run tests, run the following command:

```sh
# run tests with
rspec spec
```

### Deployment

Heroku has been used to deploy this project. You can use it as well or use other alternatives such as Render, Fly...

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

## 👤 Author <a name="authors"></a>

**Amine Smahi**

- GitHub: [@medaminedev66](https://github.com/medaminedev66)
- Twitter: [@medaminesmahi](https://twitter.com/medaminesmahi)
- LinkedIn: [Amine Smahi](https://www.linkedin.com/in/md-amine-smahi/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

- [ ] **Add sessions using Devise to record searches for each user.**
- [ ] **Create a backend algorithm that searches for articles and displays them on another page.**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

Give a ⭐️ if you like this project!

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

I would like to thank ChatGpt, StackOver flow community for the help and support.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FAQ (optional) -->

## ❓ FAQ (OPTIONAL) <a name="faq"></a>

- **Why are the rspec tests failing?**

  - I'm using to gems that help me to write and run tests `capybara` and `selenium`. Selenium works with an operating sytstem tha


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
