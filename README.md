# NutriGemeas

O propósito deste app não é ser escalável, serão somente dois usuários gerenciando pacientes de um consultório de nutrição.
Caso fosse necessária a escalabilidade de código, no caso de ser utilizado por diversos consultórios, deve-se compartimentar utilizando a gem Apartment, por exemplo, já que foi projetada de certa forma que as nutris possam visualizar/editar/excluir qualquer paciente presente no app, independente se são responsáveis por ele ou não.

## Getting Started

Para clonar o app:
```
git clone https://github.com/TulioMagnus/nutrigemeas.git
```

### Prerequisites

```
Ruby -v = 2.6.5
Rails -v = 6.0.2.1
Nodejs -v = 12.16.1
Yarn -v = 1.22.4
```

### Installing

Esta aplicação utiliza upload de imagens com a gem 'carrierwave' que depende
do ImageMagick, para instalar vide: [ImageMagick](https://imagemagick.org/script/download.php)

Para iniciar a aplicação em ambiente de desenvolvimento:

Instale a gem 'Foreman'

```
gem install foreman
```

Rode o bundle para instalar as gems do projeto

```
bundle install
```
Rode no terminal:

```
foreman start -f Procfile.dev
```


## Running the tests

Os testes são realizados utilizando as gems RSpec e Capybara.

para rodar todos os testes, digite no terminal:
```
rspec
```

## Built With

* [Dropwizard](http://www.dropwizard.io/1.0.2/docs/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [ROME](https://rometools.github.io/rome/) - Used to generate RSS Feeds

## Authors

* **Túlio Magnus** - *Initial work* - [Github](https://github.com/TulioMagnus)

## License

Este projeto é de código aberto e possui licença MIT.

## Acknowledgments

* Hat tip to anyone whose code was used
* Inspiration
* etc

