--- inetutils-1.9/confpaths.h	2012-10-31 22:33:08.283729126 +0100
+++ inetutils-1.9/confpaths.h.new	2012-10-31 22:32:36.968655103 +0100
@@ -55,3 +55,9 @@
 #ifndef PATH_HEQUIV
 #define PATH_HEQUIV _PATH_HEQUIV
 #endif
+
+#ifndef PATH_PROCNET_DEV
+#define PATH_PROCNET_DEV "/proc/net/dev"
+#endif
+
+
