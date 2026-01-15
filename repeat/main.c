extern void print(const char* s);
extern int get_input(char* buf, int size);


int main()
{
    char buf[128];
    int n = get_input(buf, 127);
    buf[n] = '\0';
    
    print(buf);
    return 0;

}
