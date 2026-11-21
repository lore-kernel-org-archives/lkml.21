Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795285779;
	b=SU8YmY9iuJGyx8gFpzDlZsJgTuwfr9fq45TNjlb9pbAxkYs5BldWvPvzj94uWJb+nlt3
	 oCLE+p0KyZ3uihp/Wim+nKiRR7G1DUn9SdI4R7n1vnhRBN+BTHq1tX8j/4qoBXeQ5hbDI
	 A8/a97DL9lVg9wTfupMYbF1BvObet0qdMSLDxqsiyxviv2d2PqieF1V3Tk1ASPwWI9qxR
	 /87NuD0EQ5b3O8gXNsFyKtRmo21XJXtIhIKb3FMGP8pzn8mEkN65Np1zGfXEAn7IFTWac
	 sTYQSc9kn+MXu/CpAgd7Bq+ubn7LcWcv+PiBGPnMGslqnOYrrKJvjeCojrMCwQp1oRw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795285779;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=8lV1mlfunlG0Z+KIHHP7dGizpthdTB34pPO145VjCj0=;
	b=ETJp+uq9H+HoD5+1GeXYx4HmIuT/zcONCTsm38SVBxblUK/mcRiP1/1xhdaGaPZ22OaD
	 fNX+XtT736McG3aakUlRtoayqfNrdF5IMRh89TBLRCA5Yd2XEjBEvhzYfqo68C0CQQYP1
	 VS3HDD9TBsLG/iCIUCvl3YOwwaxlyUWeJnzWQXh+019nK//GIbEP/Wn70EONQC/gC3/Kt
	 W8ST/8NeImOeT8ObSldQvb5byI7zDaqPa3piL1OC7yNBi2deqlChpXF5Z5X+b2Dwrwu1R
	 g18i5P/FbidLxv3+1CNyh2lzzSZeBZ5FZdZ32Jw62jUdZOlSYrbukir0/2DBvVmIMJg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bWZNnK5x;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF880606A336
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 18:29:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF880606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bWZNnK5x
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-677bc4704cbso2379518d50.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 10:29:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795285778; cv=none;
        d=google.com; s=arc-20260327;
        b=AoBVKs6X8jomwOyJEnYyan5dSAFgRKSRvGu+enSzPx5673MRTdKTKyacmyhOMh9iHX
         9ZJEdC/NgyDQsZVH23KTVsQx3fXIlXMKTv7IX4szx6PVYR3QtqRYZp8Gssx8kcrBtOsP
         AetvDPff6dfLsmiyDrDCjOsE8NBBPsXUaSzR9Q53/GCmQ4ZD8pcMbHNu0Ish4iVniTil
         uhPe/ua1sQX/OYf05mi6MTWScj5ezfEDnmycUyv8+im37guJAAxgqoSO0Fm7LGdOGcrP
         mfJiUkoJQsVQIdB3ncTRpIdRviSw2znweBH7Dh+FJNSBayvi7kzaK1B03B0nw4okidFl
         5iOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8lV1mlfunlG0Z+KIHHP7dGizpthdTB34pPO145VjCj0=;
        fh=pz08SDvS3q+m9VotBXSbQrA1tAnGH7oWuSS9AbmZDRg=;
        b=kD78yarYc38niTQMT+Yj2Bqkl7sbJ8oGzz9cct1biz4xW2+zRVfp+QjZ1jV9jEOW2C
         PKIWJF55P7nSQzOWGSuSV9lyfmC8pymLcYHL5dcSFnPLSH4s8TxdAPQM2LHdarXbyApp
         +A5TxFQ0WLpG4vu1eG6fTxTb7D3HWSxMR3oYq1JHHpy6hqy2nkZR8IoVT0Hbseu7BXj0
         gfebuOjWBRgj5iAjTi3WYkcL4Qze8F6OV6hP3G65aAavitMAGsaIQw2wOWoMTyeUKHK/
         zrVjqB81vjnoOM1MF5OxU6AXSvAP4GXiDnr6pLMd5pgTAUuefvcJhDmYm2UqUuh/FkBi
         bUeg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795285777; x=1795890577; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8lV1mlfunlG0Z+KIHHP7dGizpthdTB34pPO145VjCj0=;
        b=bWZNnK5x3F5FBrc8XhkPCBtafzaCS54wkPJOnb8N3PHGUqZ2BX0pgjxNIN9HWDVyoq
         Ztl5ZnD8WC6TmXK7/KoPIvGGfwQRyfkYn5nXXq6b+IuBXY/3RtQaF7iG4xQI5Ywc87LK
         +u2pef2mwGo+GwP2s46dkDT3bPzc1CINJ+l9E6qYzmE5m4VZmIs6fR6CarS2/hbxhyj1
         OlUQK2+kZgAlIczrS51n9TotmAa00gIEQAS+4Sn9YL7FkafXxB19QUxx6arMmIoEbD3T
         mB1rMxHB5cQcCwy8yYEvP4KqbyJyLMsvVNcrIhb3fzS+WTRze1UX+Hv4myd8fIUYSH//
         Tdwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795285777; x=1795890577;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8lV1mlfunlG0Z+KIHHP7dGizpthdTB34pPO145VjCj0=;
        b=su+Mqp47brDsFxc+Npf7VLoKwtKqXMjnEfdhRez5bFesQ9rH4Jx1wkUsFrhW/9Vb5H
         kvUmQ0JFpTFFHnVf7mTpPoWe1Zf7ckz/KogkJ9hPGLaF18su7aJmXnKTdt0cHZrMfKjT
         VQZJTy0NlHz/VQhXVFtYDxDStqqvBdOkctfKRUhb3x5kcTui6pE1vd+uIY8OOLcl23oy
         pO+ld7ARvZ3FgaBsvyN4vnUAWgoYAKiBAyH0Ut8ahxRsxvNFCSBoHNf0qrNV8t1YtVFl
         rGILsaO+TQExJZ+Z9e/whqXTG4ys6srTWZ7452X0XwNRo5K5RgXpqc6lGeozDFz0qUkF
         Pl7Q==
X-Forwarded-Encrypted: i=1; AL+hErE6q157ouP6Y4hWzBoVbX3vI1v9boaBt/6WiDBwu5QfDr+i93u6OhjC485zmFWNYllFkJfQRtI+aX9SKGw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+brASqX3JeptvhUqF6pQwWoy1GR94+D2/x9Ndu/mXRE3LoFxFW
	Cl/BvWiaKNJVhWoXQljmBRPVPgA6lO7xyLUJttjIX7QqtNWEokNujgzRJdQ+bsfi80cPXCKPh+3
	nfRVnkkTJFbjqywlr7YbIuF7p3SzZTaM=
X-Gm-Gg: AZFdTZe5Kq2DwHWlLOG54QmyBYj0W4V2//zzdsNSZGjWm5UkXAifBNaMZ29df3aLtfK
	eIZS+qec6ZIaFA1JirfuVXL5xoYy00B9PuuF+DNOAu3WweG9TZd8G5hQd6T4WmbbdiJJeysQUV2
	0ZCzlz7VMCIY38nmsMwrmeogjrxCu0qBUk4f93QfWZPA6Naun0h7UPXGgQjesGEFnLqb215pz6b
	wnPLMVdVVOPUfdAm9prCOelguLcDHhgaBdKwStIQa8TsAZTMTHTEdD/3kY2QcsLX5fRXJzip4B9
	wFM+PBXpHhPyaZ4ANdzQbBJBhy8CtlwMQUb7d6Z9i1uq0VIvqJ9EJ0kkQq41m80Hm3woEqF+Wyk
	Tr7oqf7nAFjwuPxG06+epf6grYsWKMPZYUSyW0GSBzOXXoEic2oWMhwGIgMX6C9TLkgHdM1o3
X-Received: by 2002:a05:690e:4086:b0:67d:ac2d:d80c with SMTP id
 956f58d0204a3-67df42b59damr2470765d50.4.1795285777648; Sat, 21 Nov 2026
 10:29:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <bc42ae96-dc7e-4b6e-b9cc-64cde5dc51ce@yahoo.com>
 <729eeb67-d812-4f1d-81e2-4f4437181744@yahoo.com> <CAK+kzgzzcGPWVoXQ=VKFeojk+-=9S_mWBhMdcN44M9QXkihn-g@mail.gmail.com>
 <c848fe82-a534-410b-80a6-8d7fb35ab0ae@yahoo.com>
In-Reply-To: <c848fe82-a534-410b-80a6-8d7fb35ab0ae@yahoo.com>
From: Gustavo Foletto Mora <gusfmora@gmail.com>
Date: Sat, 21 Nov 2026 15:29:26 -0300
X-Gm-Features: Aa3M54rpFSxZ7uu4Nu8kwXj4vOO1ZNNEv44XG4NuzhczSlabI7eoqMHvRg-6wHQ
Message-ID: <CAK+kzgxmgdFoBhzNhfxB29yS_Hz13LOm7rZvKb6fpyVKb8kwdw@mail.gmail.com>
Subject: Re: [PATCH net-next v12 13/13] net: dsa: realtek: rtl8365mb: add
 support for RTL8367S-VB
To: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Cc: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org, 
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, 
	linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	alvin.sipraga@analog.com, kuncy7@gmail.com, fabianotassotti@gmail.com, 
	gabonpivovich@gmail.com, contact@c127.dev, o.rempel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"

Hi Mieczyslaw,

On 21/11/2026 Mieczyslaw Nalewaj wrote:
> 1. Does a non-zero value written to 0x0851 on your board change
>    anything (PCP of untagged frames, or the register reading back)?

Not yet answered: on my test image the switch registers are read-only
from userspace (regmap debugfs) and CONFIG_DCB is not set, so nothing
writes 0x0851 other than the baseline's 0. It needs a test kernel that
allows debugfs writes; I will report back if I do that.

> 2. Does the Realtek API in your stock firmware have an 802.1p
>    remarking table (internal priority -> PCP, with a per-port
>    enable) for this chip, and at which registers?

Yes. The family D functions write the same registers as family C's
rtl8367c_setAsicRemarkingDot1p*():

- dal_rtl8367d_qos_1pRemarkEnable_set(): per-port enable, bit 12 of
  0x000E + 0x20 * port
- dal_rtl8367d_qos_1pRemark_set(): internal priority -> PCP, 0x1211
  for priorities 0-3 and 0x1212 for 4-7, 3 bits per priority at a
  4-bit stride
- dal_rtl8367d_qos_1pRemarkSrcSel_set(): the remark source, 0x09DF
  bit 2

dal_rtl8367d_qos_init() clears the per-port enable on every port.

One thing to keep in mind: the remark applies to every frame that
leaves the port tagged, not only to the untagged ones. If I read the
baseline's priority decision right (port priority only, weights
0001 0000 0000 0000 at 0x087b), every frame gets internal priority 1,
so an inverse table would also turn tagged PCP 5 into PCP 0, while
today tagged frames keep their PCP (1 and 5 measured). With an
apptrust that includes PCP, the inverse table would keep the tagged
PCPs and give untagged frames PCP 0. I have not tried any of this on
hardware.

Thanks,
Gustavo
