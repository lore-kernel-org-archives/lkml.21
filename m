Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604910;
	b=43gfF/MyGjgwcATQrrhOCw7WsNfaVMaTekNRPBMdxY4e5+7iIPQmtYE5nt+Cu50o266O
	 9PaABgwmq+sU9vHf38OWKQLeCmDfaGpqq5cI9v/rcbmAVKH97Hosol7J+NNz/Y99Smlcl
	 FDflDbjHMS9NZ+TTn6GhC8KrK4yfhkyk5VvwapqRWzBPCfKSqxM3EjXcxm/sL8aoDezjC
	 3cuAsSbE6lXFHG9XOfy9daVC684aFHTwc7BPc5Iwcz2swqQ/8YPd3FIRAnohA8e/jsUha
	 SqcuqO0TarO+madEmYLtcOfaeMKueVPWKH34aU6b6CDREGTbtwaRpZek2RueJTygrvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604910;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=clKaolZwkMSTHm0nujES/qrJKyQ4xfGXj1/wJaiLO4U=;
	b=qYyKTYVfXb3h4a/fXK80DarHPjGwu8e/eVyxXhrlBj6uA9fUv+mD9D+Z5WJttns88GUO
	 qZvPmOyE3z1JwmzLNdgRGs+PKNkxF1djHqc8YHs/itwtSk3PFRoXwSjxUHwqGcqkGy90D
	 XN06QZKfRWJcmY5SwHW9tJjl5IihtJp9FqZY7aPvjce0gLBUf49nyt/VpSQejoVr9UOCJ
	 ovF/AyD4ncHDv3vI4Xq976tQ8Ky8wbKVBU5ySRKkRNoxB38W8dOlBeLPfqk3/wXY6TeQ/
	 GBkIlK8yrsWMtluTFJjxlpF4uUhCleFnu5LYc6soqsrftJ3EUT3A84aHaeJvLwMmkeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IBou19Mo;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4099A606A6AF
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:08:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4099A606A6AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IBou19Mo
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b8815693e2so6455157a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604909; x=1796209709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=clKaolZwkMSTHm0nujES/qrJKyQ4xfGXj1/wJaiLO4U=;
        b=IBou19MoNJhHBzcnjeTmjt1iLOWwMh1OzaZrEsNG8sh6DYvjqkPE6gI3wxRGYuXI89
         mMyQFjqi08s+pf9gAua3Jb57rHechtgGBaMTT5tn0sEMry+5g+++mFOiyFm4ooO9pV7h
         MvaB975h6cxsJnYfRr4KWWWtCQKOcKnE2u0ZeKqN2kbZvqBr1LPPb9YB5UblHfMsqaQD
         pJqD8g/CIoaNIO86aSuTew8fZsfclVIsEIlyGnMDy5lDSyg4Z/6wNCn0ZhrDqesG/vvZ
         e0UzfSQXVvnTQsoopE6SHb55DYTQe+uqibhtOAycIN0IWP5gzdMaEznY8z0qkFr5zzXQ
         Eq2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604909; x=1796209709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=clKaolZwkMSTHm0nujES/qrJKyQ4xfGXj1/wJaiLO4U=;
        b=g3dbsz3r6TSvq+ua+rKSRywsYWL2KryfOnLVGulgUiP6AotaqooBT9Wnz4ROlXlr77
         Tp1YSPvIgZyy3kztswEhunXll3aDJbSXtbC30bLVlJEcmKgMlqXHGkiNG+6Wtej/XWer
         lWzczpq9B1ALGd5PUalbaGK+jYGk8Y/tGEz42Q5i7tkUSAmHalUVSH4ioBKUTjTw/4CW
         X1ew7O8S0GvYKKYMDaofL/nTKCRVqYlKpkrwlfQVif5WESSkAcQ8Bkvib7ko56LKOOcc
         dJz41QclTlo/Djh5af9DKmZv/lWMI8jXwYybn/NSH2pDHKeLn42B1SqcuIKAORamXIug
         ljKQ==
X-Gm-Message-State: APuU4Z+DH016Q/zyH6P+OB4v7SFgCUbPpmxSJn6bs38nhsk0+fXus+3q
	zFWpsorymOO4Hezl+l5x2rVDF7Fil2yAoLVshIRDj2z3Cjkm2eR/+Loc
X-Gm-Gg: AZFdTZe7SY4D8idz0PzreurrFk0ZJShGCBFtjkLuNYmaCZ8NHOvPrEI59Xsz7lUNlKV
	eI7CVQ7LyzmTL8PV+bCFiyaaki/9sz8MlpxlAjwqC0gqxGbZbBT7gQkCMmPNMETByt4359LFLot
	A0uwDZchfKzfZBrbVBoB6Z5DddTJ2Ws+Lzf7qNEnfQqFCLRYlu0SLiDkgPBI3bVN10X0ozS/0/+
	+Dt/h2iD5wDJVkfHviSJH3+22pf+w4My5SpPs2CVxtryGZ/rvw/w+4wAhNpiskgwYiJaaoThc2c
	YMAzdT3rCOfRLWaiHLnPuY1iXStcyGpLgyBf71qUpIblp961oANxH0rKsy1VepxCwsaRAI90Nn6
	8KmNQwu8/+x848QgM40qMC8XpzItA/8rLMoywoCU3cCVHXD0jDRvb+FHCAEU1FeKq+X6gAIYtil
	3FNSMTlB6CYMgZRL8l0vc8iunEDuWW23fSDWr2bQ29dz7oa7+0HuqOOW/MOx+W/qFrjKXhQ5Mym
	/hTxDzqqiwOjTKVYzxccMYZqodEFfnFU8gxT+PHkX9uoVSu0nHLMwEZT91HdNBpZ7vWkDlOUBPB
	psGyq0t5SLOhAU3Abn0iDn0x/w4+y6JIPAMgvimpEttGMqiCd/3PR8K9s62mO09GCT3mmk/tj5s
	E867oRADL7Q==
X-Received: by 2002:a17:907:1c81:b0:c3f:7e8:235d with SMTP id a640c23a62f3a-c513a4b0ca4mr1423432066b.5.1795604908565;
        Wed, 25 Nov 2026 03:08:28 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfeda1sm654562066b.6.2026.11.25.03.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:08:27 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 06/13] media: tegra-video: vi: Populate stepwise frame sizes via vi_fmt_align
Date: Wed, 25 Nov 2026 13:07:43 +0200
Message-ID: <20261125110750.223628-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125110750.223628-1-clamor95@gmail.com>
References: <20261125110750.223628-1-clamor95@gmail.com>
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

Extend tegra_vi_ops.vi_fmt_align() with a struct v4l2_frmsize_stepwise
pointer so tegra20_fmt_align() and tegra210_fmt_align() can report
SoC-specific minimum/maximum dimensions and step alignment directly
instead of duplicating limits.

This will be needed later when converting the remaining ioctl operations.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../platform/nvidia/tegra-video/tegra20.c      | 18 +++++++++++++++++-
 .../platform/nvidia/tegra-video/tegra210.c     | 18 +++++++++++++++++-
 drivers/media/platform/nvidia/tegra-video/vi.c |  8 ++++----
 drivers/media/platform/nvidia/tegra-video/vi.h | 11 ++++++++---
 4 files changed, 46 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-video/tegra20.c b/drivers/media/platform/nvidia/tegra-video/tegra20.c
index cdadff98eae75..f8d2b5e1b4131 100644
--- a/drivers/media/platform/nvidia/tegra-video/tegra20.c
+++ b/drivers/media/platform/nvidia/tegra-video/tegra20.c
@@ -447,8 +447,24 @@ static void tegra20_channel_host1x_syncpt_free(struct tegra_vi_channel *chan)
 	host1x_syncpt_put(chan->frame_start_sp[0]);
 }
 
-static void tegra20_fmt_align(struct v4l2_pix_format *pix, unsigned int bpp)
+static void tegra20_fmt_align(struct v4l2_pix_format *pix,
+			      struct v4l2_frmsize_stepwise *stepwise,
+			      unsigned int bpp)
 {
+	if (stepwise) {
+		stepwise->min_width = TEGRA20_MIN_WIDTH;
+		stepwise->min_height = TEGRA20_MIN_HEIGHT;
+
+		stepwise->max_width = TEGRA20_MAX_WIDTH;
+		stepwise->max_height = TEGRA20_MAX_HEIGHT;
+
+		/* Size must be div2 */
+		stepwise->step_width = 2;
+		stepwise->step_height = 2;
+
+		return;
+	}
+
 	pix->width  = clamp(pix->width,  TEGRA20_MIN_WIDTH,  TEGRA20_MAX_WIDTH);
 	pix->height = clamp(pix->height, TEGRA20_MIN_HEIGHT, TEGRA20_MAX_HEIGHT);
 
diff --git a/drivers/media/platform/nvidia/tegra-video/tegra210.c b/drivers/media/platform/nvidia/tegra-video/tegra210.c
index 82d054c9c34c5..90d984790696f 100644
--- a/drivers/media/platform/nvidia/tegra-video/tegra210.c
+++ b/drivers/media/platform/nvidia/tegra-video/tegra210.c
@@ -229,12 +229,28 @@ static void tegra210_channel_host1x_syncpt_free(struct tegra_vi_channel *chan)
 	}
 }
 
-static void tegra210_fmt_align(struct v4l2_pix_format *pix, unsigned int bpp)
+static void tegra210_fmt_align(struct v4l2_pix_format *pix,
+			       struct v4l2_frmsize_stepwise *stepwise,
+			       unsigned int bpp)
 {
 	unsigned int min_bpl;
 	unsigned int max_bpl;
 	unsigned int bpl;
 
+	if (stepwise) {
+		stepwise->min_width = TEGRA210_MIN_WIDTH;
+		stepwise->min_height = TEGRA210_MAX_WIDTH;
+
+		stepwise->max_width = TEGRA210_MIN_HEIGHT;
+		stepwise->max_height = TEGRA210_MAX_HEIGHT;
+
+		/* Size must be div2 */
+		stepwise->step_width = 2;
+		stepwise->step_height = 2;
+
+		return;
+	}
+
 	/*
 	 * The transfer alignment requirements are expressed in bytes.
 	 * Clamp the requested width and height to the limits.
diff --git a/drivers/media/platform/nvidia/tegra-video/vi.c b/drivers/media/platform/nvidia/tegra-video/vi.c
index 5b38bae648686..b523750725254 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.c
+++ b/drivers/media/platform/nvidia/tegra-video/vi.c
@@ -441,7 +441,7 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 		goto out_free;
 
 	v4l2_fill_pix_format(pix, &fmt.format);
-	chan->vi->ops->vi_fmt_align(pix, fmtinfo->bpp);
+	chan->vi->ops->vi_fmt_align(pix, NULL, fmtinfo->bpp);
 
 out_free:
 	__v4l2_subdev_state_free(sd_state);
@@ -495,7 +495,7 @@ static int tegra_channel_set_format(struct file *file, void *fh,
 		return ret;
 
 	v4l2_fill_pix_format(pix, &fmt.format);
-	chan->vi->ops->vi_fmt_align(pix, fmtinfo->bpp);
+	chan->vi->ops->vi_fmt_align(pix, NULL, fmtinfo->bpp);
 
 	chan->format = *pix;
 	chan->fmtinfo = fmtinfo;
@@ -531,7 +531,7 @@ static int tegra_channel_set_subdev_active_fmt(struct tegra_vi_channel *chan)
 	chan->format.bytesperline = chan->format.width * chan->fmtinfo->bpp;
 	chan->format.sizeimage = chan->format.bytesperline *
 				 chan->format.height;
-	chan->vi->ops->vi_fmt_align(&chan->format, chan->fmtinfo->bpp);
+	chan->vi->ops->vi_fmt_align(&chan->format, NULL, chan->fmtinfo->bpp);
 	tegra_channel_update_gangports(chan);
 
 	return 0;
@@ -845,7 +845,7 @@ static int tegra_channel_init(struct tegra_vi_channel *chan)
 	chan->format.height = TEGRA_DEF_HEIGHT;
 	chan->format.bytesperline = TEGRA_DEF_WIDTH * chan->fmtinfo->bpp;
 	chan->format.sizeimage = chan->format.bytesperline * TEGRA_DEF_HEIGHT;
-	vi->ops->vi_fmt_align(&chan->format, chan->fmtinfo->bpp);
+	vi->ops->vi_fmt_align(&chan->format, NULL, chan->fmtinfo->bpp);
 
 	ret = vi->ops->channel_host1x_syncpt_init(chan);
 	if (ret)
diff --git a/drivers/media/platform/nvidia/tegra-video/vi.h b/drivers/media/platform/nvidia/tegra-video/vi.h
index 46328e488aa38..ac86f11588f95 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.h
+++ b/drivers/media/platform/nvidia/tegra-video/vi.h
@@ -45,8 +45,11 @@ struct tegra_vi_channel;
  * @vi_enable: soc-specific operations needed to enable/disable the VI peripheral
  * @channel_host1x_syncpt_init: initialize synchronization points
  * @channel_host1x_syncpt_free: free all synchronization points
- * @vi_fmt_align: modify `pix` to fit the hardware alignment
- *		requirements and fill image geometry
+ * @vi_fmt_align: if @stepwise is passed, it is filled with SoC-specific
+ *		alignment restrictions and maximum/minimum frame dimensions,
+ *		while other parameters are ignored. If @pix and @bpp are
+ *		passed, @pix is modified to fit the hardware alignment
+ *		requirements and fill the image geometry.
  * @channel_queue_setup: additional operations at the end of vb2_ops::queue_setup
  * @vi_start_streaming: starts media pipeline, subdevice streaming, sets up
  *		VI for capture and runs capture start and capture finish
@@ -58,7 +61,9 @@ struct tegra_vi_ops {
 	int (*vi_enable)(struct tegra_vi *vi, bool on);
 	int (*channel_host1x_syncpt_init)(struct tegra_vi_channel *chan);
 	void (*channel_host1x_syncpt_free)(struct tegra_vi_channel *chan);
-	void (*vi_fmt_align)(struct v4l2_pix_format *pix, unsigned int bpp);
+	void (*vi_fmt_align)(struct v4l2_pix_format *pix,
+			     struct v4l2_frmsize_stepwise *stepwise,
+			     unsigned int bpp);
 	void (*channel_queue_setup)(struct tegra_vi_channel *chan);
 	int (*vi_start_streaming)(struct vb2_queue *vq, u32 count);
 	void (*vi_stop_streaming)(struct vb2_queue *vq);
-- 
2.53.0

