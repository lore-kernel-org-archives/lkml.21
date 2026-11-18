Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795041340;
	b=dwUCtdjILRoi2vjbfl74EvcYqh/JKE6s6CjgY4HFUathM5R/FWokw2Lp1//JIHFKnfKu
	 Va1gcwftO6ck1wM1F12sqH6Vb3zUmmXKXRt8xj9HNcyExZ6+xYSQsGygnn8e9w9RcsbhT
	 /0DChsHhw7wW1jVo3SG/w74yT1XUbBJ6qMJ+YuFWFiajoRDD1t63LltnOUZ1fkgGxIbwA
	 A3Viz7iYRIdlYcQdBdBjMTQPg/9wN8awRJH2957qzNUlwsRL0xU8T6vmyBoM4/XH7B+Ct
	 qrwTFy1hhriHRSY2aAFS0lXsLr05+KmtnTtnDusaqz+p8l8L3vagOsczeV/bLvywVfA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795041340;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=023EV3UmscqrU+3CKH4pWC/ZjtyGVf4mSMvlqbUYUjk=;
	b=e0IryLrKhlPhKIyHtF6LoNfgmoj0sNZk+pKGcw2B7rSgY2msA5j8hnrhCShO/M6Bwbwy
	 KniM7M+Gz0pUX7VfI/HMd7uaB6A7KigdhYSwycLtB+IpMKtynoa11DZzPIiySYEHjtxEI
	 BEpAbpUv1xRJ/UptU4SvK7MIJ238BVkDt9v+IeKbDgMlCoaRPvxY3ETqt/Rdsb9Odhu4l
	 3YEH7F7FMVJVhS7Hk+iAzwjhGpnR/03H9rr2SVlbYB8Fe42bSHOORh+c+jgy9nfXiPV3I
	 +8Y19E1Pi0GJErGyMe30iX0MCage5P+WOo3BkwkKawf29h8Nacg6uyzxxsCC0rbfvvg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XwVUoa5Z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.170
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582F7606A32F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 22:35:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 582F7606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XwVUoa5Z
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-94965745d92so170875885a.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:35:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795041338; cv=none;
        d=google.com; s=arc-20260327;
        b=gH9B5THRPKyuTdhlYHPprnQ8ga5xbKpE2shZnp4sIZvxLCtjcD14O5cPk0IIaI1wFv
         ThnmA9ELpKRvA8dqzyI+4+eNGZ3GIJ8Uh5/EkTMLw3BZCjNMBegghU2yeIs1ghI7Tb0W
         vuuMuWfKLbLFKE/3vIhlXqf88/Bkky5K1HSB1KfD3E/WRX8elLxox7oeUIEBzKN1lww4
         OT+/o0ZLqVAzDxvOUyGvrVEQFxgc5kb+XOn9mc9y/GJE/kHgl9/hxZ7KnEGTMhK5Z8F6
         88jVWlZnNuJVKWyyVlXbpY6NRui6boLk4LqIstSsF+xcsMR8VwSOG5pHJPClsK1oTKkq
         l2OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=023EV3UmscqrU+3CKH4pWC/ZjtyGVf4mSMvlqbUYUjk=;
        fh=/rZD9FUICe6dQ8ro/t8/Hw2se+vSCuKbi9T3ecU6NXo=;
        b=LGj+Rzb1UN6JrUEOw0NG48h3Qz+/8fo7aWDvzPzK8cX+4GZ8WoWPzFbevYXgWePKta
         Ea3hNfCs7S5DraFRInf4jBSlG5tV1bJgNMiC1TKjrfq1iqK/SSoir7SEqRg8ochR3ydU
         TO3cOOBGKgci5HlAPdvyi/9eemOaeYmsz7QzNb3yapamx4efwjy94LHU+mSz1rfJC+l4
         RR9TuttDZOuJgg4+mkBZnjoOmg/XdM1SBHPs8jHqZBqYsk0Wdsb/1bDjDg21VgFlgZsz
         ercumfA1R/Ooeg1lEQPPShZqspCso4Z5g32T14ZoX4soOxMEqm51HbqPFcHcGqRFDNKX
         ujsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795041338; x=1795646138; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=023EV3UmscqrU+3CKH4pWC/ZjtyGVf4mSMvlqbUYUjk=;
        b=XwVUoa5Z1PkpCT1shvK5SdUUXkKK+eEUYdgzrnRNEyXqKvgHH6w7chNW6irOO41If/
         dpeTUBhuDOog+KPqv7WnIXObrFR8ZcfFic5Knf1t1wBIYJSo8a99mMhVsWvTG//ZAISA
         EHjTBuyUQiRRkKvWRnc/E2I95zxxA0cDsXYI8+iUV7A9Yg+iK7opxpFUphyxBbHprXkJ
         clL7Wso4YDLT5q75I8rG4RixcPuO8QavRuf1W+pDTU1DQRDLBSRFgIu/FdSna7rFJknE
         QNOgeh4hbFIKVeQFr1TU/oE0JAajZzJS+bi7vw0fE0qVriUvfcvOU14bbvMAVJkJezsp
         fr/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795041338; x=1795646138;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=023EV3UmscqrU+3CKH4pWC/ZjtyGVf4mSMvlqbUYUjk=;
        b=bMm7+jK7BeBAd5PQ15cn153/nvLh5G7qJZKgjJ6NCCq96pdHz1jDxuBjHk6iqvgr+o
         HLE+7LsIoDkqVac+PphmdFxUYQKHH9tNYBNKRmlF+DGdpln1GoT34vmNgIEk0DVBel3h
         gExB5dCGvk5iRmJdGS2VI1sLky8O75YcFOsYwZg8dP+t72BEmYIAd7kIOM0DpOsK8FKv
         /fy2yXp/gsB/gA5MV0NrY7lqsCSDMk/FruMnuvyuFARozAE66isD24i1BE+iHY6KNPyv
         O5Pw4wyfoR0fDfxMGEFYLDexU34yKvg0mnXkSEkCZdtqMgfNWug64bAgZ8kR1irsNdKn
         /zVA==
X-Gm-Message-State: APuU4Z+F+wN4VgKfm1bYT1H3Y8XKvH5gXH91cPN6VctszHKeRinQMT6s
	rvdVWUQ90pHoDeoIsFBz3TUMJQcctBB6+xV5N6+ZhnDn/ZSRMEiif1lsTrlYTPxbkKorQzmAxXv
	JKIyJYorQLfDHKh7XK9/mzWMiDlcr4dP56w==
X-Gm-Gg: AYBFou05kehm5Ar3kxDY47aCVIIfQDI0V+SendnFqHwra2PKb+srnf4Jz/KHLaHDIL1
	ZV98F6zMRe3ipoqWsYh4tvEj/JH5DUlc9/+CI8naiG8iN0YvmGnVnzJmGHTB0ucOeRl9iHNhbtb
	xq0bUjC2of0snxJi+xPErupYtkbgk6p2g8hUzcwjiKkgLy8X+baocCrqB+FpT2zGN8c7eNb7Csm
	AZNYDs8cMnccjm+7A5ddCs6Jl8yLb6gLrD5iIs4iDAgRiCGXQH3fV2Ek70QQDStEOmunTorwoft
	QgqsX0u6gp3A38/bSODU8iIA5t+pCNaIEFeqpB0jnapOwgm7SKzN3Sb9KZq6TEbnZUP8o1K6toM
	MQNjIk7/PCAieOfyj1rlE9ntJynI3yry9qRFy1gWoXqikY+rreYpl4KD53qjfQN/mqsA+gd0djV
	8VzNGmkPZM6eqfvSonYT900g==
X-Received: by 2002:a05:620a:8388:b0:944:12d5:fd45 with SMTP id
 af79cd13be357-949996075d7mr688897285a.70.1795041338269; Wed, 18 Nov 2026
 14:35:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117214352.337961-1-mohamedahmedegypt2001@gmail.com>
In-Reply-To: <20261117214352.337961-1-mohamedahmedegypt2001@gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 19 Nov 2026 08:35:26 +1000
X-Gm-Features: AclHuK9S7MBiqC4XDYhBqJgsIJRtApfI62TZ3NiNQFPjGFLLLvtd6Ud3s9pP4tA
Message-ID: <CAPM=9twShVfc2XGzi2EcSKAxuCE1TN2Unf_Dv_ey0z8nH+BxBA@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm/nouveau: fix instmem io_mapping faults and slowdowns
To: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, Mary Guillemard <mary@mary.zone>, 
	nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

Applied to drm-misc-fixes with stable cc.

Dave.

On Wed, 18 Nov 2026 at 07:44, Mohamed Ahmed
<mohamedahmedegypt2001@gmail.com> wrote:
>
> After the instmem io_mapping commit, some people noticed that some VK CTS
> tests became much, much slower, while others started running into apps
> MMU faulting. This was because of two issues that combine together.
>
> A synchronous VM_BIND waits for its job with an interruptible wait and
> ignores the result. On a signal, the ioctl returns 0 before the page
> tables are written. Userspace can then use the new mappings, and the
> channel takes an MMU fault. This was an old pre-existing bug.
>
> On the GSP path, the BAR code keeps an ioremap() of the first page of
> BAR2 to flush BAR2 writes with a read while flushFBZero is not mapped.
> The instmem io_mapping covers all of BAR2 and overlaps it. However, PAT
> gives the new mapping the type of the older mapping it overlaps,
> uncached-minus, so instmem was now uncached without write-combining and
> bind jobs became much slower. This is what caused the slowdowns, and the
> slowdowns in turn made it easier to hit the pre-existing VM_BIND bug.
>
> Patch 1 fixes the faults. A synchronous VM_BIND now waits uninterruptibly
> for its job.
>
> Patch 2 takes the flush pointer from the io_mapping which allows us to
> skip the ioremap entirely. Nothing maps BAR2 before instmem does, so the
> io_mapping is write-combined again.
>
> Patch 3 sizes the io_mapping to the part of BAR2 that the driver uses.
> This is technically not required, but this matches OpenRM and makes more
> sense. It also guarantees that a similar issue can't happen again if
> something changes in the upper half.
>
> Mohamed Ahmed (3):
>   drm/nouveau: do not return early from a synchronous VM_BIND
>   drm/nouveau/bar: take the GSP-RM flush pointer from the BAR2
>     io_mapping
>   drm/nouveau/instmem: map only the part of BAR2 that is used
>
>  drivers/gpu/drm/nouveau/nouveau_sched.c       |  6 +++-
>  .../gpu/drm/nouveau/nvkm/subdev/bar/gf100.c   |  6 ++++
>  .../gpu/drm/nouveau/nvkm/subdev/bar/priv.h    |  1 +
>  .../drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c | 32 ++++++++++++++-----
>  .../drm/nouveau/nvkm/subdev/instmem/nv50.c    | 19 ++++++++---
>  .../drm/nouveau/nvkm/subdev/instmem/priv.h    |  3 ++
>  6 files changed, 53 insertions(+), 14 deletions(-)
>
> --
> 2.56.1
>
