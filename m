Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795612923;
	b=xJOXs5LnNHQTSLEt1zKRY00MCYPovvcGgYwjMT0lHu4kb2NoKAiFHSGf1fKCvZP1sxFH
	 2Hli/VmMkS9yTsZ3NyZFz35YuF+v2kTbN8I8Ku/5vc1foHWj0AUiMOAIY/3tkRNChzkil
	 WAmipXQnCP+mLiND7Jju/xASw+Y7joidE803vpZcM+xt4Qb2c/uvg/aRbSTb31ggOJxBo
	 Fix4fgocpaTJX97JZiMSaHcBFAmFpowYoqMp2ryT9vV5HhFR7X88c3HNuvlEsSE7eRFTL
	 vUTPzjJHD8AJFpYmUPVNl3d4tA7iYG0SakIy8M07I522iqxlBDXQyDoFYMKFORbSJuQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=i9r9UPtioq2obgdZhRICZquaiNExWv3cUxSGfBwpneI=;
	b=PvbW8tNh+F1c0RR8Vu1twD1yBQKO39HahBXfFUGGu2ARGQVhx9pE2gZpBBMTgv47RgEY
	 hL1zicAyt3Elud3EMJbi70KZdhTnkwE/89sFBPtzaB5T2DxRl3Z6XMny6391df4q+nxu8
	 vYeAJaERs0EMdj81Zn5heQdRFQPGwEq6K3Fxnsgs/YueKm60bvNK/cTR3WnBErFyWvQce
	 E9krj09QKa5zlo9I3izVPl0co6kh9BOXo2c6p9qzfQ72j1NnrwyxRiXtLAKAupEMMLZ4X
	 bjDtwcrdy1W7ZZOLTBqW45iVkD9JDMTXpVR+XKjs6DlBFBfYpyfBbfkeFEZOueIX6vA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=opSEdQTb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC452606A327
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:22:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC452606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=opSEdQTb
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4a3e706b5dfso3606016f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:22:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795612921; cv=none;
        d=google.com; s=arc-20260327;
        b=XVXGufpkSCHiHh+UmlQ29Z6xgc/LktFk277adUMhTqyFRxR8wIX31SlDdtn33SDSxp
         kVkfgaX7mfPY3w4NAxIlkfj5yD6ptDP6HiFj5Nn6peJ7MVTJ9ErbBBWlHzoGOPWkf//p
         95N6jybmt2q3a+T12zycbJhlhuwQi5ibyGwrWX1e6dgIoiTWb7Arijl1tKYIW3xmXirl
         wgmO41HKmrb1GClyldrmfzTEC4nh5KeoDPWX6HSh+Y8TTrCk0FRusUr1gwSUMR4b1c1b
         g3/OMOVwp3WLRNrEvzgV5U6wfpPpQnsyW41LBYWrx2uQxH3VlN8SDmHPZbeL3lLKRFXo
         C84A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i9r9UPtioq2obgdZhRICZquaiNExWv3cUxSGfBwpneI=;
        fh=0K7N4byvlArgwvsUMjfpeFgo9eTfRTk9EIr4lKzHIHo=;
        b=QVRVI8s7Dj8o0hXPPePGOA5hg/1eT5P4R/HNZs+gfKHgnl/7is6QBJ7VEJ3lhLsGsw
         fe5UwALrXw4yov8yfZSMrmC9c0CtpN9jCWdOOYfs6mf+TW/6UZwU3T9eNbXifikvm/Ba
         9mzYYi+yax4HjKOmPG8gD+emCm9ybUoQIS6bqJsLAhNkIe35rDc9yhNUtPSZoGDZnlmS
         iIxLQUGQvuhuszJAOc/yWN7Huy0UL0p7b1nWf/N86i/hHUamoLwt1sqn29rlBECXJcj1
         9SsuWcfY6CiFXC0A2Pk0am4v19pDLjfsM0tbjsMJ+h3vbVxev+R5a+yesPiQL1RKBWf1
         aDuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795612921; x=1796217721; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i9r9UPtioq2obgdZhRICZquaiNExWv3cUxSGfBwpneI=;
        b=opSEdQTbB7rgsyjJ9BhIF9Grz8b8sB9R9IGgbDOXEPXF6u8P9tys2nt82Xr1hix9Lb
         8r1U84bKZE3IfywQtRNjB6DXi365U3bKGvDwwm6VW3FzLWLZUURNvYxRxaOrBsSaAF3b
         kmNDGoTQEXpo/V/DeQYIVVeUTpl3WNO658iG8xcNyiddyqdPNjTz39B9yYIzXeV9jOM1
         eBgDDjK+4rWvtPTrY/fZ34EkLwKoOeNSLrjB4uf8ZmRWmAtbyI2zBNE4I2XxCCfPgGWW
         M+VtL2OnG2s5Qyj9fFaREcdfCGYPh0zITb0diJNUfQQN76e9tViR2JTBDY23vcp7hYjZ
         BOnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612921; x=1796217721;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i9r9UPtioq2obgdZhRICZquaiNExWv3cUxSGfBwpneI=;
        b=oVP36rVZs36/YArokXnArenfgnSjWyD+PD+Ejqc1bv3rzLzQJPZZAyLphpybB+S3Nr
         Ky3XfQjrr3KkI1DoIqbiTFIg8OZXGLsHcbtFWm4xyOouKPDVZFckCsBclvoia+sXn6r1
         8xyY1TApI3cZPO4fp/u7KigHYosniMj2LDeJbyxtqnfHCISXcwOm2STZOUCfMZjFcw0W
         E/fGgFq8s9qeh+hw00pZXW6jz70CBsmTeHiDRLFn/I3+tH60SzwcfQUH4Z9mL8ONDRxl
         df0s3urgLp08FaMbcKEHW+wSdCiY//FNrq7MYux+sj/Ji7a7F2uFJdY0A+xXJDe0aIr5
         i09Q==
X-Forwarded-Encrypted: i=1; AL+hErGx5G6TTMKjGxd6hdaIZTK1rzRFJ37UqNtke967nzM/KMMKB1AP4GEGGWw+t2ShSlWv/c80a8WDQo3MZmY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6DAsJWZttWj0Oxbyy08cHmGLqRuRJgWG5QTkXgTi+YsHtVWxj
	mg9H/XWoRNqIkHztFVVaqx2nR+VSYV1UnNKAaLKsULT0+cy6E4hO4N+K7cxRQTHHfGNzC5+gIA/
	luDnMumAxM0ZCsHOMEOpXmgFon25mCeU=
X-Gm-Gg: AZFdTZeTr6AdZ5CcpGe/iFTQLoLYaGt+mR1GFdfMUwf51x8DBGa/tHhrdNTnIxCIUOz
	OueWiU6Dp/RRI3gsKw0H2Ypj9fVPWLJ5qcGsyHznUhMFTjUUJV15JLObyaoreItZWi8QfOvfH8n
	ziHDsAhCna9Fl7BNJ5QkE0xlgP+Fsmy3dAEv3CDJyc5ugnxJQF0coZKFP29pv/Yr4kXdiBKI8hs
	uEXfbyLFpbCQX7vrriA32NsP9L0dkNBvjV2NaJvG804ZinNai7/4Xdh7szSJrFwRk++sUi5ste4
	EDmDlJMm8vuYOz6ibUIsrNEoxv/ePF6MuzVXJ0O4LfQ0MwOuQwGIfo3YSadquv7h5HBPOuYCQtQ
	QhmCLhhdscABIMgsbeyjQq61Esp/rkIVjTRb5KDdP4K9vehKIjuzmeKn4NvEz
X-Received: by 2002:a05:6000:490f:b0:492:a72:9303 with SMTP id
 ffacd0b85a97d-4abb47b242fmr34560131f8f.22.1795612920985; Wed, 25 Nov 2026
 05:22:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125-upboard-pinctrl-add-intc1057-intc105e-support-v2-0-c8079f8f569f@gmail.com>
 <20261125-upboard-pinctrl-add-intc1057-intc105e-support-v2-4-c8079f8f569f@gmail.com>
 <awXJ3Ki8i9b-Kokp@ashevche-desk.local>
In-Reply-To: <awXJ3Ki8i9b-Kokp@ashevche-desk.local>
From: GaryWang <is0124@gmail.com>
Date: Wed, 25 Nov 2026 21:21:49 +0800
X-Gm-Features: Aa3M54p0xO3lEZyqglSCQSV8T77pe3-rwZ_B8_WgOtklEC3zCzvHR5oUtvb-Z6A
Message-ID: <CANYHO6pSi9G9N38+mh5610XcHATV0otOr+6rJfiW=kNEyy5sVQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] pinctrl: upboard: fix I2C pinmux-select set CPLD
 GPIO OUT not function mode
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Thomas Richard <thomas.richard@bootlin.com>, 
	Daniele Cleri <danielecleri@aaeon.eu>, JunYingLai <junyinglai@aaeon.com.tw>, 
	Louis Chen <louischen@aaeon.com.tw>, BillyChou <BillyChou@aaeon.com.tw>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 1:31=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Nov 25, 2026 at 01:10:38AM +0800, Gary Wang wrote:
> > The CPLD I2C pin mode setting through pinmux-select is not correct.
> > Should be set UPBOARD_PIN_MODE_FUNCTION on AANT0F04 devices.
>
> > CC: stable@vger.kernel.org
>
> I already mentioned that it's better to use 'Cc: ...'.
Noticed!
>
> > Fixes: dca2f73cf19f ("pinctrl: Add pin controller driver for AAEON UP b=
oards")
> >
>
> No blank lines in the tag block.
OK.
>
> > Signed-off-by: Gary Wang <is0124@gmail.com>
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
