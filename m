Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448692;
	b=1EwYkPoIugwBuaUVpmaOXWrcl+mxl7heEQvRH2m2JBkvt8tvEjj5LEGeq2XgW2PiMNcm
	 cFxgD+sfOGIaf8dPDlA9PUfs32cdRqxCvr7zZmsULOKXOvMHwQWDGN5kEbjDjs6d+j5To
	 cPlEq0R8WD/kT74ydOpFM5NGSNaJPSELHoDHD6PMFUPoRWJCzIHYb9bl4llFf+X9ra4fR
	 9Hu76AH28rT4luyfuD0Tc9IWAvEJr3LebzdoSsKU+1o+btXW+js4eaCQtFW3W8o/MFuto
	 e9dsyTy4tG8aUeJ42m77wf4KU8MTutAjR4Y477y0vEANAVo876eOXpgl8Opuwb6V5jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448692;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+aUeA+MT4pQzgTYYY3MzWDtwE8dPdBjMFRXJtpyXdqA=;
	b=K/aHsjc3/RgLzA33c+khpxv4lp+2NW/uNp6JhsSyBtrKhKZmw0oggmfaubhaNDXeNjFx
	 /RJOH1mL7mLSbyepXMvusSg4O8V+OUgAMPa/eN1soiZoCFKLNgb4PjuKyksy7JZU6IhtY
	 XSjBkhdP3PjG/XebdDJWBCaBqwwmHx89CjuMpbEyO3MmHr1L6jjJIPRNsodm6qm70/7UF
	 mpS2R8gzWSrqWIUvZtjqhEEjJbnsTkQVAgNrei+30pVliiMqyQI0h0s4OWnIPqtIUEu0K
	 0mPF3UcUbKbiFxIjX2ghhdMZwflwRojFopC/CqFC2oHMXXGPWl8njXxLzQr4D1YMqQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BhnTzYnn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288BC606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BhnTzYnn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CC391F000C6
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795448692;
	bh=+aUeA+MT4pQzgTYYY3MzWDtwE8dPdBjMFRXJtpyXdqA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BhnTzYnnqJZs1vlF2CbvKQ/jCtr+tzHhysT2ctBbdZUiMpjyTYRZHYHy0h8WY5jUY
	 po9bO4YN9TLw/x+knH+4j/7M2Qx68Gm3U2LNvzs0nECU49h3zxUCf/iIb2tINB6ZTB
	 KvpJe1vWWs37yzxOy69glevzwCB8cIew1fpzXvgU11jubtINVOj9Kyacl4dD4G7rfr
	 ee2WoAzM1E2Y/zm8TqrVmvDSWOs4uOOHe5vn5UGvEgT7r8VASO7h3v1iwp2v4llynk
	 W2+wNLpVKtELoKoMI+N1HjDdE8sum0OuHdKFa+ZXyriwZtjiAU2ImwvTF96bkhDz6K
	 HqAX2YIeSnxYg==
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b563e32936so251752c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:44:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEqoQl8itqzMltI3b4OhXmS92WkKnuuSLlrlhAYIxbmFTUXIcHXhwfmGZAJ7MkihT7Ll2N/mpE37Kp1UuE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qj8F9Dsky8jmIS4JhqDKYJxbyJ2+wKoniU568mPEXbeVOsenX
	HXwGH7r7/AhbxQBRo02z9WIXTnLDxDUr1zZUW5Ic6jM//BSutTSqQVjuamriZO0/ExNlXpnV8oh
	SL7znyX3dIu31CGZW0+goZQrCCZALNQ==
X-Received: by 2002:a05:701b:2514:b0:16a:c6f2:60c2 with SMTP id
 a92af1059eb24-1b55689fcb2mr10691688c88.12.1795448691498; Mon, 23 Nov 2026
 07:44:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261011004248.1117649-1-agentzoan@gmail.com> <20261011004248.1117649-3-agentzoan@gmail.com>
In-Reply-To: <20261011004248.1117649-3-agentzoan@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 23 Nov 2026 15:44:38 +0000
X-Gmail-Original-Message-ID: <CAAOTY_8CtsEarnY804MbUcL+NewYha8kpKZL8cELYKkgr9YGng@mail.gmail.com>
X-Gm-Features: Aa3M54p47vp69xabIIzK4WtjBR9vqd7GfhDX7meoGYcQvi87327NFNEbYgSVxFA
Message-ID: <CAAOTY_8CtsEarnY804MbUcL+NewYha8kpKZL8cELYKkgr9YGng@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/mediatek: mtk_crtc: Skip the empty connector
 route slot in destroy
To: zoan37 <agentzoan@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jason-JH Lin <jason-jh.lin@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
	Nancy Lin <nancy.lin@mediatek.com>, Nathan Lu <nathan.lu@mediatek.com>, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

zoan37 <agentzoan@gmail.com> =E6=96=BC 2026=E5=B9=B410=E6=9C=8811=E6=97=A5=
=E9=80=B1=E6=97=A5 =E4=B8=8A=E5=8D=8812:43=E5=AF=AB=E9=81=93=EF=BC=9A
>
> A CRTC created with connector routes gets one extra ddp_comp[] slot for
> its output component, and ddp_comp_nr counts it, but the slot stays
> NULL until mtk_crtc_update_output() fills it in the first atomic
> enable.
>
> mtk_crtc_destroy() walks all ddp_comp_nr slots and passes each one to
> mtk_ddp_comp_unregister_vblank_cb(), which dereferences it. Tearing
> down a CRTC that was never enabled therefore dereferences NULL: unbinding
> or removing mediatek-drm while that display path was never used, or
> an error in mtk_drm_kms_init() after the CRTC was created.
>
> Skip the empty slot. Nothing was registered for it anyway: the routed
> components (DSI, DPI, DP_INTF, ...) have no vblank callback.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 01389b324c97 ("drm/mediatek: Add connector dynamic selection capab=
ility")
> Assisted-by: LLM
> Signed-off-by: zoan37 <agentzoan@gmail.com>
> ---
