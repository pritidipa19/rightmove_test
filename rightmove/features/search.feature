Feature: As a Property searcher i should be able to search a property from the rightmove home page

  Scenario: searching property in a valid city
    Given i am on rightmove home page
    And i seacrh for "london"
    When i click the buy button
    Then i should be on the additional option page
    And i search for "Within ¼ mile"
    When i click the find properties button
    Then i should be on the result page
    And I close the browser

  Scenario Outline: search property in a city with multiple criteria
    Given i am on rightmove home page
    Given i search for "<bedrooms>" bedroom "<property_type>" in "<city>" "<radius>" between "<min>" and "<max>" price range
    When i click the find properties button
    Then i should be on the result page
    And I close the browser
    Examples:
      | bedrooms | property_type | city   | radius        | min     | max     |
      | 2        | Houses        | london | Within 1 mile | 100,000 | 400,000 |
      | 3         | Bungalows     | ilford | Within 3 miles | 50,000  |700,000  |
      | 4         | Houses        | london | Within 1 mile| 600,000  |800,000  |


  Scenario: register in rightmove pages
  Given i am on rightmove home page
  And i click on a link with id "sign-in"
  Then  i should see "Create Account"case sensitive message in the browser



