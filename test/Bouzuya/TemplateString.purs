module Test.Bouzuya.TemplateString
  ( tests
  ) where

import Prelude

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
          -- baz is nothing
          ]
    Assert.equal
      "FOOBAR"
      (TemplateString.template "{{foo}}{{bar}}{{baz}}" obj1)
    let
      obj2 =
        Object.fromFoldable
          [ Tuple "foo" "{{bar}}"
          , Tuple "bar" "{{foo}}"
          ]
    Assert.equal
      "{{bar}}{{foo}}"
      (TemplateString.template "{{foo}}{{bar}}" obj2)
    let
      obj3 =
        Object.fromFoldable
          [ Tuple "foo-bar" "FOO-BAR"
          , Tuple "a_b" "A_B"
          ]
    Assert.equal
      "FOO-BAR:A_B"
      (TemplateString.template "{{foo-bar}}:{{a_b}}" obj3)
