Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102335;
	b=Wn3e8qNxdgl4uIWUkm/b8C5Y9C2EKeWOS31H0+I86Wdcp/ChXFQXozRaqkzo0Od/OyLq
	 NDCiDVHexRMBg+x0Clt7nJ9tp3arPb5Fjdhreagxr81jrZHUpP4/Yvf6B+71oSuDA55Km
	 208pkCSnxDr8kprb09pzYGUknHI1kM9ELt2138SOy4jpW1sSEAWPab3xpwiSuemT3Ttx+
	 ubCazylYl3CC986tm/H91/huPHSNjsL8CpNGEFFUS8WD7czm1OCwoqECcaBbHt41Rf+iQ
	 Lq0+7V8sUKPhEPGwCXM2DdIO9FRtaW7KELvcAj182TvDbTsU3a1DyX1YpiVOChd6otA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102335;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lCP/7rY2NKQ2ZzvQeDCJsA8s2DqcI1dNIAw5F9lcUBY=;
	b=CdkNA0P8JA3d5DPGMk95r9aLftdLr8SfQjnpQVCSoXZBnr1V8unw+/MV7tJx7VJzQ9Ty
	 cNyiegyYHw5VcSNzDvZZMudJeTP/svffwaJFyd3Ev/OclL6E762OoteaPT3HPT7iFJDYj
	 ljDODbEhSBVe3IGtMvfSvCZPycFO4I5ik/CZnDRBsBsoEZUk73lri1muuOHPPzLfyIqzA
	 KMD/2eJu1xJDPrg3v+rirozXDW7+OCTvkxFaza7ZaVzxi7VzmvIylnGlB5bIU1oTV2DWf
	 vPS+EXm6xwWJb2VBpxXB7GhcOaBP1yYJz1iocIKiGTYtaZNWotBHf2YjwyrkaK67XVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=readmodwrite.com;
	spf=none smtp.mailfrom=readmodwrite.com;
	dkim=pass header.d=readmodwrite-com.20260707.gappssmtp.com header.i=@readmodwrite-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=GJIjSIMt;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BED606A338
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:32:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98BED606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readmodwrite-com.20260707.gappssmtp.com header.i=@readmodwrite-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=GJIjSIMt
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so340072866b.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=readmodwrite-com.20260707.gappssmtp.com; s=20260707; t=1795102333; x=1795707133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lCP/7rY2NKQ2ZzvQeDCJsA8s2DqcI1dNIAw5F9lcUBY=;
        b=GJIjSIMteM3vtXkpEjUjklJklUUlLpiJXhJtziyzw08SuGs5l/gvkxUl81yeonkdee
         GFvP/gjevgdTMlk/6UnbsRpbMNpKeRyaMdTtQQfsFf9XUQt8OrKUs3qph5yimoL4FBEO
         t/VaRDqFwJzqYtf7vRrZFK5sBynkkUUVlFxceqwGuL/sH2tIFOTg9u1iZGMdLjprUAPD
         U/Q1s7uZQtu28MCs25yQtDtx+3KHUJbkzB9W7uv0uXgzji7xwvNI2xXlfanEhpztt7SV
         0bcyCqX4EAWuXZ31sA+x/W2nIgl3J7VXZzOqtD+Xk6vmMYzbVbk+uT/7BcSrf5vpBkiN
         Zxfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795102333; x=1795707133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lCP/7rY2NKQ2ZzvQeDCJsA8s2DqcI1dNIAw5F9lcUBY=;
        b=as1ErCPFOxDFGV4Tx4kypXtPt5JehFhnrugU8DY+rcBJMm/Gp8J4uMe7J6FdkYgLDu
         1scNFUSRXpYUqZpNnD+9Z0MXMt0lyuHhfjBRNNm9zyGI5NaWoqFIBof1e7PS5Tnph7VZ
         XKMUQJJ2IVG9hIBYSZqDIEpaJJJMekivgSpe8kVJeKaYtwEK9TuK+Zx+tOIdefflQKN1
         AqiAuiVDzR6ZYmq25yax6hs9NriJpe8SSi3tpZREHGJgPeKhxaM/kKV45/nwiojHD02M
         3+9mh1OJR4ajL7yZN7FVLOscJlgab92w4ZjX0mgOk/KOMU07ppClVjKusMO29vdC6RrK
         +Z5A==
X-Forwarded-Encrypted: i=1; AL+hErEp1G90+VGP1rZgZPEMmKcwzVpaaldtqvIZW5mSuCLAnL9J4OuMSI8NRUZKxgi454BsMLYntEgg25rUbas=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Hqj9jTtgdyAas2DJZhAzapECDKvYEfsFKGyhIsyDNe5ao6Zon
	Y5UXDxJFlJ76I7kXIb1/b7XX+sYpCI1pidZPl/bE9JaQ3/qvqGohVloOp7ibocKjGjs=
X-Gm-Gg: AYBFou3bHhbUvTKoHQIb9cCdsc3lHIRenQuOAGUlLqDsnECLZWcASAyEgMJySI0LZJd
	RTvYcnfYZa/d69BbJZ1pXLnerB/2z6d+UHx+vaX8XwdkQSDvgxl9rF0VmFPIYtRIqigXtxg2At8
	8g3N2nf8fKoozI8i6UeBQZYJWvAP/Rx2gjd8/TG6cQI3TiI7qMZ+Jbp60vtHycKpq7nfvIehX3s
	LpNltCTwBkNdCIPUMcZm1JwglLsooV/S+i0dfrfc7EBEj/oTXdM6p+wUNq9/0TpDjGexbJ73Apq
	pOP/pUrfxoc78TJbH5k5voxdlotGJ1oJSM3gi7sWJxdUP0Dg8CAZEQUSabrdC3ffpJg5aAj7ts7
	Xe0Ni1GVLd8HTcSSpz3EhoXmvJjjHzknRe6yvy5DUEjzg9f3ntxE7g8hYT9dv8PgsN+1i9zeuLI
	e5/ZVux/XHaf7Z79hlKbBpKuB5xhWlg4SGfMhnLBAvKVkLm+B0H7zYBX2RFCA5qZ1xE+GZYayJ8
	KHlCdIOZCEwgdpXaRZgNw9mTZIoBmTd9xC/ISvfU8K2kIUKE75RyCRqnKhNTvQnqHtpmf2PTvHM
	7ZL4xPmlgqa2ZNtTQna68ENZ0x2K1Rs=
X-Received: by 2002:a17:906:bccf:b0:c4d:2888:f373 with SMTP id a640c23a62f3a-c513aac3edfmr19947166b.41.1795102332799;
        Thu, 19 Nov 2026 07:32:12 -0800 (PST)
Received: from matt-Precision-5490.. ([2a09:bac6:37a8:294b::41d:4e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb41f4sm237463f8f.7.2026.11.19.07.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:32:12 -0800 (PST)
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
Subject: [PATCH v4 08/10] stackdepot: add architecture hooks for compact frame storage
Date: Thu, 19 Nov 2026 15:31:41 +0000
Message-ID: <20261119153143.4099483-9-matt@readmodwrite.com>
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

Stack depot records can reduce their frame storage when an
architecture can represent kernel text and module addresses in 32 bits.
Add architecture hooks that compress a frame only when decompression
reproduces the original address exactly.

Store arm64 frames as signed 32-bit offsets from _text. This covers the
2 GB module relocation window without depending on a 4 GB high-bit
boundary. On x86-64, store the low 32 bits when the upper 32 bits are all
set. Keep other frames full-width, and provide a generic implementation
that always rejects compression.

Make the generic header available to architectures without a specialized
implementation and wire it explicitly for UML. Add KUnit coverage for raw
fallback, arm64 boundary round trips, and native x86-64 prefix compression.

These hooks do not change stack depot behavior until a later patch uses
them to store compressed frames.

Signed-off-by: Caleb Kan <ckan@cloudflare.com>
[mfleming: Address sashiko feedback and zero *frame in generic hook]
Signed-off-by: Matt Fleming <mfleming@cloudflare.com>
---
 arch/arm64/include/asm/stackdepot.h | 37 +++++++++++++
 arch/um/include/asm/Kbuild          |  1 +
 arch/x86/include/asm/stackdepot.h   | 37 +++++++++++++
 include/asm-generic/Kbuild          |  1 +
 include/asm-generic/stackdepot.h    | 20 +++++++
 lib/tests/stackdepot_kunit.c        | 86 +++++++++++++++++++++++++++++
 6 files changed, 182 insertions(+)
 create mode 100644 arch/arm64/include/asm/stackdepot.h
 create mode 100644 arch/x86/include/asm/stackdepot.h
 create mode 100644 include/asm-generic/stackdepot.h

diff --git a/arch/arm64/include/asm/stackdepot.h b/arch/arm64/include/asm/stackdepot.h
new file mode 100644
index 000000000000..72053527ab21
--- /dev/null
+++ b/arch/arm64/include/asm/stackdepot.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_STACKDEPOT_H
+#define __ASM_STACKDEPOT_H
+
+#include <linux/types.h>
+#include <asm/sections.h>
+
+/*
+ * Modules are allocated inside a 2 GB relocation window containing the
+ * kernel image. Store a signed 32-bit offset from _text so compression is
+ * independent of 4 GB high-bit boundaries crossed by that window.
+ */
+static inline unsigned long arch_stack_depot_frame_from_payload(u32 payload)
+{
+	return (unsigned long)_text + (s64)(s32)payload;
+}
+
+static inline bool
+arch_stack_depot_frame_try_compress(unsigned long frame, u32 *payload)
+{
+	u32 candidate;
+
+	candidate = (u32)(frame - (unsigned long)_text);
+	if (arch_stack_depot_frame_from_payload(candidate) != frame)
+		return false;
+
+	*payload = candidate;
+	return true;
+}
+
+static inline void
+arch_stack_depot_frame_decompress(u32 payload, unsigned long *frame)
+{
+	*frame = arch_stack_depot_frame_from_payload(payload);
+}
+
+#endif /* __ASM_STACKDEPOT_H */
diff --git a/arch/um/include/asm/Kbuild b/arch/um/include/asm/Kbuild
index 8fdc0bd9ab6f..14778d2457d7 100644
--- a/arch/um/include/asm/Kbuild
+++ b/arch/um/include/asm/Kbuild
@@ -21,6 +21,7 @@ generic-y += preempt.h
 generic-y += ring_buffer.h
 generic-y += runtime-const.h
 generic-y += softirq_stack.h
+generic-y += stackdepot.h
 generic-y += switch_to.h
 generic-y += topology.h
 generic-y += trace_clock.h
diff --git a/arch/x86/include/asm/stackdepot.h b/arch/x86/include/asm/stackdepot.h
new file mode 100644
index 000000000000..9a8d04fa8c1c
--- /dev/null
+++ b/arch/x86/include/asm/stackdepot.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_X86_STACKDEPOT_H
+#define _ASM_X86_STACKDEPOT_H
+
+#include <linux/types.h>
+
+#ifdef CONFIG_X86_64
+/*
+ * Compress canonical kernel text/module addresses whose upper 32 bits are all
+ * ones. Other kernel virtual addresses stay raw, so decompression reconstructs
+ * the original frame by restoring this prefix.
+ */
+#define STACK_DEPOT_X86_64_FRAME_PREFIX	0xffffffff00000000UL
+#define STACK_DEPOT_X86_64_FRAME_LOW_MASK	0x00000000ffffffffUL
+
+static inline bool
+arch_stack_depot_frame_try_compress(unsigned long frame, u32 *low)
+{
+	if ((frame & ~STACK_DEPOT_X86_64_FRAME_LOW_MASK) !=
+	    STACK_DEPOT_X86_64_FRAME_PREFIX)
+		return false;
+
+	*low = (u32)frame;
+	return true;
+}
+
+static inline void
+arch_stack_depot_frame_decompress(u32 low, unsigned long *frame)
+{
+	*frame = STACK_DEPOT_X86_64_FRAME_PREFIX | low;
+}
+
+#else
+#include <asm-generic/stackdepot.h>
+#endif /* CONFIG_X86_64 */
+
+#endif /* _ASM_X86_STACKDEPOT_H */
diff --git a/include/asm-generic/Kbuild b/include/asm-generic/Kbuild
index b7a388bef6ea..76d4792a325a 100644
--- a/include/asm-generic/Kbuild
+++ b/include/asm-generic/Kbuild
@@ -55,6 +55,7 @@ mandatory-y += serial.h
 mandatory-y += shmparam.h
 mandatory-y += simd.h
 mandatory-y += softirq_stack.h
+mandatory-y += stackdepot.h
 mandatory-y += switch_to.h
 mandatory-y += timex.h
 mandatory-y += tlbflush.h
diff --git a/include/asm-generic/stackdepot.h b/include/asm-generic/stackdepot.h
new file mode 100644
index 000000000000..9246d9c8cdd4
--- /dev/null
+++ b/include/asm-generic/stackdepot.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_GENERIC_STACKDEPOT_H
+#define __ASM_GENERIC_STACKDEPOT_H
+
+#include <linux/types.h>
+
+static inline bool
+arch_stack_depot_frame_try_compress(unsigned long frame, u32 *low)
+{
+	return false;
+}
+
+static inline void
+arch_stack_depot_frame_decompress(u32 low, unsigned long *frame)
+{
+	/* Generic code never compresses frames, so this hook is unreachable. */
+	*frame = 0;
+}
+
+#endif /* __ASM_GENERIC_STACKDEPOT_H */
diff --git a/lib/tests/stackdepot_kunit.c b/lib/tests/stackdepot_kunit.c
index ae4f7661a48f..dc3f8e207bdd 100644
--- a/lib/tests/stackdepot_kunit.c
+++ b/lib/tests/stackdepot_kunit.c
@@ -3,11 +3,23 @@
 #include <kunit/test.h>
 #include <linux/array_size.h>
 #include <linux/gfp.h>
+#include <linux/limits.h>
 #include <linux/minmax.h>
 #include <linux/stacktrace.h>
 #include <linux/stackdepot.h>
 #include <linux/string.h>
 
+#include <asm/stackdepot.h>
+
+#ifdef CONFIG_ARM64
+#include <asm/sections.h>
+
+static inline unsigned long stackdepot_arm64_frame(long offset)
+{
+	return (unsigned long)((long)_text + offset);
+}
+#endif
+
 static void stackdepot_fetch_into_roundtrip(struct kunit *test)
 {
 	unsigned long entries[] = {
@@ -73,6 +85,73 @@ static void stackdepot_fetch_into_rejects_missing_or_short_stack(struct kunit *t
 	KUNIT_EXPECT_MEMEQ(test, fetched, expected, sizeof(expected));
 }
 
+static void stackdepot_frame_raw_fallback(struct kunit *test)
+{
+	unsigned long frame = 0x1000UL;
+	bool compressed;
+	u32 payload;
+
+#ifdef CONFIG_ARM64
+	frame = (unsigned long)_text + (unsigned long)S32_MAX + 1UL;
+#endif
+
+	compressed = arch_stack_depot_frame_try_compress(frame, &payload);
+	KUNIT_EXPECT_FALSE(test, compressed);
+}
+
+#if defined(CONFIG_X86_64) && !defined(CONFIG_UML)
+static void stackdepot_frame_x86_64(struct kunit *test)
+{
+	unsigned long direct_map = 0xffff888000001000UL;
+	unsigned long frame = 0xffffffff81234567UL;
+	unsigned long out;
+	bool compressed;
+	u32 low;
+
+	compressed = arch_stack_depot_frame_try_compress(frame, &low);
+	KUNIT_EXPECT_TRUE(test, compressed);
+	KUNIT_EXPECT_EQ(test, low, (u32)0x81234567);
+	arch_stack_depot_frame_decompress(low, &out);
+	KUNIT_EXPECT_EQ(test, out, frame);
+
+	compressed = arch_stack_depot_frame_try_compress(direct_map, &low);
+	KUNIT_EXPECT_FALSE(test, compressed);
+}
+#endif /* CONFIG_X86_64 && !CONFIG_UML */
+
+#ifdef CONFIG_ARM64
+static void stackdepot_frame_arm64(struct kunit *test)
+{
+	long negative_offset = S32_MIN;
+	long positive_offset = S32_MAX;
+	long offset = 0x123456;
+	unsigned long frame = stackdepot_arm64_frame(offset);
+	unsigned long out;
+	bool compressed;
+	u32 payload;
+
+	compressed = arch_stack_depot_frame_try_compress(frame, &payload);
+	KUNIT_EXPECT_TRUE(test, compressed);
+	KUNIT_EXPECT_EQ(test, payload, (u32)(s32)offset);
+	arch_stack_depot_frame_decompress(payload, &out);
+	KUNIT_EXPECT_EQ(test, out, frame);
+
+	frame = stackdepot_arm64_frame(negative_offset);
+	compressed = arch_stack_depot_frame_try_compress(frame, &payload);
+	KUNIT_EXPECT_TRUE(test, compressed);
+	KUNIT_EXPECT_EQ(test, payload, (u32)(s32)negative_offset);
+	arch_stack_depot_frame_decompress(payload, &out);
+	KUNIT_EXPECT_EQ(test, out, frame);
+
+	frame = stackdepot_arm64_frame(positive_offset);
+	compressed = arch_stack_depot_frame_try_compress(frame, &payload);
+	KUNIT_EXPECT_TRUE(test, compressed);
+	KUNIT_EXPECT_EQ(test, payload, (u32)(s32)positive_offset);
+	arch_stack_depot_frame_decompress(payload, &out);
+	KUNIT_EXPECT_EQ(test, out, frame);
+}
+#endif /* CONFIG_ARM64 */
+
 /* stack_depot_snprint() must match stack_trace_snprint(), with truncation. */
 static void stackdepot_snprint_matches_stack_trace(struct kunit *test)
 {
@@ -110,6 +189,13 @@ static struct kunit_case stackdepot_test_cases[] = {
 	KUNIT_CASE(stackdepot_fetch_into_roundtrip),
 	KUNIT_CASE(stackdepot_fetch_into_rejects_missing_or_short_stack),
 	KUNIT_CASE(stackdepot_snprint_matches_stack_trace),
+	KUNIT_CASE(stackdepot_frame_raw_fallback),
+#if defined(CONFIG_X86_64) && !defined(CONFIG_UML)
+	KUNIT_CASE(stackdepot_frame_x86_64),
+#endif
+#ifdef CONFIG_ARM64
+	KUNIT_CASE(stackdepot_frame_arm64),
+#endif
 	{}
 };
 
-- 
2.43.0

