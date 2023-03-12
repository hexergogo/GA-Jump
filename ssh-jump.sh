#!/usr/bin/expect -f


set ENV [lindex $argv 0]
set PORT 22
set HOST "jumpserver host"
set GOOGLE_SECRET "xxxx"

# If you have multiple environments, you can try modifying this section. 
if {"${ENV}" == "online"} {
    set PORT 22
    set HOST "jumpserver host"
    set GOOGLE_SECRET "xxxx"
}

set USER "username"
set PASSWORD "password"




# python3 
# If you have a Python environment on your computer, please use this method.
# google_mfa.py absolute file path for self-modification.
# set MFA [ exec python {/Absolute path/google_mfa.py} ${GOOGLE_SECRET}]    

#### or

# Executable file
# download file
# set MFA [ exec {/Absolute path/google_mfa} ${GOOGLE_SECRET}]   
 

# modify xxx.xxx.com to your jumpserver address
spawn -noecho ssh -o HostKeyAlgorithms=+ssh-rsa -o PubkeyAcceptedKeyTypes=+ssh-rsa ${USER}@${HOST} -p ${PORT}

expect {
    "password" { send "${PASSWORD}\n" }
}

expect {
    "OTP"  { send ${MFA}\n }
    "MFA"  { send ${MFA}\n }
}

interact
