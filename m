Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795183325;
	b=2oz90DYcFCUGlfgI6uS2dn3toDSQ5A7dZSrQ/JopIj9yuI82Bz7TkUwys1UwrmiowROP
	 07/LY3V8cy+yzwfyQQPRrp80W62HD1H/aUGmKAzGHFkA9T/EJbj3YxsOq2XMepigKAppm
	 2AeL6IRmo9DayFyqJxsm8X9AnYjPGkJgjfYceAXxnHN/qY5xtGyKaKMPZdG3zNJIJE9sa
	 wGpSxSZ1DZ/FyNpBvR/ek7fip6RNDhwq6E5LMkD6ZIgtANvKOgQON6ZgTwfvLvWDkB/Vm
	 Nfnj8VDvrmGs6j7Wqy8Tw0mHzrZMVCFvMBv0I4oM1U9LpPqem3gyY4drVNUgNnsNgyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795183325;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=qjFQvOSN/xEWYiaNWNXazpqWkeGzMcxSM7MbYU6r+yA=;
	b=3ixGOS7vJXnF+rMxmEM5QmO7oiWjKT7MQvczyZZPWcE6CBkZOcrjBrlLmQkqrSalbzes
	 iRr9wT2Qgy9rTxPGAZATcTGt1xkf2otP72xwHQIw7g6XkAIhhfJwspxUX+7FJE6L4aGI9
	 H3UOUcxYajL3BeyvM7e3jJScNb+N9ptD+BGk7H2RYa6BAbK2YKAKxVh9lhdbLyOf/8hIe
	 1jY+JMlXxW+c80dhuba3rBMOg1MZkgFMCNNwWRXB1n8ajugzYewmMnD4HYLV7bQyf1Sex
	 AjJR3MQtJg4YEy4ZPuOv4wJ329I1D2ZvTWj+hAlRAmsSz57pIfD5pQ/BXJglMlyHu7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="WY03zP/U";
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9377606A339
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:02:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9377606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WY03zP/U
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso6571145e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795183323; x=1795788123; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qjFQvOSN/xEWYiaNWNXazpqWkeGzMcxSM7MbYU6r+yA=;
        b=WY03zP/U/iRMcar3MrGbznVBrxNdkGOI+mBRX7Y0s08boR+1aqpvXBO1eCRZTtoPs9
         ZoPDRCgAVYI9NKsmc0jP6O3Q8+m2528uEPn4nekCX78RE0ZweApuvhLxmhfzd51dheFx
         Rr4bpkLdS3fssMMQiaM7+5iMH/heFkruk0dRgHNQugVtBOsqEdk5UbHCqrTjxI22uGeb
         2qWyCc25jIfmlULiTr1U1rLolTOQCSfSdIKENpjRzeQzdob3P90fidAKwRVAVUuwNwyN
         IJC5Q1pE6j1ecwuhi65ucUyku4uDO4O0GRg1805Dol5W/aLJA5gak79Jx5+1pwNk7t2J
         uDFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795183323; x=1795788123;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qjFQvOSN/xEWYiaNWNXazpqWkeGzMcxSM7MbYU6r+yA=;
        b=xgCIj/8dK6I9uwGkeY18yvbEZNmzjJrzkY1614WfwsLwBAgZlioQyoUBP+RVk3ffrn
         WqMRgkXcDc8qliAmMM/g8KO2nLOu3Ub1yVFnAVKPj51KzAl8S6Viq0orU3SLM6nhfj+M
         sdetA8AjZcTCf9zwSUp7mdDSgs/gFtnqwwrmLEZSLnP3FKqyfOcb/KBRBCaLrzf+HESO
         T6mrpcGS6M2+mxQ5JGuW5p8x/s7XdnAGBUqSlASO1iJqBFCkQp6+SRw6YOqxBkf0wwue
         dxNJJ5aCgeMWobVPSWyrrufLoyJlg2r/0orYKsANCVNE+6e8cwDNrkZIzfuC+vu9vgM8
         hOig==
X-Forwarded-Encrypted: i=1; AL+hErFASygFC9Y8SV+wy+ce5FXwBYAZEqIe2OoPcaTdh4qJKZRTQ9Vghin5VQ8IRSGsgxJ8EE7Ke5ItUNKgViw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jfw7Vuh/DctFY0S6ZbOa32vF2pzq18K0aA1i1bwLeDy9E3j57
	Wwqt+7clPMHuK50fa8lRFoUjwSbE7kxxRWGG649g5dcNZ8DLTru8D0F/
X-Gm-Gg: AYBFou1I1KqA4Lmko5zCuYlWOLNM5U6OYRru/abBROETTu/YH9ih540m/9UPj2nZJYm
	zyqQPg4kt3JEhfbpvm+nVK/IsV+hNFwdDNW8bn1453d4Jfhi3BcGan8n8HOdadfRnZFZHk3tPzT
	pMqQXvIz2opeMlltEOVosOJgFFdn8mYC+xPOuZ1d0GikfUw6XT38dF2CYsOgOJ6Tak/bVdqCqEq
	GMM/AlARmbQ6ESshJwac/UbUpIRiv84rql34FKKq4ZEgiIu/Ql9haN5O47uzJe1pC1tK1yawTm1
	kQEXN8rK/7YYzJXvRqmbUXrUwfsWtCAJhJ9pJbKUzr/YHdl7JQfYp7Duw/eBDJgQ4lu8LHoQ6kt
	9ioN/aYVcduxUYDtL1mLCmewfX+k3Rk2NBiOaBMQj+u9sR6umgN648s2TImdeRFp0zcOhJqE6U5
	VWwFDt95llLDBzrMkR4hAMZqx26ewQWjUGFLDHV1FZKSsHpEOWmUe/YsntySMQmL+Ssu7iwpK4W
	1c60ZcNCFMemChqiAcQS/lc7oGt4CuV0T3ikG3jMGY3LZzMAoS3AxDXXINl8vVNyzDq+p35QsGh
	ZM7cWt/bS6KRAb2LwoRKc3GzsdRRhjKINv03NWWTLMuB0+vqZ3TciSnnccui96rBQA==
X-Received: by 2002:a05:600c:b8a:b0:4bb:7007:4a5a with SMTP id 5b1f17b1804b1-4bb88817772mr71755705e9.23.1795183322969;
        Fri, 20 Nov 2026 06:02:02 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c248b75sm6021278f8f.54.2026.11.20.06.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:02:02 -0800 (PST)
Date: Fri, 20 Nov 2026 14:02:00 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Usama Arif <usama.arif@linux.dev>, tglx@kernel.org, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, kees@kernel.org,
 hpa@zytor.com, gustavoars@kernel.org, ardb@kernel.org, hca@linux.ibm.com,
 nathan@kernel.org, ndesaulniers@google.com, morbo@google.com,
 justinstitt@google.com, linux-hardening@vger.kernel.org,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org, riel@surriel.com,
 shakeel.butt@linux.dev, kernel-team@meta.com, rkeilty@meta.com,
 atish.patra@linux.dev, dgreid@meta.com
Subject: Re: [PATCH 2/2] x86/kstack_erase: Use REP STOSQ for large stack
 fills
Message-ID: <20261120140200.53ec2557@pumpkin>
In-Reply-To: <20261120104534.GO2668564@noisy.programming.kicks-ass.net>
References: <20261119213147.1094488-1-usama.arif@linux.dev>
	<20261119213147.1094488-3-usama.arif@linux.dev>
	<20261120104534.GO2668564@noisy.programming.kicks-ass.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
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

On Fri, 20 Nov 2026 11:45:34 +0100
Peter Zijlstra <peterz@infradead.org> wrote:

> On Thu, Nov 19, 2026 at 01:31:08PM -0800, Usama Arif wrote:
> > +#ifdef CONFIG_X86_64
> > +#define __stackleak_poison __stackleak_poison
> > +static __always_inline void __stackleak_poison(unsigned long erase_low,
> > +					       unsigned long erase_high,
> > +					       unsigned long poison)
> > +{
> > +	unsigned long count;
> > +
> > +	/* Short spans do not amortize the startup cost of REP STOSQ. */
> > +	if (erase_high <= erase_low + 512) {
> > +		while (erase_low < erase_high) {
> > +			*(unsigned long *)erase_low = poison;
> > +			erase_low += sizeof(unsigned long);
> > +		}
> > +		return;
> > +	}
> > +
> > +	count = (erase_high - erase_low) / sizeof(unsigned long);
> > +	asm volatile("rep stosq"
> > +		     : "+D" (erase_low), "+c" (count)
> > +		     : "a" (poison)
> > +		     : "memory");
> > +}
> > +#endif  
> 
> Gemini seems to suggest 16-32 words would be sufficient to amortize the
> REP STOS setup.

That really does sound like wishful thinking.
Especially if you go back a few generations on the cpu architecture.

> It was also adamant I try and unroll that earlier loop.
> 
> How about something like so, does that make sense? Also, I suppose we
> should make memset64() __always_inline if we use it here. I'm not at all
> sold on the unroll here, the asm is pretty horrid for what it does.
> 
> ---
> --- a/arch/x86/include/asm/processor.h
> +++ b/arch/x86/include/asm/processor.h
> @@ -28,6 +28,7 @@ struct vm86;
>  #include <asm/vmxfeatures.h>
>  #include <asm/vdso/processor.h>
>  #include <asm/shstk.h>
> +#include <asm/string.h>
>  
>  #include <linux/personality.h>
>  #include <linux/cache.h>
> @@ -580,6 +581,33 @@ static __always_inline bool on_thread_st
>  			       current_stack_pointer) < THREAD_SIZE;
>  }
>  
> +#ifdef CONFIG_X86_64
> +#define __stackleak_poison __stackleak_poison
> +static __always_inline void __stackleak_poison(unsigned long erase_low,
> +					       unsigned long erase_high,
> +					       unsigned long poison)
> +{
> +	unsigned long count = (erase_high - erase_low) / sizeof(unsigned long);
> +
> +	/* Amortize the startup cost of REP STOSQ. */
> +	if (count < 32) {
> +		unsigned long *ptr = (unsigned long *)erase_low;
> +
> +		while (count) {
> +			switch ((count-1) % 4) {
> +			case 3: ptr[--count] = poison; fallthrough;
> +			case 2: ptr[--count] = poison; fallthrough;
> +			case 1: ptr[--count] = poison; fallthrough;
> +			case 0: ptr[--count] = poison; break;
> +			}
> +		}

That looks horrid to me.
You want as few instructions (especially conditionals) inside the
loop as possible.
The Intel cpu will execute a two clock loop and the later ones will
do two writes per clock
(zen5 will execute a one clock loop and do two writes/clock).
So you want a loop with just 4 writes and the loop control code.
The 'pointer add' just needs to execute at the same time as some
of the stores - to avoid lengthening the register dependency chain.

For this code, can the length be a multiple of 32?
Also on some cpu the 'rep stos' might be twice as fast (per byte) if
the destination in 64 byte aligned - true for 'rep movsb'.

David


> +		return;
> +	}
> +
> +	memset64((void *)erase_low, poison, count);
> +}
> +#endif
> +
>  #ifdef CONFIG_PARAVIRT_XXL
>  #include <asm/paravirt.h>
>  #else
> 

