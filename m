Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795765678;
	b=vBgnafKe7+yDJnBhB1kuB2f34xLYKYYTr6UWjY8HkpRYUsMVtJctmIY0tWugSCypNK5N
	 9IcfWl+HBzxYyJoMfFzK4JqqhFgvLQ88449uJdYOejYum0hCn58Tws0gSd8odZ4gupAvd
	 TppLDtiduzwB3r8DJwcrgFx63SzgFBLS9gEBp1CSARBYj7lH8yT4RMy3qfXhKDr/j1yIt
	 Afwn+q5eTYupL8qZ/xg2XgWYFnQ90nEUvggvlNe1/7ftSRo3+VXgaZO9aMWfj69v9LFka
	 9CmCkbbrlUncbLJyoCZBuIpEd9VegrVXCPjfuvWM0rd7J+0jOmRjA5MaQ6hqd80zbOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795765678;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=GdqQ/1stdbLe7LW/q2pTltSdWQOOet/MTXZ5U6MTyic=;
	b=RDf/sOk8chP3eKhFzJTnFQvDwG1ot99gbHtXLil7mKlBoyFB4HdOuEtRS7qjd9T2m2I+
	 vxVVZY1kpTfS86h4vtWh9UWjpUctMp4lwGTQFI2esd+b2smY7VC0JuH0OCW6aubcJ7ZEX
	 Cm4XaB366RIqMooVn73rjs3x1IuvDLmlRZCHmKLScy/UTpXpAv+LLKpGCit3r/DZtM6Nb
	 qhp6+YNNlH9wpsdn2mV5G++LcrP2C0kHn3ZXq8U1E8XpX7o7cjoN7WC0WfLEq1Q4CeeBr
	 zTrkQmC44VxInP+q9Zc9h9yoqVteS4j4iroenbw6acUejmJ1conoWW0INK9Sgd4vbZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0ofy9ShX;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD7C606A327
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:47:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDD7C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0ofy9ShX
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-386c337edfeso653914eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 23:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795765677; x=1796370477; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GdqQ/1stdbLe7LW/q2pTltSdWQOOet/MTXZ5U6MTyic=;
        b=0ofy9ShX7MdYotp/3tfXIUG4reTq0nHGYrwVcKRxIXzmOcdE/5/P9Ktr7TX5gDQKHK
         2Qse9MOZSKtwQ9+T+Jb5RHDlIUzOqxadLHkksLD0iZJ4/W9kg2Tl3F6Q+2/OPxR5frlY
         gld28w608lagYh/DoLUtaMJapxfYVYYyBpk8iyMviUukhMCuRgYnnH/M2OgcH6D8ID8V
         copV6UPXQMd2UJrcJpECLidDkvR2rHeY02mvJLH4GoswHKGkgz/4sNJHlXi4pSw2ow98
         TMcYHIdStCfW9Ms9qw6XP60mvRfQu40reuMkLUq8IQOdNUXKY+WtQdQeQ5Ad9H0peGU4
         7zOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795765677; x=1796370477;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GdqQ/1stdbLe7LW/q2pTltSdWQOOet/MTXZ5U6MTyic=;
        b=cVfHdR98OtkTIhImPaIPcWSuJgfJUgkwAOorKdGmoONWBrCYM48cX+cezes2W7jpZa
         Yr2I6XmcTVVY1arYii9esFTejXZvQViob/k7ue2/NhORx2dT/JnfYjLyd6zY7u5WoZ4F
         GkN28Z+4kidKg9LbF2N5ITA449Y8WzWTydMPH8cZOC40/F6jwMz7Sax5pPhgx1Aplgj3
         ZIly1xrdx+2Il5FGqhvFcLdfCajMWWmf4Zn2xDbosYb3Wb9vIy4uzIeXDCmTH1JFiwaT
         65EJBCTQwCRR7xqJkdZO3LvBLxyMDcRG+f1HZwEec+J5nl0qEkBVH/mgiHAhlxtRM5Ov
         suvg==
X-Forwarded-Encrypted: i=1; AL+hErEASoXHhpH5llftM2ribiVdBeCFC/QxY3L4PbqHnqOtMKr0MBR7T590hufzGl8QMw/DEdqA01QrJbVCu/U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4n79ySuU77Ub9WZZPXxg5ski19TdN7Bfx9JT9o70oFCX/FDE+
	/tl8vPXoaB+JwPcX7h41UMO7JiY/yoyrar4gAm6gY9ev9kOYUAnmfGjIpLF1Dp4jRDI=
X-Gm-Gg: AZFdTZdlVifDbiIAGOjWsCRyKlIYAmmfxKjEraspe+txrph/a05y11OothmKH4hHj8Q
	EFf0hqQlR5gkC7X7YOkzgzE6uwuoDGyia4kzugQTNLX46x73w8cRWj04XppMOuf9j/Wc+XgKrmW
	UaS8LSs41DkcXZebrqffk6slFM/M0gTNeI4f0E5bJa12hgpdTxWQt9t1gU2JNJk3rwelpiNc1bQ
	/nxLfb532J+7N0bcOEKhwsiCPVDlffbOMUo31gGqOxhBheCAUr06q8NZgPEXCQEi40XXfYUeIK7
	qFER0mQESMFVE9tMK2zL6oR7/IUil6+jtDA39lgszLyyRgHLv3HHmmQxh5YC2Xut90C4YZV5FEA
	wsDU+uGbK9VFck6A6R3QQil5Qb1uDCPdo2yoEV8/Om4Z8Ts6bQCODJzGk31zk1WIQy2JR2NKfGj
	Sya4SiRsEntQPwnYSkbfgeyEHCEwicW+8DV24NHX00dyiCeCMSLpTwqoCwuD98xWo+CikBHoGpb
	8FKRIOxm4vx0B1+fxrfQ5FUQ8JhBtGYvW1e4YbRwo/Fh/iyEHXEYE42oNb9c+etU/j8CtmG429Q
	A8If2Y0irUkACP5bqpK7cqEX/vsz8FNVNjMFhqNNWaBtl9eP56ONX1qrrPupZcu6PSENTvb0Nb3
	y3VHAu8maZdL2nZuFj44p
X-Received: by 2002:a05:7300:1c24:b0:384:a0cb:a6d0 with SMTP id 5a478bee46e88-3856de58f7fmr38384098eec.1.1795765676382;
        Thu, 26 Nov 2026 23:47:56 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm68098252eec.15.2026.11.26.23.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:47:55 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Date: Fri, 27 Nov 2026 15:47:38 +0800
Subject: [PATCH v8 2/9] dt-bindings: phy: rockchip,rk3588-mipi-dcphy:
 Select TX or RX, add phy-type
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
Message-Id: <20261127-dcphy-rx-v1-v8-2-9ddfef99221d@gmail.com>
References: <20261127-dcphy-rx-v1-v8-0-9ddfef99221d@gmail.com>
In-Reply-To: <20261127-dcphy-rx-v1-v8-0-9ddfef99221d@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Quentin Schulz <quentin.schulz@cherry.de>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795765664; l=3039;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=7rrdQlfrdWzd6vh0XG1BVzWjWRFX5AHNt9d46Qfby9k=;
 b=PJpEud+ez2q0GsXQjeTCuSxtX3j8zOIr53Jy9X+9FVnl1qhWLNzk1uuIUPCxn7Wem/kCpfd8Y
 YUX34ypgZ07D1PGVlQgKmasrZrBAoNlnEImfVm9qQyVU7lLJNtOmv1F
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=

The Samsung MIPI D-/C-PHY block on RK3588 and RK3576 has a transmitter
for DSI and a receiver for CSI-2, and the DSI host and the CSI-2 host
can use the transmitter and the receiver at the same time. The single
cell of this binding selects the mode and refers to the transmitter, so
the receiver cannot be described.

Change the cell to select the transmitter or the receiver. The
transmitter and the receiver cannot operate in different modes [1], so
the optional phy-type property of the PHY node sets the mode for the
whole block, D-PHY by default:

	/* the MIPI DSI host, driving the transmitter */
	phys = <&mipidcphy0 PHY_DIRECTION_TX>;

	/* the MIPI CSI-2 host, driving the receiver */
	phys = <&mipidcphy0 PHY_DIRECTION_RX>;

For C-PHY the consumers stay the same and the PHY node gets:

	phy-type = <PHY_TYPE_CPHY>;

Existing DTs on a newer kernel: PHY_TYPE_DPHY and PHY_TYPE_CPHY remain
valid as deprecated values. They select the transmitter and imply
phy-type = <PHY_TYPE_DPHY> or <PHY_TYPE_CPHY> respectively, so nothing
changes for them.

New DTs on an older kernel: an ABI break. The older kernel ignores
phy-type and takes any cell value as the mode of the block. A DSI node
with PHY_DIRECTION_TX therefore gets no display, and a CSI-2 node with
PHY_DIRECTION_RX gets no camera.

[1] RK3588 TRM: section 22.1 (overview): "The TX and RX only support
    operate in the same PHY mode."

Suggested-by: Michael Riesch <michael.riesch@collabora.com>
Link: https://lore.kernel.org/r/94d47cab-10c6-4ec3-84a0-3bddc9d67f5f@collabora.com
Signed-off-by: Jason Yang <jason98166@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
---
 .../bindings/phy/rockchip,rk3588-mipi-dcphy.yaml       | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
index c8ff5ba22a86..1ea21ab203ba 100644
--- a/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
@@ -22,11 +22,23 @@ properties:
   "#phy-cells":
     const: 1
     description: |
-      Argument is mode to operate in. Supported modes are:
-        - PHY_TYPE_DPHY
-        - PHY_TYPE_CPHY
+      Argument defines whether receiver or transmitter PHY is used.
+        - PHY_DIRECTION_TX
+        - PHY_DIRECTION_RX
+
+      PHY_TYPE_DPHY and PHY_TYPE_CPHY are deprecated. They select the
+      transmitter and imply phy-type = <PHY_TYPE_DPHY> or <PHY_TYPE_CPHY>
+      respectively. Use PHY_DIRECTION_TX and phy-type instead.
+
       See include/dt-bindings/phy/phy.h for constants.
 
+  phy-type:
+    description: D-PHY (default) or C-PHY mode
+    enum:
+      - 10 # PHY_TYPE_DPHY
+      - 11 # PHY_TYPE_CPHY
+    default: 10
+
   clocks:
     maxItems: 2
 

-- 
2.43.0

