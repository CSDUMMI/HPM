module HPM.View
  (
    view
  ) where

-- Base Modules
import Data.List
import qualified System.Directory as Directory
-- Own Modules
import Config.HPMN (delimnatorHPMN)

--Too many ifs I know
view :: [String] -> IO ()
view (root) =
         do
           -- Find archivar
           if Directory.doesFileExist $ root ++ ".hpm/archiver"
              then putStr $ readFile $ root ++ ".hpm/archiver"
              else putStrLn " Checked: No Libaries installed here "

           -- Display Project File (Project.hpm)
           if Directory.doesFileExist $ root ++ "/Project.hpm"
              then mapM_ putStrLn $ lines $ readFile $ root ++ "Project.hpm"
              else putStrLn " Checked: No Project File avaible "
