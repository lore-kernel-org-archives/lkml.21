Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795373105;
	b=iir2tjLzOcFPj1uqN1/G4k+o2bxZL14qMjZolISU/bklhW82mZFlkju1CzwJJvzTakpc
	 EAvj/4SJAJuGWDNwvBfEHVokb3bToYOVKB+4zE1KIuQqV16iGGXld30IR4/J+ULg0NqIp
	 +JHa6koxHj+IjkBWLyY+8TPIE1feNon5KD6vO9bcjEXUXInsgiP3Y58DzTHqyRHhs+anu
	 Puo/Y3VBfauMvg+tiqec/ZtvCnJbgjtzWYqny+DxkqorG/OpAf70321qoLHDvnsOE/1Iw
	 fsU8xpEEQB0+UOEssaylzJ6uNzzj3lE8FAhDOsYbLm4SCFg34StpsK2U4ZwIkFEX96A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795373105;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=mkVu1BZEh13paTDpck3U+A16xbW48tKn8diy4BeXyyI=;
	b=ZbFfqEVJDPcAsbJd+PLTzO7Gg+Qzqkf8Vhptan2emWK6ZTA5Fr2kngqiUd7lu4TWIGKH
	 exHgnw+tPq7D46IjAaM7a+d0FYUnxT6c77rF8Wraq0I47gn543HO71UF3EEtwLoO11usQ
	 nB7ev0N+sQUGAQ+XwAxsDv0dqFXdkOwoo8ScCpo0IW1cS2etkOuvjo+rqNx43OxFzXU8H
	 0y3NVTg2HA0Oc/pkbfaD49pDOiSruv4YGw49x3oW+Awkcmmrco4Hm9NCjeSGIlOqwpVy5
	 aSXi8+eFgpDPSDQjFKxsREMMMOvN3Qnt9iqJR5xQBYo7QYiBjFmA2eCrI5BGxaHNJ3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kZApy7f6;
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4D4606A6AF
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:45:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C4D4606A6AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kZApy7f6
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f053f95aadso18895825ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795373105; x=1795977905; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mkVu1BZEh13paTDpck3U+A16xbW48tKn8diy4BeXyyI=;
        b=kZApy7f6N8lB95rDB4j86afmkKiz5ZElUbfWgtpZ6AsenqiBRrwZk27vZYnbapJotC
         yqmmlS8nnDDH+mpFHEs6uk1WVCot5h+t8ZzaAVQmFfVDNTeqq+zkXkq2BYXX6VyOvwy5
         j26cK2sg0uQ3muPO90xU1FJh00kceNOo+HjJC4lslwrCEHDnedYhPUMN7HE4zzaKICVd
         kS6URtQYewq90irSxBKdpmEnS0d//iT8VRN3Hnk3duTxO/9C24p1yoIyWjTfirt2ib2t
         7oB/4KF9xN/F6WlVkuifElzyY5AqfNf69QTBnCQxoiQ/V4+r9W/TfTmZ2F70x9moQB/8
         9frg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795373105; x=1795977905;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mkVu1BZEh13paTDpck3U+A16xbW48tKn8diy4BeXyyI=;
        b=D+/UTQK9iyZ9BcQvPEDVxyRI8zSAkZpPTF2hfje57hqNxC4F2YvmpVF7TvW/DBFtqD
         T4KAiVe+sXoAQORixoFTe8uIwiF1dk0QKzKYn4q6dJ/ShutqqL/F5ZcE43IJPlH6CQYe
         +gIvF2+PqRa8fcRNxSMu6XoAHsKd7vdWCNOM3UpRLLYnyYNOgWb6xdR3QIfWOPkKnRgf
         0rUSrKVyPjmmore/yu+Va3xEEVeTUo8oYCOdt5FPCWmSQXUuo9UdsjEqEV/HkNFgDBWI
         n5fcff4hGyyLRxfLz3PCc6uOzSK87YSkuubo0YhjZVsV1SSoEBZwSfkGqJCyUgfvwlBP
         /kVw==
X-Forwarded-Encrypted: i=1; AL+hErFRGGHloxXxFEK8DRBZWSOtMIKi/J3+fhSq+tZhtb2prw5jKqKaAooCMndv5ghXcxaY7K5JsbhwtFTNu2Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EMXiPNuP1IEtNA+tXDMdzypw/c5LYx8NbAvdIPwO+IGyvpfb0
	R+rDqGcRb/V009PZWuet3oDCY1NMRG6/2s4D4e9gU2k8vMex0fZP2FmpR71KRtSKGj45N/XaTx8
	Tu/DhIg56gcnlMJyA7mrn3Q==
X-Received: from plbz4.prod.google.com ([2002:a17:902:ee04:b0:2ef:d472:e87e])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e80b:b0:2ed:ef1:f78 with SMTP id d9443c01a7336-2f03f11824amr92864975ad.21.1795373104623;
 Sun, 22 Nov 2026 10:45:04 -0800 (PST)
Date: Sun, 22 Nov 2026 18:44:39 +0000
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
Message-ID: <20261122184453.2668189-6-jthoughton@google.com>
Subject: [PATCH v3 05/19] hugetlb_vmemmap: Allow architectures to dynamically
 disallow HVO
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

For arm64, only some platforms support HVO. Add an arch hook,
arch_support_vmemmap_remap(), to prevent HVO from taking effect if the
architecture lacks support. The hook is not HugeTLB-specific, so it can
also be used by other users of in-place vmemmap remapping (e.g. FS-DAX).

Check it in hugetlb_vmemmap_optimizable_size(), so that hstates are not
reported or treated as optimizable (e.g. by report_hugepages() and the
HugeTLB allocation and freeing paths) when the architecture does not
support HVO.

It may be the case that arch_support_vmemmap_remap() returns false at
first but eventually returns true. This is the case on arm64, where
support depends on a system-wide CPU capability that is not yet known
when bootmem hugepages are allocated. Such architectures cannot pre-HVO
bootmem hugepages, so they must disable the section-based vmemmap
optimization in their vmemmap population path with
section_vmemmap_optimization_disable(). Their bootmem hugepages are then
optimized when they are gathered instead.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 include/linux/pgtable.h | 15 +++++++++++++++
 mm/hugetlb_vmemmap.h    |  2 ++
 2 files changed, 17 insertions(+)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index ab33df268955..8cf44120e2ed 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -480,6 +480,21 @@ static inline int try_update_vmemmap_pte(unsigned long addr, pte_t *ptep,
 }
 #endif
 
+#ifndef arch_support_vmemmap_remap
+/*
+ * arch_support_vmemmap_remap - Whether in-use vmemmap mappings may be remapped.
+ *
+ * Vmemmap optimizations, such as the HugeTLB vmemmap optimization (HVO),
+ * remap vmemmap page table entries while they are in use. Architectures that
+ * can only do this on some systems may override this hook. It may return false
+ * early during boot and true later, once system-wide features are known.
+ */
+static inline bool arch_support_vmemmap_remap(void)
+{
+	return IS_ENABLED(CONFIG_VMEMMAP_OPTIMIZATION);
+}
+#endif
+
 #ifndef __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
 extern int ptep_set_access_flags(struct vm_area_struct *vma,
 				 unsigned long address, pte_t *ptep,
diff --git a/mm/hugetlb_vmemmap.h b/mm/hugetlb_vmemmap.h
index 8b28063d78cc..440477288d19 100644
--- a/mm/hugetlb_vmemmap.h
+++ b/mm/hugetlb_vmemmap.h
@@ -48,6 +48,8 @@ static inline unsigned int hugetlb_vmemmap_optimizable_size(const struct hstate
 
 	if (!is_power_of_2(sizeof(struct page)))
 		return 0;
+	if (!arch_support_vmemmap_remap())
+		return 0;
 	return size > 0 ? size : 0;
 }
 #else
-- 
2.56.1.809.ga0b61035b5-goog

