Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795341155;
	b=snIHwEwbKJJyPwXKVMTvDsFw4N641CHAMXcwnZzyFrGv856ru0/tYHpJ5wr+4lDjXR6u
	 f2R5BsTiX0q+BDvs5UzAqXzOx4OasIuS/FVE48DTbIM/1VvjoqAYX1zmdS3By76mBzerl
	 R1/g4OCDnql7bscXA2BS48uxJdj+KgiBrNhM/tPc3OrJSmRURTa7nuKkg/CuCICKSUVz4
	 0wPhsY4rwxzgq5JQMsois1lXVyNsh0QltkT5YTtkyOZEoBzSmr3ikw1C7MrqSxGh4VbC0
	 eN/wwUc3totDemILF/OTMXBED0FSW9i/qTn72h3Tz3YIkc+XOlh19iwrJza3Dt4/6tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795341155;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yUikuj1FyLUCHY3Zwx8GuKGSSsj8GL2KV6hgZCKg5AY=;
	b=ugbo77mkPM0ZKeFSudc1eo5uEeS+R3lVTJhePLGpc/L23L3+C7dY01YPeIg94ghRvty0
	 39bqEK5tOQI6lPDZT9ti0GsngQcO+PiVHI97hT5eKxJQMjG3+TzUv+lVNAmsXLATJyEjg
	 62LxPOqPapj6bPfP4+euWmPcXdA+zWtbJvtdo5LdRz5NqT/JmJ+R4qjU2QJA9N7Pv2TGu
	 +U/8MscNLfxLXc+/Pkg9vzvb5dFpia6+aEv56wuxlojYsQC/rVUj2MR1eilbVlV6/SKGZ
	 s+E0iC9RcjqjCJNhQYJa1Qn3WXsL2H47HfAPjiZemIbDMErdv3gLUUwp1Cv2vgcUlIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E8NwQ8Fi;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4BE606A334
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 09:52:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD4BE606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E8NwQ8Fi
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b40470fdd8so1044730a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 01:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795341154; x=1795945954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yUikuj1FyLUCHY3Zwx8GuKGSSsj8GL2KV6hgZCKg5AY=;
        b=E8NwQ8Fi5brarFkGitZhc8iH7r45vLLYIwTM9DyYINAIo6knoOmb5W7E7hCtKZgnye
         ZgFZ7wDHB+ka0F8XU+UwJgv/cMN0P9/JUEZf8c7waa88M4FSVVWgBC7HHC1pPv6bOu4F
         BstKVbsOhOxl17ZQzEGWyskOhPzitNksUrqsV2hFdrfSPdfmPcDl+wVwZ19fLzzWh04t
         WZ2Q3kD0+LsolWTwsxENjlw/So8C9loCw6PyQKkUsKl7o6/fDgT46TZgDwiMvIldzYcQ
         THSfMqaxKytmAQ7tHtbiKMo9FQc2TjSWuTktBY3CbI4SGWRq8xkCli7hSi91vZQ1RGIY
         HDeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795341154; x=1795945954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yUikuj1FyLUCHY3Zwx8GuKGSSsj8GL2KV6hgZCKg5AY=;
        b=IksqyjLRFGGtbGqrHcxqAWUBJkIJCKvS4Km3nCDHbiBgOm9byhTbP5hEjy1CmVyf26
         KLkWOzpPwmSHZYF+19ubeR/dlRzt++FWOJrV/le5vYH85JF73CayEws7bHp+ZdckeUFe
         22VvTWQWCOiI3xOLWskBm//xOMFO2E85DfpwOF7TYh7efgtH83rgqWJsaPLxbSvExqTo
         tLUWSuHolSBOEQYGesDeb1X+S11RDxOonji7qvfAfMgvq0+sP2hPG9dE/SU3wOe8WKnQ
         3HJHNfLfmhngvnG/XWbEog5ogogotl6pV7R4UCv+lIJsueK3t8hGMTC4y7ED5FFDLttA
         SBPQ==
X-Forwarded-Encrypted: i=1; AL+hErF8TiP2ZqbNiYLP0g/WeUfbOSd89WzoQKJF3zdKIPZmxyIIKKDrA+HkrMvoPhVc6c0NZfBedt13Y0Q+niQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+e85gN21i4IjtxTYUg5XeHHXVhG8jHAUD5RytP6qP6oiifhlfX
	9vp47KqEhcdQNYt9QQQWjIcNAYPhDD39vXA0b1UIUd9Ud9MKSiGP39BA
X-Gm-Gg: AZFdTZehjoEUouBInFPNtvhhmhAyJnDHZ+cxsusDaZmasednmmTq1GN1jbrapqLIUD2
	Pa8PIycyVSWdid3RpxWMg8IKGSMHlQflbaGMJI4MPQqL6ZIg/P60hw6rkU2AHM0UnYYl1WZJLDL
	/kU5mzSv1WfQza7sdPQTQI2+TepY4QaeO2dwDiIA1vwRH9IA2tPRKPF03JMp6qw6jputqnINOmp
	8lwqBau8E9c3ZtuwGgDcLrHqRuYWcZK+L93PvE61sx0Q2JlBbhBsVw4HIWrQ889/yOmekIw3vZ3
	NHapk3tAryq2h9d8cTeRx7ExV7hcE5g0FQRfBXig0ebnmWt4DOUVpUKTdv8BrYSHeu+xFF/yYtJ
	f9aIzImD6uGjMkiM9gItATZlH2pM1LJ6mLLSyYOIvxPYtZfL0G7KLcyhrk+tIdL3gzq9lqwBVyW
	3b2+9tWW3UFU6IzPzcZTxESz21E59wMoOVbJ4AKWxv+y0Nwe9D9/wilDLXS6DbieXROswfAmXt2
	53xkwSR5+UhS0+70+R/e5A8sooJIJremzHjeqjMGEvrk+rUOjucvnqHyG356gSZoVGpxJRjm1Jx
	ylUgtACcxlMaQOmziSk85hz51omePLmmrIZ0YKPlPOB8BskTzDY=
X-Received: by 2002:a17:90b:3e48:b0:3ac:adce:60ad with SMTP id 98e67ed59e1d1-3b41c98a343mr6261954a91.22.1795341153927;
        Sun, 22 Nov 2026 01:52:33 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([134.82.71.171])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d028a54sm3289722a12.18.2026.11.22.01.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 01:52:33 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: florian.fainelli@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	robh@kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH 1/2] ARM: dts: bcm2835: replace deprecated LED fragment on Raspberry Pi Zero
Date: Sun, 22 Nov 2026 03:52:24 -0600
Message-ID: <20261122095225.200916-2-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261122095225.200916-1-artem122novak@gmail.com>
References: <20261122095225.200916-1-artem122novak@gmail.com>
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

Replace the deprecated LED fragment with a board-local gpio-leds
node, preserving the ACT LED GPIO assignment and configuration.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm2835-rpi-zero.dts | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm2835-rpi-zero.dts b/arch/arm/boot/dts/broadcom/bcm2835-rpi-zero.dts
index 539c19c10946..9364695055b4 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835-rpi-zero.dts
+++ b/arch/arm/boot/dts/broadcom/bcm2835-rpi-zero.dts
@@ -7,7 +7,6 @@
 #include "bcm2835.dtsi"
 #include "bcm2835-rpi.dtsi"
 #include "bcm2835-rpi-common.dtsi"
-#include "bcm283x-rpi-led-deprecated.dtsi"
 #include "bcm283x-rpi-usb-otg.dtsi"
 
 / {
@@ -101,8 +100,17 @@ &hdmi {
 	status = "okay";
 };
 
-&led_act {
-	gpios = <&gpio 47 GPIO_ACTIVE_HIGH>;
+/ {
+	leds {
+		compatible = "gpio-leds";
+
+		led-act {
+			label = "ACT";
+			gpios = <&gpio 47 GPIO_ACTIVE_HIGH>;
+			default-state = "keep";
+			linux,default-trigger = "heartbeat";
+		};
+	};
 };
 
 &sdhost {
-- 
2.56.1

