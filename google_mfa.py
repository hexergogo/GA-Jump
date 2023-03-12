#!/usr/bin/env python

import hmac
import base64
import struct
import hashlib
import time
import sys


def get_hotp_token(secret, intervals_no):
    key = base64.b32decode(secret, True)
    msg = struct.pack(">Q", intervals_no)
    h = hmac.new(key, msg, hashlib.sha1).digest()
    # 加上chr字符串
    o = ord(chr(h[19])) & 15
    h = (struct.unpack(">I", h[o:o+4])[0] & 0x7fffffff) % 1000000
    return h


def get_totp_token(secret, bias):
    return get_hotp_token(secret, intervals_no=int(time.time()+bias)//30)


def get_google_code(secret):
    googlecode = get_totp_token(secret, 3)
    return '%06d' % googlecode


if __name__ == '__main__':
    secret = sys.argv[1]
    print(get_google_code(secret))
