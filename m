Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781964;
	b=fP/aZWRAwwe8Gzg4lXrbqFo3yLjhBTPx0c/oIzl4RT/j6DHpkCXt6mxTyHbDLpLXFXrr
	 PGIOBO6KXMXpArZhi/61M2/T+W9/fs41R+WMrcSvE82mBFCiVJ+/eBRW/0GEdZB9fDURT
	 KwSWXtQTehW0Y3hzLjq3i5q20mvq1dII0IFQCO9DVb6Pe6/RY+BQbiZGM+KmHVuzBDj3G
	 ScgGkVgEdqGSgw9vKUv5xk4PLJs2a1uCvxFReiLOpHs/xGWfVy9/ul36ebJrTzL1rr5fW
	 9I4FuTZx22R4PQcJHmBgtmSkE9Jo+Pyj1Lq1IfoMXFpvymcCx6QBIbUc9Mak/Qc26qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781964;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TAUyWjx3s0iBrLHwbOuKPkGMyzRErvYGRD/IpYm7O+8=;
	b=s8Dgdlz0VGR5vA9tUzjt3scemw8+fm3Dr4ezdczoDXmJLumCk/1wb9WFYWj33Mbprvrj
	 sOdkPzbPaI/j0/dMk+iJOAA+OEHgG44JCx2f8NrYVhXwTCsfOt2Ttq59xFOzjphys7Kv8
	 pKwX4a1T/PTzVLrIySlaxpgEj7+6omDuuDpsUfb5g5IakQsaTWUIjFcSjkNatHeXP6Sbq
	 61H2H7PnCeQrhk4mbR5g3iSaXhSIze9Y9Ao316qEMGGfC8djzHbVxldEz+EHZJC8PhTzg
	 vqXBZmZieESnIncpU2Na2Kct3WU4pjT4nS2H+xy/hWCOcbyg+k+V/oQaH990PYFZKCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Dbs8B15w;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B74606C6C6
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:19:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9B74606C6C6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Dbs8B15w
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso57639155e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781961; x=1796386761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TAUyWjx3s0iBrLHwbOuKPkGMyzRErvYGRD/IpYm7O+8=;
        b=Dbs8B15wDQXL/Q+K8BykZJHcbFbvg3b30M+fsU/e9aYvv1qvCjPAJVtcmwcgsUBmkt
         UOBZmmcytY+/yY31YseBCFY33BhBHE2iFQ0NR5Q8q5wkk9O8ToDSFTdPz0yS353J0Xss
         qYGzL25GQ6NC76NdGdbi4clxc3n9t4HQR4Nsj37K/frX/pBRn3TBfTUlwMq5oO8w7AfG
         fwz2ny+xEoAgkO9IVsc43XvF63xyBSbEy5+4iTWHG42c87k71Mnd1artF/HyCdOPsiNf
         rzuukal00S+xnXTK06V2gWj6i6lo+iF0bnJmCnWq1kV+hEOiGuUP/0eA8NQQ/dz9OUEv
         rs7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781961; x=1796386761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TAUyWjx3s0iBrLHwbOuKPkGMyzRErvYGRD/IpYm7O+8=;
        b=QsJcrg4Y+TA1onNBuUteLcoWOnZI5zRyD4H5bF2FGvCGbCpZY7QpDDp4gKdO0UAOFS
         lh89GtsaTlrurFkhs6QY2QxZORP/xr8ZLsPxSMkNvC1LkNgJA5b6eJpLuUQ3jMNb9hvw
         5qD2Asu0IMepslU2aoyJKaEeJdWVmSDuSVfgXS4s0kQWe0qTNLrzKLsrbPaTfbeR+aHP
         gDWfeIycMZkSOwou0aEal904jL3a6Kyu1qWKCNNxmBotI6cWxNoQKv4dgREJTuGwVcIT
         0gosNw2QxnCl8XfhdOE4wSnxpu7+u7n1mcaIvOoYgQ7CNiTjyffvbWkakwRkzwthli7S
         Xdhg==
X-Forwarded-Encrypted: i=1; AL+hErFnexmDSsrwv4VrUHS/66ejyGKWq7IRlgmJMbzRKQxlxbsjUtQZGJLOmvPhsQTd+XlWqtmdHNfxZSZSOGM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZsI7/cKkwXDygM1SGN5Gp/vBDfr3nVzR6Ss3PUgTHgAIei8sm
	4fJu/v1qgMM7fR5ePqkh6svAvioebnQTaNAhvyNT/VGLWmve3DiHBsF+lklCdX9ABIQ=
X-Gm-Gg: AZFdTZdOKywpH08GpfELLG/R64adx/WGP8TQPfuCe6Gyfeq0vWn+vdl0X+K44l81VFT
	huT/oi6egklxSH3qFFKiDG0pd/FVT7vLSPGEWDwqOZCN2tPA+v7mNHsrczIKuCyc8p2rhZ6q9Qw
	1WU/hDXLaiHm/le/IeioOlvSxtuV4TXuNx/CXrD7uMVd8ACK4xRfleWG6jM4faoQapK16gwJPFw
	XCfqPNBQh6eV/W/rkt0Fykd11wsJK/aIo6sMtwTeGDyz0ml2TMbS8XhRBrvdMhJQNa3a8cSz3o2
	RV6sna+DHsibzhc8NAiVF+j4ca7InzS+hCTyh0c6PxylWuWY6veOpA4e2e96IXyifCmhQttZmp/
	xU6BTw2yP3gLe2i+yKmhg0sManiTzzHjPW1sIxuFAOrXJcI6DPPF8pG55I+AWCsRheGkK+NUrq3
	reIUbVFM220fmOXsf1Rx1hP9weY+u4R6Hyf+FCrvk7WdVyJM9wQXKYfzns9QVlU4/sbIEzBVGVn
	I8jOvVYr1d+nlq8XIat8Nl3XyGWuFny7hyPzAUWULKxFkdwtxd01CcpBtxqdpOettHIhmKaRcqB
	n8oVfOkhdcpcoreCEyuFKKLmMZCpNWUNTRUcl7dwxFQmet0iTA==
X-Received: by 2002:a05:600c:4e0d:b0:4bb:69b2:d3b3 with SMTP id 5b1f17b1804b1-4bb8881eea5mr489175485e9.27.1795781961245;
        Fri, 27 Nov 2026 04:19:21 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90655f5asm451150685e9.1.2026.11.27.04.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:19:20 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v4 27/28] ARM: dts: broadcom: Set the DMA flags of the HDMI audio channel on BCM283x
Date: Fri, 27 Nov 2026 13:22:17 +0100
Message-ID: <20261127122236.4976-28-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261127122236.4976-1-andrea.porta@suse.com>
References: <20261127122236.4976-1-andrea.porta@suse.com>
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

The upper bits of the DMA specifier of the BCM2835 DMA controller carry
per-channel flags, which nothing uses in the upstream device trees so
far.

Request wide (128-bit) source reads and skip waiting for the AXI write
responses on the HDMI audio channel of BCM283x, as done for years by the
downstream Raspberry Pi device trees. This reduces the bus traffic
needed to feed the MAI FIFO.

BCM2711 is left alone: the downstream device trees route its HDMI audio
through the 40-bit channels, so there is no established set of flags for
its legacy channels.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm/boot/dts/broadcom/bcm2835-common.dtsi | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi b/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
index 39eea8ce1058..77c7c13014d2 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
@@ -4,6 +4,8 @@
  * bcm2835, bcm2836 and bcm2837 implementations.
  */
 
+#include <dt-bindings/dma/brcm,bcm2835-dma.h>
+
 / {
 	interrupt-parent = <&intc>;
 
@@ -130,7 +132,8 @@ hdmi: hdmi@7e902000 {
 			clocks = <&clocks BCM2835_PLLH_PIX>,
 				 <&clocks BCM2835_CLOCK_HSM>;
 			clock-names = "pixel", "hdmi";
-			dmas = <&dma 17>;
+			dmas = <&dma (17 | BCM2835_DMA_FLAG_NO_WAIT_RESP |
+				      BCM2835_DMA_FLAG_WIDE_SOURCE)>;
 			dma-names = "audio-rx";
 			status = "disabled";
 		};
-- 
2.51.0

