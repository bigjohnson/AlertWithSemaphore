# AlertWithSemaphore
A simple bash script that send one alert when a test fail and send another alert when the test success.
It use a semaphore so it send only a message when the condition changes, but dont't continue send it at every check.
Insert it on cron and forget it.
