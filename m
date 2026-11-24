Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795548737;
	b=qPNozOJdLIF2wmEtc/PotaNFYLRtrc2eBxx9/RT+LBxl3lkUD8FrlCgrCBBxlTiWXPdf
	 jE4pU+1BA6S9hrDptRhFuJFbd3P4gN3PDGbf70cHFM5grx5peyhMTMn1NbHGt8IBoEgg6
	 poPmE7wYC8YecRId1LKZmTcNBFxB9zGmVtRsDd+JaQlva9HxxlBAO8YdZSYEiwJqQuQQN
	 l6SiavBeUWOt/EyGYcZuQ2+QUkBsoipVzAYb5sGFPW4jan/rs2S6xopkOG9ixZT0MM28R
	 jB2YYVB1LMO3mPgV3WeU0zWhMVVnyVr/nOWUhrc42fnCSo/+0oqO2HsoozSketGYLyQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795548737;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZAxiOHywnX9WGKbU6OO6shBw5Z7J4sNZ2Iv1jEEha2M=;
	b=cozfvCm5n14OnVDBh6Z07UrwlkjTz1ef7Vbt6aTZB80Hz7eK6Yn/5T/YWa9c5dYGccJ6
	 EbUxT81knn07PDwMg6UtgrVBo4rjBn2SIaKIFVVBi/Wp3Ly0HtUv795Ug6Z1TGlu3vIxH
	 O14s1qqFA5tFvcIdVfQbQkrs14Bs09Pyb6JkoLbS9dp4kJD0qDWjm0+2VDDfIMan3P5k6
	 fpvIzUGWpPL66c8FKVMItKnu8MDe/PCGQuqgHFTCzESPkyWJ1n4ewalGqFsK/tQ00JTZt
	 Dhn+s2NiYo8yhwkyniigMjLUUFPw+YHB6VtqsfcWgR0REmVLCB0Kc/NoyvUCx3bkerA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XuaxmN7d;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B932D606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 19:32:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B932D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XuaxmN7d
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-498f5fa5103so2948820f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:32:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795548735; cv=none;
        d=google.com; s=arc-20260327;
        b=CBwOUUyhdbw1iktxLOdv7RTcYEDJ426eG47YUxVNC4P8L7VIJEfCl39rhkX6p7U6jh
         31Luw75j6faLCw2krqUe0O2R6apElyxcxkMqXpAEdlbgF/R/F/xS/9NgXlDQ+6YK5QZ7
         WH6enfaIgWxAQ3Ebl1mcxhWzgIE621863K2skvY8kx5YgrMV7tHMcYcYR4V62tRjRcm/
         85wDLez0beCK8Qgo5VQzZNT9UIvahDi6Dvxb61annPYz65A018LIYpxwYEXXpDmBaxAu
         +wjCJ8lPrgu2vdIl9xRX8jwWeUdjJVH5B2gTnhCAMeYgUcfq59w/J+qBq0qaaMwEWXf+
         pg1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZAxiOHywnX9WGKbU6OO6shBw5Z7J4sNZ2Iv1jEEha2M=;
        fh=y9Qa8QuDGdaSZnIAOwkroCjA3GtKbXrT5ICUUqlhFEU=;
        b=DEhm23wSvnNJ5e575Gn7bkQ3oo7ycVy05sLt5Ne8FZ/izsPghQfbSMrcwZQG4SBzOQ
         9VQDSm2mACFpA596rG1F4hwj9VhyOvigWlxdRu956ek58j8BYQls4RqhDHnIUhjMbGAC
         zhm9wMdk30KcND8P/OdmMOAIntuhPWxbJ/InPfTddzH2LAAnHrHxYwnyHitK4gVuD781
         fjW7izqsfQiQL6sU5TH/4kFYS7N3YkOZkcwMvWv3AXvpEyUVNm3kaD0LdIK3JX5S0Uwm
         xHx6gyibB+jWuj1ro7eSkGUJHFkWsX33a5+TBbZ2gF9qUSxpWcqThvcWf9eMKJ1x64YX
         wUOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795548735; x=1796153535; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZAxiOHywnX9WGKbU6OO6shBw5Z7J4sNZ2Iv1jEEha2M=;
        b=XuaxmN7den6nbuExUCmzqd1+5nYYTss1Hp5dHLEVuAwKPL8G1k1HoTpRPlp5mcqOEk
         w61yR3XStauvB+FR/SIPPo3IUmoqlKtVytqJsjsOkA00E1b5SBd3EdGNHa2QbDsrpxKc
         Gsi5HQAEfDffAJrWNgE7qtoXvCRWySF0Vo4n70PNv1yZTFbFnjNwy0XEGVK0bx/jFF1t
         6IPx5JldNPtKAWL2iePUtI7Wn+pYr1xxDLRGPP7E9IO/mVsNujKCy0T9yeDwMbtl7/Ak
         pZTVTYUwYOvMjQ1DY6FPRufUOOTzRfdlFYr5iLavYumE1qT0MFp2jHfcg8DK6TKEC5nS
         dZcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795548735; x=1796153535;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZAxiOHywnX9WGKbU6OO6shBw5Z7J4sNZ2Iv1jEEha2M=;
        b=C7eZdjaCnC2W+rD7L7kfLfWMtEFdwlZwDFbPk0TD2FVuhwPYuIRlWJkLAXYIcTWLmw
         /89x9rzGP7Mm4TGW3ANAWVBMjQ/5OzVU8pCzEFurtnAWvnRoYC1SEcRJkLjN/7rNsuDY
         xGnhCPUejgK0W2FrywWMMnQ05NUhdO1u+M50pcbVPEe0VE0Kx3wNoqDqAJEIZ5l/GweP
         P9PxklD0uezmBNbIx4MursNieWY8XdvZJaNFeO+ARCgqG1i9X0ilxI+InCWqlqJ4FAeu
         KBGgjwQlN+YhU9RtBQ7t1t1aGlO+Te4Qy8O2OOJH6aYY01IH2BR9WClNyVxv6A0D84AM
         g2fw==
X-Forwarded-Encrypted: i=1; AL+hErGDgE0F58W4k5WQL/iAEhyU/5btJFsS+UdHFSxy4cad9MwvyN4cU8tUYAbmtQQ40QTrZXJYeyrsrANYwH4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RAAssKFNha/kJm1Y/yb1iI6X6QwRFgPlPYXhj6caqOwryZaZM
	t4f3UOAJs/ob8tZhPGOuFWPlrAYlHgoIL9cB8Yuedd0i1W0eVLZohp8hSlU5ZgnQ9kfeXqb1a0f
	vnh9CNSad+4LLwseHJSeir2ck6BWhzAqzwhuCxveJ
X-Gm-Gg: AZFdTZdN2vWKHj/8k1GdAgo2KeNJpsv3CapI9kTC4sG3JexqorouWqHLgfiEdBXMmq5
	at4SX0d8XpcW92ddrAKHqgI6OZx5VEm7UQMiM5/+cvwesyrsClcD5q7d20z1mxpDfPLU8MabHtG
	NxJdlD8fKizHSTNaABPTbn84nG8rYiVTmcahag/LheD+TFVU3BmEF0+7G+zZiAA0cfSU6uW96VL
	/+Vn+PRW/ZDaukpL7PDZHGrCa9n2HlRzKgOPlx3qOgAuZTwwlRq7BNicvBEeTm3ehhRA/qKTdB3
	B7+pc21R/8bI54b7qjJwgoLglV1wEWTsdoLWz4uERmN0m5FciLVCCoyLi8cSbeVzUlRK5dPGqlI
	wOMUlxq+cXBSBh1mrG6cuTGrnKmUlCuUDC82hXx+GNWWvd1YTqODDz3ABqUofxRwCJKXGaPbXyH
	0ZRwnQtqQZyvOnxjZQTZZJJIjg5dOZG5vvav0SfaJjp9s18ym6nslw04mKy/McTxLJAV8seOhfE
	U3sRJeHgyGNoAgOPYD0WcLTV1mcE95X9lQ75Q==
X-Received: by 2002:a05:6000:26d0:b0:4a6:8012:197 with SMTP id
 ffacd0b85a97d-4ad5d5f9320mr28719033f8f.2.1795548734442; Tue, 24 Nov 2026
 11:32:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122105646.2223131-2-ardb+git@google.com> <CAKwvOdkOjGkGajGMKtqcHpRSrpXC9UZrH9XPsiv5Rpcdte5tJQ@mail.gmail.com>
 <73d50ff0-36db-4dcc-ad1e-c34bf3ebbce6@app.fastmail.com> <CAKwvOdnh-0nOBdU=J+R-yDE7wrP_K2BZ7mY1icrL-nOQ3Bk=og@mail.gmail.com>
 <20261124163905.tkkaLhJ2@linutronix.de>
In-Reply-To: <20261124163905.tkkaLhJ2@linutronix.de>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 24 Nov 2026 11:32:03 -0800
X-Gm-Features: Aa3M54ouZRguUQR9nG6q7UO6lOaHzISYR95FpQ6HF3qArhsy-wx2-5UKaW59wuk
Message-ID: <CAKwvOd=KbZgizb1VhD-zq4S1jRGCxUaLM+VHeRNhTFQf+KMrRQ@mail.gmail.com>
Subject: Re: [PATCH] locking/local_lock: Don't evaluate the per-CPU lock
 pointer if unused
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Bill Wendling <morbo@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 8:39=E2=80=AFAM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> On 2026-11-23 13:52:09 [-0800], Nick Desaulniers wrote:
> > On Mon, Nov 23, 2026 at 1:23=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org=
> wrote:
> > >
> > >
> > > On Mon, 23 Nov 2026, at 20:12, Nick Desaulniers wrote:
> > > > Very detailed commit message, but you kind of bury the lede here on
> > > > what the actual problem this patch is fixing *is*.
> > > >
> > >
> > > Apologies. I'll trim it down,
> > >
> > > The TL;DR is that non-volatile asm() statements with memory input
> > > operands are not elided by Clang if their output is never used.
> >
> > That's not a bug; both Clang and GCC behave that way.
> > https://godbolt.org/z/sEhec4oae
> >
> > (perhaps there is a clang bug somewhere, just trying to suss out if
> > there's something we need to fix here; forgive me for being pedantic
> > here)
>
> I see a
>         movq %gs:this_cpu_off(%rip), %rXX
>
> on x86-64 with clang-21, not with gcc-16 for local_lock() and
> local_lock_nested_bh(). Are we hunting a clang bug or considering this
> patch?

Both; I'm just trying to better understand:
1. what is the actual point of the patch (see my "burying the lede"
comment upthread)
2. what issues on the clang side are outstanding and conspiring here.
I think a v2 with a revised commit message is good to go, though I
don't know if Ard saw (or ignored) my questions about the temporary or
casts? Ideally v2 adds git trailers for:

Link: https://github.com/llvm/llvm-project/issues/93449
Link: https://github.com/llvm/llvm-project/issues/245738

(Since if both of the above were fixed, this patch would be moot)
(I've assigned the second one to you, Bill, since you're "in the
neighborhood" (touching lots of related code in LLVM recently))
--=20
Thanks,
~Nick Desaulniers
