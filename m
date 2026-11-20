Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795136845;
	b=lxmt1ahsbdIAgzgpOTOleFnz4Ze4AUN0OX9a9NzCaN2THMjhOom10f3wg0ensW8MMBi2
	 MdWAkvsspmljRYwyF+Ys9qjsvp1ALaNN6+MaZ+/9J6sS8S2SwhZrLmbPBE+VN3hOEFbCT
	 g1TtPNrbIFPXuYQ1OEuNy8RdstFBGS11nJWuQ94UZWsoHL2f6ZFyh0BGPoSpIEuExeaaL
	 OE00Y6CCLDQwZ+ooiDa1LyJIa42X9X3FLOFrb9AK5HpZg7/pxJh91jhifpp3pv7eJFJfA
	 Gf3t8FGdPmQZk+uzvqAtxDlMvmItcooS/OJZStmgg1u+G0xioex8kJwLQlzQ/ubGWVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795136845;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=dRkr2BvKaK0JNp+xEr+CP1uqN9jcKW992wqEJ/xsaHY=;
	b=tsTAD3IdqbXoe++8sAxuFChSAqdoouhfrw8PPQExpAEb679KB3DY21Svqzs0qGhwSXpR
	 WZljoCEK0L0EJ/7SRcAkm5Mj97d5QWfzlQnWpcBaiwuersndM25t/WSgqkqnzKH0RwoBl
	 stj0BbyMo5CptSXy+p50yyyfRbL5Y80Z4FNuRmPtkgGd0WdfWRz3jL3adKbJfnG5XGLtZ
	 RKDbUtGZirGAUVhVe7iu/hESIlOP8wz1mgCxSm/NxiwroGz2LtO603Q1kaPHXQP4DpGaQ
	 49PMW2XCoIbtDQBgOwubKXmrjPv0bqFs/8skM6UeFvU9zP7gUTUrfrAoxdn3UPMPzrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--lrizzo.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ES4ennDZ;
	arc=none smtp.remote-ip=209.85.208.71
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512B56072287
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:07:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 512B56072287
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--lrizzo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ES4ennDZ
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-6b9095eeb5bso1951240a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795136843; x=1795741643; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dRkr2BvKaK0JNp+xEr+CP1uqN9jcKW992wqEJ/xsaHY=;
        b=ES4ennDZTflXaeQYEQfAfoxa0BxH02PkL8QJTPLMmiyR8dGrQsgV/SPDpmfK9jWggM
         8PsX/g1+mZvKeuRNgQkM8SEyf2GEO9at10u0q9ywBXwoo9l49k6G4O/x40PqgY030zP/
         igs4cHyJTjN/xg8fABXqLn9FfqPtAL28NK9ZFbdjjzUI7ufY/4gx3bAOAuFk3MLlq7VR
         qpTGXQmaxwPLPGIKBdDahDSf6RCltzeLW6C+1MDEgwNoiZxMqqYB14/uaR1OzpKhQwlL
         S9hgbuZSqmEyW1dCCCazJwkmHAGJfc27Sv+lSoZqyUK6hrlaDOSC4YVeqtW5w+FUWT9B
         kYlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795136843; x=1795741643;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dRkr2BvKaK0JNp+xEr+CP1uqN9jcKW992wqEJ/xsaHY=;
        b=ZwYmgnyEFgqTzMTgxoZVqArBhdDlMTCupApMPFXGlHTyYX6H4pglS0JRb+7VODBdiK
         lP7sIfvY70DImjIjzx80C+/ntmgCgsozfxJUZ52U+OafZbhU50KnIIvCyODZjt6K6PGa
         Z/Z7OwisACbnqS9AKFr9A9pEgPnzDp91X4dBYvv5FroXvqqksXSrCn9g1YxyA4GwgYYM
         qxNGHuJYrPOm4T5Sr6eeB8J8adUFtbpd2Mb2StzGGDGgrktHakXFUXSsXyFDRMCFTjyu
         pLahbZxbkP1Gv81F/BzVo2vXLwlcpt+SsEGHlshAOTMFQFHFy83I/Nqq9qtttWvZZShu
         Pbvw==
X-Forwarded-Encrypted: i=1; AL+hErFubN0c4QrenNumMIC0Bhp98lPGIyEYRw2Bs42dp9Fa6jbx7iuDJk3U0OebzhrxHfb6EoxMK63Frugljkw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PaTYv57F3aUWZQ/XxwxtxWfLUosWuFs0vZoyPNKhY3tQ1+OPt
	D3Oov0nPTJZUHya839FJAe9AyvLiYepNSySLa7+EP4zYkjCRUKP842dESswjChuCrmMlfrht0T6
	BTPHxqw==
X-Received: from ejcfw45.prod.google.com ([2002:a17:907:502d:b0:c50:519f:c790])
 (user=lrizzo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:906:370b:b0:c51:34ae:dd7
 with SMTP id a640c23a62f3a-c5134ae12d8mr166377466b.17.1795136842505; Thu, 19
 Nov 2026 17:07:22 -0800 (PST)
Date: Fri, 20 Nov 2026 01:06:50 +0000
In-Reply-To: <20261120010655.467825-1-lrizzo@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261109182533.3594984-1-lrizzo@google.com> <20261120010655.467825-1-lrizzo@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261120010655.467825-21-lrizzo@google.com>
Subject: [RFC PATCH v3 20/25] arm64/mm, mm: Support decrypted PISA pages in Realms
From: Luigi Rizzo <lrizzo@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Vlastimil Babka <vbabka@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Jens Axboe <axboe@kernel.dk>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Luigi Rizzo <rizzo.unipi@gmail.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>, Harry Yoo <harry@kernel.org>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Hao Li <hao.li@linux.dev>, 
	Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, Jann Horn <jannh@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Simon Horman <horms@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Willem de Bruijn <willemb@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Joshua Washington <joshwash@google.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>, Alexander Lobakin <aleksander.lobakin@intel.com>, 
	Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@ziepe.ca>, Dragos Tatulea <dtatulea@nvidia.com>, 
	Naman Gulati <namangulati@google.com>, Pranjal Shrivastava <praan@google.com>, 
	Mostafa Saleh <smostafa@google.com>, Randy Dunlap <rdunlap@infradead.org>, linux-mm@kvack.org, 
	iommu@lists.linux.dev, netdev@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-api@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Luigi Rizzo <lrizzo@google.com>
Content-Type: text/plain; charset="UTF-8"

An arm64 Realm (ARM CCA guest) only reports CC_ATTR_MEM_ENCRYPT, so PISA
did not treat it as a CoCo guest and refused to initialize there.

Treat a Realm as a CoCo guest: PISA pages are decrypted (shared with the
host) when they are allocated, as on SEV-SNP and TDX.

A decrypted page is mapped with PROT_NS_SHARED, the top IPA bit, set in
the address field of its PTEs. PISA maps such pages into user space with
ordinary PTEs (page cache, migrated user pages, zerocopy receive), and
for those pte_pfn() must be the PFN of the page, or vm_normal_page() and
GUP see a PFN that has no struct page.

Make __pte_to_phys() strip the bit when what is left is a decrypted PISA
page. The check is behind pisa_decrypt_key, so outside CoCo guests it
costs one static branch, and every other shared mapping (ioremap() of
emulated MMIO, swiotlb, DMA mmap) keeps the address it has today.

pisa_decrypt_key and the lookup are exported because pte_pfn() is used
by modules.

Signed-off-by: Luigi Rizzo <lrizzo@google.com>
---
 arch/arm64/include/asm/pgtable.h | 28 ++++++++++++++++++++++++++--
 mm/pisa-meta.c                   |  9 +++++++++
 mm/pisa-node.c                   |  9 +++++++--
 3 files changed, 42 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index a474c9fb485ad..86c60b8f43ae0 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -108,7 +108,7 @@ static inline void arch_leave_lazy_mmu_mode(void)
 			  TLBF_NOBROADCAST | TLBF_NONOTIFY | TLBF_NOWALKCACHE)
 
 #ifdef CONFIG_ARM64_PA_BITS_52
-static inline phys_addr_t __pte_to_phys(pte_t pte)
+static inline phys_addr_t __pte_to_phys_raw(pte_t pte)
 {
 	pte_val(pte) &= ~PTE_MAYBE_SHARED;
 	return (pte_val(pte) & PTE_ADDR_LOW) |
@@ -119,7 +119,7 @@ static inline pteval_t __phys_to_pte_val(phys_addr_t phys)
 	return (phys | (phys >> PTE_ADDR_HIGH_SHIFT)) & PHYS_TO_PTE_ADDR_MASK;
 }
 #else
-static inline phys_addr_t __pte_to_phys(pte_t pte)
+static inline phys_addr_t __pte_to_phys_raw(pte_t pte)
 {
 	return pte_val(pte) & PTE_ADDR_LOW;
 }
@@ -130,6 +130,30 @@ static inline pteval_t __phys_to_pte_val(phys_addr_t phys)
 }
 #endif
 
+#if defined(CONFIG_PISA) && !defined(__DISABLE_EXPORTS)
+DECLARE_STATIC_KEY_FALSE(pisa_decrypt_key);
+bool __pisa_phys_decrypted(phys_addr_t phys);
+#endif
+
+static inline phys_addr_t __pte_to_phys(pte_t pte)
+{
+#if defined(CONFIG_PISA) && !defined(__DISABLE_EXPORTS)
+	/*
+	 * In a Realm, PISA maps its decrypted pages into user space with ordinary
+	 * PTEs. Those have PROT_NS_SHARED, the top IPA bit, set in their address
+	 * field, but pte_pfn() must be the PFN of the page: strip the bit when
+	 * what is left is a decrypted PISA page. Other shared mappings keep it.
+	 */
+	if (static_branch_unlikely(&pisa_decrypt_key) && (pte_val(pte) & PROT_NS_SHARED)) {
+		phys_addr_t phys = __pte_to_phys_raw(__pte(pte_val(pte) & ~PROT_NS_SHARED));
+
+		if (__pisa_phys_decrypted(phys))
+			return phys;
+	}
+#endif
+	return __pte_to_phys_raw(pte);
+}
+
 #define pte_pfn(pte)		(__pte_to_phys(pte) >> PAGE_SHIFT)
 #define pfn_pte(pfn,prot)	\
 	__pte(__phys_to_pte_val((phys_addr_t)(pfn) << PAGE_SHIFT) | pgprot_val(prot))
diff --git a/mm/pisa-meta.c b/mm/pisa-meta.c
index 99c5bc42eed10..b608ef71152af 100644
--- a/mm/pisa-meta.c
+++ b/mm/pisa-meta.c
@@ -189,6 +189,15 @@ bool __is_pisa_direct(phys_addr_t phys, size_t size)
 	       (phys & (PISA_SIZE - 1)) + size <= PISA_SIZE;
 }
 
+#ifdef CONFIG_ARM64
+/* For __pte_to_phys(): true if @phys is in a decrypted PISA page. */
+bool __pisa_phys_decrypted(phys_addr_t phys)
+{
+	return pisa_pfn_flags(PHYS_PFN(phys)) & PISA_DECRYPTED;
+}
+EXPORT_SYMBOL(__pisa_phys_decrypted);
+#endif
+
 /*
  * Update @meta's position on @pa's lists under @pa->lock. When all blocks
  * become available (avail == bpp), either queues @meta to @pisa_free_list (and
diff --git a/mm/pisa-node.c b/mm/pisa-node.c
index 12fbb617c342b..aa4f8759ae5e8 100644
--- a/mm/pisa-node.c
+++ b/mm/pisa-node.c
@@ -36,11 +36,16 @@ unsigned int pisa_reservoir_max __read_mostly = 16;
 
 /* Enabled in CoCo guests by pisa_node_init(): new PISA pages are decrypted for DMA. */
 DEFINE_STATIC_KEY_FALSE(pisa_decrypt_key);
+EXPORT_SYMBOL(pisa_decrypt_key);
 
-/* A confidential guest: PISA pages are decrypted for DMA. A bare-metal SME host is not one. */
+/*
+ * A confidential guest: PISA pages are decrypted for DMA. A bare-metal SME host
+ * is not one. An arm64 Realm only reports CC_ATTR_MEM_ENCRYPT.
+ */
 static bool pisa_coco_guest(void)
 {
-	return cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT);
+	return cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT) ||
+	       (IS_ENABLED(CONFIG_ARM64) && cc_platform_has(CC_ATTR_MEM_ENCRYPT));
 }
 
 /* Memory encryption that PISA cannot handle: neither an SME host nor a guest it decrypts for. */
-- 
2.56.1.809.ga0b61035b5-goog

