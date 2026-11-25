Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795594997;
	b=KOE2E/7fQV7MXP9E5IgCL1CVgLOhovmcE1fpYYQEBb4cxiI4RBtjVblFMULcxcphcSwB
	 Kvmj9nxQhuRmQANX7T0c4xYuaZyQmgs0Q3h7h+bzzEj6hV55uq6icMqtju8hhCoSaxZGj
	 1gTPdFYzd+DwRWtDVZi43qTER/Ygj2nLkommdyFxdGDHCFC+yz7JXi4pm8b5gZbNRuGp2
	 FDRQrtFBgxEJpAVPxUeUCCo7IdgsYM4Pg+wx9PSCZzTo8sgCH/1RtBuvq5xHTA1OXzfRw
	 PseTlJ5uJicRIRgzFgZhGWqRVP02NBr2m1c1I1D1TJHySc1iDTjz0NDWceAXsxHqDUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594997;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hsT7zBmMHOA0tSmt3vFfihAtL6RUpoMsSd3RGk73F2s=;
	b=JhM4lstQSk7QQNlRXmTMYWAjmhe8KtTLe7kbxpZ3FyhWiEBJ7u6QUrH+PK3ewaEMAGDd
	 dKbPAsj4CDPBavBbmVGwEuT2o+gKfhMR5v3nzg4o+Ie+NG/zrVFLlA7rtUcQszgPVh7ps
	 /Anabnz8edybIt/VxgS9+GbV55GrtSvm25NQZ/AAohpPciHApzv4Zn1+Gylku+RGgCLdL
	 TfIQY05VDW15U5bo/pv+GTid9xrD2y44nZ1lthTbrr6OcNFJn6rk7BozPNfi5EuH2iUeC
	 Xvn9hrMEMJtF81dmtrAA67tkzUeh1VeH4g6YYvrtiTDmwv3/nFeeEDGwsoDv6QMDQjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YZloInuI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E099D606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YZloInuI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87EB91F00ACF
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795594996;
	bh=hsT7zBmMHOA0tSmt3vFfihAtL6RUpoMsSd3RGk73F2s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YZloInuILkJ9lmMUSqL/V1E8ZE2MR7DT1FHtU5vmr1pynf0SQxxjVeQeMdQmCVdOU
	 yI5vYa/MpHD51913RjFTE0cfACo+wFIrf/YlA2+0n2ByuZEuHOIiFSIN2MxoTdxOq6
	 YQdPQHNk2d43l8aIC62EUfQ5OpRhtdKq3RVYmk61kUu7I3Wo83lhI1Bihi6LX3J1Gs
	 xPyd1O68e+0uA3TiIzPNRDmP1QZvMcU27ndaND5Yx03x0lDJYvF3ZXDwQ82WcwthQc
	 lnTas0aZN4TvJdDeJhA60y3x4W7yMTozdz0arecRmKxYV/HG+m5OCSjgLGKDVl7ITw
	 ZyXG2yI59pwdg==
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-94999a08973so510507785a.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:23:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFORge+uDK4guWapF9QwDSgdWLvMWpnuzCz0Or8em0V4y863RDpcu96xUGwYEl3u6iKD7mLPPn32eX2gvU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gRJrk3s4bkgFh0rAUe83cgYyWs4LQlWcbdSWFW18p8xBivz9b
	l1WlwUwt0v5qMM3mGAZZqccWsvd/DL56wjcCsw+dtGwnRnlG/HgYQ/kYc5gYlM+OWWnQ6oJUdtn
	fCtd0fT+9C8Fu2MB4JpM18p3sZIc/rjk=
X-Received: by 2002:a05:620a:6c18:b0:949:664e:e3e8 with SMTP id
 af79cd13be357-949ba997635mr2899642585a.34.1795594995906; Wed, 25 Nov 2026
 00:23:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125073931.1171242-1-hui.zhu@linux.dev>
In-Reply-To: <20261125073931.1171242-1-hui.zhu@linux.dev>
From: Barry Song <baohua@kernel.org>
Date: Wed, 25 Nov 2026 16:23:02 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zvaxT+TD2P0ephTRsjAeVo+9NdavmmxLnuoj6d7P5UuQ@mail.gmail.com>
X-Gm-Features: Aa3M54oYpLZLgx5RRSzL4wpUVCax0NId0FybUVL-U-z7-jqsoujZkX4qgzA3cgU
Message-ID: <CAGsJ_4zvaxT+TD2P0ephTRsjAeVo+9NdavmmxLnuoj6d7P5UuQ@mail.gmail.com>
Subject: Re: [PATCH v2] mm: mglru: reset the mm iteration cursor in try_to_inc_max_seq_nowalk()
To: Hui Zhu <hui.zhu@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kairui Song <kasong@tencent.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Harry Yoo <harry@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Hui Zhu <zhuhui@kylinos.cn>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 3:39=E2=80=AFPM Hui Zhu <hui.zhu@linux.dev> wrote:
>
> From: Hui Zhu <zhuhui@kylinos.cn>
>
> try_to_inc_max_seq_nowalk() advances mm_state->seq without walking the
> mm_list, but unlike iterate_mm_list_nowalk() it leaves head and tail
> alone. If it races with an ongoing page table walk, the cursor is left in
> the middle of the fifo.
>
> The next walker reads that as "this generation already started": it skips
> reset_bloom_filter() and resumes after the cursor. The mm it visits are
> the ones the aborted walk never reached, so they have no bits in the
> filter being read and walk_pmd_range() descends into none of their PMDs.
> try_to_shrink_lruvec() ignores the failed try_to_inc_max_seq() and keeps
> evicting, so those hot folios are not promoted and refault in the parent
> memcg, until head wraps around a generation later.

I'm not sure I follow this part. Even if the page table walk misses
those hot folios, we can still detect references through rmap during
eviction, can't we?

We also have lru_gen_look_around() on the rmap path.

So missing those folios during aging doesn't necessarily mean they
will be reclaimed and subsequently refault.

>
> Reset head and tail with the seq increment, as iterate_mm_list_nowalk()
> does. It is safe: get_next_mm() holds an mmgrab() reference and a
> concurrent walker bails out at "walk->seq <=3D mm_state->seq" before
> touching head again.
>
> Only reachable from memcg_reparent_objcgs() -> max_lru_gen_memcg(); not a
> memory safety issue, since lru_gen_del_mm() repoints head and tail under
> mm_list->lock.
>
> Fixes: f304652609ea ("mm: vmscan: prepare for reparenting MGLRU folios")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>
> Reviewed-by: Baoquan He <baoquan.he@linux.dev>

I'm fine with the fix, but I'm not entirely convinced that everything
in the changelog is accurate. :-)

> ---
> Changelog:
> v2:
> Drop the helper and keep the fix open-coded (Baoquan He).
>
>  mm/vmscan.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 6a1af9b92349..3601e58f2a69 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -4694,6 +4694,8 @@ static void try_to_inc_max_seq_nowalk(struct mem_cg=
roup *memcg,
>                 spin_lock(&mm_list->lock);
>                 VM_WARN_ON_ONCE(mm_state->seq + 1 < max_seq);
>                 if (max_seq > mm_state->seq) {
> +                       mm_state->head =3D NULL;
> +                       mm_state->tail =3D NULL;
>                         WRITE_ONCE(mm_state->seq, mm_state->seq + 1);
>                         success =3D true;
>                 }
> --
> 2.53.0
>
>

Thanks,
Barry
