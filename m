Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795565206;
	b=oCo6ZzDz5to4KZXOt5jjzRnkzHk1AMoc/6VgAEG9RVE2EUJmsLd7W2pUhsVInqeOvnOA
	 DjFRt6593alDCDV/rzGbYTnI5Ky+0OpT78ZNJr4ly2d/pkcAGWM15SBVAAz1wySIbS7+m
	 A8K5lUhNq/5xMlaf1KN81j0IRW9lsXxE12ukRrXl0hv5wG3HrlGb7NVWVWgUbpBl1x9+X
	 dGOYIIxUZmjw9JXgYWAzLOeRfUP7tTaxUY6gL4WrXjduzOzAXwLaLhEfIUPk2wb+8hPt9
	 RSkPvOnfGPWc+wao1mPllSqqEr9ZbpoXJKGmAnaQAWDmaXDRtrmjGG4U8TWXyJ71uWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795565206;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Q+Bz0VKoiK6RD2cJswo+cvuH31ipsGl+WNFDwagvNvA=;
	b=sq4CL0IyOSUo1S8HR57HOOkaR832+9smCcy+Lu5J3MqsoWwKBh/gd3OickFBICsT5xLf
	 +aGxuOINvcHRU7A2kqcsUCswJyf8gJwwJaFa6rLNaJe6yq2mNttSbPj2z9ZmeTITH5bFx
	 VaAzVuxY2wDBkvJbxIVzOVFuLC7l6TnBFpjkVrlmDpWLZUV4PaDIbpxyRdQPBbg/D2FsT
	 Hf1YBPaGZykVaLXNxImcbAo/n/pT4Qm2/Keat388fJaHMAiYT8m11ouTS5uBj5zOe7oa7
	 R7ht2Zo8sxwGXlHfcRGIXNCP8YFQSEGexUhrOtcC/4lXpSetdquhkvoDGdtaukGPgQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="TXyC/36H";
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23962606A680
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:06:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23962606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=TXyC/36H
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-386ab9ab619so5828617eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795565205; x=1796170005; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q+Bz0VKoiK6RD2cJswo+cvuH31ipsGl+WNFDwagvNvA=;
        b=TXyC/36HfrOvLWoyI8DqOI7OLOp3GQOBIz3kN6GF1wGrkIdv3iBBhqcHBRmcl6G4Ps
         LhZ+8mBlicdnwE820z2jq1yHE7ngXWdAY2YvDUo0+cV3l3MSa7TksytvkiDH5uLp+0ll
         nsWBisS3ZIeC8hqIRaAcFhhA8RMXWRdSuZ2Gw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795565205; x=1796170005;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q+Bz0VKoiK6RD2cJswo+cvuH31ipsGl+WNFDwagvNvA=;
        b=iervSUahDsOfPlbajtrgX4EQQ9FJGav+eZawtLPH1+9J3c9edoVU5I5zYjja5WNiqW
         mfY+hiP32VHjkCPE237NJhtsB/pYI1E4NfdgrRct42rkGGorZZr22wkCru4ITyP8tUXD
         jfQVYFLJrcrsSLJbnlzKWFd1MOF3TdSYwLVODWN0j5vYN/1vIFyCaB3H7yc9xGQKsQbS
         hii/XodGZVXlTkAt3a/gaQo0cEao2KDwTSliM6CFkleDN1uWyapbqb7zpOQpnkaySONi
         8PQPgRcoWcEcG0r8Mw0u9Fg53VSWD3Nc/F1AVb2RnsjXgQ1b/LSp1H2lJTBCq/zSJXCZ
         TiTw==
X-Forwarded-Encrypted: i=1; AL+hErG0sgZPF5YDmIHcW9G2u5dBdnAM+iEks7QfzNMhPYE3DpqWSbsoG/CUEok1ATHigLzucgySbsn1O3x1bMk=@vger.kernel.org
X-Gm-Message-State: APuU4Z96JBfXwrqU1GMLvzbgyDx0yJw8Q28Ud+alwZ9lzAwx8MaCE9Rb
	d9Dm6S9Ymb/XqE0mNj1CqdVtdM2aJcsrhbpTdOpqsiBeLL9hWGoC/dLc+MVadxy3mA==
X-Gm-Gg: AZFdTZc+wzTWGoXU4hJDFcrfkBdfclOXljkYbToPrusrKM2WWHlZtkIvYIPOLiSvfYP
	UVGr1JbHmkIMuPfY9UyV33EOlyRPBtWranVLbJnywBMTLfDmR4iZcK3UBWC9blbmVUsfEc0R/b7
	FklJhxjS+gkeFoo39XUE9BfzIoRFX9VZOHh5n8KvVWY54b3AXu1plzT6jfNVcDuYi/CWvksMYa1
	a97t1gc6Pv1ssDIp/fc2wRQrFQrG7okpUsE1hb2rQPT3dSF6xhWK4/KNg/sRhH5bNVNTkw2POEO
	Hg3Zlwsn0pDqpppof6Wmm8pXe0+eexjALN+CFVd2uJM0JXTj8ZhDlaXsG3wD9BRoBKTk2hfgdRg
	PBsXknmDg6AYpARFplTUikrjavBKsBoMiH9CVccy0sed0/UcoMMvBS5NN9oNKv2PVN2TBkMgCC4
	cjjWdK+Ha64MfCPqbar9zZxNbSaf7+QeujlOZM4l96x/C+TMJQsLUKOm0wcofID0nTJkQ8ca025
	ostmQEkIcRaYmiJJwJasxiJRxqcd7ux9STU1Y4UY2lNQ8DLKT7eK84CoXk6PyW7ZtrRC2qvZ8xs
	81BoLKH4QyHk82gTZKC45phTedxIfp8Qk/rHROnesqpqVnWktjoEQ7+RDlqYXMinKeXOYmDe7GJ
	54GCuE/J/cRiP1w==
X-Received: by 2002:a05:7301:4201:b0:385:b8f4:755d with SMTP id 5a478bee46e88-385b8f47ad3mr16518134eec.20.1795565205307;
        Tue, 24 Nov 2026 16:06:45 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:ea9b:d8a3:ba44:2d0a])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-385665f21aesm59676267eec.4.2026.11.24.16.06.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 16:06:44 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Radu Rendec <radu@rendec.net>,
	=?UTF-8?q?Jakub=20G=C5=82owacki?= <jglow@google.com>,
	linux-clk@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Mariano Marciello <mmarciello@google.com>,
	google-soc@lists.linux.dev,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v2 9/9] MAINTAINERS: Add entries for CPM drivers used on Tensor SoCs
Date: Tue, 24 Nov 2026 16:03:43 -0800
Message-ID: <20261124160343.v2.9.Ibb4a0adecf127291198c372da631ff62b483a795@changeid>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
In-Reply-To: <20261125000349.3385325-1-briannorris@chromium.org>
References: <20261125000349.3385325-1-briannorris@chromium.org>
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

The Google Tensor SoC known as Laguna introduces a variety of new
drivers, with Google-designed IP. Add entries to the GOOGLE TENSOR SoC
SUPPORT entry to cover the new drivers that interface with the Central
Power Manager (CPM).

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

(no changes since v1)

 MAINTAINERS | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 84b47bbc0d74..ae2b8e8e004d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11509,18 +11509,26 @@ C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 F:	Documentation/devicetree/bindings/mailbox/google,lga-mailbox-array.yaml
 F:	Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
+F:	Documentation/devicetree/bindings/power/google,*
 F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
 F:	arch/arm64/boot/dts/exynos/google/
 F:	arch/arm64/boot/dts/google/
+F:	drivers/clk/google/
 F:	drivers/clk/samsung/clk-gs101.c
+F:	drivers/irqchip/irq-google-*
 F:	drivers/mailbox/goog-mba*
 F:	drivers/phy/phy-google-usb.c
+F:	drivers/pmdomain/google/
+F:	drivers/reset/google/
+F:	drivers/soc/google/
 F:	drivers/soc/samsung/gs101-pmu.c
 F:	drivers/phy/samsung/phy-gs101-ufs.c
 F:	drivers/usb/dwc3/dwc3-google.c
-F:	include/dt-bindings/clock/google,gs101*
+F:	include/dt-bindings/clock/google,*
+F:	include/dt-bindings/power/google,*
 F:	include/linux/mailbox/goog-mba-message.h
+F:	include/soc/google/
 K:	[gG]oogle.?[tT]ensor
 
 GPD FAN DRIVER
-- 
2.56.1.831.g720f3f5937-goog

