#include <iostream>
#include <fstream>
#include <string>
#include <sstream>

// see https://github.com/pboueke/Graphs-COS242/blob/master/graph.cpp

// declarations =====================================================
template <class T>
struct Element{
    //Element of a linked list, used in queue and stack data structures
    T index; //Index of the element
    Element* next; //Pointer to next element

    Element(T n_index); //Start element given index
};

template <class T>
struct LinkedList{
    //Data structure representing a linked list
    int size; //List's size
    Element<T>* first; //Pointer to first element
    Element<T>* last; //Pointer to last element

    LinkedList(); //Default constructor
    ~LinkedList(); //Default destructor
    void Add_Head(T index); //Adds element to list's head
    void Add_Tail(T index);
    T Remove_Head(); //Removes first element
    bool Remove(T index); //Removes specific element, returns false if not in list
};

// definitions =====================================================

template <class T>
Element<T>::Element(T n_index){
    index = n_index;
    next = NULL; //Can't set beforehand
}

template <class T>
LinkedList<T>::LinkedList(){
    //List starts empty
    size = 0;
    first = last = NULL;
}

template <class T>
LinkedList<T>::~LinkedList(){
    //Empties list
    while (size){
        Remove_Head();
    }
}

template <class T>
void LinkedList<T>::Add_Head(T index){
    //Adds a new element to beginning of list
    Element<T>* e = new Element<T>(index);
    if (size) e->next = first; //Prevents crashing when list was empty
    else last = e;
    first = e;
    size++;
}

template <class T>
void LinkedList<T>::Add_Tail(T index){
    //Adds a new element to end of list
    Element<T>* e = new Element<T>(index);
    if (size) last->next = e;
    else first = e;
    last = e;
    size++;
}

template <class T>
T LinkedList<T>::Remove_Head(){
    //Removes first element of list
    Element<T>* aux = first;
    T ind = first->index;
    first = first->next;
    delete aux;
    --size;
    if (!size) last = NULL;
    return ind;
}

template <class T>
bool LinkedList<T>::Remove(T index){
    //Removes specific element
    Element<T>* prev = NULL;
    for (Element<T>* it = first; it != NULL; it = it->next){
        //Iterates list in search of specific key
        //In case of identical keys, removes first iteration
        if (it->index == index){
            if (prev) prev->next = it->next;
            else first = it->next;
            if (!it->next) last = prev;
            delete it;
            --size;
            return true;
        }
        prev = it;
    }
    return false;
}

// 2 algorithm ==================================================

int kthToLast(LinkedList<int>* ll, int k) {
    Element<int>* curr = ll->first;
    int limit = ll->size - k;
    int counter = 0;
    while (counter < limit) {
        curr = curr->next;
        counter += 1;
    }
    return curr->index;
}

int main(){

    LinkedList<int>* ll = new LinkedList<int>();
    ll->Add_Tail(1);
    ll->Add_Tail(2);
    ll->Add_Tail(3);
    ll->Add_Tail(4);
    ll->Add_Tail(5);
    ll->Add_Tail(6);
    ll->Add_Tail(7);
    ll->Add_Tail(8);
    ll->Add_Tail(9);
    ll->Add_Tail(10);

    std::cout << "Kth to last is: " << kthToLast(ll, 3) << "\n";

    return 0;
}