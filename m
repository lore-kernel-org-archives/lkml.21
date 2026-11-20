Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795213490;
	b=Y++nr9qf77v4wV79cUwcLscoRfM+hWYyYEBuyp3Ir7MBmcgjOSyr6E1S9pjN4FhtuWlo
	 +0aCUsssMJA7fjqlkUYZ/Axr9ss4YkwLnfISb8i7K7RUAPuy257TEWUcmuDG+gQSf0qQN
	 98WC0ChTHE1HRTn/TL9BIJQduuQRRdfofdF43OE0IRaCSR+5hFC1SfNFK6iqkRGwygyeZ
	 2J+g+Dqt9vWcHICaaId8WoITIcm+1Pa/EcmiQX+JW8x6stxxUr83Vlp8BMjxXngGSdvW/
	 p1GVDpDjyzE1kgjnxLTvLa2qyt1pGw0Wm+rbBRR+ohVP90ekBpqM5MUnQ5HSrcFFZ6g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795213490;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1NRDdhSVMLSlkGl3vLfd9oDNXjJR/tyu9kac4iL4k3Y=;
	b=tIm8U1kKLkdK0tXJcg+H2WU3FThuEb0UKfmDk6apuUgP/i8PQbKP3HS+jVFCBVW8ffRP
	 pZFkKJyyDZ43/VlNoRZoVJ9s0v+6YQcAAV/MRAzUKCx+UjUnrTrc/LoJ4NuDXU50jdGaL
	 +BZQ5XjfjlIHXa3o+CvT61m7BsvKBbpl/+wsfon2AA1fOJ3HlEkLdUovRue8kLmVrvher
	 PN7ZWKxI/ZQ9wrQok6RXdp0qHI9OhkykXr1XZSnOtr2Yljnyvb7jYZZTtQUu6vmy7ZwW2
	 wySzfXJAjg2esYAxgWT/bRTbnTiZMVPP0hQIHHTfrooCfusDFOZwp9IiVD5JHb1w/Tw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ADts5V+t;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693B1606A69B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 22:24:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 693B1606A69B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ADts5V+t
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-55c7445cf85so33051cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:24:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795213485; cv=none;
        d=google.com; s=arc-20260327;
        b=YQCnuRw7vrVhec3WgJxAiUC0NNq0XFxyLEZcFPJ1prSj5/g+htK7fnO4TLfZrnIhdi
         A+3X7l2FY31wVtqEnHh+p68RrkZEEdw4SJ+0OmLwi6k2xLW5ItwQBgwQr17NjDkzRMXJ
         Yd1RXC4xf3AcnApNULt+pI/ETUWR0QzNBOYPF5Ac3LfDkH+Pa3HdLcKEsHpFzP/C//Bm
         0UIrlvqjoBktkaOIlY+TrcyYKRtyYg4idsD7kU4NMw1SWY4qMdFY8HodNcpNLUSYQX9W
         Pblnne7sJU+KaKvMp4SILK2t9gWXk5XBVQpOAehS3vuX9GgiO3r/5guckXffHMX/qUQn
         673A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1NRDdhSVMLSlkGl3vLfd9oDNXjJR/tyu9kac4iL4k3Y=;
        fh=euc7YqlLk7ajFORcsuZkL185GeLJ6+AqrYtwuZOUM/M=;
        b=LJI4dpm51Z2MfwDPP4PazJXiGrdsFQPjHpavMEzhgFAxTdsgRMZyDTAAvitH8V5GlL
         D12/IlZDGJ4lCau5hcRKAJsAV/rAlENFGkJdCkAnegj1ARPf9hht+lUo65PkylnVyJka
         +7/saAJKrF5NjccrWY73lNTDnk0n5ceZjEalZ1QxhVWJISVqj8PKfDrbwLjbZWI95VA5
         ZnX+1MtUMH/n22T/qNMNtr5vYb+fk/OLe4jJ/rw74/altv7V7XJfcCdAxxklBdI7uxSM
         qEJSIlEUxQeZOrRnfr/hzo+BDuWHjwNR7p3gAHAO145eaFEB6vM84o6/SNQyLmh6MxaE
         g0RQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795213485; x=1795818285; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1NRDdhSVMLSlkGl3vLfd9oDNXjJR/tyu9kac4iL4k3Y=;
        b=ADts5V+t07HBSY3J7bcnF9UtaJ6lTZRHlbhro8AC6zk+8Uqw/4zHrEDvGrpVrYEzms
         SSX6dkDof3nDotBFjrYmBLyAbmEI/Ju9d6qE8LtHwqUirJuoo/UL4gUnCNMJV6P4GNMV
         5h5S8mYwGwhb7ca3c3DojjvFLjF8z6mcD6ZG6V4+jz7AaaF5TYmvDLQlnNvFNFIXtUNB
         gxQptF9TCqHdeaY7FVlkxWWPc5+BdpM/Sf8IKZpc9LpoByR6QkJ3flPEKCFIPILsexui
         8L5CWqm6pJ814LrL4sLHuk9u7JPnX0wFwuiFB8hKVHaKO5Y4XPH5OfBp3bUxcV9mpgI8
         kU1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795213485; x=1795818285;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1NRDdhSVMLSlkGl3vLfd9oDNXjJR/tyu9kac4iL4k3Y=;
        b=rf2aZY1ShsSEvFN/5tNAv3cDwjUIpomYOJxqhYgeRvbq8Pmm+b1vjfA1fpEjCZKbSP
         6b9aeCA3gwMFqDc2Soa22VmstJ34/oa1iqbWG+yPxV1KQicsTIWMtbED9otr7E/PEPqk
         kzemP6UYInbfuKgctmPnXlV//G3FUnw5vyEiHoMsMCmrKcELLuKOPRYRikHmP+maNb2i
         p1dyRJO35hfEqP1OZjRi6MLc+ot0wPSRosjbY/OODfSEbD93bOVhX8SVIxH/Rl8rDSdL
         BELwEQ7kwlxFiMVx/DiwBK7ySfrZq98GI/GJNYYGG7/aNbw74rJv1t2yHkO2HkonDNxC
         /ngA==
X-Forwarded-Encrypted: i=1; AL+hErG7KlJ6u3AAxrVCPxWFs6jTSEyjHMfrGXBS3O7QAupIg5TYwDjouE3WowDi/jz2fOy4Tyl1+Q/JyXT+0IY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5yjhWOReXajHEsuFgNRCr4DSBgw2e0vIXlUtUW2b5vGvAAeeT
	D3XFjaka5n+MCp2JLx2BSNVuv/fUTLo35c964pKGu2uxWHpUKO4Rr9TreACWd1p3Izojkb+RfTy
	rbDwgoq4mY7/bzJUTw6IipmSbojAJTMCiShk/egre
X-Gm-Gg: AYBFou0/1mdy8T9qxUQVcfsU/VwoOf4P4Vn63boUhW5hiStLDjdl7dU2o4hhWj3x1dp
	GcFpJ1m9HLOBzQortBlL1wb/wj5/AAJGfsDe1ZMXG1cxAQ1UVL0103R9g86sqmrhxy2YlhoP4vs
	nJZzRUW6geLFSUAjf8W3hK/eBERnbZe558YBmvL5xdJ7RpJGDkpXJPfS+qgGF7r+IYUGKkt456S
	fjaGZxohpwb1imgo2kw0jkd8SlIcnjVroA2NCljtBYj1y/O6yCAiWSn/bv6V2XHlpaBU3iSEGhv
	Dk/HaDK0hzCCR9cqWn5K+OnXSUdy7U4Dc4LYdjft1v7Emb7mkoPWoAbhtmho7BqXxEy/nQTWAKC
	BUJROgdJmKL3haq/dABZTSN+uM3MlDblO0pOmRORY33RF/QHHf/w441aL9TCPK2ofDyDp37iG31
	fT7VmVTfhfQhm6gfM9NaKEAG663TlzlEvMvBd7UOHK2KvwcA==
X-Received: by 2002:a05:622a:2303:b0:535:84ef:2e26 with SMTP id
 d75a77b69052e-55d88ff9f2dmr1848781cf.7.1795213484666; Fri, 20 Nov 2026
 14:24:44 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116071325.263682-1-hao.ge@linux.dev> <20261116071325.263682-6-hao.ge@linux.dev>
 <av39BuCsq-dRFiMM@milan>
In-Reply-To: <av39BuCsq-dRFiMM@milan>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 20 Nov 2026 22:24:33 +0000
X-Gm-Features: Aa3M54rJ7M1MnGNtQP9_VRtJkxxQVQjNLEl48ynPtV8As3xDhStKJU8NtpTSd_E
Message-ID: <CAJuCfpGoH+M6Ni6b13LOLkcCsGJdGofUwNaLaED-s2q+bRtefw@mail.gmail.com>
Subject: Re: [PATCH v5 05/11] mm/vmalloc: only flush the cache after the vmap succeeded
To: Uladzislau Rezki <urezki@gmail.com>
Cc: Hao Ge <hao.ge@linux.dev>, Dev Jain <dev.jain@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Alexander Potapenko <glider@google.com>, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, Dennis Zhou <dennis@kernel.org>, 
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 7:31=E2=80=AFPM Uladzislau Rezki <urezki@gmail.com>=
 wrote:
>
> On Mon, Nov 16, 2026 at 03:13:19PM +0800, Hao Ge wrote:
> > vmap_page_range(), __vmap_pages_range() and vmap_pages_range_batched()
> > call flush_cache_vmap() before they even look at the error code. A
> > failed mapping is never used, so the flush is pointless at best.
> >
> > According to the Sashiko review it is worse than pointless on UML:
> > flush_cache_vmap() there is flush_tlb_kernel_range(), which syncs the
> > PTEs into the host OS. Flushing a half-installed mapping therefore
> > leaves host mappings behind for a range that was just freed again.
> >
> > Only flush when the mapping, and for vmap_page_range() also the KMSAN
> > metadata, is fully set up.
> >
> > Reported-by: Sashiko <sashiko-bot@kernel.org>
> > Closes: https://lore.kernel.org/all/sashiko-outbox-178439@kernel.org/
> > Signed-off-by: Hao Ge <hao.ge@linux.dev>
> > ---
> >  mm/vmalloc.c | 11 ++++++++---
> >  1 file changed, 8 insertions(+), 3 deletions(-)
> >
> > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > index e2b63cb1592b..d99d7710e1ba 100644
> > --- a/mm/vmalloc.c
> > +++ b/mm/vmalloc.c
> > @@ -371,10 +371,12 @@ int vmap_page_range(unsigned long addr, unsigned =
long end,
> >
> >       err =3D vmap_range_noflush(addr, end, phys_addr, pgprot_nx(prot),
> >                                ioremap_max_page_shift);
> > -     flush_cache_vmap(addr, end);
> >       if (!err)
> >               err =3D kmsan_ioremap_page_range(addr, end, phys_addr, pr=
ot,
> >                                              ioremap_max_page_shift);
> > +     if (!err)
> > +             flush_cache_vmap(addr, end);
> > +
> >       return err;
> >  }
> >
> This is incomplete. Maybe merge with 6.

Yeah, by itself this would still keep failed partial mappings, so it
doesn't really fix much, right? Merging with 6 makes more sense to me
too.

>
> --
> Uladzislau Rezki
