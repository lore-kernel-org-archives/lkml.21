Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794996451;
	b=Gh4bhHMAk/GEh/NefQpIcHpxVOBL6Sc5lJWhs7mdCuwre5HUa/6CNNWgcEHz3FCYD9lE
	 e7i1XiVFQqHu4hB3JzetVJc57082kSaEK0W9jfe+e1+OTVI4iDKs4Yt5H4KTGivgFc+Im
	 31RfJhkZ4LXsiuvCSdB0JIceBV2OlNe7zB0WeFrfatppAw2azHg8MAyhKNVQ4BWxoqD9p
	 grlyG0ZaxJURfwddjQjVMaqYdhTz0D04i2vW7oUF8Lv310y+EFPRMYMhNw6X2mnouAF8R
	 JRYfldVaL1GbhrJbGUmx7fBin3/ig+KMY5XqD22sKksQouVJYWfUEsSgMPLJzqd9cNw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996451;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=S+vT9vEZXXGE5nylP28OP5E16FdGgGeVcWYBckNJ7xA=;
	b=RSBeCbNE3RRbS2nn09OQuSSMFK5iOiZfIreanQ666IoRHw7TC/kyGRiVICgku92SN/Nd
	 iIv4i0KGstGFz7VZ531xl7apjHBBYt3vCBCc9Xg631m1k7sq3G+bJd8Dm5Gj77eOWuFsU
	 qati//H1ofby4vou5afwbaoN5ayuzueZuay/NN0ZJcwPnuuojUfzn0dpIAzESgs7Xdyya
	 oZkZVMGIjLFd3Eeu+rY54zaM83egXeCN3aU4qt/iFFOG7O9Zibvz8Kgp/WS4f7CcXTEeA
	 KIsagPPjbuYQ0FzABqkNlBI2E4Zlj2XAdrvX5kHdv5pTgmRVqha0xE7yJ+53GNtnqyw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J2OqD5yw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0958A606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:07:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0958A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J2OqD5yw
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b0d126f631so6484677b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:07:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794996450; cv=none;
        d=google.com; s=arc-20260327;
        b=rn03gUWY/flfYbdHfSnDfRbPFzalpSrg5hQW0RykTgD9xPBo+Ixm+whTVVaiivdYl0
         XlAOnVkfN67FP/l9HbSs3fEWmx2lvbSWW8C7TihFctD+X3KQKNwjzmr7BG8QLYHt1apU
         oDL/b1peW6msjcjyNyRJoeDduXmS1gdiwqT1dk8xqsbT3NzaMSQHZcMfENnzab1DeiL4
         gVajrXS8cjuswU2+4qjVaeCo56lnJ9ZYv/GDvM6U5slI5EcdEFKIE8yJUd3F8ZoZj/Ai
         L5xUIF8SB17C2NP+pp1JK5Vv7MNyNxkqU2XEPvGTx2ZVSFFi5DnOVzuM3FSodWgKq9zo
         zeEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S+vT9vEZXXGE5nylP28OP5E16FdGgGeVcWYBckNJ7xA=;
        fh=7mx139yhlvoc8xQ6I8HjOxG3Ed879Z/FQ+rhy6Kxx2Q=;
        b=EX9fhRSs5h6KA+m9tgmprFO/eTkWvAY4AbS+laijWWBSeS7O+HXMYzKy9xFurXUQDd
         wZK8tHHsIIObxLfuN0oTBdaeAelzXSlGjFgU5nGYWeYMNCCFTFnoB672znpyNty4uT2U
         m9qW0jkbpQYH/aJIlTJZTYVr7pJRwe+0AYvLUtdCc7Jvs7JKm5GIjPV+umRfSX8zZhYZ
         W05O1etb9hpTX2mYBMcVjveBfxOEVCpRMm7K3neL+EmAzlzbj3r7GiklxES1TquxDQL6
         Yz+NTFP5zos0lsr1iBxAUu0p+BqDmdJpT1k+gkVsKZ7xEFETY1hcxAALpMNjSfM4yKXt
         0+ag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794996450; x=1795601250; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S+vT9vEZXXGE5nylP28OP5E16FdGgGeVcWYBckNJ7xA=;
        b=J2OqD5ywyH6LSEJ9BuWQdnXBANlORCux9CWVCvlPvyXwDNECvacfIqeqlxdhU/zUU9
         +H9DaQM/3143PxHTTAeEK5al1FsRM5tLGy5D7sFGq8AwKBBEFq+VHS9DWU2RTFSz2g+i
         fRnqFcRQDp3fhP6XgcjM5fRg+H6He/4Efb7pGNhF+ThcF1lpl23vydjUIOha0qgKTk0p
         FZ8DOwP75UIDS+6HbXrJtR/h6FeGLPWe43w+x7vcffvzedVvz41971mmbUL0LhzDc6Ax
         U8nunais28KNSlarbONkt9hj0+CL0ZoFu8k9nZg0iejgjtP3mS01jqBeFFu/d8aT677B
         /5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794996450; x=1795601250;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S+vT9vEZXXGE5nylP28OP5E16FdGgGeVcWYBckNJ7xA=;
        b=PsfGrULtXKA4mgBSjg5kxgA56JPi0x0TOeg8vFoLb5sumxBDAlulB756q5/1UbZVzM
         Hzah6hkjgsV5Su01z47wjZ5LxkUSJ2PGTdelQTbq+DXmeDZ6Qm/U5grRtzAIaddGpWJ3
         gDe3xksami7vFO82h4fEa/ND02XmE9/r3nlzMfDp+G8I0RohR8SdCs+Vz3wxuuL9vr34
         BcfSSRasMixRW6qoMyK7npGaVVrw8E3zbCWI+xhQJwgTZhaF12zlkfTQuTai+jnNrY5w
         V7ZQX9C1npgMKqJ9Jio8Vaz8Kz1b/9DuBB7KA/bp7EyNGciQFWGofgSO7jtLVyf51Rk0
         Dumw==
X-Forwarded-Encrypted: i=1; AL+hErHinVCUCw00Cj1VUd/p0PMrxUGmdCrDuEIlQIt6pdrXPFOFeKEaiXfY60/zMfQwes3xoHtl0m8PDrHMWTo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qJ2qzMoZabDoJ05V5T8L+nq5rMPjhdhtkqF22s3gVX7vO/TvP
	2flFYwo4qg2D7koSMF5yrheAojm0LMhDVFq1Dzlseykp9MPh0n9PHoYvCk1lEDmxeMjCWOv/Q2/
	X3uQQ9QZQqwHShdkXFgGpVfswqEmdtO+3wQkhpkgmWQ==
X-Gm-Gg: AZFdTZc+PVUOxA5opi/vfzM/kH2ZoGBPXHWIRECMOFH6pRoen5q0gd/DTU4z+DvvkWG
	V5oZVK0WFJu/oZEsI00ubpXwNIx691sVuuR58uYFQasI4kdBxUG/JK5vBH43VEo9uRj2oQGMKWD
	WhjqHY1+ozcdPxBzHqIcE3atSreKUXcWcYXIxdujexA2JoYEno0Zioq5cfCQbY5OMy5oMr3Sxij
	MH+Vkk2O0F2Wjcizi7xvI8Ejpol3tv/6B2dcSZ/OX1Tt89O53uLW2CmHRR5mJQbaaPuhj00rymg
	cpx1axVzEt4DglrxmmjVe0C7qAO1EF1ACqnNfBtrsszF2vw6+NtCZm6GkZj047UIDww9tc68jND
	9bZOVA+VDyWcEZsoOc8ADw9LuwQ2dCvebUzo0upYrtdST3Lq03iYOg5WmUiL1VFhmdUWbIBS3pT
	T6MmNdUO0dvOQpECRUJW/xXsL/5j8rRjM/X+GQy/lvO19zKDqpEKSnbDOGGsMfjV5NeiRUQFB+v
	W8qxVUyliLgQZMZEtD/sI0eaqf8aZNrSYO87NcZjd0zyz25chbTfPEaCr8jLg==
X-Received: by 2002:a05:690c:a402:20b0:8b5:6e9:2183 with SMTP id
 00721157ae682-8b506e9277emr1851467b3.7.1794996450036; Wed, 18 Nov 2026
 02:07:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118095314.42769-1-patelshivani2283@gmail.com>
In-Reply-To: <20261118095314.42769-1-patelshivani2283@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 18 Nov 2026 12:06:53 +0200
X-Gm-Features: Aa3M54qZ8hkps0LsViVJo_s7XZ7AAjtX2_rzeA2MmsfOWg5FnTjwadGRxEgW-j8
Message-ID: <CAHp75VcPRtBpFmrd0sRD3HHPd3dMgwATzUxTyfkBPkuSh_xABg@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: Deduplicate and reformat atomisp_find_in_fmt_conv_by_atomisp_in_fmt()
To: Shivani Patel <patelshivani2283@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 11:53=E2=80=AFAM Shivani Patel
<patelshivani2283@gmail.com> wrote:
>
> atomisp_subdev.h contains duplicate declarations of
> atomisp_find_in_fmt_conv_by_atomisp_in_fmt() under ISP2400 and ISP2401
> comments. Both declare the exact same function with broken formatting
> (lines ending with open parenthesis, leading spaces, and awkward line
> breaks).
>
> Furthermore, the definition in atomisp_subdev.c uses the same broken
> formatting with leading spaces and a line ending with an open
> parenthesis.
>
> Remove the duplicate declaration in atomisp_subdev.h, place the return
> type on its own line, and shorten the parameter name to 'fmt' so that the
> prototype and definition adhere to the 80-character line limit and
> Linux coding style.

...

> +const struct atomisp_in_fmt_conv *
> +atomisp_find_in_fmt_conv_by_atomisp_in_fmt(enum atomisp_input_format fmt=
)

Can't we take one more step and drop the duplicate 'atomisp' in the
name? The quick suggestion (you can try find a better one) for the
name is atomisp_find_in_fmt_conv_by_enum() and also rename
atomisp_find_in_fmt_conv() to atomisp_find_in_fmt_conv_by_code().

Also drop stale declaration for atomisp_find_in_fmt_conv_compressed().

Altogether, make a series of the three patches:
- drop duplicate / unused declarations of atomisp_find_in_fmt_conv*() names=
pace
- rename atomisp_find_in_fmt_conv() to atomisp_find_in_fmt_conv_by_code()
- this patch that renames atomisp_find_in_fmt_conv_by_atomisp_in_fmt()
and fixes formatting

Don't forget to add a cover letter.

--=20
With Best Regards,
Andy Shevchenko
