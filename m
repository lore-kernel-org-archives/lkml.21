Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795373098;
	b=2af912oa413DkgmEDBRJHihZc6hAQRCvBT70CLTLpCAehAfHnGGCT/DMtn7jkXRnV0DO
	 zRmD2MZKvkBwJb3tAcdmo6q98Y9AMiEUpLN7xqlY/81NGKTnQZilprcI1fnA2k/oBRdt/
	 EwJIUcZXrv2rPivkbG1eNAINrIgIWSSTzgxbdVacAI4YWJr5UuGGWAOx0e2xfelK89VeN
	 TTo+UbiXtlqxLO4MlnTdrOqtenl0gg55/ov2FTVuR+WRZuWdk+JQoyiPMZJ43eXSa35CH
	 JOWU9K5LxB5ZnMBzNFNu+zvj8NV2tg8DGx+gspymSb0lO7c+bhcXbwCGFyUE2j8dDgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795373098;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=u826aq6QgFuLwy4ZUNvGuXRkf41ETeakzXxIgVKKh+Q=;
	b=bwd6kMC8cbIO1ooSKsMzJXTFL4jvZtKg2hWHTskZfqWwffaFyHBUFQR8SrIhmEMkUoDX
	 TUmtu3Zuq5uDgxg4rOI0uE65wcp4g+3F1bsSBC1DkVvhRpebC2IeSN7ABsp4k2FSyPSTB
	 k3nyL2FBjIz90AvC2VrTxcjbM7wd5rQCOfXoyCGXk0TNcuErpcMjnaiadTMSKh30/YJGF
	 fgVmydjIe4URhez+7VqDUsVg28OVemTrVn8EluDPHPLVYzk7bc1/BPOtL4P2exO8JsorJ
	 VzWHhBOwGE1GTJBjQUjvvNu4mlsltMzf0U2Kjoq4iDttdOysqUhEgvf/oU60Y+4Wctw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=m5Et7FmM;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01FA606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:44:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B01FA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=m5Et7FmM
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b41e8c1ac0so3865332a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795373097; x=1795977897; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u826aq6QgFuLwy4ZUNvGuXRkf41ETeakzXxIgVKKh+Q=;
        b=m5Et7FmMHyCHWyFnHaai1b6Yh0MDMq2TF/N1JQBIdj4AJOCUEN62Pm9rV6ODcv8HLh
         2AaazWy7xCMLeTyxw+2rNJT+8xtB66Ac2H1iKf++Cx6Z0EhgD6NXdoYqiLrityC/nH/m
         Zl4iLwgJbGa6Hm9Fpm7DVQvGV5qu4gQAoupkutoeX9eUXRxhgZ1ZMQAKZZyPnQHEI1LJ
         moRJHX6qSmo4fUBWDoMFMNh20FtPfiudDjsCvbiHXHD9mrZmBUt/EVAi0U41gCbNtA19
         Hg6Sy1JEXIIUhCFV7InAAICAppUl+ypw2zEx52zd+53mqpISa096Nk7TeQiRowa+usvp
         M8eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795373097; x=1795977897;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u826aq6QgFuLwy4ZUNvGuXRkf41ETeakzXxIgVKKh+Q=;
        b=C7IL3DzmIR6qajV7pcHbIlQDumpv4C/o0K2Fqx16YmiH97U2c1v9P9zWyX8Ma2/lKK
         8ZgTe+pFNIKvT95BBSTuzQT+Yckh2Je6XGUfIllZeJz+auJv7OJGqQUT+iE8Ku0BMTsz
         28DXNpdn9rJSYX2jXrRfGiNvq3HSjKMtOh95B136z3n76YHwgapNFtrF5ka35eBXYp0l
         V64JUl5LusziBkc15TE4roRaMXjSm2gyNhX7j7mT2EKOpGawZgxYRGzMBXAI8WTIejLC
         dlytY5hNdATkd08eve4CqCsjiIDsIOzrEvLbZJuNkTR2oON3yNpr+86srNVvfHAD+OfD
         638A==
X-Forwarded-Encrypted: i=1; AL+hErHkqHHs6Lw48iZLMPNXCZ6FHvPo7+nVjZ1UoS0ALqJHF66vSkWAKYROK9iXL+iMqjcW4pD5mTVWMt5LBXQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+S596jDPapOe6qWCISQYqKAW9b+sI7NU0bZdabFvBPXUiW1BQN
	zNDvUckxGmP+c3bHj+KLCMhUo699qk3MoJK6SYctong2JBbXjR/jlidEAoFetXLrYHIGEjlOmS9
	CVJ3R3ivURrBc2Y0If5TFUg==
X-Received: from pjrn1.prod.google.com ([2002:a17:90a:b801:b0:3ac:3bb4:e960])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3f43:b0:3b4:1621:ba74 with SMTP id 98e67ed59e1d1-3b41c8fe3a5mr9462380a91.17.1795373096769;
 Sun, 22 Nov 2026 10:44:56 -0800 (PST)
Date: Sun, 22 Nov 2026 18:44:35 +0000
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
Message-ID: <20261122184453.2668189-2-jthoughton@google.com>
Subject: [PATCH v3 01/19] arm64/pgtable: Clear AF with LDCLR on supported systems
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

Replace the cmpxchg loop with atomic64_fetch_andnot_relaxed, which, on
systems with LSE atomics, should end up as LDCLR.

This is somewhat overdue. In recent versions of the architecture, if a
system supports FEAT_LSE, forward progress guarantees for exclusive
monitors and cmpxchg loops are relaxed.

Mechanically, I would love to write test_and_clear_bit_relaxed(), but no
such function exists (test_and_clear_bit() has full ordering, which is
also undesirable). Implementing test_and_clear_bit_relaxed() properly is
a pretty large change; use atomic64 instead, as pte_t contains a u64.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/arm64/include/asm/pgtable.h | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index ce51c1b9be22..4285b7e7a6a7 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1252,17 +1252,11 @@ static inline void __pte_clear(struct mm_struct *mm,
 static inline bool __ptep_test_and_clear_young(struct vm_area_struct *vma,
 		unsigned long address, pte_t *ptep)
 {
-	pte_t old_pte, pte;
+	atomic64_t *pteval = (atomic64_t *)&pte_val(*ptep);
+	s64 af_mask = PTE_AF;
 
-	pte = __ptep_get(ptep);
-	do {
-		old_pte = pte;
-		pte = pte_mkold(pte);
-		pte_val(pte) = cmpxchg_relaxed(&pte_val(*ptep),
-					       pte_val(old_pte), pte_val(pte));
-	} while (pte_val(pte) != pte_val(old_pte));
-
-	return pte_young(pte);
+	/* Atomically clear PTE_AF, checking that it was set before. */
+	return af_mask & atomic64_fetch_andnot_relaxed(af_mask, pteval);
 }
 
 static inline bool __ptep_clear_flush_young(struct vm_area_struct *vma,
-- 
2.56.1.809.ga0b61035b5-goog

