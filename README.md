# purescript-bouzuya-template-string

`Bouzuya.TemplateString` module

## Usage

```purescript
import Bouzuya.TemplateString as TemplateString
import Data.Tuple (Tuple(..))
import Foreign.Object as Object
import Test.Unit (TestSuite)
import Test.Unit as TestUnit
import Test.Unit.Assert as Assert

tests :: TestSuite
tests = TestUnit.suite "Bouzuya.TemplateString" do
  TestUnit.test "template" do
    let
      obj1 =
        Object.fromFoldable
          [ Tuple "foo" "FOO"
          , Tuple "bar" "BAR"
          ]
    Assert.equal "FOOBAR" (TemplateString.template "{{foo}}{{bar}}" obj1)
```

See: [`test/Bouzuya/TemplateString.purs`](test/Bouzuya/TemplateString.purs).

## Note

`packages.dhall`

```dhall
let additions = {=} //
      { bouzuya-template-string =
          mkPackage
          [ "arrays"
          , "either"
          , "foreign-object"
          , "maybe"
          , "partial"
          , "prelude"
          , "strings"
          ]
          "https://github.com/bouzuya/purescript-bouzuya-template-string.git"
          "v0.1.0"
      }
```

## How to build

```bash
npm install
```

## License

[MIT](LICENSE)

## Author

[bouzuya][user] &lt;[m@bouzuya.net][email]&gt; ([https://bouzuya.net/][url])

[user]: https://github.com/bouzuya
[email]: mailto:m@bouzuya.net
[url]: https://bouzuya.net/
