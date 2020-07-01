## Write pseudocode for the following

**a method that returns the sum of two integers**

```
START

GET number_1
GET number_2

IF number_1 AND number_2 are valid numbers
  SET total = add number_1 and number_2

PRINT total

END
```

**a method that takes an array of strings, and returns a string that is all those strings concatenated together**

```
START

SET array = list of strings
SET concatenated_strings

IF array is empty
  RETURN nil
ELSE
  concatenated_strings = all elements in the array merged

PRINT concatenated_strings
END
```

**a method that takes an array of integers, and returns a new array with every other element**

```
START

SET integer_array = list of integers
SET new_array = []
SET iterator = 1

IF integer_array is empty
  RETURN nil
ELSE
  WHILE iterator <= length of integer_array
    IF iterator == 1
      append current iteration value to new_array
    ELSE
      SET next_value = current iteration position plus 1
      IF next_value == nil
        BREAK
      ELSE
        append next_value to new_array

    iterator = iterator + 1

PRINT new_array

END
```