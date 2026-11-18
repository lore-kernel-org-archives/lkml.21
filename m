Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795016114;
	b=m2C57f8nVbXeCXdJTFoP+x1x9zcZGef/naENVxabuf1Viy++oRVWvqX+bQkPUHgoePbx
	 DHFZwnmfncbu4wcaDhYQr9vivkdMq6eCGpDJlmVKklGuzIqcIgo6gRaigoWzBRcI7fFB+
	 SWUFt4Rx3+v87DDq7Trt9kF+GLFvc/v02v6noCpYDcFlN051jj69QhvQX2pyMRhv9ADm9
	 Jl4v0QPA9uyk2aQJ9NoC2CR45DvoG0y8x/S+d1VbfErtcdfDMSVn2kdD7GGXiwMtLApLe
	 nOMNGbhxJBX0o3hpzr81rujzFV4eO7QNBPy9MkSJBxcSGSNyUTAnP9XI7Q5IDOtNRgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016114;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=wVFoNVcLB/AOEQFV172bhqkpKnAVmAvqDytncRqz5o8=;
	b=IyNqiM4yLf5HeOJFGtownw8nkKKIN7xaDIFpqmyMgS3Untj/x1SHPljvG2qtWc0maG5p
	 y7vBbSyq+Xf9p59gRf5YJiVeLP2M6U6StgBQ9lagw6+Sp/R68A/N6zpBRJX1l/SDbrowq
	 dw7+pKjYAJ9f05ESpifiH4vm1duBvE17KEbnsJliSnDejXhso5jIf648e81yXLmSIz5cX
	 J5TKGcwlU/g0/3pgKVSio4XBNphV8TGy4kG1/9t/bAYKjmVm9xlvYfTHX1hoNDubskmYd
	 yfRs581KQh/Sx7nfqKZfJHbVG6Ee3hqHyw3b9wMl/E2j34pyqdEvsqSGnLqJXIxN1uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.25
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1BE606A33B
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:35:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B1BE606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.23])
	by APP-05 (Coremail) with SMTP id zQCowAB31bqdxf1qc3xpAQ--.6681S6;
	Wed, 18 Nov 2026 23:35:01 +0800 (CST)
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
Subject: [PATCH v3 4/5] drm/verisilicon: check old state CRTC in plane atomic_disable
Date: Wed, 18 Nov 2026 23:34:47 +0800
Message-ID: <20261118153448.375639-5-zhengxingda@iscas.ac.cn>
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
X-CM-TRANSID:zQCowAB31bqdxf1qc3xpAQ--.6681S6
X-Coremail-Antispam: 1UD129KBjvJXoWxXw1ktr45WFyUuw4UWF13XFb_yoW5GrW7pr
	4qyFyxKrs5tan5Xr9rJr4qqay3C3WfJa4Igrs3GwsIvrn8tw4UuF4rAry3ua1DJr9rWayf
	KFn2krs8Ar1IvF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUm214x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
	1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0D
	M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
	v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
	F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2
	IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
	CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF
	0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMI
	IF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVF
	xhVjvjDU0xZFpf9x0JUQFxUUUUUU=
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

As atomic_update hooks of both planes would utilize atomic_disable
functions to disable the plane when it's set to invisible (even when
technically enabled), the atomic_disable functions need to check whether
the plane is really enabled before.

Add such a check to prevent NULL dereference.

Fixes: dbf21777caa8 ("drm: verisilicon: add a driver for Verisilicon display controllers")
Fixes: 8c4ae2189125 ("drm: verisilicon: add support for cursor planes")
Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 drivers/gpu/drm/verisilicon/vs_cursor_plane.c  | 13 ++++++++++---
 drivers/gpu/drm/verisilicon/vs_primary_plane.c | 13 ++++++++++---
 2 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/verisilicon/vs_cursor_plane.c b/drivers/gpu/drm/verisilicon/vs_cursor_plane.c
index 1e1805eb88704..a58e4a47cf286 100644
--- a/drivers/gpu/drm/verisilicon/vs_cursor_plane.c
+++ b/drivers/gpu/drm/verisilicon/vs_cursor_plane.c
@@ -105,9 +105,16 @@ static void vs_cursor_plane_atomic_disable(struct drm_plane *plane,
 	struct drm_plane_state *state = drm_atomic_get_old_plane_state(atomic_state,
 								       plane);
 	struct drm_crtc *crtc = state->crtc;
-	struct vs_crtc *vcrtc = drm_crtc_to_vs_crtc(crtc);
-	unsigned int output = vcrtc->id;
-	struct vs_dc *dc = vcrtc->dc;
+	struct vs_crtc *vcrtc;
+	unsigned int output;
+	struct vs_dc *dc;
+
+	if (!crtc)
+		return;
+
+	vcrtc = drm_crtc_to_vs_crtc(crtc);
+	output = vcrtc->id;
+	dc = vcrtc->dc;
 
 	regmap_update_bits(dc->regs, VSDC_CURSOR_CONFIG(output),
 			   VSDC_CURSOR_CONFIG_FMT_MASK,
diff --git a/drivers/gpu/drm/verisilicon/vs_primary_plane.c b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
index 7add4669f5803..730dab6204e98 100644
--- a/drivers/gpu/drm/verisilicon/vs_primary_plane.c
+++ b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
@@ -66,9 +66,16 @@ static void vs_primary_plane_atomic_disable(struct drm_plane *plane,
 	struct drm_plane_state *state = drm_atomic_get_old_plane_state(atomic_state,
 								       plane);
 	struct drm_crtc *crtc = state->crtc;
-	struct vs_crtc *vcrtc = drm_crtc_to_vs_crtc(crtc);
-	unsigned int output = vcrtc->id;
-	struct vs_dc *dc = vcrtc->dc;
+	struct vs_crtc *vcrtc;
+	unsigned int output;
+	struct vs_dc *dc;
+
+	if (!crtc)
+		return;
+
+	vcrtc = drm_crtc_to_vs_crtc(crtc);
+	output = vcrtc->id;
+	dc = vcrtc->dc;
 
 	regmap_clear_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
 			  VSDC_FB_CONFIG_EX_FB_EN);
-- 
2.56.0

