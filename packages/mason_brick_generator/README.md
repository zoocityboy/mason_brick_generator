
![Logo](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/th5xamgrr6se0x5ro4g6.png)

[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/)


# Mason Brick Generator

This project serves to simplify the creation of a Mason brick from existing code that can be executed, validated, etc. Mason Brick is a great tool, but unfortunately there are some fundamental problems that this project is trying to solve.

- Code validation / linters
- Mustache variables in path
- Updates in template vs. code testing


## Screenshots

![App Screenshot](https://via.placeholder.com/468x300?text=App+Screenshot+Here)


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
    
## Usage/Examples

Inicializace projektu

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
- Company 2


## Authors

- [@zoocityboy](https://www.github.com/zoocityboy)


## Documentation

[Documentation](https://linktodocumentation)


## Related

Here are some related projects

[Awesome README](https://github.com/matiassingers/awesome-readme)


## FAQ

#### Question 1

Answer 1

#### Question 2

Answer 2


## Roadmap

- Additional browser support

- Add more integrations

