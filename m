Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795268023;
	b=wVeLWY2sgNNpNlOl6UVLjfCR4rpc/0Uru8HEZThhLj3R7ZgBO9bFEB8IO4fOOdNJ9z7O
	 7D0v7wyEkAoQ9aIJTifJoVSQUpBoWS5N0b/LoeEfObC/1jsybuBYogJ5djhjlPvAT2AOf
	 vgLeO5ey75Wl4e8ppcpK04/Da9PILwVscC+3SbHskVv2gu/7svRZl/MOKXIiSeTQUOlv+
	 itJVhR3IGJLWETSYdTfCZNeRLdTBr/A4COiD9dt0P6XtFJIBX1KVNJpwi/SYIgmKHQ0KF
	 32Kxxx1QV1vs6ky7ykQ8/Rrw1M3YHv1Qjh0vtx+NdNrRun2AksP+jBHhsssl5+OletQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795268023;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=EJoKIhVOzRTnCw3xv/1juimw9ds0gPz48EALk+RpXY0=;
	b=Z09+jpH6Zo7Gh3qiEr28+2jnvmgN9SgxuL/4v60/x4PetvgDelwf8nRcDfq69oTtLUMD
	 gLs2VXk/exbJMfKIAWYCWCiwlUsRbGH3BuZqErcxIMEX1Q4Ricgh1eNpj3G3Dj08nJ8D3
	 YfH7Vt3jm8O0u7vfSJ0Q5IalujMhUwfzRMTDt/EokRYczWcIfkN2UCPLU+eTtqOWd/K7h
	 2DgnWuSa4AsTAT52JxEufuDY1lJPV5eLioZTb2SRkq840E0gHK92nXcMPuRewlT6RgtNX
	 jjjQU4cvzJibCj1AzFX2+2pkVbJWPonVrZaxY3PG5t09auR7N+RQbaX74xr3czrHjbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=zfxowsvl;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D536D606A32C
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 13:33:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D536D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=zfxowsvl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=EJoKIhVOzRTnCw3xv/1juimw9ds0gPz48EALk+RpXY0=; b=zfxowsvl0narWz7XL1vtgZauEK
	BeLrteWBesDZMjmKbHncnpM+0lnUPnWydEKcvIeQn5xgTESNLgleJn9C1SYHBWARI12RGqOM5sPUx
	2blof2VIlx/5AfA+Z3Z8RL/gtwH+GLS7Vi/lQzpkXCewoD5gSHMcTwr2KGkMNkA22x5rUXSe3ckDV
	u47yJpyTjikF6ObpU2At8jVp6q3IzaIwe1wmyhfzSGK32698Gs2/ESWyLTkyZsW1y0Ex2QgkaofcK
	8dKRJTqabwMvTB4RHz5QJoSdOTWL5VlLGReRMpF3Ga6Oqnvxj1f97ifIjaUM3HVsMmctRVSyZgjMN
	1RU8AIdQ==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Sandy Huang <hjc@rock-chips.com>, ZhuXiangyu <1194781887@qq.com>
Cc: Andy Yan <andyshrk@163.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 ZhuXiangyu <1194781887@qq.com>
Subject:
 Re: [PATCH] drm/phy: rockchip: fix RK3506 DSI low-power command handling
Date: Sat, 21 Nov 2026 14:33:23 +0100
Message-ID: <I1iUkWzgR2mQ2vL4ooyigA@sntech.de>
In-Reply-To: <tencent_F495CC22423581B98A12990F93C04F33CB06@qq.com>
References: <tencent_F495CC22423581B98A12990F93C04F33CB06@qq.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Samstag, 21. November 2026, 09:05:55 Mitteleurop=C3=A4ische Normalzeit s=
chrieb ZhuXiangyu:
> Two bugs keep the RK3506 MIPI-DSI link from initialising a panel: the
> DPHY programs the wrong high-speed timing entry, and the PHY data lanes
> are never enabled in the GRF.
>=20
> 1. phy-rockchip-inno-dsidphy picks the wrong HS timing entry
>=20
>    The 1.5 GHz inno DSI PHY timing table stores its rates in Mbps while
>    the other tables and the lookup use Hz. The mode enable code compares
>    inno->pll.rate in Hz (e.g. 372000000) against timings[].rate in Mbps
>    (e.g. 400), so the comparison never matches. The loop runs to the end
>    and the last, fastest entry is used, which programs a TLPX/LPX
>    counter that is far too large. The panel then cannot decode the
>    low-power DCS commands and stays in sleep mode, so the display stays
>    black even though the LP packets are visible on the data lane.
>=20
>    Convert the 1.5 GHz timing table rates to Hz so that the lookup
>    selects the correct entry.
>=20
> 2. The RK3506 DSI GRF lane enable bits are never written
>=20
>    rk3506_chip_data only clears the turnaround / force-stop fields, so
>    the PHY data lanes stay disabled unless the boot loader happens to
>    enable them. Program RK3506_DSI_PHY_ENABLE_LANE0/1 as well.
>=20
> Tested on the RK3506B JerryTech board: the panel now receives the init
> sequence over LP and the framebuffer console is visible.
>=20
> Fixes: 785a9d5bb145 ("phy: rockchip: inno-dsidphy: Add support for rk3506=
")
> Fixes: cabeacc7eadc ("drm/rockchip: dsi: Add support for rk3506")
> Signed-off-by: ZhuXiangyu <1194781887@qq.com>

don't mix subsystems in patch submission please.

All the process issues, Krzysztof pointed out in another thread still
apply too.


Heiko



