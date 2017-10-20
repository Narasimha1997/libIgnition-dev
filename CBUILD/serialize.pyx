import json
from flask import jsonify
from threading import Thread
from cryptography.fernet import Fernet

class Engine():

    def deserialize(self,file_name, key):
        with open(file_name+'__enc', 'rb') as rb:
            byte_stream = rb.read()
        f = Fernet(bytes(key.encode('utf-8')))
        free_stream = f.decrypt(token=byte_stream)
        with open(file_name+'1', 'wb') as wb:
            wb.write(free_stream)


    def serialize(self,filename):
        with open(filename, 'rb') as reader:
            byte_stream = reader.read()
        key = Fernet.generate_key()
        f = Fernet(key)
        data__ = f.encrypt(byte_stream)
        with open(filename+'__enc','wb') as wb:
            wb.write(data__)
        return (str(key.decode('utf-8')))

    def encr_text(self,text):
        key =Fernet.generate_key()
        f = Fernet(key)
        text_ = f.encrypt(data = bytes(text.encode(encoding = 'utf-8')))
        return (str(text_.decode('utf-8')), str(key.decode('utf-8')))

    def decr_text(self,text, key):
        f = Fernet(bytes(key.encode('utf-8')))
        text_ = f.decrypt(bytes(text.encode('utf-8')))
        return str(text_.decode('utf-8'))

    def master(self,dict__):
        f_name = dict__['fname']
        if dict__['mode']=='decr':
            key = dict__['key']
            self.deserialize(file_name=f_name, key=key)
            return b'Succ'
        else:
            return self.serialize(filename=f_name)
