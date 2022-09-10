<!-- Improved compatibility of back to top link: See: https://github.com/othneildrew/Best-README-Template/pull/73 -->

<a name="readme-top"></a>

<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Don't forget to give the project a star!
*** Thanks again! Now go create something AMAZING! :D
-->

<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/CypherZox/ClistApp">
    <img src="https://github.com/CypherZox/ClistApp/blob/master/appstore.png" alt="Logo" width="80" height="80">
  </a>

<h3 align="center">ClistApp</h3>

  <p align="center">
    project_description
    <br />
    <!-- <a href="https://github.com/CypherZox/ClistApp"><strong>Explore the docs »</strong></a> -->
    <br />
    <br />
    <!-- <a href="https://github.com/CypherZox/ClistApp">View Demo</a> -->
    <!-- · -->
    <a href="https://github.com/CypherZox/ClistApp/issues">Report Bug</a>
    ·
    <a href="https://github.com/CypherZox/ClistApp/issues">Request Feature</a>
  </p>
</div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#Code Architecture">Code Architecture</a></li>
    <li><a href="#Screenshots">Screenshots</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->

## About The Project

<img src="https://play-lh.googleusercontent.com/d91JkGzJWYNnyMBZlArlMHpba6KOUKdaR1bIksAHkm-U8eAVmM7asEoS891n1IZEXkUd=w480-h960-rw" width="150" class="center">

<!-- [![Product Name Screen Shot][product-screenshot]](https://example.com) -->

With this app you’ll be able to view the upcoming events, so you can get prepared ahead of time, you can add the events on your calendar and view the competition web page for more details.
This app was developed using the API from: [https://clist.by/](https://clist.by/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Built With

<p><a href="https://flutter.dev/"> <img src="https://avatars.githubusercontent.com/u/14101776?s=200&v=4" width="50" ></a> Flutter</p>

<!-- - [![Flutter][flutter-logo]][flutter-url] -->

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## Getting Started

The app is available for installation on Google play

### Prerequisites

To run the code you have to install Flutter on your device with the following links:

- [macOS][flutter-for-mac]
- [Windows][flutter-for-windows]
- [Linux][flutter-for-linux]

To run the app:

```sh
  flutter pub get
```

```sh
  flutter packages pub run build_runner build --delete-conflicting-outputs
```

```sh
  flutter run
```

You can download the app from google play here:
<a href="https://play.google.com/store/apps/details?id=com.hanafedeil.clist.by"> <img src="https://cdn.freebiesupply.com/logos/large/2x/google-play-badge-logo-png-transparent.png" width="80" ></a>

### Installation

You can download the app from google play here:
<a href="https://play.google.com/store/apps/details?id=com.hanafedeil.clist.by"> <img src="https://cdn.freebiesupply.com/logos/large/2x/google-play-badge-logo-png-transparent.png" width="80" ></a>

<!-- USAGE EXAMPLES -->

## Code Architecture

- Clean Architecture.
- TDD with [Mockito](https://pub.dev/packages/mockito).
- Dependecy injection (with [get it](https://pub.dev/packages/get_it) and [build runner](https://pub.dev/packages/build_runner)).
- Statem management with [BLoC](https://bloclibrary.dev/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ROADMAP -->

## Screenshots

- <img src="https://play-lh.googleusercontent.com/ntFr1_5VOsIZ4LP0jRLVpVIhaRgk2oPcSbv8fjTZ5sq8ttb0-3VATZxYl9KD230eWNA=w5120-h2880-rw" width="250">

- <img src="https://play-lh.googleusercontent.com/dJ2hpjCzOBUVDrlY3744I4TCIMfRA3YU9QWW7iWp94zZd995L_j3ctEvKrT9FDfN9Ms=w5120-h2880-rw" width="250">

See the [open issues](https://github.com/CypherZox/ClistApp/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTACT -->

## Contact

Hana Fedeil - [@CypherZox\_](https://twitter.com/CypherZox_) - hanafedeil@gmail.com

LinkedIn - [![LinkedIn][linkedin-shield]][linkedin-url]

Project Link: [https://github.com/CypherZox/ClistApp](https://github.com/CypherZox/ClistApp)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGMENTS -->

## Acknowledgments

- [Check out the Clean Architecture! ](https://www.youtube.com/watch?v=3681ZYbDSSk&t=4984s)
- [Flutter TDD and Clean Architecture course (a little outdated)](https://www.youtube.com/watch?v=KjE2IDphA_U&list=PLB6lc7nQ1n4iYGE_khpXRdJkJEp9WOech)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

<!-- https://github.com/CypherZox/ClistApp -->

[contributors-shield]: https://img.shields.io/github/contributors/CypherZox/ClistApp.svg?style=for-the-badge
[contributors-url]: https://github.com/CypherZox/ClistApp/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/CypherZox/ClistApp.svg?style=for-the-badge
[forks-url]: https://github.com/CypherZox/ClistApp/network/members
[stars-shield]: https://img.shields.io/github/stars/CypherZox/ClistApp.svg?style=for-the-badge
[stars-url]: https://github.com/CypherZox/ClistApp/stargazers
[issues-shield]: https://img.shields.io/github/issues/CypherZox/ClistApp.svg?style=for-the-badge
[issues-url]: https://github.com/CypherZox/ClistApp/issues
[license-shield]: https://img.shields.io/github/license/othneildrew/Best-README-Template.svg?style=for-the-badge
[license-url]: https://github.com/CypherZox/flutter_image_editor/blob/master/LICENSE
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/hana-fedeil-0xCypherZox
[product-screenshot]: https://play-lh.googleusercontent.com/d91JkGzJWYNnyMBZlArlMHpba6KOUKdaR1bIksAHkm-U8eAVmM7asEoS891n1IZEXkUd=w480-h960-rw
[flutter-logo]: https://avatars.githubusercontent.com/u/14101776?s=200&v=4
[flutter-url]: https://flutter.dev/
[get-it-on-gp-image]: https://cdn.freebiesupply.com/logos/large/2x/google-play-badge-logo-png-transparent.png
[flutter-for-mac]: https://docs.flutter.dev/get-started/install/macos
[flutter-for-windows]: https://docs.flutter.dev/get-started/install/windows
[flutter-for-linux]: https://docs.flutter.dev/get-started/install/linux
[chainlink-faucet]: https://faucets.chain.link/
[stacked-flutter]: https://pub.dev/packages/stacked
[get-it-url]: https://pub.dev/packages/get_it
[build_runner_url]: https://pub.dev/packages/build_runner
[scrnsht-1]: https://play-lh.googleusercontent.com/ntFr1_5VOsIZ4LP0jRLVpVIhaRgk2oPcSbv8fjTZ5sq8ttb0-3VATZxYl9KD230eWNA=w5120-h2880-rw
[scrnsht-2]: https://play-lh.googleusercontent.com/dJ2hpjCzOBUVDrlY3744I4TCIMfRA3YU9QWW7iWp94zZd995L_j3ctEvKrT9FDfN9Ms=w5120-h2880-rw
