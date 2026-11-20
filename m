Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795204561;
	b=BEZWrR1UPufubsTn/C0iHWnD5YttKC+IIgFZ/TWnrEBBJquDYgjouJnDI44vNK+WhKTt
	 4tvsKJrQa06B+HrjK8gsu2A0v6Ryd8f1WTW4PpOVkoAVzFIams7KLX0vioZTIguya93H0
	 aApHGxeOWLhTZo+nkbg9QnbRWBmLIr8PEqqGUREtagKE1gJDfH2uYkGVMlqdWYDHIQM/3
	 BHS0LosmvzrZpi+JEmU54LLh1Kg0RdqvQNCs4uXBpZLbfvyMKgMjNPKYK1KM53lVh+8My
	 2AzbpJ4WmvQSZaRRPabfPH1T46NH9CVYz9BWL8KeM9+4b4R9Rboqxui16yV6GTmjlNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795204561;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=EOjCMewlxD7RB8eWSeGbzOtyaQZdrsyJsL/ch7K8e+A=;
	b=j3hyzQQ2FBsNyLvXTuZHu+C3ztk+bKG4erRdgJnvzDzed6ikknU2ewiL4mcTqD4UuW6f
	 IXtZ3VuY+V1ENPqKHE6jEbRdd6rBRXnhWpS3xsqibqIMbhEJIheChY8Uuw8Xf8+SOn9xb
	 drN8xzUoD/bEcowcCx+bGjQRJSj/uUJZRazRUoojutqPee5q3ldrZgsFnCAfU78FVVl3Z
	 7WTzTslB0dXP6zkFuZNA9g4PTmet7R6bP0QbqZ8jz1/trlTP32nB1PSb8GexszVQVWoN+
	 wUnNZgLQT96XwixDGJkcwnW9ZjFqrQHXUb+XZmL/YCLLRATAIk7eYF2eHRAAQawGggw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AtvFPruX;
	arc=none smtp.remote-ip=209.85.210.65
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com [209.85.210.65])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150D3606A335
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:55:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 150D3606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AtvFPruX
Received: by mail-ot1-f65.google.com with SMTP id 46e09a7af769-86288992de5so1002814a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795204550; x=1795809350; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EOjCMewlxD7RB8eWSeGbzOtyaQZdrsyJsL/ch7K8e+A=;
        b=AtvFPruXXuxMGYkwYLAt5Xua8UgA/nRg9cWhI2acqjpqgz8Jt2bt3MmFRCTEoPFRyQ
         kZyucYEThs9blI+DVD/yCxRUkGOSyR6PLYjLI27A4fSzWE3Oki+IzZioANaDuhvAkLbg
         8gGMzFuUjduVyeFFndSUm+NvGJMfeomyhyy0/PrVNYNqvyurdmyalU/wipkU4WZkiovh
         xtIgj/psnQ0vmTSMK34/4Y88jxeS2lsCJm974qxxtumgKGFs8x3PrHXtoF5h9UoOJV/d
         Y2SCmT+CnHKaAI/zSif+o/QRkfeIG96kKjeGUP2zVx21msU1JG7mvTjUc7lESNWaKRov
         tvXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795204550; x=1795809350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EOjCMewlxD7RB8eWSeGbzOtyaQZdrsyJsL/ch7K8e+A=;
        b=YNyNrgnykHyhSGymH46XZXg2Oqx7n0DLVdpXJMZ3vGbbuVlggzOx0Hh8Kzu6A789+g
         G4KcRdBHNjmdhrM73QbpvX8m+kwyi7RgMYSKPaHowHwDz6dyidonH7XPhdAkwC2oJiYH
         TrzSm2H7C8YE4+6UEyVjkEiM8en7ZkKjq81cBTF18Ll2GztOXTv0hnp5QuJwqQ15mH94
         qTHBpEBUf1SKONcTHBzOBDC3NfCXd4BZT57HLFPDwM3mX87ZOTqmD0k6BL3cnmpY+gID
         Smrlw2+OI7go+OoEj/DzV5tJrN7icwf9XT7cj9+zKPDKI8B0wOKYaRIUZ3MuiUA4ufko
         LlnQ==
X-Forwarded-Encrypted: i=1; AL+hErGK19tjoxz1jkn5l+6Vv6UWNY/K9a01OvkcdfgUfw+kjfGFTOk9fYHLMrOUAhpdGOt+ZKR25MxskBtEbMc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8d8TUzpdne52aJfwI7peS7bUt/6YfKviTkiPrS13XWAUeDD87L
	2JmfOJBLDoT2SPDCVfCAM/Y59HZE8ocCt3sRFyNt4qudhVVHqQ3dx6BB
X-Gm-Gg: AYBFou1H8lagUOxQCJcv8cTCEDENC6c8URTByGUM9vVdCz/KVCBYc2od4GGjAAvJi4i
	KQiiS5UV8qapox/TCaz4Za2ipTX+HqUfx+w8FQ9ta8LU6m1gF7QMATktBQRNZWIou2ey4KUdmaa
	rHckoV/UPemwkKX9JSM14PVqfLpFBfvYiG0UET6Ba7LipSpaBMywarps8UmAr95dqDpHtpdjAs4
	ELddCUDrViB1Okk8hF/Xgga0XUYUdsaFXdI0WDdRAfPg422FysfoXdoYYu0ERpCjn339LfWCWrf
	5h8aYdCBKAQ/lqmK/4Okfj7D3OEO27UCHBnKqGiD5fXeNLeGs83dz5hl5QXRbVd1Qv1OFfVl3mF
	SxUJhn54+e+oR6UjLt1JeuyFYJMKMhQAgz8GhahiFBv00jFBxWKdel7oyQJrdo7Tv0hHMuRJl1s
	q38/1dKsIGvy5yF4186FseRM9Jj3nA3zPjE2dZnzis4WQ2H0BH3jhnHdBPepz152ljloH//V+hB
	tuQUDGEUChi6gaECNnv/cslyTD/KTyZBBFtYk2agICIqfMiWtOe+geFXbDu3OavB7xg/PeSJF0t
	xPUham9E3YE5Ck6zu0hK47YOLaWtAEwiJPkeqcjhFiZMw16UNqnMqEUl5I5iHwQCVoNuHArbWEe
	OuNjQIJA9UQ2z7LI2zIl4VO6q+7tK9+yIDJba0STm
X-Received: by 2002:a05:6830:2543:b0:847:b333:229f with SMTP id 46e09a7af769-86309211342mr4517824a34.19.1795204550100;
        Fri, 20 Nov 2026 11:55:50 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168dcf38sm2703953a34.9.2026.11.20.11.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:55:48 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Fri, 20 Nov 2026 13:55:40 -0600
Subject: [PATCH 6/8] media: mtk-mdp: Check buffer plane sizes against the
 format
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
Message-Id: <20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-6-877dea14c3d0@gmail.com>
References: <20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-0-877dea14c3d0@gmail.com>
In-Reply-To: <20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-0-877dea14c3d0@gmail.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
 Houlong Wei <houlong.wei@mediatek.com>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Eizan Miyamoto <eizan@chromium.org>, 
 Francois Buergisser <fbuergisser@chromium.org>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Youngjoon Lee <getfeus@gmail.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795204536; l=1915;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=IrqYTU3e5VqOahizLwVLW6h+Y6jhsQAYsNliTerO8J0=;
 b=qQWo0793DmfQdxc0mRZsUo2XgpH9ekHbX/QzCsnhkM4TZTvhzCPSNce9IlDNfTxS2wUYX/mtP
 oK4WhQpcAJBAc49I2moR4k4xzsWXEfrHUNZkSfjcbjG589F3v1ZY2cE
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

queue_setup() ignores the number of planes and their sizes that come with
VIDIOC_CREATE_BUFS and always answers with the current format, so a
client can allocate buffers too small for it, which v4l2-compliance
reports:

  fail: v4l2-test-buffers.cpp(872): q.create_bufs(node, 1, &fmt) != EINVAL

Refuse a request with a different number of planes or a plane smaller
than the format needs, as vb2 expects of queue_setup(), and check each
buffer's planes in buf_prepare() as well.

Fixes: c8eb2d7e8202 ("[media] media: Add Mediatek MDP Driver")
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
index a40bcf61b7ca..e0627127430b 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
@@ -546,6 +546,15 @@ static int mtk_mdp_m2m_queue_setup(struct vb2_queue *vq,
 	int i;
 
 	frame = mtk_mdp_ctx_get_frame(ctx, vq->type);
+	if (*num_planes) {
+		if (*num_planes != frame->fmt->num_planes)
+			return -EINVAL;
+		for (i = 0; i < frame->fmt->num_planes; i++)
+			if (sizes[i] < frame->payload[i])
+				return -EINVAL;
+		return 0;
+	}
+
 	*num_planes = frame->fmt->num_planes;
 	for (i = 0; i < frame->fmt->num_planes; i++)
 		sizes[i] = frame->payload[i];
@@ -563,6 +572,10 @@ static int mtk_mdp_m2m_buf_prepare(struct vb2_buffer *vb)
 
 	frame = mtk_mdp_ctx_get_frame(ctx, vb->vb2_queue->type);
 
+	for (i = 0; i < frame->fmt->num_planes; i++)
+		if (vb2_plane_size(vb, i) < frame->payload[i])
+			return -EINVAL;
+
 	if (!V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type)) {
 		for (i = 0; i < frame->fmt->num_planes; i++)
 			vb2_set_plane_payload(vb, i, frame->payload[i]);

-- 
2.56.0

