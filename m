Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795373110;
	b=kkcgBUe9FgVmhW3cCPQNvoKQ+ux4nPdwSaBxr3fqHjZMDvFYcal4CBPVJglGRrlbPr+3
	 YH0Gpv+glzkSl5Fw4WkqxJEmzovZ0S1HrbTGwz1uZtcIV6rvBZ1zdQTe6tOOFBtIimDEM
	 Vd4O6G/gF/xM37U0HDYXReZlgns1SQ36eI+/VK+mKCJSzI4Epr8qpzfcH8+ld6xv1Ppjo
	 OevLY4Gj1qAFY7NsTUjTOjl9gkXOA832Zkfm28icjp8CNY4dtlFuRiXcJoacnU1LQEHjM
	 LxbwhLFi2tW3LCbZWI+JmpF8sJrvr0t9FnialLas2eHfJVS7qWXhCTzI/8jrgXTybBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795373110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=tjhtu2IQKTqTGBX17Faec5as53bYJgHEh739WAlPWGk=;
	b=Fz7GCcXkSqyO6dSVFeeuf5jf0FFbwnAqJfx5br5n9qIJS7reZUiU5GG/s7lS1YkCQ1fZ
	 J9yuDOi5K2Skhwr6MWE7KI9n9n2OnQXU+ADtCtWqjRLvl1QU6WC9fhw6O/kappy3uHksZ
	 dBxcmgSJ7yaVz+kfm8k9+/zotpRfPp90A4D7sJ58b/WnQFtVpjyd+h9jQfovPabbNGV18
	 MmKm/7IdZgaWs24ClpTeoGWD4vQDvtf6DQLT7AipBlbEV9e71lwWqRTQkLeh3OPBZbLdu
	 gm+KpZE/wU0pP67VlAunjNWOKVEnOScjGAWVJsCNDkOfdABhshFjto8qNOXhLLmE1dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=k0j+vrtW;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3977160A2602
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:45:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3977160A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=k0j+vrtW
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f040c6e0ceso25116035ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795373109; x=1795977909; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tjhtu2IQKTqTGBX17Faec5as53bYJgHEh739WAlPWGk=;
        b=k0j+vrtWjPOJbFM6SuxhmvedIeiCJfuBzz4fngeKsT2PMla0NDJxur6t4/ieLnmBIv
         ryIl25sBTWqbqCzXBmjqjfRlypOVmJzHfphO3I/2cqkg1kPmIwRDFI2IK+3PSuahxQjZ
         pv4PrsfcVxYnHm6hg4mIof4mUrYulMkrE8IRpr9GHh8oTsFDQfIgxPZsbevHn81iRwTK
         6lAtUIzv+PTB8G4VozdrspM9l/5gng3OLnI0oBKisrVlnFMhCGsGQ7ShFfxsSTDNfIAr
         rIE4A9CWjJdfyItqmSrfCsgaypzrDF0DB/FMjNi62hCRbH/XXFhagcIfrgBJVQB74JTL
         7JUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795373109; x=1795977909;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tjhtu2IQKTqTGBX17Faec5as53bYJgHEh739WAlPWGk=;
        b=WhQ2gBFuf3pp1pZ2pXmDMH/srTmwfYT1PBz52BMtipKkgAEVwcqWtunhck0ao55V/l
         1OPy3DdonpfWRqm5LE8TFxHuwpBlNrQIBq3a3bw2sThUNOu7UMpaBc5C78HeUe/MWam2
         Cgrrnrah+hwLd8pGgEbtQQvxv7lu8iwGX9uCgMagdo1Bqc/GDfdDsVFgNWoJ+hfMwmPu
         +TJr8e8FMJs2hTDlZGPLuUU//rxGpWO9tSofwJ+wzl+1fCb96Y4ZGug911ibCE451aOW
         JONspmQiBrxgKJg/8M9FUD/iGIHKuTEmLIcnobGQF73gawGADXEBBJvKHs2dmIxju/Dm
         67fQ==
X-Forwarded-Encrypted: i=1; AL+hErEsSJoC4z53ECwwKluvaoFiFeOYESLBYZKbkNNKG6QAK6/I49iDooyTQzDwbSBkpJCGIm21JpO47ukyZas=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NR+G6Rk3kJc09N4kXPr1yFgrwtDJDpJ6ScF00z5LG8tg0xQTh
	u2P6hrU3yGyFth3908ZU9pPbzkqUjhv7zvBvDUSJpCnzGVb8P0hrzwx38ALuhrVH8aS3h9EJa0c
	0R6yQxldgRRGS7kYlG9SpGA==
X-Received: from pjbmy10.prod.google.com ([2002:a17:90b:4c8a:b0:3b3:79f6:3f84])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2f8f:b0:3b3:ba43:54c3 with SMTP id 98e67ed59e1d1-3b41c942998mr7718358a91.33.1795373109239;
 Sun, 22 Nov 2026 10:45:09 -0800 (PST)
Date: Sun, 22 Nov 2026 18:44:44 +0000
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
Message-ID: <20261122184453.2668189-11-jthoughton@google.com>
Subject: [PATCH v3 10/19] arm64: Implement try_update_vmemmap_pte using the AF trick
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

try_update_vmemmap_pte() must modify vmemmap PTEs without introducing a
time window where other CPUs on the system might fault.

Normally a break-before-make sequence is required to avoid conflicts
with cached translations. However, if we can guarantee that the existing
translation cannot be cached, a BBM sequence is not needed.

Translations with the AF unset may not be cached (see Arm ARM Rule
DWZCQ); the implementation of try_update_vmemmap_pte() on arm64 takes
advantage of this fact to replace a PTE without BBM and therefore
without leaving a window open where PE might fault on this translation.

Of course, if some CPUs on the system do not support HW AF management,
clearing the AF will introduce potential faults.
system_supports_bbm_through_af() will return false if any CPUs on the
system do not support HW AF.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/arm64/include/asm/pgtable.h | 59 +++++++++++++++++++++++++++++---
 1 file changed, 55 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 4285b7e7a6a7..7421c0a048ff 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1249,14 +1249,24 @@ static inline void __pte_clear(struct mm_struct *mm,
 	__set_pte(ptep, __pte(0));
 }
 
-static inline bool __ptep_test_and_clear_young(struct vm_area_struct *vma,
-		unsigned long address, pte_t *ptep)
+/*
+ * Atomically clear the Accessed flag. Return the old value of the PTE.
+ */
+static inline pte_t __ptep_clear_young(pte_t *ptep)
 {
 	atomic64_t *pteval = (atomic64_t *)&pte_val(*ptep);
 	s64 af_mask = PTE_AF;
 
-	/* Atomically clear PTE_AF, checking that it was set before. */
-	return af_mask & atomic64_fetch_andnot_relaxed(af_mask, pteval);
+	/* Atomically clear PTE_AF. */
+	u64 oldval = atomic64_fetch_andnot_relaxed(af_mask, pteval);
+
+	return __pte(oldval);
+}
+
+static inline bool __ptep_test_and_clear_young(struct vm_area_struct *vma,
+		unsigned long address, pte_t *ptep)
+{
+	return pte_young(__ptep_clear_young(ptep));
 }
 
 static inline bool __ptep_clear_flush_young(struct vm_area_struct *vma,
@@ -1921,6 +1931,47 @@ static inline void clear_young_dirty_ptes(struct vm_area_struct *vma,
 
 #endif /* CONFIG_ARM64_CONTPTE */
 
+static inline int try_update_vmemmap_pte(unsigned long addr, pte_t *ptep,
+					 const pte_t pte)
+{
+	const int max_attempts = 16;
+	int attempts = 0;
+	pte_t old_pte;
+
+	if (!system_supports_bbm_through_af())
+		return -EOPNOTSUPP;
+
+	/* This routine is only to be used for valid-to-valid transitions. */
+	if (WARN_ON_ONCE(!pte_valid(pte)))
+		return -EINVAL;
+
+	old_pte = __ptep_get(ptep);
+
+	do {
+		if (WARN_ON_ONCE(!pte_valid(old_pte)))
+			return -EINVAL;
+
+		/* We should never get a contiguous PTE here. */
+		if (WARN_ON_ONCE(pte_valid_cont(old_pte)))
+			return -EINVAL;
+
+		if (pte_young(old_pte)) {
+			/* __ptep_clear_young() returns the overwritten PTE */
+			old_pte = pte_mkold(__ptep_clear_young(ptep));
+
+			flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
+		}
+	/*
+	 * Translations without AF cannot be cached, so we can replace
+	 * them without BBM.
+	 */
+	} while (!try_cmpxchg_relaxed(&pte_val(*ptep), &pte_val(old_pte),
+				      pte_val(pte)) &&
+		 ++attempts < max_attempts);
+
+	return attempts == max_attempts ? -EAGAIN : 0;
+}
+
 #define __HAVE_ARCH_VMAP_PTE_SET_HUGE
 void vmap_pte_set_huge(pte_t *ptep, unsigned long addr, phys_addr_t phys,
 		       pgprot_t prot, unsigned long size);
-- 
2.56.1.809.ga0b61035b5-goog

