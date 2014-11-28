
#ifndef List_h
#define List_h
/*defines a generic list*/


typedef struct ListNode_t{
	/*generic data used*/
	void * data;
	struct ListNode_t *next;
}ListNode;

/*should return 1 when ListDataA is equal ListDataB, 0 otherwise*/
typedef int (*Comparator_t)(void* ListDataA, void* ListDataB);

typedef struct List_t{
	ListNode *first;
	int size;
	Comparator_t compare;
}List;

/*returns 1 when the list contains data, 0 otherwise*/
int list_contains(List* list, void* data);

/*inserts data in the back of the list*/
void list_push_back(List* list, void* data);

/*removes data from list, if the given data exists inside list*/
void list_remove(List* list, void* data);

/*clears the entire list*/
void list_clear(List* list);

List* createList(Comparator_t comp);
ListNode* createNode(void* data, ListNode* next);

#endif //List_h
