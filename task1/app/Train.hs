module Train where

import Data.Time

data Train = Train {
    destination :: String,
    numberOfTrain :: Int,
    departureTime :: UTCTime
} deriving Show

-- |This function is to sort trains by their number.
sortTrains :: [Train] -> [Train]
sortTrains [] = []
sortTrains (x:xs) = sortTrains [a | a <- xs, numberOfTrain a < numberOfTrain x]
                                ++ [x] ++
                    sortTrains [b | b <- xs, numberOfTrain b >= numberOfTrain x]

-- |This function is to sort trains by destination place, if the destinations are equal, then by arrival time.
sortTrainsOnDest :: [Train] -> [Train]
sortTrainsOnDest [] = []
sortTrainsOnDest (x:xs) = sortTrainsOnDest [a | a <- xs, (destination a < destination x) ??? (departureTime a < departureTime x)]
                                            ++ [x] ++
                          sortTrainsOnDest [b | b <- xs, (destination b >= destination x) ??? (departureTime b >= departureTime x)]
                          where 
                            (???) false _ = false

showTrain :: Train -> String
showTrain train = "Train #" ++ show (numberOfTrain train) ++ " in: " ++ 
                  destination train ++ ", at time: " ++ show (departureTime train)