"""Cython Built In Types. Only used in Cython files. All types are not instantiable with calls."""
from typing_extensions import Self
from typing import Any, SupportsIndex, SupportsFloat, Iterator, overload
import abc

unicode = str
basestring = str

cdef class __CythonAbstract__(abc.ABC):
    """Base abstract class for Cython types.
        - Represents basic c types.
        - Is not instantiable with a call.
        - Magic methods exist for static type analysis and are not actually defined.
        - Does not have any attributes.
        - The class itself can only be used in a declaration, but can be used in certain places such as in a cast, or sizeof call.
    """
    def __new__(cls):
        raise NotImplementedError
    def __init__(self):
        raise NotImplementedError
    def __bool__(self) -> bool: ...
    def __eq__(self, __x: Any) -> bool: ...
    def __ne__(self, __x: Any) -> bool: ...


cdef class __CythonInteger__(__CythonAbstract__):
    def __add__(self, __x: SupportsIndex) -> Self: ...
    def __sub__(self, __x: SupportsIndex) -> Self: ...
    def __mul__(self, __x: SupportsIndex) -> Self: ...
    def __floordiv__(self, __x: SupportsIndex) -> Self: ...
    def __truediv__(self, __x: SupportsIndex) -> float: ...
    def __mod__(self, __x: SupportsIndex) -> Self: ...
    def __divmod__(self, __x: SupportsIndex) -> tuple[Self, Self]: ...
    def __radd__(self, __x: SupportsIndex) -> Self: ...
    def __rsub__(self, __x: SupportsIndex) -> Self: ...
    def __rmul__(self, __x: SupportsIndex) -> Self: ...
    def __rfloordiv__(self, __x: SupportsIndex) -> Self: ...
    def __rtruediv__(self, __x: SupportsIndex) -> float: ...
    def __rmod__(self, __x: SupportsIndex) -> Self: ...
    def __rdivmod__(self, __x: SupportsIndex) -> tuple[Self, Self]: ...
    def __pow__(self, __x: SupportsIndex, __modulo: SupportsIndex) -> Self: ...
    def __rpow__(self, __x: SupportsIndex, __mod: SupportsIndex | None = ...) -> Any: ...
    def __and__(self, __n: SupportsIndex) -> Self: ...
    def __or__(self, __n: SupportsIndex) -> Self: ...
    def __xor__(self, __n: SupportsIndex) -> Self: ...
    def __lshift__(self, __n: SupportsIndex) -> Self: ...
    def __rshift__(self, __n: SupportsIndex) -> Self: ...
    def __rand__(self, __n: SupportsIndex) -> Self: ...
    def __ror__(self, __n: SupportsIndex) -> Self: ...
    def __rxor__(self, __n: SupportsIndex) -> Self: ...
    def __rlshift__(self, __n: SupportsIndex) -> Self: ...
    def __rrshift__(self, __n: SupportsIndex) -> Self: ...
    def __neg__(self) -> Self: ...
    def __pos__(self) -> Self: ...
    def __invert__(self) -> Self: ...
    def __trunc__(self) -> Self: ...
    def __ceil__(self) -> Self: ...
    def __floor__(self) -> Self: ...
    @overload
    def __round__(self, __ndigits: None = ...) -> Self: ...
    @overload
    def __round__(self, __ndigits: SupportsIndex) -> Self: ...
    def __eq__(self, __x: object) -> bool: ...
    def __ne__(self, __x: object) -> bool: ...
    def __lt__(self, __x: SupportsIndex) -> bool: ...
    def __le__(self, __x: SupportsIndex) -> bool: ...
    def __gt__(self, __x: SupportsIndex) -> bool: ...
    def __ge__(self, __x: SupportsIndex) -> bool: ...
    def __float__(self) -> float: ...
    def __int__(self) -> int: ...
    def __abs__(self) -> Self: ...
    def __bool__(self) -> bool: ...
    def __index__(self) -> int: ...


cdef class __CythonFloat__(__CythonAbstract__):
    def __add__(self, __x: SupportsFloat) -> Self: ...
    def __sub__(self, __x: SupportsFloat) -> Self: ...
    def __mul__(self, __x: SupportsFloat) -> Self: ...
    def __floordiv__(self, __x: SupportsFloat) -> Self: ...
    def __truediv__(self, __x: SupportsFloat) -> Self: ...
    def __mod__(self, __x: SupportsFloat) -> Self: ...
    def __divmod__(self, __x: SupportsFloat) -> tuple[Self, Self]: ...
    def __pow__(self, __x: SupportsFloat, __mod: None = ...) -> Any: ...
    def __radd__(self, __x: SupportsFloat) -> Self: ...
    def __rsub__(self, __x: SupportsFloat) -> Self: ...
    def __rmul__(self, __x: SupportsFloat) -> Self: ...
    def __rfloordiv__(self, __x: SupportsFloat) -> Self: ...
    def __rtruediv__(self, __x: SupportsFloat) -> Self: ...
    def __rmod__(self, __x: SupportsFloat) -> Self: ...
    def __rdivmod__(self, __x: SupportsFloat) -> tuple[Self, Self]: ...
    def __trunc__(self) -> int: ...
    def __ceil__(self) -> int: ...
    def __floor__(self) -> int: ...
    @overload
    def __round__(self, __ndigits: None = ...) -> Self: ...
    @overload
    def __round__(self, __ndigits: SupportsIndex) -> Self: ...
    def __eq__(self, __x: object) -> bool: ...
    def __ne__(self, __x: object) -> bool: ...
    def __lt__(self, __x: SupportsFloat) -> bool: ...
    def __le__(self, __x: SupportsFloat) -> bool: ...
    def __gt__(self, __x: SupportsFloat) -> bool: ...
    def __ge__(self, __x: SupportsFloat) -> bool: ...
    def __neg__(self) -> Self: ...
    def __pos__(self) -> Self: ...
    def __int__(self) -> int: ...
    def __float__(self) -> float: ...
    def __abs__(self) -> Self: ...
    def __bool__(self) -> bool: ...


cdef class void(__CythonAbstract__):
    """Cython Type. Represents void."""

cdef class bint(__CythonInteger__):
    """Cython Type. Represents a boolean integer."""

cdef class char(__CythonInteger__):
    """Cython Type. Represents a char integer."""

cdef class short(__CythonInteger__):
    """Cython Type. Represents a short integer."""

cdef class size_t(__CythonInteger__):
    """Cython Type. Represents size_t."""

cdef class ssize_t(__CythonInteger__):
    """Cython Type. Represents ssize_t."""

cdef class long(__CythonInteger__):
    """Cython Type. Represents a long integer."""

cdef class double(__CythonFloat__):
    """Cython Type. Represents a double."""

cdef class ptrdiff_t(__CythonInteger__):
    """Cython Type. Represents the signed integer type of the result of subtracting two pointers."""

cdef class Py_UNICODE(__CythonInteger__):
    """Cython Type. Represents a Py_UNICODE. Equivalent to wchar_t."""

cdef class Py_UCS4(__CythonInteger__):
    """Cython Type. Represents a Py_UCS4. Single unicode character."""

cdef class Py_hash_t(__CythonInteger__):
    """Cython Type. Represents a Py_hash_t. Hash of object. Size of Py_ssize_t."""

cdef class Py_ssize_t(__CythonInteger__):
    """Cython Type. Represents a Py_ssize_t."""

cdef class Py_tss_t(__CythonInteger__):
    """Cython Type. Represents a Py_tss_t. Thread state."""

def sizeof(__obj: Any) -> int:
    """Cython Function. Return size of object or variable."""

ctypedef struct Py_buffer:
    void* buf
    object obj # Py_object
    Py_ssize_t len
    Py_ssize_t itemsize
    bint readonly
    int ndim
    char* format
    Py_ssize_t* shape
    Py_ssize_t* strides
    Py_ssize_t* suboffsets
    Py_ssize_t[2] smalltable
    void* internal

ctypedef struct Py_complex:
    double real
    double imag

class __MemoryView__[ItemType, Base]():
    """Cython MemoryView. Wraps an object that supports the buffer protocol."""
    def __delitem__(self, __key: SupportsIndex): ...
    def __setitem__(self, __key: SupportsIndex, __value: ItemType): ...
    @overload
    def __getitem__(self, __key: slice) -> __MemoryView__[ItemType, Base]: ...
    def __getitem__(self, __key: SupportsIndex) -> ItemType: ...
    def __len__(self) -> int: ...
    def __contains__(self, __value: Any) -> bool:
        """Not actually defined."""
    def __iter__ (self) -> Iterator[ItemType]:
        """Not actually defined."""
    def count(self, __value: Any) -> int: ...
    def index(self, __value: ItemType, start: SupportsIndex = ..., stop: SupportsIndex = ...) -> int: ...
    def copy(self) -> __MemoryView__[ItemType, Base]:
        """Return a copy of view with C layout."""
    def copy_fortran(self) -> __MemoryView__[ItemType, Base]:
        """Return a copy of view with Fortran layout."""
    def is_c_contig(self) -> bool:
        """Return True if view layout is C contiguous."""
    def is_f_contig(self) -> bool:
        """Return True if view layout is Fortran contiguous."""
    @property
    def base(self) -> Base:
        """Return the base buffer object."""
    @property
    def itemsize(self) -> int:
        """Return the size of an item contained in buffer in bytes."""
    @property
    def nbytes(self) -> int:
        """Return the size of view in bytes."""
    @property
    def ndim(self) -> int:
        """Return the number of dimensions."""
    @property
    def shape(self) -> tuple[int, ...]:
        """Return the shape."""
    @property
    def strides(self) -> tuple[int, ...]:
        """Return the strides."""
    @property
    def suboffsets(self) -> tuple[int, ...]:
        """Return the suboffsets."""
    @property
    def T(self) -> __MemoryView__[ItemType, Base]:
        """Return transposed view."""
