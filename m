Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442167;
	b=S8+meg/F5oGY/oRnVQw0a/rv3TfPg90Ltq2KoaZqQGkwaeWjtWVmKHB2J0W760QMTM9v
	 KoU6hK0/P/BgsvcwbFrDCdk+M3Wwz+U8AbWq8dItm/fyC8dKQnzDxcjWD/C8Sp70xNlRl
	 EddA5edwOYvUTZ1lQ8FVPHD2EHbzLpK6lunKjEJGR8IDkF0qCWz7z5OyFP3fOuSjVD8or
	 b5rp5ES5BlRJ9qNsVwzAErqAQUcyj0+otF6sELue1VfBtWr5MyY+Eh16ohtsoIachwUNC
	 /kfPD+VsSshL7YfmNLHY+LL1qWivvCbN3EkSepA03Ya+kut2Q5tx7hg4BhVNpf5263Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442167;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=fFpI872Cf/0Y3V/7ACsDXrJgZtjpIqvmldliRG0kQ4o=;
	b=p1avN9g1Xtuc9IPoiHK9V7nCeAtx1b3y4EGtKef3uLE3X5lpzfnYsvAasZX7UW1jSaAa
	 52Am7PnqxkpXUCS1cuukY44+WaasLhe5UpmixXkL+CmLplYehu1F9vfBGZ6O6gpTQ133c
	 o/qWpHR2aFy1EH8Qkds3mV2/z4X0lrMfNMpgkgwDDJZ+3/YPMAU1ZRvpIxvlWs3igALnj
	 1iam4c2yka+EdQ257mN+DjWkboLnnbvS4LsWPYsxUlr/pxmVtCi0fYqHhdy7+W6jjqkua
	 g2ovZwnr63WjLzeSTE5/JgMAeyIXvx979kF7N36L/q07rVns2d+RETZlNTe3Li1WLKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=B4TKNR3G;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B45606A332
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:56:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30B45606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=B4TKNR3G
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e46e449e8so2148084f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795442165; x=1796046965; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fFpI872Cf/0Y3V/7ACsDXrJgZtjpIqvmldliRG0kQ4o=;
        b=B4TKNR3GDSOPq1GOrfZ2n0x33dn99brqyZXfHnclARTRlTytkMY3Lc52bL94D9wLz7
         C6bCLu56IUMRff3wHE5BUV8D784CL3fiN8DVTB/eNQDbij+YuoBbA5InIzhAtZ6RQApT
         jbze2rFeEipP5KaApt07Oe9J3pnL4V+jkaZl0klL/1uOcvrgg2F6X90pXeWfFvL+S3lR
         IuFK56Xh7KWWQDqRCoj53IG/ezVUSEsVuMQGjnzJcbqp7u95nj1yo0jDzNHvkVpAqQfn
         /ZrTRpkKPtHdgI1n4fnEHv7v8PtPpD06DFjMjw0Znmz8nJ+7n4c5c1QZO8l1hYz+IqM0
         CjIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795442165; x=1796046965;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fFpI872Cf/0Y3V/7ACsDXrJgZtjpIqvmldliRG0kQ4o=;
        b=Hmy2xw69KtFuwSvKELXC12ZFLHFvQkGoc9ohOoK+TIiJ3CK/kfkanM9lHsek6iHDjC
         v0ZLA+zxlcUJI4S0fNxvrz2x5u6Ezrm5HGUNzUlbz+Tzv2Css0OWZ6aGyIHCT/jqld5o
         JmeSKGuqWc0Hn4MzZLs5qOGT2XHT+hlZdHpncKTbHrO8lQCwZPZokOhKE6zv+RUCdtEI
         5y9ccTAyoS+U2ePgrJABpLdi3wQEqbWSUJT1zuecBBO5HX13+E86Zy49zd2F37Y4mmjF
         xYCjs0VoqHpENwQCIya5cytI9+NXtQmTvsJXT7pmG7LDkACFFcrvo/RKjD1Bg8P6K+h2
         ct1g==
X-Forwarded-Encrypted: i=1; AL+hErEUPhLEVfDTKjRPbxPvNl/rExzyy+pNUMfDMlFpDu1yr8IsrfVOTva7B+I6CBQ2v7aj51qoqcmnrpmqPwY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nwdRcAzx41TDub6P/iFVFcNwRGOYmR6c9jLrVZIt8mJHUvzNA
	7YiPImfO4Lr+PoJARk5PUswd01LHgzX6ZECKoPjtvb5HIT0rcHaqZ5W010OafJtbng==
X-Gm-Gg: AZFdTZeAma3db0J0bUnEG3QKmGvt6qAwLbuQq41b0imTy3Sa52B0NQxCzeNQc8W4gC6
	U4v6D8k0qTju2skcTz9npcFouDDro/C62JnRkNaVqWzj7AqiRB5cDoAbs7qB38qftbi/faQcYOb
	N29t/0sKewLwFDYfYKsuHRH+mG2CTiCrbbFPzmBokcJ0wjQLm71m+K3lIrVzeDGBMNT38mQhMOy
	gO6U2by02k4/EFH9akFmnX2RDruAS9AZ9nul5Q6wssJSvgERcKFpxFZCbKign4lrwod+hciIlc5
	g38sGkMJaD7gnzJGubb5b7LMGypeXhX+1WXzsmEJA3hSzmLgz4ir7RZRnsM7eOYFN2Kn95FvsOs
	p8c48rYvsBapAlxYsp18LGXd/OxBh/kVlHWTxPwRMUFxY4yFC+7ySGowDkzB6NP0oi08J0j1FW7
	S4BF47eTjwtu4q5KeU+60tWzR4+L4+MN7Q6NvQKV1bbKYAh27UjXqB1qx2V7CCr3I7q3HX2Z/BW
	Ud03cKyKV0fqqlr2fGI+RuA9+VKUS/CyeSUraUYrqlOAq0peB4SwOD2mIzIhbprT6UtepGQnuNY
	F07AA1j99xsJlJ1bN7pCtqI4I6RpE2vJa/zB+oIMRQ40C0CKtSv0D18dWxP9bTD90z8rriGZlUo
	=
X-Received: by 2002:a05:6000:188b:b0:4af:e519:cce8 with SMTP id ffacd0b85a97d-4afe519cf4fmr11119558f8f.34.1795442164921;
        Mon, 23 Nov 2026 05:56:04 -0800 (PST)
Received: from elver.google.com (124.100.205.35.bc.googleusercontent.com. [35.205.100.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb98b4dsm23244162f8f.53.2026.11.23.05.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:56:03 -0800 (PST)
Date: Mon, 23 Nov 2026 13:55:59 +0000
From: Marco Elver <elver@google.com>
To: KunWu Chan <kunwu.chan@gmail.com>
Cc: Dmitry Vyukov <dvyukov@google.com>,
	"Paul E. McKenney" <paulmck@kernel.org>, kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC] KCSAN support for *_THIS_CPU()
Message-ID: <awRF7-R1JjQczRgn@elver.google.com>
References: <CAN_Opa-WpbC9wXTYPybiZCrkMjQbSTnfJvUck7YiMP9wG59y4Q@mail.gmail.com>
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
In-Reply-To: <CAN_Opa-WpbC9wXTYPybiZCrkMjQbSTnfJvUck7YiMP9wG59y4Q@mail.gmail.com>
User-Agent: Mutt/2.3.2 (2026-04-26)

On Mon, Nov 23, 2026 at 04:15PM +0800, KunWu Chan wrote:
> Hi Marco and Dmitry,
> 
> Paul suggested I get in touch about helping with KCSAN support for
> *_THIS_CPU(). The wrappers [1] and the got_idle_tick annotation [2]
> are now in tip's timers/nohz branch. The idle task and the tick
> hardirq intentionally race on their CPU's flag. A conflicting access
> from another CPU to the same instance should still be detectable.
> 
> I'd start with static per-CPU objects in strict mode. One option is
> to keep the lvalue API and pass the actual address and a THIS_CPU
> tag to KCSAN, which could warn on a known remote instance. This
> would let us check the pointer the tick callback gets from
> container_of().
> 
> If both accesses are tagged and verified as local, a hardirq hit on
> the same byte range would leave the task's watchpoint armed for a
> later cross-CPU hit. With a per-CPU record, the sampled task would
> stay non-preemptible while the record is live. We'd also record
> permitted local writes, since they can explain a value change when
> no other hit is captured.
> 
> Does leaving the watchpoint armed on a permitted local hit fit
> KCSAN? For the ownership check, would you prefer a separate check in
> KASAN or in the primitives? Would it be better for the primitives
> to take a __percpu pointer and resolve the instance themselves?

This is a lot more complex than needed. KCSAN already has the building
blocks:

1. Same-CPU races: if the watchpoint is armed with interrupts (and
   NMI checking) disabled, a local hardirq can never hit it, and the
   interrupted task can never hit the hardirq's watchpoint. KCSAN
   already does this by default, and for reordered accesses even with
   CONFIG_KCSAN_INTERRUPT_WATCHER=y. No per-CPU record, no "permitted
   local hit" state, no recording of local writes.

2. Cross-CPU races: READ_ONCE/WRITE_ONCE are atomic to KCSAN, so today
   the *_THIS_CPU() wrappers aren't checked at all. Making them
   ASSERT_EXCLUSIVE_WRITER/ACCESS-style checks reports any concurrent
   access from another CPU, marked or not.

So the whole thing is a new KCSAN_ACCESS_THIS_CPU flag that forces
interrupts off for that watchpoint, plus the wrappers calling
kcsan_check_access() with ASSERT|THIS_CPU. It works for any object
(static or dynamic per-CPU, container_of() or not) and in both strict
and non-strict mode. A separate ownership check (KASAN, a __percpu
pointer API, "known remote instance" lookups) is out of scope; it's
a different class of bug, and if a wrong instance is used concurrently,
the assertion catches it anyway.

I have a patch with tests [1]; would you mind giving it a spin on
your end?

Thanks,
-- Marco

[1] https://lore.kernel.org/all/20261123135148.1146372-1-elver@google.com/
