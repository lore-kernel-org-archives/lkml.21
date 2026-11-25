Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605994;
	b=yXt1RIrnLLw9D6TNdurgKG5Agd+3pAoc8Zf450+AHkTggYg2Y0RGxmpZKKZcHp/6kGqe
	 rVU0jcP2IRYdRo41tQAf5zXdMaWGI2DboxwoYvJWhn7+4TXl1LvjJzVAPFKYcVrJeXLio
	 MTxXARJHUBI6Fpoi0308NyIsEnU6W+xQTEzaW59UWUhHbLDT2astk3g3T7AcMKCL8UW+c
	 F3TwwREki/vRZF6PJ1hjqyiWpr1SoCSjXYoaRBxr+thHqTfg6rVd1GPUJHE6Ge0lF+wAs
	 Q7H5+1xvGjzPvC2/1IVfrxlfXcXecKL4e1EvYSq+rHK41dVEPT6SS5WljSMi5aIKVOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605994;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=+V+MlFiMVbooH1RFDYNaob+l7nWjCw8PYj3aOGxI4TY=;
	b=dYTRo56pbkHIyA7HNwxF3hxoZSCBrK7n2rXIfl9N0i8DF6/2xKgPiN5aqvkeb8D14KeM
	 IPVSca35GqGJ4URv9FUZ5hyTcMso+zcrYSOp83bbFMKmx5ZPlh0kEFxN+enJHwZHA/ENH
	 rz4vP+2O3wUxXZrS8K6NkzXtLQinSjHzRtJN0D+y/2u0Em9n0qxWsV1AN+p/oXyBTy5r7
	 pXolOlmufbUAR9WFzoKw3T+6EJp6yFtQsXzQIGkhfi999L9A44YIujacmOL0v4sqvAAEP
	 3k3b1ZiKvelay0y3a87CJOGAyhwSaEX/sUTJi+LRkJAFc4xf5KgtZ3I6k7/V7R9t8Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ptHjGKmw;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DA2606A6B5
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:26:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89DA2606A6B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ptHjGKmw
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6bab377105dso4097266a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795605992; x=1796210792; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+V+MlFiMVbooH1RFDYNaob+l7nWjCw8PYj3aOGxI4TY=;
        b=ptHjGKmwfr/RLAGTM0/nWPiOARrnjjxlnXWjBYDz5gvePjmj/X0xVJSsS97aVEh996
         vlTAOWHsG9Ww6x8792xg0M7X5GIYfR6BnaKAtrdS32ulrQq+6t+Swszer1FImvPeqq36
         y4Xyb87/8SLnqDm3b+yVUh4N80TmVA9OU0pMX0Fxg5R5zlijNU71pAXeDyw037a6Q6dM
         95g+40hLWi2P/dGixwoR+kE5U6q15Nvj5t6C19t91fQa2l0rc3Ynozw/OiW0kJ6hB6cQ
         MiYoK3WH1/U4PHGSFZYtJ5KWrdA/eDeIVhiN8iI9MZMpKCQe5o79a/rvU07kI2FfiNkg
         HoUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605992; x=1796210792;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+V+MlFiMVbooH1RFDYNaob+l7nWjCw8PYj3aOGxI4TY=;
        b=WKZi+DxN37D6XUHHrj8McDSvis/f6R1BYmxI6B9ibxnXzoi+e5RWvU1TUk+1ih2DVG
         5mueWsLXr/iokzzu8FcE24zsgrIBOUkqDe/N3dka1Ij8M5Jyf3lQYo9VGut0osriXTd4
         tjr7KL9CbejfBkEheHqzHLeePur9gpefMkkbbcZ03SaEJhZXmU8CXOBw5vvZYbdzOvdM
         Qy4oTualcq1G/JeAXLk+C4xRA4da67BZ98O9cgbDY4slDHq5ko5hg0CB15U+1R9AukIH
         DWLHlmu8AAXwY6IFCgDonPHq4hH9GoQEn07hRmsBDOg6R6anLqWiFabxDAaXj0n4m6zT
         RXUA==
X-Forwarded-Encrypted: i=1; AL+hErGbDIWAYRelV24/3cyapgKh0zi4QYpOOFaZdFZ4Skg+RsjDnqXg76e3fhx9SkddDfQJxWfvTrYk8Y7c1Jo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AGEj1q1+0zi0koIHYP9Srh3yzOJOZi/0r6NnUsaH6M7WW8Tef
	IsWfEbmsMl6KJRDK84yl0Dm+0U5jIS75G3LDWuTtYb3HDPNgUrPtwyB+
X-Gm-Gg: AZFdTZdp39bIftRdXTogOVOpdfWYTLtEg+x1YdxdpwYRGyx2KyYzFnZeiZ3wxU+WDEr
	7j7Nt+LOb8/8BqbOylkch/GcldqK6n6zPKCz/CK336vaHK53OkAoU+4C4avaF7PFR7OzfjmKpkO
	XSuf0U6enljP+zmpkxU2PBDlDfHxJ38Ni+kyMDzSOUhuR3Z9xtBku/VEnmaTDzkCrDq92VeDuiL
	5hGAqXN+8NlvaynUX7zB+Kg6pcFQ+gNxtiEi04drX8bb5HjpDMXol1DrOSqNR7dehbL1u0OtUhQ
	GKdYtWcl89j/x9XfUCjEzUXWvTu6n2Xk+V1wUzpcxpg3DZNAFIqzUgumMwHGHWPiHdsy2d6DEme
	WV0L/VTiab8jFEzEQJLQ4W33vxSZkVtOW1pFioYE/qVeGkgVjtB/yen618CfIkaUawox/TroIns
	1B9Si7bWTMb1wP+TjtjZU6KcZPC2Ji3hirsfwjmNV1NRptUv7ZN99DGvPyVhgladjBgXPe5w3T6
	/B58rGzkYoy96y+HfnZP+Hk18hLwLi40vWR7sWKb8p0HvWIWI4sxIWNJifbSzwZo+QcEbuwSGGy
	DVuZABj0mp/1H+0hMmeDl1dwXT8/b7kasCHNj5rSCzkxBnarfl+I0OWiSxBcjc+N9W+4GXhZqYL
	tsRjFruZQ0A==
X-Received: by 2002:a05:6402:3222:b0:6b2:2339:370d with SMTP id 4fb4d7f45d1cf-6ba37ec485cmr14832157a12.39.1795605991602;
        Wed, 25 Nov 2026 03:26:31 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb1b93a8efsm1202907a12.7.2026.11.25.03.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:26:31 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 2/7] media: tegra-video: vi: Diverge Tegra20 and Tegra30 VI SoC descriptions
Date: Wed, 25 Nov 2026 13:26:08 +0200
Message-ID: <20261125112613.237333-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125112613.237333-1-clamor95@gmail.com>
References: <20261125112613.237333-1-clamor95@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Further investigation shows that the current maximum VI clock rate is too
high for Tegra20 and is better suited for Tegra30. The correct clock
frequency for Tegra20 should be 150 MHz, as it was set prior to the
addition of Tegra30 VI support — a value backed up by the current Tegra20
peripheral OPP table. Tegra30 supports up to 470 MHz for the VI clock,
but this rate is available only on higher-end Tegra30 SoC variants. The
highest clock rate supported across all SoC variants is 300 MHz.

Diverge the Tegra20 and Tegra30 VI SoC descriptions to account for maximum VI
clock limits, setting 150 MHz for Tegra20 and 300 MHz for Tegra30.
Additionally, remove the APB_MISC workaround for Tegra30, as it is Tegra20
specific.

Fixes: 071fa83ded5e ("staging: media: tegra-video: tegra20: increase maximum VI clock frequency")
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../platform/nvidia/tegra-video/tegra20.c     | 22 ++++++++++++++++++-
 .../media/platform/nvidia/tegra-video/vi.c    |  5 ++++-
 .../media/platform/nvidia/tegra-video/vi.h    |  5 ++++-
 .../media/platform/nvidia/tegra-video/video.c |  3 ++-
 4 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-video/tegra20.c b/drivers/media/platform/nvidia/tegra-video/tegra20.c
index f8d2b5e1b4131..c8a8fb3cbba0f 100644
--- a/drivers/media/platform/nvidia/tegra-video/tegra20.c
+++ b/drivers/media/platform/nvidia/tegra-video/tegra20.c
@@ -825,6 +825,15 @@ static const struct tegra_vi_ops tegra20_vi_ops = {
 	.vi_stop_streaming = tegra20_vi_stop_streaming,
 };
 
+static const struct tegra_vi_ops tegra30_vi_ops = {
+	.channel_host1x_syncpt_init = tegra20_channel_host1x_syncpt_init,
+	.channel_host1x_syncpt_free = tegra20_channel_host1x_syncpt_free,
+	.vi_fmt_align = tegra20_fmt_align,
+	.channel_queue_setup = tegra20_channel_queue_setup,
+	.vi_start_streaming = tegra20_vi_start_streaming,
+	.vi_stop_streaming = tegra20_vi_stop_streaming,
+};
+
 #define TEGRA20_VIDEO_FMT(DATA_TYPE, BIT_WIDTH, MBUS_CODE, BPP, FOURCC)	\
 {									\
 	.img_dt		= TEGRA_IMAGE_DT_##DATA_TYPE,			\
@@ -868,7 +877,18 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 	.ops = &tegra20_vi_ops,
 	.hw_revision = 1,
 	.vi_max_channels = 2, /* TEGRA_VI_OUT_1 and TEGRA_VI_OUT_2 */
-	.vi_max_clk_hz = 450000000,
+	.vi_max_clk_hz = 150000000,
+	.has_h_v_flip = true,
+};
+
+const struct tegra_vi_soc tegra30_vi_soc = {
+	.video_formats = tegra20_video_formats,
+	.nformats = ARRAY_SIZE(tegra20_video_formats),
+	.default_video_format = &tegra20_video_formats[0],
+	.ops = &tegra30_vi_ops,
+	.hw_revision = 1,
+	.vi_max_channels = 2,
+	.vi_max_clk_hz = 300000000,
 	.has_h_v_flip = true,
 };
 
diff --git a/drivers/media/platform/nvidia/tegra-video/vi.c b/drivers/media/platform/nvidia/tegra-video/vi.c
index 98411c3f4a037..52384af92d8a6 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.c
+++ b/drivers/media/platform/nvidia/tegra-video/vi.c
@@ -1408,9 +1408,12 @@ static void tegra_vi_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id tegra_vi_of_id_table[] = {
-#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SOC)
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
 	{ .compatible = "nvidia,tegra20-vi",  .data = &tegra20_vi_soc },
 #endif
+#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
+	{ .compatible = "nvidia,tegra30-vi",  .data = &tegra30_vi_soc },
+#endif
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
 	{ .compatible = "nvidia,tegra210-vi", .data = &tegra210_vi_soc },
 #endif
diff --git a/drivers/media/platform/nvidia/tegra-video/vi.h b/drivers/media/platform/nvidia/tegra-video/vi.h
index 44893c5c6e651..965357ebaf0a3 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.h
+++ b/drivers/media/platform/nvidia/tegra-video/vi.h
@@ -291,9 +291,12 @@ struct tegra_video_format {
 	u32 fourcc;
 };
 
-#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SOC)
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
 extern const struct tegra_vi_soc tegra20_vi_soc;
 #endif
+#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
+extern const struct tegra_vi_soc tegra30_vi_soc;
+#endif
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
 extern const struct tegra_vi_soc tegra210_vi_soc;
 #endif
diff --git a/drivers/media/platform/nvidia/tegra-video/video.c b/drivers/media/platform/nvidia/tegra-video/video.c
index 2e84385708bac..d483fb709d127 100644
--- a/drivers/media/platform/nvidia/tegra-video/video.c
+++ b/drivers/media/platform/nvidia/tegra-video/video.c
@@ -123,13 +123,14 @@ static void host1x_video_remove(struct host1x_device *dev)
 static const struct of_device_id host1x_video_subdevs[] = {
 #if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SOC)
 	{ .compatible = "nvidia,tegra20-vip", },
-	{ .compatible = "nvidia,tegra20-vi", },
 #endif
 #if defined(CONFIG_ARCH_TEGRA_2x_SOC)
 	{ .compatible = "nvidia,tegra20-csi", },
+	{ .compatible = "nvidia,tegra20-vi", },
 #endif
 #if defined(CONFIG_ARCH_TEGRA_3x_SOC)
 	{ .compatible = "nvidia,tegra30-csi", },
+	{ .compatible = "nvidia,tegra30-vi", },
 #endif
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
 	{ .compatible = "nvidia,tegra210-csi", },
-- 
2.53.0

