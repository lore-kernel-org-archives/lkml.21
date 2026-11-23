Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463389;
	b=LoVRUnKICV73lIc3lVprXtXaMr9h7VADU2WIBAzCiTkMm492BOwO2T/6/0FduGaeUaBx
	 B/bxKNDuBg7yFsZGUReGJqF5KoIAvCyDKYzE1zabapuWSOc5rVGI3313/8Fpj0Z6hN146
	 eqqnO4MJ8lbVtMWPR4aMoUqQsunjpkIzn6hhSWgVU1iTeMdvk34KLtCPVuagRy0XU6lLT
	 n7Cnxyo36EzbQUJauAQv2ht4Y2wRVZH6YeGayGAePcUek2phN2bdfe2YtQJspta20Vors
	 gEGI6NcxBow46TV/SZgjE3ymN+4Q6/do1ExieWRC3CRwGk4EBgZgQOPfKQeZ4nak0aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RqmWJ7RMrhg2L/ifDvxPzp+3Jv7BCZkcuD44+ncjgs0=;
	b=TmCqZLo/rZGnPeSEjtPvMoBi/uWDX6CR8vYkBml0mKeRgxuHIH1u6UDD4XEROElE1RC6
	 dj9vU5Ydv9JkA0M7lpeZbUM+RcrsfHqocnJiJbp9jdrAGhUrfIRF1BWVdFWnBHMH0HjNX
	 Yf7l4HcuWW2BMMNUgLdZ8keri7oVuJtwYaOuqLtk0dYVtnm7MU4EhYcGeW05lGHDtmwVT
	 Dfs/1rGo/9HP6R0t2aBMy9ze2mf6pB1cAEehOhIJ79mLPBY9Ud1igrjqIz0LoohktDsI+
	 dp9tON+ricXbsmbc8X/RrwkXpbpBlc9u314X4aNDvLpx0syRvx2C0rTz9vt6RPCzqCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Fs748zbE;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84D5606A68F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:49:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B84D5606A68F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Fs748zbE
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb61185057so24598385e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795463387; x=1796068187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RqmWJ7RMrhg2L/ifDvxPzp+3Jv7BCZkcuD44+ncjgs0=;
        b=Fs748zbET1THbOfoMjkEdSA5V7vC/RvF8EUIZhgsRjporPgwNnL/aD1TxSXU1pPmx/
         yH7vZ0bgisW6qAkhp4Qu13rjKYcbVRFLr+YTZJe7PQ1Ly2oJ27XiO0wAhs697KIfsox0
         SQzndo3SGVN4T3/oqz4S67pIusuUMQWtAXUmcZwNA8wI4fSQyI4QRM6OYwEy+zpe7ABp
         ZKhKVT3uWAac6O7dVE3iDndYOfdYO0wkIP0az311xwhokidN19OFvV8uogeiGyJLtqXo
         2CyZlzvxaoBYkmgZZ0Z4Wo5/RGuerL4PFAWpjor38w+zIM1v1wjKx/gJ970AcNHEIvsJ
         h/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463387; x=1796068187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RqmWJ7RMrhg2L/ifDvxPzp+3Jv7BCZkcuD44+ncjgs0=;
        b=eRttXUEVBja930nwiOHLTnutIfDkK1yzLgT0K1FEsZu5vHpc+dD5v51SULJZQ4oLxw
         nART4CT6G/R8V6qLRcXYMI1/VUDErAYoMoqs++3xTrzVgYJAznL61oebxhvT7DOCQ1ep
         tW2ZKl3MY3K06EsghugHzFng1ZfbbSVFiqMBGPJ1r5JE1fcYFdCYYobRyQ0u6vtpdrDS
         qzpGMNCXuOLI4LbxTXz2/6xvRqDK0L8N2I8r5KSmPgNwWSLJ1cmQ/CZWhOD2CRafigl2
         Etj+qig3HqAOyV7P3iR89uE1K2UaVlK3oJpSZwRqQouJOMBcMMnc7nF0i/JKn/YQIYWM
         9e/Q==
X-Forwarded-Encrypted: i=1; AL+hErG0smv7I8tnak86BcAKXBFyXJ8VC/XuxxdZpnuo7jIzAHwm+k1lE2lq1b6jsD7l+vYVKLd9MNXDoS77iFI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/K4QKREcIYF5dXO+qsi5pPSmO+LQYI4w7CdmpFYS+Po6OuvfZn
	o+41B0SAvM/UbRmR69vuE2ubjUByNmeWtgQhXXRlCp+K9hJcu0vpHOCmtSzCmGd2lTgQMjBOI9C
	YUJi1+f0ebw==
X-Gm-Gg: AZFdTZeJTpYwCxBbkJfAHGjsVpZSNWzVJpzljdKulR2DC6xiLRHUsEWrapmha7qPiJf
	3JfmhGWF/AzsL2ISm4hqNq6q+aXxJeNQNRsRzYKxOtKF2vWEms+jzd2gpIK5XdA19wefQS86FAS
	s5auKVcUDUcKtVo5Sba5GCE7pjub9rVOh5Xf0a5GGCNDACo2IiqwsTyw9QSJF0y/vtkVSFZUq4M
	+1NI92mtHzXTQUl+zvxaDjehfJB6Uzh3FUjGNfQwMzWG8wmIUtKH6kmb9C+3CaPjbpxUiLCdUcv
	7fgwbiLBw6TnsmhzBefnRhgHzGAJQF1Pxz8cRuEI1MKM2wb4y5Epq6Z2tDQykbBK15RJyON+ltl
	r1fljyc0v6/f532JYgoiXPqBa/KRJdgn5CeY1zmPcYwSFmiziW0p8jUJlRGrEVNJKkcMQorNPBr
	VRieQwQSID4/bt3X27MQX16y8BSIKtjHAjOVFe+3hJZLjKNjjGgBxRGxniTzNbSaRkSJntJ6KIJ
	+JpnDwI2OUTpQS4EbKGvyFfSl8fhvq+YGI1IoWbHbBtQhzHCEpGqoo4L2hiHG9SnITCK8NehZU/
	LaEcnha1ACGAl/eWhk7M2NZJk/XH79XRe1CrEi/h0tyN5TLMk1Ld5FH2BTQUvUxcsp/KG61y2xU
	7Zy2Ghw2d/CI=
X-Received: by 2002:a05:600c:8210:b0:4bb:6a2d:b438 with SMTP id 5b1f17b1804b1-4bb88786c81mr256282695e9.0.1795463387295;
        Mon, 23 Nov 2026 11:49:47 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm300924125e9.2.2026.11.23.11.49.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 11:49:47 -0800 (PST)
From: Gerard Marull-Paretas <gerard@teslabs.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Frank Li <Frank.li@nxp.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] iio: magnetometer: mmc5633: Reference the datasheet for the SET/RESET wait
Date: Mon, 23 Nov 2026 20:49:41 +0100
Message-ID: <20261123194943.57601-3-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261123194943.57601-1-gerard@teslabs.com>
References: <20261123194943.57601-1-gerard@teslabs.com>
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

Name the datasheet parameter the 1 ms wait after a SET or RESET comes
from, tSR in the Operating Timing Diagram table.

Signed-off-by: Gerard Marull-Paretas <gerard@teslabs.com>
---
 drivers/iio/magnetometer/mmc5633.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iio/magnetometer/mmc5633.c b/drivers/iio/magnetometer/mmc5633.c
index b651f01e1b5d..5871007eeba6 100644
--- a/drivers/iio/magnetometer/mmc5633.c
+++ b/drivers/iio/magnetometer/mmc5633.c
@@ -63,6 +63,7 @@
 
 #define MMC5633_CTRL1_BW_MASK		GENMASK(1, 0)
 
+/* tSR: minimum time between SET or RESET and other operations */
 #define MMC5633_WAIT_SET_RESET_US	(1 * USEC_PER_MSEC)
 
 #define MMC5633_HDR_CTRL0_MEAS_M	0x01
-- 
2.45.2

