Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795637786;
	b=YcyMfEVmapaOVMDP1fEBLtql3nm12j0TEU93rPvizIbZmmu6SOc9FQC6mjrAWlzqqYTX
	 KDSOqDRAdazrmWWV8hFNI3A8b86KD4MIKJ44q0POPPNEqryxbSHEu6I1NLfiix0HsMqDe
	 cHiCEWwnZ8f+wtAtESnZ18Itnhw890gXe3Q7iVL8SGOBvxy98eC1LyEEkb8fCRcCNcMMB
	 NH3lEJ5ZMxT+7WJVAJU8jJzxQjpv1w6EVlfJXSVM5jBvGukJEN6ZExbIWsh7pFge6SLgY
	 kvRSzBHBPQxjRTz06a3J7EUGPB8+fhT+Wc2owRnx8rP6XH1/kzcP0yflIcQKdziOVBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795637786;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=0Gf2EAUcJRVl7OuOkX2Dws1/ZTM9OuXnITDMSmBlcuo=;
	b=gXrOCFIOM7Mdhmnq7+d+cZE8uTwHwbeIX2059+uz1iona3GX8pq42TCZHpd4hrML/mAp
	 iExSRE8I82vD0uYM5ITuq0zmttylhzvWTj8P3Bgusxj3cpAMg4+9KdbdfWhL319JpZVIS
	 /SQHfFtJ2PWqJ9QGQkKRHRQaCdH0Dl8MhcFvqYPdxLX14MglmLKebg6yX7mKns+y1P2m+
	 RucTQrDcTXsh+a6DwwAof1B0pjdmmqIFpELjYlw6JL8JqH9h5+vYmqFQpCEbSKvudNr80
	 NP/SAYrB0XLwz3qLt8JwB+KEbQ356g0mLJklExZ19WjqYHCaXPvzCjAHgqYngCYlH9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j4k3tAT5;
	arc=none smtp.remote-ip=74.125.231.135
Received: from mail-oo2-f7.google.com (mail-oo2-f7.google.com [74.125.231.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F04A606A6A9
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 20:16:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F04A606A6A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j4k3tAT5
Received: by mail-oo2-f7.google.com with SMTP id 006d021491bc7-71abadc4460so1916252eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795637784; x=1796242584; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Gf2EAUcJRVl7OuOkX2Dws1/ZTM9OuXnITDMSmBlcuo=;
        b=j4k3tAT5dAXjGSz03eKpD38liuL+zlc7E0yRO2ftyKb37sTKoTpgmylqgz0too95Mx
         FXWIDtx67QHOR9ZMGnAk5URfhxPUgt1sC9Q7cG9dAKAJDmym8qM08b7eYsUyaOAIHKwx
         Z5TWdU6lqmS0L/GZzDMZBLF7i4h6kuq5E2leywsthFSs1oSKaVt6JKv7n0WSO/PhnbQm
         lI6RRlkI/j2QW8ZtdcZzKRp3YFMpCgNRsoNtfdmxqS8O9JEcWhg82BPbZxbTHe1hH5b4
         QqcWMEV/U7Fw2efUZ03YOhxZqdpNDht/YRhzSBlMwV8iuWIJ0KJgVY+H3C5x2UJZ77em
         NSXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795637784; x=1796242584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Gf2EAUcJRVl7OuOkX2Dws1/ZTM9OuXnITDMSmBlcuo=;
        b=B4lTB0GJ45JbSfHY6+cXwC12T+sOMRrk74ROBP/NMfv5RgfBHkNgfzoQVgYbl5Dy+c
         oTxkcXAd1wOBuq0B4oRBFd7bjQSf7Zvx+XuAnkSl3oyqWhROODKZmGGYHYlmV9JCC1ia
         kcsKOAUux51tiOUM4bpIvHRgt0/Bq486tJDntRMCbkfMU2kI73ruoNUvJgGN+pim2UT6
         tKjm9GIi5LhsYSUdeHWWQG9YQlJP/vlyYI8LEn7AkTg238ZuEotT68YphT9gELlBYttF
         8r2dbtJKgY2oess5uca55MxmB/A3CO8lLFZ6/9NNGq0KgEfg78ATZUO4Yn99U5Phg3FO
         KYGw==
X-Forwarded-Encrypted: i=1; AL+hErH/hy7xKg0QIghrPYV7ThGo1FraU18Db/cO7D07yjVDmNhmrzp1yJH5JP9yveSqbmeJTZlFSPKj/gb1mz8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PaAeP0oFCUUs+hrjLXXR8UyrOjUXBMKNXo1NbZa1Gtqnob4D2
	RxKe2g/JUB0YZoaBv6C9RqqnOo2XYLyMnb8xmUpB62QJw/cCtdthFXHw
X-Gm-Gg: AZFdTZcpQueAq1UxVbR+Z8JwgJwCwF5sdu/FmfrqBD69wlYpIlczZPaLG633g8bN1cr
	F06fascFYtn3uDJx1hG2ItibmLyVk8g6xEGNQlKybY01jOJfmDt25rE9XnODEwsfFkjRRYG4+Zr
	MdeZFffg7XULBsBbrLkuA83Up0wed0zebn9Ia/+t0RuPODJ6tpq0Bysw/Od8SnD7KZc9RmRZajD
	MD31JSQT0VFhPXUoItryhRPpMfWTfrNUSjRSfyhPk/nv8bN86zspn0trky4lQCNcfpp2dYBd8IR
	sQJcap6IagLZ+3DQLrIMSl9ywTGV2n98trtJ2O9MIPO40r5/Fo32OF8BWrBnDMPHg05ockscyJA
	Xv0ulgn46tIrZ6XMVLpn1m1cL75rbjv6Sqdz6wMq5Wx8C6OlPIuYCxGJiUDr4RUY1unOojz4cUa
	N5tfucV1gdK4DG7yxhf9pAB385vb7nj8dZ5voii0e/qdWt/DCY1ZBaWLgA87/N8dj/g5zaYS2Uh
	92ditqweutCTn3KWQvDHXEDzhjmoNaa3mvvE3WWYYfZDKjKpDsjuMO/7gHAD7w+kpcswi1+U/1T
	R+7gDzGr5qk3086e5zuJfXIr02Hrz/kDAic=
X-Received: by 2002:a05:6820:1387:b0:716:df3b:e940 with SMTP id 006d021491bc7-71b3944022emr18067391eaf.16.1795637784658;
        Wed, 25 Nov 2026 12:16:24 -0800 (PST)
Received: from [192.168.0.98] ([50.26.120.197])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380b6f82sm11341859eaf.10.2026.11.25.12.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:16:24 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Wed, 25 Nov 2026 14:16:11 -0600
Subject: [PATCH v2 8/9] media: mediatek: vcodec: Refuse a format change
 once buffers are allocated
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
Message-Id: <20261125-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v2-8-fdc047cf75a5@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795637766; l=1978;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=z9CNO4bCWGYjNQTDYVvQNuOaV1YRFSzVKYh+7SCdusA=;
 b=GzF6pMC0GCPOHve0CXuogF6oQG8hAnVLXT0K2N9Woit8cMr6jKke65a0sorZ6u3wiUe6HkT/F
 jNzOTZp9VN8A/BhNIpxCSQBMnSCT8Z7NjqdpvTXjWKfxIN/UV3Apuw0
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

VIDIOC_S_FMT on a queue whose buffers are allocated sets the result to
-EBUSY, then goes on to store the new format and returns 0, so the
client is told the change worked, and buffers allocated for the old
format are used with the new one.

Return -EBUSY there, as the checks intended, and log it at debug level,
since any client can trigger it. The CAPTURE check applies to the
stateless decoders too, which now also refuse S_FMT on a busy CAPTURE
queue, as vidioc-g-fmt.rst asks.

Fixes: 590577a4e525 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Decoder Driver")
Cc: stable@vger.kernel.org
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
index 1223738ece4e..71db692ed848 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
@@ -493,8 +493,8 @@ static int vidioc_vdec_s_fmt(struct file *file, void *priv,
 	if (!dec_pdata->uses_stateless_api &&
 	    f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE &&
 	    vb2_is_busy(&ctx->m2m_ctx->out_q_ctx.q)) {
-		mtk_v4l2_vdec_err(ctx, "out_q_ctx buffers already requested");
-		ret = -EBUSY;
+		mtk_v4l2_vdec_dbg(1, ctx, "out_q_ctx buffers already requested");
+		return -EBUSY;
 	}
 
 	/*
@@ -503,8 +503,8 @@ static int vidioc_vdec_s_fmt(struct file *file, void *priv,
 	 */
 	if ((f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) &&
 	    vb2_is_busy(&ctx->m2m_ctx->cap_q_ctx.q)) {
-		mtk_v4l2_vdec_err(ctx, "cap_q_ctx buffers already requested");
-		ret = -EBUSY;
+		mtk_v4l2_vdec_dbg(1, ctx, "cap_q_ctx buffers already requested");
+		return -EBUSY;
 	}
 
 	fmt = mtk_vdec_find_format(f, dec_pdata);

-- 
2.56.1

