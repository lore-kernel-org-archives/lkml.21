Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794995822;
	b=xI+ssLl4roPJNITsbLYXV5La96uJEuBcIbDLIJAgANgxP65LzZElVro/mC6u2rL1sqtn
	 rbBkQsATwSxBM/32y1ReJ7UrmTQLwUYj2J0UNGUquIbESy/3lCAhE405yExjyYbXrRwCE
	 /642+esm31kMJRu/MXbhygv6BG68/+Ss6GAoCiTKwLQ3cRcYLJQbytJ2lL8yG7WbGLHQe
	 Ncxz17yPEmq6CP6bLnAAm2JxAj3PMJ8PtOSgiHgaiu6FNkGzSuc0EQbB6njNaWzOCwWUI
	 GNVQW/Bf2p+uRSvFNlecXnJcAZNr/MKIZA0ouZD8ZeKdoQAAY8Ns9RNeddABKbYpbhw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794995822;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=u/MdvbP4Ojbm3WnEZfl4WWiet5sYSFITDndG/u7FFeg=;
	b=aWA2w2kb8GCA99AetBTcK7JTerqu6DDZuzo7rPmnDqQTO+cP75LhZi9TEwq2vmifX4vX
	 L5N1y5R/EmZtjUWTH+qTJgZ4hEq2eF9pdncG0VjNId2OZQyr7pM/JlWwqsxro6BOapojS
	 m50xbw9zmncUgd8evRPIi8mudHIcTY3cAzHhRHtka6DBY8rlKQaY1buTrIXxgrRUvItRk
	 sV2l4NcPkytY7NDwMcOFGzJHfTrtu/TWsRsPRcrDJ2xGJXXQgkduVDfJFYgw2uS7enklj
	 kE/CUdSQXZyJw68bX2qgh09cQNwLW8OJgBC1rEsIdBw3ZYPLzbsCLg+DV06G6eZe3PA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sKlhWHuX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D59606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52D59606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sKlhWHuX
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b4d6981c67so4209037b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:57:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794995821; cv=none;
        d=google.com; s=arc-20260327;
        b=C6biPKL9ul2oW6bMlgqvaqPBeiPnoT1jzgyoJJgv0VabXuZxd/fSIFE+RH/NsloU1r
         8KwAQAxVdWEQCfXtCNfn6y8s7zshavEgVIuc4f3kFZIqWCdH1p6DbUroeV4CSufYwljY
         ebjq2NSOGrZpttIhLLulIzmAiHSY9cPrb6CqEBK+V4Kp7VOw1ubtU1aWa3W/stPgl1yM
         +XavimyG9VQ7zRRgJo2OTSQ4jQ6H5q9jpebLEY4aDWyj15efQ9l04R9w3GRvMUfpwh2A
         SR3AFYqsLk+tAqkUljCw1FDKz8DiYyuq3vQ8tji5iYHFOIeH4ZVwoD5i7Hr0ICRuvHex
         76iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u/MdvbP4Ojbm3WnEZfl4WWiet5sYSFITDndG/u7FFeg=;
        fh=gVtU/n+6hzOP2VIy+0To5GKOyUUJkd9MIgZdLlNG1Ls=;
        b=JypPoRk/5nlcQOJIcMOmfvH2g2zbBAmOe6ZbWTpJzHAkBElokX/LxYw3WqtX+DX1NP
         Js3nXS3IeGYBeFrpzBdXmSDM5uPwLnyKJG2e2qbnL81j5yYCgS8rxiIIHm3Y5NnKby6j
         1prNneFEYjUz95wnL5fk8S6eauFIC1llDRbeZy6ySuxsCzrKneeNINzHZVEyCrZ0iwAo
         7717tSUHG67pzUHnqs8WzfjilkFsKYP4ytwRtHR234RnOj1372NdGPOqs6J3JrGzMPN4
         +kDQrTnDepC2L5Up/FXoKC1kWkW4qFDYnyK70YlULHQZnvDbHX/wio/qxTyxJV/Nvmga
         3LHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794995821; x=1795600621; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u/MdvbP4Ojbm3WnEZfl4WWiet5sYSFITDndG/u7FFeg=;
        b=sKlhWHuXXw+QRUaHudZzPnWFh8acoB8ypwoQRGjQ4hkFLhYdBcK2JzCwIomEyhtfr0
         idUwIjhjxnWRnYc82WCG8lc/s1O6FA5fMKDkmMiVfjrdrOA59mOZEe8KvOCbpAvm+hE6
         SQujkPC+tAIw0O0OfUHIkVE+XuC4mX8aXRyQ+igEKyiMRcC5NBgs1JEM4dS8JVtEdjRK
         5cC4TFny0fJWZc9kU4HSmobX09o3/lwz35e9cL/yeZxibRsfCXanqwUzeOGmZpiLFTsp
         vsViofGUcLAhvxD10h7oWqfFZz2R8QQIqPxEEVMZCGIrqF4dHbXyYyu4Y7T0QfG9y8Mn
         jgeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794995821; x=1795600621;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u/MdvbP4Ojbm3WnEZfl4WWiet5sYSFITDndG/u7FFeg=;
        b=tzWkhPebuN6igwoVRNm8HXOhyPPU2fgMo2aJ97eGVCSJAzeoF7LaGKpmk3Azt4WlQt
         zLJmEFf3hOke3rxgc8RV0mCpLrIcpslIjr+OEQvgSS49c4Eax7v3haT8D3C1bcugMhxX
         wSL6o95Vg6g6pgxazku9kswQih/n4k0hvB1qNcnY4onPtt5UzS4Ff1XFRmgR9btf3p3c
         OUp+KVxR5OivlCtNs4e+E19AZ6rF4VrydI2HD40RAz9hFLFaLnfqqjUBHPFGUrEtUbL0
         LaJCYMf586QbbXPOjwcYuz6c9bGMSn3LYx5Id4NrV4+GxqGWbJAgdKVwsKKTuTJGj0HK
         lJCA==
X-Forwarded-Encrypted: i=1; AL+hErHhkg71MfyBDMegFLZbSPK8cL32DrGAAPFj4UZFPl6WGp4NPKd9Y8V08B/aKSuGmJN6h3yQ/uLd1AXz3JA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZP/UoM9UdxVuMRVXW8jn+k/Gj2yX3ONSRVahC6uPjezyOoATK
	FFvc+uij6OFKsNaEHVuGUz5M5WHMHFrIVcV0YmJig18nuzpQngU4Wj4wfvLJRNmeEuLNT0z06ZM
	poKz4Cyp3uyeVBjQuAtsYtKLg+luXaO0=
X-Gm-Gg: AZFdTZfjzPnpcMe7Bvy7GlAndEYLNvNj2Y6VGKA3w7nYgGZAw14FGVKAkHdt774oaNm
	4phIy6qThGIvFrqRFDAVxnesFAVJZBaQ/Qe/x/GdbnNRAWA4OHDpY5FE4y9Nw9WtINqb/vbwVlL
	DV612+L/7Rbu2SZ1Li+zUlL3rWmEEQN1/HXV7twD6k+8TF6wrrMr5/6dXaYxeyeyHXE5wtsfxqD
	ziGNYuJQROeSfR0cSt25CJhS/X4CTphDxQAKQFn4bdxFM6KjM1FvtbkWB5h9e6HiKrvQlmsVmIA
	+8y//sX8KGf/GH3XhdHtHJTb8RD1jEYXMweXVyvtpuSW3lJ9XSG8lHQ9/0IZZ6BeGxhxANK6XGA
	0dfQVnjDRJ3XxADypwINWf7/z1KX6i26izpHtXmZ5DsNoFmzu8Mo2uHg4SO4XI+nvmxGVTSjAHF
	Qtn1/zdnUq9iV31ZKP/eIdbVOmrS5evBKq2bqEfeOB/cd4X0GvRioRYDqxMRnKMFPerO/LslbEn
	O4kuAwQsXB4J2++lSRSUQIfu7hgXuhuCy5l4KTTzPBHgudAqFLx9noCnTVFBQ==
X-Received: by 2002:a05:690c:306:b0:8b4:deb1:4b18 with SMTP id
 00721157ae682-8b4fed0a903mr9623127b3.18.1794995821294; Wed, 18 Nov 2026
 01:57:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118092526.2210410-1-haoxiang_li2024@163.com>
In-Reply-To: <20261118092526.2210410-1-haoxiang_li2024@163.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 18 Nov 2026 11:56:24 +0200
X-Gm-Features: Aa3M54pW0xeRqd9g0eTAALfYmhCgAo4bRP8M2Ui1GBWIBksef1cJeFOWSXo6vx8
Message-ID: <CAHp75VfRfMq=BECUWQOhXkrbpuz+cp01mO2LGa0S+PWjbu2n_w@mail.gmail.com>
Subject: Re: [PATCH v2] auxdisplay: cfag12864bfb: Fix init cleanup and
 simplify error paths
To: Haoxiang Li <haoxiang_li2024@163.com>
Cc: ojeda@kernel.org, andy@kernel.org, geert@linux-m68k.org, 
	maxextreme@gmail.com, pmarques@grupopie.com, akpm@linux-foundation.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 11:25=E2=80=AFAM Haoxiang Li <haoxiang_li2024@163.c=
om> wrote:
>
> If initialization fails after cfag12864b_enable() succeeds, LCD
> refreshing remains enabled. A subsequent attempt to load the
> framebuffer module can fail because refreshing is still marked
> as in use.
>
> Use platform_device_register_full() to simplify device registration
> and its error handling. Unregister the platform driver if device
> registration fails, and call cfag12864b_disable() on all failure
> paths after refreshing has been enabled.

...

>  #include <linux/errno.h>

It doesn't use special Linux error codes, so this now can be dropped
(as asm/errno.h is implied by err.h that you added here).

> +#include <linux/err.h>

...

> +       cfag12864bfb_device =3D platform_device_register_full(&pdevinfo);
> +       if (IS_ERR(cfag12864bfb_device)) {
> +               ret =3D PTR_ERR(cfag12864bfb_device);
> +               goto err_unregister_driver;
> +       }

  ret =3D PTR_ERR_OR_ZERO(...);
  if (ret)
    goto ...

--=20
With Best Regards,
Andy Shevchenko
