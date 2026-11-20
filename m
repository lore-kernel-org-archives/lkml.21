Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795153035;
	b=BeyL3IY3Js9ioA7kFOODNGvQOHJZ+fDTqOYz7gIVsBg+K1HMgv2e4a9E1ifMCDwDyzVf
	 qvkb5QK/CGV0Mw7PsXbf5UU5vCgyrJQBzeZ08sXZz/3ELPCb1mBHIA/hhCnpHt0jfDbsu
	 7m8Mzq/Zc+Y2t+R++7Fs1XSRUxYTwVc7rE/kz0CsPmAySbdNdLRb2urHLWyF4QMm9qJ+c
	 5p18vbaRYXUI4CEvXJknYe9U+9p6rhKoQMSH0+t443AH6NiYIshPyxq18nOl2ETZI8+Hz
	 TB7pXnRdHUxdfCxaha9rPyILJz0/aNTHTm3p38+7r6rIa9OcnUMDppIJ7pq+RTck9hQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795153035;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=B/0atRX3itSILPoLTT2jiynyQu/IGk6Wpmy+FZVV2so=;
	b=4CUb5FNih4+/aO6V2GhXgyFrrjhW/ybikSSPXDgu4MkjOOKzYQKRO7dHofU/EtiREfxf
	 pZRzm7FKwL4KB+o2JYhYp0rKbP5hYmh/ls0s5kSlcBZ69B5mEjXg2XTVQ3gYqVVjgXnF1
	 nmtKBv9+X6F4k82BbVgViofng+2vlLslDkPPRNulaQR1C9y59TPFEfCHEohkl+ezg9iVI
	 ZpF/YsKGhOE1pWg6ZljNKftewBoAZnDpVG4JMjDPLZbx1CpRS1aHQzKBFYOMkHa1EcFuj
	 zv9VGWbx+4U9KVyLb62ACsv4AWM1Xaw372on01VnLlWZK2ZqG7Zm1yfOJqBfA8U5rJg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="c30wh/Ls";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3363E606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:37:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3363E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c30wh/Ls
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-55b8cd4e2abso6154441cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 21:37:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795153034; cv=none;
        d=google.com; s=arc-20260327;
        b=TQSSI8aD+JKdX7Xmwr/Uk/tt9SndSFoAfJQSaTwoUm9p6Xb3WF0QYoqNOJJpyaWZ50
         NHf+2zXKZAUALNqToR3Zn5gYuCfNpE5BrHfyzFjDhGIfDWtQmV7LZa9tcgiu5dc4d4vC
         eYq41Fe+SiOFyARN+LT+s07mZe5FuomDRNxDQbIP++oLORnoQEMT0z7xbSlsh+ZTzKy9
         sHim85dF/9Sxs1ZHS8VMItfkpv/Z8iE8LuxcYNOIiRc2PdcxFLq9ndFtr7ztB4DdaVUD
         fLPeYxjRPwnIeirn1Cov68L+W2Y2+OEF1PFjJhWcTFh2R8qm6rEubwvgkjPpl8hfrUXR
         H/pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B/0atRX3itSILPoLTT2jiynyQu/IGk6Wpmy+FZVV2so=;
        fh=Q4KRWsZlfTV5ZTDuyDaTtvCc3OMoaJCEUexFVfAkfZE=;
        b=E3gRjmw+OJx4R65vqXE2mYgDSARqgcM/DE1SFtxSoSVNpD4w32EzApMqq5lXW5OMDW
         9DwM0LmyZcV+MBbrNZBC9NtihIf07p9ko9AYIcgZ0a404VK+zNCYUQsUWpqD7fNQAfWi
         LARFSAi2ApDpu3C6yP9kntuG7SgSmQxdmo5+QbA2l/bfD0S1wYlUstzVlnTuBzotOuTB
         eQN8mvuj6ZbVxQyMfUNO4XY1CndJZ/pBNZr80nk5BsCCfgwVpLyArZQUN5SwqFvQzdj2
         YuGzWeDO5SY4mjKjaBhU4P0ecJn16tQAmFi+cZKYlNq3TIBj/K71NKWm8yYOqcPglWvu
         psnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795153034; x=1795757834; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B/0atRX3itSILPoLTT2jiynyQu/IGk6Wpmy+FZVV2so=;
        b=c30wh/LsnCgUxvDQTUrO47ussi+zTbnxgsJfopO3U83soE4j8H8tUFkkD+yANP3HNk
         N5HmrBLzzjqUQioNE02/AqBvZoNOSWL0ZfcJA/lKvpbZulO25+5Jk//BYIrkOvWNuQ7m
         XYeKOvsENfQRO1iygLySEEyQZB6Ggzi1aSAcUmFNKRL+GlGrkJfBYkhz9RPqXxrUTlRb
         IJm3yTfUnR3g8JFnTPovmFppxj/I55LQ6iEARO6b7sIWcS5fefnpeNsqYxlyONwYR/I8
         jSFG0OgrV8ELInXC8PIPGnzZUVKOJM+YYsRLPPhZ4e/Pq2WdaqZPEsHS9tLqrmHSPfo+
         1QJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795153034; x=1795757834;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B/0atRX3itSILPoLTT2jiynyQu/IGk6Wpmy+FZVV2so=;
        b=X5AnE7gwB3wr7NnOCVRkRhof0asp2g9jrUeIrD3j+IQAoDMYw3FPaMEbasmNvulI2K
         QSLi237GQ4GkZw40Bja07N5w8DX1wdz+QTfYil+54o7vD76Yh84zCcDwYH3WFc4JGqWI
         lvg9oWpULZStFPLE1PZW6HTNMj6IqwGqOzIVllUdDdrlXcR+H3BPgPv9BLizs6KXDYhW
         WN8x+cVxapuNPVnDhvpTvWDoHm3nZucYI2DrhtoTidniGQnmyfjqwqnArZHe0uxR6svw
         hxZROzi+RGpx6ybwjJ4YcdmvagjENHrcXhlCc4ipkYafS2BLw9qqHhelOYsoGijMSgIR
         YOPw==
X-Forwarded-Encrypted: i=1; AL+hErG4XTSfFAY52VHCZZQPUgvEozjuBbRu0XdhFmdbwoYD7y0j+txL4oj3desS7mScaagKF5+Y2fgH8rn1WoQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WwTF6j2fwtOm2JM+XjZ8C2uhWEwtlV9ljWOngrmdD/VKLhzYG
	8/lJKmKD/jnGXvWMOdcMV3a39+saMmPNBBaSSqazcPwpocJKMgLdXpc0Aq2SvmG43g7uzr9xpfj
	eZKdgOC54LGLe2eO9oCHign933XCJ4Bt2sKrQ
X-Gm-Gg: AYBFou3K/9rNfFPt5KeJPIP01/iMLrfNyqU+iuEPf1MGxXnGrEiDW+CyrBsitjf+fsY
	/xji7+GH0qi4m2a/LfdKbOmrJCnygGuW2PDvjqVwf3zFfZY1R4wIJh3VPvlSdu89mILfFXyzxkK
	690EDKWwbQcCoDFFyjVLk4yRRFGFYrjtxeaVZrg5jobaGTSh8Wl0wiYJWqzU3ju7XQbTee2w7aS
	Ht4t4K6Pi+MH4BUBoe7t9HxSZLfflJuj1SBLjQQ80d7alU1JtNcbae8DA4mbvQaIgfIG6soyWZG
	qYm9ssU3J/E0tLPUMdcYfFZfdZJKadIMnMFkP3fEy4G//FcicZmdCJCfGHAGwjOc3JXqLodmkgi
	cMtkTYYltqEtaoZQ1tMr0oF3UuaNpwa7NVqiovOU=
X-Received: by 2002:a05:622a:228b:b0:55d:2caf:ae7c with SMTP id
 d75a77b69052e-55d76a6e947mr36676041cf.19.1795153033968; Thu, 19 Nov 2026
 21:37:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118081625.2399247-1-a0282524688@gmail.com>
 <20261118081625.2399247-6-a0282524688@gmail.com> <20261119101233.Z-LmZvya@linutronix.de>
In-Reply-To: <20261119101233.Z-LmZvya@linutronix.de>
From: Ming Yu <a0282524688@gmail.com>
Date: Fri, 20 Nov 2026 13:37:02 +0800
X-Gm-Features: Aa3M54rJzQMDbjIWqoH0okOv_GH6h7gkNtMRDZ7Tenmh0mHV2sFIdcgXND8rGn4
Message-ID: <CAOoeyxXMPyG+PWiW5X5NHiH5WMaktCDPjH5-069MwjD-TC=amw@mail.gmail.com>
Subject: Re: [PATCH v10 05/13] mfd: nct6694: Drop the unused IRQ enable mask
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: lee@kernel.org, Ming Yu <tmyu0@nuvoton.com>, 
	Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org, 
	mfd@lists.linux.dev, linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Sebastian,

Thank you for the review.

Sebastian Andrzej Siewior <bigeasy@linutronix.de> =E6=96=BC 2026=E5=B9=B411=
=E6=9C=8819=E6=97=A5=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=886:12=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> On 2026-11-18 16:16:16 [+0800], a0282524688@gmail.com wrote:
> > From: Ming Yu <a0282524688@gmail.com>
> >
> > The .irq_enable and .irq_disable callbacks only update the irq_enable
> > bitmask under irq_lock, which is a spinlock_t. Nothing ever reads that
> > bitmask, so the callbacks do not mask anything. They also take irq_lock
> > while the IRQ core holds desc->lock, a raw spinlock. On PREEMPT_RT this
> > is an invalid wait context.
> >
> > Remove both callbacks, along with irq_enable and irq_lock, and keep
> > IRQCHIP_SKIP_SET_WAKE. Without .irq_disable, the IRQ core falls back to
> > lazy disable, and handle_simple_irq() keeps a disabled interrupt pendin=
g
> > instead of calling its handler. The behaviour is therefore unchanged.
> >
> > Fixes: 51dad33ede63 ("mfd: Add core driver for Nuvoton NCT6694")
> > Signed-off-by: Ming Yu <a0282524688@gmail.com>
>
> This sort of makes sense. But how does this work? If the interrupt keeps
> coming the irq-core will just suppress it?

Yes, that is my understanding. The NCT6694 does not provide an interrupt
mask that the host can program. The firmware reports a 32-bit status
word, through the interrupt URB on USB and through shared memory on HIF,
and the transport handles every report and dispatches each set bit.

While a child interrupt is disabled, handle_simple_irq() only marks it
pending and does not call the handler. When the interrupt is enabled
again, check_irq_resend() replays it. The parent should not be flooded:
on USB it is the URB completion, and on HIF the handler clears the
status on every interrupt.

This is also how the driver behaved before this patch, because the
callbacks only updated a bitmask that was never read.

> If that is your whole business why not use dummy_irq_chip?

Thank you for the suggestion. I am looking into it now. As far as I can
see, dummy_irq_chip only provides no-op callbacks and also sets
IRQCHIP_SKIP_SET_WAKE, so the behaviour should stay the same. It would
also let me drop the irq_set_chip_data() calls, since nothing reads the
chip data after this change. The only visible difference I found is the
chip name shown in /proc/interrupts.

If you agree, I would like to switch to dummy_irq_chip in v11. Since
this changes the patch, I will not keep your Reviewed-by unless you are
fine with it.

Please let me know if I missed anything.

Best regards,
Ming
