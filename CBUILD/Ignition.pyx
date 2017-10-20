from serialize import Engine

def call_encr_file():
    file_name = str(input('Enter input file: '))
    engine = Engine()
    key = engine.serialize(filename=file_name)
    with open('key.txt','w') as w:
        w.write(key)
        w.close()
    return

def call_decr_file():
    file_name = str(input('Enter input file: '))
    key = str(input('Enter key file: '))
    with open(key, 'r') as r:
        key_ = r.read()
    engine = Engine()
    engine.deserialize(file_name=file_name, key=key_)

def call_encr_text():
    text = str(input('Enter input text: '))
    engine = Engine()
    (text_,key)=engine.encr_text(text=text)
    with open('file_enc.txt','w') as w:
        w.write(text_)
        w.close()
    with open('key.txt', 'w') as w:
        w.write(key)
        w.close()

def call_decr_text():
    file_ = str(input('Enter enc file: '))
    key_ = str(input('Enter key file: '))
    with open(file_,'r') as r:
        data = r.read()
    with open(key_, 'r') as r:
        key = r.read()
    engine = Engine()
    plain_text=engine.decr_text(text=data, key=key)
    print(plain_text)

def main():
    print('By Narasimha Prasanna HN \n Email : narasimhaprasannahn@gmail.com')
    print("\n </>\n1.Encrpyt file \n2.Decrypt file\n3.Encrpyt Text\n4.Decrypt Text\nEnter choice")
    ch = int(input())
    if ch==1:
        call_encr_file()
    if ch==2:
        call_decr_file()
    if ch==3:
        call_encr_text()
    if ch==4:
        call_decr_text()


if __name__ == '__main__':
    main()
