Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795212391;
	b=Qmg8rleEpj+J8XtdL7F6UbAQn5SnvZNqjdavpqlzGfwQj9VhYg+ntEszy8eJrRJfaJ4v
	 mraX7wFQDVxs8GuJPCCcHAF/d7jqb+9XNSXk4s8MkGBUB5IxXcHkyDoDmX8u6Zvq+Rvxd
	 ah648PSNv8MtCzgJMFOZGmVQjTtOg+Nf3rFSU9oddpJGyBW2K0GZtcyS/Hup+Ckwut6DL
	 XR3osgttx51roiD8ZSheF3i0t1/YFD999H/jzdj67oATtGvhM/4/9Uf+hyPs6NMwMTo8P
	 tS6bgSnRn16Y5aFCFNd/OLfAFMrlfB9ccNj0QtbriC8sFRx0f5G2+/DifJTXll1kZaA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795212391;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Qp2BTPut4j9BWLU7kp/9R3u9IW0btPsFhc2WZOxCd1o=;
	b=y5c7lEM+jMWHl2a0WP0wPUepxOBomcNVUYs2oFvM29KhEz7MUK9CzuGRy8+APKfXvLpb
	 JvF5kj1cGbabWrRpaIA3KR1U4EPmW2UmulKWNFrpecLEiu7BETLkMgKFmCxldvSZhR8K8
	 /KzmYnF15qW4Jmn6ohkXWs7iNJiaPOlvs2CDah5b0Ix4uJGuL6hnFameacJiOwudQGBs8
	 1wGh13wAr5auUZtZsUIKQ+toAbKGOGrlbhB7+Rd9rPCY74hC8ThGYNMRuW5R5B0SBslP5
	 ltoqWTMq4zIpA3Ieu0EoYgPfG+ALQkY3v+snYx0xIbzZBadHRd0spQ2GdjkzFkhL8iQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="QDhVM/Zo";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101A9606A6B2
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 22:06:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 101A9606A6B2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QDhVM/Zo
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6ba2bd43dd8so1300a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:06:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795212387; cv=none;
        d=google.com; s=arc-20260327;
        b=pHWrzjD8IpsW/O2iA5eaiG0YN5ZPf+5GjH9kbG0fxkhtAZK3sTS343OLaXV8bezWkr
         rX7bQEQvsJiX4UKq1jm5QlJnuQ/0P4KOvXcVPILFHyVCbBgrxTwlWxYQpEM9Rezz5Hgp
         kvNVLjVvdF5taKdJiVXPQXhN0lSVAeVsRY6rLYFNQeJbIjcoTH1p3atb9iHEgD334UPu
         BAKoocH3JIeoZkQJoEjpwSngQjBGi2PpdraQp6dR44fGAq9fsu/R+dN7WE5n0BbJbl4B
         k47npgLz3C9/SsqTeoKpWrz8WXxmO7WqxM5nY9W7Se4v2oo1HdrWjYLsGbezZS1s+obo
         H80w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qp2BTPut4j9BWLU7kp/9R3u9IW0btPsFhc2WZOxCd1o=;
        fh=vo/xqqdQFpeUPKwohrWBj2tJKH39IYBz03rhLqixE34=;
        b=ISMcNTQ31lf1qBNXt4IwJOuXD+KsdKVD/e7aqVVYwAPJ0M+w1SlYtXcNfUXj4piYBM
         yvfFoFCGKI73qaEPlvPCMLy0aQMRkUsz8jBRXp6UmSn+Poga8yoK4cucKG4knU1NrfHa
         BQpMOzjGgvLHshreVWomF2/y95jrIBTjjahSUR3PCfjEkKYsgnVAj4+PZvRCnOQfUHbT
         EuU7txZN6wBANR8/QKgkAf6s4yPKdCdHotgEId4MvnKlhsWOKBEgZxYK50AbQolwMwGU
         rvP9p1uOHL2APdVLw+X6S8fTOzp3TiSDYsRycWGQzcapD8WQOSpSkKXses+JY/VTd1Ui
         26QA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795212387; x=1795817187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qp2BTPut4j9BWLU7kp/9R3u9IW0btPsFhc2WZOxCd1o=;
        b=QDhVM/Zo4S37hMoYznTM8uYHhLg7u/tL4dCH84fAFCxBsv4SRKPoa4OanJQemqwh8W
         jH3YYClUp+AyYca90wrb+PLm1T6/5vY9dxw8tjfVv73zKOyivVzbbxDjzl+VRNoOn4c1
         g7PmJmGCZqjXaAXeRnex4CTSZm0scwmnTpQJf10zq5Uds8aI7yKuUBd+gpcaUqvJi0GY
         pn3emNfxwHiI2bqQnpCLSEmtBfEtPwgjYu4aSjEzhwkM/of49A5VAtQPsr3ImNnEn4r5
         hPx6QX7uTG9sUcNvhevHHF8Mj25SaLD6Q5nZEsAXjxKJYwr/hF5BNzKVcRYssx6dbC+e
         cSng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795212387; x=1795817187;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qp2BTPut4j9BWLU7kp/9R3u9IW0btPsFhc2WZOxCd1o=;
        b=I5vQoO3ZrV0vkcOdNKL/dhMgc+p6it7xcyJmT+ZQuZTm00ZTWruPnXGAtUtLdYpdfi
         fxhkkiRQZmYRRDS1JbKJJmaxoVaSZIbYFQpj737YZBSwidjKyA6/Fjlkq8wiCD6abhCA
         /G/zKRKEvpdo4DrQ2M+wezIvPU8zQFoyzfODW4XNn/1re8YJ+wkHrJpRFak54boqhN/T
         LOE0EO9hxsGk8loAEfpZGYKOheWgQWQx0mCLxjfKFlE5s+h1LtjTFh7zr+Tte7a/wOuJ
         KkzbpWdDdyFQVmsKg9gxe2gVogLWN54ED9V94txqj94FP9DJ5wiaxulimXnwEUip47K+
         617g==
X-Forwarded-Encrypted: i=1; AL+hErHHfw7fg+NG2hIh9S7Gi+qR1gwbUh7I8CJdTAby+UW9NIvxEIB9XVggpMpevGUt+nhoPgrERqa7ylbk1kU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/LBGwJN/jf06qTsjA2x+ftkg0oJymUxzOW7fE38ZOM/QoQmnJ
	zIpXyfITXQdQop2/u4e8tkzPxehlgrLhCNur8Fwt4a11/nWtjYQn44AMYeFmlU09EsvrWlsImrc
	YmVRI/LjkmiNyq/Z7Fqjt8TgnTBf415wh9Y+/5MCp
X-Gm-Gg: AZFdTZfjt92mpGIme8q6wvmlDq1iz9RsumOlufaEKQ5v4Ts9B7a8eIOTuDm9pyNKKoD
	HnK7ejTxtg9MQZM+KjUVHQLJw9jWEXRycfNALLY38O4VgVmxE309bB05NfmqGJWb55Guz2w4hCm
	55E75alt4VjCIYaGoAzteFBUW3E6kdVjOWQf17QpP9gIA3NAA5rqwqDPMqXH6DBnpOOmL/yGXBN
	N3UEjyGTk14VUBLxEYT+uulE0lffcuEEJYpdWQBu08Ri3rVWSKjQHpx3Ojdgk2c5pSS9rvFYIkd
	F3/jH6csQqtT6O89NdsaNrDTlbDb7bo+xDAijY4kG1979vwovrNQ9gdyrqe8b4pmHewhILhxgtE
	Innw338iGrL9rtexuCMuj16wUu+vQQkL7WUYUh1WXaqEEMbE4gAmXF5BVK+cGFiiWzB0ItH65P6
	dnZSmHx4UJ2RAgxxy3M54EeH5cmBfaQFsvQwPibnXYVkVkUA==
X-Received: by 2002:a05:6402:548c:b0:6ba:12d7:69a8 with SMTP id
 4fb4d7f45d1cf-6ba65a76fffmr24683a12.1.1795212386808; Fri, 20 Nov 2026
 14:06:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116071325.263682-1-hao.ge@linux.dev> <20261116071325.263682-4-hao.ge@linux.dev>
 <av34JPIcIOVdF0kL@milan>
In-Reply-To: <av34JPIcIOVdF0kL@milan>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 20 Nov 2026 22:06:13 +0000
X-Gm-Features: Aa3M54pvZs5QUyjUwxPZUYW951y-yto_861ekfXrLaBmJJ2Uwz172HO5VdEMhNg
Message-ID: <CAJuCfpHOTq5OAQtWnYjtFqUL58nn1GxCXp-DtoK4MsfeLPcwMQ@mail.gmail.com>
Subject: Re: [PATCH v5 03/11] mm/vmalloc: reject an unaligned range in vmap_page_range()
To: Uladzislau Rezki <urezki@gmail.com>
Cc: Hao Ge <hao.ge@linux.dev>, Dev Jain <dev.jain@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Alexander Potapenko <glider@google.com>, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, Dennis Zhou <dennis@kernel.org>, 
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 7:10=E2=80=AFPM Uladzislau Rezki <urezki@gmail.com>=
 wrote:
>
> On Mon, Nov 16, 2026 at 03:13:17PM +0800, Hao Ge wrote:
> > commit a739e6b557af ("mm: vmalloc: WARN_ON if mapping size is not
> > PAGE_SIZE aligned") put the check in vmap_pte_range(), which is too
> > late, because the upper levels may already have installed page tables
> > for a range that is rejected anyway.
> >
> > The pte loop maps whole pages and stops only when addr lands exactly
> > on end. An unaligned end lets addr jump over it and the loop keeps
> > mapping past the range. An unaligned start maps the page below the
> > range and usually misses end too. Such a range is never a legitimate
> > request.
> >
> > vmap_range_noflush() has a single caller, vmap_page_range(). Warn on
> > addr and end there and bail out with -EINVAL before any page table is
> > installed, and drop the check from vmap_pte_range().
> >
> > Suggested-by: Suren Baghdasaryan <surenb@google.com>
> > Suggested-by: Dev Jain <dev.jain@arm.com>
> > Signed-off-by: Hao Ge <hao.ge@linux.dev>
> > ---
> >  mm/vmalloc.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > index 3c0d9e69b886..a168f6f20f4f 100644
> > --- a/mm/vmalloc.c
> > +++ b/mm/vmalloc.c
> > @@ -125,9 +125,6 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long=
 addr, unsigned long end,
> >       unsigned long size;
> >       unsigned int nr_pages;
> >
> > -     if (WARN_ON_ONCE(!PAGE_ALIGNED(end - addr)))
> > -             return -EINVAL;
> > -
> >       pfn =3D phys_addr >> PAGE_SHIFT;
> >       pte =3D pte_alloc_kernel_track(pmd, addr, mask);
> >       if (!pte)
> > @@ -369,6 +366,9 @@ int vmap_page_range(unsigned long addr, unsigned lo=
ng end,
> >  {
> >       int err;
> >
> > +     if (WARN_ON_ONCE(!PAGE_ALIGNED(addr) || !PAGE_ALIGNED(end)))
> > +             return -EINVAL;
> > +
> >       err =3D vmap_range_noflush(addr, end, phys_addr, pgprot_nx(prot),
> >                                ioremap_max_page_shift);
> >       flush_cache_vmap(addr, end);
> > --
> > 2.25.1
> >
> LGTM,
>
> Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

Reviewed-by: Suren Baghdasaryan <surenb@google.com>

>
> --
> Uladzislau Rezki
