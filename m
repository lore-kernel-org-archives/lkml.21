Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795782194;
	b=x537FlvvFBYs9CVm8HDYdroiRvX9s2u0qX+jQEWrkDhFW/7f/4wOheAtS2tDQssPj6Ee
	 YoAB54FIp02bzY6p/Gz2a396XBo8ygMA01i4JgQMPy2QceyjUyD9Z9JJ6v34TBMDff+KA
	 81YZleCCDlCl0b137BcpeUWKndpQu4Ys/eWVqF7MvHCl/HKv2ugCgYhwmfz9a+1Zjdmld
	 OMn3FwhwbkmjfPhStGznQOut1rgmKbQNCc4x3c9d2SGE1x9HU6581UjOKFkzCIfHa49EQ
	 lEkIn4loWvyLfNGP6IupB2yad7XlFzSPUjG3u/FufLOEUr8mTCcuzw/T5S5l9ctmTCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795782194;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=c12Zkxjeg6rjGrTjjN1zUUM8OFcraLXLi6+BuwMU4QE=;
	b=iHOQ7+V7duiMV/mIP+1psCTCN4D78K/Hz316x67Ov+2yWROQ9tkwtECPWLLfQJq4Ztg9
	 uzngooLBcxknxN/vNNJhadMxkc8WbflOgy4pV8qJ91yIsUPiqVS1EeZrITH1IfJKUwlLI
	 TjUIhtvpJtO5UbHvN0oPNMafn2J0dgLURgSauQjJoM3/aXnHNWy3EViIEkKZBdA25wKDk
	 jmi2iRW/Sd40qVO4IreDW2jppAdNryyCrNqRT2t3S/AgNpGi6U2j51OuvIIZZEA+mG8xx
	 wLLjAuZmf5WkTnpj8qQQ3eQryXKjunuFxxBrdIe6yydaNezl62EhXnzQbBrh8oEERhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nivgsl1R;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5643606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nivgsl1R
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 231E31F00893;
	Fri, 27 Nov 2026 12:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795782194;
	bh=c12Zkxjeg6rjGrTjjN1zUUM8OFcraLXLi6+BuwMU4QE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Nivgsl1Rie9zo+jVegl2JAscy+WS4emvn5WXBN7aZeLouEqCRFW/Ij0cPiOxef4yB
	 7TQjWdkZHYz66WQRqFXlfVBwsN++Lp9UOko8o3ScfUYxRjjfg3ZzogLVfJ+JHj4F+W
	 43Y8KDsv5fX/Gc2ZKdkVbhLmfB8BsRtCa2RjwMa9tGdPWIwFRu3Cx7Z/OOU+kgHQXq
	 z5yRO4lqg/iIaF0YrsnJTC4L0bc4WX1jbOr/p+COqKFsf9Xyxq5uyJhtLLnAa6D5pL
	 dBZjo+iAslkSNaw2Zxgx4iZB+PiZge9QvRqqu1eFs3ktC7gUEEUPWEJeslVK2ygWY6
	 xPWJyHAWkI3Ew==
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
Subject: Re: [PATCH] phy: rockchip: samsung-hdptx: Power down the lanes on
 phy_power_off()
From: Manivannan Sadhasivam <mani@kernel.org>
To: Arun Iyengar <aiyengar1990@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261110-hdptx-lanes-pwroff-v1-1-c2f85b7e06a4@gmail.com>
References: <20261110-hdptx-lanes-pwroff-v1-1-c2f85b7e06a4@gmail.com>
Date: Fri, 27 Nov 2026 17:53:05 +0530
Message-Id: <179578218573.13164.1824444278264015973.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2073; i=mani@kernel.org;
 h=from:subject:message-id; bh=Oj5HV/thFvMBEahPJ2+46+EsI+CFa7Kz8uIFq/XTiSE=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBrCXYtawNTHXtgF90TUxjdD1J8a+FlpDcFmwX+/
 KgyshZ7F4WJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCawl2LQAKCRBVnxHm/pHO
 9TqhB/0VwhOvKxRk8npFn6N+osdlrMNKoI2eGwyv109+fEdDmkOPXYREVtdGfWLNYeuHaGvfdAc
 aOJGZhycAK83LE36fox2tn4fj3x1xZshOgJjxSsD43qRQOHWNwfu76yEsarhwVfXESxDaw2AKBk
 g1WfOuUOAQLtHdQBrWlRjD+/UUMCq8BeMQcjJTJdD5JyO4P78KT8aNO5tgkB1QpKCVo84OVZMpK
 zAPrIKIWjXr6wL6hArrhtXFCyl5Cw89T2ameZExNqqunLco244CWvA5MCccSy+cZc5eu3pkst2n
 7NPn04lmXFuf0buYSSDDLUyQhGA8LT/QlJ0NghLh0vHhuQky
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-11-10 07:16 +0000, Arun Iyengar wrote:
> Since the PHY became a clock provider, rk_hdptx_phy_power_off() does
> nothing but drop the shared usage count, and the PHY is only really
> disabled when that count reaches zero.  The count is also held by every
> clock consumer of the PHY PLL, so with a clock reference outstanding
> the lanes keep driving the link after the HDMI controller has asked for
> the PHY to be powered off.
> 
> On RK3588 a clock reference is almost always outstanding: the VOP lists
> the PHY clock among its clocks so it can source its DCLK from it, and
> the Rockchip power domain driver puts every clock of a device under
> pm_clk, which prepares the PHY clock (i.e. bumps the usage count)
> whenever the VOP is runtime active.  As soon as any other video port is
> in use, e.g. a DP output, switching the HDMI CRTC off therefore leaves
> the HDMI lanes enabled and the TMDS clock on the cable, so the sink
> never sees the link go away.  The lanes stay on until the whole VOP
> goes to runtime suspend.
> 
> The lanes belong to the PHY consumer alone, whereas the PLL is shared
> with the clock consumers.  Hence disable the lane output and hold the
> lanes in reset in rk_hdptx_phy_power_off() regardless of the usage
> count, and keep leaving the PLL to the count.  This is the state the
> PHY is in between PLL and lane bring-up anyway, and the next
> rk_hdptx_phy_power_on() restores the lanes through the regular
> rk_hdptx_post_enable_lane() path, so no additional PLL re-init is
> needed.  The vendor driver does the same: its power_off callback only
> clears the lane enable bits, leaving the PLL to the clock refcount.
> 
> The DP mode is left untouched: its PLL is not exposed as a clock and
> the lanes are torn down by rk_hdptx_dp_reset() from the usage count.
> 
> Fixes: c4b09c562086 ("phy: phy-rockchip-samsung-hdptx: Add clock provider support")
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani


