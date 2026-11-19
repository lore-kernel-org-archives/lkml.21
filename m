Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102327;
	b=BzAZbzAtfzzzYEj4Nm4+q6wlpVb1ywK+7wEqTpKRWSglr5y6RryT40w5mjG8UzF8qzlO
	 cf9ysTSm3o6GuSUi4SrqBZCbPsHJhkFqcJcl88sPU7TTx0PKBHWz3ul4CauOUVbQ+6okM
	 YMgx5ErhScyNl/KQNJ5IQH4RgGgqjIfWc6Hl+D8Jn2YmJLky2mv+0ERgcyZPqDD1IZ3h8
	 V5HvluOuPnD+Bd6dL0x0rVX572+qVVXWenGtzUXRD5hp0fqR9mq7HssclfBPTC6lOykZT
	 xi5c8BCzXR7HLkvIrXBDX6Rb4FRwVsk1xHDz65IPrdNh185ev7/Iwx31G9RfFAXZy4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102327;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=eMKilXOc8iF9aDdrmQW0L2QZLW9z0erSCAgXdVbBET0=;
	b=dX983vS2fVZ+G3hLsU04DmBVFRMHSk9HnR4IIs3LeBuEqjFWR1VEO6/BQyLnxbD7mXjV
	 TazbLcVBTC397OSY8+9LO7G4VfT1rKFv5DnWgQkOmILduBnThBnaFv+uI/yYPBH7QyKYp
	 lBcrH08ps+xM/1Yc/IM/iwv/gZuoeTnH7NZ3vVlqMFUIkXFQDGCt/j6WA/tKz2fu0zrYU
	 uLQkxWmAHKGZGR2wdC42si/1deEjZgqHTELR0HrLGRvZGztD2P9eWkRmazz1zn0U9b89a
	 HbM+u+qojgiWVcAsynRhI1HKqdcHFiPmYCqsbNZAIGCuNU/oDjlJbGsR7Hcw2gS1Pjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=readmodwrite.com;
	spf=none smtp.mailfrom=readmodwrite.com;
	dkim=pass header.d=readmodwrite-com.20260707.gappssmtp.com header.i=@readmodwrite-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=GN62XAmI;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F35606A333
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:32:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45F35606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readmodwrite-com.20260707.gappssmtp.com header.i=@readmodwrite-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=GN62XAmI
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48dee593f18so2379184f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=readmodwrite-com.20260707.gappssmtp.com; s=20260707; t=1795102326; x=1795707126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eMKilXOc8iF9aDdrmQW0L2QZLW9z0erSCAgXdVbBET0=;
        b=GN62XAmIGNHuoQVfQbAjIV2G6QZ3EuCE6ZzR9R3Rkko4b7SXRpngcUdKR+MezJYL2C
         9m8Er/lQHyg9PRL6bmm/BWel+GMaTTwaFgw/aB7HUtHpcBg3jamkoT8FfdGjpw6cxVdA
         L2nz6GV4sM/mIu72hZybl/kj8dzLC+j/KSDc9JGNU9ADmbYyDDSfaWd5fDWf+tX2hb3E
         RT1az0pB9wwvI9rNcdLVR2HqUs5hw4dBSpmUjFtAesdeNAvpkKEeRDJwtyyvblyn30iy
         6NH6JAfLKp/x4mLwJory+OG97YDwvisj+/Y6oqf44oNJ9kufXoxm7oNBcG+QJ1Tx+QpS
         cdMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795102326; x=1795707126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eMKilXOc8iF9aDdrmQW0L2QZLW9z0erSCAgXdVbBET0=;
        b=V9KVKkNcKQkn7d1aR9x4HB3k9aoVABtXQ5Z125Kmqv/V1jRlg6rdDJhmlMlyt0fBBk
         JysMqDJ+6r8mjY2024T6Wac0Ox3unrttRvgprUVmcADkApqh59BGrXNfCK9VPUUEA0b5
         0mTQw/5dDnR+P/aV+WeBp2HvaCFGK4Q2+gI2VnnnC1urJuDxR1ruCg2ueRea0YWda57K
         4/59oG3dxYtgugFDYlFcirbxWwEi6cGyZ6qNF8Y5B6osyzK7p7/FykGqdF0Vwxh+HQUU
         FYmU1l8XyyPIBsvvlcdtM/QmYV9fhENplcB2+8MEPNjU8EcE2Au0dlxzMYQFRW90571a
         QEjg==
X-Forwarded-Encrypted: i=1; AL+hErFwVMEtdB9q5dAVfIgkPuvx5Z90lppQ7C/EEliU+TjqQs/3CXiaWHOHrrfB+CDFYjv50afndUW1xpe453A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9c8Ui0REIEFvNX6AzYY/lORjyhzxh3cDnwHyUOMyqFN7UnXiMl
	L7ABEq5IFmMsj3zFoXsfxVN1qO2AD4PtKq4bYP5VInwkx8DwjLONlyqmGc5xlKPeYKI=
X-Gm-Gg: AZFdTZe4QZzmAUYA8uVM4IK5OIaQI92b89J1OaSriqd1unrKB8y/O9ZFByvDzJPQVKI
	wpHOPIGVMZJQQmLG8XQ6T6jm2/zJHSXCk3fJgwFN2ZyqkWykGhqLZWbG8D3FLdRA0RRQ2AMGGsP
	OMN3mGPiB9b7tJTb0z33uRFcic26GOyyDApTbHxqIfgOwlFasC8QNjB3PsrNkdAbsHzApqWAVxh
	681cxBAJVW1Bu0uywmYYqgsJsEEQO+2SlBex/BaCUAFzRyGkYpNwQrAdja1oP225TMuTCpXjdVB
	R4Y+93SaVVgYYDwylG/cLbzCH3sU2FMQ8/U4PxO6kQXfedb98If1ng6FpTZB+F7Xnd+6W8qWtp0
	ufz7HkXapuwa+mbvBc8N79aPkuV/9sj9QybO3L8yWBs40bmZIOvXF/EheBMMtWo3w3nfqSumXEF
	0ZbVKMqFtJbRoO8GH7lXp4C++i5D0IRPCeAjq2HyH9+RZ9ZzjyKTpJyzNEE6pv5PLNoAHFQ2rrv
	8ncrF17aNN5xD6HTArsFzMglcoN4U7z/OgfiW8vSPY+75uANYE4w4U1b2z3dknKXvzDaChv/uRg
	IprTuRkEfsi4gnL9Qcf5V0vCLLDQsOc=
X-Received: by 2002:a05:6000:29d4:b0:492:ac00:b3b7 with SMTP id ffacd0b85a97d-4a63928a279mr8773276f8f.27.1795102325605;
        Thu, 19 Nov 2026 07:32:05 -0800 (PST)
Received: from matt-Precision-5490.. ([2a09:bac6:37a8:294b::41d:4e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb41f4sm237463f8f.7.2026.11.19.07.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:32:05 -0800 (PST)
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
Subject: [PATCH v4 03/10] kmsan: use stack_depot_fetch_into() for origin reports
Date: Thu, 19 Nov 2026 15:31:36 +0000
Message-ID: <20261119153143.4099483-4-matt@readmodwrite.com>
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

KMSAN stores ordinary origin stacks and synthetic alloca and chain origins
in stack depot and retains the resulting persistent handles. Once a later
patch stores compressed frames, these handles can refer to records whose
frames must be decompressed before use, while kmsan_print_origin() still
relies on the pointer-returning stack_depot_fetch() API.

Use one KMSAN_STACK_DEPTH array to materialize each origin and chained
stack in turn. Preserve the chain's head and next-origin handles before
reusing the array for the chained stack. The array covers both the regular
save limit and the smaller synthetic records.

Pass the scratch array into a common origin-printing helper. Keep local
storage for standalone kmsan_print_origin() calls, but let kmsan_report()
reuse its existing stack_entries array after printing the report stack.
With x86-64 Clang 19, the regular nested report path uses 752 bytes, below
its 768-byte size before this conversion.

lib/stackdepot.c is uninstrumented, so stack_depot_fetch_into() unpoisons
the successfully copied range before returning it to KMSAN. Remove the
now-redundant explicit unpoisoning of chained entries. Origin depth and
use-after-free metadata remain in the handle's extra bits and are
unchanged.

Update test_stackdepot_roundtrip() to use caller-owned storage while
retaining its frame-count and kmsan_check_memory() checks. This verifies
that the copy-out API returns initialized entries to instrumented callers.

Signed-off-by: Caleb Kan <ckan@cloudflare.com>
[mfleming: reworded for compressed frames]
Signed-off-by: Matt Fleming <mfleming@cloudflare.com>
---
 mm/kmsan/kmsan_test.c |  4 ++--
 mm/kmsan/report.c     | 28 ++++++++++++++++------------
 2 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/mm/kmsan/kmsan_test.c b/mm/kmsan/kmsan_test.c
index 31f47cc4dab4..7c04e4b21873 100644
--- a/mm/kmsan/kmsan_test.c
+++ b/mm/kmsan/kmsan_test.c
@@ -669,7 +669,7 @@ static void test_long_origin_chain(struct kunit *test)
  */
 static void test_stackdepot_roundtrip(struct kunit *test)
 {
-	unsigned long src_entries[16], *dst_entries;
+	unsigned long src_entries[16], dst_entries[16];
 	unsigned int src_nentries, dst_nentries;
 	EXPECTATION_NO_REPORT(expect);
 	depot_stack_handle_t handle;
@@ -680,7 +680,7 @@ static void test_stackdepot_roundtrip(struct kunit *test)
 		stack_trace_save(src_entries, ARRAY_SIZE(src_entries), 1);
 	handle = stack_depot_save(src_entries, src_nentries, GFP_KERNEL);
 	stack_depot_print(handle);
-	dst_nentries = stack_depot_fetch(handle, &dst_entries);
+	dst_nentries = stack_depot_fetch_into(handle, dst_entries, ARRAY_SIZE(dst_entries));
 	KUNIT_EXPECT_TRUE(test, src_nentries == dst_nentries);
 
 	kmsan_check_memory((void *)dst_entries,
diff --git a/mm/kmsan/report.c b/mm/kmsan/report.c
index d6853ce08954..0770658ba932 100644
--- a/mm/kmsan/report.c
+++ b/mm/kmsan/report.c
@@ -83,9 +83,9 @@ static char *pretty_descr(char *descr)
 	return report_local_descr;
 }
 
-void kmsan_print_origin(depot_stack_handle_t origin)
+static void kmsan_print_origin_with_buf(depot_stack_handle_t origin,
+					unsigned long *entries)
 {
-	unsigned long *entries = NULL, *chained_entries = NULL;
 	unsigned int nr_entries, chained_nr_entries, skipnr;
 	void *pc1 = NULL, *pc2 = NULL;
 	depot_stack_handle_t head;
@@ -97,7 +97,8 @@ void kmsan_print_origin(depot_stack_handle_t origin)
 		return;
 
 	while (true) {
-		nr_entries = stack_depot_fetch(origin, &entries);
+		nr_entries =
+			stack_depot_fetch_into(origin, entries, KMSAN_STACK_DEPTH);
 		depth = kmsan_depth_from_eb(stack_depot_get_extra_bits(origin));
 		magic = nr_entries ? entries[0] : 0;
 		if ((nr_entries == 4) && (magic == KMSAN_ALLOCA_MAGIC_ORIGIN)) {
@@ -123,14 +124,10 @@ void kmsan_print_origin(depot_stack_handle_t origin)
 			origin = entries[2];
 			pr_err("Uninit was stored to memory at:\n");
 			chained_nr_entries =
-				stack_depot_fetch(head, &chained_entries);
-			kmsan_internal_unpoison_memory(
-				chained_entries,
-				chained_nr_entries * sizeof(*chained_entries),
-				/*checked*/ false);
-			skipnr = get_stack_skipnr(chained_entries,
-						  chained_nr_entries);
-			stack_trace_print(chained_entries + skipnr,
+				stack_depot_fetch_into(head, entries,
+						       KMSAN_STACK_DEPTH);
+			skipnr = get_stack_skipnr(entries, chained_nr_entries);
+			stack_trace_print(entries + skipnr,
 					  chained_nr_entries - skipnr, 0);
 			pr_err("\n");
 			continue;
@@ -147,6 +144,13 @@ void kmsan_print_origin(depot_stack_handle_t origin)
 	}
 }
 
+void kmsan_print_origin(depot_stack_handle_t origin)
+{
+	unsigned long entries[KMSAN_STACK_DEPTH];
+
+	kmsan_print_origin_with_buf(origin, entries);
+}
+
 void kmsan_report(depot_stack_handle_t origin, void *address, int size,
 		  int off_first, int off_last, const void __user *user_addr,
 		  enum kmsan_bug_reason reason)
@@ -193,7 +197,7 @@ void kmsan_report(depot_stack_handle_t origin, void *address, int size,
 			  0);
 	pr_err("\n");
 
-	kmsan_print_origin(origin);
+	kmsan_print_origin_with_buf(origin, stack_entries);
 
 	if (size) {
 		pr_err("\n");
-- 
2.43.0

