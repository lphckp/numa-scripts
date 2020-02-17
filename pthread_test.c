#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <pthread.h>

#define BUF_SIZE 4096

void *worker(void *mem)
{
  volatile int *a, *b, *c;

  if (!mem)
    return NULL;

  // page-in
  memset(mem, 0, 3*BUF_SIZE);

  a = (int *)((long)mem + 0*BUF_SIZE);
  b = (int *)((long)mem + 1*BUF_SIZE);
  c = (int *)((long)mem + 2*BUF_SIZE);
  for (;;) {
    for (int i=0; i<BUF_SIZE/sizeof(int); i++) {
      a[i] = b[i] + c[i];
    }
  }
  return NULL;
}

int main(int argc, char **argv)
{
  int num_threads = 1;

  if (argc != 2) {
    printf("Usage: %s <num_threads>\n", argv[0]);
    exit(-1);
  }
  
  num_threads = atoi(argv[1]);

  for (int i=0; i<num_threads; i++) {
    pthread_t thread;
    void *mem;
    mem = valloc(3*4096);
    if (!mem) {
      printf("Unable to allocate memory for thread %d!\n", i);
      exit(-1);
    }
    if (pthread_create(&thread, NULL, worker, mem) < 0) {
      printf("Unable to start thread %d!!\n", i);
      exit(-1);
    }
  }

  printf("Started %d threads, press any key to quit\n", num_threads);
  getchar();

  return 0;
}