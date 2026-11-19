Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102333;
	b=HFS7k+C+MEZmJzp5ixKDxDPDRqSSJVfXiVXmLKXQf8mJQyESOosebr1JeQzG5y7E99/4
	 2cp8cXfHtyMr7KoWOQKIShQIA3dXhm3UwakH+a7XAUdy5bCHjE5sBqFtjlePCyaqV9BmU
	 e3iFsD1O8imfHKTrUeIB348vXo0Fd78/kgypcntXtM+RRPP0/82ivZ+koPYoqcF3MU2BM
	 PudFEPupD7qNCNkV8y1UK7iChBy2bmpcRzvFtr3OYmk2gsrJfkZMc4UO60TKL+JJLakWy
	 6nShVqSTn4HYrcPNcPsYvaCwEHOUTbY6GX+d+S7ms1cn0jYwDNO3OlogmuNJoPc7rxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102333;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OKLsDxKgeNyTR2N6X6bMkhCfSN7v5jMUZuKftv1qAXY=;
	b=sBKSrYhfTbKCSSI8VzO0TfmTCqfjkMmbWVmu+7izF9WV1dyRmw4n7xzSKeNEf9e08K0y
	 BRHF9GNPpkywagEGFitIEpoZUlGYt8byBdHtJakU3x1LxWo2dwnwEf3vje/fNlz3qmsPj
	 sCgxVQdzJbIM0csj8JCRmV2GwDtbY4iW4RtV1JM18ue5nCrmKnUdX1sN+YgCOiQwk9yHY
	 X2N36+GkruBQt91b5XcfGKhG0KUXjdGZaql4pBWFTca0Da9ZHV9gL4hK4ZU2GTxlTDLdq
	 /BfdiJIaMA+BpbBR2w37HWxjXZHGq+S/GfjjGGrUt2un2sNpeLELFKVU6eTcgPCVmzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=readmodwrite.com;
	spf=none smtp.mailfrom=readmodwrite.com;
	dkim=pass header.d=readmodwrite-com.20260707.gappssmtp.com header.i=@readmodwrite-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KrDSJYpP;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B3B606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:32:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33B3B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readmodwrite-com.20260707.gappssmtp.com header.i=@readmodwrite-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KrDSJYpP
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b4bd3d98bfso3121810a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=readmodwrite-com.20260707.gappssmtp.com; s=20260707; t=1795102331; x=1795707131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OKLsDxKgeNyTR2N6X6bMkhCfSN7v5jMUZuKftv1qAXY=;
        b=KrDSJYpPDSlJdGGvfyWOB7kXWIWd2LDBlXre6sKC8UQiFugxdo489z5YMfo3sKi21G
         JizNm/6m2oFJtCq6izjlTmeEiEMeQ1RptM/GBuvmVtasgHHYaThCj1BZiFDBFCGj7/Wb
         7v3hMpEVoJk8nXJEaJ8hQgHpGV0i6apwrGzyfU5CFA9a9yQOQcfvS4soT7zRZUrCEL/u
         p2nE6aQwnPN16PCEpOsHdzBHTDXljQl2mmevmlO4jyuU1IRhnzXJzb/XxSCOEvy3mkT7
         23f0sjWwPyxEN3O/vZG5IiaJ6fLCZ1N5iY5+V7KfO10upbBH27bmHD8AjhjQQRFGvmex
         a+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795102331; x=1795707131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OKLsDxKgeNyTR2N6X6bMkhCfSN7v5jMUZuKftv1qAXY=;
        b=rb7nEM97Zk3/x8IDu1g2jYVjJJNN7J8aPE/6n7ZgqgTJW9SYW1bhN2zX+2u41WLArU
         bCOeX2D7dj8gnjAf0HudwHDUHv8wdMMvrJ1BWGMaXfy40oQV0EsKCsqd1AiLF7MiS5V+
         Nb7+zGBdHrJk142IbV21MacTsOcch4Hg8XWVgDWC28cc52QKnzBkYxysJqVkGqOXCnMh
         Hml0WMaiUXdBeGG7uCGLie0GGs0IclS4XwNGO2np5CKZ3tmnV1UllPY8xZIQD2NsFHet
         48LLFu5c6nTMYZTOPtIMr4s95Xec+a8IWDIb/UfGAE/gl9jhzC34He0MSklSAfSEbwxG
         1fqA==
X-Forwarded-Encrypted: i=1; AL+hErGhe6iZaVE59TPfjXyu7Y+oBX9Oe7POZD/8GHlbYCffX0sOu34kiDeJN7xPQbrlZBp7sNPxV9BUFD9OrJ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9K6dQu81q1B5RLZHYxDUg+CAPMEj1qwM+MKVqduEh/zxxEc5iw
	hsD8y2vxi+6h+Qz1B553B4m3vk8JpR2tXj3F75zO4a/9PJKTfRcpHr1OVntl5nthhU8=
X-Gm-Gg: AYBFou2/ybJmJRpNxhQQz05XExDRBFU5/XuTn/QEWoSK4s0juiNomDLvRYnzSPb+r2m
	mDqja8herTNs72KsaiRqhmW4hpgurCPlwLYho1/VorpGkHLpAzQ4kVlcs8Xn4+pmRrS28DOq10H
	9UETmMt6R6hheKtfOfBytA5ZWw3eXMVbK5tnKWChN+AfgzmrW6OGuGoNqHEcL5z3hZnd7WWNPGl
	tdsppIeI5ZUQYGeeZHmQ1N37mfmhE+prJ+QW3DhkzMsfR24Onh6LtHxJPgUjU3pit1oCp6fNz0O
	tGB4gALttST6UPeLh+m2awStIo0sRLK/00+eNUWa+cBXRtXFSnRB7bPR7qc65DG9iCZVDdqiqcV
	QCm7kasYu/NSjuMHbJ/0k8Uu2LksZKOEnkqLqCMlVlPu7s6Qu604UdeNt76QxSPC6cBwmlBO3Bu
	JloWhliPxDIjFUItRqrdFl5xrHSSFFHQwLUOftKdkuFR4SFN6qm6f/+eM2voHUeUp1brtkfJf0g
	loGSloJBVTVs17b7B6TrArvqeu6fZm49MDM1GqIyRupmkrQry7GBJX+bLPJMTT3hRVmxHa/eH15
	0fxBmTjobyrGv0HKnh9LqezoTPtETT4ZkOZtRX77pzMwQKzYAHuh
X-Received: by 2002:a05:6402:1d4c:b0:6b9:c43e:19df with SMTP id 4fb4d7f45d1cf-6b9c43e2326mr2926798a12.41.1795102331068;
        Thu, 19 Nov 2026 07:32:11 -0800 (PST)
Received: from matt-Precision-5490.. ([2a09:bac6:37a8:294b::41d:4e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb41f4sm237463f8f.7.2026.11.19.07.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:32:10 -0800 (PST)
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
	Matt Fleming <mfleming@cloudflare.com>
Subject: [PATCH v4 07/10] stackdepot: Remove stack_depot_fetch()
Date: Thu, 19 Nov 2026 15:31:40 +0000
Message-ID: <20261119153143.4099483-8-matt@readmodwrite.com>
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

From: Matt Fleming <mfleming@cloudflare.com>

All callers now use stack_depot_fetch_into(), stack_depot_print() or
stack_depot_snprint(). stack_depot_fetch() hands out a pointer into
depot storage, which leaks how frames are stored internally by
stackdepot. This will be undesirable when compressed frame support
lands in a later patch.

Add a KUnit test that stack_depot_snprint() output and return value
match stack_trace_snprint(), including truncation.

Signed-off-by: Matt Fleming <mfleming@cloudflare.com>
---
 include/linux/stackdepot.h   | 11 ------
 lib/stackdepot.c             | 68 ++++++++++++++++--------------------
 lib/tests/stackdepot_kunit.c | 36 +++++++++++++++++++
 3 files changed, 66 insertions(+), 49 deletions(-)

diff --git a/include/linux/stackdepot.h b/include/linux/stackdepot.h
index 734529767c8a..dcc2e1d21f92 100644
--- a/include/linux/stackdepot.h
+++ b/include/linux/stackdepot.h
@@ -188,17 +188,6 @@ depot_stack_handle_t stack_depot_save(unsigned long *entries,
  */
 struct stack_record *__stack_depot_get_stack_record(depot_stack_handle_t handle);
 
-/**
- * stack_depot_fetch - Fetch a stack trace from stack depot
- *
- * @handle:	Stack depot handle returned from stack_depot_save()
- * @entries:	Pointer to store the address of the stack trace
- *
- * Return: Number of frames for the fetched stack
- */
-unsigned int stack_depot_fetch(depot_stack_handle_t handle,
-			       unsigned long **entries);
-
 /**
  * stack_depot_fetch_into - Fetch a stack trace into caller-owned storage
  *
diff --git a/lib/stackdepot.c b/lib/stackdepot.c
index 556f3ecdcc8f..8f1aaa0c6d88 100644
--- a/lib/stackdepot.c
+++ b/lib/stackdepot.c
@@ -757,33 +757,14 @@ struct stack_record *__stack_depot_get_stack_record(depot_stack_handle_t handle)
 	return depot_fetch_stack(handle);
 }
 
-unsigned int stack_depot_fetch(depot_stack_handle_t handle,
-			       unsigned long **entries)
+/* Copy the first @nr_entries frames of @stack into @entries. */
+static void depot_copy_entries(const struct stack_record *stack,
+			       unsigned long *entries, unsigned int nr_entries)
 {
-	struct stack_record *stack;
-
-	*entries = NULL;
-	/*
-	 * Let KMSAN know *entries is initialized. This shall prevent false
-	 * positive reports if instrumented code accesses it.
-	 */
-	kmsan_unpoison_memory(entries, sizeof(*entries));
-
-	if (!handle || stack_depot_disabled)
-		return 0;
-
-	stack = depot_fetch_stack(handle);
-	/*
-	 * Should never be NULL, otherwise this is a use-after-put (or just a
-	 * corrupt handle).
-	 */
-	if (WARN(!stack, "corrupt handle or use after stack_depot_put()"))
-		return 0;
-
-	*entries = stack->entries;
-	return stack->size;
+	memcpy(entries, stack->entries, nr_entries * sizeof(*entries));
+	/* stackdepot.c is not instrumented; tell KMSAN the copy is initialized. */
+	kmsan_unpoison_memory(entries, nr_entries * sizeof(*entries));
 }
-EXPORT_SYMBOL_GPL(stack_depot_fetch);
 
 unsigned int stack_depot_fetch_into(depot_stack_handle_t handle,
 				    unsigned long *entries,
@@ -808,12 +789,27 @@ unsigned int stack_depot_fetch_into(depot_stack_handle_t handle,
 	if (nr_entries > max_entries)
 		return 0;
 
-	memcpy(entries, stack->entries, nr_entries * sizeof(*entries));
-	kmsan_unpoison_memory(entries, nr_entries * sizeof(*entries));
+	depot_copy_entries(stack, entries, nr_entries);
 	return nr_entries;
 }
 EXPORT_SYMBOL_GPL(stack_depot_fetch_into);
 
+static struct stack_record *depot_print_fetch(depot_stack_handle_t handle)
+{
+	struct stack_record *stack;
+
+	if (!handle || stack_depot_disabled)
+		return NULL;
+
+	stack = depot_fetch_stack(handle);
+	/*
+	 * Should never be NULL, otherwise this is a use-after-put (or just a
+	 * corrupt handle).
+	 */
+	WARN(!stack, "corrupt handle or use after stack_depot_put()");
+	return stack;
+}
+
 void stack_depot_put(depot_stack_handle_t handle)
 {
 	struct stack_record *stack;
@@ -834,26 +830,22 @@ void stack_depot_put(depot_stack_handle_t handle)
 }
 EXPORT_SYMBOL_GPL(stack_depot_put);
 
-void stack_depot_print(depot_stack_handle_t stack)
+void stack_depot_print(depot_stack_handle_t handle)
 {
-	unsigned long *entries;
-	unsigned int nr_entries;
+	struct stack_record *stack = depot_print_fetch(handle);
 
-	nr_entries = stack_depot_fetch(stack, &entries);
-	if (nr_entries > 0)
-		stack_trace_print(entries, nr_entries, 0);
+	if (stack)
+		stack_trace_print(stack->entries, stack->size, 0);
 }
 EXPORT_SYMBOL_GPL(stack_depot_print);
 
 int stack_depot_snprint(depot_stack_handle_t handle, char *buf, size_t size,
 		       int spaces)
 {
-	unsigned long *entries;
-	unsigned int nr_entries;
+	struct stack_record *stack = depot_print_fetch(handle);
 
-	nr_entries = stack_depot_fetch(handle, &entries);
-	return nr_entries ? stack_trace_snprint(buf, size, entries, nr_entries,
-						spaces) : 0;
+	return stack ? stack_trace_snprint(buf, size, stack->entries,
+					   stack->size, spaces) : 0;
 }
 EXPORT_SYMBOL_GPL(stack_depot_snprint);
 
diff --git a/lib/tests/stackdepot_kunit.c b/lib/tests/stackdepot_kunit.c
index b0c44c096976..ae4f7661a48f 100644
--- a/lib/tests/stackdepot_kunit.c
+++ b/lib/tests/stackdepot_kunit.c
@@ -3,6 +3,8 @@
 #include <kunit/test.h>
 #include <linux/array_size.h>
 #include <linux/gfp.h>
+#include <linux/minmax.h>
+#include <linux/stacktrace.h>
 #include <linux/stackdepot.h>
 #include <linux/string.h>
 
@@ -71,9 +73,43 @@ static void stackdepot_fetch_into_rejects_missing_or_short_stack(struct kunit *t
 	KUNIT_EXPECT_MEMEQ(test, fetched, expected, sizeof(expected));
 }
 
+/* stack_depot_snprint() must match stack_trace_snprint(), with truncation. */
+static void stackdepot_snprint_matches_stack_trace(struct kunit *test)
+{
+	const unsigned int nr = min(40, CONFIG_STACKDEPOT_MAX_FRAMES);
+	const size_t size = 4096;
+	unsigned long entries[40];
+	depot_stack_handle_t handle;
+	char *got, *want;
+	unsigned int i;
+
+	for (i = 0; i < nr; i++)
+		entries[i] = 0x301000UL + 0x1000UL * i;
+	got = kunit_kzalloc(test, size, GFP_KERNEL);
+	want = kunit_kzalloc(test, size, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, got);
+	KUNIT_ASSERT_NOT_NULL(test, want);
+
+	KUNIT_ASSERT_EQ(test, stack_depot_init(), 0);
+	handle = stack_depot_save(entries, nr, GFP_KERNEL);
+	KUNIT_ASSERT_NE(test, handle, (depot_stack_handle_t)0);
+
+	KUNIT_EXPECT_EQ(test, stack_depot_snprint(handle, got, size, 2),
+			stack_trace_snprint(want, size, entries, nr, 2));
+	KUNIT_EXPECT_STREQ(test, got, want);
+
+	/* Truncate part-way through the trace. */
+	memset(got, 0, size);
+	memset(want, 0, size);
+	KUNIT_EXPECT_EQ(test, stack_depot_snprint(handle, got, 700, 0),
+			stack_trace_snprint(want, 700, entries, nr, 0));
+	KUNIT_EXPECT_STREQ(test, got, want);
+}
+
 static struct kunit_case stackdepot_test_cases[] = {
 	KUNIT_CASE(stackdepot_fetch_into_roundtrip),
 	KUNIT_CASE(stackdepot_fetch_into_rejects_missing_or_short_stack),
+	KUNIT_CASE(stackdepot_snprint_matches_stack_trace),
 	{}
 };
 
-- 
2.43.0

