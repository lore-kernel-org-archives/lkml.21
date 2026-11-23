Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795404686;
	b=Zc8fdBJeBCUIE2TnswAvH6vBU7GmY31d7DPCiWRG9PfoRI9xT2Pz5F1840RdO0TTyUzM
	 cTW8KQXLU8HkhHyqJaTDZm39prjSxJT0Qq89SFJEfQbFsX1If8DYu+YevjKW5iUJrAso9
	 JD37xgawXF/Jme2WGo4Pk9ER8V9PzTt+rLrfhw/GVAAWDqmZLy7UEQ5ZxdhEctCh92hvO
	 YlZ4FaTJp2rvC9cKs+w3b4nUWpdOzg3IGn1b3/MG7gyouRm4niQgNNhxnTlttwfVI5SsD
	 rgBMBGtVvJIATQ2No9aU8yF/ZoL9O6c1T9UnizYIpWNre5k3ucu6gQUhOM/pjapJeAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795404686;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ar/2HKjK+NYDL4XIdqT0HePA7oYDrfs2vyoMNJhSjA0=;
	b=VcqBraqi5RICo/oS1JDxF4yLB65H73vV90iKUc450gqi2VMsm0nHRSVN7k9XF+ZM6b6v
	 7xNXCrr1pWO2aTp30A1cFNeVKrbHGxvVMK8BY3o0316WCGVXqOwHlipxTrZzc5nnYWPn2
	 x7jg1SyITH+bIABENh4v5COlwQFkNdr1ejqfI1zSsb+xLItEUgelyejho4teBPNex/McE
	 g2oeBznvJyIp8qVm3b2aQwELDbLbrtpgZkltHMwxW6GlD921TTj6MgPI0ldFIBtSzft5k
	 LMNkU5TFn49YwLKSE+wF3IxYivI0TT+rwWmoBKo1xJVhAYeI3h5ky9iI5Vupt12TUuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=YrgltWNy;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB90606A682
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:31:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CB90606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=YrgltWNy
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cd6b9a2735fso142594a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 19:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795404685; x=1796009485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ar/2HKjK+NYDL4XIdqT0HePA7oYDrfs2vyoMNJhSjA0=;
        b=YrgltWNyVy+bKK49Fpq+t+cUbRnSXxMTJEY5Jnbn/GDPL0DRgqMmGT5NQ+18rJU7NN
         0BoM7kVmJqRpZcv8urL2GzgxYO+oVfMQnq4HtHec4C7YDr3h15BAD08sYaACIDgOUboR
         PtEgFm28eXbI4MYuQa82/uvUyYwqFNBHOyxhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795404685; x=1796009485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ar/2HKjK+NYDL4XIdqT0HePA7oYDrfs2vyoMNJhSjA0=;
        b=DF3imfh2+sLe9hioXlxIsg44gUeLPbINGGW8zbP/LvPxAuR8AoOEmPIPra3qkJQnyd
         lsAY4vlRyo6BXQxcgjpxV6RbAr+qGfz75qm+gdSnUdLzNoAVmK5hC3GbIIPY3W8SwIRK
         i01FA9IvDhuB1RKC7oCXC4NdmrJ/tAhWfzh06kGZT3wi92tsM25dcYipSXxsyesBu4Nn
         c+2UOhGgzLWnpr9JVsrKwKtYEh2JDnUbOrpBU9YesUjlOjAXXtsUH00mJ09IjSCULE3V
         V9KlVJh9v9NkoHE6/yfcPJ7Gkyt2ECKvC9dCwjnpw5Xx4G6OaWL0gUR9rSoq3MNZHHQD
         B27g==
X-Forwarded-Encrypted: i=1; AL+hErEPca4iXJGqquRFA9stzY0eP9WTdF+RzH0xov9NCnmHdqLVayeXs+XhFFAzg6JIuSoHnZcRQcYRgSKbEEE=@vger.kernel.org
X-Gm-Message-State: APuU4Z86Ssd599RNyR/9vFhsYAA1Qzc/OB8pfN61ZJITccGOF542GID+
	RqH2OANU2vk3b2LThocMdW5EAIkqhnBVl7LJyh69FnQQFtZRc3ZbnuAv3hbtQ8sMcQ==
X-Gm-Gg: AZFdTZdr2fCJf9awWEq/DGKSugqPZMzRkuAXqVYnRyWudX4wWTo/dsv5/bTQZqXqfTM
	MQTiMNLZKL6ukp6TvmOSKUwsHX3o0zqwHT0mtxFmOaVzLV2nPsMMkD6N5d5m6Bhmp0pqeodg0UH
	wonqKs3azpKf47bd+vW84kAzPOcpG8/fohs/g/sRqGZl+oHSG0a6Ej4L2FDCEWJtSuh5qx6gzvG
	wAREoKkhC+wuWI5/swGstFMTD8v+Ba1/mDfgYXQw5Qo1JlUwNbsn1fq6k+Z1hSFzyRgKTde6CUm
	wDN5ssFqG5qqi1h76Kn9+Jv/4o7BFNYC8NlL4UMvgVecWk8wzuxhG/NtxPcQ04PKJdzMLhVVcC5
	cmlv1sNIOa6E21bfzW6a8PXCwFtFNnh0XX8l0UkERHPkIaQ7bp079HKtlpGHLT+bEOk5OxAo2Wl
	K5v6+8Z6ZrfA8ZK7r9mDDnVIAv+IZuhXiyW23ykK444sONEwkJtKu5TfaxjWpkI+Aw7gg+tMzgY
	xXFpjYoxFb7Ss/lbY9tYrFU0UwPTsN4xZ6PNsRXzOmD7Ms+fOTHLDYoqfosSwRNqLnq6dYV6SBN
	9SRwCD5YDlMxQnsgneVLtAOeci98LipraR9k7I5S5dYeiW8m6829Mm1wvZnT7ZDZOcjmnA==
X-Received: by 2002:a05:6a20:9f08:b0:3ef:2f72:c7e5 with SMTP id adf61e73a8af0-4014ae6fe31mr16689502637.2.1795404685515;
        Sun, 22 Nov 2026 19:31:25 -0800 (PST)
Received: from localhost (221.247.125.34.bc.googleusercontent.com. [34.125.247.221])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-8c873f16b41sm4720304b3a.56.2026.11.22.19.31.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 19:31:24 -0800 (PST)
From: Jeff Xu <jeffxu@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Jeff Xu <jeffxu@chromium.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Zi Yan <ziy@nvidia.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Marco Elver <elver@google.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Chia-I Wu <olvaffe@gmail.com>,
	Dev Jain <dev.jain@arm.com>,
	Ian Rickards <ian.rickards@arm.com>,
	Jann Horn <jannh@google.com>,
	Jeff Vander Stoep <jeffv@google.com>,
	Jeff Xu <jeffxu@google.com>,
	Kees Cook <kees@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Collingbourne <peter@pcc.me.uk>,
	=?UTF-8?q?Pierre-Cl=C3=A9ment=20Tosi?= <ptosi@google.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Tomasz Figa <tfiga@chromium.org>,
	Will Deacon <will@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Baoquan He <baoquan.he@linux.dev>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Allison Henderson <achender@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-mm@kvack.org,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	fuse-devel@lists.linux.dev,
	kexec@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	rds-devel@oss.oracle.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] mm/kasan/kunit: add page_alloc_skip_kasan test
Date: Sun, 22 Nov 2026 19:31:11 -0800
Message-ID: <20261123033111.2349160-3-jeffxu@chromium.org>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
In-Reply-To: <20261123033111.2349160-1-jeffxu@chromium.org>
References: <20261123033111.2349160-1-jeffxu@chromium.org>
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

Add a KUnit test (page_alloc_skip_kasan) to verify that page allocations
using __GFP_SKIP_KASAN (GFP_KERNEL | __GFP_SKIP_KASAN, GFP_HIGHUSER, and
GFP_HIGHUSER_MOVABLE) under CONFIG_KASAN_HW_TAGS:

1. Reset page_kasan_tag() to KASAN_TAG_KERNEL (0xff) across all sub-pages
   of a high-order allocation, and
2. Return a match-all (0xff) linear-map pointer from page_address() that
   does not trigger a KASAN fault even when the underlying physical
   granules carry a mismatched tag (such as KASAN_TAG_INVALID or
   restored userspace PROT_MTE tags).

Tested on arm64 with CONFIG_KASAN_HW_TAGS under QEMU (virt,mte=on) with
kasan.mode=sync, async and asymm.

Signed-off-by: Jeff Xu <jeffxu@chromium.org>
---
 mm/kasan/kasan_test_c.c | 44 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/mm/kasan/kasan_test_c.c b/mm/kasan/kasan_test_c.c
index f34163e19bd6..72342137bb18 100644
--- a/mm/kasan/kasan_test_c.c
+++ b/mm/kasan/kasan_test_c.c
@@ -380,6 +380,49 @@ static void page_alloc_uaf(struct kunit *test)
 	KUNIT_EXPECT_KASAN_FAIL_READ(test, ((volatile char *)ptr)[0]);
 }
 
+static void page_alloc_skip_kasan_helper(struct kunit *test, gfp_t gfp)
+{
+	struct page *pages;
+	size_t order = 2;
+	char *ptr;
+	size_t i;
+
+	pages = alloc_pages(gfp, order);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pages);
+
+	for (i = 0; i < (1UL << order); i++) {
+		/*
+		 * __GFP_SKIP_KASAN allocations must carry the match-all tag
+		 * in page->flags, and so in page_address(), not a random tag.
+		 */
+		KUNIT_EXPECT_EQ(test, page_kasan_tag(pages + i),
+				(u8)KASAN_TAG_KERNEL);
+
+		ptr = page_address(pages + i);
+		KUNIT_EXPECT_EQ(test, (u8)get_tag(ptr), (u8)KASAN_TAG_KERNEL);
+
+		/*
+		 * The memory tags of such pages are arbitrary: stale poison,
+		 * or tags set by userspace through PROT_MTE. Accesses via
+		 * page_address() must not fault regardless.
+		 */
+		kasan_poison(ptr, PAGE_SIZE, KASAN_TAG_INVALID, false);
+		KUNIT_EXPECT_KASAN_RESULT(test, WRITE_ONCE(*ptr, 0),
+					  "WRITE_ONCE(*ptr, 0)", false);
+	}
+
+	__free_pages(pages, order);
+}
+
+static void page_alloc_skip_kasan(struct kunit *test)
+{
+	KASAN_TEST_NEEDS_CONFIG_ON(test, CONFIG_KASAN_HW_TAGS);
+
+	page_alloc_skip_kasan_helper(test, GFP_KERNEL | __GFP_SKIP_KASAN);
+	page_alloc_skip_kasan_helper(test, GFP_HIGHUSER);
+	page_alloc_skip_kasan_helper(test, GFP_HIGHUSER_MOVABLE);
+}
+
 static void krealloc_more_oob_helper(struct kunit *test,
 					size_t size1, size_t size2)
 {
@@ -2369,6 +2412,7 @@ static struct kunit_case kasan_kunit_test_cases[] = {
 	KUNIT_CASE(kmalloc_large_invalid_free),
 	KUNIT_CASE(page_alloc_oob_right),
 	KUNIT_CASE(page_alloc_uaf),
+	KUNIT_CASE(page_alloc_skip_kasan),
 	KUNIT_CASE(krealloc_more_oob),
 	KUNIT_CASE(krealloc_less_oob),
 	KUNIT_CASE(krealloc_large_more_oob),
-- 
2.56.1.750.gf70dc682cf-goog

