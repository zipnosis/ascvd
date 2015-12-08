## ascvd

Library to calculate 10-year and lifetime risks for atherosclerotic cardiovascular disease (ASCVD) using the Pooled Cohort Equations and lifetime risk prediction tools. This is based on the 2013 ACC/AHA Guideline on the Assessment of Cardiovascular Risk and the 2013 ACC/AHA Guideline on the Treatment of Blood Cholesterol to Reduce Atherosclerotic Cardiovascular Risk in Adults.

### Usage

Add `ascvd` to your Gemfile:

```ruby
gem 'ascvd'
```

Use it in your code:


```ruby
> calculator = Ascvd.new(sex: 'F', age: 40, race: 'WH', cholesterol: 180, hdl: 90, systolic: 120, bptreatment: false, diabetes: false, smoker: false )
> calculator.lifetime_ascvd
0.27
> calculator.ten_year_ascvd
0.0015629745972137732
```

### Error handling

All values are required and checked for validity.  If one or more values are invalid, scores will return `nil`.  Validity can be checked with `.valid?`.  An array of error messages can be retrieved with `.errors`.

```ruby
> calculator = Ascvd.new(sex: 'X', age: 150, race: 'WH', cholesterol: 180, hdl: 90, systolic: 120, bptreatment: false, diabetes: false )
> calculator.ten_year_ascvd
nil
> calculator.valid?
false
> calculator.errors
["Sex must be one of [M, F]", "Age must be between 0 and 110.", "Smoker must be true or false."]
```


### Copyright

Copyright (c) 2015 Zipnosis, Inc. See LICENSE.txt for
further details.

