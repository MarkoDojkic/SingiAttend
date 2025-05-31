#!/bin/bash

# Wait for Eureka to be available
echo "Waiting for Eureka on port 8761..."
until curl -s http://localhost:8761/eureka/apps > /dev/null; do
  sleep 3
done

echo "Eureka is up. Starting SingiAttend Proxy..."
exec java -jar /var/www/SingiAttend-Proxy-2.5.0.jar