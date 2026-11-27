Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795765674;
	b=luZdsKfTFSWuo5/pRkMtcT6y7uDvgqGxV2NP3GbtEnIlbv1TGDLHUtQG1wOeQQsBtnNR
	 UonrLc/Dn9Wb2OID11KjVwLihcFQN/h4AqTZYHLnlAsh6cFloWYOlAVIj372bGj13q8L4
	 PuAhxa5wNi+X3Gwdd/TeNZJ2iYLHtGoq+yKuJZQn7ocpLFb4diI839vdsAGmGbPY7f9Hs
	 N9ErS5ejLxVZQqGv59wQKR71PvBfRqDUThc9tCwmAtmpvJh/4noDm3zzCbTnBtRLAs8Fr
	 lmcd0y6RzxjS8Os/j8zRmGxnFh9bvqGwMY2y/96Yn29cTUj50bRaz8zIS6bmk/U+WQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795765674;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=MOB3aNMg6zK5EGl8etrn5gy8OwqRUvQQTVeOILv9hbo=;
	b=nwWGGDTfwKKfn6Cq++IMjfpNUWeCWGFoRFIoYJpiLx0NRGK2hxj7jwB0LmMUHEtsUPGu
	 3a6rJBiOr/67UBxnaouA15rX3Jq2rk28n12Pars3JL7etVhgbocCPg4wdq2AKFT9MMUki
	 rQF6q7JCdku8XXtdNqLWPFtcytFBCghR0mr/mmVCMemZ4/3YOR0+qPAhoAJRSNQQ4tmU1
	 sZMLGMEmysQNcHdLi5483y6XodAfJqUKY5/c4fD3bphoo1SRo6zweVHfXfiFEz6WOw9/T
	 QBfQOJJpGFuIndHWfQRE9boZhgRmgUI7HkhD+fVoanKQyHM04J798qygqzat1gLwesg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PMy9e8A7;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C5F606A323
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:47:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1C5F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PMy9e8A7
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-386d36ac055so367222eec.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 23:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795765673; x=1796370473; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MOB3aNMg6zK5EGl8etrn5gy8OwqRUvQQTVeOILv9hbo=;
        b=PMy9e8A7PhenkLoVFKCtIzYIZmYyQnPnkmacehevaFEl+DwoyBN07mWiplcYJwnnZs
         0GgXdJi90HKlCdd1gAOFI9wrPZ2AeSJsN05wQqPMNwDi3KEr7c8o2qj0NB2Jqpc3/Wqi
         iaD0Om3Rkgzd/Y+hbNia/yIGIFtewxmzBnzCkNHSZjtDbN3yPWPsNFY9OOsXyd1sdB2F
         aPeCb+bi5ytFikCjYe/IX+NvICTeG7FuUtK1KIuxuUcWjRo8qxwRGBDderAdAwF4Istk
         1x5uUv6Ycdt/g2lxQhS0gcqGBRmyY4YbRxTEsmKaStSUEvufpxNddUlI+15h4sM4PRCi
         wLSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795765673; x=1796370473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MOB3aNMg6zK5EGl8etrn5gy8OwqRUvQQTVeOILv9hbo=;
        b=zF5V7WwmNFdNqiWLrzC9KMeCKYiOvsEJg047/ioTEIG8AdRniWJomWFaBGgRcIpVao
         RfZh61Oywevkb+OgTdIG/MwaoSwawSbx1pyQEi4zDwNMoQ510oJloeVGcccueJI81Fkm
         v3S6BGW5oQTqf2L0UJN8nPb8wgrsWfwRFSphWW+5PZM5bs7uonIVKuz2aHILyKHnyL9u
         L98EkbI8LwkCtfCfjNoQa53l/55cN9oL3IWqg0mZWn3hoCsqFitv1qBJq+3xRqOd8NQ6
         7mxDo5E5IVWabXHEysUrQX+eV7J8sUDLl1dQt1WDCrZoJUFT1GSmtgZa8WGV9hx3u6eC
         CatQ==
X-Forwarded-Encrypted: i=1; AL+hErEfppMUcNTZ2orGTqdPfIqqDPq91x+cMWWlMFhJRZpU3sY5uPoHu4WR5UwpzXI+wpkvzcXJOwBIMlYY0Oo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9DEhqCPMRjKIkghq25mIzNItjmWwFMewOZDKhBtHq4BUIg/EvI
	/dhwN8Gd3ERA1hP9fVVlO3w6Gds9yuYlMbcQSx1X1gcSxNN8v7fqo2YrcBphBtdobno=
X-Gm-Gg: AZFdTZemj96viC5z52QUZirjYJKHMGrKTDa3uol4eQ4F1yU5TSOXL9eKthULuleK755
	RDXFfSA/s6iQl1BURPjeH0tLt14WILnkLwlN1RiBWA2r1mo+eMQsEmvtGTEtEY3He2oz/rzzZBf
	6r/4ZVl5nJkDxzWZ2yj/9IpvRXDaj1+fXeGpFeT2I2HEEllM68AEnMvxFN3RXzWW9dthoS0C7UA
	JXZrCB1u2bakXCbdcn0eV/wMhqttJ1fOc2MEdLaLD/fHGzEJJZw3rfq+cYttPvf64uA1rMZL7Gg
	Gi7b2Jb2bpN2vDrQ3zbNMw2Pyz0wh3BC2r2PRWJmGi/4qizFtdbqKEmEOyZspR2sLOj8dkAJ3KF
	g+4Kg31i0UhXqWmfZbGobwxRbYOnY1YX0vAvyVLd32DXoyzHwa22azkatr4NBEC2iNim2o5cgri
	+pe2x53K3imz4QdYJV3n1H1IEFec3TKQ/BTTCRYfx2G7usvP4wUe/NosRhEFb67yCrkHW6VdJqE
	z6zMYytsEJGI3Hbdjim2Bx9YS/oPvD4FcLSBYIQKGdEfxgDpnitwlgwvk3hDauCeWVyVIuSKR/N
	B4/0oQp2x5AVV9Of7U799fRy/TxHEJ/ht5CfZblPjNqMIwXHA3Xo6BMbEtDHuQaqFw0Jkff6yXU
	b3w75vpmE6lr+WqDy3s9A
X-Received: by 2002:a05:7301:6187:10b0:386:a8e0:ac22 with SMTP id 5a478bee46e88-386a8e0b29dmr26742968eec.0.1795765672594;
        Thu, 26 Nov 2026 23:47:52 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm68098252eec.15.2026.11.26.23.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:47:52 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Date: Fri, 27 Nov 2026 15:47:37 +0800
Subject: [PATCH v8 1/9] dt-bindings: phy: Add PHY_DIRECTION_TX/RX
 definitions
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
Message-Id: <20261127-dcphy-rx-v1-v8-1-9ddfef99221d@gmail.com>
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
 Jason Yang <jason98166@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795765664; l=1350;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=aNt6jFbb1EluDVRLQW8cmmY5lEvfVnKHFjZpwctNRG4=;
 b=/TCcZP1Jwtxcsr499CMyqjBIfHlVD6fhzK+HXpcYMhrJ+L+QrrJw9QVYTVXvoidwRkIabtG5d
 mEbIDCqjHhqBq+hZHZviYPfidoQJ5XIYOzDrekMItz0qTcSXOyruzbw
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=

A MIPI D-PHY or C-PHY can be a transmitter or a receiver. Some PHY
blocks have one of each and can use them at the same time, so one PHY
node offers two PHYs. The existing cell, PHY_TYPE_DPHY or
PHY_TYPE_CPHY, selects the mode of the whole block, not one of the two
PHYs.

Add PHY_DIRECTION_TX and PHY_DIRECTION_RX for a cell that selects the
transmitter or the receiver. The first user is the Rockchip RK3588 MIPI
DC-PHY, where the transmitter serves a DSI host and the receiver a CSI-2
host.

Suggested-by: Michael Riesch <michael.riesch@collabora.com>
Link: https://lore.kernel.org/r/7425ac83-f6d8-4443-a26e-a47f9306aa24@collabora.com
Signed-off-by: Jason Yang <jason98166@gmail.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
---
 include/dt-bindings/phy/phy.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/phy.h
index 979b5dfd8353..9ead74d9a172 100644
--- a/include/dt-bindings/phy/phy.h
+++ b/include/dt-bindings/phy/phy.h
@@ -29,4 +29,7 @@
 #define PHY_POL_INVERT		1
 #define PHY_POL_AUTO		2
 
+#define PHY_DIRECTION_TX	0
+#define PHY_DIRECTION_RX	1
+
 #endif /* _DT_BINDINGS_PHY */

-- 
2.43.0

