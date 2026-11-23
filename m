Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795449325;
	b=j+h8jzg2svvFJhqSOgVaA1m1vogtgwMPS66lM0ySevmIZkiNbMUGCHYBWaL0jyCp3z+C
	 mruUQsP8judekK2r12jL47iv3J6PMJf+YKyfmAA69Sdy/CbacZ+b8eTiiQ3+p3q7vpwlq
	 bYQXcx314vx2CXQrvnZmKPB2fZOsEeI51TdGJH1X7EBwon2kMhIhu5cG37e0hW4PmPfmu
	 +oj0/GdXNCQ9Gaz5nKUodBwB/wkkMjwx7o0EhefLfPey6rIwdXD4sNi7cWTEoHdcHVY4m
	 Ajiva4WKTBlfJsSIaoknzTzepwMHptzMPbu64QQqKIFif/3sgH2X6i4BsSj4CVuZ4SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449325;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3G6I2HBy1UTihgVzffidRJ8qc0m2dAG1ryDyw90kJ+U=;
	b=jKFb/zhB+84QJtw19uBqUWCHn3oIHEM4oQYMZt3Hij2MjkVqTRsEmLIooCtzd8ZIgB+A
	 Uy3Wbjv2lFacglMBGj6aMY0m3X2yB3ytrzMbDoMO0JZM4lyqE9haZNUPxV3fT4FOSLRfJ
	 hdJgPeHQ5EZQ6MpZYKdJjyFdNauUG1Gzjkp7pzRWEuwGGDgaO/zLVJaJiibt6o0aQTcCN
	 PEXcNqLUidl0+janA0FEqNn716QBxLLXpwsRyWGMyqSgj5BJvBG+qcxUAr7o4tp7DEprD
	 F9eRc7cQYazFq1UOPiHZLskdl+2Q3kSIdXAQ74pGowTz86ePmEHdQVM3209O9haB10Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YIPojpav;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6C5606A337
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YIPojpav
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71FE81F00A3D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795449324;
	bh=3G6I2HBy1UTihgVzffidRJ8qc0m2dAG1ryDyw90kJ+U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YIPojpav0O7GuwdQ8vBLY/e71DVXviFdsS44PLAZ6U3mzJmNA6TR2JMjsN8z5lxCr
	 DbkvMGQFYOuHHzjMf8u668uvyZWYP73Ki5QI4dd172ddRmjLFNCa1RTUNH56JBlA59
	 DWJcJyl8C/QXuR7xiGNwKc63hL3TIUzKnOEhWm6p/JSDwbCrHijVfhs4JXS77SRl23
	 /lEkfV1otEaHf0WCm2jhnwz3dRQVyDEuB/CgyXWuGu6IpZPRjTt1E7VOxNwDDZILJd
	 Wh0IWvZYsXb6pcvxsO9MTrZusQddlEn9jgt7S6z878feRaXG9PYA+wtFIkq7dSQc6L
	 qisckzr3Lptsw==
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b50a4bd2f3so5083778c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:55:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH8IgoOZxqI/d05IzI183N+noO1BI18/RS5PH5yboDC2ybZRq7kWeNR9xK80CkdAJ/t56xp2rNVW1wWS1M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sfwyZvxpeV3HonAzy1ZZgZIIaoSogEXaURtWbYk0yPbFDilsw
	2yl5neJ20Emdui3AJ8xa0Vw3CrhuJn+9zY7hVz5MBWunebfmMfpzGxd7vpIwd2EG+BIEWhivjzO
	BWvrq5cdKc05Jlac/xrKIRj4Kvpv51w==
X-Received: by 2002:a05:701b:4212:20b0:195:49ee:94c7 with SMTP id
 a92af1059eb24-1b556877b4bmr13673422c88.8.1795449323806; Mon, 23 Nov 2026
 07:55:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-mtk-dsi-long-read-v1-1-0b6d9b67c011@protonmail.ch>
In-Reply-To: <20261105-mtk-dsi-long-read-v1-1-0b6d9b67c011@protonmail.ch>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 23 Nov 2026 15:55:09 +0000
X-Gmail-Original-Message-ID: <CAAOTY_86OXNzY1ZCM-TkRHJBL2D251TmMUAb7KciJ=J67zzpdA@mail.gmail.com>
X-Gm-Features: Aa3M54odlecVrJk7CoDKPAKnCFnRzxRnnufzNqT2mcMd-MnXgiezzVi7wDx4zUE
Message-ID: <CAAOTY_86OXNzY1ZCM-TkRHJBL2D251TmMUAb7KciJ=J67zzpdA@mail.gmail.com>
Subject: Re: [PATCH RESEND] drm/mediatek: dsi: Fix handling of long packet reads
To: bengris32@protonmail.ch
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK Hu <ck.hu@mediatek.com>, 
	shaoming chen <shaoming.chen@mediatek.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ben Grisdale via B4 Relay <devnull+bengris32.protonmail.ch@kernel.org>
=E6=96=BC 2026=E5=B9=B411=E6=9C=885=E6=97=A5=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=
=8D=882:35=E5=AF=AB=E9=81=93=EF=BC=9A
>
> From: Ben Grisdale <bengris32@protonmail.ch>
>
> mtk_dsi_host_transfer() decides where the payload starts in the
> received data based on the byte count returned by mtk_dsi_recv_cnt(),
> treating anything longer than 2 bytes as a long packet.
>
> This breaks long read responses with a 1 or 2 byte payload: they are
> treated as short packets, so the word count from the packet header is
> copied into rx_buf instead of the payload.
>
> Fix this by checking the packet's data type instead of inferring it
> from the length.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 21898816831f ("drm/mediatek: add dsi transfer function")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ben Grisdale <bengris32@protonmail.ch>
> ---
