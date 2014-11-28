#include "List.h"
#include <stdio.h>
#include <stdlib.h>

int defaultCompare(void* itemA, void* itemB){
	return (itemA == itemB);
}

List* createList(Comparator_t comp){
	List* retVal;
	retVal = malloc (sizeof(List));

	retVal->first = NULL;

	if(comp == NULL)
		retVal->compare = &defaultCompare;
	else
		retVal->compare = comp;

	retVal->size = 0;
	return retVal;
}

ListNode* createNode(void* data, ListNode* next){
	ListNode* retVal;
	retVal = malloc(sizeof(ListNode));
	retVal->data = data;
	retVal->next = next;

	return retVal;
}

int list_contains(List* list, void* data){

	ListNode *currentNode = list->first;

	while(currentNode != NULL){
		if(list->compare){
			if(list->compare(currentNode->data, data))
				return 1;
		}
		currentNode = currentNode->next;
	}
	return 0;
}

void list_push_back(List* list, void* data){

	ListNode *currentNode = list->first;
	
	ListNode* newNode = createNode(data, NULL);
	
	if(currentNode == NULL){ //first element
		list->first = newNode;
	}
	else{
		while(currentNode->next != NULL){
			currentNode = currentNode->next;
		}
		currentNode->next = newNode;
	}
	list->size++;
	
}

void list_remove(List* list, void* data){
	ListNode *currentNode = list->first;
	ListNode *previousNode = NULL; 

	while(currentNode != NULL){
		if(list->compare(currentNode->data, data)){
			
			if(list->size == 1){ //last element
				list->first = NULL;
			}
			else{
				previousNode->next = currentNode->next; //remove from list
			}
			free(currentNode);
			list->size--;
			break;
		}
		previousNode = currentNode;
		currentNode = currentNode->next;
	}
}

void list_clear(List* list){
	ListNode *currentNode = list->first;
	ListNode *previousNode = NULL;

	while(currentNode != NULL){
		previousNode = currentNode;
		currentNode = currentNode->next;
		previousNode->next = NULL;
		free(previousNode);
	}
	list->first = NULL;
	list->size=0;

}
