Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.120
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795002502;
	b=XTtZ5ctcNwAGbvKOYD8pDuLK2F5Be88By98qPOPOedFV3sRJSvCwqAfq1yHyMc/AW3QV
	 V2e9XgrwI624ZK7Ck6WpSKWskBg3OtNJC4vNzRtVjo9JZHbGzonVt6S5Kr+5CNsB0AHv1
	 nkLSkrrcErzA9bTsGJIW7FVZEyu2hakxsc2v7nYZUsZytV9AaKzjdSTlOeKbu2lKvDHDj
	 u8smonCjyvhcKpSsH3da88JaPGN0Ol3zv+MTTsgCK547b+f9ptjNIC0rSJi4iUM4Bsnen
	 ou6zzy34g9s1RKiL5wWsxrwZngv5tOguin+XHWFl7Ge0+glsSQQDVSA5OLWsf2a3Anw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795002502;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=tO3TgKkDiEBpFDzUdbEPGhGOGJy6r4jFNQqVHNYhZcQ=;
	b=azJAhOHAyn+sIC3ENd7H5CLexiN2zTMlgR/v0kLA+sAK/J1lKOpWoksiK7MXPBVSiXYM
	 89lj28Vk+XKvXYZvd5QSJBvScP8JF2obaD1j9HEhxPIqdOQLBJ6m0GoyTzWVjKuKOQniO
	 bTSF/sGSesEPRFfvk6iG+hvsJKuNgGrwAExq2xH335cpoAcEhQISGGksAZVD8wxUxAAHW
	 tVAXGbiuFx62epXlHSytlpPvDsXQOjGl2hkzikpuQBbuNSBXKojUTWNSXl5+U3deLX54A
	 k7lgL0iw3S3BdAie6yoyps4YiRW/bQq3WgamrJvUeBqfg7Hzucpt7Muk+Csg8X5Nt/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MI3cXKzl;
	arc=none smtp.remote-ip=91.218.175.120
Received: from mta0.migadu.com (out-120.mta0.migadu.com [91.218.175.120])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE82606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:48:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CE82606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MI3cXKzl
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=vauVE3U2RMCS1gurgi7wXZGlIMNdafXrioxA86yoBjw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795002499; v=1; x=1795607299;
 b=MI3cXKzlV7UIr/RZ0JX6zp4i0ZFe9LQp1SU4et4ivCh54T6Ja0pP9WZ9+k1/UZ+OIIv9MRlj
 IAFN8DwBWnaXQlL/Q75g862SuUeF8UnThX0fNToO6s6oeWNpqfXdxfAQmiTMPc5dh3uv8j3D5aH
 IC5m9wu5OEcUSbEJN2hAGIi4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 995b1b54c0241e97;
	Wed, 18 Nov 2026 11:48:19 +0000
X-Mizu-Trace-ID: 995b1b54c0241e97
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH 1/2] mm/memfd: drop redundant hugetlb allocation mask
 narrowing
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261117-for-memfd-v1-1-fa68f433171e@kylinos.cn>
Date: Wed, 18 Nov 2026 19:47:21 +0800
Cc: Hugh Dickins <hughd@google.com>,
 David Hildenbrand <david@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 Hongfu Li <lihongfu@kylinos.cn>
Content-Transfer-Encoding: quoted-printable
Message-Id: <87A66860-C0E1-42CF-AFF7-671D19B82E16@linux.dev>
References: <20261117-for-memfd-v1-0-fa68f433171e@kylinos.cn>
 <20261117-for-memfd-v1-1-fa68f433171e@kylinos.cn>
To: Hongfu Li <hongfu.li@linux.dev>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 17, 2026, at 18:53, Hongfu Li <hongfu.li@linux.dev> wrote:
>=20
> From: Hongfu Li <lihongfu@kylinos.cn>
>=20
> memfd_alloc_folio() derives its allocation mask from htlb_alloc_mask()
> and then clears __GFP_HIGHMEM and __GFP_MOVABLE. This mask handling =
was
> introduced by commit 89c1905d9c14 ("mm/gup: introduce =
memfd_pin_folios()
> for pinning memfd folios"), when the fallback path in
> alloc_hugetlb_folio_nodemask() could still call
> alloc_migrate_hugetlb_folio() and reach the buddy allocator, so the =
mask
> decided the zone and migratetype of freshly allocated pages.
>=20
> Since commit 26a8ea80929c ("mm/hugetlb: fix memfd_pin_folios
> resv_huge_pages leak"), this call site uses =
alloc_hugetlb_folio_reserve(),
> which only dequeues folios from the existing hugetlb pool and never =
falls
> back to the buddy allocator. The mask therefore no longer decides =
where
> any page comes from.
>=20
> Long-term pinning safety no longer depends on the mask either:
> memfd_pin_folios() obtains its folios (dequeued from the pool, or =
freshly
> allocated) under memalloc_pin_save(), so PF_MEMALLOC_PIN makes
> dequeue_hugetlb_folio_node_exact() skip any folio that fails
> folio_is_longterm_pinnable(), and current_gfp_context() already clears
> __GFP_MOVABLE from any page allocator request made under =
PF_MEMALLOC_PIN.
>=20
> Drop the narrowing, which has had no effect since 26a8ea80929c.
>=20
> Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
> ---
> mm/memfd.c | 1 -
> 1 file changed, 1 deletion(-)
>=20
> diff --git a/mm/memfd.c b/mm/memfd.c
> index 0e3ff3eebfa8..8905e3e9efc8 100644
> --- a/mm/memfd.c
> +++ b/mm/memfd.c
> @@ -85,7 +85,6 @@ struct folio *memfd_alloc_folio(struct file *memfd, =
pgoff_t idx)
> 	u32 hash;
>=20
> 	gfp_mask =3D htlb_alloc_mask(h);
> -	gfp_mask &=3D ~(__GFP_HIGHMEM | __GFP_MOVABLE);

You didn't mention why __GFP_HIGHMEM can be removed safely. I have to
investigate the reason myself.

During review, __GFP_HIGHMEM was cleared because "these pages might need
to be accessible by some DMA driver, so you have HIGHMEM constraints.",
refer to =
https://lore.kernel.org/all/ZmvNLSUgUgFETR0M@localhost.localdomain/

I think that restriction is unnecessary now: DMA and existing =
memfd_pin_folios()
users operate on pages or scatterlists and support highmem, while the
shmem path already permits highmem folios. The hugetlb path therefore
does not need a separate lowmem constraint.

Because you have removed the constrains, why you didn't remove the =
comment
along the way?

	/*
	 * The folio would most likely be accessed by a DMA driver,
	 * therefore, we have zone memory constraints where we can
	 * alloc from. Also, the folio will be pinned for an indefinite
	 * amount of time, so it is not expected to be migrated away.
	 */

Thanks,
Muchun

> 	idx >>=3D huge_page_order(h);
>=20
> /*
>=20
> --=20
> 2.54.0
>=20

