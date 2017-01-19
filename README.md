# dig-dug
Mass / Batch domain dig to .CSV bash script

### What does it do?
This performs a dig on a list of domains that you specify. As a result, it outputs the information (including domain, IP address(es), and nameservers) into a CSV file that is compatible with any CSV editor, such as OpenOffice Calc, Microsoft Excel, Google Docs, etc.

### How do I run it?
There are comments in the `dig-dug.sh` file, however here is the basic usage:

 1. Enter as many domains as you'd like in the 'domains' file. One domain per line.
 2. Run `./dig-dig.sh domains`.
 3. This should automatically output a file called `output.csv` that you can do what you wish with.
 
### Known Bugs?
If a domain resolves to multiple IP addresses (due to them using some sort of load balancer or round-robin DNS), then it may take some manual column/cell arrangement once you open the CSV file. But nothing to strenuous. This is very common on domains using CloudFlare.
