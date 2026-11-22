Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=149.28.215.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795327299;
	b=GXZzmMoa/JUFEL/YJbAYILYziztjjGYr0cnHpetB7n0CIrqWch5+mq1RhFjwOQHFSAe7
	 YPWVdczTGolkIrMmz3YKGbi1vsFh0Y9DWMuaivfH1x8MvLDw1oQ4embNLeO6ljSppKWOj
	 Vqa/esN/DYlDRgznnXkNuc2zSDYmDcAh1m8l+NKWpDtQgboTk48qMn/bx28UneXjS+6Zb
	 Z9PyDpYLg7sG35I1+KfZcVe2ksWftmpLDdnOShBWlYDVuNDmYm9eLCbhElOKuKesalKbu
	 UKAutd1kvD3+Ms27fw9WDW8Siu3z94jtyrjbOM2+IglnB35uKu56RySy68bg9U9Vd4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795327299;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:CFBL-Feedback-ID:
	 CFBL-Address:X-Forward-Email-ID:X-Forward-Email-Sender:
	 X-Forward-Email-Version:X-Forward-Email-Website:X-Complaints-To:
	 X-Report-Abuse:X-Report-Abuse-To:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mvFMSyXFOSysPNdARIv1HJbtMVR+EVgPLL6sz3uFyx0=;
	b=3x18J0G7XiP/pV8egxrTks7Qnn0sHmFj+VbHpFULbsM9cgQadN3uRZ9g8wZKIfKe+rag
	 nOynpwRaV9c6SIF67zBMc9i01gzZJY0nIGDXU8ov6IeeU87+c5Xht5wCPxTIZcgcUS/dc
	 RYW9nGp9Zdhz7LMn3ZXJDSOzyNje/iItx9tA95kgQ0BVael5y7ngqjKXHgF+2VXxvMyz5
	 WEIAu09u6hg+bDxFqx/NpQdzBfHObmvcuZ+DuTPQpVkBjwJmACu0ZOM96nasw4pPIK6vv
	 /GcDNYa8rZoesAxX/1g2QOk33VDGMPWHSHIhGZ1IsZvlHcXIg4FSgaep5wjmeuXfVAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kwiboo.se;
	spf=pass smtp.mailfrom=fe-bounces.kwiboo.se;
	dkim=pass header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=XOelcM+O;
	dkim=pass header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=WnheHo3X;
	arc=none smtp.remote-ip=149.28.215.223
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5B460A2603
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 06:01:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C5B460A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=XOelcM+O;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=WnheHo3X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=fe-e1b5cab7be; t=1795327292;
 bh=mvFMSyXFOSysPNdARIv1HJbtMVR+EVgPLL6sz3uFyx0=;
 b=XOelcM+O/C7dW0L6Y8nLE+StOFwzbQ4/X0BtWqz7WTCcBU3KM1RTMer0uGObStryD/QteAp3Q
 XmTCMVtbTx0OHHD1qV6e/QMd+GNSymagA5OHtsqzgELWtYgdGXsUXT23T67oZixVDMJkGdX6YZo
 1sABhozX6/l19Gl3vv/EYjh0g+/LZrtFnuL7uTVM2yu84Rbu7CRcWPmGaXFzdY2diT/RJ7sNPgL
 RP2oOIazxIVcKx8yaBhnQtVkuati7I0DfOaVm7yBQ/vvRjmczJsSEIf+cJWZbZIkRu2qDAyZxHB
 ML5aqM7Ul1ag/mu//vGa8tDpwbe7XlvjxawalpB7G4IA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=default; t=1795327292;
 bh=mvFMSyXFOSysPNdARIv1HJbtMVR+EVgPLL6sz3uFyx0=;
 b=WnheHo3X0HojAsWTD7r1ag7LPiEteDaDaBWfH5pmldNjNFVnuMifl70dKvz0XbWB1ueHEjVy3
 +fmNV5lgTa+nx5SsCUK03nLy/j/XKfGeZUOqrug96H6QkM6RB9/ieEXG/SfUdAQNS3kxl1Hr6Hg
 ezK2KbaaPo+LQnkledm96Ro=
CFBL-Feedback-ID: 6b028536cff95ecda8c09374:9101f6a6405eef24968ec9d89ff35255
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6b028536cff95ecda8c09374
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.19.37
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v2 3/8] dt-bindings: arm: rockchip: Add Luckfox Lyra and Lyra Plus
Date: Sun, 22 Nov 2026 06:01:06 +0000
Message-ID: <20261122060114.773624-4-jonas@kwiboo.se>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261122060114.773624-1-jonas@kwiboo.se>
References: <20261122060114.773624-1-jonas@kwiboo.se>
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

Luckfox Lyra and Lyra Plus is powered by the Rockchip RK3506G2 SoC,
which integrates three Cortex-A7 cores, one Cortex-M0 core, and 128 MB
of DDR3 memory.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
Changes in v2:
- No change
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index a5eec2ecf23c..37321e23b087 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -860,6 +860,13 @@ properties:
           - const: luckfox,core3576
           - const: rockchip,rk3576
 
+      - description: Luckfox Lyra boards
+        items:
+          - enum:
+              - luckfox,lyra
+              - luckfox,lyra-plus
+          - const: rockchip,rk3506
+
       - description: Lunzn FastRhino R66S / R68S
         items:
           - enum:
-- 
2.56.1

