Feature: In order to buy or sale a property search results page should accessible

  Scenario Outline: to get a text from search page
  Given i am on rightmove home page
  Given i search for "<bedrooms>" bedroom "<property_type>" in "<city>" "<radius>" between "<min>" and "<max>" price range
  When i click the find properties button
#  Then i should get the text from the first property
    Then i should get the date from he property listed

    Examples:
      | bedrooms | property_type | city | radius | min | max |
      | 3 | Houses| london | Within 1 mile| 100,000 |400,000  |

