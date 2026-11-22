Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795339581;
	b=DoOcR31K6Osn4bQU/8IwvSkg9sF5Lrf7GNmBtGUssm1IF7IR230gDY8b3SGftOmts8km
	 Z57No9mehfRsPrTvnWMEfe2GKOG6Y+yEzeGhsmmR7OSAB6PjKweUhtlQeSQdz2/ds4oe1
	 o1hwKjULm/f0mgKCUjuyfA+kJHTydnKFoCwi5JOhbmGoCO2gjXcPTd0N7j6fS0AooRGr4
	 ZJR+OJMRyCYox7qL3xl8XIBoqReC/QKGYsjDXNADKpoAnDnb34epttsfm8UHn20lQAv45
	 8Wduht3Qf6YOnNj7x0/0NVh/mpcDS6px7aNl4i40vvCvC0DpAVbDk6BHx8nzzRWDGAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795339581;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=/wvawJ8wNc6NBpYFbJy9IZ7NlJE5h0W6cYFfyspH7rY=;
	b=phglnH4OpM9yshH2/t5XKXMro9WuxL5kdbyv8n8dvYeo7Rbzei9Uk+8T/CFkwyMn/K3/
	 /vdPmWRSGsqyIAVqtC0qmSUUx1nITnZnUp6TVCZczCpbPdp1dAXiie5p7Z6YtHjXJYmAE
	 L1ZEPFA+bQ/FvS0j3EuMwB5Fq1a0Nq5Ao3ejn1ZSpE+xtxmEG4A4Z0JTsh2QSW9ehQnTP
	 4rfUNU1Md8f0RYLbLKd61p9ier3cIOMtXzrSyVWv+Qwa8Rj3io7jUVVDKBL/+o8f33yqJ
	 ZkEdmeU3Is+NTGML/gaoA9bzZfvIixaZzss/wrb9ZskiFkNSNfAJJfF0s+ZOdX+9R7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dsSq5Hsc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49575606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 09:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dsSq5Hsc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAB381F000CA
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 09:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795339580;
	bh=/wvawJ8wNc6NBpYFbJy9IZ7NlJE5h0W6cYFfyspH7rY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dsSq5HsczsDN+LrGIBNKTo3zf+TdG1bCtE87bfiqxU10NCujZkx2332l3VEy70zuQ
	 BvZ3Pu/Q+cAYxkQfKKdbuZZjrfJEAo+4FqESpZA8bPNWNwlhyrnADDH9IK3Gxnb6fV
	 BR7FKaflsbUEimx+u73iWo87wUXMuVMf7ELMGYxLck50n6//Z4dhmdaa818qVwnv6A
	 xCD6GCy9eh4RRufq2ThtzJeWNpmXcZH5pjXr+KhgNNCLgNuJXDdq5wEs/Dr0YkLiQ5
	 R924KjnCaO/qBL3wfYnhUqMzT2wm20YLsEUuA4zlPw4yd0WUtr/IRsYG6/7QzbBla0
	 WT0SmOSma27ug==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5be47aa555cso2805902e87.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 01:26:20 -0800 (PST)
X-Gm-Message-State: APuU4Z8ZhcmSdXDiBF1w586AUYGmtY6Mkwd/g/J2t/tiQgLTc08aIB6P
	IXqQqWmzc+LKaUtn28uFvZyN5rrWTq6b4Gtt8kQpMbsMxAVbD5WpQEJYr5DrhQxGYi5GSgau5HG
	7Hux1/UPksQDn7mdmr0xS8wb6DMKyFpk=
X-Received: by 2002:a05:6512:3ca9:b0:5c1:4f88:9af6 with SMTP id
 2adb3069b0e04-5c1bc8198fcmr2613273e87.54.1795339579651; Sun, 22 Nov 2026
 01:26:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-ux500-timer-twd-binding-v1-1-58099a54a440@kernel.org>
In-Reply-To: <20261116-ux500-timer-twd-binding-v1-1-58099a54a440@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 22 Nov 2026 10:26:06 +0100
X-Gmail-Original-Message-ID: <CAD++jLma2AZstGAAmCHRFouwC7fNQB5d3=LTjx42fSQBKsHDOQ@mail.gmail.com>
X-Gm-Features: Aa3M54oH6pauVybRm7ssp9GjVhjox8gdVjmBgukmIsJeJcWrZK2JGKkIS_nXdRQ
Message-ID: <CAD++jLma2AZstGAAmCHRFouwC7fNQB5d3=LTjx42fSQBKsHDOQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: timer: arm,twd-timer: Allow power domains
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Ulf Hansson <ulfh@kernel.org>, linux-pm@vger.kernel.org, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Mon, Nov 16, 2026 at 10:48=E2=80=AFAM Linus Walleij <linusw@kernel.org> =
wrote:

> Allow TWD timer nodes to reference their power domain.
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
> Allow ARM TWD timer nodes to reference their power domain.

Is this something you could take through the bindings tree?

I don't think the timer people would mind. (Or else they can
say so...)

Yours,
Linus Walleij
