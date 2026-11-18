Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795015527;
	b=g5JzzCh5j91KruKivEklI3Yz82Xr9wsCOismxHMn0tD5zyXi62vR6JVQXU514A8JUhIt
	 D5cgjN7o64UEglkRC/UB20iRKRsRdKIz07VFSLo4N2Bgkcrxjv40/MzW9Robn1dpYCp89
	 Ch+XQkHjMZxRhPu5FCQ1vK0ObglDRidj8CFP3aepTpY8D37Rofi5gg+bXjZdgm27JeT2m
	 sU/6CQN/o9UViZlHii3P5nTl5nVlkPVmyws3MQDxztSPtu6GnGLq3r3McrAy5UFdaPTEQ
	 9vR0EBM3pxpymeiZtQ6zem2uITJpaKRzvYxsYGqREEoK1b5KTtR2j2tMaH43tUPGJSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795015527;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=MhtDXpbRWCIEhu50xIx6ItwVhQLsPfY15TO/C9JpkIY=;
	b=0G/geq8Gh47pBB1178MYy7zwhRoV4DaFyDqxUaZKX1knDlB7ej9D1se36wEahnXmAvfB
	 Q1NFLjjsz6Qfs2VhxrAPZu2968MZkufHYyFbK9f6ybCH+EucBKddO5sROIiMB+wq/Op4K
	 tlkHQ+24dyaYIL2Z9kjle/ZfjiLxWIwbxywOCjXMfErDJn7lUfQ9ISBfDJBk9RTwthTHG
	 gmvR1UgVl/6xNr9b9jw8DBBWO+Wmx5EhiyIvk73Is6hRq+u7y9jhsT8cOIU5IqWL0wvKS
	 z6VM6GBAbT8AzjPXdhT93DfloEUiPAW6X76/wnjSQRVSI9QWDTVtkg63JWuXD8EDpCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b="jE7rKGS/";
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D2360A380E
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:25:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6D2360A380E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=jE7rKGS/
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91f23ddf32fso7789436d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1795015526; x=1795620326; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MhtDXpbRWCIEhu50xIx6ItwVhQLsPfY15TO/C9JpkIY=;
        b=jE7rKGS/9QG/JJLAYSBebfc7UI+DGt6msbQ8tMKrJyf7dhdvw1qgGgHL2a1Stgs7/u
         7hEJVeGKLeMoYuvyTuRo1TO6ZKsFJ8C19di0LKZM4Tx/bFg8jXksaBHETdQRYWB8bcbf
         vndwuhivOCLprevBEz7PLOmqtubEyBL0BI/+a5nfmLb+NfeRk7KC4JnCSRMrj3CA3q6a
         lyeFMYbO+4PDLy4WMyQWPemjuBZrA8VUm7GUYQ+voCNX6YMciUdYQmYeAoNhF1vj3Wsw
         t8vY3fyWbbf0Pslh6FnM27JWmfcQaEbWnEK8REBZ8c/DIVcHv9pipqnF73U6JtCHWAR5
         ZRXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795015526; x=1795620326;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MhtDXpbRWCIEhu50xIx6ItwVhQLsPfY15TO/C9JpkIY=;
        b=BNwI5LrG7LVCwC3/UnF/Yr5/Ns7s5LjXgozWtH//R23mEOVOnfGLKihV4cyZiYcl1d
         UiLY4x+Q7nckFiI2sp2edYrdkNnYAsQqThnYCgGAlTaLYolHUMouwWhTTPrTTaD5SNNe
         rh+uK/DkInqQ9cXhyJxsgUa0vqgwJpsbCbcVX9Mnzknm1nRWlbdHldCqFTmQNZKyjer9
         O8S99BgWIozLdo5/FGUxKh/JZcYHXPbXhoriH7tV1L+QC/GALLutG1cZvfnFqzLV+PWr
         IY3U63QNAlsbr5+j5yVKd7jttbiKBd3D03Ugy1JCd9tEUet5cM3r3EmlYygSzBK1kWtt
         dnFQ==
X-Forwarded-Encrypted: i=1; AL+hErGTZCxqeGfWldlAbL4Mu06usOfNEFM6P10HXlU8Sm3Bng1XdoPoyKl8hANtjRRbKADNFxykNKfJ3Pka9x0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QIiBJTUGb2audHjole4gMPO5lsJdgwgGjtnjbWSmMCaeGMbzs
	Ra4SAsbjAvZuZfiJPWvpNFlRoOp/DKREQp79SliFOPBCO92YKejynHPevapSQ71wFhA=
X-Gm-Gg: AZFdTZfoGUddkBHhnXyd7mIvBzLJ1615VCp8lCScQwhBtRUzzUX9l9zN7IbcltZWYE1
	AP9YMqtD4Y1UULzM5gQlz0Dh3UsYHqzLgSWCeJzyA6P0aYXw+i8UqmNdj81676r0M2eyasSBO9m
	i1rcO00XO5ZzUNjYYNg6H7gAjEf+xG78+0QlqdjVIoHDVLQqHHxmbrLtTc3AgVWthPPPFSxBOLb
	nESoc7dmU0ZdckXNhFTOGQAecynf+kc7GfksReQ++4IcHpkVD3ZtJqvXJ+ckI7rINIUST0pf7sU
	PcPM849lz2kHskHtoEjjHliW2mGqemRPsjHtZxnEnyyv+Zm8/m1QEPgSuKwD3La4Domgf6fmkAT
	U4CSOduDt7y52a+VxzO2yhHqTjeK/ayRMQYt4x/sckp3qsOeSmK9Dfbcb3MgE4JtYNq1/KOMLyF
	rVk/1i91wFMAAxYKmDldtBBQV1t77XKeBNN6Ctzrv3cu55rJDTwbmShse7HJknjSfLU0dzJ3FXq
	XHzhfCz11chkWACqOCTRU+fWw9E3hViq4XTbex6vcvV6saXEqtJv7kTAhOFEYYHbK7cwvqYKLLZ
	jAVubH7XW3Z5HI5YmUMgM4Jtg/O5LFlpfNmPMjLxQcD53rHKhDGZnK2csEPKS+E3mbk9H093N6h
	Ypa0qxBI=
X-Received: by 2002:a05:6214:240d:b0:91f:12a4:27f2 with SMTP id 6a1803df08f44-92114c4e8f8mr45557396d6.6.1795015525386;
        Wed, 18 Nov 2026 07:25:25 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921149f9c36sm24415306d6.5.2026.11.18.07.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:25:24 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 13/22] mm/hugetlb: restrict pool growth to common
 memory
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: Richard Cheng <icheng@nvidia.com>
Cc: "Gregory Price (Meta)" <gourry@gourry.net>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, kernel-team@meta.com, 
 linux-doc@vger.kernel.org, driver-core@lists.linux.dev, 
 linux-serial@vger.kernel.org, linux-pm@vger.kernel.org, 
 damon@lists.linux.dev, linux-cxl@vger.kernel.org, akpm@linux-foundation.org, 
 david@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, 
 surenb@google.com, mhocko@suse.com, corbet@lwn.net, 
 skhan@linuxfoundation.org, rdunlap@infradead.org, 
 gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org, 
 johan@kernel.org, jirislaby@kernel.org, kasong@tencent.com, 
 qi.zheng@linux.dev, shakeel.butt@linux.dev, baohua@kernel.org, 
 axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com, 
 baoquan.he@linux.dev, baolin.wang@linux.alibaba.com, yury.norov@gmail.com, 
 linux@rasmusvillemoes.dk, pavel@kernel.org, lenb@kernel.org, 
 hannes@cmpxchg.org, brendan.jackman@linux.dev, ziy@nvidia.com, 
 sj@kernel.org, muchun.song@linux.dev, osalvador@suse.de, 
 nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com, 
 lance.yang@linux.dev, usama.arif@linux.dev, kas@kernel.org, 
 xu.xin@linux.dev, chengming.zhou@linux.dev, joshua.hahnjy@gmail.com, 
 rakie.kim@sk.com, ying.huang@linux.alibaba.com, matthew.brost@intel.com, 
 byungchul@sk.com, apopple@nvidia.com, rientjes@google.com
In-Reply-To: <av1PyBvUVJcy_Psd@MWDK4CY14F>
References: <20261114070959.3490008-1-gourry@gourry.net>
 <20261114070959.3490008-14-gourry@gourry.net>
 <av1PyBvUVJcy_Psd@MWDK4CY14F>
Date: Wed, 18 Nov 2026 10:25:22 -0500
Message-Id: <179501552287.1206716.17381960047395782233.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-18 15:32 +0800, Richard Cheng wrote:
> > @@ -3802,23 +3801,21 @@ static int set_max_huge_pages(struct hstate *h, unsigned long count, int nid,
> >  	unsigned long allocated;
> >  	struct folio *folio;
> >  	LIST_HEAD(page_list);
> > -	NODEMASK_ALLOC(nodemask_t, node_alloc_noretry, GFP_KERNEL);
> > +	NODEMASK_ALLOC(struct nodemask_scratch, scratch, GFP_KERNEL);
> >  
> > -	/*
> > -	 * Bit mask controlling how hard we retry per-node allocations.
> > -	 * If we can not allocate the bit mask, do not attempt to allocate
> > -	 * the requested huge pages.
> > -	 */
> > -	if (node_alloc_noretry)
> > -		nodes_clear(*node_alloc_noretry);
> > -	else
> > +	/* Scratch masks for allocation eligibility and per-node retries. */
> > +	if (!scratch)
> >  		return -ENOMEM;
> > +	nodes_clear(scratch->mask2);
> >  
> >  	/*
> >  	 * resize_lock mutex prevents concurrent adjustments to number of
> >  	 * pages in hstate via the proc/sysfs interfaces.
> >  	 */
> >  	mutex_lock(&h->resize_lock);
> > +
> > +	/* Fresh pool pages come from the ordinary allocation domain. */
> > +	nodes_and(scratch->mask1, *nodes_allowed, node_states[N_MEMORY_COMMON]);
> 
> For a global request the caller passes &node_states[N_MEMORY], so before this patch
> the grow loop read the live mask on every alloc_pool_huge_folio().
> Now the mask is sampled once, before the loop.
> 
> The loop drops hugetlb_lock and can run for a long time. If a node gets its first
> memoroy in that window, the old code would start using it. The new code won't, until
> the next write to nr_hugepages.
> 
> So the pool can end up uneven, or smaller than requested if the other nodes are full.
> 
> I think the nodes_and() should be placed inside the loop to keep the old behavior ?

I can make the adjustment, but the concern is that previously we'd
start spreading the distribution of hugepages differently when there's a
race between hugetlb allocation and memory hotplug?

That seems like a pretty innocuous corner case to be worried about.

I can see about retaining the old behavior, but i'm not sure what you're
describing is reliable behavior already.

-- 
~Gregory

