Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981357;
	b=cHlCICvChcm+M5Uwo+zqqlz2rCzJuRTQU3x3mrJCOdZJZDAFog8wzAj8V6aHjtRWp3zh
	 b0OMvjJ9Fwvdjy25gRSDIecqmp8+i1a2/O+TND3XDfO77IsGx2D7/j9ufP9Gd5r4KIugk
	 drQ8A2ulb5fx78eE6ER2i+Mmo2zlyadEOAcorLLj76F2EfwXtXZISkoTzzo6J+s2tgSXt
	 R+Eb5TxqGQDwrRXt+g60K3rIBm0CDocN0vw1MzZk/CBE3UG4XBGR5JrOMfjSNsiufV30b
	 83tmhqzEu7jnH1Qiw/uqZt8/tSVHWjunqsv6rleuX4a2CVN90Pl3nviXGEqUbHx0CJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981357;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=QV7/azGZskXYhWhh8bvjrBkzYwv/Uf2HoCpYkbr0EGk=;
	b=HVp9WHxOKkDlwf9x6wxpMkOpeQQfRJBUG4P116h4t15/wVPkQPpvP26tjfMao2pilkBF
	 0NSgoLofJoiw3TNfB8Vp6Oc7v0lQi1mIBzd6Vav8IkTwdNNYrsB5va27zQ0zrwHI6qSvw
	 e7tyhXvmlFQidkrvJRilGVU2ecjfOh0YbChuZtTvgOeRuMpjcyTpP7O3upQQ1XySVR71V
	 o1QEIA1d+jRhzZRhraPR/wpDyxEiqHwmRYoO8xNhHjxRpY1EuVIlm2rTtWf2E/k/8F/EY
	 nc7HGGkQKz56SkajRtFK1zwniLflXzRBzGuLrzLw6Rlr1KbKfDNT5ojfNW7XaRDYM1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WknVe8fK;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90D1606A33E
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 05:55:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A90D1606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WknVe8fK
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8b77e464208so54725b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794981356; x=1795586156; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QV7/azGZskXYhWhh8bvjrBkzYwv/Uf2HoCpYkbr0EGk=;
        b=WknVe8fKi2zPpNBYRtbP1Qfwq+BSUMdWwyH29+Fqe3kCJour1GIIV69Qn1FI4oIWRU
         amoY5C/Y8fZtOc/POuCunwbMmwW2nnPfjNblk5JipLnbINMR5NK3sTjM7EkkPPaCC1ip
         sIBATU/3XG+LNczMlHMTUCIzE/maPwwuyjKm1aFwEqLMolUyJ0G1Ra/WVmqkC33vT8Wd
         hteWX0N4Q60lADZcCz2EBX5s0eti7ALbfyMN4E6SzOlWxZ3qK3DAcda2PPgFd+unCtjo
         4IgjqrA8vtz0dMMZ4/Odtq5Mguddq9ekorJDyqN6/dx7/pKK5jHwR/f76qsuAUdxIjbE
         EtGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981356; x=1795586156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QV7/azGZskXYhWhh8bvjrBkzYwv/Uf2HoCpYkbr0EGk=;
        b=RLkCg7+uhfgkNrNvYNyKiCIcg14viGmZhU/dR+TKMic5ze9KslF2J9N5/AoYJmtK/C
         cggU+em11Dfq5gFxgp9GclMC8GNULgpJmNyPP83MgoU7IhJNC/6PZgEIS0lhTWh1UjRB
         6iypoD8XULcwO3bVqdT8WfKWRL00+0TFuBnb9q4bAbVROl9YZp5m9o36gW/YPda5l4gL
         oGbA+SnjnmCZLQX47bxmDka/d/udVHm3gheegrtClzW4nqxXl05ol/FdXZy0nLqQWoyP
         sp97q8oOhxI8NjCpc1luKE82pKpi6NIoUBJUv0DdFHZ5hvSDmJge2H/ptbTFNFacOsZX
         Pmjg==
X-Forwarded-Encrypted: i=1; AL+hErEofaQ7KnVH4AzifZpq6ug0pgVW7K7FuGlGM86RWIHQrJuXE/Kb11ZTx2slZxBiy8FScFru9LUya4/aVQQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mUrDE2U3/TsK/rbx+eWcfCxRRIuQlER5Gdht3MVZG0k2GCVFU
	x+qKWkaz8OuX7MmlJOUxa39RSrO6QaiBgGN4BbgJebWkbO8B4a3qloVg
X-Gm-Gg: AYBFou0G+neovALhiwLyxsCIJOOd0j+Av9D3zHmEwwSh3OVWFvfa2ycXpwZ7gfVopix
	TN2a49ctTnzeh+M6+dkOSa04j4lO/xx3Qci88D//eko4BxZ0SO5F0F3TSIRx8BjKUdKBG7QuYEf
	Vv18NXUorSX5jCyngA/410sVx/Hl68FP/jzJWOsW0Ke3nTboywyWCV3TOrJux3mODnyM5CJsVp1
	vUzueU749GVU5AdkGem8Hif1q5/MU2Wra3CnhvHoVK0wZnbeBWugs5DfFu0CQPFtDR1sS2yJrRP
	1SBwRo5nBHxQLRnql8pH/n6JEcb1+3VeYTUhWNCa9qGCozPZufnfGYWr1GA8k+hG1Hy4d0v6ma3
	GIK8182E3CGXPTP8gJZXg9EUPMrej/VOGDaul6vlrnlTejlI9nhb0x6biET49J03TfQve9T3lfp
	d5CRt7sNVwO1UeJ1+O0WrJU2MVpjQc5ZvHgUENE3uymZK2hbcn/qsQJgoAGi9AXYGJVEGZwKytd
	7X5HtEG4vkXNtPc6Nwa7LYdLTDslghnmRaT/RuvdFmWsb7l7NWvW7nGnrghmbwF4QPyZEZ7PNCb
	S6PLQ1U4t8z4VVJTQhAHHZzri1N3MI0jv+EiH7YbvXP3IxVhrAsc8H08tOqQ4rIiTnpH8IT9qEg
	y9Inq0raDp2inDBADAkCI
X-Received: by 2002:a05:6a20:3815:b0:3f8:fc10:f77b with SMTP id adf61e73a8af0-3fe84102e03mr2033878637.0.1794981355696;
        Tue, 17 Nov 2026 21:55:55 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5ca5bf959sm569563b3a.20.2026.11.17.21.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:55:55 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Date: Wed, 18 Nov 2026 13:55:16 +0800
Subject: [PATCH v7 3/9] phy: rockchip-samsung-dcphy: Unwind power-on on PLL
 lock failure
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
Message-Id: <20261118-dcphy-rx-v1-v7-3-8de1adac3a74@gmail.com>
References: <20261118-dcphy-rx-v1-v7-0-8de1adac3a74@gmail.com>
In-Reply-To: <20261118-dcphy-rx-v1-v7-0-8de1adac3a74@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Jason Yang <jason98166@gmail.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794981338; l=1650;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=W4uqFjWfli07BWEGnXyu4qteuMVlaJHZHz3TMUadK50=;
 b=m7mXviKej2/0soFdmjYmH/XiRdXYaK1GmHksA4I0n03fIHctRzeTS9lVuu4DW3Gbc47NJvzGM
 7LSU94kNnpNDWdZ3aC5c+qp1M/C+VWAcJCPLR81h+FNtfxK0ZNnu2+8
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=

samsung_mipi_dphy_power_on() returns on a PLL lock timeout with PLL_EN
set and m_phy_rst still asserted, and the PHY core does not call
power_off after a failed power_on.

Today the APB reset at the start of the next power_on cleans this up.

A later change moves that reset to runtime resume, so the leftover
PLL_EN would stay set, and regmap_update_bits() would not even write
it again.

Unwind the power-on before returning the error.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/sashiko-outbox-174059@kernel.org/
Signed-off-by: Jason Yang <jason98166@gmail.com>
Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # RK3588 Tiger CSI1 2-lane IMX219, CSI0 2-lane OV5675+DSI
---
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
index 7382043e1f31..ce1bc62497c5 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
@@ -1343,8 +1343,11 @@ static int samsung_mipi_dphy_power_on(struct samsung_mipi_dcphy *samsung)
 	samsung_mipi_dphy_clk_lane_timing_init(samsung);
 	samsung_mipi_dphy_data_lane_timing_init(samsung);
 	ret = samsung_mipi_dcphy_pll_enable(samsung);
-	if (ret < 0)
+	if (ret < 0) {
+		samsung_mipi_dcphy_pll_disable(samsung);
+		reset_control_deassert(samsung->m_phy_rst);
 		return ret;
+	}
 
 	samsung_mipi_dphy_lane_enable(samsung);
 

-- 
2.43.0

