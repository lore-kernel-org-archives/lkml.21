Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795689456;
	b=K5qOXNRFDlRWU0wDX847KwDQllMbFRDDM/SatWt0lq/lM+J+9MlAByy6HzyeTNY+JHKt
	 PiyXTFoENcyJu7f+ScRRuimz+kgve4VJoctEGvF3CWMYVDMT/u4iOJDsK0Ei9wEvoF02G
	 ZbawRs+feEuag8PrutouooMxoBmBXRHJPQ40dZNcm4uqnfCcjmFkxlOjgxaurKwOdjkB4
	 e7dQxzT897Rlfk+ii8UzeABk2t7z+yg+Wz+Fim8TyMU4x5oz9z50vVyQmZsGbKBfaDWlW
	 iP+CkeY4BN5oWCGRGji3BO/ZY3SiRw9YV5RevuqzNZbjHrAF6rrbMgUJGRUiW7Z52iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795689456;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=zp08wFsGJ44C0c4ykLgsDmwy4mpu8EhHOI/Atjz+FcY=;
	b=bHTuBd0Wv7+xAa8nnVen5J9uMonIK4DvmA/ZFKlQELwmfE40rcbmer4i7xmWlCmIAcKt
	 3xY38fSupbeTfXd/OROXN3ujIdC0ETTEIVrQubu9oOohLLXAZp6x7tLBmpbx4DzY8h7w8
	 74C2i3XcuKdz1q7KuGRWLnWvzBhfLCUGLKCaU72jmaqlzHDR/pMfQzOcS44s03ZOnX4vD
	 XC1merIqPk+l+VpuvztJF4FGrivs6uctg2aL3B7CPURjfoRl3Z8sSlE92p71tpZDkQ6KD
	 ZCG/uPpJrlWoTEZvFiWMs+DYI2rfggzuf1D64YhrOwL3bw//DmwrvIoArMpN3OeAMUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DS3va9Na;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9608606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:37:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9608606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DS3va9Na
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8b5e5e64494so3737970b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795689455; x=1796294255; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zp08wFsGJ44C0c4ykLgsDmwy4mpu8EhHOI/Atjz+FcY=;
        b=DS3va9Nah+qo8NmPoybsVbQTP5+RfPXwbr9pnrsMFUn71/y1+eL5VaaI8mudsiB/MN
         zXE1B6G2/KNblYzf5TLUNm2pHmBmd9SBA49n1B2S7kV912QYp397S3KfCQLzvRQBhLxj
         QpoI5r+s0wB9mkDj3fymEm15r5LRmFQDa1zB2UHZP2tZb2kxBc35P2nBObvqttgD0rwD
         Q/uD5qOJ9rVNrFWFG28qf0KzmLppIKnPygrknpqQOJ1BcQfYHd7JqPdXYa7FJyk4PuZR
         zyJlsuZ+g4ZGHAujZXqRQrTlbNxibtAmMZNt7UbxoquupueDWX8WyMo1Ak6gpyS9MHOQ
         cbLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795689455; x=1796294255;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zp08wFsGJ44C0c4ykLgsDmwy4mpu8EhHOI/Atjz+FcY=;
        b=h9wiCJ0YlgO45F1fgthF1x8+7UGCdgpHSquda177LPsAT+1sGVOfXVdOp+kE2zxvmJ
         mjFo8rFD/PRH6dgLa3fGx5WoBupHoj4aL3q7dExzDZy9k2agPEwPfx1RfbQ1n9UDwk9W
         RLg9U32uV6vSrl2cIIRqWRQLXwnHwFT97ynkuPVuFOJ4SJAgIrNGhn3TXrv1cPdy6p5S
         Rp+wfuyP9va+YdLdMbcC8riBnGFwTW6t81CaNoJPIh6VApPz9NDwtYOfxB1YKV34jhhN
         o8ql9YyJTJN/dt1pwRtc3PGiMBMX3zCzCVRlIEouj2SeYTLpX/HJf7s84onH8+dK1MIa
         GRzw==
X-Forwarded-Encrypted: i=1; AL+hErHE+i0kiya55pRyxuZ9e2JU9Tz/2fPu8YgWOhi1VRDCKywIfKEecyY7mF6hGtkCCHqhSUxT6e5c7FlTCZw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IM+9YeNFwYqXqJcSfTp0ZHB9ds+e0BhDHkm/8MRDGepor0x1N
	gfM6mbt0HW20y9k4P9Jc+07aj91xrhJtSX/WcwPe4EuVr96z8lTOUUg+
X-Gm-Gg: AZFdTZcDEYJZQC8FjGMlZH3rd2I25PExVol3aPztSLeJO1LDyzCSQ8LfW7MBW4aFC2F
	pc+XVAy1ML0rzrwb60zM/8Z+Few+eqNLaULjCWSjOGumDLj2v2RpAiOLMv8XvscVUWI2nQQ3mLf
	EkC+azmrEWpDC1HLAy76LZ/j1dctlKetyjP9EMHKSEVLo+0as0LdaNZgnlwSokluYO61hA18PPX
	syeM2PzAAlGVsbiMHOUQLsMEyOpIElGM9qllqRU8rvO/TW/xQbF1NTH0wa4gH/KGJ30S6LQYVFC
	8KoSg2EmjB8rtllfHLz8PSq2MK2dzK7rzeseod7jFfpB0L3VxCQpGf8ZnJTd7kTiVGvwY8IXfJo
	xtek8e3riJDtyNO5KNxPXNzP/t/D8/lkUVpmKa/8D0Y5G2OZeWbGO3e8fx0tTORjWpzyIMEBWVb
	V401z4DCkFj3pjv2Tx2xrI9EdD7CnV3/XtevPLCM9KLdbKtTe1ZfaFnstBxnQ+BecFoFQ4plZL/
	M1S/9UDqVRacqmrWkpN262S5ryc3oHvV0hDX36zv+/51+5iWiFE+wXu9H0sWvDkXfonJZ6k65J4
	dWAJl0UosqcbamffoO6/WtECPX9Eva+VC2nfOBha5IT9YglTSkX/dENTJDhVjmw8hEtaBiu6pGJ
	/C9Pe2pgncwveZg==
X-Received: by 2002:a05:6a21:3d8b:b0:3e2:7c10:d482 with SMTP id adf61e73a8af0-4014b564366mr17311908637.16.1795689454813;
        Thu, 26 Nov 2026 02:37:34 -0800 (PST)
Received: from KASONG-MC4 ([114.254.0.53])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87353b889sm10702825b3a.42.2026.11.26.02.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:37:34 -0800 (PST)
Date: Thu, 26 Nov 2026 18:37:22 +0800
From: Kairui Song <ryncsn@gmail.com>
To: Ridong Chen <ridong.chen@linux.dev>
Cc: "Barry Song (Xiaomi)" <baohua@kernel.org>, akpm@linux-foundation.org, 
	linux-mm@kvack.org, axelrasmussen@google.com, baolin.wang@linux.alibaba.com, 
	baoquan.he@linux.dev, hannes@cmpxchg.org, hui.zhu@linux.dev, kasong@tencent.com, 
	kunwu.chan@gmail.com, liam@infradead.org, lianux.mm@gmail.com, 
	linux-kernel@vger.kernel.org, liuxiang.277@bytedance.com, lyugaofei@xiaomi.com, 
	mhocko@kernel.org, mhocko@suse.com, qi.zheng@linux.dev, rppt@kernel.org, 
	shakeel.butt@linux.dev, surenb@google.com, wangzicheng@honor.com, weixugc@google.com, 
	yuanchu@google.com, zhangbo56@xiaomi.com, zhuhui@kylinos.cn, 
	sidchintamaneni@gmail.com
Subject: Re: [PATCH v9 07/16] mm/mglru: balance anon and file scan budget by
 refault rate
Message-ID: <awf7WGiaC4LVLYhA@KASONG-MC4>
References: <20261114200803.23129-1-baohua@kernel.org>
 <20261114200803.23129-8-baohua@kernel.org>
 <5238e574-ed22-4781-aac2-b91a6b2d911e@linux.dev>
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
In-Reply-To: <5238e574-ed22-4781-aac2-b91a6b2d911e@linux.dev>

On Thu, Nov 19, 2026 at 05:48:38PM +0800, Ridong Chen wrote:
> 
> 
> On 11/15/2026 4:07 AM, Barry Song (Xiaomi) wrote:
> > From: Kairui Song <kasong@tencent.com>
> > 
> > Replace get_type_to_scan() and isolate_folios(), which selected one
> > type per batch, with a proportional split of the scan budget between
> > anon and file, and scan both types each round.
> > 
> > lru_gen_balance_scan() splits the total by
> > 
> >          anon : file = swappiness * r_file * w_anon :
> >                        (MAX_SWAPPINESS - swappiness) * r_anon * w_file
> > 
> > where r_anon and r_file are the per-type refault rates scaled by
> > 4096, clamped to [1, 4096]; a rate at the 4096 ceiling means the type
> > refaults at least as often as it is evicted. The w factors bias the
> > split toward the LRU sizes at mild swappiness and follow the IO cost
> > ratio at the extremes. Both rate accumulators start at MIN_LRU_BATCH,
> > so a type without eviction history reads as 100% until evictions
> > accumulate, and the floor of 1 keeps a type that never refaults from
> > zeroing out the other type's share. Swappiness 0 and
> > SWAPPINESS_ANON_ONLY keep their single-type behavior; at swappiness ==
> > MAX_SWAPPINESS the file factor is zero, so anon gets the whole budget,
> > as in the classical LRU; swappiness 1 no longer forces file-only
> > scanning as the old code did.
> > 
> > The proportional protection and priority reduction are applied to the
> > total once, before the split, and each budget is capped at its type's
> > evictable size. Regular reclaim derives the total from the evictable
> > sizes, so the budgets sum to it. The proactive path re-splits the
> > remaining target each round, so eviction keeps working while either
> > type makes progress, until the target is met or no progress is
> > possible. The debugfs scan_control gets .priority = DEF_PRIORITY so
> > eviction starts from the oldest gen and reports the default priority
> > in the tracepoints.
> > 
> > Note that we are already lenient with the debugfs proactive
> > reclaim interface. We may reclaim one generation ahead even
> > at `DEF_PRIORITY`, and with extreme swappiness values such
> > as 1 and 200, we may not fall back to the other type.
> > 
> > To address these cases and preserve the behavior of the
> > previous model before scan-budget-based reclaim, we would
> > need to add another flag to `scan_control`. However, this
> > may not be worthwhile for a debugfs interface that is likely
> > to be rarely used, especially given that we already have
> > memory-level and node-level proactive reclaim interfaces.
> > 
> > Signed-off-by: Kairui Song <kasong@tencent.com>
> > Co-developed-by: Gaofei Lyu <lyugaofei@xiaomi.com>
> > Signed-off-by: Gaofei Lyu <lyugaofei@xiaomi.com>
> > Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> > ---
> >   mm/vmscan.c | 219 +++++++++++++++++++++++++++++++++-------------------
> >   1 file changed, 138 insertions(+), 81 deletions(-)
> > 
> > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > index f7fbe91fedf3..18cf1c084e78 100644
> > --- a/mm/vmscan.c
> > +++ b/mm/vmscan.c
> > @@ -4863,79 +4863,110 @@ static int get_tier_idx(struct lruvec *lruvec, int type)
> >   	return tier - 1;
> >   }
> > -static int get_type_to_scan(struct lruvec *lruvec, int swappiness)
> > +/*
> > + * Balance the anon vs file scan budget using MGLRU's per-type refault
> > + * rates, where swappiness is the relative IO cost of anon vs file (see
> > + * Documentation/admin-guide/sysctl/vm.rst).
> > + *
> > + * On entry, nr[] holds the evictable size of each type, on return it
> > + * holds each type's scan budget, bounded by its evictable size.
> > + *
> > + * LRU lock not needed: a stale snapshot merely skews the split for one pass,
> > + * and MGLRU aging averages the fault rate so we can simply read it, no need
> > + * to do any extra work here. If reclaim is blocked by unfair type hotness or
> > + * stall aging, the priority will raise and a raised priority drives the
> > + * aging.
> > + *
> > + * Calculation is basically based on following formula with a LRU size bias:
> > + *
> > + * anon : file = swappiness * r_file * w_anon :
> > + *               (MAX_SWAPPINESS - swappiness) * r_anon * w_file
> > + *
> > + * r_file / r_anon: refault rate for file / anon.
> > + * w_file / w_anon: LRU size weight of file / anon.
> > + *
> > + * We don't calculate the scan cost. MGLRU uses lazy promotion, which will
> > + * cancel the scan budget naturally.
> > + */
> > +static void lru_gen_balance_scan(struct lruvec *lruvec, int swappiness,
> > +		unsigned long total_scan, unsigned long nr[])
> >   {
> > -	struct ctrl_pos sp, pv;
> > +	struct lru_gen_folio *lrugen = &lruvec->lrugen;
> > +	u64 refault_rate[ANON_AND_FILE], anon_factor, file_factor;
> > +	u64 anon_scan, file_scan, total;
> > +	u64 anon_weight, file_weight;
> > +	int size_bias;
> > -	if (swappiness <= MIN_SWAPPINESS + 1)
> > -		return LRU_GEN_FILE;
> > +	total = nr[LRU_GEN_ANON] + nr[LRU_GEN_FILE];
> > +	if (!total)
> > +		return;
> > -	if (swappiness >= MAX_SWAPPINESS)
> > -		return LRU_GEN_ANON;
> > -	/*
> > -	 * Compare the sum of all tiers of anon with that of file to determine
> > -	 * which type to scan.
> > -	 */
> > -	read_ctrl_pos(lruvec, LRU_GEN_ANON, LRU_TIER_MIN, LRU_TIER_MAX,
> > -		      swappiness, &sp);
> > -	read_ctrl_pos(lruvec, LRU_GEN_FILE, LRU_TIER_MIN, LRU_TIER_MAX,
> > -		      MAX_SWAPPINESS - swappiness, &pv);
> > +	if (swappiness <= MIN_SWAPPINESS) {
> > +		nr[LRU_GEN_ANON] = 0;
> > +		nr[LRU_GEN_FILE] = min_t(u64, total_scan, nr[LRU_GEN_FILE]);
> > +		return;
> > +	}
> > -	return positive_ctrl_err(&sp, &pv);
> > -}
> > +	if (swappiness == SWAPPINESS_ANON_ONLY) {
> > +		nr[LRU_GEN_FILE] = 0;
> > +		nr[LRU_GEN_ANON] = min_t(u64, total_scan, nr[LRU_GEN_ANON]);
> > +		return;
> > +	}
> > -static inline bool is_single_type_reclaim(int swappiness)
> > -{
> > -	return swappiness == MIN_SWAPPINESS ||
> > -	       swappiness == SWAPPINESS_ANON_ONLY;
> > -}
> > +	for (int type = LRU_GEN_ANON; type <= LRU_GEN_FILE; type++) {
> > +		int hist = lru_hist_from_seq(READ_ONCE(lrugen->min_seq[type]));
> > +		/* start at MIN_LRU_BATCH to smooth the rate on gen start */
> > +		u64 refaulted = MIN_LRU_BATCH, evicted = MIN_LRU_BATCH;
> > -static int isolate_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
> > -			  struct scan_control *sc, int swappiness,
> > -			  struct list_head *list, int *isolated,
> > -			  int *isolate_type, int *isolate_scanned)
> > -{
> > -	bool type_fallback_allowed = !is_single_type_reclaim(swappiness);
> > -	int type = get_type_to_scan(lruvec, swappiness);
> > -	int total_scanned = 0, scanned, tier;
> > -	bool tried = false;
> > +		for (int tier = 0; tier < MAX_NR_TIERS; tier++) {
> > +			refaulted += READ_ONCE(lrugen->avg_refaulted[type][tier]);
> > +			refaulted += atomic_long_read(&lrugen->refaulted[hist][type][tier]);
> > -retry:
> > -	tier = get_tier_idx(lruvec, type);
> > -	scanned = scan_folios(nr_to_scan, lruvec, sc,
> > -			      type, tier, list, isolated);
> > +			evicted += READ_ONCE(lrugen->avg_total[type][tier]);
> > +			evicted += atomic_long_read(&lrugen->evicted[hist][type][tier]);
> > +		}
> > -	total_scanned += scanned;
> > -	if (*isolated) {
> > -		*isolate_type = type;
> > -		*isolate_scanned = scanned;
> > -		return total_scanned;
> > +		/*
> > +		 * The rate scaled by 4096 to survive integer division, clamped
> > +		 * to [1, 4096] (~0% - 100%), the floor of 1 keeps a type that
> > +		 * never refaults from zeroing out the other type's share.
> > +		 */
> > +		refault_rate[type] = mul_u64_u64_div_u64(refaulted, 4096, evicted);
> > +		refault_rate[type] = clamp_t(u64, refault_rate[type], 1, 4096);
> >   	}
> >   	/*
> > -	 * We are running out of the current reclaim type. Fall back to
> > -	 * the other type if allowed.
> > +	 * The more extreme the swappiness, the wider the IO cost gap between
> > +	 * anon and file, so the split should follow the IO cost ratio rather
> > +	 * than the sizes. With a mild swappiness, balance the scan by the
> > +	 * actual LRU size more.
> >   	 */
> > -	if (!scanned && !tried && type_fallback_allowed) {
> > -		type = !type;
> > -		tried = true;
> > -		type_fallback_allowed = false;
> > -		goto retry;
> > -	}
> 
> Hi Kairui, Barry,
> 
> A question about the size weight:
> 
> > +	size_bias = max(1, min(swappiness, MAX_SWAPPINESS - swappiness));
> > +	anon_weight = nr[LRU_GEN_ANON] + nr[LRU_GEN_FILE] / size_bias;
> > +	file_weight = nr[LRU_GEN_FILE] + nr[LRU_GEN_ANON] / size_bias;
> > +
> 
> In the classic LRU, get_scan_count() weights each type by its own size
> only.

Hi Ridong

> 
> Here each weight also includes the other type's size / size_bias. So
> around swappiness 100 the split follows the sizes like the classic LRU,
> but near swappiness 1 or 199 the sizes cancel out and the split follows
> swappiness only.
> 
> For example, anon 3G, file 100M, same refault rate, anon share of the
> scan budget:
> 
> 	  swappiness   classic   this patch
> 		 100         97%        96%
> 		  10         62%        28%
> 		   1         13%       0.5%
> 
> Having two behaviors in one formula is a bit confusing. What is the
> reason for this blending, and is there data behind it? Would weighting
> each type only by its own size, like get_scan_count(), work as well?

Your numbers are right, but get_scan_count() isn't just balancing by size:
swappiness goes through calculate_pressure_balance(), and the cost there is
refault IO plus rotation cost, size turns that pressure into a page count.

With w = own size we'd match your classic column exactly, the bias is the
only difference. And the bias is there on purpose: 0 and 201 are single-type
and never reach the formula, while 1/200 are their counterparts, which is what
get_type_to_scan() used to hard-code. If the user asks for an extreme setting
then we respect it, and 15/16 and 16/16 make those ends exact. And this also
matches the other parts:

We don't use classic's cost accounting here. The rotation part is gone
with lazy promotion: a young folio stays in its gen instead of being rotated,
so the budget is bounded by the evictable size automatically. And the refault
part is already kept per type and tier by MGLRU PID, and aging averages it
so we can read it locklessly, a stale snapshot only skews one pass.

So that's the whole model, it is a bit different but works well.
Barry posted a lot of test data through v1 to v9, the swappiness sweeps
(1/60/100/150/200, with per-type pgscan and refault) show the balance moving
as described, including the ends.

There could be some pitfall with PID's ineffective protection for
high swappiness so with high swappiness you may observe a worse
refault after this, however it is not caused by this, same problem
exists for file heavy workloads, and will be solved with MGLRU-FG.
