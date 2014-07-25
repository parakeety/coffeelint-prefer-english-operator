# coffeelint-prefer-english-operator
==================================

coffeelint-prefer-english-operator is a plugin of [coffeelint](http://www.coffeelint.org/). It checks for `==`, `!=`, `&&`, `||`. Some coding style such as [polarmobile](https://github.com/polarmobile/coffeescript-style-guide) prefers english style operators.

```
i is i #yes
i == i #no
```

## How to Install

1. add `"coffeelint-prefer-english-operator": "0.0.3"` as `devDependencies` in `package.json`
2. `npm install`

## How to Use

In your `coffeelint.json`, add

```
{
  #... other lint rules
  {
    "prefer_english_operator": {
      "module": "coffeelint-prefer-english-operator",
      "level": "error"
    }
  }
}
```

and run `coffeelint`
