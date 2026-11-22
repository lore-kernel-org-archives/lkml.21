Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795366303;
	b=yhBrucGnNlgQV0CJus0t2C0b4EdgwWg7wFZz0E20pmaxX6lwohU/TtiDTlKic+RIDPyR
	 TfdIiaRztYnPxCGYS7ix0aIKNo5aCQSe5phv464c/ZmjOfZSI+JP0SQwhAAeiXB8w7qgC
	 MgAZC1rFH0w7Idh5R9rjGgExEGKqQ6ebfgBbs8fb9xMoad+07PFX/NtGp1dNlxmi/pYIx
	 r9E3+wfslRpz9VuMQxWUPPKZsdGqL1r/U0dhtT2njNy85dO+Rp9Z0c2F7U39kKIRZbw0A
	 KoFnY/sPWxF8ODmn2Z5zbaGEBUW/eOkAjYxHj3zELFPkLgIT5qVOHFUBNnnzM9qRUfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795366303;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=JhjjqIMQr865BkPmZwP0QzJcTeMGaFNRQc2pL8EXe1s=;
	b=zsVpdJPrAZDhLw9VMEstOfrOKTbJxhtHw3UKfbedkBlT4B+ldADS0NSHWOeOmTl7dzGh
	 MjnIkm9QwAuxXO2mahtky0WgrtzvQBOz6m5gnnUCoPjOSV5pIzQsmPT8QmtrLbQhr08so
	 Fi1zbI55M5FnUsWgloaF71uFZhU9UQQlv0VmVgB9N0rRJfttsJz3s7Moxwg82NBsCzrb+
	 TZXJRw5vF0cXTd8cvJc6KXVieiS+QrJXedqrc9G/E+cyts8Ea0XO1/poa+dGV2KwPkHLS
	 7riwo6GZjSdebDpexvU/1sExPxxfL9XkSZ9zaGj+hvhnS5ExxfxG6azYXd946adp0SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IahtZRV3;
	arc=none smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3C1606A6AC
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:51:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F3C1606A6AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IahtZRV3
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b4c685c751so21099317b3.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 08:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795366294; x=1795971094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JhjjqIMQr865BkPmZwP0QzJcTeMGaFNRQc2pL8EXe1s=;
        b=IahtZRV33PqJpuVZt0B6+SNbzh040ajlspyzCn6wQ9BvfNJoScC2Vn4Vn9AQXVsDLO
         s83NPg9YGQBLZO2VBbFJyh5boDqhdRZRwKhl72KZbaW6FnHcScN/RdrdCe8J2k/TSFZM
         1TK3icec0TcURw4ZuKYQSmIPnSKX9W/BFqwWGqyTf42+7nNJ8orK0rtotBGcIWjBED+a
         c9lqmhD+FJlsnNqQswgw4+e5OztqxJrfh+PRWRbVFj4m3zIQ/pRgOycoMCxhFR6B5/15
         Y9WuzIrfeqsK5rfRILtz8hugUhU3gz0a67oCML5LfNIW4d7uFlmRhrpB7Q1QzsPpAhU1
         motQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795366294; x=1795971094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JhjjqIMQr865BkPmZwP0QzJcTeMGaFNRQc2pL8EXe1s=;
        b=pOMoOb3OufqZNIo0eodGb2bN9JDJ6yGJJXbMibUt37DQIwcmb5E8gFULGIhLv3Zk0m
         yz7ZAkqqkdhpOe4a6QRofoOyUvYo3RYSDuKjiYt+aO3uFz5yBVuJhaq2fvw1Hc2Xk2Pg
         bWOWII6HfRHE0fL+Trsxgae07cJOihJzTO8dCQ4w+V42XKrXKMO2GkJTM+4BlTP2qmzR
         W6WNSnOQd5/SJxDAShU/A/hcRWlB4wTxJvEU33aSnwcQYnpXbrxEBgZcz9XU7RtN9CUv
         vFnX74bxbebJT31/PpFCM7G6YlmwvpTjNZ75QiqATPlSoL501Ib5KRbt942VZWQ2Y6l0
         lSow==
X-Gm-Message-State: APuU4Z8qAj3vLBSvSAmfC+P5mOke9oYE2GoJTO8k3wHCAcEx7RcC1sal
	JhEeDyqor4kOWnIvgmRGxDCFHg713mwHx9MvqmVxkJmkaPixbszWQKjskcK7jiwI
X-Gm-Gg: AZFdTZe7sUTFvxdKQt0VquVRy5PrMJeSSJ/CCyrU2g6tO7KVzRRGVTVBuR9g0yOZZY3
	a6ZfumzlKelrdxPuc6exMCJ+bWakMBVepmjPEflEUGl1VCxjKli72/FLLaaoWe48Ljg3VQqNz8/
	Y7u3MBW3yoQrDvzRG0Ncu9MAspSmaAaYkWEGP3lmbvMQ61jBKvNcS9VYfMWy/hhNxSP37rvHU80
	8POemxgYfwYaP9NEYoA6YRRbC16JeK+aDeAN3fyWHj2n96rk85aP3PuoUcDw+UluBzNH4StxfEN
	QKzcriEXfvLW1TVVgo0TuLwh67yWUjNm6y+/dwyz8nVDohVw0x2oOgioGjrmLaMUvq82k8MaFMb
	qSHDzXwh/H1DmJfIqPJISfiGV0Da5YVHOEDajYYW+aBi7fCn+XPl5pfYW7vBXypKU/IqtrGUbMn
	6n4H0p+ufjadTVMMI8FxVauRdb3l/iX7D+K8pXphMoYM4hyt1/ZnrKcLFAFn3rN8LQs//KX5/uY
	V3hK/Vlf/MnffNzzLA1jtfam8nAy42RRTZClnHcODylcTZh72yYlVlCFKBY06DY5ES+m/38rsZA
	JJkZaVdx6PsYJTCIdOMzDf/1gt0mJaEpUXRmlfogEQbCiSnS+G5mwGapkkpyXehqpvlIwP8/vuV
	J4gL7PK0FQPa2USF7qvdmTXMJjCWbg7CJKalpMnT5Q4RYPwrfXkVR8Y7XWG6vzDu4CuVmZCvP2I
	Wm55KZ7sBJ0+pzqmUHv3OVnhbbOoKqhnetIPfq0I3rpTTUGQ5XY95yTJ4CXU2AUdK3tR928w==
X-Received: by 2002:a05:690c:2a83:b0:8b3:5a91:61ce with SMTP id 00721157ae682-8b52031b979mr33704127b3.13.1795366294291;
        Sun, 22 Nov 2026 08:51:34 -0800 (PST)
Received: from localhost.localdomain (104-12-105-135.lightspeed.miamfl.sbcglobal.net. [104.12.105.135])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df33e01e1sm4360057d50.23.2026.11.22.08.51.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 08:51:33 -0800 (PST)
From: Jason Perlow <jperlow@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-bluetooth@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Paul Menzel <pmenzel@molgen.mpg.de>
Subject: [PATCH v2] Bluetooth: btbcm: Add entries for BCM4364B3 UART Bluetooth
Date: Sun, 22 Nov 2026 11:51:32 -0500
Message-ID: <20261122165132.14015-1-jperlow@gmail.com>
X-Mailer: git-send-email 2.50.1
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

The BCM4364B3 combo chip on Apple T2 Macs, e.g. the MacBookPro16,1, has a
UART Bluetooth controller that reports LMP subversion 0x3032 (001.016.050)
on some units and 0x305b (001.016.091) on others.  Neither has an entry in
bcm_uart_subver_table, so the controller is logged without a name:

  Bluetooth: hci0: BCM4364B3 Trinidad Olympic GEN (MFG)
  Bluetooth: hci0: BCM (001.016.091) build 0115

and the firmware lookup only tries the generic "brcm/BCM.hcd".

Add both subversions so the controller is named and its firmware is looked
up as "brcm/BCM4364B3.hcd" first.  Tested on two MacBookPro16,1 with a
v7.4-rc3 based kernel carrying an equivalent change, one reporting 0x3032
and one reporting 0x305b.  They now log:

  Bluetooth: hci0: BCM4364B3 (001.016.050) build 0082
  Bluetooth: hci0: BCM4364B3 (001.016.091) build 0115

No functional change is claimed: the controller initialises without these
entries; they name it and make the firmware lookup try brcm/BCM4364B3.hcd
first.

Signed-off-by: Jason Perlow <jperlow@gmail.com>
Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
---
Changes in v2:
- sort the new entries by subversion, between 0x2128 and 0x4119 (Paul Menzel)
- say in the commit message that no functional change is claimed (Paul Menzel)
- add Reviewed-by from Paul Menzel
 drivers/bluetooth/btbcm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bluetooth/btbcm.c b/drivers/bluetooth/btbcm.c
index 065536d4ec76..def0853fd8ea 100644
--- a/drivers/bluetooth/btbcm.c
+++ b/drivers/bluetooth/btbcm.c
@@ -518,6 +518,8 @@ static const struct bcm_subver_table bcm_uart_subver_table[] = {
 	{ 0x410c, "BCM43430B0"	},	/* 002.001.012 */
 	{ 0x2119, "BCM4373A0"	},	/* 001.001.025 */
 	{ 0x2128, "BCM4384A0"	},	/* 001.001.040 */
+	{ 0x3032, "BCM4364B3"	},	/* 001.016.050 */
+	{ 0x305b, "BCM4364B3"	},	/* 001.016.091 */
 	{ 0x4119, "BCM4384B0"	},	/* 002.001.025 */
 	{ }
 };
-- 
2.50.1
