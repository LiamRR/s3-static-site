# terraform-static-site
Simple S3 static site deployment with Terrafrom


![alt text](<Screenshot 2025-01-06 184623.png>)

Steps involved: -

1. Create a bucket with a 6 digit random string to ensure it's unique.
2. Set the bucket owner
3. MAke the bucket public accessible
4. Set ACL 
5. Upload all files within the html folder (index and error.html for now)
6. Set the website configuration.
