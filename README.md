## Mobile dashboar coronavirus data indonesia
[![License](https://img.shields.io/badge/License-BSD%202--Clause-orange.svg)](https://opensource.org/licenses/BSD-2-Clause)

Dibuat Dengam : 
- Flutter Version : `Flutter 2.2.3 • channel stable` Null Safety
- VS Code
## Halaman Dashboard
UI HashData & HasError from internet

<img src="assets/readme/has_data.jpg" width="260px"> <img src="assets/readme/has_error.jpg" width="260px">
## API Spec

GET Data Indonesia :
- Method : GET
- Endpoint : `https://api.kawalcorona.com/indonesia`
- Response :
    ```json
    [
        {
            "name" : "String",
            "positif" : "String",
            "sembuh" : "String",
            "meninggal" : "Stringr",
            "dirawat" : "String"
        }
    ]

## Happy Coding &#x1F4AA; 