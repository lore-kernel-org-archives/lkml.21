Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795805082;
	b=x9hVXIH7dgqZE1XhXvKOhqjMu6pXagwUSmsHRBEStBcA/kt7EeWuiKSp8wqtEK9oI1wz
	 Q2QQrjQmmICgPxtf0QeqXsAOLYxYtdxDMNsiVE7cDko8FMtqedbXXJckvKKXV27atYIrd
	 2hJgHkXAVKfODDQkdD2CevnbIstAYn/Xp7q1t4vRb9a/Ae/hydW1CEZjAIiL6AyuSA7ee
	 lk1Ta+X44tMPXNNHdzWh5XOwDwaFcP7eEfX2gYnhvM24XPsyYp35qbOZYCfq1k4GKM/I4
	 HmGn277g3IortSswjtYVGA5z5g8ynJDlYECYfLejUzemQVVf795B4kSLPjfJAkMaUAA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795805082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zTjWzbnUUC8dN1QyYk20s5zHqmG8btAZ5mtIxbCNZ00=;
	b=Ihx9z9nENRoxPxjFLUbl8aGwf+/gL/xkk3Dfs5AY+94yLDtq040jCob0QssBO04MJNa1
	 a6x1d+dOUY4SXtEofGNgkdRZolGuA0K4AUYF6XjKdSqXXsSzKCBr8K+HjDq8+zvOWewXT
	 NhgC6gpPFxQRzLQRKP/iMSClUqh+KfDGqmZO2Tu3sknw+hPgVwmXS1Yqzjbfa25hqRIea
	 bDN/O9jl+sqpPGK1o07kad5UJYd/EES5hv5C5uQLNlGpLQcIlGNCGNx9PIdqSEqT4iUi4
	 MlAgI6A+77LNT2p5x0TtTja7xyTItLXJPAB9guB9IRQDX665hvU/pGZToybO844Wszg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S+PtFEQk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.41
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB33606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 18:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DB33606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S+PtFEQk
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-9213fddb596so37925586d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:44:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795805081; cv=none;
        d=google.com; s=arc-20260327;
        b=rqJBorEJCuBMX3xRvGZB77bsvXeANPTyH4A1AATkpR90mnwiVFJE8F0PLfqc1G8HUX
         rYw16UxZ74eW7tsIfU2ybzUhtvwssUpq+7tu227owkzlPR/0GycqFHmAK3QKas4vVBeH
         qBeP01DLbFdwdSsAxSDS93RnfczHjTOKTgs0zGluSVVL8g4NUlbFDTOggK/F85fghjn3
         Nq4mcf3ljyDW52AGuJPJNn3Y487TUXrXvfeXZ85lnAAKaEtx4QLevsqtnDL3ZIb1JmhJ
         WDUO5g8okU+KvBUvvw3oWhDPhd4RwE/qqoMNXAHk/xtNSz0BUZSEz5cCflCcFMqpvc9Q
         bunA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zTjWzbnUUC8dN1QyYk20s5zHqmG8btAZ5mtIxbCNZ00=;
        fh=vYJPeFufjxUqDSWW1EpSdSLVtMEGG3/8yqYHkPFk18Y=;
        b=Hp3UB04bOb+YLhuJ8I+1qi1RgUpg494u4bf8x7Hp2dbxgnxRjt2fLf7GUdcqWKv6VJ
         nZ3P4pahYkrUoAg0PqVZsDToZuHHp/qgxstLeXprZFRiePdm8cbgtR2keJw+c0GdZnE1
         /uwtal41hgv2Tgejgz9MpH2W6cpes8029xmaLY6pH3Iep69frubb7kx3N84yW/Lz04uk
         WzSFom6lTwAmJtfXBPJSMqcMY+kG/N8VCPyb22aU+SIVRyGbe3DWXdQeymJIXP6HkmFM
         VL84VzHr2ClUwe4E0OJKX5Xsi4GlhtYYA/ID47uXPHsI23Mkm1WEmY5OSbfj0M/iDUXQ
         D/gg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795805081; x=1796409881; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zTjWzbnUUC8dN1QyYk20s5zHqmG8btAZ5mtIxbCNZ00=;
        b=S+PtFEQkyzOCD9qVC/M0fxTz3Dk6GUpnzqvJ5FAG/DeDrvmbRS6p+tQvVhkOsLppkU
         bDLbMkGr2Qs8jr0kf8bM7SFMTzuwWrtU8oLmjTBGOx4X45yr5q5JXqjD9/hpVveLOr/Y
         BDEdk3YFCLUjE1Don6vh/0rTIyHmUG3C6XL23SIrXbj5u8aWuXfs70xdVpyrdbQ4agwf
         +z4Lu1Cdq+fVVPxh0uHdP580aoXozNodSm2xFEtFJxl3rQQhSLRpG0BxXs7YEt8oIX64
         0u83jrGtqFehNdLCsGTxS1xUwHa0FZwHr4pizt1fL4vrWaHIQxSdgP+UZvLY6WrLJGA0
         pr1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795805081; x=1796409881;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zTjWzbnUUC8dN1QyYk20s5zHqmG8btAZ5mtIxbCNZ00=;
        b=Krz09/GjGK5G+3o5zvOKSj4d85ooOq/nCBvnBqnGh232RYj/KfvTZoJzkt/wv4mpPl
         qPT4S4W/XFntGLU0eBrSswWituW2h0NqodYQ47LjOVOfMsmacg+Nooyk1IFymOf6VenH
         nQfROx81tGHz2wR+xlkkAdmlhSX+bxXwITM/qHt2yglJ/OPA/gpuLmVwDsdQwF8WjHeF
         FB7hTtAEIFaySrgQqwXMBa35uKaD5EBgwdhKTb08ooFJKu21K8a4go4SSGhdkDJefdFe
         bw4NA8Qz+8C64SBGTS4foiU4wlRASuuXAXti36ggzZOwnAwbdERDOU8biF8tsPiswrWv
         0lEA==
X-Forwarded-Encrypted: i=1; AL+hErGYzYMm7jZM8BBxs/SnSSmy8QlWiCPGDccuU6gDAdpIu0TJlfwPc+Cs3vRGuiTe2eOaWep0cLCrqkrH+ic=@vger.kernel.org
X-Gm-Message-State: APuU4Z+k/xzha3x/dkDu2lbFndq1wvohOBFY4uEoavM1SdCz54AwPyS/
	w90TXTKCwPon9An/2UTI8QZNojhqW8IwEA4e+PgM2BJcBMAjt1LvMBVNHgagwx9WxsrCrOb6y/n
	SXMpK2/kkp09k3qQ3wlsSEwxp4RVCgfM=
X-Gm-Gg: AZFdTZd5lMOKH2kDHPRC+/qSiI0mv0lExP4nF9B6zcabVBXR2lrKfddLSDROUX2jRMy
	opQVUCUdRSrEXtj7WeVdJue1S0yZbLBlxXIvKrGEiOnSdke5r2u1CTZGRCHHWjzqGitw1vmTFO6
	FM2NM9J3vDdr3ETBe2+lP67nqKliBR8VuN3eifZ4gdhZzz3KNa77UsWTGUj84xr9bG5xqzM6tys
	r19TkUD3dRSssFo7qkgetvxTns2j6zAO6RhWID91MQIzb15f+X9GmxZjX8NfIv28fQfPLwwGC+0
	LRERYEOpXmUTUTQRAOZMGhqZnkRkDJB4h3EOpu94Zr0PxEpVE8YLFrSHekCJWfsHXMTnUI9buuR
	OVSw3iMpyZPFw6BGqHyTkADlcprHTSHsoNuqI
X-Received: by 2002:a05:6214:3107:b0:921:404d:f460 with SMTP id
 6a1803df08f44-921404e1bc5mr411681906d6.23.1795805081366; Fri, 27 Nov 2026
 10:44:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261127041853.127855-1-artem122novak@gmail.com> <20261127184010.GA1974@quark>
In-Reply-To: <20261127184010.GA1974@quark>
From: Artem Novak <artem122novak@gmail.com>
Date: Fri, 27 Nov 2026 12:44:30 -0600
X-Gm-Features: Aa3M54rlpHYUJnbfYeC7GS2lHvHK4qXZFgCeLBOIW_h40HEFsgENFGq8tkyvopg
Message-ID: <CAPufuha3cspM+oLjtb_P0u3H0ZchD0qDR9D6Js3LEW=HACc+Rw@mail.gmail.com>
Subject: Re: [PATCH] crypto: sparc: remove trailing whitespace from AES assembly
To: Eric Biggers <ebiggers@kernel.org>
Cc: Jason@zx2c4.com, ardb@kernel.org, stian@itx.no, 
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Eric,

On Fri, Nov 27, 2026 at 12:40=E2=80=AFPM Eric Biggers <ebiggers@kernel.org>=
 wrote:>
> I don't think a single trivial whitespace cleanup like this is worth a
> commit.  (And the trailing tab here isn't new, either; it's inherited
> from the original code from 2012.)
>
> - Eric

Alright, I'll drop this change.
Artem


>
> On Thu, Nov 26, 2026 at 10:18:53PM -0600, Artem Novak wrote:
> > Remove the trailing tab after the key expansion label in
> > aes_asm.S.
> >
> > Signed-off-by: Artem Novak <artem122novak@gmail.com>
> > ---
> >  lib/crypto/sparc/aes_asm.S | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/lib/crypto/sparc/aes_asm.S b/lib/crypto/sparc/aes_asm.S
> > index fd90b129972f..0ddf181f342e 100644
> > --- a/lib/crypto/sparc/aes_asm.S
> > +++ b/lib/crypto/sparc/aes_asm.S
> > @@ -293,7 +293,7 @@ ENTRY(aes_sparc64_key_expand)
> >       ba,pt   %xcc, 80f
> >        std    %f58, [%o1 + 0xc8]
> >
> > -1:
> > +1:
> >       /* 192-bit key expansion */
> >       ld      [%o0 + 0x10], %f4
> >       ld      [%o0 + 0x14], %f5
> > --
