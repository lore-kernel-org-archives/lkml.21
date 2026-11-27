Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.128.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795764182;
	b=hc+GJI3RlGt5Pr4mP0/yTxNpXIX91jrwHYXYVLHN/eZot6AWDLanlILwVQ5eH/fySKCf
	 qXZPhT2dMtiKjeqFnmh/UMMIdeE1K4A9T524KrIGhHPmXF8MBQcDDPbuUJ5+IjEKAs9y9
	 BiUyNfKRmfJQniKi6/IW9rqQ6P5Y4zbDifYAtrn06doQ7PoU90VGL3Xc2pBSwAywXxEHy
	 TLPEaE08rIkoLiftRWmq0luRO7zhQh/VUGNEt+33HSZ+D1yJ3dtsUirKPPcrB6RwJ5nTL
	 shVaulcncSddlp/8Qv/kjlybgTdyYb847fAWwzPgG+zN5olqOcTCDpXcwQ4qvWdyiEw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795764182;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VLfsUTc/xIIGcS2lGfOPKhhQYlDo+fkS6wrUcxdmCtY=;
	b=4lQC7EEwqgrr1wmNYo0Cc3pd7wf1ZYN2k2CGXVcV+7wXg7hHE9v4th5VhhkW/y726C84
	 D6EWcXWmlaDsEukOukGCujVM6YpCwmI5Mcn2k3WACL1sdmCxtiVq0BcmS+/x+PxQGnfcC
	 JMBuqtjrZ5dve5g+6X7kTO6zMS1n5P4xYUHssG/ja2YSAQRziZvLF873DGOTyU6dEIJEY
	 tABhNQbqExxMVApVFbopvId9mcJKyp/u/ZUqVS8Oh5uPtD44PQyA9YkL3As5Y4705OLtV
	 w9HmA12WZaKV5+ayIAPTEObEWgW16Eaz4uB0npIDtiHmBJQ2W49Ik2Zd9czthE55vWQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=neYs5dWv;
	arc=fail smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DA9606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:23:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11DA9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=neYs5dWv
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b4d26094beso66606437b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 23:23:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795764181; cv=none;
        d=google.com; s=arc-20260327;
        b=UOeGPl/aE1O0Ds+BQnlgpIClRkzp+z9IzYOUidNOtvQzXj7rvG+59q0esQdilpOKWV
         ZgbHJG0nWUKDKwyrSJ20q5Ge2lV3TOeidBSZQbH8eYdWYiXCWdt7mDoFXnGGVDAozQfL
         vcOZPVuiDVGwG3kUgVcI2rMAAP2bl6rL7LkX3vdFCC36VRKh+O6rWoj5MYT3JeOnvkpC
         y61a2MFneiTm1gDmHFSEzhQAXVnD69l2HvgtIhiHQHKGGG++7SSqzRVqkH8myjG/XWHs
         mGO3TW44jyyraiqFxTKKjwzeGbyKcVZvk8aOhn1/jKabX7BQoHsF6DZWDrISNfEgNkDP
         OZVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VLfsUTc/xIIGcS2lGfOPKhhQYlDo+fkS6wrUcxdmCtY=;
        fh=jHZXva7LIrKZPt00XyO+1rq2qiVzYCqZ/pmln8FtLCg=;
        b=S8iJ2rFs+Zz0ePBXn+tATIwL5brLE/G7rJnPuOezs9dvfTZIMItq0SG6OnYleqUAAs
         yhYq2kYY+hIyvrYWSbhbL17/41Uuv2glnctjav9PjAVsl15VW6tNeNKSeeAbmETrFqbA
         w0+mbXQf8Xd0HgcyrWDaT+anLn7rgTqS4YDgsTJbpuO3bAH3p/FZxQbX9XgxixKXXAPm
         jZkg/hLpG4Z1MkLo6X/tGP9f5xgZa3xiir4UmmlYZkgXXmLxur9N48EBOlEkCZttgVsH
         LCddUkNjEDKJmkKYCk/yOF9kpB63ICLlUbChRGUpJdQDwBmGJwfyOjT9xlLJ7XIPTqg9
         /fFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795764181; x=1796368981; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VLfsUTc/xIIGcS2lGfOPKhhQYlDo+fkS6wrUcxdmCtY=;
        b=neYs5dWvIkhyceXNTWpr45WICKbLJ3LRLu2T2jIZlym0FyYvD4P9qqqMwPA7sVvUha
         3skkYU4DTwCqdTJ+1iBCe3is0TK40VhxTxrrDpUIhZe8lORuKBUasT8Zzs7CE/fwknNR
         3c1mHtHr7RsCZCbpW2H09xSJNpkZQUjeyzIN7vflSoK8b5WT9NScOo0lpDvrb6JHelgR
         pwu6ZUAl9GiWBi5xy0TcSqV8Giq4Nw6iwykrk4aIv7+Tma2NVmglnfFg+f2AHlNj8vss
         MJM9SLlF5BpGDzS7hq/QM/r8LjokMPJ5PWAQqvvFj+EyCUJpEJydD88/W65QTljrbyZr
         MjMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795764181; x=1796368981;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VLfsUTc/xIIGcS2lGfOPKhhQYlDo+fkS6wrUcxdmCtY=;
        b=YbkEHyfIYzjkyFyZxn64dkAQ0jCtnGp4rjGJhew2OWgQo6HCh40zMDfYhiJVogtvr3
         apTqii/VerlS5vxWGNikgkNojThpUFSANFjpmE036GsVatvD4QiuQVKgFlsLMWTPNKaK
         aUTWLNSQ6RM+tG6Q+Rb1phKihf1S7OnPdUq2SPPPynG8q9kiyMC0/woITIUFsDksTOjj
         oSA9iHIw8DANRuJudEmKUwcMBo6HwZ3Al4DIEt2T12QYe0tXdDampiGisrlSBLdAObsa
         feBxsu6Yh2lGXw8RzpnxxFHBR83dJCPoh8ahryg/0j0wxKSiDfB4RhQxAxZzN1RU4Xa7
         KKZA==
X-Forwarded-Encrypted: i=1; AL+hErH980IILZ9yH7SrjwQ0IbSAN7Y819ER9nA7ATMTQp0l34W51KqgnXEn+aNy+lwkAb0KHjlv6IPRMnUxkjw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1pnwq40sFSqSHp+xm0wj3Y8d/CuBzf4mh5FseXQ1TBo8xTcgc
	GkOV0Av1xc3hOKsHgGyUVmWDMZ8/VXIOVp8Wx5p8U/aN2XkMVgzjvPBQaJlTE5phIvzWgzWRun7
	LB0xeFgiz6tgPj90awIHYOwbseysGRsI=
X-Gm-Gg: AZFdTZc1qtIWMnEGlngiR8fRpBpsI2snv7iSHUIcT4qMJmRr6tqTJGCjSkmogKNDgPH
	xViFToE2kV5WcK1VT8NNHYCwgQAOGIBky6hO601z2SZC9TfaYQMeYXOVpwqDkT3qPjd3JOs9sXv
	ADssSkg4XAlvBtAVMaxvK3qLAdxTD+o0bhdcFUemu7rUiy1FKuY6cdGg+Fa3zivyW5/6ahM7aJq
	cmIDX/59Uej/OS9fiZKrt1LiZkd10KBeX73gqWK3EJHnfELdDvbTW+bw8wBS5KYfJc94DGM1sEM
	bmwfi3f/kcMqSv70qEXtENXCnpysjriRoGS8/rhXbZ98FanPXA7rrfZZ3JAPvwwHG3wpgyjxVs/
	4OMay9thh3x+ht6l5mYaFdeyaIUllkvj9B3hB
X-Received: by 2002:a05:690c:6502:b0:8b3:8c44:26df with SMTP id
 00721157ae682-8b5204b158amr106683657b3.34.1795764181016; Thu, 26 Nov 2026
 23:23:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261126122516.1198461-1-congnt264@gmail.com> <f92d05d9-2452-4187-bcf2-872eb285077f@web.de>
In-Reply-To: <f92d05d9-2452-4187-bcf2-872eb285077f@web.de>
From: =?UTF-8?B?Tmd1eeG7hW4gQ8O0bmc=?= <congnt264@gmail.com>
Date: Fri, 27 Nov 2026 14:22:49 +0700
X-Gm-Features: Aa3M54oLnWTPERVqr8Om7VIR3bUK98kQ2MCGO5C4sSzoCIdqMfUgVUxfuJHnuyM
Message-ID: <CAJpJ=GsqXgbPM8K6xo+ZvCPJC5EWTiJ3334suVh-cdg1KCcOQA@mail.gmail.com>
Subject: Re: [PATCH v2] leds: sgm3140: Put the child node reference on success
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-leds@vger.kernel.org, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Luca Weiss <luca@lucaweiss.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 8:46=E2=80=AFPM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> =E2=80=A6
> > +++ b/drivers/leds/flash/leds-sgm3140.c
> =E2=80=A6
> > @@ -270,12 +270,10 @@ static int sgm3140_probe(struct platform_device *=
pdev)
> >                                          &v4l2_sd_cfg);
> >       if (IS_ERR(priv->v4l2_flash)) {
> >               ret =3D PTR_ERR(priv->v4l2_flash);
> > -             goto err;
> > +             goto out_put_node;
>
> Is such a jump to an immediately following statement redundant?
Hi Markus,
Yes, v3 drops it. It also keeps the label name, because v2 did not build
on the leds tree:
https://lore.kernel.org/r/20261127071831.136694-1-congnt264@gmail.com
>
>
> >       }
> >
> > -     return ret;
> > -
> > -err:
> > +out_put_node:
> >       fwnode_handle_put(child_node);
> >       return ret;
> >  }
>
> Under which circumstances would you become interested to apply the attrib=
ute =E2=80=9C__free(fwnode_handle)=E2=80=9D?
> https://elixir.bootlin.com/linux/v7.4-rc1/source/include/linux/property.h=
#L229

For new code, or a cleanup on top of a merged fix. This patch carries a
Fixes tag and may be backported, and the helper only exists since v6.10,
so I kept the fix minimal.

Thanks,
Cong

>
> Regards,
> Markus
