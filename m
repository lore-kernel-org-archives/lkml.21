Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795599862;
	b=xHbeILOo7uhCHRvG/Y9ZZOfhGOeIvj+Up6PY0yOf5o0vmy9Ue17QWYhG344AbcEdljZN
	 5xPn1L8GeTcXO8g1knOo6qjj1U5t/HnXpEllDQpXVf1Pva4QJraa5ZwWN1+aybX2k0+Gx
	 Pq84GloFD7Hq2m+HMNWzdE7ufYbKaS9tm+4INacknFKSBJQdIaC5iCEES2IKpcZ+/h0Ay
	 UMU0qih4LGqW6DWev8fiXFLnLLjIz9GtRtMJY0BsjiAvhxeLSS9GgWVO+SuvezXJWfU52
	 2/UWV5+2A+BmdJTY3UO/+3vomgLWOQHtI/ZNXfmlW0ReVTEJA/w8p3/ivGlBQujynPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795599862;
	h=DMARC-Filter:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=hK9/ZvI4RQONy42AjQdsozn3n5oHBqlyc03I96TZCok=;
	b=eolEWX3xVNytSo9WFNEU45/sF/1qWLctYXMhDz9u2BkvFOMHdGrQMR9ZpU62xqlPuxwu
	 z2kk8zYJErBg1c9RPhuM6RJo8nnfX2i4h6TAfF3/lu1wRhaeD8FcvY/6bTRAY+0RJs9hf
	 TrbKdFOe8um4qt0FZxuK4al+7chZQF+zwKvj7s306kOiRLcfF9ttzbq/WDWhccQ3JF6xk
	 oiglyuV30kdmCNn2KBKqxqUA2AX/copItDHTam3wHfLX1/0Y4sFWUHJamKVStXIHuYfM7
	 8mfmi5I5ZIL3RCExlS88RfXD4+FgifOlpkXVZjR9Ym+YA8jGoZoKmfyI1JBIUor2GSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=weissschuh.net;
	spf=pass smtp.mailfrom=weissschuh.net;
	dkim=pass header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=R9NIX8Xj;
	arc=none smtp.remote-ip=159.69.126.157
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7D8606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:44:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E7D8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=R9NIX8Xj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1795599853;
	bh=pWx/g8MeQQ7Bbsl+OfRWoj+wo8ZOBFCHdbIdQRZsD9E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=R9NIX8XjUmxJCwi7PhX0X73mFInnRTg41CEQCpCWwgd/xxK0anncDVYS9rktiOHnP
	 7ofbFw1/9PDuqOwXuip4LeGze+xk2DAH6fze6So6pAS8kQcwA30LleB9m5Mt0xzQtR
	 fefkqzYI6YGLkRU9tV2GbELCEnxq0jF1I6krpWuo=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Wed, 25 Nov 2026 10:43:43 +0100
Subject: [PATCH 2/3] tools/nolibc: add support for fcntl()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261125-nolibc-fcntl-v1-2-503d81db293f@weissschuh.net>
References: <20261125-nolibc-fcntl-v1-0-503d81db293f@weissschuh.net>
In-Reply-To: <20261125-nolibc-fcntl-v1-0-503d81db293f@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Danish Khateeb <danishkhateeb03@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795599851; l=4490;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=pWx/g8MeQQ7Bbsl+OfRWoj+wo8ZOBFCHdbIdQRZsD9E=;
 b=FlBSt7xg8loDat7mjyXoW/EmQFLX2822c4UJRRwePfajvQdUDno/TpPRiYldykugO245Bvk32
 oCrAMX0JPujAA5lG0/UPMSMX3vqrgWsxD+lyu4psNc6ZBp3fneA2UE+
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Add the fcntl() function.

Special handling is necessary for 'struct flock'.
The definition from the UAPI headers is not large-file capable.
Provide a custom definition which is compatible with 'struct flock64'
on 32-bit systems and 'struct flock' on 64-bit ones.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 tools/include/nolibc/fcntl.h                 | 35 +++++++++++++++++++++++++
 tools/include/nolibc/types.h                 | 15 +++++++++++
 tools/testing/selftests/nolibc/nolibc-test.c | 39 ++++++++++++++++++++++++++++
 3 files changed, 89 insertions(+)

diff --git a/tools/include/nolibc/fcntl.h b/tools/include/nolibc/fcntl.h
index d4b6af60d4cc..98d22f614565 100644
--- a/tools/include/nolibc/fcntl.h
+++ b/tools/include/nolibc/fcntl.h
@@ -71,4 +71,39 @@ int creat(const char *path, mode_t mode)
 	return open(path, O_CREAT | O_WRONLY | O_TRUNC, mode);
 }
 
+/*
+ * int fcntl(int fd, int cmd, ...);
+ */
+
+static __attribute__((unused))
+int _sys_fcntl(int fd, int cmd, unsigned long arg)
+{
+#if defined(__NR_fcntl64)
+	return __nolibc_syscall3(__NR_fcntl64, fd, cmd, arg);
+#else
+	__nolibc_static_assert(sizeof(struct flock) == sizeof(struct __nolibc_kernel_flock));
+	__nolibc_static_assert(offsetof(struct flock, l_start) ==
+			       offsetof(struct __nolibc_kernel_flock, l_start));
+	__nolibc_static_assert(offsetof(struct flock, l_len) ==
+			       offsetof(struct __nolibc_kernel_flock, l_len));
+	__nolibc_static_assert(offsetof(struct flock, l_pid) ==
+			       offsetof(struct __nolibc_kernel_flock, l_pid));
+
+	return __nolibc_syscall3(__NR_fcntl, fd, cmd, arg);
+#endif
+}
+
+static __attribute__((unused))
+int fcntl(int fd, int cmd, ...)
+{
+	unsigned long arg;
+	va_list args;
+
+	va_start(args, cmd);
+	arg = va_arg(args, unsigned long);
+	va_end(args);
+
+	return __sysret(_sys_fcntl(fd, cmd, arg));
+}
+
 #endif /* _NOLIBC_FCNTL_H */
diff --git a/tools/include/nolibc/types.h b/tools/include/nolibc/types.h
index 4373bd8a5b5f..fba1e6d704e2 100644
--- a/tools/include/nolibc/types.h
+++ b/tools/include/nolibc/types.h
@@ -32,6 +32,21 @@ struct timeval {
 #include <linux/time.h>
 #undef timeval
 
+struct flock {
+	short l_type;
+	short l_whence;
+	__kernel_loff_t l_start;
+	__kernel_loff_t l_len;
+	__kernel_pid_t l_pid;
+#if defined(__sparc__)
+	short __pad;
+#endif
+};
+
+#define flock __nolibc_kernel_flock
+#include <linux/fcntl.h>
+#undef flock
+
 /* Only the generic macros and types may be defined here. The arch-specific
  * ones such as the O_RDONLY and related macros used by fcntl() and open()
  * must not be defined here.
diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index 0eebd534bdb7..63e9ba54b265 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -1908,6 +1908,44 @@ int test_difftime(void)
 	return 0;
 }
 
+int test_flock_type(void)
+{
+	/* Kernel type */
+	struct flock64 fl64;
+
+	/* Nolibc type */
+	struct flock fl;
+
+	if (sizeof(fl) != sizeof(fl64))
+		return __LINE__;
+
+	if (!struct_members_identical(l_type, fl, fl64))
+		return __LINE__;
+
+	if (!struct_members_identical(l_whence, fl, fl64))
+		return __LINE__;
+
+	if (!struct_members_identical(l_start, fl, fl64))
+		return __LINE__;
+
+	if (!struct_members_identical(l_len, fl, fl64))
+		return __LINE__;
+
+	if (!struct_members_identical(l_pid, fl, fl64))
+		return __LINE__;
+
+	if (sizeof(fl.l_start) != sizeof(off_t))
+		return __LINE__;
+
+	if (sizeof(fl.l_len) != sizeof(off_t))
+		return __LINE__;
+
+	if (sizeof(fl.l_pid) != sizeof(pid_t))
+		return __LINE__;
+
+	return 0;
+}
+
 int test_time_types(void)
 {
 #ifdef NOLIBC
@@ -2128,6 +2166,7 @@ int run_stdlib(int min, int max)
 		CASE_TEST(abs_noop);                EXPECT_EQ(1, abs(10), 10); break;
 		CASE_TEST(alloca);                  EXPECT_ZR(1, test_alloca()); break;
 		CASE_TEST(difftime);                EXPECT_ZR(1, test_difftime()); break;
+		CASE_TEST(flock_type);              EXPECT_ZR(is_nolibc, test_flock_type()); break;
 		CASE_TEST(memchr_foobar6_o);        EXPECT_STREQ(1, memchr("foobar", 'o', 6), "oobar"); break;
 		CASE_TEST(memchr_foobar3_b);        EXPECT_STRZR(1, memchr("foobar", 'b', 3)); break;
 		CASE_TEST(time_types);              EXPECT_ZR(is_nolibc, test_time_types()); break;

-- 
2.56.1

