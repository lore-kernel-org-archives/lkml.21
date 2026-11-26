Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795700027;
	b=oBsVw0TUQ77PCcA8wQJcsuksS+rmRNlX0O4wTcU3fm4fxq9yk97rZy0tOHkWwhA9Wfmy
	 ING/SilvCeSUXYriw1JTlyvxvfN4RopFSnw8w2rvNOHtMQxntmcplquZ3VRKj2qg7BSuy
	 O7Vx4cPLw4J+hwn6j4qNmz7fTixjA3VQOFpT/t09XWYV6KLjQtZgb2rDRGMry3pp5vzxb
	 ant6Lk5GPhcGI2UaxefxLx7ls6EejdoWRpspSH1Ws2EaPh1W+X3qfWGjEqnuBwVP3jFFF
	 GhIDfzPHK3kUkxIThXQqbS5+vIMQNPglGNd1b5uy8gQjq4p6lzTttHUCzMiYdWXg7MQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795700027;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=o+w9na3Dm0iXLiV6eN1IleBLsYb9pJlb3dPAHei8oVU=;
	b=gT4oVfhJdr2UjmpT682M5opp0KW3ZWUIdopGysShj4399wL2Dsb9IN5BIHoSwAdIZR52
	 8sCsMvn8X5yg8qClBGQDISWA0+7S9sOYHtF2hIBR8bQcsqs81+PqTyY3/kcloVIZYUOYQ
	 gNrncdgPYpUH6oj5xQQx4w662XM3EiIrPn6dxL3VNpzA8Q/0D0hwTzYecN1KXsUV6dah5
	 xX4sxvn++Lwu1bdYNR77zckfUQpNY7AjEFX2LMY3AyL4P0ab7qtu1qtqoanmKf8v3tm5f
	 CCoW1ip+Pp6weaKnBlGc/zsHlr9czh23rdy3nAAysH+m/LcEimKn964nWQpzP59BCAw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jwn8pR6v;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D025606A33A
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:33:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D025606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jwn8pR6v
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b51389f58cso76021617b3.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:33:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795700025; cv=none;
        d=google.com; s=arc-20260327;
        b=nlJOKRM1pFHA3gGEE0YCXqErFd/0OiLPnTB8wqG6tVnVSBH6mNL1FXzFJzbQWQJAAQ
         54Bp7Nnv65W733jFUdGIkYQaRSYfhQerxgBWs0Nz3HWLSd+KoVEIGZIfb+qlpTFPlvxy
         swVXju/c2jUG+ur4iXoxtsHl3OTDy3WoFVoiZ7HF0eN1BebElEQUUHXkhwijUilJe6Jq
         jAIbWKAf5L6FGh3+nzg20IIDemVMvLfZ4Goi3y1j7OY9/gdwV2sXPf0GHRjLLIFOG4vK
         bctWnizbKMAepna+JAjf8qYT91/mbhW+Ey4ODxLsBjG7CWi9Dvcf4GaIioUe7IdKXSPC
         +1xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o+w9na3Dm0iXLiV6eN1IleBLsYb9pJlb3dPAHei8oVU=;
        fh=8ZwqFEZTlXeTL04NKc/ZMfxEJICZ5weN61J5KXcNGaA=;
        b=J8xrpIw79QQeJArC/BVzzsbD436TND+4p1yeFhC57byo1NjsEMW6AHjWLjWI6JJS3G
         SLDnqRC32xMVlUSi0JZe+s/LpBzy/CwAxM6tyCXMoFX6HixqvQxCd7XxSb7K+wCvpEEK
         1QmWhIfgvpWXtkbb+gu3WOY09UZAaEEJORb0goPZmLS3UHYUXBHyMZHsQaQVg56egT/J
         H3YJgQTRVo2Q3PPTGfGNJaaPGQ9lS/+EoZ2PDwePY1RA3IJQaVPzQMRf9VCsDgFlUhBX
         lCet7/zBaIvACt5J/L/V7hNPbghTzwota8jBcPtV4qxdAQ1cRWLU394YO5KJx18aNtGM
         R0tA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795700025; x=1796304825; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o+w9na3Dm0iXLiV6eN1IleBLsYb9pJlb3dPAHei8oVU=;
        b=Jwn8pR6vmsf+0mDrZth5acvw0IT6hXM1umTNJm9mxjOe4DAbFXZQtGiV7+XLKzIk2K
         V0yefDMeo7SzZWh7yVGW4JRg1vMHU6WykVNDQmI+VkOTgZ4girLRHZ/6Plzc5Wodx7XP
         mn9d8OvoqMlEgf0JKNU3NCXg4Z4fMUcHS3wpJirdCpz31PayP4jwh26KU41L6FdH2a7M
         RHWCx/XDbLCtoOZrcsZJS+DCbDdhhqe9E/16fXvybrHThRAP0JyWiyq2gdpJ6iMlpn9c
         kFruCn0EQ/PAPVE0gPqdnG7eYU6n2jOOPYSnyg5Bou+K3mXyVq1x2+GxdDp+GfPidFRf
         E4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795700025; x=1796304825;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o+w9na3Dm0iXLiV6eN1IleBLsYb9pJlb3dPAHei8oVU=;
        b=AOg/aLK7SjIlr7scs3d3maQcsM/fiXryiIXXA0jDiUPGqHg4Y4M9RbKZvo90So1kI5
         HXRhCWBO2HdHBRujQUjrSMBEqYesC64hIAP0jMl2vuApzVPINrJC5hhdYiuKEwLgjP6t
         s1BKebfxBvR+uSFLF1kHPlH1Y/1npsvcA0lkAqSc86Pw/avsGgvPyygy8l48zrunsC3h
         WZx1dJnL2gxVXsHw5yvFug2mN2aW/ppOID1MgH3ZYT4FiVCEvaqBrrjU2eYw17xq5WLy
         M2rkWY0kMQf60+PD4Y2bQjc7Ixvh+eD73QHegv1+e+2/DVmajdbuVrRTgitEP4m8Cuox
         kzKg==
X-Forwarded-Encrypted: i=1; AL+hErG3XLqVZgPqptaa1AwfASNSTGA/lJ40YKh63D4iDx1fp6OMwnrzQZlpHUkcjL1SoFOZeLW6IpN67v4j+2w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/RFJsQ60ynsiXiRNbjIWCw8aHblW9QCJ6Vs2XTvXv1NTvyKeVW
	IOSpvl7+O2Pm0Nt3adN4iZ/tFnsg5uQDGzSQgUnfohCDO1HldIQRIkot4y4ILhNVH2ZVq9oftQe
	UGAVCn4BpoT6uYc5LchZMoHZMxaWgQC0=
X-Gm-Gg: AZFdTZchcMGxKlldvQV4Q9r3u5kkC56kudGw3nS2d2m6UejswzVfMH4u+KZb/7khWBC
	Ke6qX1tsK/1ukpZQsCUu6Gqyg/Z+movFX9jR77DrKuLHv9+ip9Bwbb8o253A028rMtWezZYziTP
	Amu9tqgIJUEoMk0yebOIp6q8f96lTfH43A5eNB06h6aJorV1PpSxDWd80pBwq31QqIvyN4P7jcq
	9UTMBENOwJ9LSmM2z9i7kUEQSt28B+8CkDqCM0gGYGd0a7i2xChau9uVniVHRYW+fU7HKDbDOhV
	CaBEvsfmxxv47mF13ZK3hj8YsghhZuAChsKaCqeFhyw1Vga0I2uRc6DIhRChxI7Qxd4RYStaggT
	01b27zIoRFwJpHP7YTFyLxdIn3HVrVbVPRzncv6kem0xrDJjAWcBmIE2syod2FaRh/xkWBA==
X-Received: by 2002:a05:690c:6509:b0:8b4:d91e:cb44 with SMTP id
 00721157ae682-8b5205182e6mr76681007b3.99.1795700025331; Thu, 26 Nov 2026
 05:33:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125134013.2692510-1-congnt264@gmail.com> <179568529013.32537.1835646355373713109@kernel.org>
In-Reply-To: <179568529013.32537.1835646355373713109@kernel.org>
From: =?UTF-8?B?Tmd1eeG7hW4gQ8O0bmc=?= <congnt264@gmail.com>
Date: Thu, 26 Nov 2026 20:33:33 +0700
X-Gm-Features: Aa3M54risPbKGlw4_Lxp4z3wK17UbZAPBMa16CedsPvxgFPM1PhE07GpB9RQT-U
Message-ID: <CAJpJ=Gvs08=k-VAnAB1-DsB6a_kc9T5Mn4ooxfgyELQZH=Cs3Q@mail.gmail.com>
Subject: Re: [PATCH] leds: sgm3140: Put the child node reference on success
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Luca Weiss <luca@lucaweiss.eu>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 7:41=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
>
> On Wed, 25 Nov 2026, Cong Nguyen wrote:
>
> > sgm3140_probe() gets the LED child node with device_get_next_child_node=
(),
> > which returns it with its reference count raised. The error path puts t=
he
> > reference, but a successful probe returns before reaching that code, so=
 the
> > reference is never dropped. The v4l2 flash sub-device takes its own
> > reference on the node, and the LED class device only stores the pointer=
,
>
> As the commit message notes, devm_led_classdev_flash_register_ext()
> stores 'init_data->fwnode' in 'led_cdev->dev->fwnode' without taking a
> reference on it and led_classdev_unregister() subsequently calls
> fwnode_handle_put(led_cdev->dev->fwnode) when the device is removed.

Hi Lee,
I could not find that call. led_classdev_unregister() only stops
triggers and blinking, turns the LED off and calls device_unregister(),
and device_create_release() just does kfree(). The only
fwnode_handle_put() in led-class.c is in fwnode_led_get(), for the node
it looked up itself.

>
> So 'led_cdev->dev->fwnode' takes ownership of the caller's 'child_node'
> reference on successful registration.  Dropping 'child_node' here on the
> success path causes a reference underflow / use-after-free while the LED
> device is registered and a double-put on unbind.
>
> In fact, there is already a bug on the error path if v4l2_flash_init()
> fails after devm_led_classdev_flash_register_ext() has succeeded: 'goto
> err' drops 'child_node' once, and then devres teardown calls
> devm_led_classdev_release() -> led_classdev_unregister() which calls
> fwnode_handle_put() a second time!

v4l2_flash_init() takes its own reference on the node and puts it on
its error path, so the one 'goto err' drops is the probe's. Other
drivers drop their reference right after registering, for example
leds-lt3593:

    init_data.fwnode =3D child;
    ret =3D devm_led_classdev_register_ext(dev, &led_data->cdev, &init_data=
);
    fwnode_handle_put(child);

Is there a path I am missing?

Thanks,
Cong

>
> > so nothing else needs the probe's reference after probe returns.
> >
> > Put the reference before returning success.
> >
> > Fixes: cef8ec8cbd21 ("leds: add sgm3140 driver")
> > Signed-off-by: Cong Nguyen <congnt264@gmail.com>
> > ---
> >  drivers/leds/flash/leds-sgm3140.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/leds/flash/leds-sgm3140.c b/drivers/leds/flash/led=
s-sgm3140.c
> > index 107d02c3137f..5bc21b192d74 100644
> > --- a/drivers/leds/flash/leds-sgm3140.c
> > +++ b/drivers/leds/flash/leds-sgm3140.c
> > @@ -273,7 +273,8 @@ static int sgm3140_probe(struct platform_device *pd=
ev)
> >               goto err;
> >       }
> >
> > -     return ret;
> > +     fwnode_handle_put(child_node);
> > +     return 0;
> >
> >  err:
> >       fwnode_handle_put(child_node);
> > --
> > 2.25.1
> >
> >
>
> --
> Lee Jones
