# GA-Jump
One-click access to jumpserver requiring Google Authenticator


### 1 Find a way to obtain your own Google Authenticator secret

### 2 Fill in the information for the jump server to ssh-jump.sh
 - port
 - host
 - user
 - passwor
 - secret
 
 
 ### 3 Install except
 ```
Linux CentOS：yum install expect
Linux Ubuntu：apt install expect
Mac：brew install expect
 ```


### 4 Configure to environment variables
```
chmod 777 ssh-jump.sh 
```
write to bashrc.sh or zshrc.sh  
```
alias ssh-jump="/filepath/ssh-jump.sh"
```


### Use it
terminal:
```
ssh-jump
```
