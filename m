Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795600994;
	b=LBMskmH2gJaq7XjxVIMAgNFDXVdoieVyYqUHr158NM63YMFzQ9+m9PnBhld6HAu/gJ/l
	 wN1qBIvRI5ZfaghAq8NdDAxZrZXd1z0DvvEdL0XhB1YKgnWDFyGedA3eZmSVEdwvpHBV2
	 H4c1maXVSHC2BjER0XEQP7e3zBj78c2RLxgtN8MBpH9zne6Y+3na7IyPTkNDReYpnQ64J
	 LcTIt0EEZURaMOqum4QvUq4AnT/Yq/1cf2ThkHfnXuUFPEw74DbU3xiKTJYCsPIs22uYy
	 Tv69VbO73+LUNOep3G8b7vNzcxPAk1dfO8I0ryGUgENWIaQwVgbcbTATZHWXelmMlOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795600994;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ahAD1nTlJMyKd+Ivy4YWjGLtR4U+tnl+mOngOadx7yo=;
	b=l7In6YCCnKqHEQP47hm6SKiwz86tc2BvkawErHs6k0Zt+OmUPAtatbiOVN/PXWZuujF1
	 ezAA2yjwaT7M1AinjSpgk8V4gstjriM2SbDlkof1Zhoh2PqIxJCXs0Ph3XD039sp5etIT
	 rr0G1IN48fwLfcLPiBOKJVzmOVhmTpmqQSzUwTfHcvoF5XwqhpypTanh/5yq1en5yoEhU
	 aXF0EpKlTCudb8SdPwmkp9h5vGvVFSHjDfyoT1Llf9h+TelKqHDLJNzj0eH0dzzE1P5QA
	 rLboy63rmjTif3oXZVoC9+lfNWctxrlOAB28ekxjJoqSI0vZyGzoJZONTUjgLZsTBeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aB9TCN5u;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367D0606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aB9TCN5u
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D340C1F0156A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795600993;
	bh=ahAD1nTlJMyKd+Ivy4YWjGLtR4U+tnl+mOngOadx7yo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=aB9TCN5un+FY44DyzDWOfl/JnifH+71Ve+hTPGcSbb5FWibTB8+3/a03RedeyXNtw
	 Ut9a/5zRNkzIfwPM6/c+S+na0kzX2kwPZHrDCK52XhWFCBtUhcZrVR5Upx3aWadPFo
	 8NJWiQuMjAfswvt25VnnqVlrijaEO4ceNFKGLCrVfyg8PKFfhQM49xUc4KNORl245l
	 xwGeI6stLtGCII8QWnG9I6IawEmJ4MBCp6r1t47BEYd7Yu5SmPp38aOviFYzyzKXUM
	 ZMhk/UIIo8OdYZxxNmfjRj7D5vITgRvSjWY5jFCjjYLxbODxTN94UtKki/yrvlBR7h
	 59NtENOfSatLw==
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-9496577d4c4so628440985a.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:03:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGMwfgX746Cd006DexctG+7WDcbQmVOTowXiAD9GIHadw4/twbgDiHqyOyL8grZudgXeGBph2imNhpEbbU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PMZu3uL/E1dIpxokiwvcAodyPqndLp+c6gB9Qfm/hjaoF6Go9
	X0sJORnsFOSHdTNoUWUgi3kG+8qMErBX+b1c1cZCtB0JwcT46Gtx1FyfNjltZuixvxQ5wOm/3SC
	R+tFSmWYXYZlL3FMrU/2u14afQhKm/0o=
X-Received: by 2002:a05:620a:4011:b0:949:82b5:402d with SMTP id
 af79cd13be357-949ba955997mr2986180585a.12.1795600992351; Wed, 25 Nov 2026
 02:03:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124-mglru-fg-v6-0-8ffea39934a6@tencent.com> <20261124-mglru-fg-v6-17-8ffea39934a6@tencent.com>
In-Reply-To: <20261124-mglru-fg-v6-17-8ffea39934a6@tencent.com>
From: Barry Song <baohua@kernel.org>
Date: Wed, 25 Nov 2026 18:02:58 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zuAmNt9xYJdU1dmc06PRsCnDc8H+hV=5vU6oRAyWsSCA@mail.gmail.com>
X-Gm-Features: Aa3M54rjOxmsiKxZY9PTg72qI_9AeJX3OFX-7i-N7MNLDLDrtS6AQM6YTnwOk90
Message-ID: <CAGsJ_4zuAmNt9xYJdU1dmc06PRsCnDc8H+hV=5vU6oRAyWsSCA@mail.gmail.com>
Subject: Re: [PATCH v6 17/18] mm/mglru: folio LRU refs based active/inactive
 number accounting
To: kasong@tencent.com
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Muchun Song <muchun.song@linux.dev>, 
	Qi Zheng <qi.zheng@linux.dev>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Chris Li <chrisl@kernel.org>, Baoquan He <baoquan.he@linux.dev>, 
	Nico Pache <nico.pache@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Nhat Pham <nphamcs@gmail.com>, 
	Youngjun Park <youngjun.park@lge.com>, Zi Yan <ziy@nvidia.com>, 
	Gregory Price <gourry@gourry.net>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>, Hugh Dickins <hughd@google.com>, 
	SJ Park <sj@kernel.org>, David Rientjes <rientjes@google.com>, Yu Zhao <yuzhao@google.com>, 
	Vernon Yang <vernon2gm@gmail.com>, Zicheng Wang <wangzicheng@honor.com>, 
	Tal Zussman <tz2294@columbia.edu>, Kairui Song <ryncsn@gmail.com>, 
	Xiang Liu <liuxiang.277@bytedance.com>, Ehab Ababneh <ehab.ababneh@intel.com>, 
	Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>, Lian Wang <lianux.mm@gmail.com>, 
	Joanne Koong <joannelkoong@gmail.com>, Kunwu Chan <kunwu.chan@gmail.com>, 
	Hui Zhu <hui.zhu@linux.dev>, Maxim Muzafarov <maxmuzaf@gmail.com>, linux-kernel@vger.kernel.org, 
	cgroups@vger.kernel.org, damon@lists.linux.dev, linux-doc@vger.kernel.org, 
	Tianyi Chen <hi@tychen.cc>, Ridong Chen <ridong.chen@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 2:53=E2=80=AFAM Kairui Song via B4 Relay
<devnull+kasong.tencent.com@kernel.org> wrote:
>
> From: Kairui Song <kasong@tencent.com>
>
> Currently the active/inactive LRU sizes exported through /proc/vmstat
> and memory.stat are derived from the generation window: folios in the
> two newest generations are accounted as active, the rest as inactive.
> This causes several problems:
>
> - Unmapped file folios can stay in older gens despite repeated use,
>   so active files can be under-reported, unlike classical LRU.
>
> - The reading is jumpy: on aging, the second-newest gen, previously
>   active, becomes inactive all at once, causing a huge drop of active
>   folios without any change in use.
>
> - The reading is reversed on swapless machines. When swapping is
>   disabled or unavailable, MGLRU ages anon by moving the gens directly
>   without walking or touching any folio, to reduce the overhead. So
>   inactive anon folios can suddenly count as active, or vice versa,
>   despite no change in their hotness.
>
> With frequency guided promotion, hotness is already tracked per folio by
> its referenced count, so we can do folio level accounting instead: a
> folio is active once its refs reach LRU_REFS_ACTIVATED (currently
> LRU_REFS_PROTECTED).
>
> On reaching this threshold, folios are accounted to the active part.
> On forced per-folio aging or PID protection, refs are capped at
> LRU_REFS_WORKINGSET, dropping active folios to the inactive part.
> Note that on swapless machines anon refs are not reset by aging (the
> shortcut skips the per-folio walk), but the counts no longer oscillate
> as the generation indices wrap.
>
> The accounting is now per folio and lruvec independent, so no size
> adjustment is needed when reparenting a dying memcg: the hierarchical
> stats keep the counts in the parent automatically.

I'm still struggling to understand whether the local LRU accounting
is correct here. But if there is a bug, it wasn't introduced by
this patch.

[...]

> @@ -4743,7 +4823,6 @@ static void __lru_gen_reparent_memcg(struct lruvec =
*child_lruvec, struct lruvec
>                                      int zone, int type)
>  {
>         struct lru_gen_folio *child_lrugen, *parent_lrugen;
> -       enum lru_list lru =3D type * LRU_INACTIVE_FILE;
>         int gen;
>
>         child_lrugen =3D &child_lruvec->lrugen;
> @@ -4756,8 +4835,6 @@ static void __lru_gen_reparent_memcg(struct lruvec =
*child_lruvec, struct lruvec
>          */
>         for (gen =3D 0; gen < MAX_NR_GENS; gen++) {
>                 long nr_pages =3D atomic_long_read(&child_lrugen->nr_page=
s[gen][type][zone]);
> -               int child_lru_active =3D lru_gen_is_active(child_lruvec, =
gen) ? LRU_ACTIVE : 0;
> -               int parent_lru_active =3D lru_gen_is_active(parent_lruvec=
, gen) ? LRU_ACTIVE : 0;
>
>                 /* Assuming that child pages are colder than parent pages=
 */
>                 list_splice_tail_init(&child_lrugen->folios[gen][type][zo=
ne],
> @@ -4765,11 +4842,6 @@ static void __lru_gen_reparent_memcg(struct lruvec=
 *child_lruvec, struct lruvec
>
>                 atomic_long_set(&child_lrugen->nr_pages[gen][type][zone],=
 0);
>                 atomic_long_add(nr_pages, &parent_lrugen->nr_pages[gen][t=
ype][zone]);
> -
> -               if (lru_gen_is_active(child_lruvec, gen) !=3D lru_gen_is_=
active(parent_lruvec, gen)) {
> -                       __update_lru_size(child_lruvec, lru + child_lru_a=
ctive, zone, -nr_pages);
> -                       __update_lru_size(parent_lruvec, lru + parent_lru=
_active, zone, nr_pages);
> -               }
>         }
>  }
>

The old code also skips updating the local stats when
lru_gen_is_active(child_lruvec, gen) =3D=3D
lru_gen_is_active(parent_lruvec, gen), as we skip
__update_lru_size() in that case.

But we do have some code in mm/workingset.c that relies on the
local stats:

        if (sc->memcg && shadow_nodes.memcg_aware) {
                struct lruvec *lruvec;
                int i;

                mem_cgroup_flush_stats_ratelimited(sc->memcg);
                lruvec =3D mem_cgroup_lruvec(sc->memcg, NODE_DATA(sc->nid))=
;
                for (pages =3D 0, i =3D 0; i < NR_LRU_LISTS; i++)
                        pages +=3D lruvec_page_state_local(lruvec,
                                                         NR_LRU_BASE + i);
                pages +=3D lruvec_page_state_local(
                        lruvec, NR_SLAB_RECLAIMABLE_B) >> PAGE_SHIFT;
                pages +=3D lruvec_page_state_local(
                        lruvec, NR_SLAB_UNRECLAIMABLE_B) >> PAGE_SHIFT;
        }

So unless the local stats are transferred elsewhere during memcg
reparenting, this seems to be a pre-existing bug.

It would be relatively straightforward to fix in the old code.
With the new code, would we need to account for active/inactive
pages on a folio-by-folio basis during reparenting, or is there
still a way to transfer the stats in bulk?

Thanks,
Barry
