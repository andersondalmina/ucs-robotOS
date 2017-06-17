#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>

#define DEVICE_NAME "/dev/robot"
#define BUF_MSG 5

int writeDriver(char word[BUF_MSG])
{
  int file;
  file = open(DEVICE_NAME, O_WRONLY);

  if (file < 0) {
    printf("Erro ao abrir o device!!!\n");
    exit(-1);
  }

  write(file, word, BUF_MSG);
  close(file);

  return 1;
}

char* readDriver()
{
  int file;
  char *word = (char*) malloc(BUF_MSG);
  //char word[BUF_MSG];
  file = open(DEVICE_NAME, O_RDONLY);

  if (file < 0) {
    printf("Erro ao abrir o device!!!\n");
    exit(-1);
  }

  read(file, word, BUF_MSG);
  close(file);

  return *word;
}
