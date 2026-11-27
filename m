Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795801110;
	b=qQ9rkPo7iWYKBHyw0C6+ArjZ4Eo+nPcflZGv06Lt6ofeRBWoBlGSs/eymJiOthCPRMlO
	 FiqFMjzI0bvXeLDmt2ahXZP1BoeF6LIiZhseTKsL6EaM2oZnEguRVHu/+zUcxtGMfVfl1
	 LkC3mJ8FycThFwFmRyiMSCoE17/AK0fCFqmNxgTPJMx/YtqTQnIc+d3+CZvm6P6r23dxd
	 FpiGCPfJFFgqRTuUjM9qJXUy5j6qOx5whH5lEmUCk5B6MtoMYGhoo/1rIf//srF+pVWbD
	 VWYxr0rth3H/AnRc1BunVcJIHoFytjb2pRfA9eW274XVyC1djm0cqR7y70kXxtfKzxA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795801110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=64zv/nVdYPKcwMYeAyoabyqft6ijfCTeLTsGFNhJAOI=;
	b=q+14YQ7PRPQDDrfssz5CYpa1hCUxp4AjprZpwAQjm33UhbhnzEyUs1HjQ+O1vZgvzG7n
	 OHxMyYgO9liVCLhAjuiqVsOUHbWBWSPaVXuEMLtlNztg+2SZZZP3QOGsNx+7+Hjw1CHM8
	 evu+TwiWWvP/THxbSDYzuA9VTDTyuPikWb/u72AoNpcth2C3m5TdBwEqSZ53zoFaikyEg
	 g3pp8mZ6zgowxtbKRvk4mVZ3LY+zi1U0hfVS0xUFcDp/SwwInQ7TnGNfqtitWc9A2RMYA
	 AntWY0h06iM1JuD4XQbKAjrVgUsSeHgnrflgIwGLaSqUNqdcBzvATGCQLe6mi6A6afQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zqFMF5Nl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.175
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867E8606A688
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 17:38:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 867E8606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zqFMF5Nl
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-4f14642adb4so5036945b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:38:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795801108; cv=none;
        d=google.com; s=arc-20260327;
        b=HfppcqOw/BAq4myCBedW6ACTrTaPTySSjYMxznsXooiC0XmLgzHrhwjUMwoQ3Hc4oo
         OHlCqbhZjicrT1BurEljssxDn/EdbCzKkQwIiq9px/1RGKCVpV5YXO44NykoDO3N75K3
         XVw8nMbzzVYcJV8kDPtGyGIxutP174EE3uv1qtHJ3QZ6PvzQBUNfCq6rZdRmg543O+Kt
         /ADtrJN9pKWP/aNBzd0fG33WAeCPmpt4PzVQId9ownVQbABsQxfobaaWb/PrcMs3oUR+
         1Ll36KLUssAuKGEgIQCRxjSAPTegj171PEbkQVhGPgBCI+w+k9lvaZbP0BPOlwvdaDR1
         EHOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=64zv/nVdYPKcwMYeAyoabyqft6ijfCTeLTsGFNhJAOI=;
        fh=BI7gl4GpY77kmLXsgCLcDwyFcFThg6FIG4NFqo5clhs=;
        b=EtggyqBqqsKvAfUHrfTlIes662nUbh2buBKjgj3uBaKARS37A1m4uUVl2GG2LDiAs1
         ENe5F6wXlI5Fo+VmBvVa5/l+OwAmvFcrXlYQIs+7I1CqQQ4QgHWDKt/vXltdGSnYZvCs
         WcHFzrlXgweVj74QAoELqqpDQl+n2UEGjTSAzgqSLoXa0tdvPZ6z6bsYCxIET4Ad6+x/
         tSjhRiT1uFxgb08kN1E+Xp4XoT7t6Vf/nNlg/GouHbDz9nN6XcXGjA+wjZvQktBXVdFv
         R4geE5m22ugFOVSlmOVTy8nmRkmFlIImeWSiTRQcJAF+lEBWe/vZZkKwtd8IDr8wI6ru
         Uy5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795801108; x=1796405908; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=64zv/nVdYPKcwMYeAyoabyqft6ijfCTeLTsGFNhJAOI=;
        b=zqFMF5Nl5otAa73WkVGb0V+EmsXwsrZEzr9DIG2swnQIVtcPaDfxdiM4r7bvY5f4cq
         0uA2lc6mty1wrLtmg1minomAG25RmFtXDHEOw3o8POL3f9kNJsjy/9LZoXZmzteW8kz9
         bzv3hdSPkSCx7NXpaYhfFMDFPDdB6RQKzAZfNLcKVs741O9NZLcWhtmgTZp8cTctY6pW
         tGX0iVJPkckz/SIpTl282/3KlCUJ68iCAn9KtEJvsNZj6lAg5GfGCjcq2jrbiDOvrxp/
         EKIbDCeuMn4O3KVO65VWTDw3wT+ApUDfqDziVBghoxT9u1dY4vCMx0D4IJtbYPcRjP7r
         cbiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795801108; x=1796405908;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=64zv/nVdYPKcwMYeAyoabyqft6ijfCTeLTsGFNhJAOI=;
        b=JtK3rSIiS0XC4ZzeDCSeGuImfiaTqr1z4+Jb0rGHUoxOO2WwDP86cBLSmeh0T56x53
         aREu2LJ8qE5URZ2D4LSnMp89EgX22PZwLGPkiPj/38EJZHKbP8haV9+OFABv53ABRpP4
         LV7vrFrvKh/zxy11PdZbzecLaXVWBhlPvFBWCHkLGTZeC+xxC79Hy72Xb1VoVhzyxOvc
         KejiKHS+UJc9NhEgB0iRwFsQ7jD0lN9xoBz3sT9mm863LtOTB/NbcJ2Rj4hDuf1kCw9j
         OrllNoG3mr9A3slnO/kxc4KuHpmVEa82bBVMV46l587snE+gxf2G6ZJa1dIzGst2zqmV
         siTA==
X-Forwarded-Encrypted: i=1; AL+hErHbsrHn6G40f6i8BuoXvpVKksyJZPOhrPFgGFcOKGoSCvHuPbNUUYh8k7xEw1xMc+Imui8Ko0iDXEoHTKM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8pg51pNLIe3WVAe2BVNLJznkZvTsZgcHhP77VV+QbBjkDJDvq
	oEWAIrciaG/N4ENbUUTv1neF09oQOg9y2GP6xmMBYrNkYY+Y13gNF9i69zqPeZkX0TgszT4PvP1
	9IbIMuLtgXVJoAQNPn0oSkDT9cLYvIrQ=
X-Gm-Gg: AZFdTZdFThKSnyErsKQYLZA/N2lOyX17ha2XjU10C/VhxRWis/R9bj5Su1AvVbIzjeV
	GtM7k+g/aRcn+01gFGcZLRWB7/Hfx+dnIgizKHWlLGURfOiy1JN9DTMHFA9sXJPySSL8SoJkaCQ
	phldGAnLAcWaZqUz9YA4re8C5fQvoVZZg3t1hH3G47HR2js/ELeNrZIb67/SOnylVoVOF2eBMHO
	bX2RufOKUhaJ30zIiMkf8twqERqLiijGLfhhuLURUo/f2q3mkfGeWBPVIkf6dKAPfSLEWGEixu0
	+gtAoiysTuJNg0/AVA/ARDcdpEF3y/1m7RhUx7B99IbTh1Vxw68wJaF6XmwFMXnS+n7JMU46c+s
	bUELN7Hc5d2L3BUAaAfO8uamZfQ+wQa4BcBNnfSW7z0Augm4RFsrxRemubcai+tH49gmHSYBN1k
	/FPiQArHfOa+9CG+X3T8Nu63fuZ503RN0=
X-Received: by 2002:a05:6808:151f:b0:576:b73b:f273 with SMTP id
 5614622812f47-57a0a404fcfmr26333399b6e.21.1795801108384; Fri, 27 Nov 2026
 09:38:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115114336.1739863-1-hjf3108@gmail.com> <20261115114336.1739863-7-hjf3108@gmail.com>
 <8ADDD0B3-609F-4E66-925E-997B11112E4C@linux.dev>
In-Reply-To: <8ADDD0B3-609F-4E66-925E-997B11112E4C@linux.dev>
From: Jie Feng <hjf3108@gmail.com>
Date: Sat, 28 Nov 2026 01:37:52 +0800
X-Gm-Features: Aa3M54qzBjXgTSOBtq2I0sWZmCjRDhk1jQEg2oYZonA1g4Eptxdtvn7VaLjISfA
Message-ID: <CABOQOSXgnFkSyL4hN9zDpq8iU24CFyS_yBS84Ts5QPzq9ntaxg@mail.gmail.com>
Subject: Re: [PATCH rtw-next v4 6/7] wifi: rtw88: 88xxa: correct
 carrier-frequency offset
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bitterblue Smith <rtl8821cerfe2@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Luka,

On Sun, 15 Nov 2026 at 21:20, Luka Gejak <luka.gejak@linux.dev> wrote:
>
> Hi Jie Feng,
>
> Thanks for the patch. One comment below.
>
> On November 15, 2026 12:43:32 PM GMT+01:00, Ho Jie Feng <hjf3108@gmail.com>
> wrote:
>
> > diff --git a/drivers/net/wireless/realtek/rtw88/rtw88xxa.c b/drivers/net/wireless/realtek/rtw88/rtw88xxa.c
> > --- a/drivers/net/wireless/realtek/rtw88/rtw88xxa.c
> > +++ b/drivers/net/wireless/realtek/rtw88/rtw88xxa.c
>
> [ ... ]
>
> > @@ -1632,6 +1637,17 @@ void rtw88xxa_query_phy_status(struct rtw_dev *rtwdev, u8 *phy_status,
>
> [ ... ]
>
> > +             rtw_phy_parsing_cfo(rtwdev, pkt_stat);
>
> [ ... ]
>
> > @@ -2020,6 +2036,21 @@ void rtw88xxa_phy_pwrtrack(struct rtw_dev *rtwdev,
>
> [ ... ]
>
> > +     crystal_cap = rtw_phy_cfo_xcap_track(rtwdev, RTW_XCAP_MASK, bt_hold);
> > +     if (crystal_cap == cfo->crystal_cap)
> > +             return;
> > +
> > +     cfo->crystal_cap = crystal_cap;
> > +     rtw88xxa_set_crystal_cap(rtwdev, crystal_cap);
>
> Could the shared helper discard the samples while sta_cnt != 1? In AP
> mode, frames from both clients match the interface BSSID, so these new
> calls keep adding their CFO samples. But rtw_phy_cfo_xcap_track() returns
> through rtw_phy_cfo_tracking_reset() before clearing the sums or counts.
If there are multiple clients, an argument can be made that correcting
the frequency so that it minimizes the frequency difference between
the AP and the clients can improve performance. Taking the average of
all the client offsets for the frames received might be good enough,
since it gives an estimate of which client needs more attention and
correct towards it. However, I feel like in this case, CFO tracking
should be the responsibility of the client instead of the AP, since it
can get all the devices to agree on the frequency.

> So if I read it right, when one client leaves, the first adjustment still
> includes samples from that client. For example, on each reporting path,
> a +12 sample from the remaining client and a -48 sample from the other,
> followed by another +12, give an average of -20 kHz. The remaining client
> alone gives +30 kHz, so the first correction goes the wrong way.
That does happen, although it might not be a big problem since as it
gets more samples the CFO tracking should converge to the correct
value.

> This was already present on 8822c, and this patch makes it reachable on
> 88xxa too. I think the fix belongs in rtw_phy_cfo_xcap_track(), before
> these new callers start using it. Could the sums and counts be reset
> there when there is no single peer to track?
Since this bug is pre-existing and not specific to 88xxa, I think it
should be sent in as a separate patch?

> Best regards,
> Luka Gejak
