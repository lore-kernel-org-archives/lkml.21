Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795367030;
	b=05zA07FD4gv26r/METynAhMLXT/C1YLHYiq5fXCdQfv+JB32xdys3RhAnX24i21LZP2K
	 Z713deUdEpJT9lVtOh+NUIZ4RGW6GrSVoN4vrW1xdGr6x+9D5UXu6rPw+253goUc6jHNU
	 NEk3/aG62JHHbrUxJ0XJ8s+Mvzhv54lTE9LEPll/RSKU9vU8mWkyNxzXg06chN4bIzni4
	 RUToRGG9lFVr1/2wilyAl3+3doVMVIKofaI0aX2lbuMyJVbv/CZCCNIfFFlib8B7/bT2l
	 E7EIY90G5plpYDknCxs2b6kVYQm3jqHY2aIyk+93fry++V7Rxis1aQmIJVtYyWNC8vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795367030;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=pmTrwXa44wNwYeC7jaSDYKhs1kagM9vZS4uaKGYPdVA=;
	b=zYGfW6KxgRypuQPDrjw0aXlJ+/tja7fgynX21woE8K/GSBrdPnLbhSjmdhiy4Z7ygK3D
	 j3ly5SV+PPFB9Zhh/QkX7AcOpHd1sEPl7J6rArGHxgYsFczI6xds20j87s8F+8UvZvx6v
	 YiFga2E1FlQQUnnkIXHMy0+ZV2LjwdvpVDRG+XsWnNt9xnmhxsY/xwB/MD2rV2owrM/x1
	 F2lk3X2W0erHpMnjMV8E5rH6TgV4S+mvE984By+gevIM5l3bj5NDWqXKuGbCCTBnSDwUf
	 3vPDNwSYxqRN6DI9GN6FH+rf09PnC0oJA7Sd2CpgZTu0GR5Hfr/ik8dziZPECryTyTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S+EDjXl5;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97725606A332
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 17:03:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97725606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S+EDjXl5
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2f00fc215f9so17092445ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 09:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795367029; x=1795971829; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pmTrwXa44wNwYeC7jaSDYKhs1kagM9vZS4uaKGYPdVA=;
        b=S+EDjXl5x9/onQ9QBL2h4s608i+Iv1fYa3RapZ2gSXWpIlrZy/Cjig6y47F/NkAT/F
         UFOT1MiPKDDEizIXETtlSq0L//tRVBWAtaaeqLzq4IhwfG6Lf2DdZDzge/Yy33Tf8/2f
         aXG1MnXwawTJJuz1LTesilgK68UdB+CM4IgERtzl7I1UwxBJHaKE8DGRXb+r77ohEKSU
         cvOiDvu+4clRldEoMQ+AWbw4WWcBNgCIg5g38OsyLtWym3aBZcvbAbuWYdwFU3D2TrsZ
         Bnqw5O1UKyFJ97iUdWK1zVB1bkcuYJgmfL1w2F3Ayfs3N4454b44TjyNfp231GIPb4Vh
         TuhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795367029; x=1795971829;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pmTrwXa44wNwYeC7jaSDYKhs1kagM9vZS4uaKGYPdVA=;
        b=BsgQBx3SyyePPmYpp/fapRvZ4kSRcWOzrFl/V11jKSdtCovNrfohr/BIC6IxXDVKju
         a9/B+GEngF0hxiOz2OPhjHppLsGV+HoiPZQXtasAT5N1AWkoX/sWwqw/3MEghezNfk7I
         FqNxp1UI15K4NpNU/ZEzm6XsAg/dCKTZMuDufK5vKCGnibqKtIh+pAqSPCkiCSElZHl6
         qf1Z3NdLcntT/1eBCe8CB6YZOLDNWTaMSZLgg4IbQOyuJeqzQzG2aLXkeREWK8vhs2Pt
         uRxag/5cISNN/vDXF4Yqdl/4zvvM507bW16kTc3RHfxJ7pxovKTFNYjq68PR5EBa5uUh
         +Mnw==
X-Forwarded-Encrypted: i=1; AL+hErF4EW0vsbtUiwOLcBDyofgIAZla0A9kb3WSGINqu8uhUwPIK2+kbOunPekxbQ8j2wxCagBm//bNVyRtP0I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZoB1uBYq/DdBYP6fAsugJb2EpUp/2qlhmtMeKZJ6x+hJpmULe
	8aCld4XF0hhqnalwDliW4hHVVe6hXwWPLhABuldeHaGasz6/6knW3MqQ
X-Gm-Gg: AZFdTZfK2m2fBG2ZzbcGKMBVXFZzzY0GjSgsYBRHUu76hCdo+pYw+T73xu53Mb/wlpA
	g2Eg82GkiQi86uZ0uMpchyY+PW6zcRwOzEn55lpfUKD33vxmkxGUqivhj2CbE1qAQzVlVUokzJI
	FzydELD48m/Z0fn1OkP8fNSLyp60PjIqtSh5+jZ66EDMNyHhBw6GsCYSSAAC/HOQighLr5iYdn2
	XP6zp7JQ6OqRczYRsjazCOGxWQ/NB5MRmJsJh7bVqkEsLWXmc/POQeMHW5uOPQ6wRF/IJtzrLNn
	XbdUXi5RfPBsHI9/LXoGg2t7nofsFXfRuFw7gPrLtEIiYDJ3omwvjzMT/kwcFQEMz8av+PQRCpq
	mZQlaVl8W0y8aGjtr6XKzNR7x0YcZZlgVUZErHbv+8DTSQz7S2vQPAAUUpgaAek3bjtcPk9ct4X
	EwJXGbkcR79xPzVbXDRdBScwYCalulQ4jk1S448Th21nINKzsHbt/e6d9rSjddXJ2kMNYGja7d8
	i1yZGkRaoYEvNPya72DVs30jupulZ3v/dAGNKPPWluYk0u7az4PTUYBKU3lbsoh4UJuI1FdC8pF
	lRSNqkpX5x6KPNDqxsJSesE7ILVIxURofuNmn4Un1AnG2gkWeYtAnbbNeTLO8D8dALA0fGA=
X-Received: by 2002:a17:903:41cd:b0:2e9:8bd4:577d with SMTP id d9443c01a7336-2f03f1bfa6fmr95419565ad.37.1795367028759;
        Sun, 22 Nov 2026 09:03:48 -0800 (PST)
Received: from KASONG-MC4 ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c42b1sm39111735ad.17.2026.11.22.09.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:03:48 -0800 (PST)
Date: Mon, 23 Nov 2026 01:03:34 +0800
From: Kairui Song <ryncsn@gmail.com>
To: Muchun Song <muchun.song@linux.dev>
Cc: kasong@tencent.com, Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Chris Li <chrisl@kernel.org>, Baoquan He <baoquan.he@linux.dev>, 
	Nico Pache <nico.pache@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, linux-mm@kvack.org, Nhat Pham <nphamcs@gmail.com>, 
	Youngjun Park <youngjun.park@lge.com>, Zi Yan <ziy@nvidia.com>, Gregory Price <gourry@gourry.net>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>, 
	Hugh Dickins <hughd@google.com>, SJ Park <sj@kernel.org>, David Rientjes <rientjes@google.com>, 
	Yu Zhao <yuzhao@google.com>, Vernon Yang <vernon2gm@gmail.com>, 
	Zicheng Wang <wangzicheng@honor.com>, Chen Ridong <chenridong@xiaomi.com>, 
	Tal Zussman <tz2294@columbia.edu>, Xiang Liu <liuxiang.277@bytedance.com>, 
	Ehab Ababneh <ehab.ababneh@intel.com>, Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>, 
	Lian Wang <lianux.mm@gmail.com>, Joanne Koong <joannelkoong@gmail.com>, 
	Kunwu Chan <kunwu.chan@gmail.com>, Hui Zhu <hui.zhu@linux.dev>, linux-kernel@vger.kernel.org, 
	cgroups@vger.kernel.org, damon@lists.linux.dev, linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 04/17] mm/memcg: add folio-based lruvec live helper
Message-ID: <awMX9W-Ykjw4maRg@KASONG-MC4>
References: <20261119-mglru-fg-v5-0-9eee2fe97a2d@tencent.com>
 <20261119-mglru-fg-v5-4-9eee2fe97a2d@tencent.com>
 <42207e26-ba7f-4df5-8c80-71fa1b84d26e@linux.dev>
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
In-Reply-To: <42207e26-ba7f-4df5-8c80-71fa1b84d26e@linux.dev>

On Sun, Nov 22, 2026 at 03:53:44PM +0800, Muchun Song wrote:
> 
> 
> On 2026/11/19 05:03, Kairui Song via B4 Relay wrote:
> > From: Kairui Song <kasong@tencent.com>
> > 
> > Add a helper that resolves a live lruvec for a folio under RCU
> > without taking the lruvec lock.  It takes a folio directly so the
> > lruvec lookup happens inside the RCU read-side critical section,
> > which a lruvec-based interface cannot guarantee.  The first user is
> > the lockless folio_inc_lru_refs() path later in the series.
> > 
> > Factor the ancestor walk out of lruvec_live_lock_irq() into
> > __lruvec_get_live(), so that both entry points share it, and spell
> > out why the walk is enough while only the RCU read lock is held:
> > reparenting of a memcg that starts dying waits for a grace period,
> > so it cannot race with the caller until the lock is released.
> > 
> > Move memcg_is_dying() up in memcontrol.h, next to the other memcg state
> > predicates, and use it for the walk rather than repeating the open coded
> > css_is_dying() test a few definitions away from where it is explained.
> > 
> > No functional change for existing callers.
> > 
> > Tested-by: Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>
> > Signed-off-by: Kairui Song <kasong@tencent.com>
> 
> Reviewed-by: Muchun Song (ByteDance) <muchun.song@linux.dev>
> 
> Some nits bellow:
> 
> > ---
> >   include/linux/memcontrol.h | 71 ++++++++++++++++++++++++++++++++++++----------
> >   1 file changed, 56 insertions(+), 15 deletions(-)
> > 
> > diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
> > index 980358bc6f49..441a5d57e723 100644
> > --- a/include/linux/memcontrol.h
> > +++ b/include/linux/memcontrol.h
> > @@ -571,6 +571,11 @@ static inline bool mem_cgroup_disabled(void)
> >   	return !cgroup_subsys_enabled(memory_cgrp_subsys);
> >   }
> > +static inline bool memcg_is_dying(struct mem_cgroup *memcg)
> 
> Let's make it const for @memcg along the way.

Good idea, but css_is_dying isn't constified, maybe we can do it later I think.

> > @@ -1510,28 +1520,41 @@ static inline void lruvec_lock_irq(struct lruvec *lruvec)
> >   	spin_lock_irq(&lruvec->lru_lock);
> >   }
> > -static inline struct lruvec *lruvec_live_lock_irq(struct lruvec *lruvec)
> > +/*
> > + * Reparenting moves a dying memcg's LRU state to its parent at any time,
> > + * so anything added to that LRU afterwards would be lost.  This helper
> > + * walks up to the nearest live ancestor while the caller must hold the
> > + * RCU read lock: reparenting of a memcg that starts dying waits for a
> > + * grace period, so it cannot race with the caller until the lock is
> > + * released.
> > + */
> > +static inline struct lruvec *__lruvec_get_live(struct lruvec *lruvec)
> 
> Cound @lruvec be const as well?

The argument is fine, but tricky for the return value: when nothing is dying it
hands back @lruvec unchanged, so a const argument means a const return (which
isn't right) or a cast dropping it again.

> > @@ -1561,6 +1584,34 @@ static inline bool folio_matches_lruvec(const struct folio *folio,
> >   	       lruvec_memcg(lruvec) == folio_memcg(folio);
> >   }
> > +/**
> > + * folio_lruvec_live_get - get a live lruvec for a folio under RCU
> > + * @folio: the folio
> > + *
> > + * Same as folio_lruvec(), except that a folio whose memcg is dying is
> > + * accounted to the nearest live ancestor, which is where reparenting
> > + * would put it anyway.
> > + *
> > + * Return: the live lruvec, with rcu_read_lock() held.  Pair it with
> > + * folio_lruvec_live_put().
> > + */
> > +static inline struct lruvec *folio_lruvec_live_get(struct folio *folio)
> 
> const folio?

This is doable, will do!

Thanks for the review!
