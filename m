Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541362;
	b=D20DWJeuJgFa5bXQeQTxn7hj5xNkzmyr9/X53WSbNnbEW8CcdMYTBvZX57XFXsphxEqw
	 H/na8lDQ5bLOsICEbYlrznXjYKlbYnZjoiVqXlzyAIowY2z5+hoV+3biKNeoMd8gPep+L
	 DabW6CC+JvASTwxbs/OJyRlnBOgHvLSELcjEffDcxQURrqZ8CRl211lSnQtQHafT+K13M
	 ouCzxFcA/IzXi79/fq64JllJl2jii3BTklapG+wF8fwW27KuLQ4Zo9dCIHB9pTPrxUXbe
	 AYT1LW2LKJcRz5vetnqQrGvstkjkBOnAQvQt8f9VBHM8UhsdQQjxm7PAQeq63jyJFdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Gh6CqnsQ+4Kge1Ge1wt7W5gV069TsTISbQWwZdpvMuU=;
	b=ZWGp+V3nXzsM9PkF7QTmQ2UHErPGX3ZkNHjmfxaAHN4s8RY8auoKgtgBTlSYL484vvtU
	 k8NKPDgykYFNINJE1ZYJA/UcV8fJZmQChAQ9me/8oxsV6d6p7onNe0OeqGsAe+VWFsDKj
	 REGYBU3XhYj2NAWF65bDoEJFqRFyhU1sxVvddP2zPu/b0jfqOCJrNzJ9TOf/Yb+vJAbhu
	 NBz4pV8cN5qSs6yKMP83LYapWwnX7nYCP2vnFYFuTzjzNmtofF59x3zt9aXFAHI/eCtQI
	 Eja0uY6rG460mI8nWyKC3XOjfv45+srW5zglX6DDtYt+52G46P6nxcgiK0BmiQut7ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C3a2BM8n;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB47606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:29:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CB47606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C3a2BM8n
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8ca6a12efd9so1400865b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795541361; x=1796146161; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gh6CqnsQ+4Kge1Ge1wt7W5gV069TsTISbQWwZdpvMuU=;
        b=C3a2BM8n3061p4sMZOMJ8Y1++2AGZZiH9JYuZvbQ1ruA3bG/0EZNMmcDp/Au9lC7ZJ
         4r92Y+doFslYiemisX5ngldE6XhXw8kw2ZHYv7N9/lc9DmuUWCdbpPLJiO2piXiV+MYW
         s9RW1RbmdQXh7QSgmJeSTl4QJoQdLiYrVKgk4TGnRMb0WSc3Di8exzY/ym4LeiBAIY4F
         c7mPMRBA3YPBPOYnXon2OZYof1k1S/oLnI5I8cIQcB5aoJOb1lIOFSoWx1AgOuB2VVlG
         gWG0KvOOBmeF6PC37XfXGWXqVoTdmP82hw2ertwKDYXQ8z6kid1rNVz9R0dtO3JCDTO8
         uYzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541361; x=1796146161;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gh6CqnsQ+4Kge1Ge1wt7W5gV069TsTISbQWwZdpvMuU=;
        b=ro4CGWJMOPlVAySP2JU3DPTdPhbXdKNo2bguZrJ4LKhKKQLJcJpyevhZ16Bpt+68PG
         znuf0eka9RwUM3LhqYo32ThZ47H+HXaF4feskwDqenV/1cKd1i5wYt+bl4fmf4CHV4u3
         Tnkf+Or3k0uKO6TRUBucNk2muv/PXG4EADhByOBOXs79AgH/m7tCHnGcxq7MSZ/4xmLq
         YrQ5vVYXsl0BYDSG8akrF06p4NtC+bFYUmT+tSm5FS5nB7/qp6/Ve3SgxOklGu7zOWip
         PU1hhCmQduJ2bDkJlkJw42RUdfYJ2DgGKqYcZzOcK9rI6VAy2XrbB63Qn5UT39VKsweL
         ixxw==
X-Forwarded-Encrypted: i=1; AL+hErHIrwnkkEFfg/iKrToipyl0CkV0nytPaqmPjy+3pab76yVI2z/HEj5brixFggUk3SYpytWVVc3pPygIdhI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WBja7bFYWt/hf7iid0bzvYGC5ry4hYbnc2pLtoS7PgsROn0zT
	Pg4phyeJSNLyuH7hRjrzfjtPVa2nGwP5rRIF+fZv2dRPtA7rd42HKh0v
X-Gm-Gg: AZFdTZf8m4XNdMyrVWXaJ9Eer+JARRLo2gcWicZNkOyIPT0+PfHc9ba5cnv+k3Qdh8w
	WY1hay/U9YbcZuGFJdIpOJe5H2yG+ICzSdfZlRXdeY+DnDYnPgPY757ROo3IVDFcdmVgAPatkuF
	nZ26kkjBstZ/KjmJdHCN7hjx9xLXbYPtEh2hiT91p2lC/xwe9HS4rLiBAicr3iwwSF1UEt84ozZ
	HdAGXOTX3aj40DnO3KZMd2KVqJC+kKC+N84e6sAzAkKCVV5nDQLHSAO3xqthUiBKSD8+hZfZKnu
	x0B6B5y6hu8Z35Z/gmGKsLd2VpwRiLPpb7/3xisyOvTun9G1pGuU7JZ9J9In5M6ymUuUnRGoZeH
	DKUMAA8pmWsguPbRUX5AU98EoYLHzAs2jKWeKXYB32vKKoC6GjsTDqehIQncFTaG/f5gzryUf1S
	NMmGDguRVmwFRcoRj7Mxc3DGNcBB2jo2PJ3krkAJvnx1YTerErfrgyBne5rFcyAHUqm38V8Tc21
	Itsei4Z4L+iysvecnv1NAAdLM/EoCeVEfcdSLRsYbEgfdmJoUc/nUH7IllawF54l0vdVYVtKIZe
	DTw5eH96batf+TNt02W8iuLRkw8m2QXUm0Sp8a0ItqEy1M+XHC8FuB0IlB5SmB6d3SpSyJA=
X-Received: by 2002:a05:6300:404c:b0:3fb:35d2:645e with SMTP id adf61e73a8af0-4014a27e70emr13896715637.5.1795541361413;
        Tue, 24 Nov 2026 09:29:21 -0800 (PST)
Received: from KASONG-MC4 ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4aca2sm7432265b3a.32.2026.11.24.09.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:29:20 -0800 (PST)
Date: Wed, 25 Nov 2026 01:29:04 +0800
From: Kairui Song <ryncsn@gmail.com>
To: Zi Yan <ziy@nvidia.com>
Cc: kasong@tencent.com, linux-mm@kvack.org, 
	Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Muchun Song <muchun.song@linux.dev>, Qi Zheng <qi.zheng@linux.dev>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Chris Li <chrisl@kernel.org>, Baoquan He <baoquan.he@linux.dev>, 
	Nico Pache <nico.pache@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Nhat Pham <nphamcs@gmail.com>, 
	Youngjun Park <youngjun.park@lge.com>, Gregory Price <gourry@gourry.net>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>, 
	Hugh Dickins <hughd@google.com>, SJ Park <sj@kernel.org>, David Rientjes <rientjes@google.com>, 
	Yu Zhao <yuzhao@google.com>, Vernon Yang <vernon2gm@gmail.com>, 
	Zicheng Wang <wangzicheng@honor.com>, Tal Zussman <tz2294@columbia.edu>, 
	Xiang Liu <liuxiang.277@bytedance.com>, Ehab Ababneh <ehab.ababneh@intel.com>, 
	Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>, Lian Wang <lianux.mm@gmail.com>, 
	Joanne Koong <joannelkoong@gmail.com>, Kunwu Chan <kunwu.chan@gmail.com>, Hui Zhu <hui.zhu@linux.dev>, 
	Maxim Muzafarov <maxmuzaf@gmail.com>, linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	damon@lists.linux.dev, linux-doc@vger.kernel.org, Tianyi Chen <hi@tychen.cc>, 
	Ridong Chen <ridong.chen@linux.dev>
Subject: Re: [PATCH v6 11/18] mm/mglru, smaps: convert to LRU refs based
 operations for MGLRU
Message-ID: <awXIalgUrVIf5VP9@KASONG-MC4>
References: <20261124-mglru-fg-v6-0-8ffea39934a6@tencent.com>
 <20261124-mglru-fg-v6-11-8ffea39934a6@tencent.com>
 <DN2UPVW6W83J.I1S5XXQ2DPLV@nvidia.com>
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
In-Reply-To: <DN2UPVW6W83J.I1S5XXQ2DPLV@nvidia.com>

On Mon, Nov 23, 2026 at 02:52:55PM +0800, Zi Yan wrote:
> On Mon Nov 23, 2026 at 1:53 PM EST, Kairui Song via B4 Relay wrote:
> > From: Kairui Song <kasong@tencent.com>
> >
> > PG_referenced is only the lowest bit of the folio LRU refs count
> > (LRU_REFS_FLAGS) now, and MGLRU never kept it stable: promotion used to
> > clear it, and now it toggles as the count grows. But with the LRU
> > referenced count as a stable API now, we can use two helpers to provide
> > in-kernel users a stable and sane reading of the referenced status of
> > an LRU managed folio.
> >
> > Add folio_check_lru_refs() and folio_clear_lru_refs(), which use the refs
> > count when MGLRU is enabled and PG_referenced otherwise, and switch the
> > smaps paths over to them. The lru_gen_enabled() test stays inside the
> > helpers, so its static key is not splattered over the few call sites.
> >
> > Convert smaps as the first user of them. MGLRU now reports every folio
> > with a nonzero count, so the reading no longer flickers and clearing no
> > longer results in an ambiguous status.
> >
> > The classical LRU case is unchanged.
> >
> > Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
> > Tested-by: Andrew Morton <akpm@linux-foundation.org>
> > Signed-off-by: Kairui Song <kasong@tencent.com>
> > ---
> >  fs/proc/task_mmu.c        |  6 +++---
> >  include/linux/mm_inline.h | 31 +++++++++++++++++++++++++++++++
> >  2 files changed, 34 insertions(+), 3 deletions(-)
> >
> 
> <snip>
> 
> > +/**
> > + * folio_check_lru_refs - Test if an LRU managed folio has been referenced.
> > + * @folio: The folio to test.
> > + *
> > + * Returns true if the MGLRU refs count is nonzero, or PG_referenced is set,
> > + * which is also correct for the non-MGLRU case. Kept as a separate helper,
> > + * to avoid splattering the lru_gen_enabled() static key.
> > + */
> > +static inline bool folio_check_lru_refs(const struct folio *folio)
> > +{
> > +	if (lru_gen_enabled())
> > +		return folio_lru_refs(folio) > 0;
> > +	return folio_test_referenced(folio);
> > +}
> > +
> > +/**
> > + * folio_clear_lru_refs - Clear the referenced state of an LRU managed folio.
> > + * @folio: The folio to clear.
> > + *
> > + * Reset the MGLRU refs count to zero, or clear PG_referenced, leaving
> > + * PG_workingset alone for the non-MGLRU case. Kept as a separate helper
> > + * just like folio_check_lru_refs().
> > + */
> > +static inline void folio_clear_lru_refs(struct folio *folio)
> > +{
> > +	if (lru_gen_enabled())
> > +		folio_set_lru_refs(folio, 0);
> > +	else
> > +		folio_clear_referenced(folio);
> > +}
> > +
> >  static __always_inline
> >  void lruvec_add_folio(struct lruvec *lruvec, struct folio *folio)
> >  {
> 
> I assume this mean people should stop use folio_*_referenced() directly.
> Are you planning to remove PG_referenced helpers to achieve that?

They are still there for CLRU, but yeah, and actually there is an earlier
RFC where we can remove PG_referenced and PG_workingset, just like this:
https://lore.kernel.org/linux-mm/20260502-mglru-fg-v1-31-913619b014d9@tencent.com/

And this:
https://lore.kernel.org/linux-mm/20260502-mglru-fg-v1-32-913619b014d9@tencent.com/

It doesn't really reduce the flags usage but make the code cleaner.

The co-exist of MGLRU & CLRU makes it looks weird, hopefully we
can solve that soon, let's do it step by step.

> Other than that, LGTM.
> 
> Acked-by: Zi Yan <ziy@nvidia.com>

Thanks.
