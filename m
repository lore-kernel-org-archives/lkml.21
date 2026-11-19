Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795089776;
	b=0NjbFZlxe/q4uNs4W4iabtK78UE/1lNMnjd1Y1cyQQIYsc/yUErES05MsBsYh/2dTDMO
	 DKucvQnTiWbvC8E40MSn1tKesip6cEmbF5Mf2ByWi8LWW4Ngu6IPnEPHLrkh3IqEiKTS7
	 NEm7pwalvSy9LW+4k4k7l6kgBx0pxMt45fojoDc6RNyOaWoL1gRJgvGnzV547gEb0t9SN
	 AM3ZRpA/LNpCvLc+jekVvSb6dVT8aLaWCtWT2UHtZI/cQ5m3Q+cNkc9ewqBIPOYzNrWOX
	 YbT2eRrfZo9ZpfbjNj2PLlJQN87IYJuooft2GoRzdZvAYW3RI3oQ5qIGog5CKHXQ13A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795089776;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Mailer:X-Mutt-Fcc;
	bh=kbCSLrCrP7oRdquD/0Llnb20nwRhMvgzSZfeCvbl4HU=;
	b=AHolSpKYsxOBJ9r+PqM85l2WO7uvyR2zeqTju7vE2VFrAhThELmu2ptuJP5e8FR58461
	 I4haezLnVeRYAPPORhmCzNblbqSuOrpLKAstfxdPrkwg00LREg+Z5+DemN5o0O7FNcXWS
	 RDP2CjbYpEshZDCs01icR/IIdwhqfqrMATHsUZ4QAy9TNHIHgZEjV8+SQj8Bc7z7l8ogF
	 70Hyii52I98MYlcwwyXAXUIjhmtg8yPQX+N74RIZ9VIPVocB+GIzkcd7Ng56pa/HFNd7K
	 4vKj+p0PDUgfIulO6RGZiOgFoK+MJtVGJuRD5Iu9RBQFXOKQ6lfqxTmnfaSwxTHLLbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BMIbbCds;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="a/sCKhoE";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADC6606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:02:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5ADC6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BMIbbCds;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=a/sCKhoE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795089775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kbCSLrCrP7oRdquD/0Llnb20nwRhMvgzSZfeCvbl4HU=;
	b=BMIbbCdszMp+8fooMIqjs407LH1dhkE+4VKsk1AkQMbzQwBsnIRVmOHyrZBZqtfxx28pE8
	+33fWyO50K5m3VGFTZauBq8XTKumqrzz3fees3cPO0EjPEAeVGXXQfYKkiTSuqiRcZdaoe
	LUFOUqIsEWXGC97/YtVCJKe16s2ubas=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-QTcnCw0MOiCNdWs3WpWsGA-1; Thu, 19 Nov 2026 07:02:54 -0500
X-MC-Unique: QTcnCw0MOiCNdWs3WpWsGA-1
X-Mimecast-MFC-AGG-ID: QTcnCw0MOiCNdWs3WpWsGA_1795089773
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48e011829easo1167158f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795089773; x=1795694573; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kbCSLrCrP7oRdquD/0Llnb20nwRhMvgzSZfeCvbl4HU=;
        b=a/sCKhoER4CX7CVUjib9icCqcLZ1h2Y3puk8BgxO/dt0tRxKyNJF66joV+D3MR6EYT
         5XgxRdzm3G+HTAuuX1OqLr6bdNFMerY0snRTUZzGuVZfb3RG8gSJk4+6s2QGcLow7kAE
         tsMKskOmDwEpV/WGutPp8Eft53pO/l4F9GVfxVeHe50RiODkf7/jepKzyZuSnCJISvu1
         3P8o9Q5maYsNHp2lYM2SyBhqSZoOlOsHJGqskaJnPicIwiEWCNnetHut44mXLtXo1Qvs
         sCMTTQZ9nuBgnInZcwYWGNn4TuxenBP1GkJLmmQsFlWBn2g3oY+C6uTK1Riv/2A8kUkq
         LHhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795089773; x=1795694573;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kbCSLrCrP7oRdquD/0Llnb20nwRhMvgzSZfeCvbl4HU=;
        b=eCszqLz+Ny9K3rpgMCvucNZ2Ub9GbDT9X3OiBrYOdf33UC+suMa3xsx4mCwMnXv79m
         qG4ZmvDCCeirGtgCzH1yP0L1grWN8AMc9KNiYHqDeiqrAxFmY9XQVlkwqKeiGpadW0xp
         eB4rIUUe7szKW5bWfpFt+uLc3cv/4Z/cDoasJEQBcfU36A7FWFZzEaOSrpWqiw1TcCgX
         FTB3DjG2T8+IAZ8eNzZusCmQ6fhObcZ53XTysF0fhXac+Ilw6TQ/LOhmDm4Ui5f0XIin
         IRRgQkOVAzcyHg4mx/Qk8d9nVLCd3ChmqQQQ4Ult2xfDpwHSjY2Ghw5C5RApJlWPmtxr
         hFUg==
X-Gm-Message-State: APuU4Z+j/SBLakqXI/gvHkkZB8jCA9A4tEx2I0uKalC92B3JirrWiIbp
	4zse0uVvxzBAmlUMib2fBMiY4WFOdfxq/+g+APYYvk1AATfeJ6wq2jJXe7+xzfOneZFammnN6Zd
	ExLWNW6ieV6SzHOhmIIcbptLycX50+BkuUv8yWhIUlMFTARtbWdKzkD0qZpVPD7KksLshaY/r3c
	JPLe1+NS3gJDoAVU0rAiW63uURwMlYJuMKBk/Xy5WBcms=
X-Gm-Gg: AZFdTZeNQtt+KUms7ysAnSHuMVhAuG8GBer9Pzql1wKDHUS+KTWz8vurXcCbSnodzmI
	7G9cd+y0ke74/qJACVFDL0aYle0TsYfU3h11HV/0ijqpcSRuvyLoxDV7ePvLJ/vFjRIwefR96FG
	Oy0n+ziSk3e9QhgL/SCmYUnlSTIBWHLPMbA+ddro3hRmUWhlqzIrO54xl7XlaHim1Rx7IOciMoj
	arO5Ku3iLmj6mQbMq8OG8JE6wDug915pWC+NUPyvTtfaGVqLTgiAf+bPA9hj2QbYmbYIKF5x6Q5
	kLsSRP1kyQKNd5yaoTNE46g1X4BU5FKiF29hzikRGbZr7lj/eOLh+ljO2QZeK77ZG7DVkGcs1qg
	rA1bzYOwy7V+LQ7DXTPKhR3bqjGGuJseJvk3s2KNkovA=
X-Received: by 2002:a05:6000:4283:b0:4a9:b2f1:aac4 with SMTP id ffacd0b85a97d-4a9b2f1adadmr3551692f8f.22.1795089772608;
        Thu, 19 Nov 2026 04:02:52 -0800 (PST)
X-Received: by 2002:a05:6000:4283:b0:4a9:b2f1:aac4 with SMTP id ffacd0b85a97d-4a9b2f1adadmr3551587f8f.22.1795089771908;
        Thu, 19 Nov 2026 04:02:51 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1520:4400:d78d:7b2d:2f5d:e08f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65560b5f1sm10622532f8f.21.2026.11.19.04.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:02:49 -0800 (PST)
Date: Thu, 19 Nov 2026 07:02:46 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Brendan Jackman <jackmanb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Jason Wang <jasowang@redhat.com>,
	Andrea Arcangeli <aarcange@redhat.com>, Dev Jain <dev.jain@arm.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Ungerer <gerg@linux-m68k.org>,
	Gregory Price <gourry@gourry.net>,
	"Huang, Ying" <ying.huang@linux.alibaba.com>,
	Lance Yang <lance.yang@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>,
	Magnus Lindholm <linmag7@gmail.com>,
	Matthew Wilcox <willy@infradead.org>,
	Miaohe Lin <linmiaohe@huawei.com>, Zi Yan <ziy@nvidia.com>,
	linux-mm@kvack.org, virtualization@lists.linux.dev,
	"Liam R. Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Brendan Jackman <brendan.jackman@linux.dev>
Subject: [PATCH v11 4/7] mm: skip zeroing of pre-zeroed order-0 user pages
Message-ID: <73917d7bc27d763dbcdd2044d311acaf452144a0.1795089715.git.mst@redhat.com>
References: <cover.1795089715.git.mst@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1795089715.git.mst@redhat.com>
X-Mailer: git-send-email 2.51.2.2891.g4157995a80.dirty
X-Mutt-Fcc: =sent

Skip initialization for order-0 PG_zeroed folios.

For the generic vma_alloc_zeroed_movable_folio(), skip clearing known-zero
contents and unpoison KMSAN metadata.

On x86, vma_alloc_zeroed_movable_folio() requests __GFP_ZERO, so check
PageZeroed() in post_alloc_hook() to cover that.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Assisted-by: LLM
---
 include/linux/highmem.h | 8 ++++++--
 mm/page_alloc.c         | 5 ++++-
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/include/linux/highmem.h b/include/linux/highmem.h
index 70bbe93b8d669..4abd2a0fd82f7 100644
--- a/include/linux/highmem.h
+++ b/include/linux/highmem.h
@@ -344,8 +344,12 @@ struct folio *vma_alloc_zeroed_movable_folio(struct vm_area_struct *vma,
 	struct folio *folio;
 
 	folio = vma_alloc_folio(GFP_HIGHUSER_MOVABLE, 0, vma, vaddr);
-	if (folio && user_alloc_needs_zeroing())
-		clear_user_highpage(&folio->page, vaddr);
+	if (folio) {
+		if (folio_is_zeroed(folio))
+			kmsan_unpoison_memory(folio_address(folio), PAGE_SIZE);
+		else if (user_alloc_needs_zeroing())
+			clear_user_highpage(&folio->page, vaddr);
+	}
 
 	return folio;
 }
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 927a288eb419b..c2cb2f66c1736 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -1829,8 +1829,11 @@ inline void post_alloc_hook(struct page *page, unsigned int order,
 				gfp_t gfp_flags, unsigned int alloc_flags)
 {
 	const bool zero_tags = gfp_flags & __GFP_ZEROTAGS;
+	/*
+	 * Skip zeroing if already done. Sanitizer handling still needs to happen.
+	 */
 	bool init = !want_init_on_free() && want_init_on_alloc(gfp_flags) &&
-			!should_skip_init(gfp_flags);
+			!should_skip_init(gfp_flags) && !PageZeroed(page);
 	int i;
 
 	set_page_private(page, 0);
-- 
MST

