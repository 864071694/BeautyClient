//
//  PXISARC.h
//  
//

#ifndef _PXISARC_h
#define _PXISARC_h

#ifndef PX_STRONG

#if __has_feature(objc_arc)
#define PX_STRONG strong
#else
#define PX_STRONG retain
#endif
#endif

#ifndef PX_COPY
#if __has_feature(objc_arc)
#define PX_COPY strong
#else
#define PX_COPY copy
#endif
#endif

#ifndef PX_WEAK
#if __has_feature(objc_arc_weak)
#define PX_WEAK weak
#elif __has_feature(objc_arc)
#define PX_WEAK unsafe_unretained
#else
#define PX_WEAK assign
#endif
#endif

#if __has_feature(objc_arc)
#define PX_AUTORELEASE(expression) expression
#define PX_RELEASE(expression) expression = nil
#define PX_RETAIN(expression) expression
#else
#define PX_AUTORELEASE(expression) [expression autorelease]
#define PX_RELEASE(expression) [expression release];expression=nil;
#define PX_RETAIN(expression) [expression retain]
#endif

#endif
