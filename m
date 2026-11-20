Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795167374;
	b=4pAeYfKgPwJCp9gGmrHi5wJPwIzGSbKcPu1OB1Ni/ZTtNhdKoL23mLPrODyJurFMq+U7
	 sFjTWGYwtOlYMg23MAH1G/H3/IG3oQ8OjcMWpX1jUm8MRvkyi4knNn1aMLq8cBUBna33T
	 wkFl2wj9fAwXRb4e0UXGj8qXIca/gelqMsn6V/LQwBHOOO8JscDRKzxzmajZiMWzVm+To
	 suBk1InRBmxDKMn47Kgxqg0x0VLOlWiZgWLvaWJ4AS4aOgpCt4InLFKsul0B8Spz9gEyM
	 EZVYP6RnqGwB5kQ9dMyuWw96jeYOFjt0T+/ZVs1NqmZ5S1hE7+WINPMz7+Ew2vgAQ1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167374;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wSiOMe0tD0Y2SxFczJlUDeasF0l1x/LWEx9aDUyyir8=;
	b=cKjSyYwhsiONgoouKtQOaiqAQ9ITwbLhl1TFC8oLCUXCtczkkx4evG6ud+Kq5C5h/snv
	 PnO675DStXC1yk0/Wh5sQfUUlKlzvsdAAD+z8zgjqSwE5fkspr7L8VMA4Zeezcl+QXLzf
	 J+fSmmu3CGy9307T69uRH++I6YmZv0BQOxIvkI91UGhH8/4oCQaY4SsJoyWTSKSSBrgVV
	 sRFJcGcbxd/+yB4Spg9jB1oZOKhXemmD2AP5bavGk+dFbt2tD/2w4xk7wyedJQcbJDS0l
	 +TxBckCpZUN4H90HmA+k5JFn206BAqrEeUJiVdgF6WT/JmaOzCt46ivz5NRjcoyVktA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VM3KnwM6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8312A606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:36:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8312A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VM3KnwM6
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c506a231b88so102147866b.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:36:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795167373; cv=none;
        d=google.com; s=arc-20260327;
        b=eYg15Vc8RV4xFOXfsn/e3ui2pkwkcXn7d7MYHAZqrsNkwSlXDnXmmbSPjXwVkx87zu
         rBuk0Y80I54xrpZoXG1mGeOXXrblXIh5HSXv6OCviNWAnqIrV2LiBEraBi2CtYxducs2
         fZtx/qOkPE4biVT9CN4WbwW6jbCg9+Xk4yodv5mZDkASG9qNSgxIXn9QPf6NlkWLheR4
         sxDhL+Yy+CL0j9fyywqgHOgCdIryEZzEfs9nBONDuBg5LQgPe0v9S7rEANA6X9muBXL/
         IIor/fQSGUr/hMyH+drWfQ0bnrJOcCNIt+PCc1r2/5WwHHFtQ2Wo2edh7vu8rTgq7Jsv
         U59A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wSiOMe0tD0Y2SxFczJlUDeasF0l1x/LWEx9aDUyyir8=;
        fh=X7m3xv9vdB8bebX7y+7G+xcXcLrwZOlZX7n2/ptDGfI=;
        b=IPAWjGShHCR9xP3qrYSyv9JNIlPdtNrFJz7bg7VE8MLR4pmCURUF14+Zw3Thm7gP0q
         5/zobLG8GP2PnRgpeqjeFoBFNXg/tDqeSs9hxND72yonsgxyKhfNZPFS9YOgh7ucqeLp
         xTKdF7LRAG2h30/YC3VOwTqprk10eC968dePujbciuj8Q6uow2okPfLZfd83T1r7izqQ
         nNyMxdUYy+1IdKS5ontBUtQqF0lD0kgwoOj/NYSeyD8x9eDKalDo2b7ykfbO6zcHWmMv
         CQ1MXMBsvqX7wdcC6rWKVVxYlsQgwdssIyCl3OSI5USz0mT+Jw6JAeTinAJ6asetlYJG
         Hz4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795167373; x=1795772173; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wSiOMe0tD0Y2SxFczJlUDeasF0l1x/LWEx9aDUyyir8=;
        b=VM3KnwM6AUN5/1TidF8zbilAlicnuueyvE/LyvJfaeJnvgFr02HNKww70Tz7vQkqnU
         5/YutVl7o0kzxFtaWIvGqh5W1k2zCFmGIQywVNhUs7eLfPrtJL+ppOog6GHQZfR9XM9E
         IFNP+LomdvxpZiH5uYLNiocZvMHn2hze68Dj3eSvEEB7xiSCWMTmNnwOPri3jto7VtjB
         6r20b2CR/FQkYRv266zNBuPEsQb1xepdGE5U1sUPZZZjwtbrcvT2iCgLiswv+QWHKxst
         FDEM4juBe4DJna3J3dCNxtVevCcAJyssXTziVmF4k4Q6ZW7zc/1Drcq6ZP2k3K2PNNBd
         /Pdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795167373; x=1795772173;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wSiOMe0tD0Y2SxFczJlUDeasF0l1x/LWEx9aDUyyir8=;
        b=nQPvWFAumIG0z9IMZrz6QtG5Ep+cuD93njNHm7pOxPoT7Se+pVZpdUydCrr7wWTCul
         ibncrSVMTwJ/GcWywWzvNGwDuGJF8gUz6UoWvnkkcuqdmzvzpftCqADNwWRsvzW4pr8Q
         GiEd5lcXuQtO+VcwLPFiY4guBat+lqsK9ziIgYpO86UMfFRkqjzny+RIUKAd/NkIw4Fr
         GfoMzUmkHgLETf2MaAyp2T/ZElYOGontlc61tDF5Z9Tax6BmGQvlOG1z0uWFAWi8/39k
         r3Cf9LAYiZJvukwrvVe6pX56MhDpzV0APRYrXfi4cCcbLemSLXHKYH4FFvJl+1oq07ql
         LFrg==
X-Forwarded-Encrypted: i=1; AL+hErGx9U5rY9++s1/GkjPbNh4RKG3WT/73iVM/FRLqgZ3xC0/kFTKMO6VW7SVuxxqJoBte031IXMgf0L5aA5g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fTLSfpbuvFtE2cEMml8fSA6OzcRZOD/ZjGo5mSXly3nMWASUR
	ZlWzsijVOno5boix2SGP1+r2hvFvMsRI27CN2lEREC4n6sGeTFF4KYrjGHHBXxZzou5yFu1+4pS
	oDnZoCk6GarWCpHBs5DB53LDzLsj6Y1Y=
X-Gm-Gg: AYBFou362Z9lmVvqhFIrrUm+ezEjUtJHtbNoIdyWh/irJ1167mPmeqIyMsS2WMGStcL
	SSDHGuSo/tHZrbUuxcOAHHGO9kKNwzyvpdTQzvdnwZ6UcTwjoeFcM4jAf0/TTH/P2XuPPzyFl0T
	Sit9VpVMpBMgBVU/nYO1j25wyMnRs0Kv5+hDI6UZ+bJE2ZGQ4VD+rUjYj1qsOTPc+7Rhe4Xz2yI
	vlxsWNBGZ+rQScnRqUt+ZzGXQ8SoHBA63JIbgaa25gqp6Jx3RnZ93am0gWecEE8269PwenbsLz9
	vhGv5kqyaK5vLJUC01bcpyexmqrv+t1lVdQ6M56UxIFKrE4eeO1ClAc1WRepUEgf2Is+6lxKrlT
	uzkxEoxYf04k7FOjhnYC3W1bRdRQ/66NDN1JvhqCq6tTnzNun8+NPFVs=
X-Received: by 2002:a17:907:6c17:b0:c51:3cb6:5b11 with SMTP id
 a640c23a62f3a-c513cb65d73mr206830066b.49.1795167372628; Fri, 20 Nov 2026
 01:36:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-mglru-fg-v5-0-9eee2fe97a2d@tencent.com>
 <20261119-mglru-fg-v5-6-9eee2fe97a2d@tencent.com> <CAN_Opa_jb1pN=-Z+4WRoXVDSe0YfppeY319iagMdQoMgtOQSSg@mail.gmail.com>
In-Reply-To: <CAN_Opa_jb1pN=-Z+4WRoXVDSe0YfppeY319iagMdQoMgtOQSSg@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Fri, 20 Nov 2026 17:35:35 +0800
X-Gm-Features: Aa3M54pbohOCQbswSkwv-YDHDqEuETdr2HZyOy_eh_9wY3LvfDu8zJdBWDbyUx8
Message-ID: <CAMgjq7DbK8sc7-0CTOj5iZBmkLmG7ggj75mdTxVkunGzmi=NWQ@mail.gmail.com>
Subject: Re: [PATCH v5 06/17] mm/mglru: frequency guided workingset promotion (MGLRU-FG)
To: KunWu Chan <kunwu.chan@gmail.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Muchun Song <muchun.song@linux.dev>, 
	Qi Zheng <qi.zheng@linux.dev>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Chris Li <chrisl@kernel.org>, Baoquan He <baoquan.he@linux.dev>, 
	Nico Pache <nico.pache@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Nhat Pham <nphamcs@gmail.com>, 
	Youngjun Park <youngjun.park@lge.com>, Zi Yan <ziy@nvidia.com>, 
	Gregory Price <gourry@gourry.net>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>, Hugh Dickins <hughd@google.com>, 
	SJ Park <sj@kernel.org>, David Rientjes <rientjes@google.com>, Yu Zhao <yuzhao@google.com>, 
	Vernon Yang <vernon2gm@gmail.com>, Zicheng Wang <wangzicheng@honor.com>, 
	Chen Ridong <chenridong@xiaomi.com>, Tal Zussman <tz2294@columbia.edu>, 
	Xiang Liu <liuxiang.277@bytedance.com>, Ehab Ababneh <ehab.ababneh@intel.com>, 
	Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>, Lian Wang <lianux.mm@gmail.com>, 
	Joanne Koong <joannelkoong@gmail.com>, Hui Zhu <hui.zhu@linux.dev>, linux-kernel@vger.kernel.org, 
	cgroups@vger.kernel.org, damon@lists.linux.dev, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 4:09=E2=80=AFPM KunWu Chan <kunwu.chan@gmail.com> w=
rote:
> > +/**
> > + * folio_inc_lru_refs - Update the folio's LRU refs and lazily promote=
 it.
> > + * @folio: The folio being accessed.
> > + * @flags: The type of ref: FD access, or mapped access optionally wit=
h
> > + * executable access.
> > + *
> > + * Used by both cache access (flags =3D=3D 0) and page table access (f=
lags =3D=3D
> > + * LRU_REF_MAPPED, optionally with LRU_REF_EXEC).
> > + * Context: The caller must keep the folio alive by a reference or the=
 page
> > + * table lock of a mapped folio.
> > + */
> > +void folio_inc_lru_refs(struct folio *folio, unsigned int flags)
> > +{
> > +       int max_gen;
> > +       int type, refs, old_gen, gen;
> > +       unsigned long new_flags, old_flags, max_seq;
> > +       struct lru_gen_folio *lrugen;
> > +       struct lruvec *lruvec =3D NULL;
> > +
> > +       type =3D folio_is_file_lru(folio);
> > +       old_flags =3D READ_ONCE(*folio_flags(folio, 0));
> > +       do {
> > +               new_flags =3D old_flags;
> > +               old_gen =3D lru_get_gen_flags(old_flags);
> > +               refs =3D lru_get_refs_flags(old_flags) + 1;
> > +               gen =3D old_gen;
> > +               if (old_gen < 0)
> > +                       goto out;
> > +               /*
> > +                * Lock the lruvec if the folio is on-list. We are alre=
ady
> > +                * doing lazy promotion so in theory we don't need this=
,
> > +                * but for now, concurrent aging would still corrupt th=
e
> > +                * size counters.  This is a temporary limitation and
> > +                * will be lifted very soon, so the lock here is not a
> > +                * performance concern.
> > +                */
> > +               if (!lruvec) {
> > +                       lruvec =3D lruvec_live_lock_irq(folio_lruvec(fo=
lio));
> > +                       lrugen =3D &lruvec->lrugen;
> >                 }
>
> Can we do the lookup under RCU and preserve IRQ state here?
> filemap_read() can reach folio_lruvec() without RCU held. On non-RT,
> lruvec_unlock_irq() can re-enable IRQs while KVM's hva_to_pfn_retry()
> still holds gpc->lock.

Thanks for the careful review!

We can, but not in this commit, and in a later patch we did convert to
RCU convention, so this lock is just an intermediate state because it
may race with aging hence race with the active / inactive number
update. In a later commit we changed how inactive/active is reported
for MGLRU so this is no longer needed. We are basically lockless after
this whole series (I mean, RCU lock only).

Perhaps I should add a TODO in the comment here so reviewers won't got conf=
used.
