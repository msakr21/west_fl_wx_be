<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/Consultancy-2208">
    <img src="lib/assets/consultancy.jpeg" alt="Logo" width="200" height="200">
  </a>

  <h1 align="center">West FL WX</h3>

  <h3 align="center">
    Get the info you need in severe weather!
    <br />
  </h3>
</div>

<!-- TABLE OF CONTENTS -->
<h3>
  <details>
    <summary>Table of Contents</summary>
    <ol>
      <li>
        <a href="#about-the-project">About The Project</a>
        <ul>
          <li><a href="#built-with">Built With</a></li>
          <li><a href="#database-schema">Database Schema</a></li>
        </ul>
      </li>
      <li>
        <a href="#getting-started">Getting Started</a>
        <ul>
            <li><a href="#repositories">Repositories</a></li>
            <li><a href="#back-end-repository-installation">Back-End Repository Installation</a></li>
            <li><a href="#endpoints">Endpoints</a></li>
        </ul>
      </li>
      <li><a href="#roadmap">Roadmap</a></li>
      <li><a href="#contact">Contact</a></li>
      <li><a href="#acknowledgments">Acknowledgments</li>
      <li><a href="#license">License</a></li></a>
    </ol>
  </details>
</h3>

<!-- ABOUT THE PROJECT -->
## About The Project

![Product Demo](lib/assets/demo.gif)

Getting reliable information in an emergency is critical to your safety. West FL WX is a service that seeks to collect the most up-to-date weather forecast, road conditions, and emergency information from your local leaders. This information will be sent to you via e-mail so it can be saved on your local device in the event of power or internet outages. This will ensure you always have the information you need in an emergency.

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- Built With -->
### Built With

West FL WX is a Rails web application and e-mail service.

<img src="lib/assets/tech-stack.png" alt="Tech-Stack">

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- Database Schema -->
### Database Schema

The West FL WX application utilizes a one-to-many relationship to organize the user's essential areas of preparation.

<img src="lib/assets/database-schema.png" alt="Database-Schema">

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- GETTING STARTED -->
## Getting Started

West FL WX is deployed on Heroku utilizing two applications. The front-end application allows the user to login using Google OAuth, interact with the interface, and holds the database of user information. The back-end application handles the mailer and API calls.

<!-- Repositories -->
### Repositories

* <b>Front-End:</b> https://github.com/msakr21/west_fl_wx_fe <br />
* <b>Back-End:</b> https://github.com/msakr21/west_fl_wx_be <br />

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- Back-End Repository Installation -->
### Back-End Repository Installation
<b>Gem Installation</b>
* `bundle install`
* `bundle exec figaro install`

<b>Required API keys</b>: 
* Sign up for a <a href="https://developer.twitter.com/en/docs/authentication/oauth-2-0/bearer-tokens">Twitter bearer token</a> and set `twitter_bearer_token: <your_token>` in `application.yml` 
* Sign up for a <a href="https://docs.sendgrid.com/">SendGrid API key</a> and set `SENDGRID_API_KEY: <your_key>` in `application.yml` 

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- Endpoints -->
### Endpoints

The back-end application ties all functionality into a single endpoint request. To access, send a `POST` request to `/alert_mailer` with params consisting of a name and email.

<b>An example request would be:</b>

`localhost:3000/api/v1/alert_mailer?email=<your_email>&name=<your_name>`

<b>An example response would be:</b>

 `{ data: 'No Current Alerts' }` or `{ data: 'Current Alerts in Your Area' }`
 
The user would also be sent an email consisting of current NWS alerts of severe or higher and tweets from relevant local government agencies regarding road closures and other emergency events.

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- ROADMAP -->
## Roadmap

MVP
* [x] Implement API call to NWS API for Weather Alerts
* [x] Implement API call to Twitter for #BeReadyEscambia and #fl511_panhandl 
* [x] Set up SendGrid for use with mailer functionality
* [x] Implement mailer functionality
* [x] Add aggregated data from NWS and Twitter API calls to the mailer functionality
* [x] Set up single end-point for FE to make a request
* [x] Deploy to Heroku

Stretch Goals
* [ ] Google Maps call for traffic
* [ ] Background Workers to run check for NWS API call
* [ ] Background Workers to follow up with Twitter call and mail sending based on NWS check.

See the [open issues](https://github.com/Consultancy-2208/west_fl_wx_be/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- CONTACT -->
## Contact

<table>
  <tr>
    <td><img src="https://avatars.githubusercontent.com/u/89422302?v=4" width='150'></td>
    <td><img src="https://avatars.githubusercontent.com/u/101418582?s=150&v=4"></td>
    <td><img src="https://avatars.githubusercontent.com/u/104859844?s=150&v=4"></td>
    <td><img src="https://avatars.githubusercontent.com/u/108031077?s=150&v=4"></td>
    <td><img src="https://avatars.githubusercontent.com/u/110377741?s=150&v=4" width='150'></td>
  </tr>
  <tr>
    <td>Alex Mora</td>
    <td>Bryan Keener</td>
    <td>Eli Fuchsman</td>
    <td>Joseph Hilby</td>
    <td>Mostafa Sakr</td>
  </tr>
  <tr>
    <td>
      <a href="https://github.com/AlexMR-93">GitHub</a><br>
      <a href="https://www.linkedin.com/in/alex-m-b25902240/">LinkedIn</a>
    </td>
    <td>
      <a href="https://github.com/bkeener7">GitHub</a><br>
      <a href="https://www.linkedin.com/in/bkeener/">LinkedIn</a>
    </td>
    <td>
      <a href="https://github.com/efuchsman">GitHub</a><br>
      <a href="https://www.linkedin.com/in/elifuchsman/">LinkedIn</a>
    </td>
    <td>
      <a href="https://github.com/josephhilby">GitHub</a><br>
      <a href="https://www.linkedin.com/in/josephmhilby/">LinkedIn</a>
    </td>
    <td>
      <a href="https://github.com/msakr21">GitHub</a><br>
      <a href="https://www.linkedin.com/in/mostafa-sakr-4bb722250">LinkedIn</a>
    </td>
  </tr>
</table>

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

Turing School of Software Design: [https://turing.edu/](https://turing.edu/)

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- LICENSE -->
## License

Distributed under the MIT License.

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/Consultancy-2208/west_fl_wx_be.svg?style=for-the-badge
[contributors-url]: https://github.com/Consultancy-2208/west_fl_wx_be/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/Consultancy-2208/west_fl_wx_be.svg?style=for-the-badge
[forks-url]: https://github.com/Consultancy-2208/west_fl_wx_be/network/members
[stars-shield]: https://img.shields.io/github/stars/Consultancy-2208/west_fl_wx_be.svg?style=for-the-badge
[stars-url]: https://github.com/Consultancy-2208/west_fl_wx_be/stargazers
[issues-shield]: https://img.shields.io/github/issues/Consultancy-2208/west_fl_wx_be.svg?style=for-the-badge
[issues-url]: https://github.com/Consultancy-2208/west_fl_wx_be/issues
[license-shield]: https://img.shields.io/github/license/Consultancy-2208/west_fl_wx_be.svg?style=for-the-badge
[license-url]: https://github.com/Consultancy-2208/west_fl_wx_be/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/othneildrew
