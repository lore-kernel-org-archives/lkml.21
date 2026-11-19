Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795089376;
	b=khcN3L353eWZo2+whr9XKDWq6kvKSfQC5I5WrDIblNDxogJNQJRaTrYRkknrd/lAI9fW
	 B+C9UG2oQHla44wKujgzvqJXIErrC0nXZGnViVPYhk6cZpZrSsVtdxWWh3Q7lggNhX78e
	 5bn1WAlrSIrnRaunIwhOAoSDio5thfnHhk4Hj9coWKyflmlBK/wavSEGnacGxRLaG92lz
	 3maiyPyYengRpqx3Z3xgx46KnxQjPz0mc9kGExWRGJmhAsvXL9WU7FDwcNjfjl4WJfW01
	 93/NzOqzLKvvTa9UnUceoqF9pC/Vav140sSOHi67x0ZZfKWr/RUNKKrqn8tS8y9udXQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795089376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=RSQlhZLcdrbQFLEEra+ei00sOkbYZJ9sKIwJK+CMs6Y=;
	b=HwLEvD/J4w4nUMQ6AX2BWtSoVbHxR7rXXXcTICihkYbjTa6tI5Sh3kuCen02RCrO42dy
	 qb8Ha6TPAxP4/t1DkLoDLgRz0NJz90Wd8Bg6OyTFZwcFI78UrCMjUlvUhGPAAYvQ/vyvG
	 nsha6PiLRXwnkp05cCqVSQXCNP2/tmeBWnOCaqneFU7CKUVDVcG0GMpJ1Gd6yiLZN+S1g
	 pBFRBgqXgzMZJF8M+P2YH/q9/yIIynqwEBUA8Cql0WwTCIXAKXhaovesvSFffwXPw0z13
	 Y2Yh/JuRIzJxSYegan2UrFzkm9VWiRpnif5Qvs3Wehytq0F1sUvSuxSzaSajTUiNtWg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g+6GSTEr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC33606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:56:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAC33606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g+6GSTEr
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5be3dd6f636so154721e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:56:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795089374; cv=none;
        d=google.com; s=arc-20260327;
        b=kV5KyXrzm8xlmYiEOI6iwItEVCObU9/1uRxl+6stkWzfTBp/Igioqpd6knDHL63qDB
         Il3rOWbFVo9Ccg0kSi9Z3oGtdlNT0v2xmx7ORwWD3c4e49wSyq/LNAUNOPbx3arDiP+N
         iQEipCfZna1BcTRb8i4acFFUVKBOpzxzcToStt1Nr4WB+YDzvTHD9j6lwdEod4SLAXs5
         b2MWJYNhvT4JF25V9taca1FJz/+tcBN6pTAYjsyEt+kAZRfxqYjeuM/OUkhg9I9vlrca
         HEok7gkVjC/udJg6I41PedPvDPLBIUnooTWDey1eDfmDH5+37r+GMiltCdGdZC1+vGdq
         wWAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RSQlhZLcdrbQFLEEra+ei00sOkbYZJ9sKIwJK+CMs6Y=;
        fh=Pa+Flxpz+EDrYxGEFS0UpaXM9x1YzAutkzNXPn9IbPU=;
        b=CqdBMe1UhKSDhkQy6gG98YwymaD39/ciiPtIHFqmm4WnUgdS3iu6khf7/6C2O6x0kj
         RHPjqWodMF0kLmAkC+lOLxDKrIHs48DRz+bTWCqHe1CboGu/U49Qn9OZjCdXkj9orpi/
         o7az5HHZ3FMS7Y+/t26s1Ql3T4YVX9M247mAHRtdwNV66TezwN78UgcQNOXoU/81I4sE
         0Qpe/hcWPD5EgZ+BNaGYPb+YxrBTFG9YqGdk9gJZO3FdnQpP5DGohcXQ1ngKVTBX/6Z3
         Ii53jaDj6gXSvkVSX/nxEc9YMugWIfskCI1fuTqN6+iYHrnDszwhAY3LESYLxzsLM6mC
         wZBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795089374; x=1795694174; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RSQlhZLcdrbQFLEEra+ei00sOkbYZJ9sKIwJK+CMs6Y=;
        b=g+6GSTEr+iJNFmOLmfk7uLS37/b86Gu7Z5ix7ooEzeRSuoviZQITI3D0TtSiWFjooc
         3TC3gbtkPWsqbKm0dKyR8j5CblzmHyBXImHc1Y42ptIjNiM40XZr1v0ZEf2yIUzBo8P5
         rLgIYhjSpmkce3RtxFezrBEYrRaYGTFeVXBNugML+pEOaXMK5qnUFZICqMq67TCgZrbH
         uOmUue1J0ll4sCPyxDMxgrGnfsbsY6M48mlGNUtu2lgw7vfRWpJsIQB7yrR5O/A+Mb1K
         G0aS5Q6u/+v9trWYqyPWVLnHkSvqTOGNJVqDpD9LU0vO4WASRQwhVgwZi1DSYpZZl6qn
         4Erg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795089374; x=1795694174;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RSQlhZLcdrbQFLEEra+ei00sOkbYZJ9sKIwJK+CMs6Y=;
        b=fIws1qlKjbMUi+p6fXXKEGC2TPhi1KE+UDn4B2hYfDNpAH0+CTZv9+PWXvjZppMsIo
         6Q1UYIOMj4GlgOOKI/TivXBfN0Je6AJMjUE2qboAAbXoJkANOSdE7DxEA9D8HECKDsvj
         Hpgm4IyXr71iJELURq0vnmiEsH96T5Bc55jlgqZs2XazyRqge/1EH9/toL+GkJheaRxL
         zO801n2YiKHrbnDLAqOwXMGnjB5H/yvmJhBDkl8UbCGyoMQ/9JRoZ+WXZLruRUBufe8I
         V7agL1Ej/sdyhVj1K03JLaKGTeaSEEMMFlC7TS0Watn3adB6hMx8aLvVZmBCjQMwXc0c
         rQFg==
X-Forwarded-Encrypted: i=1; AL+hErGDXygNv32bLsF6mFB9LEDOGsAH8gpsLeCSkNDT6MVNv6dngMc5WyRMyIrBvLsecBLzq0D2LwKoVNxsmmg=@vger.kernel.org
X-Gm-Message-State: APuU4Z889faJFG3O/FK7Q+P9P2WWJ8zwNQu9a19ArkX+Cn3q9dKVxSGJ
	DkJyw2FiKcgzvARp6zUFMA0aU6c26DAfSIEPgrp5SEn4NLC3tQv9FIlemAbtozM1w805Ia3PhKN
	DAUZ6yesCvp8+pR517N0rUgVVIrkok+w=
X-Gm-Gg: AYBFou0/P2jNhjnleDPParJvOoNeywC8e21pKPre1MF8xO6ZLRnIcubnY8uR7l61WAr
	4gdhxO37FqwfskGlhuSuRhNmTvZOUUvQyTOVOcpjEHGzV8S72IDU1O9/5zv+a3sj/P66QOrgfSK
	GcunCxmRbuEoQgow4J77qD4wd2hG6vrn67BXGlZMeCkAm/7ZlAP4WtQGKtXUnnsAzUZVcRHHj+z
	KRqNfTOzjQIg36KwKtBfg9zjV8OmedqUFR0Sn+wYPACmzPJGDKc4EazVNp3/wTinWwh6oqP5pma
	hSgCI54SgG4s7P17C1cElCmRZBTJlVw5mQqzJT5FFGco0AO7jBnifEYTPA9j1GRC3wxDbzf4uC/
	fWI08eFu9lRUToofSKGL1A+4ZJRwv4wfpSZJPj16isNuuonLxS2Uj3NIFBkbekXsNXtSM9JyhfM
	IIqboVFgFwigryfryC9g==
X-Received: by 2002:a05:6512:ba9:b0:5bf:e6a1:3115 with SMTP id
 2adb3069b0e04-5c1a9bbdf96mr2564765e87.2.1795089373747; Thu, 19 Nov 2026
 03:56:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110070627.217946-1-inochiama@gmail.com> <20261113072305.220610-1-chenyou910331@gmail.com>
 <av2M-6w1u5mOyqDM@inochi.infowork>
In-Reply-To: <av2M-6w1u5mOyqDM@inochi.infowork>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Thu, 19 Nov 2026 19:56:01 +0800
X-Gm-Features: Aa3M54riNxFLUFg84fAOhmY6bjWZvKgiNBwAs9BSg1G7sMgZ9DPXd0hZVBFcQ9M
Message-ID: <CAKspUh+LLonm90ywMGrRUcsLDE+Axw64qjs0OtDB_ySUsrPPQw@mail.gmail.com>
Subject: Re: [PATCH 0/4] usb: dwc2: Add USB DRD support on CV1800 Series SoC
To: Inochi Amaoto <inochiama@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	chen.wang@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, hminas@synopsys.com, 
	gregkh@linuxfoundation.org, looong.bin@gmail.com, 
	dinguyen@opensource.altera.com, paulz@synopsys.com, balbi@ti.com, 
	dlan@gentoo.org, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 07:36:04PM +0800, Inochi Amaoto wrote:
> If there are no other bug in this patch. There should be no new
> version. The device probe problem is not a very big one. And I have
> no idea about these thing. Since my time is tight, you are free to
> send the fix for the device mode.

Thanks, I will work on it.

> It depends, if you accept setting this to host, I can add them
> at once. (Note: once set, no change will be accepted).

I would prefer peripheral as the default. The vendor kernel uses
device mode by default, and the bare Duo 256M is usually connected to
a PC over USB-C (RNDIS); host mode needs the IO board or an OTG
adapter.
If the "host" mode is used, it means that anyone wanting to use the
product would have to purchase an additional I/O board=E2=80=94that doesn't
seem like a very good option, does it?

Since the peripheral default only works once the boot role is fixed,
I will send the fix together with the Duo 256M DTS change (dr_mode =3D
"otg", usb-role-switch, role-switch-default-mode =3D "peripheral") as
one series on top of yours. Is that fine with you?

Regards,
Chen-Yu
