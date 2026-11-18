Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795016382;
	b=IQdPjMMwLBMkWD88fbAH3yPkEeInc/2VjjgQ467dknmtFoCXpCrN+j/J8QrfJHxfMeEr
	 PTvcx/oMjBYgE3Yl9qOQ0RYXVVxN9GxoR9fcQMnaZC81jp4ElKsq9jE5WEOJNVXjXFF3q
	 jRlLuNS2uDsabO+7CCu1G0z2Gs75+yF4POwP4xifGd6hTyf1pOAeG3QrwcMYQeBH6k+re
	 NhTt/4fGgDrSyzyYpPLn412cVV12CI+Pf8P8wzyJroChsmQbqvfdkzpY7V4eyTyssnibf
	 ez/nhIyNJbYg8XXriHMzcH8ugfnIPKBa9WZm74PB2lv5WvlAPyn1c6IgbmWdVjiCKCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016382;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=5ax3Lipd+AcivWLlLBqoyKXnHoFVYuzVHK/u3oZQ3q8=;
	b=NqdByrr0JNfDflT0JO3Yd0iitqzwu/JSV8LwNPlx3YD47VAl2oGhNYiGIprN+ILp5QtO
	 t99mStRy2ymcMh4rC/Sd/+utg0rPpNZAg1M5UdYrJip9NOP7Nba8b3O03WUTSuSH11YYr
	 AehbMaDHyTs2VAnwhAFvW3NJJMXio43uHHWt1IU00pwCM4pP8JRdPp5a1ToeznaxpxFNS
	 cj1TuZ6YR3z4XV1IQ0l+WBw6LK4OpO6AOyyF5vSt1ewIxDRB+a+nY1PuVe/E2ilr1quKo
	 S2ZL5ObdiYM/lZReLNPc+FlnU5HxkxNtFDLR737vTblpkBAMCOrsM0GchD3m4NItQIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ChN4RtDN;
	arc=none smtp.remote-ip=209.85.160.45
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D849560A2607
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:39:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D849560A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ChN4RtDN
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-475920b9ca2so418172fac.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795016381; x=1795621181; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5ax3Lipd+AcivWLlLBqoyKXnHoFVYuzVHK/u3oZQ3q8=;
        b=ChN4RtDNL4FAZnfKWrkcqtZR9IwHiD412LxnId3JvdDhc10w9CNmIAgsuSll3tHp2S
         w3KfmBSLf8edMN/+2ABaalGwez79ruoZ/SLHAW5f8PboytQDbTeWW3KMmtPzNVcAS1XL
         LacFnrw01OSIW6IiBARxJfk2riKOsOXA2hPsu+tHeK7H8HqUZwqtrRDkUEh4+I3EVtAm
         KlaNLYjxxtrM5ZeDXLOKDL37vL6bOMnswIdnJehE7PBi4+/Tg7d7t/Imgru0kNALnnUR
         +pnmMFx/6a5ctuXYw9NsymB5Ipe0OBvr0807ptcZxoYCgpG623H5kq+8yLlmuu05TsF4
         /j6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795016381; x=1795621181;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5ax3Lipd+AcivWLlLBqoyKXnHoFVYuzVHK/u3oZQ3q8=;
        b=vkXFSutZOlOFLuo6MOIC57yUIu73lT6ehkB5CyfknFKaXwF1TUQRtf1z3VKwWpZ2O5
         dM3HqxJnwzLUgY6983u+C1gCYCX52HjWqBPvhIHmXGlwDRm8F4mIQT4DzDQbIe9y6+kS
         /EyoRM2drPZC1p7S6GCFytTgmPAH1xeF/q5w17Nnez+RdqCz48XkwQ/RXB40ogEHNnkc
         wDZXOKf9WDxkrzjsiCGbTGtZUgWjo+LuUrDFzrOhBkCaFfODg5nCRqyrYF5WUjVJ+Ck2
         WigsYvTpeKLa2xbuqLMHd56bhr+Q5JhaLyrKqANyoEnqJM4ExYG5lUz6yU6WSmBeTyRA
         XAEA==
X-Forwarded-Encrypted: i=1; AL+hErE6sD66uhHzt3ZZZ2x4sxTC81vbn5QGNEdxgcmPvdjjDwnIlSIOEkfp2jRbEXqT7lVSJRxfXe9YFZ7730A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/76JE0g+ApV7Ob6K1HGbo8FeSsS6KX/n+NJscWf9GG741jjCK+
	mCuSzRSjkrgpTuZAW3D3cLMDjdV2meOcUIuBqm/BJKx1CUXubchFNVa0
X-Gm-Gg: AYBFou3ywvP71qsyTA56jsy/jahICHdhrMB15aoMaYjIXADWD/fMl/YG1ZmjrqYbNcV
	4TRieII9cgtn1AT5nXL+vrdIrHFHGFJ+ssatSNZaClWWyIQaOnvMZeszAUj94X4+FudBiMLt7Rn
	qMJ4OPAS7nhQ9iAg5V2IKZwvsG5cG62c6PoUFejY3s8A+ynFOwQYsi+H5RHWsMW8f/UQRIWPj/j
	+hitRbPTHYp49gmUEhX7APeyHPXAagBa4jQPjJB/RZEjeyeyh4xugjUU15bWQg9sBYT8P29Qtdq
	rVkoUIEyPxGjFrMtFDjpgUA3XQJeW4o3/rdRPdQ0a1PAMPSz6r6n8Y2YniAJcA7f1hLnj4LngAm
	o+g2rio36KI0Qv70F6GizFDCI+kBVjtvwhDS2SOBTGM/Be4hlaX5Pc1A2oDkuKVgs3WoK/XWcEP
	Z7Jp/PWIIG2y+LJFpLsQk/3MrmLEAkxoIgganx3Y3KxwLo2yuStDu7OCBWNDsVl1/tQECScNTBB
	FH1bA88HNk67JMtjIFmHHZ9tmvq3Bzb00084JRlb6bML+ESAYpgDMajtc9YHFTuYPpO/mUh6RRX
	uwdfGzeKsxqiW0j5UuHtFHcTvdEL9C3731dCmCqm5Hd8WssM
X-Received: by 2002:a05:6808:220e:b0:573:f2e:2bee with SMTP id 5614622812f47-57741723566mr3647243b6e.37.1795016380749;
        Wed, 18 Nov 2026 07:39:40 -0800 (PST)
Received: from rigel (106-68-220-184.tpgi.com.au. [106.68.220.184])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57775461e70sm1987291b6e.0.2026.11.18.07.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:39:39 -0800 (PST)
Date: Wed, 18 Nov 2026 23:39:31 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Jia Jia <physicalmtea@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v6 3/8] gpiolib: cdev: do not free line IRQs again after
 the chip is removed
Message-ID: <20261118153931.GA46152@rigel>
References: <20261116-gpiolib-chip-removal-v6-0-aambrozewicz@nvidia.com>
 <20261116-gpiolib-chip-removal-v6-3-aambrozewicz@nvidia.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116-gpiolib-chip-removal-v6-3-aambrozewicz@nvidia.com>

On Mon, Nov 16, 2026 at 03:47:06PM +0200, Adrian Ambrozewicz wrote:
> Since commit ec8b6f55b981 ("gpio: free irqs that are still requested
> when the chip is being removed"), gpiochip_remove() frees the IRQs
> still installed on the chip's lines. A line request or v1 line event
> kept open across the removal frees its IRQ again on release. If the
> mapping is gone, that can touch freed memory, as reported with
> virtio-gpio; if the number was reused, free_irq() warns:
> 
>   Trying to free already-free IRQ 28
>   WARNING: kernel/irq/manage.c:1881 at free_irq+0x193/0x2d0, CPU#2: gpio-hold/111
>   Call Trace:
>    linereq_free
>    linereq_release
>    __fput
> 
> Stop edge detection from the device notifier that gpiochip_remove()
> calls, under config_mutex so that it does not race a reconfiguration.
> Free the IRQ there only if it still has an action, as gpiochip_remove()
> frees only those on lines flagged as used for IRQs. The release path
> then finds nothing left to free.
> 
> Reproduced with gpio-sim: remove the chip under an open request with
> edge detection, set it up again and request the same line, then close
> the first request. Every cycle warns; with this change, 100 cycles pass.
> 

Reviewed-by: Kent Gibson <warthog618@gmail.com>

Cheers,
Kent.
