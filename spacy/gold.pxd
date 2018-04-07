from cymem.cymem cimport Pool

from .structs cimport TokenC
from .typedefs cimport attr_t
from .syntax.transition_system cimport Transition


cdef struct GoldParseC:
    int* tags
    int* heads
    int* has_dep
    int* sent_start
    attr_t* labels
    int** brackets
    int* fused
    Transition* ner
    int _size


cdef class GoldParse:
    cdef Pool mem

    cdef GoldParseC c

    cdef int length
    cdef public int loss
    cdef public list words
    cdef public list tags
    cdef public list heads
    cdef public list labels
    cdef public dict orths
    cdef public list ner
    cdef public list ents
    cdef public dict brackets
    cdef public object cats
    cdef public object _alignment

    cdef readonly list orig_annot


