Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795653657;
	b=iBS4U+AQBySkuVMgUuajfFpbBoA3tqrG4n7qykhTYhEK2xbYu/0cZMHJPGfBDJTZFQCK
	 q9+UUACpakyd+sbqCL8mewAfPVANn4s3seYO//o9dlwk5EpT8Brzl2qUltQmY8Ls/otQ4
	 fBxoVGgAzzwB9uKebjkf5PImN0OgdQxDVTeaFKR/9yrRBqOOteeUEO7fDaCEazTrkEh89
	 lcWttXDRJ2qSIzbHtRIh0DRF+ZxHPP0gedcb9ZWryQwRclymUZu0gffZEj+CbOG89ucQl
	 yAxlEpyaGagSYHHNfBj9H0ERvZqh2wDDL/oAUdEPXNvK1iPQ2DSZu/ERKSfs/n0xamQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795653657;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ROqfz97ZpfUHHWsM2JzaOj+b4tvNFO3hHXdoi3R6Bx4=;
	b=GAXfzQChqGHxKn0GkPPOvccRTxcVPDZ3gbXIADdfRYVVD+/fEiPDnL0y3+mD0ioSfQQi
	 dbOzx6zponWU6ogY4E1lCIkCMQgvT6HH0qXS6iKRIqBvSTS2aa8ZSSGupEmj6zYqZEZjP
	 fFAMo2Rv2lWLY4yP0NsTeIPxG4dPahbO/2lp4zSLqlftSTwhmTfyf4AIgeTgV/SxIShjE
	 Ggti/PWUwmtmP3v4yDWixTzt8KI+0XhZvqrDHh9zG4PIuzRAlEuTRr4K4Cjdt+2S8CDtv
	 eL6I7TCXT2m0xIEDulyIx4fYQGPex653CNQ4QMtYXPQl0Lman3AJa9B5EgqOdBzc2jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cadsTF0X;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A1D606A326
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cadsTF0X
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFF9E1F000D0
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795653657;
	bh=ROqfz97ZpfUHHWsM2JzaOj+b4tvNFO3hHXdoi3R6Bx4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cadsTF0XGUKYpGvjDqdklBVWaALQvV7UmhCnuYtu7zjqjn0v3CRSOajyaPcWI0qJz
	 RqDRyVf1dq//R60Od22ASxrBN7Nr9Ffuvly4WSL4eNZvcPdNjf0qoI+ZoXtbn7tzef
	 YsZu8K8kUNyIbLvGZQ39kdjr6Db7VvkVtOJkoqt16xuKriEbuTYlCEWScQOrK4vDIY
	 N4nkgS38Z17ebUew1G8N/5JuPG7eQo4ZxkGF1uAoem0yXOTRh0SGTobp24iDDGSM+s
	 qwKoP2wEYzohMTYyFXqTOm54lYK/KzV0Y3iCju3Z51bOcu5C+vHPRVKeszRR3Jrc1K
	 AgKSvdB2Knc0Q==
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-55d360ca878so58643901cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:40:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEZM5KQdAPE4Rc1DdCs7KOC6rNNHECWKmWYYVv4zpIy8AmPlbFo50E8JrSZ2w3GMKx5IkUpEH9GQkufDVM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fAjb4DYxw/h1UN5ECSUDBfpZHoBIg70EIZ1G2QmCaEl3l83K/
	sV/TJn0NYrCh7FkFwoj/Tc+i/2Z0dEkxxjwmZdZWWM5fkO5A1mtfZy1aBgyHBGSpNeV1g3CAEnz
	CGso/OcDAFbJxc5+Jc9MDqTdP+KN7cKc=
X-Received: by 2002:a05:620a:17ab:b0:93f:6e05:22eb with SMTP id
 af79cd13be357-949ba9e1425mr3467128985a.48.1795653656141; Wed, 25 Nov 2026
 16:40:56 -0800 (PST)
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
 <CAGsJ_4z-UdXQg0LYqymEZdoHALPmAZC7eGcXbGad6f0sdjmkcw@mail.gmail.com> <awarDrT/DT7tQu+U@lima-default>
In-Reply-To: <awarDrT/DT7tQu+U@lima-default>
From: Barry Song <baohua@kernel.org>
Date: Thu, 26 Nov 2026 08:40:44 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zf5NabZJanr2_Czr3oVQe6tTTdXmddx+PxowbKBN9M8Q@mail.gmail.com>
X-Gm-Features: Aa3M54qqdItbwgjoEHWn9-crdqoWLQnJV4aNvDHtTbWqBrdWHNaBEhfxmdXesaw
Message-ID: <CAGsJ_4zf5NabZJanr2_Czr3oVQe6tTTdXmddx+PxowbKBN9M8Q@mail.gmail.com>
Subject: Re: [PATCH v2] mm/mglru: skip oom killing for order != 0 allocs in kswapd
To: Bingfang Guo <bfguo@icloud.com>
Cc: bingfangguo@tencent.com, Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Lorenzo Stoakes <ljs@kernel.org>, Kairui Song <kasong@tencent.com>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Yu Zhao <yuzhao@google.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 5:32=E2=80=AFPM Bingfang Guo <bfguo@icloud.com> wro=
te:
[...]
> You are right. Maybe we can start from skipping aging in reclaim path if =
the
> youngest gen is still too young? And maybe for this path, min_ttl can hav=
e a
> default value? Is that a good idea?
>
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index d891ae46baf49..7f9b14b772d14 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -5136,8 +5136,11 @@ static bool should_run_aging(struct lruvec *lruvec=
, unsigned long max_seq,
>                 return false;
>
> +       /* avoid excessive aging for huge allocations */
> +        if (unlikely(sc->order)) {
> +               int gen =3D lru_gen_from_seq(max_seq);
> +               unsigned long birth =3D READ_ONCE(lruvec->lrugen.timestam=
ps[gen]);
> +               return !time_is_before_jiffies(birth + min_ttl);
> +        }

I'm not convinced that we need to couple the aging decision with
min_ttl protection.

This has been a long-standing problem: high-order allocations can
trigger excessive reclaim and still fail to obtain contiguous
memory.

I've tried to address this twice, but haven't found a satisfactory
solution yet:

https://lore.kernel.org/linux-mm/20260422021842.78495-1-baohua@kernel.org/

Johannes shared some thoughts on this here:

https://lore.kernel.org/linux-mm/aejtfpBUu7gNV6Tk@cmpxchg.org/

Do you have any traces showing how many pages kswapd scans and
reclaims while kcompactd makes little progress toward satisfying
order-9 allocations?

Basically, I think we need some form of throttling to prevent
kswapd from freeing more and more memory when there is already
plenty of free memory, yet compaction is making little progress
toward satisfying order-9 allocations.

>
>         /* better to run aging even though eviction is still possible */
>         return evictable_min_seq(min_seq, swappiness) + MIN_NR_GENS =3D=
=3D max_seq;
>
> I will give this a test later and share more findings.

Thanks,
Barry
