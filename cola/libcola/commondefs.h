#ifndef _COMMONDEFS_H
#define _COMMONDEFS_H

/* Notes to compilation using MSVC.

   Compiler options:
      /Zc:forScope
*/ 
// magmy20070405: Added for MSVC
#if defined(_MSC_VER)
// Microsoft Visual C++ (MS VC) specific code goes here
#include <float.h>
#include <malloc.h>     // Contains _alloca
namespace std {
inline bool isnan(double const &x) { return _isnan(x) != 0; }
inline bool isinf(double const &x) { return !(_finite(x) || _isnan(x)); }
} // end std

/* Macro for allocating varible-size local arrays
 * The problem:
 *    MS VC does not accept local type declarations like this one:
 *       double Array[n]; // Where n is a non-static integral constant
 *
 * Solution:
 *    Use _alloca when compiling with MSVC.
 *
 * Usage:
 *    DELARE_LOCAL_ARRAY(double, Array, n);
*/
#  define DELARE_LOCAL_ARRAY(Type, Name, Count) Type *Name = (Type *)_alloca(sizeof(Type)*Count)
#else
#  define DELARE_LOCAL_ARRAY(Type, Name, Count) Type Name[Count]
#endif

namespace cola {
/**
 * resolve overlaps:
 *   None: not at all
 *   Horizontal: only horizontally
 *   Both: resolve in either Horizontal or Vertical direction
 *         depending on which leads to less displacement
 */
enum NonOverlapConstraints { None, Horizontal, Both };
enum Dim { HORIZONTAL, VERTICAL };
}
struct delete_object
{
  template <typename T>
  void operator()(T *ptr){ delete ptr;}
};

#endif