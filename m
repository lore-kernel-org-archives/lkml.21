Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102325;
	b=rXb8N6EMzOggjZD0gkfRRwxRcGk2z02fZkBYgLedL3NZP3u2REQFup+ilSGCFnjyfg4L
	 q5IYLPhzjkf7wZcxMitzR4VCFIRbdLjbg4PNW5NLI+UsmQ5jIBEzBtgQWzEUVKPVnolRr
	 /6y//8z68QE5TT+WJCrPJJtS2yprJH9I5SiupJ/gplMXD8Ab6Nz7agz7rjNFaUjuYZ9Jp
	 Dne5grnTTL0brsmyU7AGnb53m/hMlIuRPrXe9rRlTP3BZJb3uu2reJUxakC4ppWvCyf3N
	 Pcbt/jvEsKfX9E3yJeaH2yMWtzrRhZZznrWN8koX3e7FHocDAevl4wOcA62tRDSqnoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102325;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qsLrdL7sT/af1ui02yqpWUBVQva/Rfa3My1unqAhcwE=;
	b=qNUZ6OiHHKLQDzV5Ywvw8+WPZpqathJioAApj0/yXsmnMzClRyRmiw2Lt6u+rOcYfHUD
	 ZMW89ix0NNwjmQ8pxZWSNO701WOteozRgu8S6YxxeLvHOZOz251wt2Xdsw2SH7OnLefR9
	 xyuO/4sMrG+aql6qX9Ci947Gj1JzE2ywLzxZyl+5bbjq8j8foQIDg3zX3/dJyxD/ccEpo
	 lUN6vHYAjCjs4ms8989cQcUlcoUnpEWnXYl0Qju/nAaGiMpzLJCeSQ9frIomNn8d/SPav
	 E9VTV4DQkXUVf+IplvNsY5ydfUo7rR7lEHFII1cUTUVlddNxHh6Zfha1qN4tkii3w6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=readmodwrite.com;
	spf=none smtp.mailfrom=readmodwrite.com;
	dkim=pass header.d=readmodwrite-com.20260707.gappssmtp.com header.i=@readmodwrite-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="RE/L9kKE";
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4CA606A33B
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:32:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF4CA606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readmodwrite-com.20260707.gappssmtp.com header.i=@readmodwrite-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=RE/L9kKE
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-49465892f7bso1903584f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=readmodwrite-com.20260707.gappssmtp.com; s=20260707; t=1795102323; x=1795707123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qsLrdL7sT/af1ui02yqpWUBVQva/Rfa3My1unqAhcwE=;
        b=RE/L9kKEUbOKXkxm6ksk/fWVpRm70IjbcfOf+ga+LcB+xg6rbqdMX6BqCBBLScG0Jm
         gVRV4KJySbeLs4kNGJEju+4CIqD14jTPhg3rw1xqVqFjGHYf6j8Q7Qf9nXDwbLNCJk/h
         1LTI7QeLeNwEtebGif2A47TzzZ/A//F6L2DEenyg/T5qpcHj8fRFrMKC+qYiezW3vNes
         U2F5igJcKm976ko9UW6J3UXRfem3YpsbjBw/3kIOb47M+8eSM+PN9V9FEWURsuJmlqOT
         LWTXQ2WwR7rwlBtT7D/r88DMla6bD7Jx3/zT/igDBQX3R0yi3S65sQJbFJqlMF+YWRjP
         zSIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795102323; x=1795707123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qsLrdL7sT/af1ui02yqpWUBVQva/Rfa3My1unqAhcwE=;
        b=b1p6tsdXfdKzD70rKqjHIJa1iwc8WeKXuHosaV1OfPwXyAe64jJ0q+EhPO2CrNXbha
         3OcJ+yR5+Wm9/247yHGwxgIV5FV8pFXwg46HGI4NgfxKUGlSV/VG93mk2dAhYTxu9yl9
         5NNcpAHCTBPxtnoNCHs5LjswEVVzL+Uqaqv9qoBLi18LvKMfDOzy4JJarw4Mode1vGAI
         JaeonSouYdF6dScKX6l9xMrxQqPD/2PoNc21anRYhOyRDnc9s8akbeaRd1nFAwmz9+XF
         uYB5skkC2ViBonej53In5h0jWPxZzTBksvkrGzS+KkT+A4ETNlNTTjGNc+sHFCLhJIPq
         Vgfg==
X-Forwarded-Encrypted: i=1; AL+hErEsDTOU3LFcDQuJcfpYTIxm1iUtKDGrzIETzDOg7Tj08sCnNmAQqDTHcAN60R8NasH5UyLgfFJVGly7xQc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+oDVMgvsXAenYap3Ue5tCc2+5N1KnXxAbvNlW10eaa9htm/XYt
	fFiCl+860bK/1ZbTuxLETFNGyyoMQi4/vkHtxWyv+uV8AEUpHp7h9NSlzK9EeRsxY23QHfrbmRA
	h4my42FJcQg==
X-Gm-Gg: AZFdTZc3nl4YqrqRRGD8iGCVRnEZtkZ7fHbAkIFEcqYj0ZG8b9oB0Qg9xltnF3AXEmM
	B6q4RiwgKadkd1rWBufIR0wjY/syv4gd+l3VgeXw5HOTbH6EMF12CJRUf8yGg06JljTE+CVpayk
	IPS3/mFH2v/brjdSpYR4iOTQD2HaoF8TnQiXN0EowvvqqkJ04/zuAdcUjoA1DiKZA8Qflji4ejQ
	1Lv+UT6krgPzsvZXs948jeqBwSwIMGvvNQb+njLWXR61MXW42eL7EED3BlGHeFvg5TTj/mNNTjJ
	tmmefIwDnngAg+CoJ4T7GDhciYx43wGbO4H4BG5vo2i2WF+rNJ9SJn7XZbZqj+SknA0Zsw6R37u
	KGbn7om3PbW5XvUJGO3jb9foQZvI32u6h7sYxmMA5O0NN7PEhvxhjQsf9qQ6ExLCfQI/UQ8nW83
	QR5g80zDYmd8XqoDq3K8iiNWEUdlEew1QtoyLLtW7rJ9RmoHwfiy/1DJosE+6Y5PqQFfgUnIFfk
	QZunE1zVy8Mwe5x9CQYk1C2r5zBk4iIxL8Xunh+Zukk/GV1x7pK403PWZamz51eo+EjTCDplMC9
	fL6hqeMVEAMUrCXge8vBDDXMnkQQWgY=
X-Received: by 2002:a05:6000:658:b0:48e:6812:5ef1 with SMTP id ffacd0b85a97d-4a63a1e1041mr10988480f8f.25.1795102322897;
        Thu, 19 Nov 2026 07:32:02 -0800 (PST)
Received: from matt-Precision-5490.. ([2a09:bac6:37a8:294b::41d:4e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb41f4sm237463f8f.7.2026.11.19.07.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:32:02 -0800 (PST)
From: Matt Fleming <matt@readmodwrite.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Marco Elver <elver@google.com>
Cc: Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Oscar Salvador <osalvador@suse.de>,
	Vlastimil Babka <vbabka@kernel.org>,
	Caleb Kan <calebkan1106@gmail.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	kernel-team@cloudflare.com,
	Caleb Kan <ckan@cloudflare.com>,
	Matt Fleming <mfleming@cloudflare.com>
Subject: [PATCH v4 01/10] stackdepot: add caller-owned stack trace fetching
Date: Thu, 19 Nov 2026 15:31:34 +0000
Message-ID: <20261119153143.4099483-2-matt@readmodwrite.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119153143.4099483-1-matt@readmodwrite.com>
References: <20261119153143.4099483-1-matt@readmodwrite.com>
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

From: Caleb Kan <ckan@cloudflare.com>

stack_depot_fetch() returns a pointer to contiguous storage owned by stack
depot. That cannot work once a later patch stores compressed frames, so
callers need an interface that copies the trace.

Add stack_depot_fetch_into() to copy a complete trace into caller-owned
storage. Leave the destination unchanged when it is too small, keep a zero
handle as a no-op, and document that callers must keep the handle valid
while copying it. Warn and return 0 if a caller passes a NULL buffer or
zero capacity for a valid handle.

Unpoison the copied entries before returning them because
lib/stackdepot.c is not instrumented by KMSAN. Add built-in KUnit tests for
exact and oversized destinations, zero handles, and undersized buffers.
Later patches add tests for stack depot internals.

Signed-off-by: Caleb Kan <ckan@cloudflare.com>
[mfleming: reworded for compressed frames]
Signed-off-by: Matt Fleming <mfleming@cloudflare.com>
---
 include/linux/stackdepot.h   | 36 +++++++++++++++
 lib/Kconfig.debug            | 16 +++++++
 lib/stackdepot.c             | 29 ++++++++++++
 lib/tests/Makefile           |  1 +
 lib/tests/stackdepot_kunit.c | 89 ++++++++++++++++++++++++++++++++++++
 5 files changed, 171 insertions(+)
 create mode 100644 lib/tests/stackdepot_kunit.c

diff --git a/include/linux/stackdepot.h b/include/linux/stackdepot.h
index 2cc21ffcdaf9..734529767c8a 100644
--- a/include/linux/stackdepot.h
+++ b/include/linux/stackdepot.h
@@ -199,6 +199,42 @@ struct stack_record *__stack_depot_get_stack_record(depot_stack_handle_t handle)
 unsigned int stack_depot_fetch(depot_stack_handle_t handle,
 			       unsigned long **entries);
 
+/**
+ * stack_depot_fetch_into - Fetch a stack trace into caller-owned storage
+ *
+ * @handle:	Stack depot handle
+ * @entries:	Caller-owned buffer to copy the stack trace into
+ * @max_entries:	Number of frames that fit in @entries
+ *
+ * Copies the stored frames into caller-owned @entries. If fewer frames are
+ * stored than @max_entries, only the stored frames are written and their count
+ * is returned. If more frames are stored than @max_entries, the copy is skipped
+ * entirely and 0 is returned.
+ *
+ * Passing a NULL @entries buffer or zero @max_entries for a valid @handle is
+ * invalid. Callers must provide storage for @max_entries frames.
+ *
+ * Callers should size @entries to match the save-side stack depth cap (for
+ * example, %CONFIG_STACKDEPOT_MAX_FRAMES or the local stack_trace_save() limit)
+ * when losing diagnostics on an undersized buffer would be surprising.
+ *
+ * A non-zero invalid @handle, including a post-put handle, may WARN. Its return
+ * value and copied contents are undefined because the record may have been
+ * reused for another stack.
+ *
+ * Callers must ensure @handle remains valid for the duration of this call.
+ * Persistent handles saved without %STACK_DEPOT_FLAG_GET require no extra
+ * reference; handles saved with %STACK_DEPOT_FLAG_GET require a held reference.
+ * Callers must not call stack_depot_put() on persistent handles.
+ * Racing this helper with stack_depot_put() on the same handle is invalid.
+ *
+ * Return: Number of frames copied, 0 if @handle is 0, stack depot is disabled,
+ * or @max_entries is less than the number of stored frames.
+ */
+unsigned int stack_depot_fetch_into(depot_stack_handle_t handle,
+				    unsigned long *entries,
+				    unsigned int max_entries);
+
 /**
  * stack_depot_print - Print a stack trace from stack depot
  *
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 2d22638ec13a..861d0caf9391 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2818,6 +2818,22 @@ config RESOURCE_KUNIT_TEST
 
 	  If unsure, say N.
 
+config STACKDEPOT_KUNIT_TEST
+	bool "KUnit test for stack depot" if !KUNIT_ALL_TESTS
+	depends on KUNIT=y && STACKDEPOT
+	depends on STACKDEPOT_MAX_FRAMES >= 3
+	default KUNIT_ALL_TESTS
+	help
+	  Enable this option to test stack depot API behavior at boot.
+	  This test is built in, so KUNIT must also be built in.
+
+	  KUnit tests run during boot and output the results to the debug log
+	  in TAP format (https://testanything.org/). Only useful for kernel
+	  developers running the KUnit test harness, and not intended for
+	  inclusion into a production build.
+
+	  If unsure, say N.
+
 config SYSCTL_KUNIT_TEST
 	tristate "KUnit test for sysctl" if !KUNIT_ALL_TESTS
 	depends on KUNIT
diff --git a/lib/stackdepot.c b/lib/stackdepot.c
index 90c52f2e0d3f..556f3ecdcc8f 100644
--- a/lib/stackdepot.c
+++ b/lib/stackdepot.c
@@ -785,6 +785,35 @@ unsigned int stack_depot_fetch(depot_stack_handle_t handle,
 }
 EXPORT_SYMBOL_GPL(stack_depot_fetch);
 
+unsigned int stack_depot_fetch_into(depot_stack_handle_t handle,
+				    unsigned long *entries,
+				    unsigned int max_entries)
+{
+	struct stack_record *stack;
+	unsigned int nr_entries;
+
+	if (!handle)
+		return 0;
+	if (stack_depot_disabled)
+		return 0;
+	if (WARN_ON_ONCE(!entries || !max_entries))
+		return 0;
+
+	stack = depot_fetch_stack(handle);
+	if (!stack)
+		return 0;
+	nr_entries = stack->size;
+	if (WARN_ON_ONCE(!nr_entries))
+		return 0;
+	if (nr_entries > max_entries)
+		return 0;
+
+	memcpy(entries, stack->entries, nr_entries * sizeof(*entries));
+	kmsan_unpoison_memory(entries, nr_entries * sizeof(*entries));
+	return nr_entries;
+}
+EXPORT_SYMBOL_GPL(stack_depot_fetch_into);
+
 void stack_depot_put(depot_stack_handle_t handle)
 {
 	struct stack_record *stack;
diff --git a/lib/tests/Makefile b/lib/tests/Makefile
index df0537e1b91f..bc6532d88150 100644
--- a/lib/tests/Makefile
+++ b/lib/tests/Makefile
@@ -49,6 +49,7 @@ obj-$(CONFIG_RANDSTRUCT_KUNIT_TEST) += randstruct_kunit.o
 obj-$(CONFIG_SCANF_KUNIT_TEST) += scanf_kunit.o
 obj-$(CONFIG_SEQ_BUF_KUNIT_TEST) += seq_buf_kunit.o
 obj-$(CONFIG_SLUB_KUNIT_TEST) += slub_kunit.o
+obj-$(CONFIG_STACKDEPOT_KUNIT_TEST) += stackdepot_kunit.o
 obj-$(CONFIG_TEST_SORT) += test_sort.o
 CFLAGS_stackinit_kunit.o += $(call cc-disable-warning, switch-unreachable)
 obj-$(CONFIG_STACKINIT_KUNIT_TEST) += stackinit_kunit.o
diff --git a/lib/tests/stackdepot_kunit.c b/lib/tests/stackdepot_kunit.c
new file mode 100644
index 000000000000..b0c44c096976
--- /dev/null
+++ b/lib/tests/stackdepot_kunit.c
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <kunit/test.h>
+#include <linux/array_size.h>
+#include <linux/gfp.h>
+#include <linux/stackdepot.h>
+#include <linux/string.h>
+
+static void stackdepot_fetch_into_roundtrip(struct kunit *test)
+{
+	unsigned long entries[] = {
+		0x101000UL,
+		0x102000UL,
+		0x103000UL,
+	};
+	unsigned long exact[ARRAY_SIZE(entries)] = {};
+	unsigned long fetched[ARRAY_SIZE(entries) + 1] = {
+		[ARRAY_SIZE(entries)] = 0xa5a5a5a5UL,
+	};
+	unsigned long expected_tail = fetched[ARRAY_SIZE(entries)];
+	depot_stack_handle_t handle;
+	unsigned int nr_entries;
+
+	KUNIT_ASSERT_EQ(test, stack_depot_init(), 0);
+
+	handle = stack_depot_save(entries, ARRAY_SIZE(entries), GFP_KERNEL);
+	KUNIT_ASSERT_NE(test, handle, (depot_stack_handle_t)0);
+
+	nr_entries = stack_depot_fetch_into(handle, exact, ARRAY_SIZE(exact));
+	KUNIT_EXPECT_EQ(test, nr_entries, (unsigned int)ARRAY_SIZE(entries));
+	KUNIT_EXPECT_MEMEQ(test, exact, entries, sizeof(entries));
+
+	nr_entries = stack_depot_fetch_into(handle, fetched, ARRAY_SIZE(fetched));
+	KUNIT_EXPECT_EQ(test, nr_entries, (unsigned int)ARRAY_SIZE(entries));
+	KUNIT_EXPECT_MEMEQ(test, fetched, entries, sizeof(entries));
+	KUNIT_EXPECT_EQ(test, fetched[ARRAY_SIZE(entries)], expected_tail);
+}
+
+static void stackdepot_fetch_into_rejects_missing_or_short_stack(struct kunit *test)
+{
+	unsigned long entries[] = {
+		0x111000UL,
+		0x112000UL,
+		0x113000UL,
+	};
+	unsigned long fetched[ARRAY_SIZE(entries)] = {
+		0xa1a1a1a1UL,
+		0xb2b2b2b2UL,
+		0xc3c3c3c3UL,
+	};
+	unsigned long expected[ARRAY_SIZE(fetched)];
+	depot_stack_handle_t handle;
+	unsigned int nr_entries;
+
+	KUNIT_ASSERT_EQ(test, stack_depot_init(), 0);
+
+	handle = stack_depot_save(entries, ARRAY_SIZE(entries), GFP_KERNEL);
+	KUNIT_ASSERT_NE(test, handle, (depot_stack_handle_t)0);
+	memcpy(expected, fetched, sizeof(expected));
+
+	nr_entries = stack_depot_fetch_into(0, fetched, ARRAY_SIZE(fetched));
+	KUNIT_EXPECT_EQ(test, nr_entries, 0U);
+	KUNIT_EXPECT_MEMEQ(test, fetched, expected, sizeof(expected));
+
+	nr_entries = stack_depot_fetch_into(0, NULL, 0);
+	KUNIT_EXPECT_EQ(test, nr_entries, 0U);
+
+	nr_entries = stack_depot_fetch_into(handle, fetched,
+					    ARRAY_SIZE(fetched) - 1);
+	KUNIT_EXPECT_EQ(test, nr_entries, 0U);
+	KUNIT_EXPECT_MEMEQ(test, fetched, expected, sizeof(expected));
+}
+
+static struct kunit_case stackdepot_test_cases[] = {
+	KUNIT_CASE(stackdepot_fetch_into_roundtrip),
+	KUNIT_CASE(stackdepot_fetch_into_rejects_missing_or_short_stack),
+	{}
+};
+
+static struct kunit_suite stackdepot_test_suite = {
+	.name = "stackdepot",
+	.test_cases = stackdepot_test_cases,
+};
+
+kunit_test_suite(stackdepot_test_suite);
+
+MODULE_DESCRIPTION("KUnit tests for stack depot");
+MODULE_AUTHOR("Caleb Kan <ckan@cloudflare.com>");
+MODULE_LICENSE("GPL");
-- 
2.43.0

