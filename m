Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674293;
	b=vUcDrnEisVHzg+OF1RqPCRYSJCJhi1Ud6WXMxPfK3fW8kiFWYUL4QHf3Kx+ovJ/gEod/
	 nrFRmoNe28FzTQ9Z4Nzx4sipo8lAtQPx2Gdk6/5nSllatbfirbTuAVyP+YIaSGSDAkQDO
	 zX9iwRN2JcJV1vUZ0rFy/FRaBXbA7zmFz1urc28yJWKcuc4m12OAr/U6t237DKyGfdvX+
	 qBQIuZWP63xFZ2dSyLmbpymKSQAYMqMe3y2P356Ewshy6BnLBbqwOu3vAv1viwJAvahfD
	 GX3GqKb9iavPlRbMHWoCX4uV4eI1DGCa8gIPHrM24lhK/SFWUvAW0XsConbbATStYOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674293;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=jXfP+BBaRmFRvRsRkzl26nbPuaGAtebafKyAvaeF1Hk=;
	b=09WFM36LZ74fQ2zDOiaGAwy0GcPitkbFH9KAntxlL2kAPhAdv5YTP43nZYnJbbw5IMVV
	 KHEgzQS5k5q0sWiLKxEGdBmPauWRgSOCd6IFt1OMOX7x0osLT6wEFfUNiRJ21QJmxh9mx
	 ZblLOsMUImCkTeIwpWt3L6nbL5IpeBs3/K2nYJhPNuIm2Oluvx+sxSyatLRPmt5gGl4Pm
	 szqawAUmb6tJtnue1b9xkikxwm9+RJlJtlBoYKz8DBpCGxbIdeJ0jDs8mrd/Nr27MnXfx
	 MoxLS2GHlNgRoLnzvWApKmPJUfuOLnOF7iv7q4YNHXavWWDHxcsdJLV8sjmjTjHQrWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XtULAtt8;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4861E606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:24:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4861E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XtULAtt8
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1ae58d17cd9so7385327c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795674292; x=1796279092; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jXfP+BBaRmFRvRsRkzl26nbPuaGAtebafKyAvaeF1Hk=;
        b=XtULAtt8TBolwO52rSCfEzc2VkRPEHCOT/iznBtjLcvMR/qVj2R8v/ETU8qHmSDso2
         BvZmQ4JCW83Fpe3nDuGrJ1yhogm1K+b/CZtdvHIYa10OHtwF6y8fbDuGQMVcdK+vxCPK
         MD4xbRVd0jQPgWHcz7I9b9mr31qk6AyvAO/0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674292; x=1796279092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jXfP+BBaRmFRvRsRkzl26nbPuaGAtebafKyAvaeF1Hk=;
        b=ifxoNwLI6dXWM6Jglp+LVYTXffFRgZf/8JZ5SX52YH/7OKMtO1tPoIY3I1MyLI0DLd
         tSt6R1AU6ukmEAZEd375KkthRI2SijmfCoka4ZGeSHoZTlibqZBZ0o3zxuTyWiTASIqx
         b9G6ws9OzGRmjvpVpqbh0+7Bn6xC4PPrJqXUcowqJ/xxgjUf2VssAI3YD9KLRxo2CBNm
         hfiSAcdmXY/sjmzm5aS+BOL/XmGj1GMpsg/vyCc0IR6YiQPhShntK39/1XdIJddIJ998
         2hgDhcbTCCHpxRtsqASdEB7uxVyo+2Aa2a9q/dH1Aj37jbGqZ/H1W5Sh7G9HbXbnUfc7
         GKwg==
X-Forwarded-Encrypted: i=1; AL+hErE7luCAm+I8T7+gr1qvCfsnuZpM/TTcdSyvv3EcllybMEosZN+TSFuWWEeRruEjJHYqb84jkr9Wr3PGkc8=@vger.kernel.org
X-Gm-Message-State: APuU4Z95cAr5JRQzxa8X8tp1w/Ti4HA5bL+GA5aXsWUdFkSfK7aFzBLJ
	h61poiteAgmlZ6qxgs6DfEAIIolwtxdBAyrOo2brYlj5B/DoJwh9+EJSkKfU8SRCLoUSXe4y6in
	RL4cUvA==
X-Gm-Gg: AZFdTZfbeRG7Et8HPnIe172rwM5dvUHBndg+2fR7ZUYWazNzaV5NRyb4m4ImKQIi0Mp
	bEiSzZ2v31DvkJurfhGkunqLyrRImsd53Ao4KuJmzcrdV0b+s0suBoeeIf4JSzxAJ/9lyxw60HD
	s99311VKeWOmW1/Y/dbxM6pSOXklKxe5sSUwmIzkrEPFBKdTUCbHZB145T1YzLG/UQDEN29ygMe
	JXlhxsyIHRdgLs/WfBvZG8tK0THg6MZkjA/n0czpRlI9Kl+u2EZ8LlwKW96/IHj0V5O2yRYsXgt
	N+H6LLvW0obs/tIvWcvnU1l3Y2jmkhS31Xc4Lg9ZEG6Pvlr4suapN3U9vWxVZ0Ys+ZvBlxGfpmC
	TFUYdyhHMrTcwJ2jLUSLYrCBkHvXwlw9ZQ3PDjwCGX2a34nnK4eZj6g6Wa0jWo3UOsHV0A/REKy
	U/oU2k56T881irNK2yETkmtk6xaA8WOfuFAKVuUlOkz0saX6ITJdqLJU+5hQxy7rrQvWHv1DxGN
	xKzMFejiWJPCW2Fkn/ixjcBeCZN5eWKCoLUfFSaSGlhc3EFmOri/6b0BDwD80kJ1BdRA9l/pyrB
	iralvd+R4fL7bQIIeS0UwwnkUOOZFB7Sb7PjbNZLidYqXKIzcSIWzYauEpLWfa+F3FJ2dAJ8tK6
	hIaNB5xJAXH5oeS5Q61/ZkA==
X-Received: by 2002:a05:7022:28b:20b0:1ac:f84d:4036 with SMTP id a92af1059eb24-1b55686f9bamr17794762c88.9.1795674292446;
        Wed, 25 Nov 2026 22:24:52 -0800 (PST)
Received: from fshao-cloudtop.c.googlers.com (123.142.199.104.bc.googleusercontent.com. [104.199.142.123])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm36793186c88.4.2026.11.25.22.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:24:52 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
Date: Thu, 26 Nov 2026 14:23:46 +0800
Subject: [PATCH 4/8] drm/msm: Use DEFINE_DRM_GEM_FOPS()
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
Message-Id: <20261126-drm-fops-show-fdinfo-v1-4-7cb1d1a5d6ef@chromium.org>
References: <20261126-drm-fops-show-fdinfo-v1-0-7cb1d1a5d6ef@chromium.org>
In-Reply-To: <20261126-drm-fops-show-fdinfo-v1-0-7cb1d1a5d6ef@chromium.org>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Oded Gabbay <ogabbay@kernel.org>
Cc: Lucas Stach <l.stach@pengutronix.de>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Melissa Wen <mwen@igalia.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Karol Wachowski <karol.wachowski@linux.intel.com>, 
 Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 etnaviv@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Fei Shao <fshao@chromium.org>
X-Mailer: b4 0.16.0

DEFINE_DRM_GEM_FOPS() now wires .show_fdinfo to drm_show_fdinfo() by
default. Migrate the driver to use DEFINE_DRM_GEM_FOPS().

Signed-off-by: Fei Shao <fshao@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 3675df277f6a..06d997a7a237 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -898,11 +898,7 @@ static void msm_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 	drm_show_memory_stats(p, file);
 }
 
-static const struct file_operations fops = {
-	.owner = THIS_MODULE,
-	DRM_GEM_FOPS,
-	.show_fdinfo = drm_show_fdinfo,
-};
+DEFINE_DRM_GEM_FOPS(fops);
 
 #define DRIVER_FEATURES_GPU ( \
 		DRIVER_GEM | \

-- 
2.56.1.839.g22a8290db9-goog

