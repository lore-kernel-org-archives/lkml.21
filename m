Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795539547;
	b=2szNjPPMu0dVjyaaaS7jR3pBKB5nVe7sMTXDyd6jP3i546CgaRxrZrhMHbz9MvSDdh/U
	 gWfi7H0bgFze4WQMtwOGoKFVxX8900//Ske3T+13+bOe5OpEfG2dm9Vn3D6Ux7hODZ00S
	 rMkTjBSMjAkwhbUIXRsKlTghVV7zMs3u6vuvonu9Hfh85yixlnWW6FsEWgWCvygBqBjgv
	 Jzi/mIDTb6FdUt7xBj86i4fmKro+pufVOM5kSoLt1i/LZl5cYnuYMdBV13Ciqk3m6AMtX
	 /OSJ8tvjOP06TWoNydcQZ16Ijx2t5xokgHFd/sZm9JUBqwIhDSllG9wvCUDrxwjKJXg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539547;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Czsesa5ZeOVdF9UZnZPtwINhyqTnZrrNDtc5MtD/hAc=;
	b=O30eqG4ELttqBFJYGfAOKaaP0xGuexlVWez/mjmBNBLGJs5XFUAIwOwbFpXfdK5D/JNr
	 ZF0Ve4jFf8kmjujPd3Rkc2RSi3cqiyZUeuWdqd5nUxiZcqqSEdNYW1GdQ+5MJ0J1e0F3b
	 jVHCmL1gHn3bpsjTG+rK8E8gfWmDJn35rjki1e8Vbnz8yHUXDfj07AIxtvRuMwdgCvCqx
	 vBGYaGx20s5L2kTrrZOWWWgHg4ihEiv+zmC3yoh/yk+1nOg+EVrImpbi5KdxcKYHAcpTj
	 +iP0OgFAZEQsUjcjHTXCPEpDFIm/a6Iju22fPMTVW9Oyf8Qa2lilFQ/1ZjIPpyrBfPg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=f2cJcoZF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4E1606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:59:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F4E1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=f2cJcoZF
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso791864266b.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:59:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795539546; cv=none;
        d=google.com; s=arc-20260327;
        b=hu9s1Hj4Q1wa1V2kdScEdDu/Lg2x3RLj4vz0Y+Pc/PcP8B9YbEOrDh84oDuDfcOWT5
         +UpOh48KwVfEBZQAU0iFAr4+xMw0xMP5x2XyshF5j1LJkZCLvDohupkkU6wn3ftfipw+
         36uPKK9eguDRBgrFfOmNiLMVdajE9xa6lrWB5+qR2FFlMuTTyL/frGYOgAQDifZQ1dQd
         SYcR7OhMjNw6tgk+o8g9sbJfiN2V2SD7UcXQtAsnjVlrCIr2h7d2QPxF7kjHYgjSN80H
         51pIDxMPx2XAVDvUz/n8JTXAIXPfjnz4ICzpB1uUIzrwuR6GmGHrVAYHa5nRDfF0h/Bw
         4Zyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Czsesa5ZeOVdF9UZnZPtwINhyqTnZrrNDtc5MtD/hAc=;
        fh=GSeTldCEGt9AtQtI6Uou6IQqSlmChHg6iaHyvHVKvBM=;
        b=UnwUPCCOlzG4UItRS5yenymafnX+iln6tDHz+qsxCfgj/QJjWlwdqkb+Fpsnzru6fI
         oc6Dli1W8NN0+5HFLtDd+p5vyo4lnrh2SDJ6ppRMk1v4FZWzplMOuLMOzt+3PgGiYxFQ
         0h41S56IrYEHC1zrsp/znP4pcexhgJOQ0iOkCNFvIhMRpi6KsY23a9Zj/2rNZu+Hb0qj
         Mj4nvEmgadAadI18EC1rZTDze6w/LS01ZjKSeNEJM6cQdsGahUtYwaguyLpd/CQ4gOXx
         P8xJlalJToTJrmt3LWEbhIzl4iE4b5SBvLZRg1hjl6RV84xYm7UQxoL7vcelwW2qA6Pv
         wLlA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795539546; x=1796144346; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Czsesa5ZeOVdF9UZnZPtwINhyqTnZrrNDtc5MtD/hAc=;
        b=f2cJcoZFaTYXyuQbfupJz7K0I0T0DL5CYcKtzxyyOBVkcZn1p8f2AriT30H79KBrRO
         1SPwSspJeAgiB+E5yveuVl/ZzcHNfqBI/H9yUYjbs5Lq7q/i9G+s0db+2XeNbXXKViMf
         TsUgk6YhOTgYZyDzROHJTmim7GLct6/YkaRgl9KkeLrIOhqsueaDcRM89GnHytWl0Uy0
         iQdHA/uxgJxNOHfNOgC+NG9qy6MrGkCfKdn7YBPP+KQSBHTfyg3g0o7WYUyvPJnMQbQu
         B9B0o7poDitJ+5MxTOH0iIywKuHu6gyXYONtpqBh/fj9cy4jVgw8IA7dS2Lx8XGeU82d
         Msew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795539546; x=1796144346;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Czsesa5ZeOVdF9UZnZPtwINhyqTnZrrNDtc5MtD/hAc=;
        b=trsS1vWU2lHYHS4rkSQkdBafcRnHc16e0l4KSh9UQT0DI0iXqDUHJvdFXNZekaPy0L
         +qj3Q6bqIOj5WXe7MVcwikU3xNJa/NC2qQ176Le/Xwc+hgDW9GJOeotR+ZgGfdL+eQ88
         LRnNkSVoM2IXdW6DNKghxjoSNfzup563ThoBwkvLhmbJ/2Dbds1cZkaDHZY8LW9dZ5/5
         vxTOya2hSuUxOVnGdiArsPRk+EyIaD1oh084pcVbZMMAF/Jf1qPy3GlGvf/CxUnoKNQz
         wMfwv1MASRBp7bsHqzItl+FHy3kwydZP04BDMLzeSVmoiTIilpv160gvZYC8/RPeC2We
         TAXA==
X-Forwarded-Encrypted: i=1; AL+hErE5RAiU5YbUiEQyQp4faHK6GQjfFXHKUUpKPn74QQfsYnisqOGfPziR9OjRsKt4UdmWwyoH7v2FGXiMCKw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9aeWCT2KeI1AMaVRXjrIOp6WrKn5pc2OvzKYtzwWIqxWtHsgcW
	r8gZ+/YiVngL5iVqwp5+/b/ZyCWmjkAwrkfeB+5Ln0b4UQv6xFqurUz4m1i5sSyg9qP51XQ28YX
	/EIj1DN0XWSuwNym4ibYXx1n7Z0v9M8kOVjDyDg99
X-Gm-Gg: AZFdTZeVGe4bikvWc4MNQ1biPUtU3wDMD4wJzd6gCeOJYMoLBH1cec+i2Y0SEYYnlBJ
	ZpW9jcgkTQ1ZBtkbk1fcu2wloHnQV3QHWGKXGb7TwXN146nUTEQcNYwxZbjw4msJ+ZhGy8ex4nG
	HMZLd+Pn8i8NNCGO2oTIVgGMMLVNoTyk46Fb3sraz29S76VNoXnMzW153pNePRXJzluki5o0Auv
	VwL9CuvFlMSLHnW0vc/n/hxIL7iObBeKYi9GAC3zHu/nbuTElA8M/nUhsdDWplSC7JrZQrxu3vL
	eYdgzuf5N+Ipl2PMpHunoOGzQJN4qd13hJBfy1NHtfsb3MUDzCHrs6hNtl+CnmgilY/LkiIpHEM
	9JxTFd1b/I4FMITsQjAp7e3pOX6IFPZZmV6feDEERqnQapTY0l4utBCRqcR6YtZNlMUkl8fE7iG
	0n5tGl/oC5NDp8ie4Mala4+gj8O+8V9FWi9z9ZzoEKWuF1zPCaymUm
X-Received: by 2002:a17:907:9d1a:b0:c51:3b58:b99b with SMTP id
 a640c23a62f3a-c513b58bc59mr1253328666b.19.1795539545161; Tue, 24 Nov 2026
 08:59:05 -0800 (PST)
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
 <20261122184453.2668189-7-jthoughton@google.com> <CF94E7D7-87D2-4523-9343-512EE00094FA@linux.dev>
In-Reply-To: <CF94E7D7-87D2-4523-9343-512EE00094FA@linux.dev>
From: James Houghton <jthoughton@google.com>
Date: Tue, 24 Nov 2026 11:58:27 -0500
X-Gm-Features: Aa3M54ohYXliwBIhyvf_be5zFFZBRmz0PsOJzrNeOCUHJCfDe6sQjb1ES_TJZKg
Message-ID: <CADrL8HW8+eFt5f1VBQ0zt-ioiU3X150W4ROaKf2Nzw4j9+0i_Q@mail.gmail.com>
Subject: Re: [PATCH v3 06/19] hugetlb: Optimize bootmem folios that were not pre-HVOed
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

On Sun, Nov 22, 2026 at 10:11=E2=80=AFPM Muchun Song <muchun.song@linux.dev=
> wrote:
>
>
>
> > On Nov 23, 2026, at 02:44, James Houghton <jthoughton@google.com> wrote=
:
> >
> > Boot-time gigantic folios are expected to be pre-HVOed through the
> > section-based vmemmap optimization, so the bulk optimization pass for
> > bootmem folios was dropped.
> >
> > However, arch_support_vmemmap_remap() may not yet
> > return true when bootmem folios are allocated (e.g. on arm64, where
> > support depends on a system-wide CPU capability), while it does return
> > true by the time the bootmem folios are gathered. Such architectures
> > disable the section-based vmemmap optimization in their vmemmap
> > population path (see section_vmemmap_optimization_disable()), so the
> > folios are not pre-HVOed and would never be optimized.
>
> Yeah, when I removed support for this part of the code, I figured you
> might add a new patch in the future to add support back. It is fine.
>
> >
> > Optimize such folios when gathering bootmem folios. Their tail struct
> > pages have all been initialized by memmap_init_compound_page(),
> > as they were not pre-HVOed. Pre-HVOed folios are skipped by
> > vmemmap_should_optimize_folio().
> >
> > Signed-off-by: James Houghton <jthoughton@google.com>
> > ---
> > mm/hugetlb.c | 11 +++++++++++
> > 1 file changed, 11 insertions(+)
> >
> > diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> > index 72839e98f998..8756c0206922 100644
> > --- a/mm/hugetlb.c
> > +++ b/mm/hugetlb.c
> > @@ -3325,6 +3325,17 @@ static void __init prep_and_add_bootmem_folios(s=
truct hstate *h,
> >       unsigned long flags;
> >       struct folio *folio, *tmp_f;
> >
> > +     /*
> > +      * Bootmem folios are normally pre-HVOed through the section-base=
d
> > +      * vmemmap optimization. However, an architecture that can only
> > +      * determine whether it supports HVO after bootmem allocation dis=
ables
> > +      * the section-based optimization (see
> > +      * section_vmemmap_optimization_disable()), in which case the fol=
ios
> > +      * were not pre-HVOed and must be optimized now. Pre-HVOed folios=
 are
> > +      * skipped.
> > +      */
>
> I'd like to condense these comments to something like:
>
> /*
>  * Some architectures do not support section-based vmemmap optimization,
>  * so their bootmem folios should be optimized here with folio-based
>  * optimization.
>  */

Applied in v4, thanks!

Also just so you don't miss it, would appreciate your thoughts on my
reply to Sashiko's comments on this patch[1]. Let me know if you would
like me to do something different.

[1] https://lore.kernel.org/linux-mm/20261124165516.1182390-1-jthoughton@go=
ogle.com/
