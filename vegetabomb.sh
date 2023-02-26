#!/bin/bash

for i in {1..20000}
do
    curl -s -X POST -H "Content-Type: application/json" \
        -d '{"product": {"name": "Product '$i'", "price": "'$i'00", "brand": "Brand '$i'"}}' \
        http://localhost:80/api/v1/products | jq -r '.id' >> product_ids.txt
    sleep 5 # Add a 5-second delay between each request
done

# Get product IDs from file
product_ids=($(cat product_ids.txt))

# Loop through products and update/delete
for (( i=0; i<${#product_ids[@]}; i++ )); do
  # Update every other product
  if (( i % 2 == 0 )); then
    product_id=${product_ids[$i]}
    echo "Updating product $product_id"
    curl -s -X PUT -H "Content-Type: application/json" \
      -d '{"product": {"name": "Updated product", "price": "999", "brand": "Updated brand"}}' \
      http://localhost:80/api/v1/products/$product_id
    sleep 5 # Add a 5-second delay between each request
  # Delete the other products
  else
    product_id=${product_ids[$i]}
    echo "Deleting product $product_id"
    curl -s -X DELETE http://localhost:80/api/v1/products/$product_id
    sleep 5 # Add a 5-second delay between each request
  fi
done

# Clean up
rm product_ids.txt
