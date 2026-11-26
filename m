Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795696492;
	b=3xRXyndlJMqS0Eb9XTp3nMvF4sEwLCceZUnGhxxOIXXyy1lfw5QiFtBXFl2Kq8aD3EBK
	 lUUgALYtlmRyj1hpTeDxWHqFsTiT23Ou9/k0cP+2cVCRcgm9g9qRoLErs1q3iatWVJhC0
	 LGCEvLgcvHndK29NhWwdT7W9igc+uHlBSKxe19wjuwNAUZdQU/xgpKBurPxqZULbrpt/N
	 TK/ek1ifbFwwmUzvP3K/zrUFo6O09eKOxTkaS2NVpGgNi/M/L0LaDDh6L15BNGszus9yj
	 YvFfHJRwL4SNTegabqJSmT3tVtHy7n6NDry2T+IgouVH69NVxteiGvgLweANuA0iZpg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795696492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dDRUvqdgLDoNTUwwmWZUy/8sn7+qDXig4yRPABqk+q4=;
	b=NgJbFFMXKvL14pBqrBCAPTjeibbkI/3mmx5VDnKMEr/9qVmn/jISOMuqbwEI2Uadh7ll
	 g8Xo/2XQdSYX/Oha7to1EmAZnC/PoFiA6oupFasWMcLnBeY8YFKmruWuNMnJiUcK7O/lk
	 DdZON/h+0ThltUibxiYpWfgFDyjeRIhGka5G4m4ji7w1pDwl2w7B4JCICDJVS2R08zWfu
	 55PFi/0HwqzcsEBbkvbrFPlbpsr7elYWyLOjxmmHHPn0fhvVKhz5SkcKspQX7x97l9MOC
	 wq6ORshlXRJ5567ayEmXNDhkdhOW7eY1U7+6Mh9Bekq1Fh7665AXItZC8Hof8ZY8n7g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gYB2dn7S;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF61606A33A
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:34:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EF61606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gYB2dn7S
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b4e04eda5aso51789127b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:34:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795696491; cv=none;
        d=google.com; s=arc-20260327;
        b=iiua60TnMtga5K3SIQEZ5QuHG7QLh4eMmEoKDOktGqQIteDnnooyMr8DgMybKK+I48
         TZbGH9iKlcaZTVRcCk+l8vufv3oYJsktWwyRn6yL3lRVxJiI8/bAsDBWk9u3oLNMODH8
         0Q19adM7ZV82wO+Dk2ioAzCfdzSWy40osidD+n7uOGvC4ThtlFL2BCWMkdVj7toAKgSz
         dNqOpZ5yhQibIwJ1mFL8D0mxlLq6u4Ryr5fRa9Sg9rgZs+relRYA3JjPQUIhL1ricK1m
         SiDaQVAGgCZ9qW1YnuYiFY+f3xW+pvrv81HkvLwOSavrMtPDsXuzvkvJaNvrdc35eI0E
         oOYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dDRUvqdgLDoNTUwwmWZUy/8sn7+qDXig4yRPABqk+q4=;
        fh=nnjoC6Xn0VrBqr3vYm/xd4FbCYE7XFwc8IEEUxK7pZk=;
        b=G6URzuA1KYvuMaNPhnsuorYr4MHD3YqBVDuQ7FCZ1g6CoobcgGebP8e5zXGRaivuhi
         639BaMMyQ5ZP0GKa/PfbKh1Rb02P1x2ob58upWhPMRA3y29ighDTjbHw03gswzN1UtUj
         DHxc3ElWpUhonLUxa7YfKmh4G15a3vFnq0HPeHlpLPwW0EPk72BHLr8QzNKQamBgxBua
         /JrXHw+V/7jiX+zdqUeE1hGT5uheywlAxekj+NG5TS3RvcewsNZG9BDYUw/HZL7dL4vn
         lO3OlbOTkEwPeFx3U8R50+6WV53Gpi1sCjcOle5vFHBXkLRZI0KhiyD/gBTvQsrB+rDI
         YVWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795696491; x=1796301291; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dDRUvqdgLDoNTUwwmWZUy/8sn7+qDXig4yRPABqk+q4=;
        b=gYB2dn7S6lZJ5cNDrDXU2kUngQanm3LaWvesgltsgxLzldlXABGf96WZNq0+0V1ZKV
         JJyU/Y5eJ4dczDpbZ6f0OT4jc04IPvbm3miCxAc8cPu/rIAbN/JIir0zxJxK9ykpMjoJ
         OcfN9CCbrEJDzzbjpkBxPjYKl3pzXdkbbzEqE5WpRxNDRzUBvwS373UcOBAmE3YBqPkH
         ySjaHyladr0feRfzgs1r+XLyihZ7RrUMXMq4rOsAT/Yb6ZqfEwc9MrXtwYx6xzQHKRKo
         QrdV90oB3Z8o824wjOUz7d0PsxfhqQ8NIR+e0efbAp02kTFEBBEhB2sgw1Zox0wECCjr
         EaBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795696491; x=1796301291;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dDRUvqdgLDoNTUwwmWZUy/8sn7+qDXig4yRPABqk+q4=;
        b=SfCOqbke5HU6qNszswwVkDCae/RhQWqJCs6pQREN+mGa3g0ofwd0F3CTF9uMvr71NG
         eJ/M09vBmwlYeE81GmnRhNnUUuTGwwJGXhV0MpM8SiApAciO0VGV0yvetadhhBCLZ/Ll
         Nd9/9EfczApjOXswTQZOYsTOZ0tXI5r6deSL+Lzze+jXHrob1jzD0w06CBiPPeYqE6O7
         tA2E45qtI9OWMJ3HPk0JJTdEqm3iZ96IL2KV/Hagmi78voYHBHef2rdHbhBQOADHBkfQ
         +WKI2OWcpIoS+OTRaS0RkdkM0tKL9gxxQZhrhitpNnZgJYsKAnDlJI2JU0+SzGRgff0Q
         Msew==
X-Forwarded-Encrypted: i=1; AL+hErEjdFildYfe7vnhICtk9Z+++HNmgSaVJvn5XnT0VJuH+qvILE5YBYaY0lhJyY3KBYtapaY7xnmMcsPLjIg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Uj40a2KMRbi7aZcs9S91ddd0Udcx7CK1g5XBaVJ/6uX+fDcnO
	Tqk5x46K+AnQHCKGqMwzgGIExCFLjExXz9LO81v0GeRCVvKbe/NCD+q5efFejdeGRyONuncnafn
	SWsx2EMEj/36lA22fr5ID0Ny4vCY7ZCU=
X-Gm-Gg: AZFdTZcO9CgeXJXKOHpV7VCgBiWHNp04Qd/a8KQVSrbR26X5F+ordJggmz1viQr9ZlH
	huoTaZKwjxiNEx0u3gRN0XHJDU0IK6uLBZwfwhi7g+SvOsFvXpyW+UI02FrCDWnNyNvsrQx0Rs4
	jnpN6JLF1Z2/OmhrmzHjbr11BTYKaw8IlUQwYGhXPTTcLJZgtQ0aqYcPehJaBdjsFGfwEa+jIF3
	x/5I+E1JPSyhiodt6FswDerJQxFz1kpJstFlYbCxQHUTQT75D5HEg2RQK4jL2ge3mLwy4SRS2rk
	+1OrptyUVPk4Mfp22xbieLBvXpveO0LlSUeZSjGBNpPaVgQFZy0tdL6Aa9DUNjAQtQuxlKeSdg0
	JR0kEIZeoszwFUze+0qxcevrUmAUBxnQSGrbs66zSfdWrKKIF3+BthGF9Y4ipSgg0C1ykmA==
X-Received: by 2002:a05:690c:886:b0:8b4:d1d3:36f7 with SMTP id
 00721157ae682-8b52054a9a1mr88892787b3.53.1795696491522; Thu, 26 Nov 2026
 04:34:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125130318.2590336-1-congnt264@gmail.com> <9b75515f-f6e9-4d00-81d7-1e83cddd14e8@web.de>
In-Reply-To: <9b75515f-f6e9-4d00-81d7-1e83cddd14e8@web.de>
From: =?UTF-8?B?Tmd1eeG7hW4gQ8O0bmc=?= <congnt264@gmail.com>
Date: Thu, 26 Nov 2026 19:34:39 +0700
X-Gm-Features: Aa3M54qLk9RSMM85pLCadOXRpeQlM3Wwp1UCxR9_4VUEKEkcdCZfev9BbSJuZow
Message-ID: <CAJpJ=GsvQVBONdbKCyTuBjBuCDSXG9gRoVxg3j+XPq4+HYr-MA@mail.gmail.com>
Subject: Re: [PATCH] leds: rt4505: Put the child node reference
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-leds@vger.kernel.org, ChiYuan Huang <cy_huang@richtek.com>, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 5:13=E2=80=AFPM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> =E2=80=A6
> > Drop the reference with a device managed action registered right after =
the
> > node is taken, so it is released after the LED class device that was
> > registered later has been unregistered. leds-rt8515 puts the node of th=
e
>
> Would the identifier =E2=80=9Crt4505=E2=80=9D matter more here?
Hi Markus,

Do you mean that sentence should name rt4505? It refers to leds-rt8515
as a sibling driver that already puts the node. The driver being fixed
is rt4505, named in the subject.

Thanks,
Cong

>
>
> > same kind after registering its LED and flash sub-device.
>
>
> Regards,
> Markus
