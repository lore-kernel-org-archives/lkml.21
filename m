Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795020528;
	b=QyjK/p/kFEVzxvSXvtQxfIS6Ul1vDpn+Rm7SH9LG0L4c4335FRGdvhRCUClkWbHClt7J
	 5Js1ZJnvg3/04z4vombC/8TrCIa9G/JS79sfuQzgyZYRt36quHbCX06f56EDJds/AS/Nn
	 ctkB+r+FHlNCY26oFQSjFwb+47Wt6KULNx+7kk+PapeYCA6BChzZHYB4TE9ld0+D5Hsr1
	 sQZqZFMxENWUZ+KbFOIllhJIyHbWG/D+sB6VSXh2uORz9oEk/vtzxUmogTm5KCZVw0yRP
	 eJ5oWNqBQ3XxNVM0ZR4NMaUFIklD02SKXnvZ9NYkH4yy3RanxaepkLccdXFUuZ9ae8A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Qu8TLkte6pCLHa9w5qlji6UWllu8nnaFEtrp1BCXQCM=;
	b=wKaSvAakZJ+1RSM7WIvIM5uBHHd5SALT9VF4/U86Wa5YHZ7VOdDEBOUGzclK1730pbes
	 ItmwkBzaKAQSmqJ97jj2DSH63GRociuCzjcs9y8R2XeVPhadCX9eBgroCtg/FOscLsIim
	 +n+BcZIYTvZs1oeG+Vb50zaHKrascbt9vfQMjO9qsLTwCufLsRUITlyjLaJWr2BavXOXq
	 yIQgZhCr0K18VVLmtCs9tc2wWaqhZOcfH/EFWpOEPXjRcGuIRuPC/9WaFBwAkiHc5xypN
	 7GEqfY0QUQfG5Tuc0ru9/baeC98xPoL/Hwy8kJnaJ6fm64bTSoDhrGfRFr3w3QkTfNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="h0Mkv/g5";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82912606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:48:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82912606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h0Mkv/g5
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b88b74e54eso1313744a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:48:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795020527; cv=none;
        d=google.com; s=arc-20260327;
        b=EaBBqtflSoll2Wl9QIV2pFxhgJ8GhGfwZVgUtnGvAKAUBMBqOtgHVVFCtbqUbWPMjZ
         TvNOfCNgsivRF7EjouXdTTIKqIBVp/gvj/bBDI4AW291L5KhDL0H9VgnhVkl745CMEed
         d9O6YUI7el4+ikKSkvJ0DEyAI33mE9q+pUtSr6Ov3g3pzoDnWDKZFO3LgBBnJZg54skv
         Ar9maTW5yA2OoX0luWPZKBdOc6KBnFhpXVKkxGTfLhX9v5MeslLckYdtYYxnJpwiYeTd
         7LgBbIMBx5qB9Ht+1+2NPt58yxLWLgEAOLHQ5WGrAV8IK875I35aEjesxUMpxFp41+2C
         pSgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qu8TLkte6pCLHa9w5qlji6UWllu8nnaFEtrp1BCXQCM=;
        fh=Hy2jT2sxnkHG/N0k2aZUi2DYATcW2SibxV26aQwlmMA=;
        b=DtSy+fpl86/1ZEc2osaTXP4QlEtYhEyN1AiD5IEqpxe5SuEUBz8MYqJH8R6MmtidGx
         aRs/VNabUBLEtzrEVuG5PD1oxlGffrfYC+PrtSR3ditFNfPDboVJ6Okj75HHDRoBRINE
         z8aQNlhqpH8o/u7RZdIIkpbaQkbBwy2IdhBqEro+iNTVKW0uy+hLT0ugVNjvJnRzICk0
         XcBTO0e5UZakqTcbtF7g9AOzvkfyYm45pMm3+y1Ia9oY+CNeQTgUTmnhQs5qbOBT+Rn/
         j8x0tvDj5AHuOD6J326LF+/dqndhrKY3wUDDG8HK91p7euryRXlEs+mLkxlxpogKYIYZ
         XJXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795020527; x=1795625327; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qu8TLkte6pCLHa9w5qlji6UWllu8nnaFEtrp1BCXQCM=;
        b=h0Mkv/g5AehZDEfkr7FHuutdVMEl94YLzs4XcisvX15dFjoqbXgjKClyr1CMmn0Zde
         NprC8H7Jj+eoT+SuAlUcPc4Guu6xweOJ83FBHfBKQj7G5nE10Usvx8EnesfscsRUL7BY
         9qPCGW4IYmzUgOoVe9IBLBX9AJFVW/4OzlHnAphOWBoGzUzU6sn/ueFQQbYOoTPgSY16
         EZhbtMZBZXodUDJwPIVE3oroJrsZLybbTUauU65PLN/5Chs0uq/raZkXxHkkUrMFn4xS
         k1Wu3gxyJG9ztgCHuAior0mkHw6zu2rDyKsWUHXD8T73jZHz3jfwGpAE2Glhz60bSskM
         05iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795020527; x=1795625327;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qu8TLkte6pCLHa9w5qlji6UWllu8nnaFEtrp1BCXQCM=;
        b=ZuaFtw676yQ7Tuf4RQWcx920yB5FvzI0FWYbH4XOwon7yMEhzx2L/t/jsFZa+a9/Ax
         JYsZho/ZEbFm91ASXCdFkIxx9GyawC2gUNxIMtj5AXbxZFG+BedKLqESTGAKAc4p2yp5
         7RrlNEv58U3GtNmNvAKrRUjCQftLt3qIH5msnyxtqIh6KyEa9gb5DUjN0yxeYthG8Mmy
         Z9PUNWkRJhyCy2jlYGwIjaz4NoH0YqmA2P1nhLf0nfG0x2EVDUT3ccgdfOtqpsajvx1O
         DuxtxUo2j8QV0qqDxNzXoHCJevHN/7f64MPQUF8zO5qmqLokaKqkofhAjMWfyMRf8PdZ
         5xmQ==
X-Forwarded-Encrypted: i=1; AL+hErFfIbhUrgJ3V1VKbVG5Z4Odg4o1pWEVb6PJape54/IAh8KtQbck/cNLw+2RI6is36kmUz7uQZNPFfR9vT0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eLCx1HbtstzJYjpEDOWkCwsIwHm77z3tB59jFw6idlKJpJEVT
	jhjkn1ZgIKaqNciuV14pmnlExSj8PCXzdSW5lmlrJ5/7UFdkBqflkt21HEkdYbfRKYkZsGMGRVr
	OsEfFGf7DzRJ5J/Z4GwEfMlNM4ArfZTA=
X-Gm-Gg: AYBFou20Je9rjOpWCI8N70Np4JeT9t/OTKSLbBWjrWk/LUFm2jqUaynn+KbQhDxzuP6
	zN/XVLyUTccVWyn0Q7/cCxRmogdo6RZPvi1GuQfnmA88uawTBSoL6jA52SfaERDDvLLMXB+95qd
	IX6U8dTUtmF/8cOJgi0A6ho7Kl5SedrtU/GNHr/fjiuJ/gDsmEHirqn4mTLS51DKwlfCotbpFEA
	p1Fumjh+BrdIkR44QlawNKxUEPyRFJ2i1h/dp2FoCfvOWNSYNa0osbSjcGCL0QlTsVyj0/DSciW
	pHsDCyQLk9zFibY1i50YCMIHeEqlTi+EhghXLhlnNCQBAU9dEEePb9k1Y6hFNyts8ETjazhMYKY
	Wjuhmcq1yx0KujWiA7IKwoPjP//54FAEtliI=
X-Received: by 2002:a17:907:72c8:b0:c29:f5d5:5a97 with SMTP id
 a640c23a62f3a-c510e2ea712mr279108466b.33.1795020526796; Wed, 18 Nov 2026
 08:48:46 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118160110.1662470-1-16567adigashreesh@gmail.com> <de1538b0-bb42-4a7f-af9d-f7311a452fe1@app.fastmail.com>
In-Reply-To: <de1538b0-bb42-4a7f-af9d-f7311a452fe1@app.fastmail.com>
From: Shreesh Adiga <16567adigashreesh@gmail.com>
Date: Wed, 18 Nov 2026 22:18:34 +0530
X-Gm-Features: AclHuK_DxzZQeXWKQ7-X4q_Hfz3O29RVrs44GltQeiHuXMYKXC6TlXfwil0GmAI
Message-ID: <CA+-x59Y51H6=ggZOTXJhqbEtfhZ2KypcwbSWVMGXeVKb3ha+EA@mail.gmail.com>
Subject: Re: [PATCH] lib/crc: Add 4-way folding in NEON crc64_nvme implementation
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Eric Biggers <ebiggers@kernel.org>, Demian Shulhan <demyansh@gmail.com>, 
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 9:59=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org> wr=
ote:
>
>
> On Wed, 18 Nov 2026, at 17:01, Shreesh Adiga wrote:
> > Use 4-way folding in the shared NEON crc64_nvme for AArch64
> > as well as AArch32. This improves performance by about 2x for 512 byte
> > data size on Cortex-X925.
> >
> > Add similar optimizations from x86 implementation like reducing
> > the 4x to 2x and doing a tail (len >=3D 32) 2x fold as well as partial
> > block handling to process lengths which are not multiple of 16 bytes.
> >
> > The partial block stage is enabled only for AArch64 as it needs the
> > 128-bit TBL instruction not available in AArch32.
> > Modified the loop dispatch on AArch64 to allow any len >=3D 128 rather
> > than just multiple of 16 bytes.
> >
> > Modified the pmull intrinsics from crc64-neon.h to use inline
> > assembly as the intrinsic usage was causing the compiler to
> > generate the fold constants via mov+movk+fmov/dup which was about 10
> > instructions for 16-byte constant instead of expected adrp+ld1.
> >
>
> Why is that better?
Based on my counting, 10 instructions (mov + movk + movk + movk + dup;
mov + movk + movk + movk + fmov) for loading a single 16-byte fold
constant =3D 40 bytes. Whereas now it is 2 instructions =3D 8 bytes + 16
bytes rodata.
Since we have 4 such fold constants pairs (4x, 2x, 1x, barret) it
reduces the instruction count significantly as well.
So lesser read-only memory usage. Also for in-order cores I assume
that the instruction sequence has serial dependency as well.

Previous discussion with Demian who had highlighted this point and
suggested to use inline asm for PMULL rather than intrinsic:
"Scalar vmull_p64() makes compilers materialize the constants via
mov/movk + fmov (42/97 insns on Clang)."
Hopefully the above reasoning is sufficient justification for this change.

Thanks,
Shreesh
