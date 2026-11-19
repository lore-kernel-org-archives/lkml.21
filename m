Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795117248;
	b=FEniimxo1EwUZeyDtbvnN44AUSWQs/gDonkUT+7YwqBzJzIhvposxp2tokd1B2Rmdy6w
	 LQ1Wmvd2VK2kUI8hAXkiklCghX3Oo6JpRnVPaED+hDKmhqVVBFS3+1l8m4cAuy5i4/1UA
	 a+q2A98PIqzQQaE8+VqjSyEPKfWu0s02iyrBls3V29DamTNRx0oPqw36F0ONuFFXRwt/1
	 3TnUDPwI1/mcyxjDlw+8L4D1nudAm/ODTmqUg5f1vJ7XDH2g6SwXPXkBzrTQWuyYnTa7e
	 o7SXOAdbuZS0O02hfGObnhMsw9kN7zXY+rLcvGEU7+J2wOwADl4Xt6CIeSY4r4HO9ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795117248;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=ALZFKbs138rL4X7hGmqZ+xvl7ond3UdYP0thrAs8QzM=;
	b=F8B5svzMB3ubnsqxNRramV1cqgkt2gTzl1nxmhjtF69tmRakJK3XXXv7CUWa3w5kE4Gt
	 B1mNPwd2GxlqWFsYPgjdO7rAO8aaNiL6tH64xbMfxJ1f8kXD/6BcGtoK66k//eJDaejyj
	 dJ/d2r8G7ryS9CtPxzyxZkF3akvi0lQ+y9wbIcRc8Rg9Hxn5uDduEXC9dylP/5QHKtGkD
	 p6BrIs3/8fAPKfpSBs9AFfAOnwSE291Rekf5kOyHMqBiaYM2AQLJVSFKshf16D5c49T4v
	 QK1GzWdVaYs9quZkR1B/0qpA5PxgLoVa3f520BJlthPbnuS/MmjMCqqMy+xu8q3365Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=MG4vbkgS;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2065606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:40:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2065606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=MG4vbkgS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795117245;
	bh=Y0ahJFIOGX3bRryRmmv/cq+7XRNRRYPyaAzmDErQaZo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MG4vbkgSWkmTyRlzPfpCkO8QFEaFJCL8/aGiHoZ2uVZZ5P7FsEAM5ihARYZrL22la
	 sTgIqThwAYR+RXsUu5T+ty8iPLeihFXDxl2+bQR9wNZDnM9PztnOrn+gTbjcZMjhxs
	 8vITy9/viVRuYwamDsAsfyip7Hb5qQBWsTYNVaSUa+E16OPgWaCy/0CDu/bvinEZH8
	 gX9ggPTrC6pb+Y8XOfJh0E9KDfrzYEXCs4Ibsf0dv6f+5s2dUJTiiHxp0oKTSG779h
	 RVSs2IAYYcOIJmbSijl8Hn7oZym8ZMTt+PTuTZ+3ihf30YFAY7S6AnpKcsMzLSXtBA
	 9PI45RkesHcYw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EDE5417E09BC;
	Thu, 19 Nov 2026 20:40:44 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id B1F1E480030; Thu, 19 Nov 2026 20:40:44 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 19 Nov 2026 20:40:30 +0100
Subject: [PATCH v18 2/7] phy: rockchip: usbdp: Drop -EPROBE_DEFER hack
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
Message-Id: <20261119-b4-rockchip-usbdp-cleanup-part3-v18-2-fb325e336494@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1574;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=Y0ahJFIOGX3bRryRmmv/cq+7XRNRRYPyaAzmDErQaZo=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr/ULzWcVBRSGHMxKdXwUnhKXpCkIPxJP3Bw
 2zgj7+qxiVgyYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq/1C8AAoJENju1/PI
 O/qaSPcP/1U5PjJHwkxPPfdbAWWp7CDdlJKRyT1dl/RfTmagjnZq55tAczE6PrikpjqitiD4rKD
 69RNfSKcMXHF6xIdNEtPuUd6mwoYBll1fkjGTKtu99RqdvrTFgfciaTDsGuzd6TYNbioRxIlVW3
 TbBElBQUF7Gpx/qNwD2N0DZB/ZLz2yqkzijMxQWGcuAGIZqdJG3KzlWBW7DiDiv2nmRJDYreVAO
 zb2PbNtY+uVx2aqOTqgfGmKBPRMNq+RIWZEtMetzQof2c6cJeO56hC+EaAhORrfZYUDN5bP1Uuq
 2QwN0sCDTPc76OtUEQ8kBKvrJndKR9xkNR6gJKVPDTdUhACcqZCJ8sYETAUhALE9CpVhZlBxROg
 VTtu5/fSSxdG4K/A/GC9ZuD2kTFfYvSuoSxbAOa8CziZd5HesdoRLuB4CBtkRTiFx6oKwaQW9ZD
 jpUdm7rbdowJVMoDEaa4ZPDmT/xOLb1CYE+GKKi6+i1xWi57Exh62wMe0g97oROnytjPe6pAhGI
 SzPWAj1j5zJwI+Y1KkuxImEHP/rVarY3Ce6C3kFM0KuuhQ2bKdkt4qSzyxgzQWjEVq9veQ5nVy/
 243xGKKy5MmmNq7vvejljT+V/3P8T7rC5azANGk6ZXE3ZLOOxZnJIHpFOo94dK62I1CF6UWlrHx
 D6dwgiQirb5jDSjGojg4wMw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

The hack to return -EPROBE_DEFER when the lcpll lock timeouts is no
longer needed. The driver now does a reset during its PHY init, which
avoids the problem.

Since rk_udphy_status_check() is called after the probe, it should not
return -EPROBE_DEFER.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index d01a819bf794..025c8d52d72c 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -754,17 +754,7 @@ static int rk_udphy_status_check(struct rk_udphy *udphy)
 					       (val & CMN_ANA_LCPLL_LOCK_DONE), 200, 100000);
 		if (ret) {
 			dev_err(udphy->dev, "cmn ana lcpll lock timeout\n");
-			/*
-			 * If earlier software (U-Boot) enabled USB once already
-			 * the PLL may have problems locking on the first try.
-			 * It will be successful on the second try, so for the
-			 * time being a -EPROBE_DEFER will solve the issue.
-			 *
-			 * This requires further investigation to understand the
-			 * root cause, especially considering that the driver is
-			 * asserting all reset lines at probe time.
-			 */
-			return -EPROBE_DEFER;
+			return ret;
 		}
 
 		if (!udphy->flip) {

-- 
2.53.0

