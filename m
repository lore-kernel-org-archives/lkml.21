Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794937946;
	b=cjSLVCGRDeQzgNorDDzviZrbum9fACwt56JX3FAORUvGb3TK5JNCWoEgVCuuJw0flzfw
	 erCYV9Xj7n+jbQ3tHHVE7H3mM5IvsyVW6swgyHD8l9lVeWO08H85nOG7v4JZT6wGq9SiQ
	 z9fFjlrnyhzzW4IRii9zCQhEfQVSz3mQDswcPGMqVkTpVipn0+gP5nzKYW076m9z1qwPU
	 Kdrjfg/z/+YfUf8ADKqn/D2anX1WmbSzkrm137LOXAegKsUIxtrMRWUW9S/pDFvuH1NwA
	 5SqW3SsqDVwFwZ6TTnwD4C9hvhIz+kiLQ+rJd2E31pkJrUBxQw3xgNNjuekWzEnrt4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937946;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=S+Ti2XySKByWl6iWYw7n5gpexCdMj20kwqBBEEmSa+Q=;
	b=hOTjDOnzcCu+JvcuanTgeA2L2pCBKMrGnJ5REzNpdMobR0KhnSptdgy9gQWT4/NtmJ0r
	 GOcmW6SOICLoNu3joSAUkrneJOCLXLJFc+K26wJVjQHsYgUWWsmY12hd4xP//6Pf+xsXO
	 mHXZsi14UybVNuKEU+3ai/6Js4rS12ATpK9ScCewoC/cU3WJ3a+YRLCTOTF0Y3Z/w5AeG
	 LaYlyGVjIxp23ka/lDHFZpatUCOiRimHiZCPrS0DgYOeybzpCBhN50cCCZSnWYiicTwoZ
	 CXymfffJEdWoTt1nbORFPxPi8YRQq8rCQMeAizHH1rzuT3qyrGNaSOFmnKCsnoEAvNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="HQNO/0kg";
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8996B606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:52:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8996B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HQNO/0kg
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-36a6ce64b95so30077eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794937945; x=1795542745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S+Ti2XySKByWl6iWYw7n5gpexCdMj20kwqBBEEmSa+Q=;
        b=HQNO/0kg8Mm4obDkN2sL14M6PfcX0+FkKur5xhS3eZMqG+kPPnf+gvvMGOD2Qf8qgk
         jqbiizNEPZBV2Sl4cHcACPp0gHQZvhhdHgwi9e8Gr7ZyXnXdFy4JDSDPHJuoOTPWdH0d
         kwMVH8BFecDBoEVa8QXRCI2NY8ohk9IH28LSBSv7IihZgHEjD7YBDrC8vfxkxGGUaXYz
         EpGfRY7fieamVizIU+/hWN+Le2aXswVxGhkpK4BfrQqtAWUbmIGtaiep5Qncy/L5HXAT
         EsaMmLBMoj27hw6uH+ApymeAtuwFguEx0ijt5qWHVgd2kwyqjwfShPZ4AA1I/xFOk/hO
         Y3zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937945; x=1795542745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S+Ti2XySKByWl6iWYw7n5gpexCdMj20kwqBBEEmSa+Q=;
        b=06Xi+NLpuY+fHGphQw5YoGoZeKwmdHC3LWXuqfnsaN7llnMaVBF52vmARXZBqCJxo7
         /v3GzQQmtutP9QWiJ8cPoDXRHeupbfJ3VgdW6yJSJ1i6p1y1EL3TjDm2yI2GBxrl4U0s
         EiBbnzapwd+euOADD+XF9fFKcxPdMaxH0zdg6McGnZp/rz1I9HTs9u2Mt9lOMVmEPani
         i0gnS82kcIqKNPpYTpqh1xLeirNuptXc/H0TqhUP7Cap3fpQqO8HdT6NcP07W3pov4bU
         Z9genMy5MOMcqjbCOYqmtg356mU++yJPdRoSFgLGswi+g/X8Ov0Fx/QexDwMCc4anTkF
         F8FA==
X-Forwarded-Encrypted: i=1; AL+hErHjRTWrUGHqGe4e8jCr7o+S2z6b4r2TK/FCgCrrVclPKvyVOEW724/9e9f3n3Q7DvZlx4GrR36J+zDjun0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mR8Ebar/2b+TK/A/JxqMpvS06dnmTT9jGS/fdZvWZ33uvmJeK
	Jb1Xjz+oXDmd9/2CobNaCLkfjHj1Oq2c5zqU+rsNGY6ofQujvKazkZSR
X-Gm-Gg: AYBFou34/dZjdqJQldaijIG7ZVwcjDZ8dgPDUTwYz9LID4C6uQfWCJKEXI8CKwCL9cr
	hG2Y2LhJvqqd2WmGhPh8rTnVbPCx5uMGVNBwAl1XtXY5r6a37c23vefwq/tPCbTB4AdcCAd3Py6
	VXdbQ5WHEFp05g1gWhxWchkhEBPHVTGwHITkdK9o/5JAHVZXUXMKB2a+YAMHcx7277RQamIDqPC
	EWF0MXfmyXIva/Ji3Q7VjS9yVPQDuqmC+FBC0m4CyJB0gBR+xmprZTVpGjLSbmHXc9yySqcQJGj
	3mA7pRQ+Aokp/pU7Mr4eVcGNt40qpVvZKfVW1kPY7+fMOYVNszKdZriVXrYgx9AgVcev/dDvW3+
	f9w0B42pD8dXTpqNfjjoqpQfGTEbrvlbR7Kyxc0wAOpbr4VS3SS68Wcb8nxAKfY2IxYxpIipHUY
	WZ1+1nyRUHQuwo+5VDPJCdJRcH2DMroeWU+tY5hl0JDCAmmMPsY8byu73HBfYoPGUrWebWP54Ar
	zlVNJYNFDjyi5IUuMLDEQgs30uUltaukGdMbAN7r4VLgdC6GE0fJmQZ09I0ai3kfUqkK3ZtyVcT
	DMwyeHgwVHEnRE8/7R7I9lzawYHs4UI4/ierFNSblyzUnyVDhpoWYjh/k2u0zx74gq3ekrm6mDx
	6bUGL
X-Received: by 2002:a05:701a:cccb:10b0:1b2:43cc:48 with SMTP id a92af1059eb24-1b543d32f1cmr240596c88.33.1794937944414;
        Tue, 17 Nov 2026 09:52:24 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b2519sm38272460c88.13.2026.11.17.09.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:52:23 -0800 (PST)
From: Coia Prant <coiaprant@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH net-next v5] net: pcs: xpcs: make supported_interfaces authoritative
Date: Wed, 18 Nov 2026 01:52:15 +0800
Message-ID: <20261117175215.3015703-1-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
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

pcs.supported_interfaces is the mask of interfaces a given xpcs
instance actually supports. The compat table describes what the
Synopsys IP can do in general, but a specific integration may support
a different subset. For example, the RK3568 XPCS supports 1000BASE-X,
SGMII and QSGMII in hardware, but does not implement the C73,
10GBASE-R or 2500BASE-X modes that the Synopsys compat table
advertises.

However, xpcs_find_compat() only walks desc->compat[] and does not look
at pcs.supported_interfaces. If a caller ever passes an interface
outside the mask, the core would still find and configure a compat
entry for it, contradicting the mask the glue already set. This was a
known gap: the mask was written but never consulted by the core.

Fix both sides:

- In xpcs_find_compat(), return NULL when the interface is not in
  pcs.supported_interfaces, so the mask is authoritative for what the
  core will configure.
- In the Rockchip glue, build a platform mask with the three modes
  supported by RK3568 (1000BASE-X, SGMII, QSGMII) and intersect it
  with the core's supported_interfaces using phy_interface_and().
  This narrows the mask inherited from the generic compat table so it
  reflects the actual SoC capabilities.

Note that QSGMII is currently filtered out (a no-op) because the core's
compat table does not support it yet, which demonstrates the intended
filtering behavior of this intersection.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
Changes since v4:
- replace DECLARE_PHY_INTERFACE_MASK_ZERO with DECLARE_PHY_INTERFACE_MASK and initialize it to { 0, }.

Links:
- https://lore.kernel.org/all/20261029094916.3127193-2-coiaprant@gmail.com/ (v1)
- https://lore.kernel.org/all/20261029102728.3189359-2-coiaprant@gmail.com/ (v2)
- https://lore.kernel.org/all/20261102212506.3348537-1-coiaprant@gmail.com/ (v3)
- https://lore.kernel.org/all/20261110160554.918652-1-coiaprant@gmail.com/ (v4)

 drivers/net/pcs/pcs-xpcs-rk.c | 10 ++++++++++
 drivers/net/pcs/pcs-xpcs.c    |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/drivers/net/pcs/pcs-xpcs-rk.c b/drivers/net/pcs/pcs-xpcs-rk.c
index ad187fba4e9d..e0057545329a 100644
--- a/drivers/net/pcs/pcs-xpcs-rk.c
+++ b/drivers/net/pcs/pcs-xpcs-rk.c
@@ -480,6 +480,7 @@ MODULE_DEVICE_TABLE(of, xpcs_rk_of_ids);
 
 struct dw_xpcs *xpcs_rk_create(struct device *dev, struct device_node *pcs, int port)
 {
+	DECLARE_PHY_INTERFACE_MASK(supported_interfaces) = { 0, };
 	struct platform_device *pdev;
 	struct dw_xpcs_rk *pxpcs;
 	struct dw_xpcs *xpcs;
@@ -536,6 +537,15 @@ struct dw_xpcs *xpcs_rk_create(struct device *dev, struct device_node *pcs, int
 		return xpcs;
 	}
 
+	/*
+	 * The RK3568 XPCS supports 1000BASE-X, SGMII and QSGMII.
+	 */
+	__set_bit(PHY_INTERFACE_MODE_1000BASEX, supported_interfaces);
+	__set_bit(PHY_INTERFACE_MODE_SGMII, supported_interfaces);
+	__set_bit(PHY_INTERFACE_MODE_QSGMII, supported_interfaces);
+	phy_interface_and(xpcs->pcs.supported_interfaces, xpcs->pcs.supported_interfaces,
+			  supported_interfaces);
+
 	xpcs_config_eee_mult_fact(xpcs, pxpcs->eee_mult_fact);
 	put_device(&pdev->dev);
 	return xpcs;
diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 6466e0ff2a98..46878a66064e 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -169,6 +169,9 @@ xpcs_find_compat(struct dw_xpcs *xpcs, phy_interface_t interface)
 {
 	const struct dw_xpcs_compat *compat;
 
+	if (!test_bit(interface, xpcs->pcs.supported_interfaces))
+		return NULL;
+
 	for (compat = xpcs->desc->compat; compat->supported; compat++)
 		if (compat->interface == interface)
 			return compat;
-- 
2.47.3

