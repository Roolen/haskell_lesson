module Main where

import Lib
import Train
import Data.Time

main :: IO ()
main = do print "Enter train of number... "
          number <- getLine
          print $ if (read number :: Int) `elem` [numberOfTrain t | t <- trains]
            then
            showTrain $ head [c | c <- trains, numberOfTrain c == (read number :: Int)]
            else "Don't is a train with this number!"

          --print $ take 3 (sortTrainsOnDest trains)
       where
         trains = [
             Train{destination = "Moscow", numberOfTrain = 3,
                   departureTime = UTCTime (fromGregorian 2020 1 21) (timeOfDayToTime $ TimeOfDay 4 35 00)}
             ,
             Train{destination = "New Yourk", numberOfTrain = 4,
                   departureTime = UTCTime (fromGregorian 2020 1 25) (timeOfDayToTime $ TimeOfDay 8 20 00)}
             ,
             Train{destination = "London", numberOfTrain = 1,
                   departureTime = UTCTime (fromGregorian 2020 1 28) (timeOfDayToTime $ TimeOfDay 20 15 00)}
                   ]
         sortedTrains = sortTrains trains