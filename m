Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795637785;
	b=zUVeuOp3OzoaJvhGksHP6LMMjdlY7rCB0633Qf7g7C4tQKAJBRMw6xCiyiay9M77bgY/
	 gA34rRY1q5UXPtEjVQBF+iYSMSrmz/fjO1UKJC2TjjzIb5a4RNA354CWIy2HBra/buhke
	 83icbzYOg+Ie7Rv8FIHQmn+tJ0RGte4NWzQHvSpRr5FF8lVHUGAo/0RrMkjiPm1ixSVEY
	 Is+oIqLLK6+EtLcCIKjjfUO/bMWeSf8HbcIDkwKYnIaIVc1PdzaVBhx7Sue7ZruUzcVpq
	 JHyLFWrbf5SAiaFLtLzpxrRVHyn5O/8KVL2BgnF3NmVTIjLa4Ap9QAiKiyCd2KMdOJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795637785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=moswij1DxNlgtZ2psQp6vB5WbP0Zx8EDmr2Dk41oG4M=;
	b=uNk+3oenkSVavMdWmlqKjE5VeSJo9/DgDpJp4BPnNdPsPyVDljJL2iSbLDRl2BBMOGoe
	 0r35msmrCAM4x71ZR7Vvn7vpQjhgokFMBnphcrRQ+T9j85xUHJITDJX8euRce5N1uDSPq
	 Iy5lNJ7xbMSopSCopgdoKtzdWvfyvK+B6urFKWoEiSjVBwvpeq9WlnIAnH5YJ0UOedwbn
	 WRxZ22T86OpUOBlR5P8TVyZSsb2ibE8i/5cg/+Bui0a14WuvAFHK9hdV5USyMoKh52WZS
	 QEif/KIWzPboLqoavfv3XYWNoCvDnv2x+ie3zV1v+4jcRNylaTfZg51d/RKkmpRMBDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qi04bJaQ;
	arc=none smtp.remote-ip=74.125.231.137
Received: from mail-oo2-f9.google.com (mail-oo2-f9.google.com [74.125.231.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E6D60A2601
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 20:16:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27E6D60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qi04bJaQ
Received: by mail-oo2-f9.google.com with SMTP id 006d021491bc7-71adbc33a72so1842137eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795637783; x=1796242583; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=moswij1DxNlgtZ2psQp6vB5WbP0Zx8EDmr2Dk41oG4M=;
        b=Qi04bJaQ4HhiSJ//koZXkew6zDX/nHhlJInUxqfzQYe7eKa/6O8j71LniMHfnIzz6p
         M/UGrlWpRLDobK2L+3YOCH3Xxx7w36xy1nTSjgB/cWPAmYaXB1ntuZU7JH6oPEKWaYxv
         MrvH2+bnW0VfLTGfohB3OjgBEoL/sF0IfRcUrDpkCMILCwdkWUvmPu6TX9UDk2l9J2xm
         GKpWoHkF3U2r/5+iBIcbtcbbpO0NflYhrzN/KBrRypqfW15C3MmSF2R5eu3F5tehHTf4
         9C4y9RwBpu70nqwd03wpoT9Y+N+ZJJYlUNuiSjKHD4p9nbS0o1Cif4Cpe3kTcErFgR7z
         u0yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795637783; x=1796242583;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=moswij1DxNlgtZ2psQp6vB5WbP0Zx8EDmr2Dk41oG4M=;
        b=tWVSr+FYwz/z8b/truNStlLkjj9jW+RC82jjVu32/JrNa+lWRepDRMtJs7zaUR/970
         H3npZ9gg59aq9+7xT6e0/1VHiyp/dYEnGQ7CYTFGKbuKNwqtmLbSLzoika6hY51NN1Xn
         80XIoFwBdhExmChxc6cYpwF1esIywbkDxyMDsJJXMC6XoNHre5TkD7spkpS+xREgY47P
         emripadlQctIb5Ziee7pH1nsOwYHDP7IIxz20VH6QyQwdWxNYr5gKTR6Hbcgz9okY03t
         0lChmmP2UBCI/shoFAz6CcxgFbmcIAPEJy3s0wRes/2kihSkyExdbHcSmCI0B2kPGADe
         5oFw==
X-Forwarded-Encrypted: i=1; AL+hErGJrAIvd7UcQVDJ5S8TepPE8I6Wx/RFz6mccg9EGd9OCTDINCQLvrGxNLqi7nNAzwXn7ONkUB08XopR/nM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gX2Cr9B25WinDW+fJJ6cKwLK9KZhatjQHkyCK1YXVaGp6R+/0
	Lf98UKctHgl+2uTiYbFWak/iQm9dqLG8IIKI33wEZ5Inci1WrZvB0UI8
X-Gm-Gg: AZFdTZfSWOAfswUqR/tSDETwZMTpRVecetsx3glYJpBgdw5VCIoGczmVC1Fa3oWQifH
	KVQ5pH5QeJ8rrI15MuDuWq+NQhy0s9qfXl01tLWwiuQSDgxQKpFfNv+2RNH7YwKE/q9Q7Shtnc7
	VUjkD6sCTIUDC/3bujaZs8dD5H0EhSbVD+LUD6mx80NnN0YJ1XUJlGW14LbI9AWoJ+6Md2ECMh9
	nY4zEec3Y3AeS6FgKRoVSyyE5Pa73GYGWwoV7UAAkJ2EO8EszUsDBzjVHbTHXZdjd6TDd4PuSkD
	i9iz1R7Hb9ExSdLKj/ZxR0BIHv3L4HvMtilaawq/Jnef+ATrz0rmBjL4TX/co0BEIySDaF0MI+S
	oeGP5Hoqu6Xeq1QJgGM163a2hS5DHOoqY+H23F61sNBw1IHBbnue4aXgq8uHYMTaljy7NBkrVvB
	J02xpgeu4jgDWRVMPvQ73h3Wusxdiwi/+RQN4EPUpBT4Ais6422YnpzteE3LFkCJID5/CtUQqSU
	SQcxdnlVKj9n+EgmT5i3Ps1yW9S+dr5LTghyAcZcxMl5g3+/g+041LcJrXL83B7OvSsNzC0X75j
	K1Erx3+F9FB+E3eT5nnPpA9gDf7lLZZ4eAqXSKu+gnlR6zg5idSYvCH+
X-Received: by 2002:a05:6820:1c92:b0:71b:7929:cb54 with SMTP id 006d021491bc7-71b7929d44fmr3615961eaf.38.1795637783065;
        Wed, 25 Nov 2026 12:16:23 -0800 (PST)
Received: from [192.168.0.98] ([50.26.120.197])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380b6f82sm11341859eaf.10.2026.11.25.12.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:16:22 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Wed, 25 Nov 2026 14:16:10 -0600
Subject: [PATCH v2 7/9] media: mtk-mdp: Refuse a format change once buffers
 are allocated
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
Message-Id: <20261125-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v2-7-fdc047cf75a5@gmail.com>
References: <20261125-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v2-0-fdc047cf75a5@gmail.com>
In-Reply-To: <20261125-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v2-0-fdc047cf75a5@gmail.com>
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
 Ryan Brue <ryanbrue.dev@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795637766; l=1974;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=ToIzGemh2HZYfPM+0fU+WVM5fBqJcWgALuaETYVwNso=;
 b=YyKMx+idzrYsHi5C/jJHDCr8A4+FV3/lteY93PlNVBFkvn2Yc532M5WpbprdE0h37qx239ObY
 NbKcfOxO94bBh6twJeOGkYBw44Fa9nxQDmOu8P83mq+1flUeTlwmTUz
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

VIDIOC_S_FMT stores the new format in the frame before it checks whether
the queue is streaming, so a refused change still takes effect: a client
switching a streaming CAPTURE queue from NV12M to YUV420M gets -EBUSY,
and the next frame is set up for three planes in buffers that have two.
And the check is for streaming only, so a format set after
VIDIOC_REQBUFS can need more than the buffers already allocated.

Check first, and refuse once the queue has buffers, as vb2_is_busy()
does for other drivers, logging it at debug level since any client can
trigger it.

Fixes: c8eb2d7e8202 ("[media] media: Add Mediatek MDP Driver")
Cc: stable@vger.kernel.org
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
index e0627127430b..1be0f44fe1b2 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
@@ -698,6 +698,12 @@ static int mtk_mdp_m2m_s_fmt_mplane(struct file *file, void *fh,
 
 	mtk_mdp_dbg(2, "[%d] type:%d", ctx->id, f->type);
 
+	vq = v4l2_m2m_get_vq(ctx->m2m_ctx, f->type);
+	if (vb2_is_busy(vq)) {
+		dev_dbg(&ctx->mdp_dev->pdev->dev, "queue %d busy\n", f->type);
+		return -EBUSY;
+	}
+
 	frame = mtk_mdp_ctx_get_frame(ctx, f->type);
 	fmt = mtk_mdp_try_fmt_mplane(ctx, f);
 	if (!fmt) {
@@ -706,12 +712,6 @@ static int mtk_mdp_m2m_s_fmt_mplane(struct file *file, void *fh,
 	}
 	frame->fmt = fmt;
 
-	vq = v4l2_m2m_get_vq(ctx->m2m_ctx, f->type);
-	if (vb2_is_streaming(vq)) {
-		dev_info(&ctx->mdp_dev->pdev->dev, "queue %d busy", f->type);
-		return -EBUSY;
-	}
-
 	pix_mp = &f->fmt.pix_mp;
 	for (i = 0; i < frame->fmt->num_planes; i++) {
 		frame->payload[i] = pix_mp->plane_fmt[i].sizeimage;

-- 
2.56.1

