# coffeelint-prefer-english-operator
==================================

** [This custom rule has been merged into coffeelint](https://github.com/clutchski/coffeelint/commit/d028c4e6e4c652d7816e54b1d41849de53481368) ** 

coffeelint-prefer-english-operator is a plugin of [coffeelint](http://www.coffeelint.org/). It checks for `==`, `!=`, `&&`, `||`. Coding style such as [polarmobile](https://github.com/polarmobile/coffeescript-style-guide) prefers english style operators.

```
a is a #yes
a == a #no

a isnt a #yes
a != a #no

a and b #yes
a && b #no

a or b #yes
a || b #no

```

## How to Install

1. add `"coffeelint-prefer-english-operator": "0.1.0"` as `devDependencies` in `package.json`
2. `npm install`

## How to Use

In your `coffeelint.json`, add

```
{
  // other lint rules
  {
    "prefer_english_operator": {
      "module": "coffeelint-prefer-english-operator",
      "level": "error"
    }
  }
}
```

and run `coffeelint`.
