Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795748110;
	b=HEFaDSgNDRifIze22h6XtImcJsnvoFjraKal620j5UerlcJuED9LzUN2XaBHF5Vm5ntZ
	 YsgejqAA9FpZadCyA3qlEYPgYPuBUc589SQ9Gbf5fAMMT6kjx0wXRFcyO9I/91DNRopWX
	 RlxRCMBDImzig8bYYT+j2hhrmyYhRv+FwSXlbcO+VllUpee/2CVNMXpKQlEO7fjzasu54
	 SiXb3/jqYEGJxz5cf++fhaq0RWJ1sZEiS70N6k2XBEy/I+xjmNo78FRtIpfmwZ73bdkRy
	 crnR9ognTrWIp+jHSk6nCEbcIosnpPDM6NaJ2CrhEvp+5B25RGoRcw/jfWOnIL9iLrw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795748110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=v3hflK/w9trNoSZS5EWvDWp/lpUVGxr8L2pSGjpSId0=;
	b=v4gYExNjSB94Gx4fe9dsOYD8VQpMmxMY7oCRDJksXk7DOXcYptfPLxBqVdMDS2AW63xJ
	 xd1ZOsQlh9i0fRHDR/raQVLY9dkYMvSkLaTco+oPR+KGshj77nRZQbF2d/jnVPaJHyWVl
	 6ei0TRZBcsMYkKT6bp3BVKuA0eKCsWwzpKj8wWjpsnEpN/9RJcIsWO4Af4UTU5yBSc/9t
	 5IL6/WZPIag4BwFVpSZUX9bI5TQeBH3jMuetyATmwOYMUIX063jircbjo8s7tas+L25ac
	 JDk8+uABJzICn+3hmIiyt1Gy7rVEwfWt6IfBoy5MfxUrTRCQhApKPDG2778jIpW5gzw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bNe7M8+B;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86489606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:55:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86489606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bNe7M8+B
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b86bbce3d1so10266424a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:55:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795748109; cv=none;
        d=google.com; s=arc-20260327;
        b=XEHwfRL7NuulIQWLceTJD18lh8XOf1/tabphsZ6+reVemiZOHZyqyodT6K1mZR0i1B
         aMaa4HOo9gRovipZhw0ymLlnlMBcgc51JcX288VbihNnFSur1wiJEplAre5NK7nXL7si
         FEba2/GmjdocLwMwix1YGZlrrseEmgX53CbBHuRt2fZzWIwK4Gpw+FSCb7+OgneNSR+H
         jhEP5pwd9csgSgbAGAEGlCWUkom+agEESVvtLSftnDSykISeXTEmetfn3UQCm+Gawl//
         Ze+6vuLm7aDQdIVd9tOYWTRZ7RvnHE2KP3o+nkTBip8j2WkZmIr4DLh1ENeZZtbuLqQO
         Gxiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v3hflK/w9trNoSZS5EWvDWp/lpUVGxr8L2pSGjpSId0=;
        fh=ZcMASx504JSuQ9kSh2HOlVGr6wlc0uFTObZ4FrX/gV4=;
        b=cEF6wAxumQuogrTzh+YmTG+4OmRYWxsNYnTgGPZvU7CDRdlXCbYcYBDbYDtIspKTpW
         j23phRQOkO8l5YMKen+r4c8vEXVzAN4IXDdw6SAqv1GITMgTIkpn+5vBMlJouHcuXY5k
         i+FygLFJwTymcJJBZYDxPk1qroFpxDUTgvJw+bZB3kzfVx+mvxqO5gyPatnLtl9L3u6x
         vrdFk+rgVcRLAizVT6jver1dXzB6MDpt+A2HzOnywX35NMZf+oZlI24glPPvqAR496jC
         abG56ASJKkKtob2CK90gzM2TXwJsIXn4rspE+eT00iY0l0kikCaCYy/ndWlgDsieFPEE
         Ye3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795748109; x=1796352909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v3hflK/w9trNoSZS5EWvDWp/lpUVGxr8L2pSGjpSId0=;
        b=bNe7M8+B8p5uXT6E8+AspgMl9mE4AZIaw0O6Cis6YnJ4MD9SLSyHtC8mDi3QFxXbUH
         zFJl2sycu4RaPGjExHOkmCoLEg4JMyOjxZ+zZ/RhlpUbQiU9/G2wqbHfz0rBmegzQ2iU
         XtE7GhpJkGUWczk7KYyKVCq4khiPff3YeFDZ/z/fIHfY+8WC+YNUNJ6tpwndyp43LyJK
         E8IAteuzZmqxnCQQz1NOqlXimQ+25vbDusz/oxmjgHP2ES+7GBtHP73YSfQr8zuLXr/l
         DCQDBuflx5hxVrCguwxm+4THbjQPYTtvDi2FHjJ05IhUV79ZukszySTsFzuRWELxkGj6
         AQNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795748109; x=1796352909;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v3hflK/w9trNoSZS5EWvDWp/lpUVGxr8L2pSGjpSId0=;
        b=IrJFCO7ULpzlNhkvniNAIJY0UlRgrnYpW3Blkyp+exLfPqzja2Wx35TdzFYYiytAri
         R0DpBc+1E3kZ55NvyeUH4XTS50CM+3d+tuqVu6GsLYcr9gJtCQ9nSIsp2xhg53yoxkOb
         1IbpcsJiL9fbYqJaGa5EwQ5elVpn5meqOqSJRiiPStjYM1lC9AGk1VHTxfgOqni6OrxM
         1FKH3MvSYE627MqWvB9zh7/aXb9p+OY+EBB1icNHPFGjdsq6lpQ3tJFCiEaPGSlQ9ekC
         XkRoqgZcErgK4B3zj9sYkTy+Q997Dt6Drr8TD48bC9aiZPtM3KwXybfho+aaDVYVqiIo
         CM/g==
X-Forwarded-Encrypted: i=1; AL+hErHJTbwHCDy5BPV0EHgVrR2TQL4KeOctNQNNVclp9Q0NHxxiaQAKAswyjkcZIBoPm521XR/1IZO1+ry5eO4=@vger.kernel.org
X-Gm-Message-State: APuU4Z94l8KuA5HrBx0CcF/Zw/XcOhLuQ+pJWrxONmcOctt3xmrEVYUA
	nZzYPGe/p55BTl9nhCzu4SEhDgluZhCJmmwL3heI5PoK9SLxkhLjMvc/IqDXpNGqRO8RCOcrIUC
	QBVitqxBr8QTXaHkZ4k/TYHqiQXi2E6Q=
X-Gm-Gg: AZFdTZc9rxUK7ca6TWusHgoXMC/atkF4/sxyzfS82fQxwdwTQvH3VM/nLXMEiFx0Q/z
	nvANByXQFTn2hNymx9azQjW50ExKwMcjps3PfE4hCDnWss6ioXHX6ooDWLNaorwzlOCwJKHbIrJ
	SnyaATgBxPEI/ByJiujOuykvc/AnxZx4GhpOOahAxYWg4VnhUoFPvr7pGePOT9XsBcnqMgDejvd
	aOc3SVPlqVOK/eYOo/hmngy1PUVxQk3Yn/NFPdfnmXZui+9gmef0wcZBJbsbANkDtQi8sNMWNM4
	82LmG8CI0cIDIUnsuc4LWjxFwRjsGmPj8dFRte/ZiA/ARt2MWDLqCEy+1P2n8yF+J/0CnPLy0fY
	jiXxkH2PrjIMll91f7JSs17y1hCX0kubeUohh0lk6ySD64OYdqeHBJ9FLvbjrugbYpO+xnQ==
X-Received: by 2002:aa7:d287:0:b0:6b8:818d:520c with SMTP id
 4fb4d7f45d1cf-6ba37c7ba50mr12205368a12.5.1795748108667; Thu, 26 Nov 2026
 18:55:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101160427.85701-1-maxmuzaf@gmail.com> <179502478384.194898.8139869410612997037.streamfolio@tychen.cc>
 <av3vMMhFbiaop7zA@KASONG-MC4> <20261119082441.196139-1-hi@tychen.cc> <20261121205953.30737-1-maxmuzaf@gmail.com>
In-Reply-To: <20261121205953.30737-1-maxmuzaf@gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Fri, 27 Nov 2026 10:54:31 +0800
X-Gm-Features: Aa3M54oZAY7wIG0YhxI5gfZ4onlcVlgmd6HzWuctq8VM5P9-R9yNP-MHxvDvKrM
Message-ID: <CAMgjq7DDUHrHEXiGDnPn6+keL6VxWWMabAr-BRrNM_bwsKPZnQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] mm/mglru: MADV_RANDOM page cache never ages and
 thrashes the oldest generation
To: Maxim Muzafarov <maxmuzaf@gmail.com>
Cc: linux-mm@kvack.org, Tianyi Chen <hi@tychen.cc>, 
	Andrew Morton <akpm@linux-foundation.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Yu Zhao <yuzhao@google.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 5:00=E2=80=AFAM Maxim Muzafarov <maxmuzaf@gmail.com=
> wrote:
>
> Hi Tianyi, Kairui,
>
> Sorry for the late reply. There was a lot of new information for me
> to digest.
>
> I've checked the reproducer you provided. It tests a slightly
> different scenario from the one I mentioned in my first email.
> However, I managed to adapt it [1] to my case and tested everything
> with the same setup (x86-64 VM), and I also reproduced your results.
>
> The key difference [1] is that I added two new knobs:
> - SCAN_PASSES (default 1, your value), how many times each scan page
>   is touched
> - SCAN_MB (default 96, your value), the cold scan size in MiB
>
> This is important because 300 MiB scan forces reclaim to reach the
> pages during the first pass, which clears their accessed bits and
> evicts some of them. The second pass then gives the scan pages a
> second visible access. The reproducer from my first email also reads
> the cold data twice (--loops=3D2).
>
> So the idea is to get the cold data promoted to newer generations
> and watch whether the workload recovers while the oldest generation
> is thrashing.
>
> With a 300 MiB scan and 2 passes, neither MGLRU nor MGLRU-FG5 can
> recover. FG5 handles the 96 MiB scans and the 300 MiB single pass
> scan.
>
> The Patch
> ---------
>
> Kairui,

Hi Maxim, thanks for looking into this.

I reproduced your cases on latest FG (7.4.0-rc3, 1 GiB
memcg, x86-64). Base FG fails 4/5 seeds: early p50 280-344 ms,
late p50 364-375 ms, .vec 9-19 MiB, scan 288 MiB resident.

Refautl ditance below seems fix the problem just fine as we
expected.

>
> On Mon, Nov 02, 2026 at 02:02:33AM +0800, Kairui Song wrote:
> > This code snip:
> > + /* Set refault as active. */
> > + if (distance < total / 2) {
> > + folio_set_active(folio);
> [...]
> > That way, even a random folio will be put to the head directly instead
> > of keep thrasing on tail. And placing on head or newer gen will
> > trigger aging.
>
> As I understand it, the refault distance series will break this loop
> on tail. However, will the loop survive when the hot random set
> is much bigger than half of memory? E.g. when its refault
> distances exceed total / 2 and refaults land in the oldest
> generation again? Should we in this case use the aging logic from
> this patch as a fallback?

Yes, that's expected when the hot random set is much larger than memory:
`distance >=3D tail` keeps part of it in the oldest generation, and that is
intentional (MRU-like). It's not part of your case, but it is a real future
case.

> Anyway I'd be happy to test the refault distance implementation as
> part of this work when it's ready.
>
> I also rebased the patch onto mm-new (25fee5b1762b) [2] and on top
> of the MGLRU-FG5 branch [3]. The patch applies unchanged to both.
>
> Please, let me know if I need to send v2 of the patch to this thread.

Let's wait a bit: the per-generation counter could trigger unnecessary agin=
g.
If the active working set is well protected in the newer generations,
constant eviction of rarely used folios should not trigger aging; otherwise
it may push the working set out of memory and cause a regression.

> The full results are in the gist [5].

Thanks! I also tested the refault distance design below, and it looks good:

    distance =3D lru_distance(lruvec, token, LRU_GEN_EVICT_BITS,
                lru_gen_bucket_order[type]);
    tail =3D lru_gen_tail_size(lruvec, type);    /* oldest MIN_NR_GENS */

    if (distance < tail) {
        /* It would still be resident if it had been kept. */
        folio_set_active(folio);
        __folio_set_lru_refs(folio, min(refs, LRU_REFS_PROTECTED));
    }

I also swept the promotion threshold: tail, total/2, and total/4 all fix
this case; gating on refs does not (refs are 0 for MADV_RANDOM).

Results (300 MiB / 2 passes, 1 GiB memcg; base/RD 5 seeds, aging patch 2):

                          early p50    late p50    .vec late
Base FG                   280-344 ms   364-375 ms  9-19 MiB
FG + RD                   5.1-5.4 ms   2.7-2.9 ms  117.2 MiB
Your patch                7-51 ms      2.9-4.3 ms  117.2 MiB

And your tests covered the other parts too, so I think FG + RD is the right
approach. I'll keep this case covered and Cc you on update.
