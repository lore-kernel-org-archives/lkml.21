Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795759982;
	b=ilF6Ii70PVtYeJFBnJBCe371ze7kH69TkjsDcwln1uJYGKvy+bds9VRfffCRZJKc7Y5+
	 HgQJRjkceVsxhYWxnGRnB/1d/jl02kUR6VsZoGfPWg8DkoVBbyXX04gkZV7cjG3RyFKNC
	 QXNTnB27Wdsh9R4v8uxVwDIszNHVO/pweoSaZA/nq7ycdM4JgGE/z6AoU/bNrZetf38Vn
	 4aeeimmPdawJUkweRtz2x4rgjmyv45Tu7F4zZ5nmqR+/vFv91dKR0dtAphytlkAFp5771
	 dtbw07tOAQn30vTeVl2hGeNU461/XkXyoS7U0u4juepFp4JmPocvPhY1oxYUAEns9EQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795759982;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+21aXSIhxglzzoXkMAiio1qQ/0kfiM8rQZc7UqiPAfs=;
	b=omG9uvYRerfyaIA7BH94TIip5JWhb/C61Et7rUwPnJ5a60d1EHfDsQsAZVw+k28115Cc
	 AZ2UfU+Scf4hcrzOlokbExkdjlvmLaLKnapGqyFhBa/VyymXVF66YPTn6wZBK6RNbpUTh
	 leLr73Z/4AAm5FJroJbBPEZuJXlLHzQ+2ovp2JAcLblRwmabk0OCPMNYhl1zmQYNHe4gA
	 /r6+rCZbyCzAB+l8WhEs0JiEqJ98CXbaGmEXkbjWp0tQabSnGR2Yhnzyaob+hFi7HQroc
	 I18MktyieayObqW/IkJJvUmtU3XoENr0FrUkwxq5bivEeUXTULidwK7oPDTdVDCk9aw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kcDKX9nc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EB0606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kcDKX9nc
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795759982;
	b=McGBfs6affbwUrHjaxi58by3ZjdERqe91Aef2zdFm0MTI8/KQk3z0Noqk5xBubsZ4ceh
	 14dOCZAvsXZPX64LbNtUYwGqNlokFJsg4XVCHxBuwVI7l2TWoKOpoSC3z4bi5XZJDMWVn
	 JLu/azeDISBIXXLEc8cpNf3sY6QT9vhRycLjzNrwcmubcetSDa3qDFvxOtmtvbyLCRfis
	 jTtpjO4sf+3RKN31xi3sjjqFBuCgRY9SZVplVpRo1wI8AXz2kgVQ4TBW4yAr21fQjup+q
	 giZbT8nhBbiKHnAVArF0SdYG/Ao1ggV5xgWu2toVLJQBoQxe1GE9s/m2xdKCb60ZPNg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795759982;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+21aXSIhxglzzoXkMAiio1qQ/0kfiM8rQZc7UqiPAfs=;
	b=wPUMBWzSqP0C7FXA+L51Zq0cDPARuujtlg6cfmyn+HFF1W/zzft34B+mx8+WyPj/VSr+
	 pi2r/2T+0krC96QNzfCU8gzark2zyTH7qIdG+Wc22lcwn/NHiPz/PdckbdzXAgk0YX735
	 vkXMZQR/z6e1eL9bM7blauWs6Sr09Rifq3hrZddTOo0sOn1VxNlDqCpFzOM5A4ANVrD2j
	 BrTdZ8ube4fIo8RdPf5xEQA1Yt7RpE/W2kK8mt0RTt/nG4e0Wz4kYjPyyknps2DVIWS1r
	 PfufjCA5axa4uFi2VdUn8FCWx/OrJoKmq6qZBnR2kASkN6XSAZHnw+meZhD9+QI646w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C12981F00899;
	Fri, 27 Nov 2026 06:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795759982;
	bh=+21aXSIhxglzzoXkMAiio1qQ/0kfiM8rQZc7UqiPAfs=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=kcDKX9ncepVtuwjyJoi4sudyslTA9ITO5I9WiO/GtdXvqxIWfeLx7NT453qKplkVI
	 ANxKPhvptBKrlXs8lgqwnVH2eD/GLo1VnRYbagL5ZSdjtVASMCzIUA8mZ5Alh15caP
	 nT/Gblx50ECVoFMBR25a5D4U11CoX5G3lOv9wXd0vi7ywiNQVKsYvKxFLIzRLkLuH4
	 dyLYt2Ofhq2/Dsn1a4txiru1yE+iBhBcc3mg/6zcAuwMLkiX1ah8prTzbfTS0IepIj
	 mDlrSnCFhA97sfVxOkshdStV/K4xaHSO9lmJ0GfvnQewhaLvrvEnzenth+FxBP4xx6
	 8tln9b5k3lGGQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3D5494B5A9;
	Fri, 27 Nov 2026 06:12:57 +0000 (UTC)
From: Hank Liou via B4 Relay <devnull+hank.liou.mediatek.com@kernel.org>
Date: Fri, 27 Nov 2026 14:12:56 +0800
Subject: [PATCH] phy: phy-mtk-dp: Suppress sysfs bind/unbind
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
Message-Id: <20261127-phy-mtk-dp-suppress-bind-v1-1-eb64c6e39240@mediatek.com>
X-B4-Tracking: v=1; b=H4sIAGcfCWsC/x2MQQqDMBAAvyJ7dqGJWsWvSA/GbOpSjCFrRQn5e
 0OPwzCTQCgyCYxVgkgnC+++gKorWNbZvwnZFgb90E+ldI9hvXE7PmgDyjeESCJo2FvslqFzfdN
 aRwZKXpTj67+eXjn/APeP2aZqAAAA
X-Change-ID: 20261127-phy-mtk-dp-suppress-bind-5c85f734dfeb
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>, CK Hu <ck.hu@mediatek.com>, 
 linux-phy@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Hank Liou <hank.liou@mediatek.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795759976; l=1859;
 i=hank.liou@mediatek.com; s=20261126; h=from:subject:message-id;
 bh=O3jXFQr6H1w8UsvUZJ9qBE1F3KBO3rzzg1q1UUmq4PE=;
 b=0Qq9O8JaNLT8C+2TcaCnF7eQXA+zB8jRSZrFJjKrHanyORj07ENpyhfdLhjuUmcbhxvvAtinQ
 qlksxz2dR4sDTTdl3HiVOxkzXmeqU+Q3aqgo1eD3lvZ57A98med4pIm
X-Developer-Key: i=hank.liou@mediatek.com; a=ed25519;
 pk=oQN2zU+HMrJQgqX4bhL5CVRrBmac4amZ/53yK20L/6M=
X-Endpoint-Received: by B4 Relay for hank.liou@mediatek.com/20261126 with
 auth_id=1646
X-Original-From: Hank Liou <hank.liou@mediatek.com>
Reply-To: hank.liou@mediatek.com
Content-Transfer-Encoding: 7bit

From: Hank Liou <hank.liou@mediatek.com>

mtk_dp_register_phy() registers the "mediatek-dp-phy" platform device
as a child of mtk_dp and caches the struct phy returned by
devm_phy_get() in mtk_dp->phy. The PHY driver still exposes the sysfs
unbind attribute, so root can unbind the child while mediatek-drm-dp
stays bound. devres then frees the struct phy, and the next
phy_configure(), phy_reset() or phy_init() call from mtk_dp uses freed
memory.

This was observed on a MT8188 Chromebook running a ChromeOS 6.1 kernel:
after unbinding the PHY device from sysfs, plugging in a DP monitor
panics in phy_reset() from the HPD IRQ thread.

The legacy PHY device is only created and destroyed by its parent, so
set suppress_bind_attrs to drop the bind/unbind attributes and let the
PHY go away only together with mtk_dp.

Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort driver")
Signed-off-by: Hank Liou <hank.liou@mediatek.com>
---
Other PHY drivers disable sysfs bind/unbind for the same reason, e.g. commit 6aeec986f1bc ("phy: samsung: disable bind/unbind platform driver feature"): their consumers have no way to be told that the PHY went away.
---
 drivers/phy/mediatek/phy-mtk-dp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/mediatek/phy-mtk-dp.c b/drivers/phy/mediatek/phy-mtk-dp.c
index 0048e1a8c6..924f08ed4d 100644
--- a/drivers/phy/mediatek/phy-mtk-dp.c
+++ b/drivers/phy/mediatek/phy-mtk-dp.c
@@ -828,6 +828,7 @@ static struct platform_driver mtk_dp_phy_driver = {
 	.driver = {
 		.name = "mediatek-dp-phy",
 		.of_match_table = mtk_dp_phy_of_match,
+		.suppress_bind_attrs = true,
 	},
 };
 module_platform_driver(mtk_dp_phy_driver);

---
base-commit: ebb7a8dc1e74c705daffe11c2faf38ec2628f838
change-id: 20261127-phy-mtk-dp-suppress-bind-5c85f734dfeb

Best regards,
-- 
Hank Liou <hank.liou@mediatek.com>


