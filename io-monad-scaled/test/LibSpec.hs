{-# LANGUAGE OverloadedStrings #-}

module LibSpec where

import Test.Hspec
import Lib

spec :: Spec
spec = do

  describe "merge" $ do
    it "should join file contents with >>>" $ do
      shouldBe (merge ["file 1", "file 2", "file 3"])
        "file 1>>>\nfile 2>>>\nfile 3"

  describe "fetchFile" $ do
    it "should load a file" $ do
      file1 <- (fetchFile "files/data1.txt")
      shouldBe file1
        "File 1\n"

  describe "fetchFiles" $ do
    it "should load a list of files" $ do
      files <- (fetchFiles ["files/data1.txt", "files/data2.txt"])
      shouldBe files
        [ "File 1\n"
        , "File 2\n" ]
