
[![ZOOCITYBOY][mbg_header]][mbg_link]


[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/)


# Mason Brick Generator

This project serves to simplify the creation of a Mason brick from existing code that can be executed, validated, etc. Mason Brick is a great tool, but unfortunately there are some fundamental problems that this project is trying to solve.

- Code validation / linters
- Mustache variables in path
- Updates in template vs. code testing

## Features

- Build template
    - Convert live code to the template
    - Validate template with your set of linter rules
    - Write tests for templates
- Generate Brick from template
    - Path conditions
    - Import conditions    
    - Content replacement
- Yaml template configuration
    - Brick variables
    - Varibale types
    - line prefix, suffix                                              
- Template validation


## Installation

Install dart package

```bash
  dart pub global activate mason_brick_generator
```
    
## Usage

Project inicialization

```bash
# initialize project
mbg init
```

seznam dostupnych templates, ktere je mozne generovat do bricku

```bash
# list current templates
mbg list
```

Vygenerovani template

```bash
# Select template and generate brick
mbg generate
#
mbg generate -t nameOfTemplate
```


## Used By

This project is used by the following companies:

- EmebdIt
- AffilateBox
- Commis
- FiraMedia


## Authors

- [@zoocityboy](https://www.github.com/zoocityboy)


## Documentation

[Documentation](https://linktodocumentation)


## Related

Here are some related projects

[Mason](https://github.com/fangelov/mason)


## FAQ

#### Question 1

Answer 1

#### Question 2

Answer 2


## Roadmap

- Additional browser support

- Add more integrations

[![ZOOCITYBOY][mbg_icon]][mbg_link]
[![ZOOCITYBOY][logo_white]][zoocityboy_link_dark]
[![ZOOCITYBOY][logo_black]][zoocityboy_link_light]


[logo_black]: https://raw.githubusercontent.com/zoocityboy/zoo_brand/main/styles/README/zoocityboy_dark.png#gh-light-mode-only
[logo_white]: https://raw.githubusercontent.com/zoocityboy/zoo_brand/main/styles/README/zoocityboy_light.png#gh-dark-mode-only
[zoocityboy_link_dark]: https://github.com/zoocityboy#gh-dark-mode-only
[zoocityboy_link_light]: https://github.com/zoocityboy#gh-light-mode-only

[mbg_icon]: assets/mason_brick_generator_icon.png
[mbg_header]: assets/mason_brick_generator_header.png
[mbg_link]: https://github.com/zoocityboy/mason_brick_generator