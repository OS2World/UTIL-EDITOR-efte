/*
 * s_string.cpp
 *
 * Copyright (c) 2008, eFTE SF Group (see AUTHORS file)
 *
 * You may distribute under the terms of either the GNU General Public
 * License or the Artistic License, as specified in the README file.
 *
 */

#include "fte.h"
#include <string.h>

int UnTabStr(char *dest, int maxlen, const char *source, int slen)
{
    char *p = dest;
    int i;
    int pos = 0;

    maxlen--;
    for (i = 0; i < slen; i++) {
	if (maxlen > 0) {
	    if (source[i] == '\t') {
		do {
		    if (maxlen > 0) {
			*p++ = ' ';
			maxlen--;
		    }
		    pos++;
		} while (pos & 0x7);
	    }
	    else {
		*p++ = source[i];
		pos++;
		maxlen--;
	    }
	}
	else
	    break;
    }

    //dest[pos] = 0;
    *p = '\0';
    return pos;
}

#if !defined(HAVE_STRLCPY)
/* returns size of src */
size_t strlcpy(char *dst, const char *src, size_t size)
{
    size_t sz = 0;

    while (sz < size) {
	dst[sz] = src[sz];
	sz++;
    }

    if (sz && (sz == size))
	dst[sz - 1] = 0;

    while (src[sz])
	sz++;

    return sz;
}
#endif // !HAVE_STRLCPY

#if !defined(HAVE_STRLCAT)
size_t strlcat(char *dst, const char *src, size_t size)
{
    size_t dst_len = strlen(dst);
    size_t src_len = strlen(src);

    if (size) {
	size_t len =
	    (src_len >= size - dst_len) ? (size - dst_len - 1) : src_len;
	memcpy(&dst[dst_len], src, len);
	dst[dst_len + len] = '\0';
    }

    return dst_len + src_len;
}
#endif // !HAVE_STRLCAT

#if !defined(HAVE_STRICMP)
int stricmp(const char *a, const char *b)
{
    if (a != NULL && b == NULL)
	return 1;
    if (a == NULL && b != NULL)
	return -1;
    if (a == NULL && b == NULL)
	return 0;

    int aLen = strlen(a);
    int bLen = strlen(b);

    int minLen = aLen < bLen ? aLen : bLen;

    for (int idx = 0; idx < minLen; idx++) {
	char aC = (char) toupper(a[idx]);
	char bC = (char) toupper(b[idx]);

	if (aC > bC)
	    return 1;
	else if (aC < bC)
	    return -1;
    }

    if (aLen < bLen)
	return -1;
    else if (aLen > bLen)
	return 1;
    else
	return 0;
}
#endif // !HAVE_STRICMP
