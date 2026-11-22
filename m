Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795336328;
	b=ybAtIc50kHLYM1sw08C6WbsHOFIOdNfuIc5dRqEIsVcEZjHGMMoJAvxsbohFKjd6Cm7U
	 VIVga81feqQmiUFCcnnarMg+r38VkE39CyJEE9uPaofHb2mCqKREaJzSSkCvBoNURKE2X
	 gYSjX5LlvvwElcbjWGbo5xwsdnwVAhtqjv3ez/Fij3ODJTpgTcobc+q6YlDElUp2LiMQg
	 QKhAFiIAZeZ1ficuQ5PV9f26A+oLm/QDY9CaCkdAOW5e8No0B+IWfmahu4dPJ/bKpxQA+
	 +HDO+u2t90kVNo02Iu3mDt5dx67YmJBcBzpA2RHB8FAs8dfK1eDxgvIsUFaEjPFptqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795336328;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=R45AhhYKsdhhZBr1KAdTobHjnFM6HdEky1mR4GL5Dyk=;
	b=drl9bb4PaRXPlIIQLx//DgCqZndtihKpcqyLlbwThlJRyHHobVSBUuSxOxd4+VZ8ekw6
	 neiYizomcj+wCLxGN/X8py+j9LuZCJC/oupcXsDTICtdbtY2lPhgt9VJZy1tD1hBRjdL4
	 XnFpRNtZZJgEe21uhbojNlXQ8pLKr32rR7xuEyafxBrnGi3z0mNMnGlTFCLlarnVHVkP6
	 pofL6bymLZm0iYEIXjEizy4XaVRJcN8H11pDbv6KgOuJdHF+u45JFtuosNCC+Xzn4NAgb
	 ZHZTXuI66JZ+Lo+Txxje5YQ8ucTUlmLrVFeOiwhBU31Wvdft80/0GfuoDCUVUt2L4CA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rmg68O5O;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D1D606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 08:32:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9D1D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rmg68O5O
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4cdc606b47so396537466b.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 00:32:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795336326; cv=none;
        d=google.com; s=arc-20260327;
        b=GV8+o42lXCIdqhkkyLzUJV6rZwoEYFNZ7+ITbzYPtyRzBc8YHdzmwozJQXR1JPHfql
         YHxSzrLm3HOk8QPznlE6SZnx3PVSBPbr5YYLZ3fkfCcA3Oh4PRe4N/w0YEP/elt7+Qev
         JZk79WWabZyrhZrGH9B5dCva93BlVGvoI2Z73Dmbx9Iw9O7cyosWVJL5UhXP1xN/6pJu
         Y7jzg5DS4e6i3wU9ZdXWmusoe2sSRXnUQwVmkzOQABmXaT7jzEMEU7OrE7M2xGxZRQWF
         5cEOAkVrhNx05lnpGPNVBSVPB6M1cFgLJoOxt1W5VaxWqrM3ALu29z0Byte+yneY4ri+
         3+6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R45AhhYKsdhhZBr1KAdTobHjnFM6HdEky1mR4GL5Dyk=;
        fh=2n+/7G0n9zlf7N3vmVReZiTBb/c6icjr+7qIy1j8Lus=;
        b=C93JXiK6VD3DTW3hN9uNSFeGaVccNGugRopsEhEcx9wBKhCMy4UJ4YrHUCsZ0ypVRh
         0kacrKr8XxHgX0bMQMg5J5jetc4jdjc49nLq0gibHp+jfBtqEAb6h/sEFzSohkmLV59z
         rZxjKGnfdLnZV5T9GL2qHfAJKyR4ee/vRo75WKLnSCdT4XeCas6ePbLirMVBgKKuw9qI
         FR+8pRA7Ea2bO6aJHzNb8NRvpwmJsWXauFe2v4+cVznmutrM61Btit5dX3WQstj3H9RJ
         4tD55T/Yb0dbz2KQcVH2tiZ6XBxEhp+2yp8FLr1eAKUmVjIZr1CK3IGk1vPaj6bADrnc
         sueQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795336326; x=1795941126; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R45AhhYKsdhhZBr1KAdTobHjnFM6HdEky1mR4GL5Dyk=;
        b=rmg68O5O7Yx5ZA9mkcLuoSNsCqGp2sETk8p/bYIMHm3KKojfUFYZSanfH4k4kWi8Zn
         /OiBtAl9pWIh8UeYQuWZ2dA0D55bsbWdmbRsedZbh1EboU+fLqCNvxPH71y6MnctuLA5
         I+iJwg21bcN2KCsYik6olvm+bInJ1Xta2RQ8uaJrPk539uLfyQ2mCL5MlRJZLAePJnwl
         5jfoCUroyyVbK5nrqducgiQbj/VPyIod/fkiW2s4TnhMuENdeaL1sITUEAXlgj9/Ifx+
         7HGVZd66jZEHNtD0roppwXvviBO9pnp8x9kHp6vCvdFC6Jv1w2uDQ/H76aYegYFrxAIU
         wtOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795336326; x=1795941126;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R45AhhYKsdhhZBr1KAdTobHjnFM6HdEky1mR4GL5Dyk=;
        b=SCphz4MRDq8zW/H6XU08hXuluL1w3i+afEH49RqYkbM5tYTkrEe+abYCOMj2dvFfnW
         vHMdk4P8/+JiyxArdBIwwsVT46XNT5ULtGDtJbEioGAwsQDNoOYfZH0N3Wcj0cQjBcLC
         0L/f/y3ahvT9v/BkZWBjWqn7djURbAx53HqU01VkRh/jorynCHDfJVCwjdRL9jdgu3dL
         7IWDfP7UWMQ3ualYtuu2b6mhZTFEoKm+Za7GE0Xx0BZSxRILWVqc+ja7cxnPC6WeNXHB
         A5b86nlXWj5vkOvaEHLw5rbiqnw1lNAMyaZq19whe77ryWFnGqbejBRM4E6fQI1BEyBM
         FjYA==
X-Forwarded-Encrypted: i=1; AL+hErG9VR6N6p8ymahdKzBHTC7+mFjS2dJW7cWO2MA4EZJVGwIwFrmfln/x8gMUHd5638OjRMU8BnCkNkRT9ME=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mtKM0lx+1IsGm3nIXltSxuKWItTvrCTLYSZIR30MDibaAqDT3
	cG790tRr86UwvCo25cTkN5aGr6wZQLCUucu9dxF1hVZtDFP4Uh9hI9ztr91ycn7y9qfKjNXdxiN
	cK44IP5awud6lDV3HZGmvyNaEMhyltFs=
X-Gm-Gg: AZFdTZfQaYH0Yx2u+Kujzuhq3CpJeL3lD116PXJbCibK4K2SF0M5inx4EWzvur62cas
	5p+L1pSsb/9JETqgk+cdMvP5c5OqyirqFcrviucWiDSdNw0nXY6NupglfG7r/XFECDOesiFphNa
	jmGgSIkfYxkPkvQlNqti7BKwJZcgETPkOHwvdOQM8ec6uxobghugaIp+vtpiSCY4WE10d2uhx25
	1id1v34kHRRYwQNB0sQmC1LPIVEFmyRpGRt3d9NGZg5DflO8NkjSYNTR5pQeA8H81igAinvy8P7
	V76bYm1YOluY3s4SOy9LAMEeR1cSXuh7vz0fhMcqERvKE5oJ1F82Avn0d4mdGLk1LuNw5ykPjCk
	yd1ZW9v/xfDMRhIcJbu9nYxPTX+cAPQBEn/c=
X-Received: by 2002:a17:906:c59:b0:c46:5973:2a1d with SMTP id
 a640c23a62f3a-c513aad1251mr512825866b.43.1795336326015; Sun, 22 Nov 2026
 00:32:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118160110.1662470-1-16567adigashreesh@gmail.com> <20261121204631.GA16190@quark>
In-Reply-To: <20261121204631.GA16190@quark>
From: Shreesh Adiga <16567adigashreesh@gmail.com>
Date: Sun, 22 Nov 2026 14:01:54 +0530
X-Gm-Features: Aa3M54rQd_6NUSqDXWAp7z8l8pGAgea7F6rXaZmgtEfaNgy86oat4_takKEwpVE
Message-ID: <CA+-x59aOh_W=0RdS56PZh85fhvKZ5ym2HSvML7OWzXyCFN8azA@mail.gmail.com>
Subject: Re: [PATCH] lib/crc: Add 4-way folding in NEON crc64_nvme implementation
To: Eric Biggers <ebiggers@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, Demian Shulhan <demyansh@gmail.com>, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 2:16=E2=80=AFAM Eric Biggers <ebiggers@kernel.org> =
wrote:
> Note that an AArch32 implementation of fold_partial_block() is possible,
> e.g. vqtbl1q_u8() could be replaced with two vtbl2_u8().  Normally I'd
> consider an AArch32 specific optimization not worth including, but it
> might be worthwhile here since it would avoid divergence in the code due
> to the following arch-specific precondition:
>
>     /* Assumes len >=3D 64. AArch32 also assumes len is multiple of 16. *=
/
>
> >  lib/crc/arm64/crc64-neon.h | 15 +++---
> >  lib/crc/arm64/crc64.h      | 18 ++++---
> >  lib/crc/crc64-neon.c       | 96 +++++++++++++++++++++++++++++++++++---
> >  3 files changed, 110 insertions(+), 19 deletions(-)
>
> Anyway, I've applied this patch to
> https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=
=3Dcrc-next
>
> In general I'd prefer better comments in the code though, especially
> documenting nonobvious decisions like why pmull and pmull2 are accessed
> using inline asm instead of intrinsics.
>
> So if you'd like to do a follow-up patch, it could be worthwhile to
> address the above two issues.

Okay have submitted follow-up patch for implementing the partial block
for AArch32 and include some more documentation and making it
consistent on both 64 and 32 bit.
Once this is merged then will start looking into EOR3 support. If you
have further suggestions, then do let me know!

Thanks,
Shreesh
