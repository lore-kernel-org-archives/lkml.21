Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795191645;
	b=H7WFz15VvvSq1bqZrcPVeJi3MU78g3UhCkb/pqgSZI2k+5Ab7tmwZTZuaqlsnPfiTGOJ
	 rEfj7bo0WY7GnBt7xxkc0MBuDSTXqax53P/czXkwyBxQjrH1dMKxtm9mpez7oNlC+8iVP
	 jMreO5k+EBmFIrsKSe498HlOqupv23u4As8P4Sa5kz5JnQcAM0VXXQB1OmWQ4WanIqPbM
	 +EAZJspITw7owTRF444QtzwkdzodVqEm3no2XiMr71hcKCyTU5S03RErVIeAy/w8aOzLL
	 /xHKywOshLQo2J5B4610OIN/7ylakvXaMGkQEnpzHxc8fURw40fTmdBwD5giTKUdeew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795191645;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=nFviYrq5o1Aunl789XsU4c1vTFdvhxxqWOma4Om+z08=;
	b=sJzVcYGRAB0NNADDoEfoG+9MtJ4bAfYyxRl3x1a/QR9C21BbAeVhMdNC5aULeoT8aS8P
	 eapAHBZ1FSNLn9bNlufif2xkWs9cClOYFWtJJm68PWtXHkCxrfhlIYfHIRYUaAKTevcyD
	 Krv/eZUGoGjPCB8WMXFvZTY71dGDsC7tsjKt9oTVi3rVcfSZ6ZTCy2piO/JzK7bkUxBlw
	 DIUjrQAU0Rk3H3HaKKrZjvc/JEg/JTqhRsZByN3Vj/i/Zi4qQOcBjzxqaynGZ2RGO4/qP
	 SeIS2/AAw423AHVV5fCEjBis67WlEL8dCrGTqVUIrFkn/fCiVJTKrnVtv5bDKxjZ0pg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xZA5Lm80;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B8B606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:20:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2B8B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xZA5Lm80
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so17448075e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:20:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795191643; cv=none;
        d=google.com; s=arc-20260327;
        b=H2tMyppTddjhAMtfgrK2R0U5wIIl4y1bfXJotpP1d/yGl0fMEE1lLd1x0shU7pfG7A
         gI+Y62vYt5ciJEulSXF4+czjwEnaGZ/7FS33N4wIqvbC8mB+prCMYfgE2B+NCKg3XkVz
         9OIQDBL8Qwq1yNamKt62bIkZg/AJitCAWU+PZoLgob19CjdFzCHCsBVKuLKQntItYr7h
         2eWwd2SrEMJIg5sKILhvtTWSg1v+u2TRs8UmSx5Y2CW/F1SsGJ4rxOd0metxj6ibdw43
         XYhB9DsBXHgKoZDsh08AdWu2VggYn3CEbuHoBbaMtzVBOGbqCDeTbM6TrLNXPXrSXmL6
         sjWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nFviYrq5o1Aunl789XsU4c1vTFdvhxxqWOma4Om+z08=;
        fh=b4cgb+byHKrD/j1XlgHGBDbp2mkYH00GRkSKZrpL/jo=;
        b=rM+a81EHPgQuyHscOJDW0cRNO+PDbSxOd7fzloZclprTd7MWRai34rZOy6b/BzdRCN
         2bh+81zfYLzKpYo2OME+1Xj1DC3ZqlmXTR1mgSUKN7yhpW9bXi5L3vTlwldLcrHpAdDr
         CwG8XmSWGPIb4nuiEEQBsBSAP3wxnD+wuaDVCI1acsnPJO58Njg+D7DmeNPtb7ozfayI
         fEcnKrCDYuxM5i2qfkyvZpBgor4rvFrPzDrxvdmej4Zsi6MLS4nhXWfgwdsPkGUgDGFz
         +sLqXg5DSEDO2TrxZUSSnkyP/ZOsVkhJNLJi0Uz9Nb7GIJI+hf91EzBO7DbXOl1LP9B3
         RyDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795191643; x=1795796443; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nFviYrq5o1Aunl789XsU4c1vTFdvhxxqWOma4Om+z08=;
        b=xZA5Lm80+LmwnUw/ns35xz13xjfstKAn+btE7x5CEnUfuPMX9rtmTlrF1HCNHn3wTA
         PBf7UOKGidfFBVxjBDPe/Ylm1BLDpT69s8c3/6YvhqNPnvEZ4Z4t8jq5XHgiSbtXcf3G
         ljZcejKzQgNKLnk/3S4a7Mgu0GlyteWhwqPwUQpQTnDOZiaINidP3xqmE4vxE8s2Opds
         YFLlC0yro7uc1n+fM+UlN5PrtKMKNzD5PEAZYSfXMgDU/ub5SI9IK5H2rT4SRp6LQ736
         0vD9WMMa213cajcUFtNGIDK0Qhn6c7Mko4FoV8RHP7DouH34MmkI1r3kWdVXK2qW2Ulc
         m8xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795191643; x=1795796443;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nFviYrq5o1Aunl789XsU4c1vTFdvhxxqWOma4Om+z08=;
        b=HH1tcCqZS5m866zhuSqZnkEsqm/deKI10GcbQe4d/4xa+WKLnH+i3JePqm8nk1bdvO
         crvU3i7ir9a6ceZxpgBuXbP2RiG5lfFV4mojWFnSmRY8ypsoYWv28ShnSMpGZyYGcg5D
         tROMYn3Pc6f6SNvEmBfGoT996hQLhqvINpFEW6XV50VIHwb2cBRFWCSTJcOUKW35CV/a
         bi9vR22X4BwmOQx/SKLNC3AAGsRXAiF95ilIIKpFc/nXZW3KdDB+MwAnJ8pJjfI34jpd
         qu0tGnyHMO14HzxOVUtATnhG205cLshpS9Z+Mmg4KscHyVcR6CVyxNBDZ5vNZLtH6J1N
         8ZYg==
X-Forwarded-Encrypted: i=1; AL+hErHBDLPc1DPKKrV20DWfOr6F5Ak5fHLjea3a9+xtLK+qRTlechMEekglMSzzBjK2odZZ0TOeQvkzof58Y08=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hVIVvqyuICJr0uEKCUJ/xn/+CeFF2EHgA9G9baHDkeB8gDRdk
	dOzCpqQwCmwe7e6Sj/fRCHA+Ol62Qgi7Ra6Ab1wvhHv5XSEEofYKJEXPd8Z1OhBe7oTsSjPWEEg
	2ayvC2sP8KTVxAD8Oo/QN6x/v6Fecv3g=
X-Gm-Gg: AYBFou01vBleCzZaXgbGIgnQ+AtGAbDB14D8Bj82mOtgjwWnbun7bogZh7TMOZp02zP
	AowxnLVLWwRQBt72uHl13bvqKio1Jxxq1duGnpM3NsEAHUU4H4q9GO04LhfNFqSbKr5PlPYPj5e
	IXlLPOEqeG+C1WJ/LMWLeXlXBbmZ7vS9bnNvy3b9nIL+tMzfy792FtaQ1RpQAX4eluz2H1D8mbh
	r+LtbW1YtF16KojVmmfKQWQofZ/qHptgf/286eIoX4PsQCgurxLDnSJ3U3saAuMoVASUDDPU6mt
	Mt+fvrESX98LVLr6KDii0JQRwm1TXMsOO2Mq+Z6FAebsNKriXxhu7cVSUOvEye2hBERdJgW/c6U
	0HXWPBmDsQJ6Ic/2ov7CFiFKUxL3z6IfiGL4Vtrw0RpT78Tq4tKLUSqXmBerStW6+WuGul4iLte
	IkAKPCsyxV74rJhNF0kRk=
X-Received: by 2002:a05:600c:37c6:b0:4a1:88df:8a2a with SMTP id
 5b1f17b1804b1-4bb88812a84mr79631575e9.13.1795191642448; Fri, 20 Nov 2026
 08:20:42 -0800 (PST)
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
 <CAMgjq7DbK8sc7-0CTOj5iZBmkLmG7ggj75mdTxVkunGzmi=NWQ@mail.gmail.com>
In-Reply-To: <CAMgjq7DbK8sc7-0CTOj5iZBmkLmG7ggj75mdTxVkunGzmi=NWQ@mail.gmail.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Sat, 21 Nov 2026 00:20:30 +0800
X-Gm-Features: Aa3M54pZxa4hRHw0Lgws3rEOfSeNigcJ3vp4dRWPeqYAT3KKSQ-I1gkfiyUitiM
Message-ID: <CAN_Opa93a7Z0wmPxLGFeKF+BssvZeioFHU6tcnBioXTQKWKP-g@mail.gmail.com>
Subject: Re: [PATCH v5 06/17] mm/mglru: frequency guided workingset promotion (MGLRU-FG)
To: Kairui Song <ryncsn@gmail.com>
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

On Fri, Nov 20, 2026 at 5:36=E2=80=AFPM Kairui Song <ryncsn@gmail.com> wrot=
e:
>
> On Fri, Nov 20, 2026 at 4:09=E2=80=AFPM KunWu Chan <kunwu.chan@gmail.com>=
 wrote:
> > > +/**
> > > + * folio_inc_lru_refs - Update the folio's LRU refs and lazily promo=
te it.
> > > + * @folio: The folio being accessed.
> > > + * @flags: The type of ref: FD access, or mapped access optionally w=
ith
> > > + * executable access.
> > > + *
> > > + * Used by both cache access (flags =3D=3D 0) and page table access =
(flags =3D=3D
> > > + * LRU_REF_MAPPED, optionally with LRU_REF_EXEC).
> > > + * Context: The caller must keep the folio alive by a reference or t=
he page
> > > + * table lock of a mapped folio.
> > > + */
> > > +void folio_inc_lru_refs(struct folio *folio, unsigned int flags)
> > > +{
> > > +       int max_gen;
> > > +       int type, refs, old_gen, gen;
> > > +       unsigned long new_flags, old_flags, max_seq;
> > > +       struct lru_gen_folio *lrugen;
> > > +       struct lruvec *lruvec =3D NULL;
> > > +
> > > +       type =3D folio_is_file_lru(folio);
> > > +       old_flags =3D READ_ONCE(*folio_flags(folio, 0));
> > > +       do {
> > > +               new_flags =3D old_flags;
> > > +               old_gen =3D lru_get_gen_flags(old_flags);
> > > +               refs =3D lru_get_refs_flags(old_flags) + 1;
> > > +               gen =3D old_gen;
> > > +               if (old_gen < 0)
> > > +                       goto out;
> > > +               /*
> > > +                * Lock the lruvec if the folio is on-list. We are al=
ready
> > > +                * doing lazy promotion so in theory we don't need th=
is,
> > > +                * but for now, concurrent aging would still corrupt =
the
> > > +                * size counters.  This is a temporary limitation and
> > > +                * will be lifted very soon, so the lock here is not =
a
> > > +                * performance concern.
> > > +                */
> > > +               if (!lruvec) {
> > > +                       lruvec =3D lruvec_live_lock_irq(folio_lruvec(=
folio));
> > > +                       lrugen =3D &lruvec->lrugen;
> > >                 }
> >
> > Can we do the lookup under RCU and preserve IRQ state here?
> > filemap_read() can reach folio_lruvec() without RCU held. On non-RT,
> > lruvec_unlock_irq() can re-enable IRQs while KVM's hva_to_pfn_retry()
> > still holds gpc->lock.
>
> Thanks for the careful review!
>
> We can, but not in this commit, and in a later patch we did convert to
> RCU convention, so this lock is just an intermediate state because it
> may race with aging hence race with the active / inactive number
> update. In a later commit we changed how inactive/active is reported
> for MGLRU so this is no longer needed. We are basically lockless after
> this whole series (I mean, RCU lock only).
>
> Perhaps I should add a TODO in the comment here so reviewers won't got co=
nfused.

Thanks, Kairui. Keeping the temporary lock for the accounting
makes sense to me.

Kunwu
