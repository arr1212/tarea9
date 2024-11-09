Feature: Ingreso a la página de la Obra Social

  Scenario: Ingreso exitoso a la página de la Obra Social
    Given cuando el usuario entra a esta pagina de login "https://cs.uns.edu.ar/~mll/temp/testing/examen/login.html"
    When el usuario ingresa "dumbridge" en el campo "username"
    And el usuario ingresa "tomriddle" en el campo "password"
    And el usuario hace click en el botón "Ingresar"
    Then debería redireccionar a la pagina "https://cs.uns.edu.ar/~mll/temp/testing/examen/inicio.html"
    And Verificar que la página nueva contenga el texto esperado "Bienvenido a OSTH On-Line"

Scenario: Ingreso usuario no valido a la pagina de la Obra Social
    Given cuando el usuario entra a esta pagina de login "https://cs.uns.edu.ar/~mll/temp/testing/examen/login.html"
    When el usuario ingresa "harrypoter" en el campo "username" 
    And el usuario ingresa "tomriddle" en el campo "password" 
    And el usuario hace click en el botón "Ingresar"
    Then debería ver el mensaje "Atención: El usuario ingresado no existe"

Scenario: Ingreso usuario vacío a la pagina de la Obra Social
    Given cuando el usuario entra a esta pagina de login "https://cs.uns.edu.ar/~mll/temp/testing/examen/login.html"
    When el usuario ingresa vacío en el campo "username" 
    And el usuario ingresa "tomriddle" en el campo "password" 
    And el usuario hace click en el botón "Ingresar"
    Then debería ver el mensaje "Atención: Debe ingresar un nombre de usuario"

Scenario: Ingreso password vacío a la pagina de la Obra Social
    Given cuando el usuario entra a esta pagina de login "https://cs.uns.edu.ar/~mll/temp/testing/examen/login.html"
    When el usuario ingresa vacío en el campo "password"
    And el usuario ingresa "dumbridge" en el campo "username" 
    And el usuario hace click en el botón "Ingresar"
    Then debería ver el mensaje "Atención: El password no puede estar vació"

Scenario: Ingreso password equivocado a la pagina de la Obra Social
    Given cuando el usuario entra a esta pagina de login "https://cs.uns.edu.ar/~mll/temp/testing/examen/login.html"
    When el usuario ingresa "dumbridge" en el campo "username" 
    And el usuario ingresa "harrypoter" en el campo "password" 
    And el usuario hace click en el botón "Ingresar"
    Then debería ver el mensaje "Atención: debe ingresar una contraseña válida"


