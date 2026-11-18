Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795016112;
	b=zKncaLLN69m1hSmWKTrZ9+agn6MHRWc2VVOPCRS2A5TFT3UyCvJmU7N6fkDYT0X01s9c
	 SFTgP7I6qYdASORy2WS2kVIeZoTXOHEO3PkZMFDqp4A8Kej8ITXEBVyxex+rE1exrJgx1
	 cp+uZnTBuxV8liWaAiyrTfUm1dFXddjcK2OXcDSDXZsH8QSJVm9oX4R4OTdgcmF61HL+L
	 IoViSdnR5K136R2ou6CwE/Wl1fwtaHGno1cfW5QEIwvoz4jcPT8s2XrFr1wiNPcQmvLis
	 lc5wYGoFut7gpW4C1Onv/NCW6SFLFsQzEq5tuLz2SiJRG6vhdGa/Y0nFbHxAk5hfeaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016112;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=lNjdkZvjIUxDtp/K3Gl1QC3YaKGTYA0HwrzGFVxBplQ=;
	b=zVB3hwQ8L4HjuIu51JYF591KtP6WUkjxpbLXoKLnw1LE6ghLOFheptaQ+pOC9cMrgwg8
	 IU5X9CGJIZzzraXN0d+Md+WyiPaPlQrDzaHKj8HkZeEAdcSBgbr/cNf7bn9w7Org/NrV8
	 48hgxOkhylD+IA6Vcntrv1z53wcmnR8EbsQmlXd+GVBQfPcafsVyDy+tq7tXBzXV0nNv5
	 ojj3X5adSXB+pa4jhckQ72a5YomJHVMcMkFv5dtI9Ke8UVwPeCuwb2GPR0IV6Dwhrb1Tj
	 b2nl080QoFOYa7lp8/XWHb2R8p0NzCTTITIso8VPUrCqLNj5+rlQ2yGUSq6LOlOVP2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.25
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E59606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:35:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93E59606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.23])
	by APP-05 (Coremail) with SMTP id zQCowAB31bqdxf1qc3xpAQ--.6681S4;
	Wed, 18 Nov 2026 23:34:57 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Joey Lu <a0987203069@gmail.com>,
	Han Gao <gaohan@iscas.ac.cn>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Cc: David Airlie <airlied@gmail.com>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH v3 2/5] drm/verisilicon: fix DC8200 primary plane disable clearing FB_EN
Date: Wed, 18 Nov 2026 23:34:45 +0800
Message-ID: <20261118153448.375639-3-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261118153448.375639-1-zhengxingda@iscas.ac.cn>
References: <20261118153448.375639-1-zhengxingda@iscas.ac.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAB31bqdxf1qc3xpAQ--.6681S4
X-Coremail-Antispam: 1UD129KBjvJXoW7tw15uFWfGryxXrykZFW5KFg_yoW8GF15pr
	4ayFW8Kr4rJ3yUtFyUtrWvqayak3W7J34Igr47Cws0vrnxtw1Uuay8KF9rGFyDXrZ7G3yS
	gFsayF4ayr1xA3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPE14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
	ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I2
	62IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcV
	AFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG
	0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI
	1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
	CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0
	I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
	8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73
	UjIFyTuYvjfUOdgAUUUUU
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

From: Joey Lu <a0987203069@gmail.com>

vs_primary_plane_atomic_disable() calls regmap_set_bits() on
VSDC_FB_CONFIG_EX_FB_EN instead of regmap_clear_bits(), so disabling
the primary plane on DC8200-family hardware actually leaves the
framebuffer enable bit instead of clearing it.

Fixes: dbf21777caa8 ("drm: verisilicon: add a driver for Verisilicon display controllers")
Signed-off-by: Joey Lu <a0987203069@gmail.com>
[Icenowy: rebased and reworked the commit message]
Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 drivers/gpu/drm/verisilicon/vs_primary_plane.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/verisilicon/vs_primary_plane.c b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
index 95f4a06039e76..c12fe54096c33 100644
--- a/drivers/gpu/drm/verisilicon/vs_primary_plane.c
+++ b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
@@ -89,8 +89,8 @@ static void vs_primary_plane_atomic_disable(struct drm_plane *plane,
 	unsigned int output = vcrtc->id;
 	struct vs_dc *dc = vcrtc->dc;
 
-	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
-			VSDC_FB_CONFIG_EX_FB_EN);
+	regmap_clear_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
+			  VSDC_FB_CONFIG_EX_FB_EN);
 
 	vs_primary_plane_commit(dc, output);
 }
-- 
2.56.0

