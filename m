Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795430848;
	b=U7MKpkk5zrCqXu031TbR0zfLPBDYkoMdqrYT/sn/j2o4DRfji6sVCMo4gygbo1cau1SQ
	 P3N0WnJOlrU21mJXe0oZ8h129PoCSBr+zDtJwSGB4HPmIQIBvMHeNFI4EYO7A63PsJG9i
	 +TlVbq+DTOb05THZKEJwP5UfQtMy2HD/aG8PFnn7kSHwQGH6Gmr3nXDjYrd8gDWsHEWcP
	 t7qE9STwvL7yrAQlTxXj4eMQxJxtRpRcXNhcNERxd6DGUGIuwjYk5obVFQQr5pJ2UthDB
	 HQeHgiv61LCSJ0oAO6qRZq6r5BB/QqX1zwe/GKlOX/0ygcLKwcF6u9/K4r2smW6wb8g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430848;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zyPgU+0dBWL7BXreM1FRldzhzHUZdzcLgwKTYre8N3A=;
	b=LyqYI9BXrR51cQCE42/Uj+cpPeBMT3WmXmpWuZRqYqWsZSX/9UPNOReJcuf4FJcMI4hJ
	 WZpWKopN7G/yEB9SLpXQM+U5AABKsmkU/Wsz8IOfjptzRZWQy9nVF7qB+iErDqnFHHyeV
	 HAe7GE7ikjtADYdcrhyQB5El9+M+ONbfkTJ1IKwcNBe3NU4a/45AUf7IrSG0C63LFQX4I
	 x+2grtBL7/QkZ3Q31xkstiAHdtFZj2T3Xxq1HY/Jg/YYxuO+rr1nQv1o7NUVv7EdoWUTv
	 /eI4q+FkWngtP/q3dF1W0C5vw7Mlgl3FusJwc1gwUQZZcI/9PsxSQSCItrPx5D+FIJA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h8FO+b7s;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554B4606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:47:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 554B4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h8FO+b7s
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so1662282f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:47:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795430847; cv=none;
        d=google.com; s=arc-20260327;
        b=b97DuF2oEaqxgLrEyVrt1M0qin+gTKPlwhrYjSlGRIwMhS/Xl+hKD+Q7oTNtJRQf28
         OCgW37o8UjVu0mlKb8mooYkafBt6TgvtM1I5wWUB1QrCUsRBHdlwKYsbfuhrDI19+qoA
         cDwGbtuZUkHhvxdmSEg+yCzyhgg9G/1/TXZs4KXETLXcU7lOyzWZrwKpkEol171Z3mAv
         +F0RaB+HRc6amVIUTPACRMmuMno2F1Lh9w0q9mv7DeCPe9sSiJH2lUgbB3FU9XQ70c4O
         0Wu1QUTYywnU4/8dnkmIcBnXbUKvrAyHFMMXIC3ITZakpsay64PKun3vgySFZLSpMWK4
         kxQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zyPgU+0dBWL7BXreM1FRldzhzHUZdzcLgwKTYre8N3A=;
        fh=ZzpDT0Zci1CqlV4qjH2haTy6r3k+RQMfEvyw85ZdvAI=;
        b=RXJDHtMd1uWydMSEp20BIjCtePDVN9fcKAyE4nE+A9/v5oItmu3Qg6FcwECMF0ZoaW
         ONzQFMz14cj+6Is46+dkPAJRk06Fjy8tfXedqzH2fuJ6W8FPoOAwrIceXWqORyiOurZY
         hoW48NobpYV6Kh+xaqBiV72W0JtJf+eVBWqzN7csC/s1MQyV2+hFJz8FvLiBeixDnQaQ
         u/jEzJgKpKkonIjqbTDiK/KiwEAEoqXinPJCV3DxtpqS5P+WncXN1KNvcHbLjlaKrXd9
         /HksWsITqBmm551e+px7tOa3rmOdopx9h03DSczCoySYmSYZRik+3BnnQiaMbMrYJr/l
         S/8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795430847; x=1796035647; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zyPgU+0dBWL7BXreM1FRldzhzHUZdzcLgwKTYre8N3A=;
        b=h8FO+b7sXKrfh+RneWspU4V5nRSeaoetymr2SbANy4D40BexeOkka7zwiD8hsTrw1i
         0Rdtfv80jpKNfbf/FB8w9iK++OqF0B/ag89CqSaqiSfQ72HPkY4QRGZ8sJoDSuNjp8Qr
         otlvsK8aF6zNDii8iH0VDGWjh0ZD7iiLMoxICiv/+cS20uKHKqc5mwUyr26Jn1ZqCf+C
         qOP3YBA+dRVoqPoPPjIKYymkcIn1nCDSMDVSC4XeS6JiRNHWAGqy/ihltvupi87jDdcp
         5Mm+7gBjD+Jy4yLpDuYn5pyanHiPh+IQG1uRgK6U95KBd/pMzBwOJcYcYPUuTKeWwru0
         +qgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430847; x=1796035647;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zyPgU+0dBWL7BXreM1FRldzhzHUZdzcLgwKTYre8N3A=;
        b=J3lQ6rmt8e6Kdz7VWAg6M4D6B2IT4xeIMR8pizTY9Q65YpXFRxWVwrgXTK3p1V/5oa
         9XUULAC6YrcdRbmshqSWUe6Zckbru4o1pVUMO5Ko5MQ+5TpBKoPjkXB0brdeelgwqIwR
         Tb7spiAnOnYNLVDoY0bGmqmeSEig4evA+XyZ3nOZVKLBz5MFhdSZlsDMIJUw2hPt7Jy7
         XhRx0tMCuabzEhN91sLHLNzds7End+5vM6MB9T2sTDUThQpRiAofECRVz1jVGFTqnqi+
         mwVI9gIZfW5Ql4n8lG00sRwld3Eq/QmZ8E/P2pnAqQzlYfBWrpbGaKJppCNG3Jn1QfCx
         j0qw==
X-Forwarded-Encrypted: i=1; AL+hErFBBrZbXX5r4hRh1rbf6OPIhai4K/2sl2N3pHADEi32bSKqx/EZYYZ+j12qne/srb+Mjn+CUIKgPFQluyc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/A5RBPOsfjpfr2m+Kj+bcNrzZ9L4j2o8Dh3qiYzsJSHEbt52i9
	fDCmkORrMl6VoUrfL/ZkmBIs6CjGdxM6uPP3etzdvE+pP4A9lsZ+F9JHGbT/v+pnPPvJF9o6exR
	oML/6a3O+IK9AmzwAaEfC8T2EWbkZthw=
X-Gm-Gg: AZFdTZdoztfFL/vWKhj00RtqeseJY0H/1EXgukivPHgWetm7NNkqjPF1noFFe3KJK7j
	SlPuLFvU8lTJj6/SYHU4AYMiaCeV2mMtp3nu2/Mc4lZHGoSAjEyClIVSh7RlJwnWqxq8EkqufIa
	hg93svoqYU3DMHNZkrFk6Rj1GWlmveXrIZ9pPMZjx9AYfp6XLe3ZvC6AAcvqTJISXzkB6uunoam
	YSPDzFwU786bWVlhCBMoUFDTC4WGbkoGS0nPIfLiSaIJubNc9+Ky88rzuTyJch6ryUvCSI3RqhX
	Jxpuk7hLyIZoURR2frr74SCA+dQF66HwyTINgilItwKquUcXX+BCzHkUlORw6WdDfjPVxhZ64nk
	QcpvlKLjDwwyE8kcjX2pJaWNWCt+Wm86j/rA1YOmUZ03tTKCKRhtZsQh882YMv5BzO1MuD56m7A
	O+xXLJV+TQ75tNHbVQzZMD2yZ9tmuAU8V8HFR5qnrJpmqCoi7uozIC/Q==
X-Received: by 2002:a05:6000:200e:b0:4aa:76ce:4b9f with SMTP id
 ffacd0b85a97d-4abb6746af3mr21461877f8f.56.1795430846438; Mon, 23 Nov 2026
 02:47:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-dma-chancnt-v2-0-241b1672883e@gmail.com>
 <20261123-dma-chancnt-v2-2-241b1672883e@gmail.com> <awQMCxhy6BurLowU@ashevche-desk.local>
In-Reply-To: <awQMCxhy6BurLowU@ashevche-desk.local>
From: Wong Steve <shyckless@gmail.com>
Date: Mon, 23 Nov 2026 18:47:14 +0800
X-Gm-Features: Aa3M54oppWHvQUNnUqJl7rdU_k7WIXS2zavZqioNamwXEqP2RCrMovzITl6Zh_c
Message-ID: <CA+X8Sdj8OygFXHMMs8mTj5RF5WuBW1uvsGcaMff92X6k_4U=qQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dmaengine: idma64: Kill the channel tasklets in
 remove again
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: ludovic.desroches@microchip.com, vkoul@kernel.org, Frank.Li@kernel.org, 
	dave.jiang@intel.com, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
	allen.lkml@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> You have to wait a sensible time before resubmission.
> Look at the v1 and act accordingly.

Sorry, I sent v2 too quickly. Sashiko found a real problem in the
at_xdmac patch (1/2), and I resent the series without waiting for other
replies, so your Acked-by on v1 is missing.

This idma64 patch (2/2) is the same in v1 and v2. Vinod, could you take
Andy's tag from v1 when applying:

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

About marking chancnt __private: that makes sense to me, but it is a
change to the dmaengine core, so I'd keep it out of this fix.

I'll wait for more review before sending anything else.

Thanks,
Suyuan

Andy Shevchenko <andriy.shevchenko@linux.intel.com> =E4=BA=8E2026=E5=B9=B41=
1=E6=9C=8823=E6=97=A5=E5=91=A8=E4=B8=80 17:49=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Nov 23, 2026 at 01:17:38AM +0000, Suyuan Wang via B4 Relay wrote:
> >
> > idma64_remove() frees the IRQ and then kills the channel tasklets, as
> > the comment there says, so that no tasklet scheduled by the interrupt
> > runs after removal:
> >
> >       for (i =3D 0; i < idma64->dma.chancnt; i++) {
> >               ...
> >               tasklet_kill(&idma64c->vchan.task);
> >       }
> >
> > Since commit e81274cd6b52 ("dmaengine: add support to dynamic
> > register/unregister of channels"), dma_async_device_unregister()
> > unregisters each channel and decrements dma.chancnt for it, so the
> > count is 0 when this loop runs and no tasklet is killed. A tasklet
> > scheduled by an interrupt can then run after the devm-allocated idma64
> > and its channels have been freed.
> >
> > Read the channel count before unregistering the device.
> >
> > Found with a static analysis tool and checked by hand.
>
> You have to wait a sensible time before resubmission.
> Look at the v1 and act accordingly.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
