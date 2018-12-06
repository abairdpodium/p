# p
install
-------
```
mkdir ~/bin
```
```
echo "export PATH=$PATH:~/bin" >> ~/.bash_profile
```

copy p file into bin directory

```
chmod +x ~/bin/p
```

configure
---------
```
p <command to assign> -c <command to execute>
```
example
```
p s -c "source .env && mix phx.server"
```

use
---
```
p <command to use>
```
example
```
p s
```
