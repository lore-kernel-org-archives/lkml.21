Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795592318;
	b=c1oL2JlueHSRQfTB36pcglh33pvtiXhxf/CEWbcVUTEI8TZaCtSVD/D6zxB3B47GMksW
	 ycz3iAYkDm97VHtfZJzNdeJ1X1SflH9vn1daWJEiHDN6aVMW9+b4oiCkl10i+KLbCchoW
	 5b8Ii+gprbC9jmxkwOjrmyu5RPR3yNtVAQeKsmguaNn2uDjNszdh5LxZyU4izVOfdXdqV
	 Zm1//dL68SiHGFrLKlDftRmkgOYYiV/0i2fibTyd1kQFF37GVKCvuRHwlsSn8iqpvhm97
	 xjK9JrN4o3i3HDNzJCa1MV+Rqu095uOBihhbdrdlo4RHTjfRou2pZnyANPxQswGyQOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795592318;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=RGB+fOBKdYyUYIRe+oBpjk90yiPpoLkK9I3BKuiG5yA=;
	b=UkOs7yuK9Iz8F3LzmhII2MfbWJmapyUOm0JDpvcrUg3U2hrqQdM0JDlfrJqGT1m7y+d7
	 aAec3pJCL9R67PJHtZz6u09cb1EvDtVNKwyfEw7E0K7cE/VM3xDaak8f+iU99i6mTlbex
	 9HUukdc29N3IPSJzhf96e41W00wiuyGc4O55ar2pHv/1VpT1gn7FsZdTEX7lHyi4Vukhy
	 EQSgS+SQBHqi9YnbmAVI0J0vq+u7ZhZpimkCrH51lCTpHocfsa04kGnZm3pPaECgRv3ua
	 iOPJqeiqbQy9WM9VqfjToRQL5jMKhmiHnSwn855JFOJa95E9Wh1liBVbrRaKkQD4tXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OSPCAGvB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249E7606A33C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OSPCAGvB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A46081F000D0
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795592317;
	bh=RGB+fOBKdYyUYIRe+oBpjk90yiPpoLkK9I3BKuiG5yA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OSPCAGvBBPGdVwRymygPVtZlLky7yB4MBRcAfgZvdpmP8TnQttwwd2uEES2lbnSK4
	 KDkSWj+W9/RypsuypNPrqG7Gtrj+e2xebWj/gdrrLO4c8ausIuArnWvTp14CXnTe1J
	 Whr8byp4VzBVZWFHU0cvykhiJIcxc1DMlm04nhHKD4ajAQHTGd+DYwIf8F8zwHd9OZ
	 qzBJ8+SkWVXvLU6DPaJhOkezKgw8LHJZNLOr8CgHeOSG1EajNHGo3izVrNnHRCjogs
	 9Ls5SMtKEZrgR8C+w2nvtaXUIqCZp6n6EhXiJvEtMg+x0rkxUOZdLXPeAf01vt1/Ih
	 T4fo8VAWIxZ0g==
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-949680e6d82so594281485a.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:38:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEsmpEaCCwvlLAgjeiglwOZT0k8D3x9l3VSaDWJqx7lQeJ2O8bmVWlx2R/HEERWlrBp6TBD6udVO726+Hc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VvusNnn7QzNrtsfKPQuxHEdLcN5wz6seCgVyr3ynAWxpVgrmt
	e+dtB0fvp42fmlmPbCIYyj5DUeyHKcVkHmR6qUVrtbek5w0Z4J+o9cWtZjw6S599V6k+OEGIg1l
	BEjKuBqz9MIEVzlAoz3LCjfAvEX0uwMA=
X-Received: by 2002:a05:620a:171f:b0:949:7f5c:6d9d with SMTP id
 af79cd13be357-949bab24d39mr2862714285a.75.1795592317040; Tue, 24 Nov 2026
 23:38:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125-fix-mglru-kswapd-age-v2-1-4cc37437af9b@tencent.com>
In-Reply-To: <20261125-fix-mglru-kswapd-age-v2-1-4cc37437af9b@tencent.com>
From: Barry Song <baohua@kernel.org>
Date: Wed, 25 Nov 2026 15:38:25 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4z-UdXQg0LYqymEZdoHALPmAZC7eGcXbGad6f0sdjmkcw@mail.gmail.com>
X-Gm-Features: Aa3M54ohWK453GGCwz5KqjeaTi0MuN11Z-VTtmlbSWu2DhjYRrMVio6g8TeMuFw
Message-ID: <CAGsJ_4z-UdXQg0LYqymEZdoHALPmAZC7eGcXbGad6f0sdjmkcw@mail.gmail.com>
Subject: Re: [PATCH v2] mm/mglru: skip oom killing for order != 0 allocs in kswapd
To: bingfangguo@tencent.com
Cc: Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Yu Zhao <yuzhao@google.com>, Bingfang Guo <bfguo@icloud.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 12:32=E2=80=AFPM Bingfang Guo via B4 Relay
<devnull+bingfangguo.tencent.com@kernel.org> wrote:
>
> From: Bingfang Guo <bingfangguo@tencent.com>
>
> We observed that when MGLRU min_ttl is set and the system is highly
> fragmented, high order allocations (e.g. order =3D=3D 9) will fail and wa=
ke
> up kswapd. It can not make any progress, while pushing generations of
> memcgs so that they all end up younger than min_ttl_ms, repeatedly
> triggering the OOM killer in lru_gen_age_node(). Then the whole process
> repeats until all processes are killed and the kernel panics.

It seems we should address the underlying issue of why order-9 reclaim
keeps advancing memcg generations until all memcgs are younger than
min_ttl.

>
> The purpose of the min_ttl is to prevent thrashing when all memcgs are
> too young to reclaim instead of preventing fragmentation. So fix this by
> restoring the behavior in commit 30d77b7eef019 ("mm/mglru: fix
> ineffective protection calculation"), which skips OOM killer invocations
> in lru_gen_age_node() for sc->order !=3D 0.

I'm not really convinced this is the correct fix. It seems to work
around an issue with min_ttl for higher-order allocations, but it
doesn't appear to address the root cause.

And what about order-1 and order-2 allocations?

>
> Fixes: 30d77b7eef019 ("mm/mglru: fix ineffective protection calculation")
> Signed-off-by: Bingfang Guo <bingfangguo@tencent.com>
> ---
> =3D=3D=3D=3D Testing =3D=3D=3D=3D
>
> Tested on a VM with 6 cores and 6GiB of memory, HZ=3D1000, MGLRU enabled,
> min_ttl_ms set to 1000, and a workload that fragments the memory then
> allocates 2M pages.
>

So the real question is: if order-9 reclaim can't make progress, why
do we keep triggering memcg aging and end up over-reclaiming?

> Without the patch, kswapd kills all processes and panics the system even
> with plenty of memory available. With the patch, allocations fail but
> the system remains stable.

I know, I know. But this isn't really the root cause, is it?
Even if we avoid OOM kills, we may still end up with excessive reclaim
or system overheating, right?

>
> --
> Changes in v2:
> - Reword the comments to explain the purpose clearly. (Kairui)
> - Relax the skip condition to sc->order !=3D 0 for soundness. (sashiko)
> - Rebase to mm-unstable.
> - Cc stable.
> - Link to v1: https://lore.kernel.org/all/20261027-fix-mglru-kswapd-age-v=
1-1-b1ffdec4ae52@tencent.com/
> ---
>  mm/vmscan.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 836f50814ffa..9fadc6f9da49 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -4351,7 +4351,7 @@ static void lru_gen_age_node(struct pglist_data *pg=
dat, struct scan_control *sc)
>  {
>         struct mem_cgroup *memcg;
>         unsigned long min_ttl =3D READ_ONCE(lru_gen_min_ttl);
> -       bool reclaimable =3D !min_ttl;
> +       bool reclaimable =3D !min_ttl || sc->order;
>
>         VM_WARN_ON_ONCE(!current_is_kswapd());
>
> @@ -4371,6 +4371,9 @@ static void lru_gen_age_node(struct pglist_data *pg=
dat, struct scan_control *sc)
>          * The main goal is to OOM kill if every generation from all memc=
gs is
>          * younger than min_ttl. However, another possibility is all memc=
gs are
>          * either too small or below min.
> +        *
> +        * OOM killing for fragmentation is not desired. So skip this whe=
n
> +        * sc->order !=3D 0.
>          */
>         if (!reclaimable && mutex_trylock(&oom_lock)) {
>                 struct oom_control oc =3D {
>
> ---
> base-commit: a3d0117e02bfa1c3bb6c50e7afe42bbecdbb3459
> change-id: 20261026-fix-mglru-kswapd-age-98390614c746
>
> Best regards,
> --
> Bingfang Guo <bingfangguo@tencent.com>
>
>

Thanks,
Barry
