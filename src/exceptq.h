/*****************************************************************************/
/*
 *  exceptq.h - exceptq public header
 *
 *  2010-11-14 SHL Updated to support OpenWatcom
 *
 *  Parts of this file are
 *    Copyright (c) 2000-2010 Steven Levine and Associates, Inc.
 *    Copyright (c) 2010 Richard L Walsh
 *
*/
/*****************************************************************************/
#ifndef OS2_INCLUDED
#define INCL_BASE
#define INCL_DOSEXCEPTIONS
#include <os2.h>
#endif

#ifndef EXCEPTQ_H_INCLUDED
  #define EXCEPTQ_H_INCLUDED

#ifdef __cplusplus
  extern "C" {
#endif

/*****************************************************************************/

#ifndef OS2_INCLUDED
#error os2.h must be #included before exceptq.h
#endif

/** Install/Uninstall MyHandler() - 32-bit entrypoint **/

APIRET   APIENTRY   InstallExceptq(PEXCEPTIONREGISTRATIONRECORD pExRegRec,
                                   char * pszOptions);

typedef APIRET APIENTRY _INSTEXQ(PEXCEPTIONREGISTRATIONRECORD, char*);
typedef _INSTEXQ* PINSTEXQ;

#define UninstallExceptq(pExRegRec) DosUnsetExceptionHandler((pExRegRec))

/** The exception handler **/

ULONG    APIENTRY   MYHANDLER(PEXCEPTIONREPORTRECORD pExRepRec,
                              PEXCEPTIONREGISTRATIONRECORD pExRegRec,
                              PCONTEXTRECORD pCtxRec,
                              PVOID p);

/** Install/Uninstall MyHandler() - 16-bit entrypoints **/

#ifdef __WATCOMC__
APIRET16 APIENTRY16 SETEXCEPT(EXCEPTIONREGISTRATIONRECORD * _Seg16 pExRegRec);
APIRET16 APIENTRY16 UNSETEXCEPT(EXCEPTIONREGISTRATIONRECORD * _Seg16 pExRegRec);
#else
#ifdef __IBMC__
APIRET16 APIENTRY16 SETEXCEPT(PEXCEPTIONREGISTRATIONRECORD _Seg16 pExRegRec);
APIRET16 APIENTRY16 UNSETEXCEPT(PEXCEPTIONREGISTRATIONRECORD _Seg16 pExRegRec);
#else
#error Unexpected __WATCOMC__ or __IBMC__
#endif
#endif

/** Force the app to exit via a forced trap **/

void     APIENTRY   FORCEEXIT();

int    LoadExceptq(EXCEPTIONREGISTRATIONRECORD* pExRegRec, char* pOpts);

/*****************************************************************************/
#ifdef INCL_LOADEXCEPTQ

/* The following sample function loads and installs Exceptq dynamically
 * so your application can use it without being dependent on its presence.
 * By design, it will fail if it finds a version of Exceptq earlier than v7.0.
 * You can either copy it into your source or you can #define INCL_LOADEXCEPTQ
 * in *one* of your files to have it included.  It assumes you've #included
 * <string.h> and #defined INCL_DOS.
 *
 * Note:  for each thread your app creates, you must call this function
 * on entry and UninstallExceptq() on exit.  Typically, LoadExceptq()
 * should be the first line of code in main() and in each threadproc.
 * UninstallExceptq() should be called immediately before exiting main()
 * and each threadproc.  To use the default options, pass a null string
 * or a null pointer in pOpts.
*/

BOOL    LoadExceptq(EXCEPTIONREGISTRATIONRECORD* pExRegRec, char* pOpts)
{
  static BOOL      fLoadTried = FALSE;
  static PINSTEXQ  pfnInstall = 0;

  HMODULE   hmod = 0;
  char      szFailName[16];

  /* Make only one attempt to load the dll & resolve the proc address. */
  if (!fLoadTried) {
    fLoadTried = TRUE;

    /* If the dll can't be found on the LIBPATH, look for it in the
     * exe's directory (which may not be the current directory).
     */
    if (DosLoadModule(szFailName, sizeof(szFailName), "EXCEPTQ", &hmod)) {
      PPIB      ppib;
      PTIB      ptib;
      char *    ptr;
      char      szPath[CCHMAXPATH];

      DosGetInfoBlocks(&ptib, &ppib);
      if (DosQueryModuleName(ppib->pib_hmte, CCHMAXPATH, szPath) ||
          (ptr = strrchr(szPath, '\\')) == 0)
        return FALSE;

      strcpy(&ptr[1], "EXCEPTQ.DLL");
      if (DosLoadModule(szFailName, sizeof(szFailName), szPath, &hmod))
        return FALSE;
    }

    /* If the proc address isn't found (possibly because an older
     * version of exceptq.dll was loaded), unload the dll & exit.
     */
    if (DosQueryProcAddr(hmod, 0, "InstallExceptq", (PFN*)&pfnInstall)) {
      DosFreeModule(hmod);
      return FALSE;
    }
  }

  /* Ensure we have the proc address. */
  if (!pfnInstall)
    return FALSE;

  /* Call InstallExceptq().  It really shouldn't fail, so if
   * it does, zero-out the address to avoid further problems.
   */
  if (pfnInstall(pExRegRec, pOpts)) {
    pfnInstall = 0;
    return FALSE;
  }

  return TRUE;
}

#endif
/*****************************************************************************/

#ifdef __cplusplus
  }
#endif

#endif /* EXCEPTQ_H_INCLUDED */

