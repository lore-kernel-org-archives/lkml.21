Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795373117;
	b=b1cm4cxNS7x1mcg9vUKtHy/El50sOAjmvpL/vFl5sVo+Gh5SuVX4G4iNVs/HL8xy1QJ/
	 Ci0iJofBM/tVYiydo+fDPMnkGnObAVAdrQxh/QFzB6lEkjINsOtu/7s6bQTaRPQKBNhLk
	 TSwE+3zB6lUY6UCZRx3NZQHkvy7bZGIVzIwXCeLqB6CISABhu/p3IUabI1yANmFoUKYus
	 4Kwge0TW0EClKFvAeJcD80sBHyVCWaAdc6BzZ/j4cPnUKpoOCSahCKg4WKzyv/Qq1QxXk
	 xqbByufSY/d7xkKthwJCrz0Dv3Xz5e1Dxga/pJX0w1lGkD66dUuJLCgtTBBm9ugGEvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795373117;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=oqxkE4ochVp788mKakiWH9CZR2y6Ff8i3F/s8pOPTcw=;
	b=DoayODBRhDQFx6ZVv9eyHTQVV7i+ITN7bNKzUUfwiFj6pjoP3gm4OXAs+zb0MVLrUX1l
	 bU69He34ciOH3vjo4dlwbj6Svm2MQxczS0KOzaPtS65CLtltbe3HNikVwe72tg7il32Z8
	 /M7F6U9PPFvZifIzlGYGRv6sDTmbEJlNmPaxF6x6Tl11W58/s8V/MdbNVvSZd4JHrX9i/
	 AdtGr2XqYWXsxOgzf6JiLPYbqv1B8Kvp9l/y62SG3Tw1jSnqv9l5jWp5WeT+pwFj/FU6m
	 RDL9zBLTTDQ+2AMJlor6V2ng74KWqNSFOh6D4mJD2lGDJgguEmIanktZhzO6KXTvr0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ci0BTOKY;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53917606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:45:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53917606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ci0BTOKY
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b456fee3b2so957031a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795373117; x=1795977917; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oqxkE4ochVp788mKakiWH9CZR2y6Ff8i3F/s8pOPTcw=;
        b=ci0BTOKYqSbBg2KmOWtVliagA+WwLTVLbppEJg1Ox+aPw+TXV9lDeSCFllg3LHfMe0
         9+JIM4/LBLOjs78WFYpyPMzD23wkQnl6WYl855Bgx5rwfEdZ4NXHFq7WjxkQ26Ch3Ogy
         vEaVOA2yZX8BYxieHz48VCyx0VsKHfALV2SnPzZZThPjmVHyqDscLOEZYOZ0n/jnOo6K
         fykd38e4oVO4v2PFkdWwv2w+vjHG4a9GWbWxym19oHGxhoCgwWg1wxvondZku35yQC/T
         dgFCNnGzlMYtM/+ZTesO50ihmAmfvs0st4iHRxmtN8i2Obl+7BvgTtIrAEK9RdY81130
         IVnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795373117; x=1795977917;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oqxkE4ochVp788mKakiWH9CZR2y6Ff8i3F/s8pOPTcw=;
        b=XElLLKZ3rR9f8UFPGuhM4djZYrVzHAeo+thyFV9NdauhDgaZEyottB8WgFVOoOtmzh
         6BvE3si+f3Ezx/54EiVlxkkvS+pLNbt7Ff7zXcsw124deOgKhwJScuHTHe8hdAjc1QsX
         0kT8qC3KkyHJYQGP5n93k5cxHfTCyLWmt9n075F9qDUJw1r37MSULjpgEig+6VDY/IMx
         oUFNj5sns4xxLHULXqHibgfCa39BWV3HD0ycFOEBXTjYktY6avH43tzaBH1+IIsA6Xa+
         5rA6VojsujEtB6RGM0PDHEBfZIE46OaOpfZPrJLejzpfDLcpq2HYPgguXbM+/tQEAE6Y
         d0lQ==
X-Forwarded-Encrypted: i=1; AL+hErHTOz1uiY8f3B6Euv2nEWDVwEFEJSyekKVBEZnun8m3pXvw3HgCgzCH+ljAVe8nEU9UtRp578EaSuIk524=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ISzn9Rtw/f1AWk+6whZc1/CZV+o75sN4ALPHVi95h0Jpaz0tT
	OL3w02TBK8/lVDwsf7crpRTmfanh5icSC15EtIbc6uOmR9ovoetqw52KtU3lOjhgrkckx4EaYiI
	jX+F8FykDC12ttUGRZwK6/w==
X-Received: from pjyl12.prod.google.com ([2002:a17:90a:ec0c:b0:3b4:2165:2e77])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:5543:b0:3ac:6fcf:81a2 with SMTP id 98e67ed59e1d1-3b41cb33a0dmr7946054a91.57.1795373116556;
 Sun, 22 Nov 2026 10:45:16 -0800 (PST)
Date: Sun, 22 Nov 2026 18:44:50 +0000
In-Reply-To: <20261122184453.2668189-1-jthoughton@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261122184453.2668189-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261122184453.2668189-17-jthoughton@google.com>
Subject: [PATCH v3 16/19 DO-NOT-MERGE] arm64: Implement try_populate_vmemmap_pmd
 using AF trick
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Nikos Nikoleris <nikos.nikoleris@arm.com>, 
	Linu Cherian <linu.cherian@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	David Hildenbrand <david@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Nanyong Sun <sunnanyong@huawei.com>, Yu Zhao <yuzhao@google.com>, 
	Frank van der Linden <fvdl@google.com>, David Rientjes <rientjes@google.com>, 
	James Houghton <jthoughton@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

This routine is to be used for updating in-use, leaf-level PMDs in the
vmemmap without introducing a window where vmemmap accesses might fault.

Implementing this on arm64 requires some care: use the same access flag
trick that is used for vmemmap PTE updates. HAFT is not needed and the
TLB flushing routine remains identical, as we are not overwriting a
non-leaf PMD.

For systems that support BBML3, there is no need to use the AF
trick.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/arm64/include/asm/pgalloc.h | 51 ++++++++++++++++++++++++++++++--
 1 file changed, 48 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/pgalloc.h b/arch/arm64/include/asm/pgalloc.h
index 0263329fb7b3..7e304f01ce6d 100644
--- a/arch/arm64/include/asm/pgalloc.h
+++ b/arch/arm64/include/asm/pgalloc.h
@@ -124,9 +124,54 @@ pmd_populate(struct mm_struct *mm, pmd_t *pmdp, pgtable_t ptep)
 static inline int try_populate_vmemmap_pmd(unsigned long addr, pmd_t *pmdp,
 					   pte_t *pgtable)
 {
-	/* BBLM3 is required. Its presence has been checked. */
-	pmd_populate_kernel(&init_mm, pmdp, pgtable);
-	return 0;
+	const int max_attempts = 16;
+	int attempts = 0;
+	pmd_t old_pmd, new_pmd;
+
+	if (!system_supports_bbm_through_af())
+		return -EOPNOTSUPP;
+
+	if (system_supports_bbml3()) {
+		/*
+		 * BBML3 allows block->table transitions if the PTEs underneath
+		 * do not conflict with existing, potentially cached
+		 * translations.
+		 */
+		pmd_populate_kernel(&init_mm, pmdp, pgtable);
+		return 0;
+	}
+
+	new_pmd = __pmd(__phys_to_pmd_val(__pa(pgtable)) |
+			PMD_TYPE_TABLE | PMD_TABLE_AF | PMD_TABLE_UXN);
+
+	old_pmd = pmdp_get(pmdp);
+
+	do {
+		if (WARN_ON_ONCE(!pmd_valid(old_pmd)))
+			return -EINVAL;
+
+		if (WARN_ON_ONCE(!pmd_leaf(old_pmd)))
+			return -EINVAL;
+
+		/* We should never get a contiguous PMD here. */
+		if (WARN_ON_ONCE(pmd_cont(old_pmd)))
+			return -EINVAL;
+
+		if (pmd_young(old_pmd)) {
+			/* __ptep_clear_young() returns the overwritten PTE */
+			old_pmd = pte_pmd(pte_mkold(__ptep_clear_young((pte_t *)pmdp)));
+
+			flush_tlb_kernel_range(addr, addr + PMD_SIZE);
+		}
+	/*
+	 * Translations without AF cannot be cached, so we can replace
+	 * them without BBM.
+	 */
+	} while (!try_cmpxchg_relaxed(&pmd_val(*pmdp), &pmd_val(old_pmd),
+				      pmd_val(new_pmd)) &&
+		 ++attempts < max_attempts);
+
+	return attempts == max_attempts ? -EAGAIN : 0;
 }
 
 #endif
-- 
2.56.1.809.ga0b61035b5-goog

