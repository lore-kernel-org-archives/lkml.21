Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795003643;
	b=zSGF9tJxeHueE/iWEYsDha4DRb6I4wFuSpt0b28Iil+Im7xZIkup++sRnp0w48Cx1B7O
	 I7kr2b9wGWVDFVShHFdwffqxL93mtoItAKq+oxlcMLhg234K5BwDGiU7ddVI9KQiwybCQ
	 z8Lhn+xV+8ARnWtmm8UVL+tiRi8UQand3bIpsppZQ7TuPr+yxiCfJYfN+dQa6aKqHk0kJ
	 wz3XXWMT7khaSsdVUr9OmpzB0HykyL6zI+/jXL3YsjI3HCeZ/OmbF7QWczK8ITwG8u540
	 nMca5DZmgqX9v2F9Pja3Q5CjdTeTaD+fMcNdXtjgliiWn/ulSRuSQGeUMxihjtOYidQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003643;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=F6H+9I/FNTwaEX3U8+UXUH54GdoP1prOsmOIu+bNyvc=;
	b=yOz+5sMNdgkdKQqN2pPSULLf+ScUTOU7HQzO9CO1bc2uyQMs7Vmkito4rRnUKQmfHNQZ
	 jU4PBMiw+LpZ26uIrkgsGi9eRm9yKfyl8dllyrqvCybQ98js9CDow048FpGkF6TuyX7xR
	 mwULlbxtzfguCoIvWUily7v61+GAJmliVPQHXZvbg5aP+fLItYhxRUKQ6w3nxWBApX7uR
	 VRB7jHRkEWEAJNRMrl99lWHkmfYxZoSJ9WLSka7nDV/afh7LK6QxgySd6a5iPPtDDC9wq
	 U8k7Bc0H1E8mFzFu8KoFYD9XMH+yhtzuUIfcoAfqcJhFrypjgYN4s47QM5mo5QNwyaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=bRzoXLqy;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F69460A380F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:07:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F69460A380F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=bRzoXLqy
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4a440c9e13aso25370f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795003642; x=1795608442; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=F6H+9I/FNTwaEX3U8+UXUH54GdoP1prOsmOIu+bNyvc=;
        b=bRzoXLqySq0Euw5RWGwkLYNOP/8ytVzBl3GdKN3ipbm0/pXCOg3bYDOuLHoybUEvDe
         r4KSuHW0EfwYY3Zzh6+H189Oh0OyPzigFCVklDixSDZAox7shnDPjjB4blh0tbVBc5aI
         wli+L8yZG+FIjbdCm35J6cbUfhh9RZiRlfxpnS8BkrPDnJCv4CZFDei9d5m87cqPfbM2
         lF6+qqjSNoVJynyrbFaakiTQ3iBLBcHgQoJuct6U5oG5LJagGnzoGvcNQTtGoG5Lvfl6
         UXj8RHjM6sEzvKhgtomVxMH3D63duYAPKRjj6eBbZSP1kuivUNoiVz0nwjmLLlbWZlEK
         cftA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795003642; x=1795608442;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F6H+9I/FNTwaEX3U8+UXUH54GdoP1prOsmOIu+bNyvc=;
        b=Y7hNPLsqLvyMpXnCqM7QVjP6+eYFIzWQkFTTasvDNWYc91lA+9uSwxRWH/fv3IHT+C
         WrrjclBh7mO07iie1M5JMfv3sEmFurAQlxMaQApKODmBMf+tKfwzQyT+a45mKHSn8y0k
         OJpFCMi3zeq+AXxHNM1u2mQZ54jLvulWjLCrvDN3PwIa56W2SfE5uzVlJ7rqauU76t/i
         uLDfCI56YD0a9x/j6rTr1znFJDI4x4l0sbQugbC24b6hAIbMpUdAIOAQTdEguFGMW54q
         FYxtl7gSxcI069VM4DvYEPmrPdYjIdgXtsjHCldMxx2GU79WTdut/w9QyqIGryp4//XF
         oVPg==
X-Gm-Message-State: APuU4Z9sxiF6xpBiKkhjto7iYE62WsWug6fs01wU2ee0Jj1L9XRbOWRP
	YedWtsmLUbGqny/3ru+XYO8CMB9o4BntGGqSWbeC+Uu0dbi+jQ1aLzsECdNQmiLJvfw=
X-Gm-Gg: AZFdTZdsjp9Sp7Qi+cFig8KzVXsBEWR6lGMQ6ZmY757raGUM2jRi9pXxQBEw4YnXZEP
	wMIPrIUYfwlKKiJlixKsf2dBKlw8SY5IvujSGJV1eO5MX3B/6sdoALB34XQu/ybVmxRM5WhBBgt
	ztr5YZk14lrWbMhLPSBdk4H2CKk7JllKZYG+g8Dfi8Dk2BgfR3rSL5Bnn7ZiRbA20bDAHGqCDay
	2Yduz48kOW16x3dJNeqoqdtYdFpSTeCvTeJ/0jwjQ4XLzn3tljhoRqemS2xqodedMssF8FQrf1q
	H2H3P0OOt54ZK6W48wGqEfV3It47e3wBi31oCBTHLBRba1+THX8X9qeAfSO36WffCR2W36+GFl7
	ZLvAW6GCQSKwqwAjHzzr/VYDeCDquGwMwoqf3vJZ0bgd37SyTJzyEsff60BTdogaPGCgXuHi1s5
	7dVjYogwPGtLGtFMuHmSlgQU3IARCfxaE8uS5t6w3XEOxXnvwiKDW/QCyO4XybZc/BzaBZLI1qC
	2bGX4GacGWsTFbsjQ36KAeyXMJhM8+j4No3/ugw8rCTNuf+CpM84xU7TB9flBOMR9Q3WWw9fe2h
	YGrpavxNMl/KzYTK6Pi5j8ZW
X-Received: by 2002:a05:6000:18a5:b0:4a6:bc53:2472 with SMTP id ffacd0b85a97d-4a6bc626a3dmr3866439f8f.5.1795003641811;
        Wed, 18 Nov 2026 04:07:21 -0800 (PST)
Received: from mordecai ([2001:1ae9:6037:1b01:4005:7ef3:2241:3a83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656095f2csm4180407f8f.40.2026.11.18.04.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:07:21 -0800 (PST)
Date: Wed, 18 Nov 2026 13:07:19 +0100
From: Petr Tesarik <ptesarik@suse.com>
To: Thorsten Blum <blum@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, Hans Peter Anvin <hpa@zytor.com>, Peter
 Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v2 0/3] x86/tsc: Remove some magic constants
Message-ID: <20261118130719.14ad8462@mordecai>
In-Reply-To: <20261027133746.3ccd4b01@mordecai>
References: <20261014132932.1495303-1-ptesarik@suse.com>
	<20261027133746.3ccd4b01@mordecai>
Organization: SUSE LINUX
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.53; x86_64-suse-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Ping!

If you're not interested in clarifying magic constants in code, please
also let me know, so I won't waste my time on such tasks next time.

Petr T

On Tue, 27 Oct 2026 13:37:46 +0100
Petr Tesarik <ptesarik@suse.com> wrote:

> Hi all,
> 
> what about this series? It's not super-important, but neither should it
> be too hard to review...
> 
> Petr T
> 
> On Wed, 14 Oct 2026 15:29:29 +0200
> Petr Tesarik <ptesarik@suse.com> wrote:
> 
> > The TSC code is full of various magic constants, making it difficult to
> > understand the calculations. This patch series tries to document their
> > actual meaning.
> > 
> > No functional change intended, but the code is not bit-for-bit
> > identical; some 32-bit multiplications are converted into 64-bit
> > multiplications, because HZ_PER_KHZ is an unsigned long. If anything,
> > this should reduce the risk of arithmetic overflow.
> > 
> > Changes from v1:
> > - Use TICK_NSEC instead of (NSEC_PER_SEC / HZ)
> > - Use HZ_PER_KHZ and KHZ_PER_MHZ from <linux/units.h>
> > 
> > Petr Tesarik (3):
> >   x86/tsc: Replace magic constants with xxx_PER_SEC
> >   x86/tsc: Use HZ_PER_KHZ and KHZ_PER_MHZ
> >   x86/tsc: Use TSC_CALIBRATE_MULT for the TSC multiplier
> > 
> >  arch/x86/kernel/tsc.c | 54 +++++++++++++++++++++----------------------
> >  1 file changed, 27 insertions(+), 27 deletions(-)
> >   
> 

