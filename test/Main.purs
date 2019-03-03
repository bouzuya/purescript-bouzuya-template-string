module Test.Main
  ( main
  ) where

import Prelude

import Effect (Effect)
import Test.Bouzuya.TemplateString as TemplateString
import Test.Unit.Main as TestUnitMain

main :: Effect Unit
main = TestUnitMain.runTest do
  TemplateString.tests
