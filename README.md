This repository is complementary to a blog post about NS delegation and using
wildcards/asterisk in Route53 subdomains. The post is available here:

- https://pabis.eu/blog/2024-04-03-Multi-Account-Environment-DNS.html
- https://dev.to/aws-builders/multi-accountenvironment-dns-zones-24gd

The main premise of this project is that you can set single record in Route53
in the format of `*.myservice.mydomain.com` and control every subdomain
resulting of such wildcard matching. So instead of creating DNS record for each
service, you can just control HTTP Host header in Application Load Balancer.