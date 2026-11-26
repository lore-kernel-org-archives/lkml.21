Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795677406;
	b=tkmGOpiaaOr0A32ytUESUNwMTo9jqBAYvN9F4tn0ocOX+rNZ71VH9BQM9tbmMzFsFCul
	 4aXBnBZn0MPCxELtnizheF5Ei5Cl00JoX7OPjpEe91BqKpZqOuQffUxK1GuWiwPLdu/UQ
	 6AtOEMPi8HuHro1/53Q2hjfREXH+NFFa6MBa/j/q/M3j3ad/AUdY1lapEgQyTiu66448W
	 oFVoOSUCdmQUWtGD3R6nwKw7szB8jCEd01BPX4mcA5Hjt7UEL3vzuEthF7qnuNtmJGKMK
	 HqluM17UFUZBqeeDsZVESqZ6sZlGKXyp5rfiCpGg2HMR51Ca4VqPF0ASvRvSnjo5J4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795677406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=tioXBSwm5pktLh4V7ZjeytUoL0urdjzGdHunvMaRHSk=;
	b=uY6Iu/VsdbzYgDtkQQoVht0yRJLZnLJk6FzpH5TwWCDauZPqERH4kSdQC5sDSB0mVvRf
	 xHWRTIiF8yALuYC3qVWHCHSxDTESrcgZ2D8MyhGRXJkUFuMp6ee+g0BS9X/sXBumyLKdt
	 bYXHPJ5vpxU6mNm2Ie9cCaAuK2kdYSoep1vKhqgK8lZLnz5HFOZ/j5pHAIsMFrZQnIgfH
	 PFPgpmRyTpbsjzOmFFrMpRhWuH1HalcJEgLKUYRjGgvcmMfWs41tzobtgoCySztgsF/MM
	 ZIt6u7gEr522tcIye0JAKiyqslxabA+IgOGTUwnHQ36x6m9g0mWJPmKyY+3pVwfmA6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oi2Ks9b3;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802F0606A337
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:16:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 802F0606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oi2Ks9b3
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cd69954c755so4891555a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795677406; x=1796282206; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tioXBSwm5pktLh4V7ZjeytUoL0urdjzGdHunvMaRHSk=;
        b=oi2Ks9b3T4wlAj8zr6C3H3evvBHdgAPn4MlpNxzpJ39yFK2wco5D5Uai+HoB7RXilR
         B3329OrtXQcD9E13YoAoDRSV/mttgXULxSRf2+6fjDqsKkCTjsblzC4if3F2kuGA8NEo
         PV/OsLxIZSKzXnkMd6kb8yPaXCnzs3h8qHdiygf+M//zgca57HRzZm167dBnFxISbboN
         Knoyv/cC3Jh+HZY4+YgDlwQD8W+5mEvdM6dNEjQ4gizfbmedld31pW8jxgE9uA9XGvuK
         YSYpG56oLnyIMaDJ6ok858+qzM/jCAA8aJ9r51VbkzJ+1i8jflqPEFbx3ReNdkFqnRjb
         2AGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795677406; x=1796282206;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tioXBSwm5pktLh4V7ZjeytUoL0urdjzGdHunvMaRHSk=;
        b=DsjIuXUwmBgs9YGBlgRD01olCvFYnc/s/q39LvVGNfisasTyb2XG0VZcSSDsGtqNgN
         OvHNtbnizJkfTHsQT4iHqux5fBzSxu4/n6jLE9LLKOg/5YYV9U1cUf/H7Z+5aPCGNRBF
         V9IYBgQ9KpdTnBvvBKp4Y+ypdoIsQwfWVqnS+O+yqbRyDQ5GAeR0+namNHov9guxW2+S
         7zlprVHq9fDkflDhfSpoZ9AgX8TRxFnlFoarOfUCr4D6gwr6j907w3hq7YGrCs0x7isy
         5YmyY61QQJqzXH+siVoCqlCAiyxcBc7W1UgJAkEWRLgiafakDot2NvowTXQ13kwkNdNn
         xirg==
X-Forwarded-Encrypted: i=1; AL+hErFPka3Wm8V29HsCDiAIqFLtZcNRtb9YNbX//4RS7DW5CoxEaxkLNXgmKlraPr0uY0EBgb4UD8CKj5iS/Wg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+l4kNSRsoEKeQOlPkpueNqCdSPmZeIng5RepRCgacDqAEIVPEZ
	PW868VTDk1izd+eXkH/WRj+ku+O7nVwQmjTCpw0D1+au2/pPIAMRtuqt
X-Gm-Gg: AZFdTZe9syPNrgppPjiCI5FYhh8w7MMHjz23lIcX2rpsRbWBPseTHy7vXImPhjkCeqw
	QfmohKlBdqYkFize5/CX17gwun6NKljuOmEPCnJAqnQ2SrtLPop1uB0E/dY4zTuZ3+zJvBIA0re
	OzsdAjwyu8m/rWMknaZbIJUt+UoyvMzTtEw6sO8248Yw7mFYc7xgvvtU4jUkhr8RkfyQxhM24gJ
	0hbh93sHX7oOoeWbD/lIY5m+I0l2zfppn9LZJsIcvKmGa7UutqDJAJ5nEkcdtDnwCBAtLvN7VBU
	ZdgdJR9YwoGW2PtX/GdSHyRIw5vAfh5Meh3xKc2sp3aDqisN3NVvHWWaCaFq8UZk5rtn9wFiENG
	79+IZ41oqQKSm8xej7RAGnqhPEOKXWC8p2C4LQQ0TYR73Zc5B5a+K6CjttFytD0PnJDc9nZh2vF
	3gneR96gLphRFBuZAXSHngRHndcI/QWw7C+QfXnFQQSmox1tpfyxLwvs+tI/sW73EpRaTtTlu0Q
	I+cguwbbhFyTHSZ2XhVNfcSQUc80BmYLn7nbmamlQ0WVOwZlKKvXabi9HxzYPsh+v70AFn8qfZ4
	7ngArESnGzBuwsjFTw8R6D9WKyVccJWJHwYTQ40sWLW88JkzovleSjKQg5HRUKy0rwS0JKaqjcM
	=
X-Received: by 2002:a05:6a20:9389:b0:3eb:9e7e:1ebe with SMTP id adf61e73a8af0-4014b65c9ffmr25687016637.21.1795677405734;
        Wed, 25 Nov 2026 23:16:45 -0800 (PST)
Received: from KASONG-MC4 ([43.132.141.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c86d821637sm10523020b3a.0.2026.11.25.23.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 23:16:45 -0800 (PST)
Date: Thu, 26 Nov 2026 15:16:32 +0800
From: Kairui Song <ryncsn@gmail.com>
To: Vernon Yang <vernon2gm@gmail.com>
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
	Youngjun Park <youngjun.park@lge.com>, Zi Yan <ziy@nvidia.com>, Gregory Price <gourry@gourry.net>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>, 
	Hugh Dickins <hughd@google.com>, SJ Park <sj@kernel.org>, David Rientjes <rientjes@google.com>, 
	Yu Zhao <yuzhao@google.com>, Zicheng Wang <wangzicheng@honor.com>, 
	Tal Zussman <tz2294@columbia.edu>, Xiang Liu <liuxiang.277@bytedance.com>, 
	Ehab Ababneh <ehab.ababneh@intel.com>, Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>, 
	Lian Wang <lianux.mm@gmail.com>, Joanne Koong <joannelkoong@gmail.com>, 
	Kunwu Chan <kunwu.chan@gmail.com>, Hui Zhu <hui.zhu@linux.dev>, 
	Maxim Muzafarov <maxmuzaf@gmail.com>, linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	damon@lists.linux.dev, linux-doc@vger.kernel.org, Tianyi Chen <hi@tychen.cc>, 
	Ridong Chen <ridong.chen@linux.dev>
Subject: Re: [PATCH v6 10/18] mm/mglru, gup: mark folios referenced via a
 fast helper
Message-ID: <awfb-vGF62XvcX_F@KASONG-MC4>
References: <20261124-mglru-fg-v6-0-8ffea39934a6@tencent.com>
 <20261124-mglru-fg-v6-10-8ffea39934a6@tencent.com>
 <6c3d32a9-3004-4a17-b854-7088e69f164a@gmail.com>
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
In-Reply-To: <6c3d32a9-3004-4a17-b854-7088e69f164a@gmail.com>

On Wed, Nov 25, 2026 at 09:47:18PM +0800, Vernon Yang wrote:
> On Tue, Nov 24, 2026 at 02:53:02AM +0800, Kairui Song via B4 Relay wrote:
> > +/**
> > + * folio_inc_lru_refs_fast - Bump folio refs count without promotion.
> > + * @folio: the folio
> > + *
> > + * Raise refs from 0 to LRU_REFS_REFERENCED and leave hotter folios
> > + * untouched. For a folio off the gen lists with MGLRU off, a plain
> > + * PG_referenced set.
> > + */
> > +static __always_inline void folio_inc_lru_refs_fast(struct folio *folio)
> > +{
> > +	unsigned long new_flags, old_flags = READ_ONCE(*folio_flags(folio, 0));
> > +	unsigned int refs;
> > +
> > +	do {
> > +		refs = lru_get_refs_flags(old_flags);
> > +		if (lru_get_gen_flags(old_flags) < 0 && !lru_gen_enabled()) {
> > +			/* For CLRU, just do folio_set_referenced() */
> > +			if (refs & LRU_REFS_REFERENCED)
> > +				break;
> > +			refs |= LRU_REFS_REFERENCED;
> > +		} else {
> > +			if (refs)
> > +				break;
> > +			refs = LRU_REFS_REFERENCED;
> > +		}
> > +		new_flags = old_flags;
> > +		lru_set_refs_flags(&new_flags, refs);
> > +	} while (!try_cmpxchg(folio_flags(folio, 0), &old_flags, new_flags));
> > +}
> 
> The implementation code of this function looks a bit convoluted.
> Would it be better to simplify it into the following code?
> 
> 	do {
> 		bool clru = !lru_gen_enabled() && lru_get_gen_flags(old_flags) < 0;
> 
> 		refs = lru_get_refs_flags(old_flags);
> 		if (clru ? (refs & LRU_REFS_REFERENCED) : refs)
> 			break;
> 		new_flags = old_flags;
> 		lru_set_refs_flags(&new_flags, refs | LRU_REFS_REFERENCED);
> 	} while (!try_cmpxchg(folio_flags(folio, 0), &old_flags, new_flags));

Hello Vernon,

That's very good suggestion!

Only one thing here is that
`!lru_gen_enabled() && lru_get_gen_flags(old_flags) < 0` doesn't mean
it's classical LRU, maybe it's just isolated. How about bool on_gen?
Or bool has_gen?
