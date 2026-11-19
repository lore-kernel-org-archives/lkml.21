Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795117249;
	b=cHGgGjF0bHN1o/fmTLdvoRW9jgQ2sB/MWfWl2v2piJdKG4ejGO+PIV+u2Jz++pLCt5Rz
	 TZ4twPnDeT3UNx8yLdIo+NrZzWmHMvfqWiZm2VuO3YVfnu4M8I2y+db4b/9Ip0/x1aNLr
	 o4xhwOemlXJfYkfz2WCP2hHwYZ+yott6uHbSUQ0eZCHc81jM8jk5PHYHxha5gI7+wYwqi
	 BsfhQiJBzuTMETmB7ynSMjXAPEW7Nx3CfRFqIFhMFpQjI/CslTN5sQf83oHffNu6z8Eqj
	 jp/+q1eWGwDzs6s+IGjDf3abPR+TuwjAcBDpc1wsENin4eL5PvRjEfV+OfEIP3LEBCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795117249;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=7kTrMFu1cYkoIn1xnEU6VU4HwJdg6h66WXrpMlgK15U=;
	b=5nE3FONUApTt76sd4YGTLmgmvpD39722wO97VoTDdJRrvRHzvbL8MJyM77+xa9DfVuYD
	 +Ed6IYSQV38uwDh1RsBQwqjsbKQm8KjIRr8Xa7t4SN0RnCYLXXMemHvFfrNGe/Jk7GXIb
	 nSdUJILlXymVcdhZ3HwjOBYwiIVQPIMppaZqASlcBHBeLn+o8wGBTcOKx5WGltgbSE7AY
	 EdWcyDKRib3aHoRXpNg1cIAnUW+H7HG4x4cxeEAmI+WlSSFd03pZSdFidUSAxvqkHv+9R
	 aTpHKPEmhYJ9SvInbTGEEBaFpn8xQR9PzVVo0LS4Bjh9LQdFSX90LrxF3bYP8Lyyj4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=MzkMG2Yg;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2F460A2616
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:40:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF2F460A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=MzkMG2Yg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795117245;
	bh=ZJJnGyy7bCzUp+dwilrqINl/+jw9ECyHmmQLI6RNOt8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MzkMG2Ygq6B+U9U7iYmHk/hzyD9oJWweTvQsm27/qzT+a5R3kPpmF/j/05Z6g/Prj
	 qEAyJHQwsXtOfz2d3qQ7BgXpLf4RyAKd544JmZTw9Tw92Ug0qn0WKnks1nRzYchBPO
	 Lfr9s+Hw0F8BWHBGKMigQkHipr+xlH/HLCJQeCRpJwoyKnI9G/QgKD806H0smbQ8NM
	 7LU1qI73JK5TTkbiM6+0z9YWqRR+7fOJgkTE70Df/+zgLh00AP6VncMUH21TtX0V0o
	 YQQJcbAKweu5ovvm9R1/CYff7851zjblBbIbiOLoeVvzi3aYn8iLcPg+NRfGbYnr4I
	 evHYOVOq/6hTw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4597017E0DE8;
	Thu, 19 Nov 2026 20:40:45 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id B7768480038; Thu, 19 Nov 2026 20:40:44 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 19 Nov 2026 20:40:33 +0100
Subject: [PATCH v18 5/7] phy: rockchip: usbdp: Re-init PHY on mux change
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
Message-Id: <20261119-b4-rockchip-usbdp-cleanup-part3-v18-5-fb325e336494@collabora.com>
References: <20261119-b4-rockchip-usbdp-cleanup-part3-v18-0-fb325e336494@collabora.com>
In-Reply-To: <20261119-b4-rockchip-usbdp-cleanup-part3-v18-0-fb325e336494@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Zhang Yubing <yubing.zhang@rock-chips.com>, 
 Frank Wang <frank.wang@rock-chips.com>
Cc: Igor Paunovic <royalnet026@gmail.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Alexey Charkov <alchark@flipper.net>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1196;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=ZJJnGyy7bCzUp+dwilrqINl/+jw9ECyHmmQLI6RNOt8=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr/ULzKaChPEYt/9fxdAQdVsH1fqc72zg+Om
 txAR5G+ejrp/4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq/1C8AAoJENju1/PI
 O/qa+x4P/29rFOaQrzXajByPbHGRG/Td37cmPgas647t0zaeDsQoxYpKNS7T934aOndPmRuQbZm
 ReQcXxLrqO2oMbWq5B6TbmqbufOeC8Stsh2m5x1YImlP86lZhTQglKsNPf4adllV43BpBeVue1d
 4c4Ie9KSKVKQzicPduCgk3Zw19PuZc7oiByKRtK/GfnD6Tv4Ruzj0VC0M0oywRtGwjUgn5Ygx22
 Ugwcde2vxyLMEophltQOic4a0sH+NPbFhUiilPKILDomJvZvy0OnqkFoHBHwLdbJQFC2ORo0a8x
 l3rMOO5HaygBz9uixQycM30ukajziol18F74QJVZQw6KJhPJRQLuH8GUz00p9q/1HsNBri2i3w9
 iufBdM4j2ke+J0Bhqwl13+h744cLC23ShumhdBHjM9bPg+9S+Zz/pWcfT1ezt3+8Rf5NReOMlKy
 9FEyA8s7L/12VvTDD09Llud3tSeSUhvspb8j9ZDuxiGTc/6+risDStULvRYVuJkWYtaKr/60eXs
 l2Wz7vvT/8CQjVP/bFRKrH/dKj1jkZvcyyLV9tEp+pORdT397h/NXZ9RJfLRk7VlSzKxtAXPp+g
 94xjV2xZjGKs80tdSCOQU6izx301BQliSrYofFW1oP2Cq6DptyL8eh9y56XbWfs7iv2R1ifyCYy
 uE9fPD5kQBqaRtXqsJPg0TA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Ensure that the right part of the PHY are powered up when the
mode changes. This ensures the PHY is re-initialized in the
following two scenarios, which are currently broken:

 - cable orientation changes without DP being involved
 - switching from DP-only into a mode with USB support

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 140bec887a5e..e4bbcb4edeae 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1438,7 +1438,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 
 	rk_udphy_set_typec_state(udphy, state->mode);
 
-	return 0;
+	return rk_udphy_update_power_state(udphy);
 }
 
 static void rk_udphy_typec_mux_unregister(void *data)

-- 
2.53.0

