Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795793823;
	b=0voZ4z2AMjzUA5RymUyxYcjOs3/pDPG0PYoQ+iFyx7C9LJomF/9PrEaM7RyfJpSr16yk
	 /H/Xa+BYZQblLiE7V4zVVLZ7fSRbEOL6dih2zf1TBAcKhGCwaCa+mGntIFzIBHtKbASTq
	 G6iD1pakvMRZKnDDgfOSxvIitDUq1jENrggtkUxDsNJj8uOTeCdZnRKKGmcZ0vKYV1eon
	 9QRlGqYtK/hLfb49m4GIc7p1qOPKznLb2dwnpoOMDFLzmrGhgs276mPGpQNbhf6ovY4qo
	 u6w55PBCh5MaBPk3oGzpJtg7dY2+RY+/aMvytBTz9raTrGJngGoKviPx3H8uKKysO4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795793823;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=WlY9vageXSeQmZ20n2r9+i3MSMUzXaIV42tMmADmcds=;
	b=FKMWKJULw0v9F/u1B5nojgVh2MEAs+Tp0tKnIjhediGJ/2FjgyiWgzBJVXWloYrsylvD
	 gEaVvEDqP7bzH0QXjfF1cOQldHEUJcdjbIlAsukqjtilYy3zq0nH6Em4Yu05+M3HqdUns
	 TQ16piNbzryXUR3LsEWrfu9cqBs54f0W3yA5s7M4648ldd8TnQ8jwN+lK3DxMpB9TR77p
	 1sBENTzkgbsmAhxqA++DPHjREZUhH2DbSDl23ZL/zfMyjjJMDYPll0XKKSzc4bLSXXXD8
	 NMFVxDI4oNwrsEoR2P2HOxKpkyYlnYrsS0Le1KuAKyb+s2v9C3IpBxcwbRzPLNN7eHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LQXyeyNF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C72606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LQXyeyNF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F7C81F0089B;
	Fri, 27 Nov 2026 15:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795793822;
	bh=WlY9vageXSeQmZ20n2r9+i3MSMUzXaIV42tMmADmcds=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=LQXyeyNFQ4doLUmmDJeyYx54X/OesXH+8JhiZJJXD8vASgntwIv0tCTRPoG7+AJ3m
	 /tW0xxpecnqvQzTG8ks+ICpipGuObmcuGewo8bECYLjFrPADbvUlTdOXDcw5H3D6dH
	 PHeTqTCzTLDrBftRT0RoJoxhJANbLkDjY70CJsymGGOD3qun2xGVZkKA3X0C+l3mYc
	 70hdN7l5RM4K72OoYjqIarbSCn54xsyTzqOFuPK0tCmxMIuNEyKZI0e1w+NtiwinLj
	 7fytVXS2QcM9PNgteTHTcrgVzZpRqhcULqwwGhWsjTK/J2rSMIeEcwXFGcqIngy2WS
	 W77NdBugRrh7Q==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] phy: amlogic: meson-axg-mipi-dphy: fix clock leak in
 probe error paths
From: Manivannan Sadhasivam <mani@kernel.org>
To: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, mani@kernel.org, 
 narmstrong@baylibre.com, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261118013723.232-1-laixiangwu@cmss.chinamobile.com>
References: <20261118013723.232-1-laixiangwu@cmss.chinamobile.com>
Date: Fri, 27 Nov 2026 21:06:55 +0530
Message-Id: <179579381511.13164.8479419499122880409.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=722; i=mani@kernel.org;
 h=from:subject:message-id; bh=4G0uLdUD0/07Sh6IMGwh3JriuBU8udZ1uUTvs82eMhQ=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBrCaObxP7O3om0CXQpkwI5cwZG0zdVOOAu3rP8T
 xmRdwdiOAKJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCawmjmwAKCRBVnxHm/pHO
 9flRB/4hEi4gq0vUPA0OmZV3B5gtIlU1XOmLIm0lWPBwpYmuf7aHBemEP/bjZa4t54v9FMMnM2P
 o1qLBIDhpyHAe10LMuYY06DIKW71AJt63aaL+BeuxzQI++ZM/9ds2GM1erIVSU3mgk+eM/5jaxe
 5hIeRFL0Sl3dAyTXCGlFw/pUD7RKFpTEbHYztslJjeAYS3db4+QZGEggq2LYUNdcvlVaX5ypNHp
 rJ5PgIG9tcj8t73+jXnHA4tdOrWAW0Dp50gwAeNnxHKT/6sa1qyDtRkiC/PoN67NxlcFJsJ9lfx
 e2VVwluKWDIIRU3anxLP59MCsA4QMwDYKCxKFh0B18uh88jY
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-11-18 09:37 +0800, Xiangwu Lai wrote:
> The probe path enables the pclk clock with clk_prepare_enable() but
> none of the error paths that follow (reset_control_deassert(),
> devm_phy_create(), devm_of_phy_provider_register()) disable it again.
> When one of them fails, the prepared and enabled clock is leaked.
> 
> Use devm_clk_get_enabled() to get the clock, so the clock is disabled
> and its reference released automatically if probe fails after it or
> the driver detaches.
> 
> Fixes: 76aefb221146 ("phy: amlogic: Add AXG MIPI D-PHY driver")
> Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani


