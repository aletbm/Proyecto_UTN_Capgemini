import time
import datetime

# Create class that acts as a countdown
now = str(datetime.datetime.now())
time.sleep(1)
print(
    datetime.datetime.now()
    - datetime.datetime.strptime(now, "%Y-%m-%d %H:%M:%S.%f")
)
