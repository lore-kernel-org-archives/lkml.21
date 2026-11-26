Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.193
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795701464;
	b=ddakOYWkvUH73UyYWhJF7lYQQxPz8Sk+eAPeqhWDZx82OvtoSFsRLtBVk93LdiqFcf4g
	 hkYmWgz/Wa1EjbHaERNM/u6PgzZ0Eby5rjLBIKeq8Vxma2mCQM5XK1PY1IlEdNcaYwStQ
	 fiANAlSVErZ+VeSaMTvcgLxbGM6P24Iv4c/WpMmh/f9dW+OmfkO4aVazyQeUy0AO9RtHb
	 /F2uUo9cktqLlyM1rAOWiBiY23EzC9Ks801ncjOgXj2LHCYWUNhpTbwChhy4V81KgxZGE
	 AMui/2OMWHCUfEMbjR47ZseACrUYBlc+5Ze4LuqTzmY1SIrYt/NkWKiwlSjGhH1ObyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795701464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:User-Agent;
	bh=gBovmTrABiLokh2i4ArfvqDEnoWzprwQsU/xF7x18sE=;
	b=apw5FbX6Fd66+o9Z1ewLxogf639a0wX3eBq68oK8T6ZyrEy/1cItVMZv2f3H37uNhpvf
	 V4Sy6LDc1tOJkR3sUTjq8UGZ2lMtslL0DJxd07NO0Ww9+0CtHDMq3+EnY34BrPTHkW71E
	 ks5SmGcJlfUAIqg/xvUz7Pt4qbJ7P7EOcmZzOCFLvP7l+lw6umhABnitZP+qDkmiIJjON
	 fnYe7u68qYj00lGSA04NO0xg2+cwUuEeO840JEZwK5UxAKXEw0/sA/NKTPlviG2Nrb1Wu
	 wqe6iHCfwCXEPiufcK/xPmhYt3TRuoIX08TADnBaWApUMO7m5noE/gEJEYzp/nLo1/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="H/4z7pl9";
	arc=none smtp.remote-ip=209.85.214.193
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0488606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:57:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0488606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H/4z7pl9
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2f02b9c1f6fso48385725ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795701463; x=1796306263; darn=vger.kernel.org;
        h=user-agent:content-transfer-encoding:content-type:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gBovmTrABiLokh2i4ArfvqDEnoWzprwQsU/xF7x18sE=;
        b=H/4z7pl9RA20KbF8J3Si8jSrphXhiQksVCnaUzj7RRdinRy5AhjsP/mxYDQOfaR/cm
         SxLVg6LJuISuIcBdotF63WPCnCihYNebupidg2D1HoAOQD4PLBeLLmk6adfCZx8grbxv
         8U8d51mmC+rbuESRPwnNqPrhgb2B+igO+toLUA1MkT/XYD/YUoOgCvrCXh8RwlEP1nzY
         4Ld7nypQXPWDxo64Abt5Yp6izMk0BtNPXkJ6NS/gX8EOlA1HnnGzZZiqC0y7EnMP3Nh4
         byVjw9IWa2Pth8IaSGYZOtxP8T/nyA80fPLntrVRG2OWE9+gxJAvIn3pKtYURCan2boW
         km9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795701463; x=1796306263;
        h=user-agent:content-transfer-encoding:content-type:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gBovmTrABiLokh2i4ArfvqDEnoWzprwQsU/xF7x18sE=;
        b=av0IWsq89OUxpQoezUWa3izGp6cIZRdSYoyDgTJzTBeRIiJk91SbzC3ilPdx5Hw2+/
         r0QCwonUIOtuCowtHQYvoB1esu3QMm1EpCWt3H1uQuCW5vJF7JHaDLzFqm2EqF0SItnm
         phjzLCjXzCln3HGMWLmH/oEIH5xh68YVzXJsJ43cnpld24v+yRWQIR7BnZOn/njvvyBA
         EOvgo6E+tudJNWmWaIwbAT4MMMgVRUJpbztySBjfWHkcHH9iytaN73IDg6vxxNyLhyI8
         SWfPGMTOa+jyw9IJLa8CTEyF0YpppwY+xjEQQUpWFEsA4ECUSi6YHXKm3/pZNBgACc2U
         sx9A==
X-Forwarded-Encrypted: i=1; AL+hErEjv3Zr1zsvLgOuEluGsvIGbEY8idMJwpKmXcVby4eplLMLNNtJ9mYBC/oAijJffPaWLu6sk3Rm3hGzHjw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WN4AjYg1OB9sfV4C8yMAQrVDaGK7Y9hEphhZkVwpZtpYwj9qr
	1wgS8YRfMu3qKeF1UJTwM+svAg/kKrm+zvLtCAqyck4JHV0F4TID0MJC
X-Gm-Gg: AZFdTZcAEBAs3E2jOU+BFqK4ELfEMhu+EK6McXqse5loahag4lqbgAp/0x48pZpSPFu
	rQT1Jvs9QTIdP+2boEqwriiexL3kqWFg5NlqLi6AFDppNPz3b6b7kvWz8aUPWBXGTBdmenxpRLA
	duFumVCE/44xYM1TucPchng//MeOxHnFmZLkYda4Kii0CClpqiAR6/jU9bwOMQYjmZxgvJgR2F7
	6nH6TjFDzB909PPVJ4z1kwazzHA3H+h0f8RJBOZaW4cJ6muS+zzpNFrdtb6Eki7b/n30gXq1whQ
	+mP3IKg001bfivLmPR8k2S75r/8JVNmuGQqqi5HmiHMwUN797L1447Q43Ctda9Mx2jRlPeRiZ7a
	aeJmd8VFxkK1QeoLILG9kwsN3pzfRcgxYeAfaSebt2qj1qjuorhcChxKZuWGfS+FB+8UFvCPgY+
	kHc5gv9Jo/CByWNjudTOzI1+kTlaH8RmbJGuMo41kNLAYGZDlRmuxARRCWiF/chEKBBktIcp+M+
	GLpL5Eu2EEJNvxAxKKDV+BA24guhTD5ft9zfR2e/+6GhIACKDtarOvguooZyU47OyobFI5k1T/6
	tENnh7rMoJk9ao1T6kwUgRn+h98KfB6ncyqo3PU=
X-Received: by 2002:a17:902:da91:b0:2ef:f6dd:87f7 with SMTP id d9443c01a7336-2f031e1aec9mr168022165ad.7.1795701462897;
        Thu, 26 Nov 2026 05:57:42 -0800 (PST)
Received: from [100.88.6.56] ([1.55.160.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f142b8bsm102157175ad.70.2026.11.26.05.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 05:57:42 -0800 (PST)
From: Tran Van Tien <7enlab@gmail.com>
To: ojeda@kernel.org
Cc: a.hindborg@kernel.org, trev@trevrosa.dev, nico.antinori.7@gmail.com, boqun@kernel.org, gary@garyguo.net, lossin@kernel.org, aliceryhl@google.com, dakr@kernel.org, tmgross@umich.edu, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] rust: sync: make AlwaysRefCounted::inc_ref an associated function
Date: Thu, 26 Nov 2026 20:57:35 +0700
Message-ID: <1795701455.1cac907f@gmail.com>
In-Reply-To: <1795689815.75b422ec@gmail.com>
References: <1795684556.6d661f19@gmail.com> <1795688552.31c01b07@gmail.com> <1795689815.75b422ec@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
User-Agent: Mozilla/5.0 (X11; Linux x86_64)

Hi all,

I am withdrawing this series. Sorry for the noise, and for the sending
rate in particular.

Andreas is right and I was wrong on the design. Making `inc_ref` unsafe
and taking `NonNull<Self>` adds a safety contract that is not needed:
leaking a reference is safe, so the function does not have to be unsafe,
and the argument should stay `&Self`. The only change that is actually
wanted is that `inc_ref` becomes an associated function.

That has already been done, and done better than I did it. Trevor's v7
does exactly that, is at v7 after review, and carries Reviewed-by from
Alice and Andreas:

  https://lore.kernel.org/rust-for-linux/20260628100731.64885-1-trev@trevrosa.dev/

So there is nothing for this series to add. I will follow Trevor's thread
rather than send another revision here.

Thanks to Andreas, Nicolas and the sashiko bot for the reviews.

Tran Van Tien

