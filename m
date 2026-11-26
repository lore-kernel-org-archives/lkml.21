Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729488;
	b=IdtsZUIFzZfp3kzsQWQ6Moq5mTqDP3AeVb+iwOOAO+tQfPwpHgO0pyqtB2puHifhfxNt
	 zPDq2JXI2luTdQQSf3k+aJw96L3KFVe0gpbwTpiMpkuyw0o+BArLGBm9YLtmMxaYpnw8d
	 2+31gvFGTu8CFpcSHuHT0/IreAVBi4C7f03k/reXWklc9OZlnmd61PTAe7/8iqSe4AufE
	 Gc0yqse32S44p/jAaw5GkC+1/yjO5FGZ9rm6fbB1ytF9Hp3iIF5jc+LZoCJMUYHcwmwsn
	 ahpZsf2/hcdzq26RMd/cFetAVEgMJzG6fK5OZsu49r7cBIPHp9oFYg723iLO+AMjoWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729488;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5TOaY7Fgq8X9NRdZ+s6yjIa1AaIRWGcVdRqEFaeVeKY=;
	b=hVc4M+BC01bYQPkD5DBrPXs7SK368AfGw0pegTxc7YJaA842N3TjfmpZAsSmXT6qmTzw
	 0hqju874H1IZyxskGbZJ37sNv2JibcFYiuSoS/UfdIGHKa6kiMLsiPRsc+gnjvkbqFKfW
	 eAR+TgZ1dAsF46zICZLdD5m2lJhAb0O5xVA85KN8IpPiJOOrgpNIBAV258640B29o2YPf
	 cqO1ngqcEbcrEdIqED2KFZ+/x7Pmkzl2akB+ekdfA6T90Hf0OFZFWLhX1CqTg41HPlMOF
	 PCb6QDibrwBrQ52ObbOaJKfY0wDFLcg3tb3PJBygq7V+hZjWvWjXwwiq93PYn4L5W/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OH0wo1sW;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AB260A2601
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:44:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35AB260A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OH0wo1sW
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so4103155f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729487; x=1796334287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5TOaY7Fgq8X9NRdZ+s6yjIa1AaIRWGcVdRqEFaeVeKY=;
        b=OH0wo1sWbdy84nQOkig+XAitRe4WjdXHs9CQYXKGqAwSHt/oWOqXyL0L3Um1rirdQ6
         ffwK7oK93MPY5ITAT98GFbSsgQV6pGQTjFVdTDl8w6BIHftCYxcZomec4tZP8/D5ocyR
         hTvTJvk3nHMdePQlfnxGgGbn5L9Ku/5H3TIu9pCFqFjByBQoadpduJrTD7Isy3+OEa1q
         1C1QN66I4a6pYqO0t1HalPH4OrVv/YWgmBUItFNkAb0zg9EN3Q3AUuQSLfrVVyVorTJE
         Z+rRZuim6qClhgxsj0xMEFEl9uWplwzHkZTuZOIJduYBwFW5qRI6YAsTjdnAlXk33Vns
         Zy4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729487; x=1796334287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5TOaY7Fgq8X9NRdZ+s6yjIa1AaIRWGcVdRqEFaeVeKY=;
        b=lkiz7ErlKK6s02F7s3cKNqvGAMwH5Bgn9dByht93JGaXntwoWzaagwXsdU0dNEVosN
         QjoeDJ5wQz1/o8jZQu6Kouht2Us313dZ9BSWtOwLChUqoRHZbE9UC8EztFTXqR0usdWe
         mpwLtkbWKEKJ8ZGHAebg8sruinU8PxBAXHQffVS8JhX9Anhkp8r8IO6YO3o2q/uyyozj
         AAGtI9dWeGExTIGmNhWtwiBRP8Am+VuUYoP97tbNevir57vbi/62diZm3GyirOgSXy6C
         DdDwCkm9WySgF/d57JKqc98EzEWnupocyvMTKLNfrwI1sfNY6/GLx3GUVtk2IkNHTKMi
         J22Q==
X-Forwarded-Encrypted: i=1; AL+hErEZMdiczET2Th02Rxuvgnlg6v1KWwAxKFVQTPo7GT/WF3ZPUNmwpiKTiItw5Jf1sTKM4ybTRob06kAp53Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yIoVnVIoKtjcqxubeljlMUk3bZk0ZJevKPkHb+06MOd3NMlAV
	XhPNrFif8q9BPxgDCmiJzDhhTbdKC0yU+TEIXgReGVlp6OIQneEdT95J
X-Gm-Gg: AZFdTZfuGB9BPzIyH7XIHaezzyczMKG77qz/Uc1P3yCFZXeG5mY2J2CbgSMEtoo4GGm
	xcx0uQYF2c/wyk8NxNReGw3V5enzJjlwSjkftPPChxeCC8m+kJKx5Afg4Z+cm5UNsmuGOlNtRbF
	p4c7cqruZkdF7eszn6bnOlzTqyx2m1ddVg9lgWrcxLckZzzLT72WVk3Pe+lsKKn9BSQCAac72QX
	Vc/u6PxA9tMbM22lu/TgQK0CsvVwX5ofI+i+YKGEYfrZhXxrPqUMRDyZ4/Y2QVCfVwB3wo+/+oc
	iBstKNhdifZR8eURcdD2kxYmZdUp34Lw8CrrzsUNXu+gHkFc3KnBRH/ylCQvIfjegJ+WHaeMaYR
	jpx9g5ZJ0Pnk680f4ZAooZln4bIOYsElYea7ksUR34E3Hh9wY9QKXPLVCaakyoucfEfj6p3+x/x
	lICb64erGpfZeVo4ofkVT8reQhXJ3BYdZRTVB4tBMm/xk5HMw0F8jO9S/CuUewpsj3u0+u6dNuc
	bpqYrhYh8to+2sVwbY3DKgDrU+0t712tSXCcO1aLVBB/R248bYiSXqvU9uloMszfxpmuq6Mjbmc
	Ow2ao60jRrmg7zNDIlgs2XuHQGg6MUh0afmOLh8uZrAsKunwLzHTJzhTwKdEX5j/58L6/U3UKxu
	5yOvvX57eIKJG/4kM1KLbXcaVAFpB/s7U4IICSlRmdueKNvlfsEd3abIXC1mV37IQNf8RaOJI+X
	zXfhX/z3a90LpcVVUmfHI70JLFvSlxJ3RHD5NILdnJiJC6lzkOd1R2KttrRrzksjtaavZyjw8cm
	obeJady4gN4UO+EAKpkGu2oDbj9DD8zPfLzPME1Nw==
X-Received: by 2002:adf:e189:0:b0:4b7:6a63:89b2 with SMTP id ffacd0b85a97d-4b76a638a20mr20363316f8f.20.1795729486620;
        Thu, 26 Nov 2026 13:44:46 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm40403963f8f.18.2026.11.26.13.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:44:46 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	jernej.skrabec@gmail.com,
	p.zabel@pengutronix.de,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/11] drm/sun4i: tcon-top: Route LCD TCONs to the LCD pins
Date: Thu, 26 Nov 2026 22:44:27 +0100
Message-ID: <20261126214433.3562326-6-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
References: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
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

TCON TOP selects whether the LCD pins are driven by TCON LCD or TCON TV.
The driver never programs that and relies on the reset value, which
selects TCON LCD. Since the reset is only deasserted, a different value
set by the bootloader would survive and LCD output wouldn't reach the
pins.

Select TCON LCD explicitly, like the vendor driver does. Nothing in the
driver uses TCON TV for the LCD pins.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_tcon_top.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
index 5ea55a2844a7..c7d03c37fd6e 100644
--- a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
+++ b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
@@ -226,6 +226,8 @@ static int sun8i_tcon_top_bind(struct device *dev, struct device *master,
 		goto err_assert_reset;
 	}
 
+	/* Route LCD TCONs, not TV TCONs, to the LCD pins */
+	writel(0, regs + TCON_TOP_TCON_TV_SETUP_REG);
 	writel(0, regs + TCON_TOP_PORT_SEL_REG);
 	writel(0, regs + TCON_TOP_GATE_SRC_REG);
 
-- 
2.43.0

