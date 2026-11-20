Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795204567;
	b=CF4+XG6e5L0WQi8Rz3GHJPbzDJ/cHaCIV/F9qdaEs1iBPLHR/adP2+SuAgnYAndATnl2
	 saFm9mZ1Kxszp2KZQO3BB9kammhBbCHDt+qGTVgIcTviQOhfNqoaeXkNFQ99W/rTQ3F9c
	 s3SV6GPVvneSwyv+z/Fj3flYz266j/CwwIwoTk6SFGLYm5PzowIENwJKnzFXpubDW77l0
	 S8E/Fy4hZsItlYTlWPt14xlAuiB9apZyKKqCQsvNSKsDYGiQ67MBnnxc7bnEJl104dGSM
	 K1k5up+3uYgcvG69DBLDF4Hzn4NnDDvkC5SWwighkzEEaVGXqw5nTiSeQCZ7JfNti1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795204567;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=T1YY2FHyplvq/pdZvQrVAOibFr5kT7poHAqRS/xwvsw=;
	b=qHsRfqgziHa/KtGCbRsqOxdiI0NUjypXkRC5BPE5DCLbnSo83pBAjOiIRD67Pq914s2v
	 t0QoPkOhzr4AEjdLd6fYzrD7JsPl/jpj0II+Y9F/wspAfUwGyVKZsuMAED47+J5Bhyas9
	 /JBwHDfDE/oGMk+bxfqeJZn9ODtv6aw35eyMmvhhdpQ9qpWnFoN/R2i01s5nvg2gMi99A
	 naTNWRZpa9vl/89dqRhBMe4qxeQezACrjOlLNybGbpDcUH9ktmDYgDTShlHuBTAMEl4MZ
	 fgxbSBH52r+mrSHhxh4Mtfidhzwk4DYl+uRb0B5LcisXEnlwwMUtEA0qJTVFZmYIH3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JzYP8RSr;
	arc=none smtp.remote-ip=74.125.231.130
Received: from mail-oo2-f2.google.com (mail-oo2-f2.google.com [74.125.231.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E2B606A6FA
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:55:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5E2B606A6FA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JzYP8RSr
Received: by mail-oo2-f2.google.com with SMTP id 46e09a7af769-862a50e0f92so116255a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795204555; x=1795809355; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T1YY2FHyplvq/pdZvQrVAOibFr5kT7poHAqRS/xwvsw=;
        b=JzYP8RSr0RUVPIvBwjnLkqXT9trk1vW54gJTZQq/ltQXnUz562+0tZ2TAk1ZnbZMMj
         3UWLnWJtIco6+XBG8BR4Sf3WGHI4nsJfznMphFjkYnJE2ZCsOiMSByXhgS0rNwAoA8AL
         6ZEyKaS5M3c3ruiTAaE7Q5MQ+nIkBqYort/eV4dSKJ+D/hFhdw0tRt4GE9iey0E2uU9k
         +wrhSn8YPiHrt9JvnhlhKTctUlxYcVswQM4u6z52cx45Q4KyKkmgyDwDFRwzuoVjF7Hn
         ZAzRtBOIxCGdGb9ThVqsTqKjsV5j0fC0qpEGCmMO6EH0coT3Ei5i3mHAtDFx9btwOohg
         jLGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795204555; x=1795809355;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T1YY2FHyplvq/pdZvQrVAOibFr5kT7poHAqRS/xwvsw=;
        b=AbErp8TnlCKAdybHZHfoqS57idAjSgGNprcn2LYkmH12nkQzZIh35F4pU4nZS0Q43K
         qtDjkVZUDen73jNFBBVZWvCloRMVVsGqtGyspOGqUNEOPH8Gb/9VnMqpRKaFvYyDqe0R
         Fi1X4cMqMxWUGNXaUdvLyKMplxugke3DOX+ZHR0i4BWbmHJg8q6QzW6eTdUTucqwKvOu
         5I5JF04+kk8Pn59N/8FZOIRglGWL3YxXz+jUTs+MiNVkbVMVMwP8agEh0VFvBzdNmI27
         Ygt5gqzXgwcIdwHbZLYiCF5GZdUoR4fBZUM/DaEIuiyB+8WHRK0KiB8/lnXC9U1AOyxW
         ylyQ==
X-Forwarded-Encrypted: i=1; AL+hErHbUWHjr2TcRjlLoahctpPv8asws0cLjUE9OuELEn6nDAwzNolMnH5aInMN4Ip6+eL6tzsv23rBHuHEhHQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z98zQFBa0XL50bD2sKgoR/Aq7CUJY9evNbuuslCdx71J5x70yl7
	WdnsFeMyzaqUp+FtWg8grIKj0rIxrZ66stDs1S8/2F0A6k1HcM2o0YYs
X-Gm-Gg: AYBFou2JL8zctdbxN5YjiVR94NoPpeCnra6PeIGRTy9AAp+H+8qSH/lRw3Sup6DSxWd
	XQk/1XYwCDo2q1eIinktwWpc9qY2CwU1kzjHfFDjCkaNlFy4YIRI9oAAlktO6aYslb0gqft7/k+
	P68DZn6XrabrfDiiFgEnfyCsMDtcD4h7gyjXvh2E27JD2j5sV0IzS/naEF2M8h/9XFqf1Ovm4cd
	ZbVYGINDgRPxo6yNmPR5LDw6/9Wlq8IuYJsjw3nIFJBZV0Qg12z2e7VcYz3Vn9BvojnKDLhjqU0
	gFMXbA/LvHbh/7MvR29SIl5oeBnKMt8FGkO/ICl5LxOuIhPzgX9mf11LQuDw2ZSrjpqZnHdNCtW
	R2Arcx+bTb3SSM/MJh0UnXVX3wovt9dcSq55v8u4gv7mvI0zW4hMF9FkuTeuyrYd9r/8l3kNCHj
	n79Zn6ZqX6ROymobJ1NqAsDQyLDaBVhaK90k1ecJP2Rs9dSsWN3cHNJWJCJp9aGqkl5cYTxnSrK
	q5rPIhzn/abNawgnhyFHoVOPEvVEx58qJAv5gWXf98Tm8ryHgSkb/9zNpZFUDwfXSwLVHwEdIgp
	IMiROk+tGqAsyKpQFMyOtvFcuWWt/YmWoFhO6rdD66XX0qSvXdJMSfYqSymjVqubB0c8mpppr1n
	19qY3BcUmbFtZFo3cVzY=
X-Received: by 2002:a05:6830:2705:b0:863:588:fd47 with SMTP id 46e09a7af769-8631565526cmr4713565a34.16.1795204554951;
        Fri, 20 Nov 2026 11:55:54 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168dcf38sm2703953a34.9.2026.11.20.11.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:55:53 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Fri, 20 Nov 2026 13:55:42 -0600
Subject: [PATCH 8/8] media: mediatek: vcodec: Refuse a format change once
 buffers are allocated
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
Message-Id: <20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-8-877dea14c3d0@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795204536; l=1950;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=uxN8uWXPPsDNnitOTveJHbSyY9I0K+Jb1iUDHWdG5+A=;
 b=EgoxeLDbz0VfDWewlqSPzl6zYQWyndby+MOiqVsid5yzHe2cY8RvYuopyUvIg4MUWXFHgC1EY
 tUWmrjd4dQXCfC327gZfBpckWNpOajpETTR0BjM851h3zRyGb+5/mms
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
2.56.0

