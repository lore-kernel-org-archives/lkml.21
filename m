Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795816506;
	b=OWcoLQj4L9kcSAu8zoFEs23mpJvujiqGwRhEenvtzbR8ivuicM4nO7VjX4RYQ0wamM5f
	 qCkj7R9XC66s3xbOWxKTzjp0XN9zZOHX4MBnjOvhiJqaCNhOLKAhKxpCLbKOEIMK3ZGEU
	 o1/eo02xOiygJKQ7JPcLvn6tgT8T3a41htSO/tUfGYNIujiwXwPKUx9wD5o29yxoq5qfz
	 7T05cO8e73etkzcbazeNrwFHKgR7Vm55FLNyS4KqQNxk9xmzNC9ADXI2xWjITXIquykKm
	 PFeV379kvkNQBdZQlLrUjKq2OhwpVBVkm9VmSBq5GUmCZGmvG08LCxGwh+X9yuVoFmQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795816506;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:In-Reply-To:References:MIME-Version:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5KFXhFrUkKWYUY9c8iRPWTw4G5iLt5Wu3CiyUP9i3fM=;
	b=M6JLA4QGYyD+ldCO8MtomqTV07alUPVXEXtVKyVL//WQb7JtLDgbMfislOOHdB2pPRMm
	 1kcSvcjV9MEQpb69Wmhqzc0nprHjBfFcPtYZ3IjegyeilyI5AudmK094udO5d6w3oAqdF
	 g+Uf4LRSdSBpX7V1eimQt2X0mvJaFeMU1bOBSOa42ORROFZgHDmIX1blTzhSdBJiEJWBP
	 sPZ5HBRRphlL9IY/wxIbWeb42jJLQSEMYaPKgvhL3DxEaMW7voYgaZMcl4T/6fu559tf+
	 NW24vSlQ9zvACUTGFex+uiVwD+Riax9AWTMRDlKm+mmQNEF1eBeyRlXaKGGTQAw8KCQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rq3FoQgg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.170
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C99C606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 21:55:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C99C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rq3FoQgg
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3ae25dcbd81so80155491fa.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:55:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795816504; cv=none;
        d=google.com; s=arc-20260327;
        b=YaVf213hQUGeSww3YS2slFMpd6wGoV9LXopTm+khcAcffyydafWazT8CjXIJ31XcK9
         mD1m2sI89hi9PHknFDc3SjcD/d5d6925Vy/xW+6waVN69Vu6O5Dqj7zsSpatYmwBRxEC
         vCLGu4SZ4slix0YksA+AEgc4aGFye3DWDl8ZxViYjTeJckWF3/g1gO4M8I2aFv8uHXAV
         zeGUqDGX8sH6scg4WV/XuMIuftcw6JlOTdR6RsjS76oK2PY/lG1HWVnvNlb3/EyHS/Gm
         mLy7ZIr5lggvcBISf41jqUyOVFb+HYNOVAaos1DssA+TqkCRrBBt6sG3n1gixvGsCeoi
         V6Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:references:in-reply-to:dkim-signature;
        bh=5KFXhFrUkKWYUY9c8iRPWTw4G5iLt5Wu3CiyUP9i3fM=;
        fh=gzd00BKPX+rH4kR0+olIJJNaLglPz6vnxKOQoxr4j18=;
        b=fnDGamQzFaWwH3XmOE9yD3VmI6sZ1lVtr6WHg93VxvcVDmXcXRtfVGANGga8g2rJlt
         6S5X/kl2C5rkrxMdmB8AToamNwh0I3Eo0gSoyt5vjG6YJr3YEuWHskrOFNxxjOBN23ja
         SvFhK4epqwIt0qLLH0/wmuzSSf4MB0afWM67QKbJATKpa+VOhX40FNsfVv1ZA5bUlLFT
         29ber+Gg0OJmLay5355w28c7YvFh2d9IgcGNIOGy54kAmDrxwLInycNYG2ZuGYEIp8ct
         gU5lWocTzfKETDrE4B454ugtMuTmKb0WLDLW6Rt6i7ClT7XQ9gBuS06nnizBZ2ttsWyc
         qsTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795816504; x=1796421304; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:references:in-reply-to:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5KFXhFrUkKWYUY9c8iRPWTw4G5iLt5Wu3CiyUP9i3fM=;
        b=rq3FoQgg5mkk3D0E8y0TgE7EQv4PVMi2xMkqs4MsZ2SiHajeo3oemTYNkBaJGLYVFt
         uEe57WGU6APFztYmZkhp3EM4uuNq9f6kwQp2KMAClS1iRWZViDFZJLmhFK8boBc/46iI
         JvutWlIT/hnKG6ZzMce8kdAuACxNFkfah78eKGEh78etX9ps70bgkpZA9DnsRWXSsAhj
         paQtFW3WpWNe8RddLso2Z7K9tgqZ4/u+p1wex1aLdeOU0xJf5IXj96+KM+UAVsaAVx/V
         EVZ/87CFDqqDAWseXdmFxOlyclno+N0EI/DxCUlkSX9WjPzWsWEqNNeRls9U5SMWkp6u
         AY5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795816504; x=1796421304;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:references:in-reply-to:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5KFXhFrUkKWYUY9c8iRPWTw4G5iLt5Wu3CiyUP9i3fM=;
        b=p4bBXmPZ+1qwrL7Q8qpaqhtoaCsjo+3Zj6eB4esm/NW0ZGKl+kWbQV53b3g1+eX29d
         G702buGZXGB4R4ppI0dHIADEbZyBIilh61b7GRVE33zeywrcnruVqdIBzqyZqUhq71Dc
         rj7zWGzj8GQkIJ5JTawSgGXsEyDrmRHkwzyXBI4/b99bcnLYALuS7w9kzPtkj8Zo051z
         +6Yu5mD3siY9oUHQ2y5BIWvf4F0TyUdsjXNyNfOaLRdJNJQAfcYKbV3pVlvaE0mY3YN0
         t9XMCvouhfHJr7OgfxJ9pEQKr4thAgcRzk91/VuYPJyqXb4s9vF4cQvo0HHPkj8rmfpW
         CLwg==
X-Forwarded-Encrypted: i=1; AL+hErGkPYMcfATTym3rC3dfizAjKpT49cP/RxkAfznKIarc4vxdgwIft72DxZlRh6OhRVA5UM3lh81hzcTN69U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bS44RI52MTJ8qyW5GkNAU1KH1SaMjNhBlb04XYYSmU/vvqQGa
	Qwl9Nf+kJ3W0lyCXONqh4DZiG74wzEZ7231YYdKveRsvikHiPr8RdB0cWUo+2k4hRuwyWw1v/u2
	4/VuhxVjF1kp2o+LFJC39IjskGgUNKJA=
X-Gm-Gg: AZFdTZdEBOhGRtVHbodmpcstBPQMcZ6yJ0cLz+Q5KUyLfSZ42IW18Sgz9vC+/UAi52v
	LDwOPuwysIBVczhOZISUKc+XiZWRVyJxOL/E97iOgiaVzuCWQLWijlXEYKnOYbb5lifUMLNKvT7
	pZ86ms5fPw8NgpVRDB/TREHVEZN4RT+MpULQBVHqycKAJdYmkrHZAltTJlXqabi3Qw9We+dt4pm
	C9l56tV7GO94TwYfHdiya+mNlkrE2Ufe0vO9wnMPdk6vKMuaV0kqd/G0cP3v/Lg5nvPXyd51nnE
	mW9m4A80ycDrYaXpKYBYRNMCNoWCQstxg6SBvURIHtIEEmfr1ssYrk00WNq1t7lGVcG+Y+xwEN6
	0VcMNdxVqEbJAs9CQVYkEox8Ryej+WCQkibs=
X-Received: by 2002:a05:651c:211e:b0:3a6:636b:63c5 with SMTP id
 38308e7fff4ca-3ae7fa38eafmr80396081fa.16.1795816503538; Fri, 27 Nov 2026
 13:55:03 -0800 (PST)
Received: from 1087654160852 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 27 Nov 2026 16:55:02 -0500
Received: from 1087654160852 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 27 Nov 2026 16:53:51 -0500
In-Reply-To: <20261127211653.1675314-1-antoine.pichot@gmail.com>
References: <20261127-ov7251-strobe-ncont-v1-0-cefa8c6c020b@gmail.com> <20261127211653.1675314-1-antoine.pichot@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Robert IJtsma <robertijtsma@gmail.com>
Date: Fri, 27 Nov 2026 16:55:02 -0500
X-Gm-Features: Aa3M54r0v4V6UhWiGoC2eAm-dxa1zgGNQ51lfx17j2cp3gUYYJZCIvZp4Wageko
Message-ID: <CAPcTEm9kJwZw2_i06e_vp+hH_KMNO0nP4x57ZEuhebDJ84aC3g@mail.gmail.com>
Subject: Re: [PATCH 0/4] media: i2c: ov7251: runtime PM, non-continuous MIPI
 clock, and strobe OE
To: Antoine Pichot <antoine.pichot@gmail.com>, Robert Ijtsma <robertijtsma@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
	Jacopo Mondi <jacopo@jmondi.org>, Todor Tomov <todor.too@gmail.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Antoine,

On Sat, Nov 28, 2026 at 06:16:53AM +0900, Antoine Pichot wrote:
> Your patch 4 adds the same control as patch 8 of my ov7251 series, whose
> v3 went to this list on 13 Nov:
> https://lore.kernel.org/linux-media/20261113024059.1087031-1-antoine.pich=
ot@gmail.com/
>
> Mine drives the same STROBE pin, for the infrared emitter of the
> Surface Book 2 and Surface Pro 7 and 7+, and its
> V4L2_CID_FLASH_STROBE_OE is off by default too. The main differences:
>
> - The pulse follows the exposure, from 52 to 776 lines as the Windows
>   driver clamps it, and never more than 45% of the frame. A fixed
>   512-line pulse lights about 60% of each frame at 60 fps and 90% at
>   90 fps.
> - It lights alternate frames (pattern 0xaa), as Windows Hello does, so
>   the dark frames give the ambient light reference.
>
> Could you please try my series on the Surface Pro X? It has only been
> tested on Intel camera interfaces (IPU3, IPU4 and IPU6), so a Tested-by
> from your Qualcomm SC8180X would show that it does not depend on the
> platform. If the Pro X needs every frame lit, I can add a control for
> it. Patch 8 depends on patches 5 to 7.

Thanks for the pointer! I missed your v3 series on the list =E2=80=94 your
exposure-clamped strobe span and 45% duty-cycle cap are much cleaner
than a fixed 512-line pulse.

I just built and tested patches 1-8 of your v3 series on the Microsoft
Surface Pro X SQ2 (Qualcomm SC8180X, CAMSS CSIPHY3 -> CSID3 -> VFE3 RDI0,
OV7251 rev 7 / 1F at 0x60, 19.2 MHz xclk, 240 MHz link frequency,
with non-continuous MIPI clock gating enabled on 0x4800 for Qualcomm
CSIPHY):

- orientation (Front) and rotation (0) parse cleanly from Devicetree.
- With strobe_output_enable=3D0 at 30 fps (640x480 Y10, exposure=3D550,
  gain=3D32), dark baseline mean is ~16.8 / 1023 across all frames.
- With strobe_output_enable=3D1, alternate frames (0xaa) light cleanly
  from frame 0 with zero bleed into dark frames across all three modes,
  including back-to-back stream restarts and mode switches:
  - 30.00 fps: lit ~193.5, dark ~16.8
  - 60.14 fps: lit ~80.3,  dark ~16.5 (45% duty cap active)
  - 90.43 fps: lit ~58.6,  dark ~16.7 (45% duty cap active)
- Howdy's dark_threshold skips the unlit frames automatically, so no
  extra all-frames control is needed for Surface Pro X.

Feel free to add for patches 1-8:

Tested-by: Robert Ijtsma <robertijtsma@gmail.com> # Surface Pro X SQ2 (SC81=
80X)

> Your patches 2 to 4 conflict with mine, mostly because my patch 5
> converts ov7251_s_stream() and the driver's lock to the sub-device
> active state, so one of the two series will need a rebase. Your patch
> 1 applies on top of mine, but my patch 7 moves the common registers
> into the global init table, right after the software reset, so your
> wait would then come after those writes instead of before them.

Agreed =E2=80=94 I have dropped my patch 4 in favor of your patch 8 and reb=
ased
the remaining three patches on top of your v3 series for my v2:

1. Issue 0x0103 =3D 0x01 explicitly in ov7251_set_power_on() and wait
   5-10 ms before writing ov7251_global_init_setting[] (good catch!).
2. Use pm_runtime_mark_last_busy() + pm_runtime_put_autosuspend() in
   ov7251_s_ctrl() and ov7251_s_stream() so the 1000 ms autosuspend
   window is actually honored across stream restarts (which also lets
   your patch 7 keep the common registers alive in software standby
   between streams).
3. Support V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK on 0x4800 during power-on.

I will post that 3-patch v2 with Based-on pointing to your v3 series.

Best regards,
Robert
