Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795339906;
	b=E4btxeOGpG9Z+SRFE+mHr2keI9eGIvx0qhHohoQZuZz3nTZ+dEHIHsG+WKMcJtTYZelZ
	 CSFPJCS143xuz3Gp+lCvFLdtJlHIc0U6Eq0S44S0Qevpf6+dU04I2AnJi3n+mPzuOsixb
	 v1+Fdpxyb2RK59PMSmJkHb7UqmWl0pmId51IKy3P/QwcNJUDbHYzfOTHRKjJL26FrDL+h
	 CD/oRBMavPjR1c0y3syljuo5NOL5eGO8fiS7ZlL50LJ3z5sY32f0vc+yupFf0vaNu48AE
	 AyNCytpjAN1SxAxQUy1Y5s+UNgTRT0upccElXCsErS9eYFZMytDo5zFSL9QvMA51Ycg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795339906;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Date:Message-ID;
	bh=R5GY9TTuofYTaa/ZejIza37Mpjz95YygMJZxjVzg2k8=;
	b=J4k9w/KykHS06kHE2T08jU9i1mILpeha6CJYD2FZFgJkQLU5RDp7YSbAOBahq69fnk4W
	 kpopv/UjHtzjuqJ6b1OcrjqmRUNr1UxtfQfU/U+GYlBF6JFAEtMnVyEcGqWLBttx3a6Dz
	 dzTHY80VPy6ZqpUwsCpSi7/vaDis/MhzbSVDKncph1DAPi6ZURS/Ei0E+cDr0X68irHCK
	 TZ/RhbGQHRPqM15BGDlC1pEbfViK77d6lwwOPOTmcN6z1JFrxbXQadu3pI5dxoeLkUiwZ
	 F+DrkF4AezIduMw9UoiIcc5erlyAglBMlqXmqIHJXFnsAX7vtrauswK2c6CYS48CWkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qkqpt50t;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4947606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 09:31:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4947606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qkqpt50t
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b403511a3eso308440a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 01:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795339905; x=1795944705; darn=vger.kernel.org;
        h=message-id:date:content-transfer-encoding:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R5GY9TTuofYTaa/ZejIza37Mpjz95YygMJZxjVzg2k8=;
        b=qkqpt50t0NjfJe5lLV1jyXQ6XtjZBa5eV9qYMkjLE6ts7F2JKg9eIElrgOosmXUhd/
         ngDz7NoWTZAOtPYbr45LkRO3oWyDLtP/qWTK6PgaoxXwJuqSY4GY/O+GM5YYsYGq+Nzb
         46zQJ/+DdVf9gJGabH/ZJ9npegdlShBSKRrU0ZwpUVfrSV6Aj0kWijXJ7ztvPgcYeeRK
         bhrofAXgGyQ6YiRBRHQoIf4og4GFvMuWR/Qp9obZL64esaPDhzQUKyj1Z27gYTI5bZ4M
         7dNiV+eB1cH5w5ayLnW7QjuYGZAc94qgA09dHFfuynNq3AoWY5uOaCZKrgfnZDKj/Iq8
         R51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795339905; x=1795944705;
        h=message-id:date:content-transfer-encoding:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R5GY9TTuofYTaa/ZejIza37Mpjz95YygMJZxjVzg2k8=;
        b=zS7FHD8DyU/vF9vjOtPHwgB5Yh5+BrnPTv4ynJqlYDtp5jylylOpMH2AJGY9G+Tm0V
         cfcf5r4QUw9Q5hu9UfmP7uKzwSrF1U2yx/vu6UU9Y0N7KOpVuRtz/DAqUMt4uDmYydbW
         /J+d+mtsrwJC/wno4cRk/AEDob7JOGy0aS8zkC6i3ZcP+Wwaimp9mx6f3H1e7PRAl7WM
         AlKVixcYNjvZvDFHRfhNX6zKRl1IP0RE5zUP1PzGOKZyIOCvmmbiJuVLPbQ3vIjF7LSX
         f8QlaHUZwAwsczK6MB09L0gejclhXlwV6oP6ELRfPAb4LN0JQ53sG6kSww+ZqAuozm4P
         458g==
X-Forwarded-Encrypted: i=1; AL+hErHs4sn5UAFTSRUmSO4HyfKGH5bb9Hl+5RqvItyn04J7bxQkm4pNIqssjNsOMmWHoU6hPG3lgqKw6VR3AaE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9p0C5vdjX8EMFsY/q9Bnhlw1CxYt8B3XkA8Qx6hUEZI3dRo5qY
	6GljX/u/4kOwsq35qSjJn+7TD3OTEhhofKWudOZvZUBccOZ8gKtd+q+T
X-Gm-Gg: AZFdTZdur3heghYEk/qT/8vDygd+bS2GtIfHJqnxZnlI6Vikx9qUHDDNdQNqI+E8Owm
	uKDxe+ISGh2cgjIcQwCDerdiHNL7fH+4ZewAahS8VQq6L2YkfEvOUc21x219ee1WcDrZ4Q/VLY4
	J+wsZf7riKgtt1Bv0h3Eq9Cx7ehSu6cJAoT9HPw/fZDFrPoJyNaxG8lJpjfEw4hAHNe+rxhbYfM
	x/CfCh+keR+y6Ork16XnnFDyTiVGShThPKHKtAfR6Nhb1L3YDqZX0zzYkJdg+02EurHx8NN49S2
	FsR/do7EAKv+FU0eHknInw+Gz9IUsSZy3EhTcDsTg+9zir08G+Tod3MAf+ubcsZGZJ1MEhpiddU
	AyBcKqXAyEiY5q46XNavstUlEdgpAaVtjnRq7x07D4cpZ4dMqg/mJgVf5+vrDYcs93jyEHDlZzj
	FnDYX16G+yG0wTCp3LgQG/K67OzRnhLnE/AEmYZwJ9KKQY0mviaqRvkDk7U0l5nHSTj7L49K8tL
	6eI3A9ZES2T3nxl0H9npnG+OiEeDks8q87Ay9Ec8kvDK04XIXBJXdGSQ7b+/7o/kRSSIQJK5Tf3
	ajuNAyt0GmYWejEm7P1L48qqlNKxDB4AKE5O2QyIv/y3gh5etD80m7XAAVYaTrdx9xQwPkZWrsE
	7ixvpvGLQdpd8DRda2hHAKxrtuAo=
X-Received: by 2002:a17:90a:e705:b0:3ac:9c37:9422 with SMTP id 98e67ed59e1d1-3b41c7e4cf5mr11892464a91.2.1795339905049;
        Sun, 22 Nov 2026 01:31:45 -0800 (PST)
Received: from claudebox.iyengar.cloud ([50.39.139.68])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ffa98esm14795295a91.17.2026.11.22.01.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 01:31:44 -0800 (PST)
From: Arun Iyengar <aiyengar1990@gmail.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Andy Yan <andyshrk@163.com>,
 Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>,
 Sandy Huang <hjc@rock-chips.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Damon Ding <damon.ding@rock-chips.com>, Alexey Charkov <alchark@flipper.net>,
 Igor Paunovic <royalnet026@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Dmitry Baryshkov <lumag@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v12 06/23] drm/bridge: synopsys: dw-dp: Fix AUX transfer
 timeout race condition
In-Reply-To:
 <20261114-synopsys-dw-dp-improvements-v12-6-d42d3dc5bdd4@collabora.com>
References:
 <20261114-synopsys-dw-dp-improvements-v12-6-d42d3dc5bdd4@collabora.com>
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
Date: Sun, 22 Nov 2026 09:31:43 -0000
Message-ID: <179533990370.107225.5765165679182115805@gmail.com>

On Sat, Nov 14, 2026 at 06:00:39AM +0100, Sebastian Reichel wrote:
> @@ -1491,6 +1493,12 @@ static ssize_t dw_dp_aux_transfer(struct drm_dp_aux *aux,
>  	status = wait_for_completion_timeout(&dp->complete, timeout);
>  	if (!status) {
>  		dev_err(dp->dev, "timeout waiting for AUX reply\n");

This still drops a reply the sink did send when the IRQ thread runs
more than 10 ms late. On RK3588 (7.3, KASAN on, v11 of this series:
same 06/23), with a SCHED_FIFO hog at the IRQ thread's priority on its
CPU (busy 40 ms of every 200 ms), 1410 DPCD reads gave 183 timeouts.
Checking for the reply once more before giving up gave 0 timeouts,
with 127 late replies taken:

--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -1493,2 +1493,6 @@ static ssize_t dw_dp_aux_transfer(struct drm_dp_aux *aux,
 	status = wait_for_completion_timeout(&dp->complete, timeout);
+	if (!status) {
+		synchronize_irq(dp->irq);
+		status = try_wait_for_completion(&dp->complete);
+	}
 	if (!status) {

Feel free to fold it in.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

Claude (Anthropic) wrote this change; I reviewed and tested it.
