Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795089773;
	b=YHJb7t2Huw98p8tJlQ+/yIhHKx2R6s7NsqpsfvmQdUP09O9Qo04A9FLbCGd+eXpu1Ar/
	 cHLXwKdXkDM02cXH8dFbwB0Kzp/eBoezzWepI5I+z4liOyvmdNWuO0Xgsl3uT9koszHcD
	 QlTYrfVSrbU6yCWc5gNgauQQuriQaAhBdD5rYkSajhe8rml8unCx5dEN8LkshBl4WUKO5
	 F1N5cSUwLSt0LaQyaoUzSXZPvs0L0vloUfu+xhfj6R6KWvH7quciIZIgh8zUrTcIM5mFR
	 0RXVLU2SMC6+Ws0Gkp4rYcAoaCau/3ksz0/X/g0mPTcKn7cuf5a+yHMep8giCNJxtUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795089773;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Mailer:X-Mutt-Fcc;
	bh=7t7J49HOFuAWT+vhD+UjJuGaxZiXmraSo4eTZkGtO3s=;
	b=adQjXabdCe+RjYJDnI552QCHMikuhgRtQDtunh1TiUJWMeuj+AsDR1WbuiyHk65MzfqV
	 tcE5Rl438Tln1LEAOc7HRtZVCgHsjBDYRwGMMKbNVAkrvUTGPjpTccqRGFQ7mz6eBlyZ5
	 /DQGMjxOkdStfDXtglBnvy44ta2RdjKrK0fB+Wr6s91eW0rMAeOXsl3YabnoqTuu+08/K
	 EgJnnlfrjYAjJtnBXHrnalOb7Nhc3vF6qN85ohFDTMJfImqL1fB+iqPcmCT41o68EzQqt
	 DJwiTUjxPEFhFd5IyBOhLPoh7DnRidPJnXgQwq22EpCFT0+SayrmH2vET5pAwSFAtnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=W6h20Xl7;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="Z/1e8E0T";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88151606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:02:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88151606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=W6h20Xl7;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Z/1e8E0T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795089771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7t7J49HOFuAWT+vhD+UjJuGaxZiXmraSo4eTZkGtO3s=;
	b=W6h20Xl7Weh21WEMJE1kqVtKWQuQjrTKtrm8IWgHnrzAlyHPgzlySBFJoQWyc01AmUIP1H
	eY761JpPatd4OVRWUb1sQeMqpvczohkKH1STEGyJg5mJVdpxkWsl8li8YjxSfHZtu4MBzb
	d8UFeF4DUJpYn9duBdoTtjcZXFqUFTM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-t1GZMquHOgGudfYe_QS3Wg-1; Thu, 19 Nov 2026 07:02:48 -0500
X-MC-Unique: t1GZMquHOgGudfYe_QS3Wg-1
X-Mimecast-MFC-AGG-ID: t1GZMquHOgGudfYe_QS3Wg_1795089767
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4915ba023d4so1476363f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795089767; x=1795694567; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7t7J49HOFuAWT+vhD+UjJuGaxZiXmraSo4eTZkGtO3s=;
        b=Z/1e8E0T+yQiHQh370Quca6s1c178zc1sjwNINdD60/ReWk3WnZ1xD7CyTUDILt8vC
         v77n16i2jT3KwKTloNx+QY0bpyLaU+G3UoGn0GehMoTSbdrSitUoqVe1PgUnVkyQaZU9
         oOgSLvZADLYbMEyyPVN8aEnH3jxZ1ERQPn3prZ0ZeZmzxbouBpwML/ZM/ZN+l1cJZN2Y
         cuLGO7CZf8LkiwW7OJ8aZr5ir+VrK4o/3iLvQ/pOgWURtm/99PjYCNRR0Gnhwz34Nepl
         6tiaQIrCh0/GHHHQ1oOtLriJK1wktEGix6a3FtbuKqAoqV9wayCtygYyF6sqPtTbXas6
         zXsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795089767; x=1795694567;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7t7J49HOFuAWT+vhD+UjJuGaxZiXmraSo4eTZkGtO3s=;
        b=MCiolxrvdQvKf7R/yYB+YisSYFl6D5iE+BKKL5O5vWuStufkg7PKqy2MZ9iesT2knn
         AD99+3wX7+DGuGJHeKc77771NfZ0DRBFU733LroApPG4RH+ja+M776rMV9G7n4C/1+nP
         mGUn5OMRX8wb4WnKQEwP2nwlBuEcRmALt/I/dHxJIW9R1bXftaXcZyKa+wb/qIj8kBxs
         +/KMmbD8LpD/skd3lPg6o16H9HFsE5fY/GQYQaeqhZICPdVhu4Kzk31mUku/P+9SaGBQ
         Nj9J0dSJo1YCtSLhAoaMpJpXQ5+VgqD2u2lP1/ApeY4NsPcok+nOl8R14eeWfdKzSCkC
         Wwkg==
X-Gm-Message-State: APuU4Z+upK/5YsQ6gHMOn3bWgDMn/RxoAS8nCxcYxYPHAW9X08p4ysLo
	ZDIeQxPGIL3yjnEDfOYQag/6z/PHGnODaNS/eRl3FN69c7073uV6HNo6OodmEdYEIq1zQGFGiff
	YTMDCIOZ51o8r8AkUNPHer4iCmAr6/BAFd/aubzahh6bvpzQOGbPuv46Wi9lIr7p74fp54J0I4y
	MNsyxhnVrH63paEpLlwG9WHQl9Ofjpmk+08XhRWxoCwwE=
X-Gm-Gg: AYBFou3JkJ5P7rAmdBx7nYH3ysYRVHnpWVajPRu/+PYqw8+XWKmGKLdwFIeprgXGe4u
	jxQN/G6/UcmhyAaIbvD6ijT6CKjNTPd0Q5S+EtHJxN7cj6BNtL4gwQrBTo+1oNbpuJVKW+clatP
	Y13aUTgW84e4+XY1EX0WBg2BgWYLeGR+HliwHkBmbCJOG+Px4x187Sx0x/kbNFPAjxLJXK2DP2i
	6/PfxW6ffWW2nsM5jSEVMB7QMH0B4T2g9yW86JTN9mvY7/6euAqfYlIOrqQ86mad1wmCOP7bCVa
	wWUClW/hq1FowHuUb1mbDLk+/nMNhuIt1h5KnlJFDmapQc8jZHe6vg6go8e3fmAlP7868L1UwGO
	orqbPmqrTrhtDaU3kGwsDqQI08ZRfsEaSwcewMtXzjYU=
X-Received: by 2002:a05:600d:4:b0:4bb:818d:8d8f with SMTP id 5b1f17b1804b1-4bb818d8df2mr59688425e9.23.1795089766852;
        Thu, 19 Nov 2026 04:02:46 -0800 (PST)
X-Received: by 2002:a05:600d:4:b0:4bb:818d:8d8f with SMTP id 5b1f17b1804b1-4bb818d8df2mr59687405e9.23.1795089766192;
        Thu, 19 Nov 2026 04:02:46 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1520:4400:d78d:7b2d:2f5d:e08f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8535741esm50675225e9.11.2026.11.19.04.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:02:44 -0800 (PST)
Date: Thu, 19 Nov 2026 07:02:40 -0500
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
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>, Barry Song <baohua@kernel.org>,
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>
Subject: [PATCH v11 3/7] mm: skip zeroing in vma_alloc_anon_folio_pmd for
 pre-zeroed pages
Message-ID: <37575b5efa8e04527f390eafada7fda928744130.1795089715.git.mst@redhat.com>
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

Initialize newly allocated anonymous PMD folios through folio_init_user(),
to skip initialization of PG_zeroed pages.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Assisted-by: LLM
---
 mm/huge_memory.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index eb913acb03b74..80bd9b54eff2a 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1375,17 +1375,10 @@ static struct folio *vma_alloc_anon_folio_pmd(struct vm_area_struct *vma,
 
 	folio_throttle_swaprate(folio, gfp);
 
-       /*
-	* When a folio is not zeroed during allocation (__GFP_ZERO not used)
-	* or user folios require special handling, folio_zero_user() is used to
-	* make sure that the page corresponding to the faulting address will be
-	* hot in the cache after zeroing.
-	*/
-	if (user_alloc_needs_zeroing())
-		folio_zero_user(folio, addr);
+	folio_init_user(folio, addr);
 	/*
 	 * The memory barrier inside __folio_mark_uptodate makes sure that
-	 * folio_zero_user writes become visible before the set_pmd_at()
+	 * folio initialization becomes visible before the set_pmd_at()
 	 * write.
 	 */
 	__folio_mark_uptodate(folio);
-- 
MST

