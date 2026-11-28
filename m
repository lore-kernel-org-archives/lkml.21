Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795847801;
	b=wsJ60HsFE8siFVMMKcvcLxrLJLYA/164bOxmdlN64oy+bzJWmXRdkEbC2Jg2YgvuKeiT
	 nYiUg763GzUu7SWE5o5Sg2svpRlUtAJWNAlEbsOBrsrwRTDj/qGZD4xdEOQlWfjQT+3M3
	 43Q61qu5VPtsjbdUaisdIcFo+GX+aKZBw0EdK45iIGYAH1b6E7nRcrcFm0Y7A0JmnsBQS
	 a4Vygp5UQDaBrXc6sESoSw//qiWoy6yO6tVaJT4y5a5mWdvqMjoxcUXjghkokt73KbCdV
	 eGbB2Pr9ts9K1pGNKW8pXinDy7nA8CId7zVsjyA2qROmO0GBKktVG4Hs40I6AYySHIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795847801;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=n9roixnfIFYGSNY3LMoNE58r2H0x9JeIG09TUUKABSI=;
	b=JNzce89DHCE1BPK7Y30bozXamt0BY0hXc3hMVfhGzRC121/gYZ78J/LtLJdLcNNsxJpI
	 mYQryoczNgYNNdvz8UscVeOlr6Nv5+jAuGYJX9Xez0zgo60glYKSSZnxw8qBS0g2o//8H
	 zuIfyJOws5wVfL4uXaXNh4DAqWbUQdT83EmpBZuKA7IALqu8vJxwIBX6vtsaQ5CiLaw1a
	 RH0XIg4VaPAU7olMkATRChUpOiKJCbvvKuQ45kkwv8T+ADvQzH+gDvJC6LpQaadbkqORZ
	 ehqroQSvSrrHhUMCRVGAf6HYyyX6Ler8HDCxCe6/4CGa3CcncLnWaE3SV8awPD189hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=pbe93rMo;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6C1606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 06:36:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC6C1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=pbe93rMo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=n9
	roixnfIFYGSNY3LMoNE58r2H0x9JeIG09TUUKABSI=; b=pbe93rMoYYlHSA8n9S
	uee3LDCMVLphX9GkzTuTdf2zQxWKHNqJS580d+bSgYplBXEYbBaDU/0De+OSSUXJ
	qbaetvBx9+TW7cGdGU6Gw67/jOCT8GpWMR3pTABvzYdu7HMTjI9wzXCW1HgCKEbU
	+Pq4Q+INwbumpBLf3FKGz5b2g=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3X_Bjdgpr7k+nLg--.44267S2;
	Sat, 28 Nov 2026 14:36:20 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: akpm@linux-foundation.org,
	urezki@gmail.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>
Subject: [PATCH] lib/test_vmalloc: check vrealloc page counts and data ranges
Date: Sat, 28 Nov 2026 14:36:08 +0800
Message-Id: <20261128063608.3434982-1-wangxuewen_ky@163.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3X_Bjdgpr7k+nLg--.44267S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3GrWkXw1UGr18try7JrWUurg_yoWxJFWfpF
	W3Jw1vyFWrJr1xXFZ3Krs2yw4akw4kKayUGrW3W34Ivw15JrnIkF93KFyFvryIyrWkuF1j
	9r4qqF45Cw4DZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jeoGQUUUUU=
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbCzQQU-GsKdmTzFgAA33

From: Xuewen Wang <wangxuewen@kylinos.cn>

The vrealloc test currently checks only the first byte after each resize.
It can pass even if shrinking retains all tail pages or a later byte in the
preserved prefix is corrupted.

Check the backing page count for the ordinary order-0 allocation path and
validate the entire preserved prefix with an offset-dependent pattern. Add
a non-page-aligned shrink and a grow beyond the pages retained after
shrink.

Run the sequence both with GFP_KERNEL and with __GFP_ZERO used consistently
from the initial allocation. In the latter case, also check that each newly
exposed range is zero, including when growing within a retained page.

Export find_vm_area() under the existing CONFIG_TEST_VMALLOC_MODULE guard
so the test can inspect backing page counts in modular builds as well.

The additional resize operations and full-range data checks increase the
work per iteration, so timings are not directly comparable with those
from the original test. When running vrealloc_test alone, use a smaller
test_loop_count, such as 32, to keep correctness runs short instead of
using the default million iterations.

Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
Validation:
- x86-64, 4 KiB pages: built-in one/two workers and module two workers 
  passed, with three repeats of 32 loops per worker. Every loop runs
  both GFP_KERNEL and consistently used __GFP_ZERO sequences.      
- Private x86-64 mutants suppressed tail-page freeing, corrupted the
  final copied byte, or skipped shrink-time zeroing. The enhanced test
  rejected all three; the original first-byte-only test passed all three.
  These were artificial defects, not discovered allocator bugs.    
- arm64, 64 KiB pages: built-in one/two workers and module two workers
  passed with the same repeats/loops. Guest userspace checked the actual
  page size.
- The same arm64 matrix passed with KASAN_GENERIC and KASAN_VMALLOC
  enabled. test_vmalloc.o contained __asan_load/store references; full
  serial logs contained no KASAN reports or kernel warnings/oopses.
- With TEST_VMALLOC=n, find_vm_area has no export in vmalloc.o.

 lib/test_vmalloc.c | 104 ++++++++++++++++++++++++++++-----------------
 mm/vmalloc.c       |   1 +
 2 files changed, 67 insertions(+), 38 deletions(-)

diff --git a/lib/test_vmalloc.c b/lib/test_vmalloc.c
index b23f85e8f8ca..420b4bd5bf2f 100644
--- a/lib/test_vmalloc.c
+++ b/lib/test_vmalloc.c
@@ -17,6 +17,7 @@
 #include <linux/rcupdate.h>
 #include <linux/srcu.h>
 #include <linux/slab.h>
+#include <linux/string.h>
 
 #define __param(type, name, init, msg)		\
 	static type name = init;				\
@@ -422,55 +423,71 @@ vm_map_ram_test(void)
 	return nr_allocated != map_nr_pages;
 }
 
-static int vrealloc_test(void)
+static void vrealloc_fill(u8 *ptr, size_t size)
 {
-	void *ptr, *tmp;
-	int i;
-
-	for (i = 0; i < test_loop_count; i++) {
-		int err = -1;
+	for (size_t i = 0; i < size; i++)
+		ptr[i] = i % 251 + 1;
+}
 
-		ptr = vrealloc(NULL, PAGE_SIZE, GFP_KERNEL);
-		if (!ptr)
-			return -1;
+static int vrealloc_check(const u8 *ptr, size_t size, size_t preserved,
+			  gfp_t flags)
+{
+	struct vm_struct *vm = find_vm_area(ptr);
 
-		*((__u8 *)ptr) = 'a';
+	/* vrealloc() allocates order-0 pages, allowing tail pages to be freed. */
+	if (!vm || vm->nr_pages != DIV_ROUND_UP(size, PAGE_SIZE)) {
+		pr_err("vrealloc: unexpected page count for size %zu\n", size);
+		return -1;
+	}
 
-		/* Grow: beyond allocated pages, triggers full realloc. */
-		tmp = vrealloc(ptr, 4 * PAGE_SIZE, GFP_KERNEL);
-		if (!tmp)
-			goto error;
-		ptr = tmp;
+	for (size_t i = 0; i < preserved; i++) {
+		if (ptr[i] != i % 251 + 1) {
+			pr_err("vrealloc: data mismatch at offset %zu\n", i);
+			return -1;
+		}
+	}
 
-		if (*((__u8 *)ptr) != 'a')
-			goto error;
+	if ((flags & __GFP_ZERO) &&
+	    memchr_inv(ptr + preserved, 0, size - preserved)) {
+		pr_err("vrealloc: nonzero bytes in newly exposed range\n");
+		return -1;
+	}
 
-		/* Shrink: crosses page boundary, frees tail pages. */
-		tmp = vrealloc(ptr, PAGE_SIZE, GFP_KERNEL);
-		if (!tmp)
-			goto error;
-		ptr = tmp;
+	return 0;
+}
 
-		if (*((__u8 *)ptr) != 'a')
-			goto error;
+static int vrealloc_test_flags(gfp_t flags)
+{
+	static const size_t sizes[] = {
+		PAGE_SIZE,
+		4 * PAGE_SIZE, /* Grow beyond allocated pages. */
+		PAGE_SIZE + 17, /* Shrink to a partial final page. */
+		PAGE_SIZE, /* Free the remaining tail page. */
+		PAGE_SIZE / 2, /* Shrink within the same page. */
+		PAGE_SIZE, /* Grow within the allocated page. */
+		4 * PAGE_SIZE, /* Grow beyond pages retained after shrink. */
+	};
+	int i;
 
-		/* Shrink: within same page, no page freeing. */
-		tmp = vrealloc(ptr, PAGE_SIZE / 2, GFP_KERNEL);
-		if (!tmp)
-			goto error;
-		ptr = tmp;
+	for (i = 0; i < test_loop_count; i++) {
+		void *ptr = NULL, *tmp;
+		size_t old_size = 0;
+		int err = -1;
 
-		if (*((__u8 *)ptr) != 'a')
-			goto error;
+		for (size_t j = 0; j < ARRAY_SIZE(sizes); j++) {
+			/* __GFP_ZERO must be used consistently, including at allocation. */
+			tmp = vrealloc(ptr, sizes[j], flags);
+			if (!tmp)
+				goto error;
+			ptr = tmp;
 
-		/* Grow: within allocated page, in-place, no realloc. */
-		tmp = vrealloc(ptr, PAGE_SIZE, GFP_KERNEL);
-		if (!tmp)
-			goto error;
-		ptr = tmp;
+			if (vrealloc_check(ptr, sizes[j], min(old_size, sizes[j]),
+					   flags))
+				goto error;
 
-		if (*((__u8 *)ptr) != 'a')
-			goto error;
+			vrealloc_fill(ptr, sizes[j]);
+			old_size = sizes[j];
+		}
 
 		err = 0;
 error:
@@ -482,6 +499,17 @@ static int vrealloc_test(void)
 	return 0;
 }
 
+static int vrealloc_test(void)
+{
+	int ret;
+
+	ret = vrealloc_test_flags(GFP_KERNEL);
+	if (ret)
+		return ret;
+
+	return vrealloc_test_flags(GFP_KERNEL | __GFP_ZERO);
+}
+
 struct test_case_desc {
 	const char *test_name;
 	int (*test_func)(void);
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index f7aa4686fe5b..a0ee9dc742de 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -4220,6 +4220,7 @@ void *__vmalloc_node_noprof(unsigned long size, unsigned long align,
  */
 #ifdef CONFIG_TEST_VMALLOC_MODULE
 EXPORT_SYMBOL_GPL(__vmalloc_node_noprof);
+EXPORT_SYMBOL_GPL(find_vm_area);
 #endif
 
 void *__vmalloc_noprof(unsigned long size, gfp_t gfp_mask)
-- 
2.25.1

