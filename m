Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795117247;
	b=G1gH7GKJ9SIF7+BPrewZmWFlwq0+/K1sQY0ba2LQnZAhGkBKbNPpRr8L113tLUzeAxjD
	 1fXB5ShfOlc9aMEQVaota+sPSCWSj932u2trGYO4bWBPeMPwEWezNc2pX/YMAh5p0eyI3
	 +LFJhvn7SrZRMd96N6me8rb/Wr55XuXHV4SAywYH+r6TseNFr5tW/AyOLpSiNKks/ObsU
	 mkehaSzL8tt4r/Es6Ory4oXrZuWx4BxGy11E72R8Aaq/9ttg0y0lM8AM5Wo6nHmS1UVcW
	 6G64Q4cBdU2AjRhDYlry6CGCf2r6JJJ/E6YYTHl3uUZNbUUnJBXnvM79095iY9Kn29A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795117247;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=Sb9604ZqOKnL5jLlbCzKt/eW9EFcFKIgFhhBj61S3cc=;
	b=nIfCEBUXWWMVzKcnF/vYUCFzJz5TX3TAR1AvVA+zd7O9G7mJlLdr0cHrBcNZTRFmHdjy
	 m+rP2wdHDP5I6nFve2JI1NR32zw/pumjXHZ6oVOhEY4tsNRGuVksQNH5myaU+pDZw+d0Z
	 5G/cHxfghyLZu1RY+s5m711Oxx3bWhul4CU5Lt2I6b2qFj5XdqppUHZWlyKKL52oJvvn1
	 zaSm1nHSTDY9brs44VRYJrKAZYTC0eIKLro4hmwspdU14q8DGzLxi9gamc8eWqSzHhoQ8
	 KkG3D4njCv/W8nvLTCa7d+rjNabEr6c7SYa2nsMnMvtz6wjvAgQCBBJ+50OJ91Fksjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=eDbpZMnR;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F4E606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:40:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1F4E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=eDbpZMnR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795117245;
	bh=VLIkL6wE7wYf6uwe+nUboRMEv27Th4EuZ1ktfV7x+0A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eDbpZMnRARCAlScndnXjmT1YZ7+9lrqt4NvJUP6el++L5/Y68WoXn1vxtUHtJ/Cdn
	 /xxbgNVVmS7csES1plVHIPLttGaTLNYL2Sfd2IYRd/dBy/v4ljRe4/Aleb6FyL1yrN
	 PLKjMPT9fUSbZ832LL/IoaYvQeZ9x5PUJ3GKwDEbxfvkiDvlJI4ZOEFzQG5026bsFT
	 UT8Dl+dotOQdBZ8pmASeYHCZJm4FeGybj61gNY0a5aNfXB0Kh808ybgm2TECuBW+5G
	 75ltDvi2mOqvrPU41oQ3B7JOYrQWRuYsGneICjuTF/IcAa4AMh+nrjVlQCxW/ipPkc
	 jtcK/KVppmhyw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ECA5A17E091F;
	Thu, 19 Nov 2026 20:40:44 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id B094E48002B; Thu, 19 Nov 2026 20:40:44 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 19 Nov 2026 20:40:29 +0100
Subject: [PATCH v18 1/7] phy: rockchip: usbdp: Disable USB3 port during
 normal power-on
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
Message-Id: <20261119-b4-rockchip-usbdp-cleanup-part3-v18-1-fb325e336494@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1244;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=VLIkL6wE7wYf6uwe+nUboRMEv27Th4EuZ1ktfV7x+0A=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr/ULzw0MbRiyxs1SKri2Sq3RO/Zv355PsmU
 ekbWX0BcxVP2okCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq/1C8AAoJENju1/PI
 O/qaWjUP/iX5couLjvn/eYovoBNz/IaaFRooxvFWa3qLmPfhOdf18dOl8AXQKUa+BY85K+KbKnn
 4B8zXRGYgJqNSvEGcIoZWyZoFo2HD29z0VcBXbWucQhj4RZd7E9L6VPu2Gnsu1eAGo0i3B2r3hM
 /5CRrP98nygBWCZgfbl9jzw2EYp8k+dMRNwazA1XwrbaV42rm6VR3FuOmEyDa3Nk29k+qGlaqki
 X7pW2Ug9GErXu3fIRIAswCnOe3o/Rs33fxtz9pEuZXQxgcFkHp40Tcr4ORmqlgrUI18yh1a6p0L
 txCETF0fWhrrEWDABwoxeZaSx/bS/Eq2GAaNqYrd85y3W6wDwMar9JqejEiWylRk7ni+YwpzBYT
 CpRAixl8C4q5PVvrzdox4rHAugm9oHXU55FMj/vgMnj0XiMXpvl+tKnx8sQK4UoGkhGrPHwB81M
 xes/8KXOjA3JtnvIcGOKW+SSBeoAsJE2C8veZ3WXKjE9v3SYVMvHwQ3VitEORFizwcna838QCHd
 FwDOdwSSBNYFRkzc9cFwX5gtMeD8grZr4aUL1lEdnXtJf0lFSUkJPPjQqUQEcgvhiTOzNMHAaM0
 c8cmA9lpbIBCJeyD0q4WxdF9Pnenx7isUCT4cG4mCIHlDyT2ObzqAUd7U/e/lqZyyzdwW2tdCZX
 KT4KI27Hin85id321qJIzag==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

In the reset path, the USB3 port is disabled. This re-routes the clock
going from the PHY to the USB3 controller. This adds the same to the
normal power-on path, so that it behaves exactly the same (except that
the clocks routed to the PHY stay enabled in the reset path).

This hasn't been done so far, as it requires the recently introduced
PHY reset infrastructure to avoid the PHY PLL not locking during
startup.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 9c6d921b9191..d01a819bf794 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1051,6 +1051,9 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 	if (udphy->status == UDPHY_MODE_NONE) {
 		rk_udphy_run_reset_handler(udphy, true);
 
+		rk_udphy_u3_port_disable(udphy, true);
+		udelay(10);
+
 		ret = rk_udphy_setup(udphy);
 		if (ret) {
 			rk_udphy_run_reset_handler(udphy, false);

-- 
2.53.0

