Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795513699;
	b=VkNXOVRUP1tycyEuWgMEgBL2s/CqFNj1A8FfLKyxQpOmGHKrvj1kmNZ0LfN4UwDAkorz
	 Ek6uJoMH+7jfCCckYuNoue2UO+ZBJOiweQeug/ofYDkobABXfvvNPo/VjfaM9JQsgQ2D9
	 kAvL3ID136B31qw/Wu3lBofLzSqqk/FJBOvhxlVlFEzZ+AVucDKSEprR9UtUmyxmDl+SJ
	 6uSJ/ekRp5rsjk7TTSa1ACLscqTbqx3FS1Qqw5ZL3JXbSjGHpGCuhvq7lzmuJ1heABmi5
	 CkCavlZWXMey2BnjuS1hjPZeqSGxCer2EnrYArajRGAPqqsMTyCQwN2a3R9T1B/4sNw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513699;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Cu7c9/w2+WpfuPJC0OfHVPmh5TZ1Kfq6VnMQBRjBpjA=;
	b=HRpmAQJefuX+JSCAe5DkWCyXkGtR678mMwxOO6G97mGZD9Ob8u84saboRoJLWlqzT8Pd
	 nxjIll0PCTc/0BY6Pk2YpExwg2bgYOLH/tW4jRv6v7/SFMSfpinj+FWfuDxfB+byqC33n
	 5EmTsY/3BtIGKytLUcBCyYNJ1xginsTj+MdN12HIju8BdolbdNZ9pKtwkdQ64umddi+wh
	 sEylwX5SZtXPZe4jrfXkE7YVy0yIwxyL99F6HKPMKCqQOJZfZRHHVTO/+vC9iwOLf3190
	 QWMA3AxLjagyuIVxrbED1eDUbvjkWjuPeofKaGam2fNUa1RvpD87fq/s65Up2753kFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LNxEuZAB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7958F606B020
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:48:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7958F606B020
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LNxEuZAB
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso41599805e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:48:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795513698; cv=none;
        d=google.com; s=arc-20260327;
        b=QHgUt/SPHc9h2oYXYv+bd9Om3Ik6i1oKPfay/GqEkrg/DCo6ppBeW/dXmDC6xf4R63
         6dNKv9RtXx0kYTPxI2e1YeXvj+ScwOolBbQzZjq92EIXGY15yLS2ALBkumX1A6wzbpmO
         9Rm9KhD13MOJ+lgQ2XRWI1+Xmn8alCf1LOexn7BtL8pKhhzwCj/VJeMySfWaXc/olgW4
         ptMz23nNesY82Hmr+WpjU1tqyMvAHleXOTxTLWR83lCRwowxGtHDm4jLZi/3gMSByuN8
         Wm/T+aZHBn9M7lvIfTOi5upqh0KhRxrwMu1K5FdHGjwd7A8mz3W3gA3lDitvypkNijq6
         q8DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Cu7c9/w2+WpfuPJC0OfHVPmh5TZ1Kfq6VnMQBRjBpjA=;
        fh=5kqGyMei5PZWBLWzQztHa7UYziKCMVxe+nqWJotjjSA=;
        b=kmNKIPyMtU2Agu480sVs6wn7uicAb+YrjNu6BVhKERmCVao3qyTyY7zLCy3DfQLrXd
         NW/GmrLRvJ1axGw5+nQ1+iLCpbERZFTR7l8MA/k1crI7cySH3+4GRwq7ZQIt4WAnh2o0
         R6b3o/UcLg3K6gvxn967ir4ytzmF7b8uiPCZCW/qBDpcGDSP9ui48cl1ry0mc2HssFsx
         SNYKPg0ocueux13rBzf0vJrwr45E5iDTqcTkXbWDxGTL//H5a75cWdDYXHCHdf09bkNH
         AJ1LiSdVk5956FvAMLDdIO0Pd0abfmHhosVUZVErnz1v1QtGGFT+KVYEtkZ4KK086g+X
         ZQPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795513698; x=1796118498; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Cu7c9/w2+WpfuPJC0OfHVPmh5TZ1Kfq6VnMQBRjBpjA=;
        b=LNxEuZAB+9FYaWJhuVSM9gs0zli480tdbq04T0zY2yCtuWfDQI/rkUlx32zjIzQ5mL
         sPq5KSJNkRzVsTQUZPjBrQryExhlouFUCoZJfD47O4i2kf6z6t1Y2Qdbvx9o37cFedy8
         hw0sLfuMimGwigzjzXp/cXb08IH/6dduTBMsDoV9l5RRfFkpH5QSKmVW5jSTL4urBk4g
         iYy0KSOdnRA2pL0DQWeN1C5Xo9lP+yWE13sHodaCiG+sINokO1WQQkWavm+8XaJU6COH
         y2hcpe0FH/OkeZ1M6U9KGD3FTQbZqqfr2yVrMEE3O5lVSn/EnGxyua3kNlOfFG63Ncmw
         0JkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795513698; x=1796118498;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cu7c9/w2+WpfuPJC0OfHVPmh5TZ1Kfq6VnMQBRjBpjA=;
        b=e+X0spvJDs7iFydHHMN/KAYWVhYcjURbpCEY+Ema1LeneiZFl4hFqcp087cDC63Dia
         PW8JVrhl5Fgh0af64X0YBKKHP4Tkgn2jxZIGLnpFl3dksQ4MMRqrRVzNo8oo2NfwQVPl
         zrp0Jgoaux4ZMbRqJNy+DHj0ftMXfcKLWTr7MwQfVm3UfQc0TWAS5oiVBdjKa2lkPGKf
         JC5l0cR7VvVhW888NAv1L+ivpll1hvWrHBVAN/n3KQ4DS0kLf+Q9MIX5nk5TtI69RYjV
         d0vgV3IfItowKJKoZIRWOsE16eRmw/MI2Bftuf1Swsp1WLrN8CbSxOl9yuWBfvQX49zS
         DjrA==
X-Forwarded-Encrypted: i=1; AL+hErGHaboUSVCTUDhP3iHUO3GqjAGaSY7LpcRfucdoTqQUgZhRcFbHG26Wu9IFl8kLzd52ekNhqMdXIsScoU4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OBs6Agc/olF+JwH+pbxzxfay79AtQ8kFyvZ7ouYghGFQA0i8c
	JITCdrZJz7qCjgXeNJ23RlaPdyeqeLx68NewTx4ATGupNCdGU3PvwSYMvT2FpX1yX7yxfr7LcNb
	V6U6jaUj8RXDV2KmqQx+gJgQ2c+U+Sj1eShKpGpY=
X-Gm-Gg: AZFdTZebrENC5IqjK3khsAQy3jpED42tL6WcRHxu1LDsWVzD9cTu4tJKWWf6ALWxo+2
	LMcUgWUEoVuVKxsg1FwXO9t+jHli5r5gU/K+c4coe0Pd7ZGFuVhlSsyZyuXJNvm9NC85Pw3J/e/
	AH3zC4hTREWJ4Nt6qmM5K38zcyMx93qRJR5sWu/sA0/sVcOARebQ9RHrQlT+4xVXJynwLF106vx
	460fPuh0OJPIAC/6yF25KE3+8EbZ3Bj4laz2XT+d7fBKdgp0EV9UJLp9VtawOFqreGi/E9p9tf0
	IYHN0BC1UJnrNxcRsuZ9UFU1HM3LKz9cRQdQhs3rT51EHnQ90AkMOrKjic9+H8/fLMLP4h4R2ad
	XdjcbfIyIIxfYotk5+8cQzNi23cFwYgLOL90e/UAoOpeSiaJ0rJMZ2br1YrvyEU91QadOXMqvGk
	2LPqlsuEmqQurLXczwDJ7FmYKLCYRC8mD0m9ed30km9TvR7L77nsPZ
X-Received: by 2002:a05:600c:4f4b:b0:49f:fd2d:23c7 with SMTP id
 5b1f17b1804b1-4bb888226c0mr345010985e9.27.1795513697227; Tue, 24 Nov 2026
 01:48:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAN_Opa-WpbC9wXTYPybiZCrkMjQbSTnfJvUck7YiMP9wG59y4Q@mail.gmail.com>
 <awRF7-R1JjQczRgn@elver.google.com>
In-Reply-To: <awRF7-R1JjQczRgn@elver.google.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Tue, 24 Nov 2026 17:48:05 +0800
X-Gm-Features: Aa3M54qFnbsBEn1eiLbpnltoodYvHJBEshBpyws-J9vb1R6b7JBMIVOplFRo3Uc
Message-ID: <CAN_Opa_N4N0njq=fL7eBhKON8faLk10D9EBC_UDadca0kGogPQ@mail.gmail.com>
Subject: Re: [RFC] KCSAN support for *_THIS_CPU()
To: Marco Elver <elver@google.com>
Cc: Dmitry Vyukov <dvyukov@google.com>, "Paul E. McKenney" <paulmck@kernel.org>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 9:56=E2=80=AFPM Marco Elver <elver@google.com> wrot=
e:
>
> On Mon, Nov 23, 2026 at 04:15PM +0800, KunWu Chan wrote:
> > Hi Marco and Dmitry,
> >
> > Paul suggested I get in touch about helping with KCSAN support for
> > *_THIS_CPU(). The wrappers [1] and the got_idle_tick annotation [2]
> > are now in tip's timers/nohz branch. The idle task and the tick
> > hardirq intentionally race on their CPU's flag. A conflicting access
> > from another CPU to the same instance should still be detectable.
> >
> > I'd start with static per-CPU objects in strict mode. One option is
> > to keep the lvalue API and pass the actual address and a THIS_CPU
> > tag to KCSAN, which could warn on a known remote instance. This
> > would let us check the pointer the tick callback gets from
> > container_of().
> >
> > If both accesses are tagged and verified as local, a hardirq hit on
> > the same byte range would leave the task's watchpoint armed for a
> > later cross-CPU hit. With a per-CPU record, the sampled task would
> > stay non-preemptible while the record is live. We'd also record
> > permitted local writes, since they can explain a value change when
> > no other hit is captured.
> >
> > Does leaving the watchpoint armed on a permitted local hit fit
> > KCSAN? For the ownership check, would you prefer a separate check in
> > KASAN or in the primitives? Would it be better for the primitives
> > to take a __percpu pointer and resolve the instance themselves?
>
> This is a lot more complex than needed. KCSAN already has the building
> blocks:
>
> 1. Same-CPU races: if the watchpoint is armed with interrupts (and
>    NMI checking) disabled, a local hardirq can never hit it, and the
>    interrupted task can never hit the hardirq's watchpoint. KCSAN
>    already does this by default, and for reordered accesses even with
>    CONFIG_KCSAN_INTERRUPT_WATCHER=3Dy. No per-CPU record, no "permitted
>    local hit" state, no recording of local writes.
>
> 2. Cross-CPU races: READ_ONCE/WRITE_ONCE are atomic to KCSAN, so today
>    the *_THIS_CPU() wrappers aren't checked at all. Making them
>    ASSERT_EXCLUSIVE_WRITER/ACCESS-style checks reports any concurrent
>    access from another CPU, marked or not.
>
> So the whole thing is a new KCSAN_ACCESS_THIS_CPU flag that forces
> interrupts off for that watchpoint, plus the wrappers calling
> kcsan_check_access() with ASSERT|THIS_CPU. It works for any object
> (static or dynamic per-CPU, container_of() or not) and in both strict
> and non-strict mode. A separate ownership check (KASAN, a __percpu
> pointer API, "known remote instance" lookups) is out of scope; it's
> a different class of bug, and if a wrong instance is used concurrently,
> the assertion catches it anyway.
>
> I have a patch with tests [1]; would you mind giving it a spin on
> your end?
>
> Thanks,
> -- Marco
>
> [1] https://lore.kernel.org/all/20261123135148.1146372-1-elver@google.com=
/

Hi Marco,

Thanks for the patch. I see how the existing assertions and the
IRQ-off watchpoint path fit together. I've run it on my end and
will post the results and a test comment on the patch thread.

Thanks,
Kunwu
