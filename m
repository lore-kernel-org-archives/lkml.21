Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795216126;
	b=cumyGZQefUafxL4fmWs2JN+WpUrXiWxPeEEMbcW3hFlwwYRmeLdlOTBazmynz7F1fua3
	 c2476x4UGM96MITUzm7b/hWTNrNxLnwLCQ9i65zAmm+P5SUsCWTZdDCEYoeH0nnySJ6us
	 NciCwGwuVphBj7Tazho6Jp164AWHFfU434uhq98m44l4WYQF9Ylf03a0cyKPXiTbtLIhM
	 8o0ZrfKnESwE1zTsYzu2UUYrL7NSyD+X8Kdh1l5zUZljE8OJewj3DJwn3xDoyNmfG8qVo
	 opovH1KrQrQnfq+E2hAj80TBl0s8+FB+5GK7DHPKsuAsVlnvhtLwPTpL5e4UdBTCvOw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795216126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9LNi0DReitfHRwsgEnJHCKqDlOJr9t9ANMesp8Kcr5k=;
	b=Pzz3eK9i0omHgYb3Kw3DB8RSPSxKjiVFoF9Z/89xVum4krQlk1RPpj9VjG5l2vTokjm5
	 glRD2Ly/sEguwJ4ZOOP8YqzET37tDlwcbl3FIjpRYyAkpDcFnGYSJiyRfeLTn5HOs999x
	 CELsmIOZB/BKag+1GteiJLMKnlQENs7ZTdgpcQITD1mnqiRBPBLX80OzgXRYLAWSnq/iP
	 cvHTMrvHMYgWhauTPoKRqXDhoh2H3FHMvb5wv0ORlhR2jhYPhvmeivwI/YYfaV8AJ76kN
	 woRS/U31hh79l4YWc6+7ackpmCAhEWksZLLB/kCKC92RFtBgdLtcoC4p4g7p2epY6sw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vf8PDmzM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB6B606A694
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 23:08:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FB6B606A694
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vf8PDmzM
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a210470b49so12957605e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:08:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795216125; cv=none;
        d=google.com; s=arc-20260327;
        b=bUqQRxsWJjdMTsA6L+G5qY74oFfnIULb2+OGU9D1VNA0cZP9Dl05OWEabMElX0vGOr
         GVPTDFHdE2Ikp+T5tGcrvr4f68uLPA6PE1g0weZTPY4kwPuT3R5VbK64oe3RDVzoaMMg
         65dX8pzxB0AFDErDLeGg9w2dK39XqMg/O3tPNBXFuvPhpjpRBZX/hQsip+XoeJiNxe+e
         MXcJDd3torjjhRPD2rHgBpj78RgFNtyoWkCUl+4F7XXYwu2teaiD53aMv6LhAWs8/KEO
         KtX/gyMXtlzZOnoGCFVnJLts9jZJM0zxf39jS9cY5FPqougXhycxDCK4My726Wj9kKYH
         56sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9LNi0DReitfHRwsgEnJHCKqDlOJr9t9ANMesp8Kcr5k=;
        fh=AxuT6cVym2B1v/0b9MlErY/FREoqGjNx/HL1aslsdgs=;
        b=sVpgoRkcAwmX3QFn4WCXKzpn9PurRpEo3dauIQDys4ZfJstZS3/cPH9Fw6lAt2ACG4
         3Pp4jZ6PHHkijWmiLk5Qt6eb+oftyesvwOEsZ+bw0e5eSNGayBKy/S91CohgIslew82H
         BIyWrzY9k6XbLNpBHDrdZb10q+wkOxp8Z7GVob/pLFRn1ei9R91Gfn9lLEeEqPOA9ZCz
         ijF6W9SpN2qWpNUDqT3rBedwR9LX9w0cxdw94eNGBmYM83qtaARV35MqXhM5JeKMhsDD
         OF9V6rmyedK90iSo5PSSSh7DzyeMt5q2ajvVr3bIO6wzo8hduYWBFDAq3jMi/ls3sTBl
         AMcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795216125; x=1795820925; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9LNi0DReitfHRwsgEnJHCKqDlOJr9t9ANMesp8Kcr5k=;
        b=Vf8PDmzMDu0k4xnWhO2TNlwrtgqit8MkrARz7ooVrefXRM87uBZXZhWX3ZjZAVVBB0
         wAIlpVYlxqXN+gFTiCdWAE/sKYRJoykiDdgJKYPi2c3WB7yTGlSw+bhpaT+XVKmmokZZ
         jdFhYo6DF4ECifO9JgEComGznLI9jtpeEVUWwnB8YLZD4HQRrq3bIPhGdm4AerV/gj76
         CcTJzHefv8Cg6ITgDOx8caU4/R7q4njdLMWpbDCtKdkHIE5v/hIETvMaBrPzayQxtuDE
         X9nANjAPmc/KHnnG7QIcFTuujU83Hqv++r7LoYVgomdVnYdaIWHsR591isvM8E4zhSsH
         zExA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795216125; x=1795820925;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9LNi0DReitfHRwsgEnJHCKqDlOJr9t9ANMesp8Kcr5k=;
        b=OgCMVDhMfjiwgoqDMWfttQlAWJwKci+aDI7QsjAaYX4hy17dx8RkCPFDqbLnqhicRJ
         qm0QP8eTiHc0t2TjgnipwMh7Rreu6/dcohTK+KuQ2tFRygpa16SHC5wfkbV1M8AH2Fzn
         3D8XfyHQRdXx6YBpuReHdCliUpI073+6PZGnCZuCBIdY7QPZyb+vMLiKEM/DFbbj8KPX
         hKThuyBU14CqYW7PlXLrBbfkpM62NbDVEjuEWOylwwe5NA0gnNnOa9lthEOIlGKvkQGt
         FNCkXRuCPwdSgAujLx/iWHA6kxSAAgEyvzAXHuPoulgXTXYsolBSoBQzPXm1/XYI3Obx
         gcXg==
X-Forwarded-Encrypted: i=1; AL+hErFLg4cuKumLt1LV+98sCaRqnoda9SAKj6ymMxbpi9JBs1IttzLpn54RTBQeYHOQxvYpSayjakZxhg3RUxk=@vger.kernel.org
X-Gm-Message-State: APuU4Z88WOSzSlhazfK2x1mBB+X+ItDlA6LOuDI5xVDrIxZmI4EDAMuf
	DG2X3ATBgxKz9a7FIKU8/KC5kmyFefPayHysbfVOynLqyNnf7GMICTpcmU/neMLb+LqDZuRiDk0
	zK8QYb+kG0zckR3bZQmwDgT47w7Ozn4E=
X-Gm-Gg: AYBFou2hDDsJesbFo+iiVJFrbSV8OQ2sodraFVJ+ZBezV1PUdAI/6PfuDa3h6VdJJgR
	2IdthmamK1YqW5idH1pK350Ub6msoG4WNuEiDcZmznOdZBEo1VG6vbw7FRi6TL5XTac4y6OHAPL
	Cf8y497EHaa0l3FBKc30hLb/+dvGY0AfQuDUIisZoPoUGy/u2WZrB8j6XJJIFhj5s6GQE8R6/JE
	2rM3yfMDQc4uBZoFDexKXT8eUhU3WfNe0GoJWe3UnuvJ5/iMX4jwFNJiuYu/2BeTzwzCtJwha4M
	xTJIXcE7h7QTShRk8QUZv89BtGNg7D+iZaP0VwcAC5744CCA4qBr+CFb0JAejdcPZI+0mfqtbav
	lAp9JbLQHJ0iZgTOCKWYqhZ3ZinXCgvRo2vtdy6ANAnWQXSH1Htj0hZqTxVwhNFTAVwwm5H7H6R
	DsT7oDZ+YTJIcWb6U+06znUiyBjb2uw9o8WGh2SpMltjeO26v9OMZgFKE=
X-Received: by 2002:a05:600d:82e4:b0:4bb:6847:7927 with SMTP id
 5b1f17b1804b1-4bb8882677cmr106256925e9.7.1795216124609; Fri, 20 Nov 2026
 15:08:44 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120041906.5785-1-kanchanapsridhar2026@gmail.com> <20261120041906.5785-7-kanchanapsridhar2026@gmail.com>
In-Reply-To: <20261120041906.5785-7-kanchanapsridhar2026@gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 20 Nov 2026 15:08:33 -0800
X-Gm-Features: Aa3M54oWMWk3u-HStz4cQZgKn2nyeqXit_w2sb7aEXMQD-Dkp35CvqUHYELg-w0
Message-ID: <CAKEwX=Ok9rom97s1GbrdJHNLqQTj-C=iieFHnbtUVY7skO0DGA@mail.gmail.com>
Subject: Re: [PATCH v4 6/8] mm: zswap: Store large folios in batches.
To: "Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Cc: hannes@cmpxchg.org, yosry@kernel.org, chengming.zhou@linux.dev, 
	akpm@linux-foundation.org, linux-mm@kvack.org, herbert@gondor.apana.org.au, 
	davem@davemloft.net, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rientjes@google.com, willy@infradead.org, 
	senozhatsky@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 8:19=E2=80=AFPM Kanchana P. Sridhar
<kanchanapsridhar2026@gmail.com> wrote:
>
> Use batching when storing large folios in zswap. A new constant,
> ZSWAP_MAX_BATCH_SIZE is defined as 4U to support processing batches of
> up to 4 pages at a time while storing large folios. This commit
> modifies the "store single page" approach to "store a batch of pages".
>
> As part of CPU onlining per-CPU acomp_ctx setup, ZSWAP_MAX_BATCH_SIZE
> compression buffers are allocated to eventually be able to compress and
> store ZSWAP_MAX_BATCH_SIZE pages. This happens in subsequent commits.
>
> For existing software compressors, the extra overhead is the
> the extra 'buffers' pointer, 3 additional elements in 'buffers' and 3
> additional 4K space per 'buffers[i]': in all ~12 KB per-CPU on
> x86_64. Only the first buffer is currently used.

It's not a lot but do we need multiple buffers here for all software
compressors? Other than the hardware accelerated compressors,
compression happens sequentially, no?


>
> zswap_store_page() is replaced with zswap_store_pages(), which processes
> a batch of pages and allows for batching optimizations. For now, only
> optimize allocating entries by using batch allocations from the slab
> cache.
>
> Avoid repeatedly calling mem_cgroup_zswap_writeback_enabled() for every
> page and only call it once for the folio, since the entire folio is
> charged to a single memcg. Similarly, obtain the nid once to use during
> each batch store of a folio. To facilitate this, a "struct
> zswap_store_context" is introduced to keep function parameter lists
> concise.

The wb_enabled stuff sounds like sth you can pull into its own patch?

[...]

> -       /*
> -        * We may have had an existing entry that became stale when
> -        * the folio was redirtied and now the new version is being
> -        * swapped out. Get rid of the old.
> -        */
> -       if (old)
> -               zswap_entry_free(old);
> +       for (i =3D 0; i < zc->nr_pages; ++i) {
> +               struct zswap_entry *old, *entry =3D zc->entries[i];
> +
> +               old =3D xa_store(swap_zswap_tree(entry->swpentry),
> +                              swp_offset(entry->swpentry),
> +                              entry, GFP_KERNEL);

This range is guaranteed to be contiguous and always belong to the
same zswap tree right? Why are we not using xas API here?

(Or maybe we can do this as follow-up/in a different patch?)
