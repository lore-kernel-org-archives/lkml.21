Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795130906;
	b=ch/SvdYTm9916NCh/REEnd3X2Hp+rDRNizVTBuYUnD4AJNy5lPzK6IHMqYFJruVNJpKE
	 /EdabZhmU0xJcoafvGkKMp2jeXgIMnJ5EgIX9Jjwi2tTbSftJ4Nl0coHmuLoztWub/fL7
	 e4jtCHPS72yL8t4VwjYElqoteLPgX2XCUTDOv2oCLmGF/Reu8JQ1L9+FlmMdyQhRWaQWG
	 iQaC7VwtIYylaK8uqEGEFLJoM/mWjHTp/O4SfObkiu481wC6GDDbtJBEbupMUCJn8xNP9
	 VwjJxq7potycEYHbhgtIaB6Q1YtyYj9w9c7kwj+u/hDl66i4P9nqbkirMk5aQklM6Yg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795130906;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1GzTQLbcvr2B8pZzy6gTMzT58ROAMc3lyTn0CSd+rPM=;
	b=l80IHOGYpcSCMdUsOhVaarHfhyWg8AL9JPz7yYMAKEXVrwFFz/CBdMH7sVitun6PpjG0
	 vTmgVASxoMBDvZzWihHRNNHBuKz6soptFjwQX2Kvlbelm6hbjMDCEjtpML4or0STx2IGG
	 yTDl55dTUJ8HeuzqcEAYp2hkSrB+Sr9TrD1vvyMWvaNoYGwaFOiNW8PAHy6Sihf1cBF2l
	 IEo+PEHSdrlDUVHg5Cn0GbkGqz4/7ASZONc3g7pyVMROUtnwju568dW3na2TB0U4bSov/
	 FRxs7sc0TYnyLmen5j2zA2DRnoMsXr8+LyTPOiGxSu+y6fsENo8+jWdWJbGMuJByV/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HZ9fYWs6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DA7606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 23:28:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28DA7606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HZ9fYWs6
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c50933bdf4bso57883266b.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:28:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795130904; cv=none;
        d=google.com; s=arc-20260327;
        b=g6oCVChsrm5fArUVD64spuLsz1ryyh+vLKhGo/ogzJpZ++5b1FDe1Y3l3KD/6rkOE4
         Ntb5j+/sZDrpiX3a71/p7wlwOm7tPeRSxxvygYNiktteh+ixsr4DkY/0ssQUXpUokajG
         99zHWbIpEearoLjOzwFzuglIZXpJiLfYTrSkk2ffC6LSF2n9ti4XtSkHp8lildWzx9+Z
         mdSFJG5WPzg8qL3zibmhDo9mE98aVC+e1Uim9cC0TCLQzQWY835LZzlScBqid/EG4fiB
         jViotPqafYH8tmFB5kv7cTvD+BH6q8PZkhhMlzeCEqRIvTRq1tfSWK0oITnNpo4wIeq7
         aCFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1GzTQLbcvr2B8pZzy6gTMzT58ROAMc3lyTn0CSd+rPM=;
        fh=Hpo6Vg8ZCo3FR8+6Wo/HRGsqG2tsBc+Em49OPeF2FFE=;
        b=Rbu8+GbLUvhHQDA2njGThudXsJd7Fk+6G0A3AeYf0W0zTbZO8pU1iJfyrwjaKD2j7L
         BurckDV1vw5mQZxSxLWt5okQZoIQ4urNaLxmBTCSj+hoJoZwq5q9fyQCa4B4XtI0BCfh
         ZHJRUd4+6EbOvL79ZJsYqts0Pbc2zykAQ8fem8ZJQep3W7Ws6Wf61UFIY7o/Nkne8n8r
         vgImFoUIH09EdCCt7bMszFxE9WqwWsd6alg2YDErKoeYsF0alfppUFFQYPgM371rEBtI
         Asd7hUOLAxyKKvHjFmh+2eOiaPYK85OsNGVADxLQ1z74HO0zFrbeRLuo/9zEPpi+z8vJ
         N2AA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795130904; x=1795735704; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1GzTQLbcvr2B8pZzy6gTMzT58ROAMc3lyTn0CSd+rPM=;
        b=HZ9fYWs6fuQKkGmoy1vOuHrq+uSSKtOD/oNCLT+FvtoWs5Gus5fh1/vlaTUQMnW5/O
         /LbSPg+1176VqDi1O70BQUv2sXtx4BvDUCxVxwShsFfbOvv2aDRBGX4BNbH0Xeg5gbO3
         PArm5qs+A8JEoy1ELpFUmoSaegyuCuDuKg8hFX7XXG8ub8JZ/1Evj3/EswCwmY8YwVQv
         vYjABkWYJGVDn9dfNs+qoN9MgXR6tfqXLg44A7hWzyfHK8Mxh1oxFy40qgGGI04qfXW3
         twjqoVmlKe2JeafZ/dPMVEFgmUbUuwym39N2SR+eDR2vpdK5rpWjRvLoAI9FPYbmWWUz
         MOhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795130904; x=1795735704;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1GzTQLbcvr2B8pZzy6gTMzT58ROAMc3lyTn0CSd+rPM=;
        b=KVS0e3Rj5IyOkHP7p+JPm3P271hmPThPbfn27uaYOT4p5t7/jK27WacLbh58eyIyNa
         ITIAJDqMeCeeTTaMo/tnEnkrPKC0083yU32Z39g9WalAUoantpuORFCkRXUEtNENJUQQ
         zr9LxdwvadJqFgLc+RJ8NQl86N3fXxLHo5AwNbk25Xlk5KKwrj5KalMJlx/IYZJALd6A
         UUryic6ryMo3FbkyxLReIdRSypNTlTFz46qlolvvUgogAKpu6dc+qtoFdh1B5KvaQDpR
         cx5WMVLGWptbbfTnxqGhPoPLq17UnoUTxjoWAYgsBgysSx8wsJNeO1ZONUuKm18KZ5xS
         /iZw==
X-Forwarded-Encrypted: i=1; AL+hErF6VkpmI39MXXvtNuWn/k1cUMefuKvjXs1rq8VAw/1DvoLvdvkU+I+F3QlVN6WpamQXhRt++i7mui5D1jg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RUJOoIQ4NB3ft9o1xK7ndNXZJkTaHHYBkCPs6TN8zSp//S5nH
	fhCM2TvLi7CxQOZ4qbi0lAA9M346yk7q5OsakbD15oWtb8eGcTvBo7y4NS27VC5vOjNuq47pIIC
	CTlPzFSR262b9E4R6JsosP+9nUowX3ik9tti+ejWF
X-Gm-Gg: AYBFou3741II1YeFIZ4aBtJLacg3TzNkg2mxgd2dIpVSiIpFK+Fc0V9rRyrYVRkqgaW
	zIl7XqnhIbY8EQtVDSZUyMea8vg8VeZGdU/Xa75zEvKiav+MQ+hvkhU9nQjekQ7JxFzOkq9ZGgk
	gDcz02mqw9380vizWbsOZDGqXhUg/pW7QJniUgZeKOGRBJDXIigaF3l+RNpPfFLomUHFBm6S8Lx
	Nj64AO2jUV7n0p2JpyFi09bgz1pE/cun+YzYVoyJZA8zYBLoFvl2AZtQxS2UA7KmzjAPkwyquyY
	N8/BkUl1iBGTWbEonYydFmGqPOHW7nsKoFY38PRLwS7xN0+SNITvLeJUVb1lvBqF35+b1lOlcC3
	p/iIj5+c4Npr3FUfn8K9SJsbg4IV6RneXr3Fzpbxx38ho6wDdSf/YAldsbUEhnC3uUS+Ef/npll
	UJaRdUmlQ82+n/VLhekBXRTBVJniYZJ87N2q9JxyAYGIB2
X-Received: by 2002:a17:907:9408:b0:c4c:9abd:7373 with SMTP id
 a640c23a62f3a-c5131a91cc7mr291756266b.33.1795130903971; Thu, 19 Nov 2026
 15:28:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118230044.683221-1-nilayvaish@google.com>
 <1CB074CC-E9E3-436D-8D04-8C203C825E82@nvidia.com> <72E0E689-0FA4-4DB9-B978-711EF6DEC490@nvidia.com>
In-Reply-To: <72E0E689-0FA4-4DB9-B978-711EF6DEC490@nvidia.com>
From: Nilay Vaish <nilayvaish@google.com>
Date: Thu, 19 Nov 2026 15:27:47 -0800
X-Gm-Features: AclHuK8xjVL7ZpvdmZpixIraolc1ihaB4NwpDYE2FF0Mc1K3pFOQ9Hepjtwwk2I
Message-ID: <CAJm2bjqm_uK=vPbY5hi8CEuHUJmidUYzRn=Y6TAnuhhRjLt9NA@mail.gmail.com>
Subject: Re: [PATCH] lib/test_hmm: fix alloc tag leak when splitting
 device-private folios
To: Zi Yan <ziy@nvidia.com>, Zenghui Yu <zenghui.yu@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, Balbir Singh <balbirs@nvidia.com>, 
	David Hildenbrand <david@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, 
	Alistair Popple <apopple@nvidia.com>, Suren Baghdasaryan <surenb@google.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Zi Yan, thanks for the review.  I'm about to send a v2 that only
replaces the pfn_to_page(page_to_pfn())
round trips with plain struct page arithmetic, as you suggested

Zenghui Yu: Thanks for testing the patch!  v2 has no functional
changes.  If you get a chance to run it, would you mind
replying with a Tested-by tag?

Thanks,
Nilay

On Thu, Nov 19, 2026 at 7:38=E2=80=AFAM Zi Yan <ziy@nvidia.com> wrote:
>
> On 18 Nov 2026, at 18:24, Zi Yan wrote:
>
> > On 18 Nov 2026, at 18:00, Nilay Vaish wrote:
> >
> >> For device-private memory, test_hmm backs each fake device folio with
> >> real system RAM of the same order, allocated with folio_alloc() in
> >> dmirror_devmem_alloc_page().
> >>
> >> When the core MM splits a large device-private folio, the driver's
> >> ->folio_split() callback, dmirror_devmem_folio_split(), has to split
> >> the backing memory as well. It does that by hand: clear_compound_head(=
)
> >> on the tail pages, folio_reset_order() on the head page, and
> >> folio_set_count() on each of them. dmirror_devmem_free() then frees
> >> every backing page as an order-0 page.
> >>
> >> This open-coded split does not split the allocator's metadata. The
> >> allocation tag and the page_owner record still describe one high-order
> >> allocation, and PG_head stays set on the head page. When the pages are
> >> freed one by one, the tag is debited for only one page when the head i=
s
> >> freed, and the tail pages carry no tag at all. With
> >> CONFIG_MEM_ALLOC_PROFILING, running the HMM selftests and unloading th=
e
> >> module reports the leak:
> >>
> >>   lib/test_hmm.c:808 module test_hmm func:dmirror_devmem_alloc_page ha=
s 16744448 allocated at module unload
> >>
> >> and with CONFIG_MEM_ALLOC_PROFILING_DEBUG freeing a tail page triggers=
:
> >>
> >>   alloc_tag was not set
> >>   WARNING: ./include/linux/alloc_tag.h:164 at ___free_pages+0x2a0/0x2d=
0
> >>
> >> The backing memory is a private buffer of the test driver and nothing
> >> requires it to be a folio. Allocate it with alloc_pages() instead and
> >> split it right away with split_page(), which splits the allocation tag=
,
> >> page_owner and memcg state and is already exported to modules. It is
> >> still allocated as one high-order block rather than as individual
> >> order-0 pages because the driver finds the backing page of the Nth pag=
e
> >> of a device folio by offsetting from the first backing page, so the
> >> backing pages have to be physically contiguous. Every backing page is
> >> then an independent order-0 page for its whole lifetime, so
> >> dmirror_devmem_folio_split() only has to point the new device folio at
> >> its backing page, and dmirror_devmem_free() frees the backing pages on=
e
> >> at a time.
> >>
> >> As the backing pages no longer form a folio, take the order from the
> >> device folio rather than from the backing page, and index and copy the
> >> backing pages individually instead of using folio_page() and
> >> folio_copy().
> >>
> >> With this patch the device-private HMM selftests pass and the module
> >> unloads without the messages above.
> >>
> >> Fixes: 56ef39899643 ("mm/memremap: add driver callback support for fol=
io splitting")
> >> Reported-by: Zenghui Yu <zenghui.yu@linux.dev>
> >> Closes: https://lore.kernel.org/linux-mm/be9a8bae-9223-4966-bba9-2cbe3=
9c8f4de@linux.dev/
> >> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> >> Link: https://lore.kernel.org/linux-mm/8ef6e92d-4cb3-444e-857e-fdbf88c=
035ea@kernel.org/
> >> Signed-off-by: Nilay Vaish <nilayvaish@google.com>
> >> ---
> >>  lib/test_hmm.c | 41 +++++++++++++++++------------------------
> >>  1 file changed, 17 insertions(+), 24 deletions(-)
> >
> >
> >>
> >> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> >> index b409c42bfe6f..371ead009f8a 100644
> >> --- a/lib/test_hmm.c
> >> +++ b/lib/test_hmm.c
> >> @@ -201,6 +201,7 @@ static void dmirror_device_evict_chunk(struct dmir=
ror_chunk *chunk)
> >>      migrate_device_range(src_pfns, start_pfn, npages);
> >>      for (i =3D 0; i < npages; i++) {
> >>              struct page *dpage, *spage;
> >> +            unsigned int j;
> >>
> >>              spage =3D migrate_pfn_to_page(src_pfns[i]);
> >>              if (!spage || !(src_pfns[i] & MIGRATE_PFN_MIGRATE))
> >> @@ -227,7 +228,9 @@ static void dmirror_device_evict_chunk(struct dmir=
ror_chunk *chunk)
> >>                      dst_pfns[i] |=3D MIGRATE_PFN_WRITE;
> >>              if (order)
> >>                      dst_pfns[i] |=3D MIGRATE_PFN_COMPOUND;
> >> -            folio_copy(page_folio(dpage), page_folio(spage));
> >> +            for (j =3D 0; j < (1U << order); j++)
> >> +                    copy_highpage(pfn_to_page(page_to_pfn(dpage) + j)=
,
> >> +                                  pfn_to_page(page_to_pfn(spage) + j)=
);
> >
> > struct page should be contiguous if their PFNs are contiguous.
> > There is no need to do this conversion, right?
> >
> > In addition, dpage, based on the comment before BACKING_PAGE,
> > is device memory, so it should also be allocated using alloc_pages()
> > like rpage. Am I getting it wrong?
>
> I misread the comment, dpage is destination page. It can be ZONE_DEVICE
> page or system memory depending on functions.
>
>
> Best Regards,
> Yan, Zi
