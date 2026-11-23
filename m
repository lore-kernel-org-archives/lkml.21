Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795435159;
	b=EBD5YRNktLaUwLTGx4eRsk8qBc4T1hKncTGvDz3Z7KHwIfwJYSR/N3HR3cOUDVrlnHzQ
	 PFrunCc7WEstMN7Edyt5xMNE/zMhbqPU9dZdJhUQeXXpg6FQsHy4iQfMoLUi0On6WCfQm
	 FOUytiE4P/GDjSWLKZ5Z186aC7Zk1o9367EOJak0xZua7O4qC/qTevhURplhtPmcVjLCq
	 Q+fILazCqNDuskX5VqY9NOMJEZ++Djn2/r7gQa1jS3Z3Bm7Mvh3Qeqk5rAYdsYMC0OWDd
	 zP753OU8wCKpRyMxMLqWvPr5O8/ILdXvMI/RXtz8uxr0iIMadtv4TRr6YekuAHZ4bcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795435159;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=1jrfyM8AKRsXsQr/mDzcRHfpMeGCqxxnp8QiMrGkGyA=;
	b=C0u1AEAwkZT0Z189bJoo6mze71FmI+ah7BZFF/sSdP5AW7M/4hkNLh6fGLnTGdpOtK3h
	 +xev0aGs0h9Tn+UDR//a7cov9vSD3UtbuicMMw4lQKXjK7D0NpbAwouWL0FlDL/DXIw+A
	 DFbaMZKrgGaZWU+KoL0l/OOr2UxEofTM2GaVoT/2r+9sQaBL0Rg7RlyYuspucjeAHtOif
	 zsYJcl3Rzm+HH+nBO0a8jiIxS3+6wAJownxjOKnY2qYaYOzgz3aTz96KXqNBPKWtUbfQK
	 aS0mlt9rvrxOtJi5rnqQ7QNdxNLqH3jOPdUDVcrzEmlPwbwV3Gi9DOhGttFHz9/m8bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nnv4Ewzs;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE2A606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:59:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EE2A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nnv4Ewzs
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c5133831027so450737066b.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795435157; x=1796039957; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1jrfyM8AKRsXsQr/mDzcRHfpMeGCqxxnp8QiMrGkGyA=;
        b=Nnv4Ewzsl0zbK9WqomGclwh/k39KgQeQgXBNc/AzfBbUyum1Jwvd/YbXnXg9n29OEj
         K9Ij0DC8CzyeIq0tVeeaApk4UfsTam5BGxnvw6s/ZKMk3jvL2FWONroxYavWmgOtsFl/
         pCH33OTHEcBp5Asq6l2vD3q6q2VMRCWAkBXRC3EjS07hdKBCdtwczs0pFbPIeKRuIxID
         xUNzibHvqo+wSbbF6Xz8MLTQWy4Q05WSCpzEyqo7+RmGC8MEsJ5zTaYWtaSTJqfEMPJ+
         ja4H8aB9k1bYTHo3T4iVJsVZEdnn8ZEPeUwM/HyD1ISEGSLI8D0lV/EVTsvmkC8x4VQw
         QwwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795435157; x=1796039957;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1jrfyM8AKRsXsQr/mDzcRHfpMeGCqxxnp8QiMrGkGyA=;
        b=x4NtnMGUB/FwvRMNB5HOwISN1Mg+7Y6FP+quzREGAjlYFNWlQbjb4iF6JzjBbkdBdB
         Pyk+N/JNfn3ipFOpgcj+1kq7+4HAbxsMYJyddIZG6MdWcOM9Cb1KvDiX7B844LdqpK6J
         PZNyq/Az/VlJlzqMvFHcrKRVG2GrWDYEw0cqF09E8piraMoiY8NMHPem4QNkqkAT/FQl
         1DwZEArMcXaR8RN7cJR5b6g8uxofkR6ffTr6vsBSWPauNrLUd24lPL2GA/gMrIGu18fR
         9IAJPs8X5kcnJF0+su/3XxwDd11A2sDdGflA0ICb2Lv+9iPPxSEnNKs8Lc4X/qEpPRTG
         Nezw==
X-Forwarded-Encrypted: i=1; AL+hErGC/hXD9fhRn6piTp3SV/xsQqHn8BfXLI2i6A/U2wtKIv315e7tklyX7xmn8ZoRr19h1hF+C1Te9ui6Js0=@vger.kernel.org
X-Gm-Message-State: APuU4Z80k8mSQfVxgD+oA3+XZWq57ORSpE5P48ITTB1qiBr/tu966blZ
	T06lDODtS2yzXc2lNPZKiyUD6JlCaYCf1FeFeHzIN6Wcg0j9gGuB5kPC
X-Gm-Gg: AZFdTZfI7DoIIEYJ7TuxwH5KjbD8FHwujlpXxvkNXiXOFMxRXgSTYUVDgifwOddFFnn
	wBRDe2/pH7c7Sa+eSOJwZCWZvrCRTkfwStBSBRR1rjhwYP/9U2ogLcTnxYWo3gxNN87+IPx0eoE
	ABZLhFkKTCwOMecY6SoVYK+EN7kAVT2SoqkewYcZIqAKUlA1+I9a/lj10qWsq/oNW1SZWiXn3QI
	ww708KNlvTE4zLQT9xHXsWCw3OtKIsPnvJuK4qL/fhW6Ox8M2dVCj5ZF5bo0CATYNCleKm0qcrU
	QzYj0Oi3ptH8U90qpkLP6Q1yHfRyGrmlfRXs6/hEWAZqizwlaBhZEdGCoZ80yTLg+qsTJG72UcW
	lwAzrbZQp39v90mFlAGUiMJ1D6T1k9LIKMg4t0jE2d/KuuSXqbJXYBECjyzIdNiW/RgMa60X34q
	PU7KX20xSjYylyWy5fZbekdbaUKCunCIrCmP9UqYvs6DhOMrUm/RI4oWKwwR9HeR4v9cqubZa7G
	a4GKPjJTJHflPt97IgLxmGF055n6VgRLyQNy+EojG8jV9RYKQDLVvmOYCwu/f1XrZYF9Fztoyyr
	pb/eMNdfquB+MyrNTNHaHz+I1XCk0ilW6R2pm4zyTNX8Ut5SqRLdJ6ck
X-Received: by 2002:a17:907:9306:b0:c3e:e677:5608 with SMTP id a640c23a62f3a-c513a5da8d0mr870341966b.12.1795435157410;
        Mon, 23 Nov 2026 03:59:17 -0800 (PST)
Received: from localhost ([50.7.123.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae68a9asm395946466b.30.2026.11.23.03.59.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 03:59:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 14:59:13 +0300
Message-Id: <DN2KN6PFHOXG.1EWK1XUHY7IKK@gmail.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Sean Wang"
 <sean.wang@mediatek.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Jiri Slaby" <jirislaby@kernel.org>, "Daniel
 Lezcano" <daniel.lezcano@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>,
 "Mattijs Korpershoek" <mkorpershoek@kernel.org>, "Dmitry Torokhov"
 <dmitry.torokhov@gmail.com>, "Kees Cook" <kees@kernel.org>, "Tony Luck"
 <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-serial@vger.kernel.org>,
 <linux-input@vger.kernel.org>, <phone-devel@vger.kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>, "Conor Dooley"
 <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 0/7] arm64: mediatek: Add initial MT6895 and Xiaomi
 Poco X4 GT support
From: "Alexander Letuchiy" <asalde.le1@gmail.com>
To: "Roman Vivchar" <rva333@protonmail.com>, "Alexander Letuchiy"
 <asalde.le1@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
 <ckJZtdZ4-fPzsa3vkozNyEYYUbG9qd134hYb0hHEuq2nL8WMAR1PS87OpDfXrkU-E-85rsG1I4V99_M41j6-ewkD_41XPguDel3z8z0lmMk=@protonmail.com>
In-Reply-To: <ckJZtdZ4-fPzsa3vkozNyEYYUbG9qd134hYb0hHEuq2nL8WMAR1PS87OpDfXrkU-E-85rsG1I4V99_M41j6-ewkD_41XPguDel3z8z0lmMk=@protonmail.com>

Hi Roman,

On Mon Nov 23, 2026 at 2:41 PM MSK, Roman Vivchar wrote:
> > Bootloader dependency
> > ---------------------
> > This was tested with a modified LK bootloader that is not public.
>=20
> How are other xaga users supposed to boot the kernel? You might want to
> port uniLoader instead, or if you're on an old enough security patch you
> can even replace stock LK with U-Boot. U-Boot chainloading is also
> possible.

Right now I am replacing the stock LK with a modified one that knows
how to handle mainline DTs without expecting downstream Android nodes.

In an ideal world, I would like to replace LK directly with U-Boot as
you suggested, though U-Boot chainloading or uniLoader are also valid
options. Luckily, the security patch level isn't really a concern here =E2=
=80=94
xaga is already EOL and hasn't received official firmware updates for a
while, so LK replacement works across the final stock builds. I
definitely plan to look into a proper open bootloader setup for other
users in the future.

> > Firmware behaviour
> > ------------------
> > Two things in the stock TF-A affect what the DT describes, but not the
> > DT itself:
> >=20
> >  - TF-A rejects CPU_SUSPEND for about the first 40 seconds after boot.
> >    The vendor kernel lifts this earlier with a SiP call, so with this
> >    series the idle states only start to be used after that time.
>=20
> It might be worth porting upstream TF-A too.

Agreed, upstreaming TF-A support for MT6895 is also something I plan to
look into eventually, which would let us drop the reliance on the stock
TF-A quirks altogether.

Best regards,
Alexander
