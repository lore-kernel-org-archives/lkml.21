Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795373106;
	b=WahOJRh7vG4hiRaBayR6MOSkN4NajNXBby+LgJxoAMMZXiq38EKe7zP5qo1Dd4CiqroB
	 PctVkVc7Hep+aZdOeevF9lP5ef9x0B518xOm0y02D8UhcIIWyLJXAxnnoVpxK7Koe77ld
	 bePSp7cZD+Qab8AH7CYCEW9MK/gs8Nv2p1jEQzUjMdckbpd926s8pCRClP6kDVGr4pc9G
	 jTLvSvhm5Ejc/LU/n9qC/BtdrBYvyOmZCpfA1Kg43cceOAHcucfhrHl5SzlaJU3NwEWSg
	 vajWdlAR08wtHK73/gBYdrwGGQYDykGxpD7O8QMFtH9b3tUrCuLVrvXavMO6tJLFKfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795373106;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=bXQPSKJVaqWfQL317csB6FAtCBOwMGNwoZ92NFySUdo=;
	b=FDHATCRHuz1+SGNSGLLPXJeTig8qaYdxOHTpORnv7yKfWkHZYutN3rC7/SIMfls9pL1d
	 HopirTxVus6JLxXgSiV/ENfdImrJyUyhZVXrbdAumEvy1qp/pHqXAOV7stan4HHkdiLid
	 IwczvbWxT0/foleha/MMX036cWXoSuKkSbN0a1XUjRwOiHNz0voVJiKRnaHTwQB1YRDku
	 kfuRHE4t9eQGy92toj64h2xWwnZEFEekSzTAyAzNO/+ckQ4ROqzerd5kZ8R4S3z1A/5r6
	 hAwuGCy/2WK8ZOFW44yr0hgBesr/p4yb2KjX9iTgdAkxPKl+QXFaluorVnASRqr6LxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OJMmzgij;
	arc=none smtp.remote-ip=209.85.215.199
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C707606A69D
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:45:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C707606A69D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OJMmzgij
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cddc4bde4adso1480655a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795373106; x=1795977906; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bXQPSKJVaqWfQL317csB6FAtCBOwMGNwoZ92NFySUdo=;
        b=OJMmzgijWp3AN1Z1CEf7wfPZ1e2vB+doiFraClZzhbTtbKlTQOYvQnStV4T5Ei1ufV
         dtGZ2YsGQSSZzpEnw4NuYuN2WhWO0/KLhwk06R0FqfTnh7rPLw/cLQfzDF7yMcfxyDpN
         EIWzweRLdNvEIwqovgYnoKzknpfwzfsp6hKCGJc4UErwaeIjEPNZIHhBK1EhNzU0m14w
         dz51+ehNxLIugyq9StUq+lLHB+qJbtdmA734Rg4gIGLSM8GHcSw16I/o2hRgNDqK9e8F
         aHDc8CsMhe4FNXBBRsp2faRScywP3Pfxlk66QDIgj8+jbdPnbzz+v2mjAKHdDJm+ZUHI
         gCFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795373106; x=1795977906;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bXQPSKJVaqWfQL317csB6FAtCBOwMGNwoZ92NFySUdo=;
        b=WUQzAMhQUdmUT6O7A4CTryg9a91L7Ex8QDrUfOfmeih8xYUgUm1aaMymzRdOpJvY4f
         JBnCTa7ucqymRhwxzVdLuX78Ic73B43jYib0NFSwRi9A/A5z663Cv1zqBBQDAjLdQzfp
         SvLfz8GtBsza0Kf/T1+mNOC4sw20uVoflU1g1JrJV9/7F/aKdMZfN+LvJpmsJZo507UR
         kJNTIkTS69n0rLEYMFgSpyVN7QKDAxh2mW2hxQcOIFykzDdP4YujBca9UKRigtOoJt9c
         dFpG1QEJJ3o5XUUosrGlfD71Ie/fg5MtMoVP9bA5tIZQvTOMa8EPEocn5chdYtQoW50x
         Mk6A==
X-Forwarded-Encrypted: i=1; AL+hErGqQcbyiIqB3JqQDvZHmkesROO9ZBkKxzL6vradSDZ7o/RYQ9cM3NW+/bcRPjpeYWu5X6p2DY1xjBJiGj4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FtyjrxKDYuFx3qN8/eRauCuLFInQdZiu2TCCMAFIZQGBs5UKV
	xl/Y1No3PHeQXhriy9n9acy0tTaJJtNKCdl/F7eIzw8hpPXBCWI94bAnIoQBv+ibp+G2HMZcR/U
	q1FNjfEcJFegUjJXQgVj/MA==
X-Received: from pgjg24-n1.prod.google.com ([2002:a05:6a02:8158:10b0:cd8:b29d:d82a])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:4eb2:b0:3e8:b7fd:6280 with SMTP id adf61e73a8af0-4014d85fbbbmr9915990637.27.1795373105686;
 Sun, 22 Nov 2026 10:45:05 -0800 (PST)
Date: Sun, 22 Nov 2026 18:44:40 +0000
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
Message-ID: <20261122184453.2668189-7-jthoughton@google.com>
Subject: [PATCH v3 06/19] hugetlb: Optimize bootmem folios that were not pre-HVOed
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

Boot-time gigantic folios are expected to be pre-HVOed through the
section-based vmemmap optimization, so the bulk optimization pass for
bootmem folios was dropped.

However, arch_support_vmemmap_remap() may not yet
return true when bootmem folios are allocated (e.g. on arm64, where
support depends on a system-wide CPU capability), while it does return
true by the time the bootmem folios are gathered. Such architectures
disable the section-based vmemmap optimization in their vmemmap
population path (see section_vmemmap_optimization_disable()), so the
folios are not pre-HVOed and would never be optimized.

Optimize such folios when gathering bootmem folios. Their tail struct
pages have all been initialized by memmap_init_compound_page(),
as they were not pre-HVOed. Pre-HVOed folios are skipped by
vmemmap_should_optimize_folio().

Signed-off-by: James Houghton <jthoughton@google.com>
---
 mm/hugetlb.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 72839e98f998..8756c0206922 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3325,6 +3325,17 @@ static void __init prep_and_add_bootmem_folios(struct hstate *h,
 	unsigned long flags;
 	struct folio *folio, *tmp_f;
 
+	/*
+	 * Bootmem folios are normally pre-HVOed through the section-based
+	 * vmemmap optimization. However, an architecture that can only
+	 * determine whether it supports HVO after bootmem allocation disables
+	 * the section-based optimization (see
+	 * section_vmemmap_optimization_disable()), in which case the folios
+	 * were not pre-HVOed and must be optimized now. Pre-HVOed folios are
+	 * skipped.
+	 */
+	hugetlb_vmemmap_optimize_folios(h, folio_list);
+
 	list_for_each_entry_safe(folio, tmp_f, folio_list, lru) {
 		/* Subdivide locks to achieve better parallel performance */
 		spin_lock_irqsave(&hugetlb_lock, flags);
-- 
2.56.1.809.ga0b61035b5-goog

