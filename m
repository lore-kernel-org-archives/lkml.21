Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795541172;
	b=aiCC5OEgpVPPcodeg64lhSfw1LzEE/XhEVN2wUFIMWr2IHO1Y/1sR8QAzBYR2USMXhb+
	 dmeoTdiDmcy4jAe9I8EPkSw3LNXa44pYqIYvkw6RLmLbZ5utfNEzSWhMTY1jsclZOs9vF
	 TzVpC6qqCy+Bg4JniwtOAmH1C0JEO67/pYL5QEG8wS4E7vzhXQYkuK7+THX5edmVAo9K4
	 qPb29O/dXlC9UZRpe2N1xfFdOaOqKvIEfywB1wcMG+QpjcE9OGGfxQStNA2axbTEn6CVC
	 EeXBrfdHn679lucvfCFsSjT0+YXMGJiozaKVga2BHbNugLW5S0Lj7ZmqMwOdCVVERBw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541172;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cRMT7+DNC3zJ3ZAIBaunCOcEFiu2z3/L8DzLcGanCPY=;
	b=NTvSjQGylRTtoII0VykJ8xkGjGnRqqvLO1QRPgs0maJlfzoUn3glkSirlesX0XrafKDd
	 LWUoROX9llyvHyxf8z2pv2f0y8OaAk7hVUfSi7OjYHd5fQO75ABlgxp3Wc24douRLM7zd
	 C5cR+aMC5TWkfp/5HH1By094du90+oMDnS4URQ8hQ8ZtHsX4BStDaZPP7KdEIiosGQt+x
	 yF3yTRTK4qehdY9EsCBtlTK04sjUCqnfCMPnTOZy4ogZ5Vu+RyTNKUnKrvuY25FvympiG
	 mVHISpzsuYJW+1pnXF7pV8F+MwKu6rXBrEjIGm7zMC7uEzd76uZPSqvSDv0uqoF5/FQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ViPZ79em;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83A6606A323
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:26:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C83A6606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ViPZ79em
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so792159166b.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:26:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795541170; cv=none;
        d=google.com; s=arc-20260327;
        b=bCtY8hCd+YuPcP3tvO7Ssn+jLabjJAAWWPDm5ASQz6sD/dtgs26Q0vmRURZ7mub4e9
         JKZG0HV16H4Q1K0E+TtSi9wfNT5goHxwWUx1qBHusgXebvDYzniPipYZumK8pG5DA4PB
         yUe0r1myAotiTYEMvNJHPBxGjxlKPh8hsp9sDFKNWTN9LV7j7rM3KSXnPFNqblGVHakt
         K54B31zrL/rbbYxsX9/TQpvl1kUW88RQGvJoG48izg7AoydlhkS5DuTldjlj7lpJpVf+
         895481h24e3lWHa47EaW+iwDzjWi6h7bvLnb7VHYxLdzxSKUmfQ3w8Ja+Sr+biqP15yM
         fnFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cRMT7+DNC3zJ3ZAIBaunCOcEFiu2z3/L8DzLcGanCPY=;
        fh=I4SZ4kONLxFVRB7zKWrfV26ESjMjK8Geq4dXYzX1pjA=;
        b=C8xYFO2VhX68kH3Y6NUEEaa93h9v73ZE7Hrl7bEIapCrmT8q1HVpW1uIkAQYDeI/nk
         BUT9ugnDiDVp/GJl6B2Z8h5uIo+QTkpUkG2E4rH9ae8OAx1GUee7NfPrlSHb3BPobcmw
         nFyMmwimcsXczd5DrFQLfI1tFlFpfXtY8cuJepdcDxp6EkB4XXyMKCwReo/SvT1zLifL
         G0a1xKr3yl1WewbQRJIiaKZ+inGFFeZVOlB2yH4iK8g0asHEuI/bdfyb1HVmzA7zZveo
         U0NEYCcfaxZUVXGXQSy3eM813vgvtt6Oimc02anzwiEUqYZpVlHzdQtNsOAzsjTFWBTW
         oyYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795541170; x=1796145970; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cRMT7+DNC3zJ3ZAIBaunCOcEFiu2z3/L8DzLcGanCPY=;
        b=ViPZ79emNqU2vwsr3A0z6lhGLXeR3inkbaMwE2EAL44obsrb5dKHcdHNunHgmhyW4+
         uu8rAaeOMbxcaZEr4PpISk49Qm7P6PV1hM4o3SPdYGOmRm0VUERN+aluMpRTG/JrKsiZ
         J1UhHoI+Wkwi1G2mqbA4z3O0nnKIJT5Kicq9RhRNmFE14LRb8t7pmw0zjO4MDrq09ZWB
         ZjPhTDH9Iw34EcDsAA4vsd0+E37Xs/Me1Ll1eX8WVPkb+sxRP70j3DvxQWb6bi7VlZGz
         biaFv0PqW2oeT9+DV5/iR3MIEcYEQKs9vE78iYwZE1HOMfadclkOnFIlZo66+F0cCOnR
         UO2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541170; x=1796145970;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cRMT7+DNC3zJ3ZAIBaunCOcEFiu2z3/L8DzLcGanCPY=;
        b=S+Ri341k/JNKIHAuMmgazXx7qYyw0TsH6bdTDm3Uk+sw01JRfVYtmWS/Wa5D1tEeOc
         vWOsHVJCx02IQfvxs0PWCoMunhJ48LwWQEvec+d40FrBS9tJTScnvUOwS0LTvgDA42F3
         rrInPYlh3u9FieEH/bSfjfSm6iuQ6Mh0AfNVN+L4+BMoeW0fkRRjqoSYHG0EF0xAuHkR
         OQBhSCENmmS3j4cGQkYiWYyb1dfF9OTVwihgsTPVUWXEf8n7H72m3F8yhdOeAdhnlb2e
         HR285x7AaHr2/Z7eaATT5t2E8htr7QcKtBweXv919hGLivzwuWjnDZm2y1TPm65C+qbD
         IUNQ==
X-Forwarded-Encrypted: i=1; AL+hErGufqR7csmNel29wMDHD/bo48STsUN5wzb6RunuGHnrcTTdcyob3NoNh2EScKtnqWDBRPkqJniK7ctGzX8=@vger.kernel.org
X-Gm-Message-State: APuU4Z96ZI8jv244HwvFrRrVR5IY6qJ9v5j+v4YDqp/BejyTDTOhcTGB
	YdlevdbC5oo95VE0ccJk2b2WL5xv4C9svgm9jF16tW0olnI+SolS810BscKvh5dO7rDBnT/tFh9
	R7MCfEUnm7KCNCzkg3/b8EKX/TVrDKrBeUXKyvo2r
X-Gm-Gg: AZFdTZfsZKnd4lFBpZvPBgBYasScbaBvTmivt54YbMGJhhSUXJBAzEpBaZGjZtiOacM
	GSEHWxYmYCbIQARkpWxnTxP/S5BzSIksgQ76Co+9U3imqWSIe+g7wpKAx8GjWLU5eaekbXCb0eK
	aD56H9YkJS7+J0xCg6DoYOrEzncsRbqIM+O9pX7Arxyqq86A5D3GVSi7IpLj9uPSMqYmmo4gNgJ
	QeOMJDZl9SF9eC4OUy7WMGp4/JO05w3zwD+fwKX5yGJ/Dhu3oXPRBnCv1Yk8xvl1GgGhLlYw2nn
	8HRYbN5joWKMTAganOg1BCYtSoIty0KWt5syKTlghPCYNnXJ7DeC+Ei1LjyIwHdl1S14Oc5xkza
	zOxSsqxcqf/oYEw/5DEjk00rPCFscKW4f1nd96WfxZsBvYw/DRMQfq+wvxw/NuHx1Uyis+T/Pox
	QzCTstu+TJxJh0s9eoXRcquR3yW7sMivB1oZW+04HfrqVeaEiuynY=
X-Received: by 2002:a17:906:7d6:b0:c29:63f2:99bb with SMTP id
 a640c23a62f3a-c513aafb466mr1015135366b.47.1795541169501; Tue, 24 Nov 2026
 09:26:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122184453.2668189-1-jthoughton@google.com>
 <20261122184453.2668189-12-jthoughton@google.com> <ED44F18E-E7FF-4B53-9B5B-3201F1100154@linux.dev>
In-Reply-To: <ED44F18E-E7FF-4B53-9B5B-3201F1100154@linux.dev>
From: James Houghton <jthoughton@google.com>
Date: Tue, 24 Nov 2026 12:25:31 -0500
X-Gm-Features: Aa3M54rJ_84SrZFS6bq7z7BArP-3coKMEdNs8lreDoBfSY-QuNyAX93ofCaakaQ
Message-ID: <CADrL8HUGN9xX6mdFOCxrgD=v6-AUSxX0_5c5fuW705SFm6Sv7A@mail.gmail.com>
Subject: Re: [PATCH v3 11/19] arm64/mm: Align vmemmap to maximal folio size
To: Muchun Song <muchun.song@linux.dev>
Cc: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Oscar Salvador <osalvador@suse.de>, Andrew Morton <akpm@linux-foundation.org>, 
	Kefeng Wang <wangkefeng.wang@huawei.com>, Nikos Nikoleris <nikos.nikoleris@arm.com>, 
	Linu Cherian <linu.cherian@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	David Hildenbrand <david@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Nanyong Sun <sunnanyong@huawei.com>, Yu Zhao <yuzhao@google.com>, 
	Frank van der Linden <fvdl@google.com>, David Rientjes <rientjes@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 10:22=E2=80=AFPM Muchun Song <muchun.song@linux.dev=
> wrote:
> > #include <asm/boot.h>
> > @@ -92,11 +93,22 @@ phys_addr_t __ro_after_init arm64_dma_phys_limit;
> >  * in the virtual address space.
> >  */
> > #if ARM64_MEMSTART_SHIFT < SECTION_SIZE_BITS
> > -#define ARM64_MEMSTART_ALIGN (1UL << SECTION_SIZE_BITS)
> > +#define ARM64_MEMSTART_BASE_ALIGN    (1UL << SECTION_SIZE_BITS)
> > #else
> > -#define ARM64_MEMSTART_ALIGN (1UL << ARM64_MEMSTART_SHIFT)
> > +#define ARM64_MEMSTART_BASE_ALIGN    (1UL << ARM64_MEMSTART_SHIFT)
> > #endif
> >
> > +/*
> > + * With CONFIG_VMEMMAP_OPTIMIZATION, compound_head() masks the address=
 of a
> > + * tail page to find its head, so the head struct page of every folio =
must be
> > + * naturally aligned to the folio's vmemmap size. The vmemmap is offse=
t by
> > + * memstart_addr, so memstart_addr must be aligned to the largest foli=
o size.
> > + */
> > +#define ARM64_VMEMMAP_OPT_ALIGN                                       =
       \
> > +     PFN_PHYS(MAX_FOLIO_VMEMMAP_ALIGN / sizeof(struct page))
> > +#define ARM64_MEMSTART_ALIGN                                         \
> > +     max_t(phys_addr_t, ARM64_MEMSTART_BASE_ALIGN, ARM64_VMEMMAP_OPT_A=
LIGN)
> > +
> > static void __init arch_reserve_crashkernel(void)
> > {
> >       unsigned long long crash_base, crash_size, cma_size =3D 0;
> > @@ -218,6 +230,8 @@ void __init arm64_memblock_init(void)
> >       /*
> >        * Select a suitable value for the base of physical memory.
> >        */
> > +     BUILD_BUG_ON(MAX_FOLIO_VMEMMAP_ALIGN &&
> > +                  !IS_ALIGNED(VMEMMAP_START, MAX_FOLIO_VMEMMAP_ALIGN))=
;
>
> We already have a sanity check in spares_init(). Doesn't it work? If we r=
eally
> need a check here, I think we should use compound_info_has_mask() for the=
 guard
> instead of MAX_FOLIO_VMEMMAP_ALIGN.

The check in sparse_init() is only a VM_WARN_ON_ONCE(), which only
fires if CONFIG_DEBUG_VM=3Dy. And hitting it doesn't prevent folios from
being vmemmap-optimized.

So I think we might as well have a BUILD_BUG_ON here, in case the
vmemmap base address changes in the future for some reason, for any
config.

I've switched MAX_FOLIO_VMEMMAP_ALIGN to compound_info_has_mask() in v4, th=
anks!
