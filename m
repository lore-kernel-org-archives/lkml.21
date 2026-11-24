Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795515849;
	b=uDLLjpQvSsoomTDUt8tTDHaWr/xaL0jkTC1dfz2kRyvh6fYxL+wAzlubNXQ0kHEuJAbI
	 wNTeFEuO38rJ/lj6QQm7PkDX/wUNHIBuQNa3BG6AE+rlY7g+18pYOdPuxeRyVx1RngGkH
	 +27XOGtRldcAGs4VIjpwkReIzzcFk5+P0/Xob4b5DXhyrVPY7SItuTnrZNRCOzIh3PisW
	 9ZmTfbWfZR/vu8gr7yvhHzjMD6klMTZYA3vXemX2QRIyGW22xxfF+xRNDfTxz6uaLRO2m
	 a5NnYDNxjXgk3eIedvtmNLSHYaD2xBEwM7s/i5rnFiAQbUE3X2iAWLFXq0bHwoP8pYA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515849;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PJKRSvMnrFSC8ixG6G1IhbXM8Xj88fCQ1tCS7WTK6aI=;
	b=4Co8ELOYBUj0iZe2C8qjIWLDNxoZu43OEUfF+C0YnmQUAZADkpXyrAEDsB91nATCcHSB
	 4Wf2VxxPod8vZfL/tIvSDGcr1LERsn+NHsUGsCzgPoLJ/Ab5t+47uag1lvv0FzzV2xIY1
	 eV0KdJLVta7uY5NfUavSIDlyos/HDdBrlXdaNIy69vlNHgs+clDldZBcIV8LU8aI/vBJO
	 J7ZiXx1+sVccmOo9lOKAs6DwSgo9yVWGr/1MAklBWwhFne103MmtjA62q6Vxf6gDkV4qW
	 cYf+esDCJpVpoLPcA3FXLychRxDDTm4vxPM4aNW8//woofaUB4Qj3z6hXmxu6W+D7dA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IUIHzJET;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA32606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:24:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EA32606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IUIHzJET
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-15dd124bbe7so4242022c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:24:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795515848; cv=none;
        d=google.com; s=arc-20260327;
        b=ElC6J/76+VPz0kyN2exp0La3bqDmICiOFCp+ORbxs780gItwEEbquxwmXyr5G41fuz
         8LlNnOgVS20aqVo0EyHuedLZUtVA9CbQVZMDM6KCdkI4aiWtNzk+trF1/87mHQv7zVNQ
         rUrZBnp3rLure1tHRay6nRPQQgwsXcOVAtNCstzx7vRJ8sr9XqCG5XY81CAY9FHWkUZY
         VtWpjEw/zedKhttmw2fC1rzuAQHJLaSlRTvCGRj++IGiWy6jWieQkq8uPXyWtS4Cjp45
         4ks6+srk4a1NpJ71c6NuJ7ixSmNmLOELhNaiui8qEIzC+BnThlHq+PxhhNKVTJ3fn6IZ
         5kbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PJKRSvMnrFSC8ixG6G1IhbXM8Xj88fCQ1tCS7WTK6aI=;
        fh=g/8fHyN3/0B71zw8YUtyYGf5QOXowNJshLZNVTjyMgA=;
        b=DrL+uZAACEX4EtCDpJeJ2kqUb1Qn5St2A7+Aq4SweOaL1buSDqBOpLVHAzUx9h6CF3
         Ia1X+sc1IT1ANPFN7ZAN04I1Xy4N4Q57TW+UzhkHu1uPaNkInmArjOp171T+oUuWiBcJ
         Ipptj9rel9KgP2Z8zut+GnE0FilWYkk157GJONRxXLSrvbbeSIGD/uA9uhKvuByd9pTE
         JbAKLjmCLKGBuU84LR/9Dojjuf58hz+M931buGlCD1MQ3jzZWCTKICc3rsuWbuZFj4BA
         csqKDXevSvCgkASx6kY76wkTjori+gtMPRYURqZFTSyZg1oTUMLykInF7fcAk0reXPHv
         H/zw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795515848; x=1796120648; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PJKRSvMnrFSC8ixG6G1IhbXM8Xj88fCQ1tCS7WTK6aI=;
        b=IUIHzJETvxapEbZnOJjbvWOlSl/mMqMKTND+qGcwUipwpcGMiSeA9hZqWKANrtoiq2
         30XSbjEZbSUvgF9fa+CCEg6B5iKfKyvUHcw5ZH1AV7GDbY0i+hxYmMNl3E26WluMXJ1U
         QnzuCwh7ltM6nxsDU3pSma7lDrMlsCftfuxUc1C2CTWOv7QEc7O0RuRPhUlSICHs+R1x
         OSEopBAvHrcNTVIBTKUUQUbHBbPorklz1cJHN8udEHLu+IsGgDRwRsnBIhkdB5f2aCTM
         8HnN+TigTNJ7vXPb7i1g1v2wsTxRXxY3FeLzMH0SD4m581OYPkvDtf428apCFFGX+w9k
         qXqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795515848; x=1796120648;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PJKRSvMnrFSC8ixG6G1IhbXM8Xj88fCQ1tCS7WTK6aI=;
        b=hW6CUsdgqF1vGvnq08llJF29WLp1fZ0i6npGF1D/M2xMD+2Y/DetGfUfEXo9rpaBfT
         stqLgACrqKbOyUyCvorK39ez/6kax8xNPhdDJCfDDt65R/gBbWA10bWMdrie0/Q0TwnG
         +v0KkNzTkM1/wNuyt2eFpPrCt/BwlsvLzBLri2DOs86wcD61zzSGYRlt8XKRwE7lwJmb
         3C3A5amRNpq6HhAtuE9YuJ6Tt9FFkW0TuqtLi+SSeXs0toBOAOf1aVoHJv5qTm0Sox6G
         ys5aX6bIxwvcEBUASybqtzfZ02hxogmh5C4DG/Yqo1Ke+icIUKzwd5XpuoZi83rsFXhK
         Of+Q==
X-Forwarded-Encrypted: i=1; AL+hErGxB2kotbLSeVmZFt0b6jYQxn8JMOPhsKv8ZwiWgMmC8LNjCUJ+RkgWfXdnPt6cCecP9KOHrXAxO16E9lA=@vger.kernel.org
X-Gm-Message-State: APuU4Z82QkHND47OBD0/g4V5iy3jiZxuYf/4BVMAE/kvSEguj4JWM+6C
	RU43JDj9mwib/zcEP75W4LqpxsEcuKkW5hZCRqlMR7Dje6FBN/JmFb6jujvFzYeAhod9wpkM609
	HgT9MhPKSw5lvCXP4v3FZqREEfL7oibpD5g8LPZoQ
X-Gm-Gg: AZFdTZemo+HJeOy+VISuIlHzep3tO11q9ew+/1c/4dss4h2XiRDhUm47Hfwwi+OO8qk
	NCizaz93+Ju4wpeI5O1XAPuF4Nvrxmk5D5XR5X31nOwNmLsVsaqQWw5gkDLYJ39cLhvm5GP7IbV
	Z9Qufca5FgvedSbwf+FOJM6kPvlnaFuP5ZtyMVmfrNbHRBywAoWZR9u3u/LtPjNmOss1C/upKS6
	jIirYf1cG4g3DqtkoZDp+LToXp1UeVAuVzeTeKJEWvciWViXNDEYOThDNKoqzTQBwkAtyNJNFw1
	eQAaKVx5k0rRU/I55ASa+WR5q83Fg1GPik1VnfTZEg2iIUYP30dWLVCDxHgXNwNPapgTD0JfDZm
	ye2hyCFWYzR2Nzw9sWj/l3qHGn++Zz21Au5fTQbve5mRyxQ1tgtXQ2CMqEUbsWcMUe440
X-Received: by 2002:a05:701b:4584:b0:1ac:9da7:e86e with SMTP id
 a92af1059eb24-1b556908c17mr14577708c88.30.1795515846955; Tue, 24 Nov 2026
 02:24:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123135148.1146372-1-elver@google.com> <CAN_Opa_TKjDAWz8EQaw6ro=joymwurpcy-k_x=q4E6TLt6ZpUQ@mail.gmail.com>
In-Reply-To: <CAN_Opa_TKjDAWz8EQaw6ro=joymwurpcy-k_x=q4E6TLt6ZpUQ@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Tue, 24 Nov 2026 11:23:30 +0100
X-Gm-Features: Aa3M54rX7NhMvWiNHR-Tlf4y9Dtfxu9Xuj2WtFxJ7RzPEamu0euXSCR2FjPDTw4
Message-ID: <CANpmjNNOVD3KVrau5KD4WzqxoMkZZoJCfdPzvjLmZsGy9zXBug@mail.gmail.com>
Subject: Re: [PATCH] kcsan: Detect cross-CPU races on {READ,WRITE}_ONCE_THIS_CPU()
To: KunWu Chan <kunwu.chan@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Alexander Potapenko <glider@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Dmitry Vyukov <dvyukov@google.com>, linux-arch@vger.kernel.org, 
	Thomas Gleixner <tglx@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 24 Nov 2026 at 10:54, KunWu Chan <kunwu.chan@gmail.com> wrote:
>
> On Mon, Nov 23, 2026 at 9:51=E2=80=AFPM Marco Elver <elver@google.com> wr=
ote:
> >
> > READ_ONCE_THIS_CPU() and WRITE_ONCE_THIS_CPU() identify accesses to
> > per-CPU data that are intended to race only with other contexts on the
> > same CPU. So far they are plain READ_ONCE() and WRITE_ONCE(): no marked
> > accesses involving them are reported, incl. from other CPUs.
> >
> > Make the new accessors assert exclusivity but ignore same-CPU accesses:
> > READ_ONCE_THIS_CPU() asserts no concurrent writers,
> > WRITE_ONCE_THIS_CPU() asserts no concurrent accesses.
> >
> > For KCSAN to ignore racing accesses from other contexts on the same CPU=
,
> > introduce KCSAN_ACCESS_THIS_CPU, which makes KCSAN keep interrupts
> > disabled while the watchpoint is set up.
> >
> > With that, any racing accesses (incl. marked ones) from other CPUs
> > involving READ_ONCE_THIS_CPU() and WRITE_ONCE_THIS_CPU() will be
> > reported as "KCSAN: assert: race ...".
> >
> > Suggested-by: KunWu Chan <kunwu.chan@gmail.com>
> > Cc: Thomas Gleixner <tglx@kernel.org>
> > Cc: Paul E. McKenney <paulmck@kernel.org>
> > Signed-off-by: Marco Elver <elver@google.com>
> > ---
> >  include/asm-generic/rwonce.h | 22 +++++++--
> >  include/linux/kcsan-checks.h |  1 +
> >  kernel/kcsan/core.c          |  6 ++-
> >  kernel/kcsan/kcsan_test.c    | 90 ++++++++++++++++++++++++++++++++++++
> >  4 files changed, 114 insertions(+), 5 deletions(-)
[...]
> I tested the patch on next-20261123. A 60-second rcutorture run
> with strict KCSAN and interruptible watchers completed successfully.
> I saw no reports involving got_idle_tick or tick_nohz_handler.
> There was one report involving move_linked_works / queue_work_on.
>
> The latest KUnit run with kunit.filter_glob=3Dkcsan.test_this_cpu_* gave:
>
>   local_noreport: 7/7 passed
>   remote_write:   6/7 passed; threads=3D2 failed setup with -EBUSY
>                   ("rcu running")
>   remote_read:    5/7 passed; threads=3D16 and 32 failed
>
> The -EBUSY log shows that rcutorture was already running. The
> remote_read failure at 32 threads occurred in both runs. I'll
> rerun the KUnit cases with rcutorture disabled and check the
> console for the failed cases.

Thanks!

> One test question: should local_noreport skip when interruptible
> watchers are disabled? In that setup the ordinary watchpoint
> path already masks local IRQs, so a pass wouldn't exercise the
> new THIS_CPU behavior.

The test will pass in both configurations, so a regression in either
would be caught. Disabling is not necessary. More coverage is always
better, even if it may not seem useful today.

Thanks,
-- Marco
