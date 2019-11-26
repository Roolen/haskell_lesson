module Main where

import Lib

newtype Client = Client {
    name :: String
} deriving Show

data Order = Order {
    idOrder :: Int,
    price :: Double,
    nameClient :: String
    }
    
parseChar :: String -> Int
parseChar c = case c of
                "0" -> 0
                "1" -> 1
                "2" -> 2

main :: IO ()
main = do print "Enter number of order..."
          input <- getLine
          print $ nameClient $ orders !! parseChar input
    where
        clients  = [Client{name = "Andrey"}, Client{name = "Sergey"}, Client{name = "Artem"}]
        orders = [Order{idOrder= 0, price = 45.0, nameClient = name (clients !! 1)},
                 Order{idOrder = 1, price = 90.0, nameClient = name (head clients)},
                 Order{idOrder = 2, price = 122.0, nameClient = name (clients !! 2)}]
