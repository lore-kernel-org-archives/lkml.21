Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795035191;
	b=Vt2YwNqYROGtZaQIHqXFgY5n0nzX4KSLlymirGWD4AGJYE4ejY1nOdjnuwLeYKGuIgZy
	 VTDi1uFwBrScOkMvLwL+sfy1PjXND98iR5hZm7inbZe/BN680hKiLolFpZqipiokMj+zZ
	 1cH6uDORY4bt8xa08HcRReme2oLra7bDxAr4WbslMzdqkWHLO0m62Ou4Q3BIALP/luB1x
	 clFgXyLuHh5pS+fcTlIWeehSZ5Prkfb0EEeruSREpjG+xE7ajjtqfLRBTx0tzHh6wfXeK
	 JFytQhO8vPFWuxxQ1rHYNjyvVh8AlhMKc7aIbnBsfR3ZkJlW8vsxCfKa8+dWEUoO8Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795035191;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yM3BPJ8QKqRePbbotO/o8nLTIwSIfzAlG3YqharGRPA=;
	b=IbJBJOCDyP2ohNMlMEA0BiIMwRqGw6sB/mx+tQZ77ayCr7whrXuSrDYSEgK+nrO84223
	 pFIAKItZe+LHI38crCMhxeYJDrh9kHRBPBW4LnFVVMwE5gfCcmP0xvAWWzTtzIkzCkLW3
	 ver8snhQdQub3v6jWltWsEc08oRtQCXhHS8h+pbUVF1roOV36RhJi+FCk0T45bZoirjjx
	 nnQcz5nRkYuPLixYsKcMi8193AszvDglkyI3V95TUnKr8JyRvxwWaqM61VhGydgendZnL
	 ip8CZyShY+Dr3ViMrbI+QR+KdHOaAxkY8SFcsrqgQhguUGQveV+TJXOndMEWVTbzlyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="0YGOL0/h";
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40AFF60A260C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:53:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40AFF60A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0YGOL0/h
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c247f6687dcso222420566b.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795035189; x=1795639989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yM3BPJ8QKqRePbbotO/o8nLTIwSIfzAlG3YqharGRPA=;
        b=0YGOL0/hyy6+47TsMZ+kpoOWJcdMNz0GQ5f6BO1ey+aUmPaC7C71wt2b8RcN4Npjpt
         ZZBnKB0GopgEbcVVyhxPsQdkIoxmT1KFZJ4Phbk9TfkdktIBirbceKHg97mcgujRhAB5
         9XTBHooBlgxF5Wew11cVQUHE8Hla1aNPc4Peiq6BKv3nUwdbxqjnV11oq0FG9syzUWzh
         +7JfH+eFSVVOemmQNNHUb/ulaN8WoGpGuhrjrpY+R0w4aElmtEQqoXcX2SKDk4L/eGOS
         1xR2eW/G8uFy7TstA8Fqx2tZvmS/ayRWdPAHIj2etOseL8xKMjKXkO9WQ+ii653YBZ1s
         xXgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795035189; x=1795639989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yM3BPJ8QKqRePbbotO/o8nLTIwSIfzAlG3YqharGRPA=;
        b=OwirQl/fS6VFfXiq8kDrwoX/TO5mN03md4rU02+UlgtFYMur3MvJJd6mhZLOKvJ9j3
         ghabMaFGY3VpHfSsUK8/fmuL3GqyrNXJHSdg34LX3Z5UMCuPpEdRFVzKsy1TqhNDqf3M
         JiZzUeBDt9kh1GJqAU234VYhyGxe1jP0hR2zIAgPOYKrseMP0XdZ/2clR3pDLmfdl1ZM
         839GC+gcuNzO3CkBI1Xq8z5X+0Wq2w7Pi8Hv/rc8fC9iEZGoDXuassCIYIpPXSVGvVoZ
         G4ZgsVfMyMmKs41IGpxVAmHGUOG1c6uLxoX/0ARrQl+mg5k3qXiDBwF+DH5T4sPn3DWT
         smhw==
X-Forwarded-Encrypted: i=1; AL+hErE07YtS9KKDAzTVeww2aHe9OAo/x+Y/AHQiux4l0yCjeEdEwwrJGWtiukCiOHk/qpAz8yvti0SJAJz7f7Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ak6CE24MLxJ7xZMo3ln2sebYsmgIizRtx3ykAdS0Vbbg/CZ/R
	zbgQGTH8Jg6U0Urm6SgJTZdI6S34ozsMy0br+ym89HL5eZhqltxdp0eA
X-Gm-Gg: AYBFou2tnvY3tXu88wmBAlVfBkoNYGgfOkCBX5a4blQXAvC4Nlh04cYNbQjl2OINIFZ
	98UVOkO7hicViiCAXozColVtRXzYMznTx+KoJF2zyJNQ5AAt1naOa+onJRmVoUkClZ2Q6Oy5Ssm
	+co3rtC1Jp27GtMGu1d8BG8YL1ySRcWVRCURlHCNHMotDpGS2hqNXfWsndoAaVIojgTzwoGAYEH
	FEGjscxDIiMMLiZDelyya8RcLJkSWaer7i0Ie/Y8vpDtnPyRby25YedKe4zq0pDHi940ebqhRQo
	qGLMaQCk95X5d6U/JO8GaITnerPDZyBSMV0GYuqEBZyKh6bUIdpujfAcSgFf1fluvK8jcbax+Cy
	T9L5A6ll9ct+nwxiUuDX6HqAsBLb3IraWGElkkmUd2oLzLBesAzxm1KdMzRBIGTUg0UX7E/vKGg
	BksFBb9GU+dXrR3+U845PNuzdob4qtLWtgmegdFdHlTiMQIydKRtWVmnrPD5rVmFflCiQdyDscx
	sGMFM7L9x4RakA5GLgOnxkwVd6Bf81D1+QmNoQwRJv7vaaqJ1tM6BqnZAc2NIs1RztCch5FeUky
	NChqN9g2nKTr8eAliyVEw2oGJD3es/LPZW8OTEM1z7fab8VPMpzHLI050CRDWg==
X-Received: by 2002:a17:906:9f8a:b0:c41:61b9:6ef6 with SMTP id a640c23a62f3a-c510e376c7dmr374133066b.27.1795035189529;
        Wed, 18 Nov 2026 12:53:09 -0800 (PST)
Received: from antoniarch (84-40-238-230.cgnat.inetia.pl. [84.40.238.230])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5123421612sm35303166b.41.2026.11.18.12.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:53:09 -0800 (PST)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: vigneshr@ti.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	jmkrzyszt@gmail.com,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	phasta@kernel.org
Cc: linux-omap@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH v2 3/4] i2c: omap: remove unused is_rdr and is_xdr function arguments
Date: Wed, 18 Nov 2026 21:52:06 +0100
Message-ID: <20261118205213.88778-4-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118205213.88778-1-apokusinski01@gmail.com>
References: <20261118205213.88778-1-apokusinski01@gmail.com>
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

Both functions omap_i2c_{receive|transmit}_data() have unused arguments
is_{r|x}dr which can be deleted.

Signed-off-by: Antoni Pokusinski <apokusinski01@gmail.com>
---
 drivers/i2c/busses/i2c-omap.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
index f02d294db42a..3f7060d57a86 100644
--- a/drivers/i2c/busses/i2c-omap.c
+++ b/drivers/i2c/busses/i2c-omap.c
@@ -996,8 +996,7 @@ static int errata_omap3_i462(struct omap_i2c_dev *omap)
 	return 0;
 }
 
-static void omap_i2c_receive_data(struct omap_i2c_dev *omap, u8 num_bytes,
-		bool is_rdr)
+static void omap_i2c_receive_data(struct omap_i2c_dev *omap, u8 num_bytes)
 {
 	u16		w;
 
@@ -1017,8 +1016,7 @@ static void omap_i2c_receive_data(struct omap_i2c_dev *omap, u8 num_bytes,
 	}
 }
 
-static int omap_i2c_transmit_data(struct omap_i2c_dev *omap, u8 num_bytes,
-		bool is_xdr)
+static int omap_i2c_transmit_data(struct omap_i2c_dev *omap, u8 num_bytes)
 {
 	u16		w;
 
@@ -1122,7 +1120,7 @@ static int omap_i2c_xfer_data(struct omap_i2c_dev *omap)
 					OMAP_I2C_BUFSTAT_REG) >> 8) & 0x3F;
 			}
 
-			omap_i2c_receive_data(omap, num_bytes, true);
+			omap_i2c_receive_data(omap, num_bytes);
 			omap_i2c_ack_stat(omap, OMAP_I2C_STAT_RDR);
 			continue;
 		}
@@ -1133,7 +1131,7 @@ static int omap_i2c_xfer_data(struct omap_i2c_dev *omap)
 			if (omap->threshold)
 				num_bytes = omap->threshold;
 
-			omap_i2c_receive_data(omap, num_bytes, false);
+			omap_i2c_receive_data(omap, num_bytes);
 			omap_i2c_ack_stat(omap, OMAP_I2C_STAT_RRDY);
 			continue;
 		}
@@ -1145,7 +1143,7 @@ static int omap_i2c_xfer_data(struct omap_i2c_dev *omap)
 			if (omap->fifo_size)
 				num_bytes = omap->buf_len;
 
-			ret = omap_i2c_transmit_data(omap, num_bytes, true);
+			ret = omap_i2c_transmit_data(omap, num_bytes);
 			if (ret < 0)
 				break;
 
@@ -1160,7 +1158,7 @@ static int omap_i2c_xfer_data(struct omap_i2c_dev *omap)
 			if (omap->threshold)
 				num_bytes = omap->threshold;
 
-			ret = omap_i2c_transmit_data(omap, num_bytes, false);
+			ret = omap_i2c_transmit_data(omap, num_bytes);
 			if (ret < 0)
 				break;
 
-- 
2.56.1

