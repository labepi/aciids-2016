# Readme file
## Code to aid the experiment reproducibility of ACIIDS 2016 paper

### Test on Apache Web Server
Perform test settings in the apache Web server:

  - Concurrent users number: 194;
  - Requests number: 200000;
  - Server host IP: 172.16.0.41 and;
  - Server port number: 80.

Perform command:
```sh
$ ab -c 194 -n 200000 http://172.16.0.41:80/
```