Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795234456;
	b=YwsVidlqXC9+q01vB6YZ2ivNNDXNXHYlt6Ev/4ycS2JKMeOsxIHgoihEMCMAvTeitgfO
	 rfzES9Fm45sQG3nNRq2lNKqTcmbf3PH2Zo35uHnEQvlwzqYgvikk+Xy2sn+N+7WPeANBR
	 RRoW61m6ZFHKBXjZLZYT8bcyaYqCM8XpqIBQGAnx/YLxxqMSvcBgn3wrrgMjl+15i7iiv
	 J4hoH9apIrSqLNvi+AW2GEUOIR8m+elIOTc54c4nrXvXMfHzY57oYcP8Jp2fP3L7T88T9
	 Ogwuo7TacxPYCWqi+44q7I3N+hH036KSt8EXEAYXgnV0n+AKDNtaSusRRnU0DUiCvCg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795234456;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3VWikePojs6Z/sOqx2CC1EDbJrjAJsIrE6pNTxCdNqs=;
	b=EWMEP/We7fsN9m33cyZCDwfC//rwCgTTVmlXuQmd7d3lmZ4lUJR6Yaq6tyuji0/r+nS3
	 xJJALe6PXNO1S+EVmSlXoSGZcMTV1v8r4okLl8cDcytAqf4roV30LaqLRNT2fZNMT/NZA
	 DaQ9LM9kmM7Snm5dJ20OR0ZeQipnOFr+jBkyokYHOMOmyoeEWukI0hmYhkvD10KvbL20w
	 id/sE1U4uS70Y2q06rZlXJ4FTkt7S3FSI5r13Lw0hcNoNM8nsFqDFEBeytEq9pGmo7Cim
	 JaBPOSLwJssxIYgWyqGLoD5hdQccD4JeeN961lIzvosSYIVkZRFA3bl6pitZk8Ss0rg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=K3bPr1S0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86318606A6B0
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 04:14:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86318606A6B0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=K3bPr1S0
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-86287bb539fso204770a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:14:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795234454; cv=none;
        d=google.com; s=arc-20260327;
        b=rPLmjf6SbPwSWspkIXcO2/Mymos7DZIgLAEEGO54KckPgL2Buidf/LDKGgpIdvSs4s
         W7NhRBIRgjCiwWME/k3bO790TnOVR+n0v40W13PZ7k9owHLhGNrFJIjOKOv4vih3p84R
         LlSIBtomcMX+nyX2rMs9II7kxouTWt2OUGm3ChZeDF2PpooDzdEn1gNmPCwpG5cqVSFj
         OJZO13nYwAumQZWfWOdu61jqbjZi0hect2O++z8sQZXYHhjqTG16seBabG/Y3IZSD3ga
         axhXdaAJxlnpuApMqP0lTTmg1PgOwKMJCv+VWItC0WBgmV9KWZm3EgRwNSUu/QSQNru9
         2Jsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3VWikePojs6Z/sOqx2CC1EDbJrjAJsIrE6pNTxCdNqs=;
        fh=C2l8z5NKAqXfdzcOMO9qwsn1E12ZklzK2O5/vjshKPc=;
        b=nZ8Rkpxo6hiYSGNqSKEI8VzxFScmlog3/HUdXxiOYxmyVknrRlLWHJq3XQu7F7syPJ
         sINWFHPupcmuYilyEIMOa4UoFDvL+EqHOaXwDnooaQ5TEUgVWdIGNQrAnziN9ptHmqts
         xH+IrHDDhMDqaB47alk9mOywvDBBm5R8d2s+fqccg1vbKBLbxzVOWMg2A1coNkZdZIAu
         Kty3Zv/7TIZ5YRB2D7+vFL+LE8w+uhK0iVwwW/9a1MjFt7dLiTI9iKLs6LUHm54VzeBq
         YwN/TfQNJYN4SaCY/+DO1kKN5/DP6AzjYDxtPINEYoFFkl+cFpTyt8gYzsYHEudGoZy9
         /Qiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1795234454; x=1795839254; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3VWikePojs6Z/sOqx2CC1EDbJrjAJsIrE6pNTxCdNqs=;
        b=K3bPr1S0ihAhALCu7A9KmU/u8VZ1fhbV5BeNsDZUZUUCpiWJYUQMYcu7a+ws3qpVNk
         frFSBx6zuvxBmaIvLzzDUZYLu+CVS0HeUbDLDCzlTWEcY7ILjSk3h7mQNZZVSQwr1q2Q
         TcG/rI3edxM54Gb4ZAS1KFxg+Hx3hAmlAtLeBx6rz39MJX2t8MDWfpho/mmSho0zmpM0
         Dol6+ci4KTWP5gO3Z1oE/WfCV1KA8WVa4APSptrpNLRiknH2F5YIH/62q03ePu42jcqT
         901bwEO3AYON6vRjveAv9PBwzCLstzc9L8HUfMvw4w07E8mgpNarILptfQlV0fxYA1Hf
         JGIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795234454; x=1795839254;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3VWikePojs6Z/sOqx2CC1EDbJrjAJsIrE6pNTxCdNqs=;
        b=Vjn+pPrVvmYOX4iPPpacEJi8E93VH6g6JP2isFErE/WtF5FxSP/c7s34vLYIKJYqjX
         mMbeCRsLVdIkEU8Im+Enl3SfAbqapp923dwLeL3Nb/Lz7QWAq6FVz7RPvKJhzU80ERnq
         P1Mla5fLJ2JBzsdn4kobMMMO13zgsIU0xEwHzaK7WxidOXzX3GZxYhH7VXs0FuoEBWlU
         X2wWRwIF3K6LxDncNCsgAWh87WWW5N7j96TcgfOw2gzmsF+z8IG+d7gfPtIdi1K3dTkx
         p+udMlZjJvV40Ch5IUzpVEx6YE+B0asMlKpcvrg+4w3rr3ML4DjtBmfamc5qKZOEQgjz
         sjsA==
X-Forwarded-Encrypted: i=1; AL+hErH30h4qNP96c1e+Nd9XWEfHp4oScoKznB6KaKgoP6e1u1yn4BdwgoC4Sgm9zaXy0UbZ/wkCp6KiCSuBkV8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0rHJIfIiBlNnvhdochJZfcYIzWvtu9Nm3+IlMJnIME7pilI0x
	DGxiednLbpTQDMyDO90H8Xe7ZiKHEsKtKRd+2vfO5JSQxxdJkOkp0J31YAQhTsZRGr9sKn6qbjV
	uuzEamMj0wph2ppnE+uQ0OET7DmizlOT+8J+JH+zvm3UTJ8bpu/3skP2rkA==
X-Gm-Gg: AYBFou1X2bTqnlR489DhPfh/zf/x9zsWCyrS2iaAf36GXbT4bO1g5MKGLg2T5XsOCSP
	hG4Fi4V32T9M96plByCNd+6y/pCezLxwckQmjJzExeXRSJwokxMbsX4PBtRj90N1SubjRwYXL//
	BTmxxTUmomT0b3l7RB3TrWRalfn0NRIlL/4EYzko4RuBo0CpZr65W4yvw8iCtCXXkfzl/fD3LH5
	YUjX5bA8clyla8mNwxB9GO7jV/0FacFspYktxEiDYXltG2mp0scShiVNDjWlv7Shl7KpnrwzBor
	K8efqg26e1VtpI+TKw951Y6+MtPaEpcDSOj6rG0ZoCfxI4TxfQ1u3mrDXYzUmne8x4hQx2buEwo
	LF4ghTgaPI04APvMIWP//eIDkzBkxIfOMvga6
X-Received: by 2002:a05:6820:840d:b0:71a:ee8a:5d26 with SMTP id
 006d021491bc7-71b3903669fmr4532415eaf.0.1795234454393; Fri, 20 Nov 2026
 20:14:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120064806.752251-1-csander@purestorage.com>
 <awBuiVyOQj_YHCZD@infradead.org> <CADUfDZonvcOkM7DD76Gg=Z6NHhM87a+n0xPirfTYS+wLLnHfmQ@mail.gmail.com>
 <awDjRMv-TSvZKDdS@infradead.org>
In-Reply-To: <awDjRMv-TSvZKDdS@infradead.org>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Fri, 20 Nov 2026 20:14:03 -0800
X-Gm-Features: Aa3M54oMrehaCiS0ijZqohcZujok_ypFHbY0vJAi3ID-ob0bR0tgHb-XgCK5_G8
Message-ID: <CADUfDZrXabOX1qM_4DrxwhQSZGo2tF6KUQ3yhDSgBr6hSGyUDQ@mail.gmail.com>
Subject: Re: [PATCH] block/t10-pi: deduplicate blk_reftag_remap_{prepare,complete}()
To: Christoph Hellwig <hch@infradead.org>
Cc: Jens Axboe <axboe@kernel.dk>, Keith Busch <kbusch@kernel.org>, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 4:18=E2=80=AFPM Christoph Hellwig <hch@infradead.or=
g> wrote:
>
> On Fri, Nov 20, 2026 at 10:29:18AM -0800, Caleb Sander Mateos wrote:
> > Sure, happy to switch to an if statement instead of the ternaries to
> > initialize from and to. However, the code generation is worse with the
> > 2 calls to blk_reftag_remap()/blk_tuple_remap(). The compiler doesn't
> > notice that the calls are identical except for the swapped arguments
> > and emits 2 out-of-line calls to the function instead of inlining it.
>
> Add a __force_inline tag to blk_tuple_remap and see if that fixes it?

I mean, sure, you can apply __always_inline to blk_tuple_remap(),
blk_set_ext_remap_ref(), and blk_set_t10_remap_ref() to force them to
be inlined, but that doesn't change the fact that there are 2 separate
(inlined) calls to blk_tuple_remap(). That makes the generated
assembly for blk_integrity_remap() significantly longer. I don't think
compilers generally merge common pieces from if and else branches
(even if they can detect the common code, they may choose to keep
separate copies to improve branch prediction for any nested branches
correlated with the outer branch).

Best,
Caleb
