Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795036533;
	b=B3uLUOcxyeUSfy3bNtu2O8u+7zkE3sVUPsMq7zXdm1WvlIt/t5kXA9uJHBrk+Aci6cZu
	 wLSZ2bKzyggDAULaSymD1AcIUnpdKBpqtCdOf4ED2f4eOQ3wX1Krh10R/RmD+h0QC43TB
	 YnbPryPol865WeAqlWlHNowXBldpQ+UX2u89zhguidYX/wb5JLPQmPybMHvzzKLd/Ay6l
	 RR3kzCZ/vsYWobsdGPAPIHpk/qVb8guMm1FuA4pAQEi1qZJBjR9c5CvYswiB3WP1UdVeu
	 Bk4w16Aw4k0roGD6inVxF83ua+jA7YB+4aJSaa6LJY1mIFewo7G0EGZdl2KFVI3XdWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795036533;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jXpHBT1/WDmLp0zpzRIxDl44SN5leSzeHP8wCtpU/Po=;
	b=lePi0TW6YXCTsx0gVfSM8XPSlrvkIOE3sNfFDWV84S/yl7/Up8pvnerbLX+8J0NB4Ss0
	 MJFOhF4+Yy2OGJGAG22ZDWP449MFGXO765EOlsdS4PzbSJtBxkbFN8De/3CiaujN0Tzgs
	 Dg9Gz+rXrIIYWVfQBnc7Q+ZmhvZpVXlcrhMwqujXyemW8BYoTxQY1y8qX8B0YVe3ZV4Q7
	 TiG/VxMsmBLqKVLVqhKBqhIn/UMkVeb12UZhJEa5gedcGjI1cntsOMblP4wqCxmRDxX8S
	 9SBlCok/+AIVT2SA5XivTjS4126O/j/Z5FuZXTJKI/09d8YArSOmxKtqexWXOLFoHfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kjSyc0l2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FF2606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kjSyc0l2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FE001F000CE
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795036533;
	bh=jXpHBT1/WDmLp0zpzRIxDl44SN5leSzeHP8wCtpU/Po=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kjSyc0l2jgfTa1Gr7mPOfzuP6tLnKgnN3OKAYB/HxNNqyFZcDFB46+L21kpljI9ky
	 tJ9h+IalPk9axrIlGCBbpRHL6+29YZuB0IVHAKxz0bo4UY+/W/P9jT12kdqWlun20T
	 2HxNcbk4DkYpClX+2W+G1UfwlY6KHQC5fEW0hNuGW6HVROF5lZNd2YIi+YBww4Uot9
	 Moc3q1Tx7Y0K5G0dZt7BtpTCDpZnSHAZI9DehbqOkkDjGZ7F5pRKWwoKvj6xqWciWf
	 NaL5g8qzFQNgtN34F5iEG1VxHl+YOFKpbN90QuJjw7Ir/pF7E7bE9cpA46y6plbFkh
	 HI60rU5SAnfxw==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5c126fa1e3aso1011831e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:15:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHYCKsA3OWrXbTLQqLLeGRX+ghppav8VoeuWdxmTaafBXc9uiJklspygAknrug590gNa4FPnncvRBUafGI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9aGaFqaPYNDihBsY/UO4qBa73U4TnGAEox9uVSWac1DUCVjINg
	usR+gOtF9siUxc+0Xo1/mFPGYKSo0CYGPFSVLsH7Sp0MM+4/xgSkZo8GtoxiMNyUgRGZrdXIwEF
	9ItUACaALK92DZYVTgFHF1lUOgnLn6PU=
X-Received: by 2002:a05:6512:1102:b0:5bf:f7e7:85eb with SMTP id
 2adb3069b0e04-5c1aa0736aamr1346704e87.21.1795036532194; Wed, 18 Nov 2026
 13:15:32 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110094339.749110-1-zhengping.zhang@airoha.com> <695991a0-ae67-4ce0-9b92-f191ae97a468@iopsys.eu>
In-Reply-To: <695991a0-ae67-4ce0-9b92-f191ae97a468@iopsys.eu>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 18 Nov 2026 22:15:15 +0100
X-Gmail-Original-Message-ID: <CAD++jL=_q3SWsh6AW6PLOC=h-z-h-N8AcC8SRCPVKsbzEPktfg@mail.gmail.com>
X-Gm-Features: Aa3M54omwiJF0rg8LzwHPSiyolxNp74aN1hJ5GJPEJYrBTD3qh4Hbo9mWipBH1I
Message-ID: <CAD++jL=_q3SWsh6AW6PLOC=h-z-h-N8AcC8SRCPVKsbzEPktfg@mail.gmail.com>
Subject: Re: [PATCH 00/12] pinctrl: airoha: configure GPIO muxes explicitly
 and fix pad mappings
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Zhengping Zhang <zhengping.zhang@airoha.com>, lorenzo@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, brgl@kernel.org, naseefkm@gmail.com, 
	benjamin.larsson@genexis.eu, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, lei.dong@airoha.com, ansuelsmth@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 3:10=E2=80=AFPM Mikhail Kshevetskiy
<mikhail.kshevetskiy@iopsys.eu> wrote:

> Hello Zhengping Zhang,
>
> Please fix your patches. Looks like you insert patches to the e-mail body=
,
> thus your patches were converted to "mail encoding"
> * tabs was replaced by spaces
> * unchanged empty lines "<space>\n" were converted to just "\n"
> * long lines were split with "=3D\n"
> * "=3D" were replaced with "=3D3D"
>
> and so on. So please use "git send-email" for patch sending.

I agree, I can't work with this, maybe review a little.

If possible use the b4 tool to manage your patch set(s).

Yours,
Linus Walleij
