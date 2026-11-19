Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795106560;
	b=hLmw1ruw6XMsn3Zy+Q+jYZ7DV/ZjaSREdObxg4q5tSBOs0Q/ezhvUyhT1mAFzUTdA25T
	 wNzycHeTuflfN2BK6P2v/aLKIjw5dZHbaUScfHbiTEuAOvqckiY7TXCqXkVzBF9bQ7Fsj
	 TnToDVDtaiqCFmNA5ES+WdK04EjqsJgcdx8weGAoyn2UZVkw8R85TmapG5EIw8L+P9qms
	 rXqncu3jKNjmGwIREEHfkDxTxE07UNWiVaL9cY+YPvvi0dsFJCYCHUzbblpJXXnv1R5yp
	 5EuOG6vjO1yQcSiHCGU5q5zmVPxqw1Vu5A3S0/aRue3kEGPpuThMMmvrVc5JKIs8PAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106560;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=G1EaTywtJ0ZaLtfLHyxoBdWpieG6YjnInrIP+X97zOM=;
	b=HHyYthAvXjFYgOJj5pod54539ZjeF7Gq2UDOkkHGsKhgOPIMMCauznnTN3sP/hzIqfwW
	 RYBPBZLDIeAWXFzGTeEIybwnRSKl28H8/9HZZ8JDlrNjRctQkEHs8Wu/1SHueXeicIoRR
	 ix2VWuTlWLwfAvbgOxJDrj2LvZHQ7BkpxMn7WhP7mq+0xrJ1Py39DQC1rfNT8deIUHtpg
	 99qQiXMSE5aohHU0Aw9Fbe49AoU7nktuLavPPNf6bsOznfLxB8yJx4CjOCLgcpzjwRkLo
	 zkxsNJg0Arw/CWzqtHjfHeUraZkiaCgxMuncbOFRdP2nAJjqTUZbabQEy3SNZoRTSdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O62XEyWb;
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C737A60A3832
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:42:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C737A60A3832
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O62XEyWb
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-705cb6ceebaso1972436eaf.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795106559; x=1795711359; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G1EaTywtJ0ZaLtfLHyxoBdWpieG6YjnInrIP+X97zOM=;
        b=O62XEyWbvFC2x9ND+uILbIXKSuBvCVct4Gx/frFpVmlB0M++arKBNAuvqs6i2J9hsQ
         wQVHUKBsQ4N29kXA58+qan3TuwPZTcs8SGWAA23u60HUBfwobb91cjxFbjZL3WxqiXby
         3MDHYT2DQ/fjQvyOHgTfnFQAALdVa92yrg4tCUzVjsBjB6tmjlM20EN/ZvSAIcJCbjZ7
         U6yZwey4luQEyE6hr5vGjGysqXc1J/eoUgh/WDC0bIJWMcbjXrdwifOt6r+nzpv1z0qM
         VtOegl3G/khFeW2k1wVpLWt0g8KHdp2n/yEvZEdkVJMXaDvMdIA0Mm0n3+lHRdyVOZse
         CheQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795106559; x=1795711359;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G1EaTywtJ0ZaLtfLHyxoBdWpieG6YjnInrIP+X97zOM=;
        b=OqUSOCewdMAVTJfZhH5ujuY50/sH0hn4lP87xMFOAz7dtRG3Q9xHxFDHLOP2D3vD/a
         DGjDgfuPbEE7xQfr3NpdVnT70HirpnSaGlOqbp8LOIKlK6H9Stmvjr/aYUbpDmw1OPt3
         LLpU935KtHCT4dIVPuCM6YGiUY4rCsN2Op1rnqk0S9cHAYq5rNEK8fuP2L11sgN1rzET
         Qw8mT+YEXUopx6idB7Upytcbgv/8ERdDpAri+EGkY0V/LcC/yWqml/8QKI7AqRp1edxD
         MzuhK/DF0YG2hvcBV/uiMvvLyD7UmEp/qsEmq27SHJ9VKJ6E7biUqZl7yE5qlR418tyh
         +bbA==
X-Forwarded-Encrypted: i=1; AL+hErHWr6+8DpFe8HUVLQKqdrXWbgCmM+JxsV+KjQokmMvyg4yl42OuyVQBz+dvJd7Yg/fq3w5R1uXMbrTj7gc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AZaNjTA51PVMbyA7EGDMsDuYNdw90Uq9UMWy9BWX9bGfYzOyw
	4ql2+VW3VlmD5mqWAXGwtL8NRmxH6s4pFr0WO8pC2Wq8pmVfSlVLJbCR
X-Gm-Gg: AYBFou1/qYLaZyBvV2RdoGvFzCElr9I2Z/71y2EG3AfJXI9rR2qzk9W7FmZL2ehebx+
	u5z32W3aPdPoAdydIsYDi1zoXn1sa+N2kUF8vm5d4shzb8EIqvBUGWh6W91Uo1jGiuEPbuqMnRN
	Z/QLKiWEmlzVPYw7uxusAWkVk9giAxo3sS2F6QOgqW3krSEDDzvcY1v5Q+fsfl8gi8V9Vm7vF5V
	BXmFuAbfHws89ZZZx15eoi7x8zVEPAQfTX3ZxuQ3YTiEzamHnrI1hvnfeIFuN6K2i18e8TKIJFJ
	5WvYsFiDyp1ZT7Mt+seLDpTf8mMhQZ94an+o9Rw1x4ZqseK3QlvlbYswm1aiD80cMYHlXGLGEsz
	YirEnli8crRExKLfJvjtpdsZhNxC+IRTYRYxQHJIwBQnxJBSupqkpV/y0VWbutBhPV4lyRdkBjX
	x6SXHu0LOIfXJJEI0JPttf9xh9v5ZsdChc1kQeYxzlTqB4Dk3g7dnYghgO9N4OEmUQSK3W/IFfD
	QAl6VejhIOcyQqdfSxS9fHvv7kGnjHvR3buLD5WpRmptkabNNROk2QWqegQYyj2PUdl9XW0arPC
	YO2eIZJPRDVRclcC4Ujsamgs8c3iMZLOCv18Mz7pUacRcaGL6HlTqhhByxVyf/kMb/w+XPLy37+
	l9iJJ3pJUlZ/Lus1aoGY/YWwp5OJVlVhwRzy235IKA+5FOIcKdA6yuFlTTvmtmA7r18r5ovE4Jg
	onRIrcGF05+kT2NkvcRl06vvysqtAgQVQPESOZ+HeQ0cpFNxFnuvVisPxdZ+TvYIcd8hbqqXxY
X-Received: by 2002:a05:6820:5201:b0:71a:e95a:34dd with SMTP id 006d021491bc7-71b39591d9amr80530eaf.78.1795106558782;
        Thu, 19 Nov 2026 08:42:38 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380e4a6dsm341975eaf.13.2026.11.19.08.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:42:38 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 09:42:08 -0700
Subject: [PATCH v2 10/11] nvmem: u-boot-env: propagate cell registration
 errors
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
Message-Id: <20261119-submit-nvmem-provider-lifetime-v1-v2-10-8fca3ec5f18c@gmail.com>
References: <20261119-submit-nvmem-provider-lifetime-v1-v2-0-8fca3ec5f18c@gmail.com>
In-Reply-To: <20261119-submit-nvmem-provider-lifetime-v1-v2-0-8fca3ec5f18c@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Michael Walle <mwalle@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Michael Walle <michael@walle.cc>, Linus Walleij <linusw@kernel.org>, 
 Khouloud Touil <ktouil@baylibre.com>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Paul Cercueil <paul@crapouillou.net>, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

The environment parser ignores cell registration failures, so allocation
failures can leave a partially populated layout reported as successfully
registered. The OF node reference obtained for a rejected cell is also
leaked.

Return the registration error and release the node reference that was
not transferred to a cell.

Fixes: 7c8979b42b1a ("nvmem: u-boot-env: use nvmem_add_one_cell() nvmem subsystem helper")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/nvmem/layouts/u-boot-env.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/nvmem/layouts/u-boot-env.c b/drivers/nvmem/layouts/u-boot-env.c
index f1fb206846ff..83c687e43e5a 100644
--- a/drivers/nvmem/layouts/u-boot-env.c
+++ b/drivers/nvmem/layouts/u-boot-env.c
@@ -55,6 +55,7 @@ static int u_boot_env_parse_cells(struct device *dev, struct nvmem_device *nvmem
 {
 	char *data = buf + data_offset;
 	char *var, *value, *eq;
+	int ret;
 
 	for (var = data;
 	     var < data + data_len && *var;
@@ -79,10 +80,12 @@ static int u_boot_env_parse_cells(struct device *dev, struct nvmem_device *nvmem
 			info.read_post_process = u_boot_env_read_post_process_ethaddr;
 		}
 
-		if (layout)
-			nvmem_layout_add_cell(layout, &info);
-		else
-			nvmem_add_one_cell(nvmem, &info);
+		ret = layout ? nvmem_layout_add_cell(layout, &info) :
+			       nvmem_add_one_cell(nvmem, &info);
+		if (ret) {
+			of_node_put(info.np);
+			return ret;
+		}
 	}
 
 	return 0;

-- 
2.53.0

