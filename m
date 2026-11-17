Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794937279;
	b=fgP4Y+wdg80QLED001tZRtxL5Sxni2mI31g2MsyZlWT33AXGXyMCChBIY19LfO94ueXS
	 x9SorCthXqB1WMoS2IcQScuuuyrgJOdNw19l5d7bLKNPIG0kMQtf35zXBeJnZtsBLG3Zq
	 5fQUkj6h2JHEj8icf3iVTkDIzb0qBy76iXVL0YCwOIEC4GhYHoRvqerthhg31SFhDhFBg
	 KWVYB3vYfZFuoMd8URjJOBL1RhVJX1KntHsir2Q9ykyzzjsBkMq07Amq5XwLji3ziMeEI
	 bda1DTSK1cFIFB2yTrWzioudlEevnMRRiNbltaQvUZA0aNLf1D/63XfjymUz+QVE+Rg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937279;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1tLP92r2JJjV3xpeaFg224oQEoqeTk5oJyjAMWmIK68=;
	b=LakVHZbnTjh9U5TL3IBWjmZot24v/2+HNfoRjKOMiiLxV5kVYj/tdqE+BMlDnlRCxUXW
	 SFwy8XmcoUQF3WgR1KXn6zPjPQ3c0qI/QKhEg8ZJ2ud+ulSij/K0QP1Sg5Sdzf693XUQG
	 w7KVbak/vGmwLNH0b/+lxpxgrvADnDfUu+xR87bA+Ijn1lHoPPNaxV8LtxaGdgNxZtOyo
	 hEc9SDuVhv26QEBcmT/HbKDcGhStp0SVKAbN6IX5r0uSvayoo9KfpnEs4PaZaQt9W99Sp
	 iaF25Ni6FbPymc7uDuN7OdzUE5XuZsHlG3jKWf/YQSz7os5OkzsMsv0VLGFWs2+xLJg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eaU0A7V8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7386D606A337
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:41:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7386D606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eaU0A7V8
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b4d07494b0so15369397b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:41:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794937278; cv=none;
        d=google.com; s=arc-20260327;
        b=GHZSUS2KnUxDXKHX6NEp9QM7gjqPXHFFdKRIuqq5qeyHinQvNoFvJzmXhR+dwZ87jv
         vnRHp0lqxU+PC+tCnqZ/Xfry9CSw0Lo2fE1m4AsQIYi7tbt3mU9NFfa+NuPmTAaOhLMD
         H4LZ6lhQpYYzQQoPjbfMkjOW2MK3HOq4OengE32QeF6lKlJw/kWez+cF22UzrQJccZxe
         fog/1p/z7jCAwVAcnM5QxVpPrXpTqHhc9+y/HI1GBGORvaRYACxTfFfJyE4z9RL7jpgg
         UD5yfULrnYZ9g+3fmCdCbYmw5CfA4SmuqXLzj3yYOE+VYOvkPKA+lENfvq54ayMJOkJe
         2ICg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1tLP92r2JJjV3xpeaFg224oQEoqeTk5oJyjAMWmIK68=;
        fh=sNMU3mdX5gceAd5NWUuMxA3qglg8l91G8VXbUMvN1wc=;
        b=BSeGRTth5HbCoAG5U+MSzU4jKbkG4l+FJ/PMTEPJmUpBY+gOC3NvePqJxD5NUanl4W
         yUuwrUQLfPENPnFKxIQIxAxRI/7FtPtT0I6Ou7D/XiPOYnu5cRSZtl8o9VBszktgqQYg
         qqe37IDKz5hBEWp3+6wgLiz5R370Z1MuD27QUNfZ/y/4LaV5A15Hqx/vUERTWMFaSm3F
         FPIqyA54NW4+ZO46W2Xo3R4MaD1FGEY4SS6PQshrWYROr6Mkj4Zc0E2jU4rR9iu+2ZZl
         EegpajspTHGlO3GnZz4kV8FLUj3/TOgmZH3poiLze4QJ2/KVyfNm/UMtg+M+PBtcSR3o
         q04A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794937278; x=1795542078; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1tLP92r2JJjV3xpeaFg224oQEoqeTk5oJyjAMWmIK68=;
        b=eaU0A7V8tK+Ilu+9z/UGX7RdDsNwdlMfm8BewaD1pnna0CsJoSPekMI1YyKDcd+2PM
         Ci4z4WsH11AjVamY7wuimDqeq2RsyRObrOmNsGLqE5Bbcm2OwhAcOKz0Zw8EFGaZwkvE
         Kvxt/DN+Qm6PBW86LQLwTsjY12gDzMtu3i6XDsupP65b+BY/F+CGDN6OAHFKj+79PJE6
         52RAx5BQ109CqEMK38/rqPd8TVOB8TPBUXrIsq0thwUTfzYqTXssXpNBZcUlxogES5Fd
         tj8W7phSOn4aj3lxd9MPoiIj3opd+oWFYcHGl7K8lhcxMmH/kBynADd90IkkpMjEPclP
         VfVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937278; x=1795542078;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1tLP92r2JJjV3xpeaFg224oQEoqeTk5oJyjAMWmIK68=;
        b=uILjdcUn8lJcEY8dpBAd3FuTq0XQbUTNGC8whq325TpUxi1Otlplaeb3h0sp6Ho3vX
         EP76tDSXiK0oZa6/c4tI1huznfm0LpjH1vs4b0JnsDfhw2PRggy/PYE2dVTdiFdYlQq5
         1QBQ2U+cHcYfmTD3X5fBdQ/f/9v6es4RrDLUQBs9bLwErQcJf3pEs0sk/LZJFjT8N52b
         oADcJ4dNuqnznS/NFp3eIiwre35h7MC6pJyVhuH5Afrs6iGWxqXtlUWz77S65KbUf693
         70aJQCYPqnVsQWUYQJLHL9VP6xwl/HPOjx956MgD88M/A0U3QWgqws2W8MjPdA80rny2
         V5Ig==
X-Forwarded-Encrypted: i=1; AL+hErFWNl6+gJF5cQPIncbHq2rEDwdVWUPmjvQFWK7yhut6InTzWC0Q/SdIszMD2pHzJil/QATuHEMbchF8IPk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sMSWrK6Io10M+uSgztwaxhR7CuOXQeGeIEIA2UbXPFanq66Jq
	m8uzWp1MgVU0gW3RNmPSg2BuUIihfXxKA3lR/+wICA1Nn57/pQ5O1xsKIxKWZ9FwRl4MmuUTc8f
	EUXkVKEoSgM8yGufq+ek5HdBtoDvDgMU=
X-Gm-Gg: AZFdTZd/U7zWH6c9fA43EAZNlsNyd+tMBNNPTzv1z4nrM/76so18lgv4bPWz/bFUV3B
	kOZchnmwOtGEXHP8JwqI9yipcnOXHREJ7x7lKoDWdhehEqJvqRDiMN4oijoEpXTjzFPtMARnX6i
	P0WPSsqYV/GISUc0vMbvKcK7ZBMOyI4Rg7ztLcTC5bAwqIwWwqoqGV/MAIGDcN28Z7svBo6qe/4
	pzFX8dvUxuB/CsOZZoZd6iwPwLfUCuXoX4Ym+pPSeWXu50VMX9FsqFtHnITfhIgfLQJTLT6LFkL
	ExHUfnYH2kNP0QxUmT4hYwLD0VhJEjfnWca8VAn9VgnM0Lnu9cFbR9sKCOD82gTrsNyOFVwMaIW
	jk7Hc1YRokO1QFyKk6ZY8L2SuKY5ahGt1NiYA+NyMJ1bVNNIPSWyhdVjuaY+Zg/d+ZQ67pw2A/d
	LqgbqsiFs3M/MNaLSP
X-Received: by 2002:a05:690e:814:20b0:67c:7317:de9a with SMTP id
 956f58d0204a3-67dd3fcbefamr95689d50.43.1794937278391; Tue, 17 Nov 2026
 09:41:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116173307.14169-1-volodymyrchapman@gmail.com> <avwmPmzohY3BCwrI@ashevche-desk.local>
In-Reply-To: <avwmPmzohY3BCwrI@ashevche-desk.local>
From: Volodymyr Chapman <volodymyrchapman@gmail.com>
Date: Tue, 17 Nov 2026 17:41:07 +0000
X-Gm-Features: Aa3M54p8jFkXOh9LYokUtAIAcha5-QcguW5hVoJ7lYeF7_rN5Mza3f_HdmKjLCY
Message-ID: <CAN1s30ri4XsBjt6sos9pcrhPb2wch-m7fQhYaMJKTWYZxFJedQ@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: csi2-bridge: Don't cycle the PMC clock if
 its rate is correct
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

> Besides below paragraphs (that I removed) needs to be in the comment bloc=
k and
> not in the commit message, please coordinate with other folk(s) who are d=
oing
> the same
>
> https://lore.kernel.org/b4-sent/20261112-atomisp-pmc-clk-rate-v1-1-d6b3ef=
392ccf@gmail.com/

Thank you for the pointer, I had missed Manuel's patch. It is the same
change, which I found independently on a Bay Trail ThinkPad 10 with an
IMX175. Since his came first, I will drop mine and test his patch on the
ThinkPad 10 instead, replying on his thread with the results.

Thanks,
Volodymyr

On Tue, Nov 17, 2026 at 10:02=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Mon, Nov 16, 2026 at 05:33:06PM +0000, Volodymyr Chapman wrote:
> > atomisp_csi2_set_pmc_clk_freq() enables and disables the sensor's PMC
> > platform clock to be able to change its rate to 19.2 MHz. ACPI however
> > also controls this clock, through the CLKx power resource in the sensor=
's
> > _PR0, and caches the state of that power resource. When ACPI has alread=
y
> > turned the clock on, the clk_disable_unprepare() turns it off underneat=
h
> > ACPI. ACPI keeps considering the clock to be on, so a following power-o=
n
> > of the sensor does not run the clock's _ON method and the sensor does
> > not respond on I2C.
> >
> > On a Lenovo ThinkPad 10 (20C3) with an IMX175 rear sensor this makes th=
e
> > sensor's probe fail intermittently, depending on probe ordering:
> >
> >   atomisp-isp2 0000:00:03.0: Found supported sensor INTCF1A:00
> >   imx175 i2c-INTCF1A:00: Error reading reg 0x0000: -121
> >   imx175 i2c-INTCF1A:00: probe with driver imx175 failed with error -12=
1
> >
> > The effect of the clock cycle was also reproduced directly: with the
> > sensor powered through ACPI, a single clk_prepare_enable() +
> > clk_disable_unprepare() of pmc_plt_clk_0 makes it stop responding.
> >
> > Only cycle the clock to change its rate when it does not already run at
> > 19.2 MHz. The DSDT's CLKx._ON methods on this machine already select th=
e
> > 19.2 MHz PLL.
> >
> > As a side effect, a clock which the firmware left enabled at 19.2 MHz i=
s
> > no longer turned off by atomisp_csi2_set_pmc_clk_freq(). It is turned o=
ff
> > when ACPI powers down the sensor, e.g. when the sensor driver
> > runtime-suspends it.
>
> Besides below paragraphs (that I removed) needs to be in the comment bloc=
k and
> not in the commit message, please coordinate with other folk(s) who are d=
oing
> the same
>
> https://lore.kernel.org/b4-sent/20261112-atomisp-pmc-clk-rate-v1-1-d6b3ef=
392ccf@gmail.com/
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
