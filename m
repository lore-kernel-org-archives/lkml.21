Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794938138;
	b=u+GcOtK36h0M8oxDe/Bmyly/OizdDj7A8coSzj9bRVKvlzHdOyCJoEtP36AGsISm9hA7
	 9DWSZ87bZz3QbfQqv8oXRwVhMVlEUj+Ue/o39XXiUkinsVVn+eMdiaqM0HjhbLjqS5UWT
	 nzYP0ZdNVzVNpqlR7s9ZMI42D3n3vRFEnVKH8ijdmOp7N52DXPykyOcoY5thtq4cPu/c5
	 lK6chYnigWLudxAhE0qFn87+1ZpypkVR8uN1NitkFcy/odP8/CHS2VO6RkqoOtCVWN+dS
	 XcP5dlmwkKm+9Ep2CunV0rhQXtpBlUQi0bcbL9eWiA92PJPoqXk/csR9CtLK4As9ruQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938138;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DiOvznsls4pfppofX09Ng5U9MzxIihkB8Z9pWKPweyY=;
	b=uKh4JmXDfiAlLo+DGpObIVHUFU+IGgx34+V4H6DBMckgsLcVK6yqyCS9BgghfGhTQcM/
	 ZGRz5npCvNzJ8wLDS+ygmz+B0TqIfijG2ImQepTdF49v2SKmtAVSM8Lvipncv6raiytdO
	 7u2xjt7nDIly6VgG6JDMqW1e8Pv7M+oRsJUyUa4thym0y+SWjjwiwHtdyHzcit11rPwq9
	 3hS8i+6ECiUKQozKw/adNYcRxJoj1TX0pqLDSsWtzAP723vsco4dP/aKlMDGVdTzK1BrW
	 E0sYphkJ/GX6/9q26Qzvt2hGRoLEFch11umVcQv8+N75X7HLgCUh89FTiiUnOw63gdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uJwfk2Ib;
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EE5606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:55:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26EE5606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uJwfk2Ib
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-38277fbed9cso30972eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794938136; x=1795542936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DiOvznsls4pfppofX09Ng5U9MzxIihkB8Z9pWKPweyY=;
        b=uJwfk2IbG/RK2lgLEXqp9CUn1E2hPAuaCTH7eQa4nW/mF6iepfo8hOz6Qh1ORROp5B
         41UZBJl5IaqGNww2mdXTVK/jmOH+khwbnkeYib2eqHSzj0ufaISvm7QT7DrwOTx5e37M
         L9ydJ0fL57bZCufO6qWojJX3lu6fzjp82mfZPOC2Xj6rc1elr51OgZr1fHxXetakSpAw
         N/q5lQuW00fa1Pnue9BbTndZ77X8IZguZwfo74iGHigaK6dWGSH9v/QXWTqecEze+cb4
         OAR0aWBTifhpqqCf5C6ykYLuK5Ah05a+yYyhvbNvsARwFp+MQd+LPLAjgzo0Ghk7FonR
         UEuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794938136; x=1795542936;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DiOvznsls4pfppofX09Ng5U9MzxIihkB8Z9pWKPweyY=;
        b=zVYBfabjcuHsad4W5cv3kl8OwgmnE0wch3b0f5YZ94ECguRNFKK/qst19kmv3dLp0F
         LTrpYQQv/EdxWy3m2BcI0Zf0XrHSzKLQKrpQV8zMrR34LJwhr4tHy8ocyzzbR8AJCTQB
         kcOlYANjDuKxaFJ3PgJyMHFRZ2B0ZCmoo5hvGfvWe9TsPBPr1EZ74gFZ0MIc5EywN5iv
         XCllxe3N4LwPTpDDqBC1UZAuSsS1hnYJocVloc1WVvD3Db+z2lADDYoK5Cr7HJyzsS6/
         C7dc9rvkjmnODDEZ4y79fRtzW/gBl8s71et5qyqWB3YybNXl7GTbx3kttKRUuO/QKqGS
         P1MA==
X-Forwarded-Encrypted: i=1; AL+hErEjPbDtRSx7ZxbdhQkg2MwOF16hy2iqClybqLQYCiluXn5n84Co7YHbCzOhmSNWzNaTTFpIQ/zi1Yh2LeU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8aVxBRnSTw1fk7Bw0aVHOZRUBE1IoTIbpdLPTvCczGB16tSAC1
	UxbK/OnSgqF06sjlNtH0MrT4+Rp0AGLZRFcyGyVXDBeeSDVOKvl1kn6k
X-Gm-Gg: AZFdTZdMb9wDklA79crJIgnb2WtmxIfwooK0K+JpN4mrl8UAKGHqZEooD26yb71G7ru
	ECPKJTa9nkbBAI8CqHDgDSjGhqefm7nc2y2RCWyZDEJlHHLhJ6HGCqb/MvJbobP7B7ryDvBC8uR
	6sAd+MJMbMlQ3Io0XNt6vr2XX1UFuFcCkq6OJ6rUSR/5QB+ukEywucB+ktRpcPSBAI1ttNS2VpS
	BF+RDw58h+DHBOGloZwLTrmxrvKjWqyTt3FZLtPZl98AOOG35miYM5lItcucHwx5fJPO98jnCVq
	GQaPRhF0rrQhcmB2fnD9m1GfpqaoLhVl8jtdbZj1Opri8CcsKvH4NciOIlt1lVrvivD3pYzq4kR
	omGSg2pMKIkLriOqtMIvmKQga/pA2B0CZlFEoqyP7igY3BS4cj/YrJwAy9zbUycaOf3lnKRbVO/
	/u6Fe8m5afYyNcVUgqzeZzdsqyVCZPahq5xGtEFpayz61W4gFJLPaKOaZ5hBLnuAtqHS6QV5w3Y
	qsISWevDk3c2lVySwxSmGqNAnLNcScVKkxDht52CYmG/yQiWKCKy72BgwkTw+aFPCCAedrkSr6n
	2GkUh4iRdzuYfZI1FeN4DqOHdbUfXS4UITWNHtz8XNci/Ck53vh6FYVufl1R
X-Received: by 2002:a05:693c:88d7:20b0:36e:aa5c:7851 with SMTP id 5a478bee46e88-3828141dd08mr152849eec.27.1794938136086;
        Tue, 17 Nov 2026 09:55:36 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38116afd7f7sm9064845eec.17.2026.11.17.09.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:55:35 -0800 (PST)
From: Coia Prant <coiaprant@gmail.com>
To: Jiawen Wu <jiawenwu@trustnetic.com>,
	netdev@vger.kernel.org
Cc: Mengyuan Lou <mengyuanlou@net-swift.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH net v5] net: txgbe: fix stack size for PHY interface mask
Date: Wed, 18 Nov 2026 01:55:28 +0800
Message-ID: <20261117175528.3018609-1-coiaprant@gmail.com>
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

The DECLARE_PHY_INTERFACE_MASK_ZERO() macro currently defined in the
txgbe driver incorrectly uses PHY_INTERFACE_MODE_MAX as the array
length instead of BITS_TO_LONGS(). This allocates significantly more
space on the stack than necessary.

Since hiding the zero-initialization inside a macro is discouraged,
drop the local macro entirely and use the standard
DECLARE_PHY_INTERFACE_MASK() with explicit zero-initialization at the
declaration site instead.

Fixes: 47f848aac4e7 ("net: txgbe: initialize PHY interface to 0")
Signed-off-by: Coia Prant <coiaprant@gmail.com>
Cc: Jiawen Wu <jiawenwu@trustnetic.com>
---
Changes since v4:
- replace DECLARE_PHY_INTERFACE_MASK_ZERO with DECLARE_PHY_INTERFACE_MASK and initialize it to { 0, }.

Links:
- https://lore.kernel.org/all/20261102212506.3348537-1-coiaprant@gmail.com/ (v3)
- https://lore.kernel.org/all/20261110160554.918652-1-coiaprant@gmail.com/ (v4)

 drivers/net/ethernet/wangxun/txgbe/txgbe_aml.c  | 4 ++--
 drivers/net/ethernet/wangxun/txgbe/txgbe_type.h | 3 ---
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/wangxun/txgbe/txgbe_aml.c b/drivers/net/ethernet/wangxun/txgbe/txgbe_aml.c
index 26d0cfc58ee2..a21bc55c39ed 100644
--- a/drivers/net/ethernet/wangxun/txgbe/txgbe_aml.c
+++ b/drivers/net/ethernet/wangxun/txgbe/txgbe_aml.c
@@ -202,7 +202,7 @@ void txgbe_set_phy_link(struct wx *wx)
 static int txgbe_sfp_to_linkmodes(struct wx *wx, struct txgbe_sff_id *id)
 {
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(modes) = { 0, };
-	DECLARE_PHY_INTERFACE_MASK_ZERO(interfaces);
+	DECLARE_PHY_INTERFACE_MASK(interfaces) = { 0, };
 	struct txgbe *txgbe = wx->priv;
 
 	if (id->cable_tech & TXGBE_SFF_DA_PASSIVE_CABLE) {
@@ -269,7 +269,7 @@ static int txgbe_sfp_to_linkmodes(struct wx *wx, struct txgbe_sff_id *id)
 static int txgbe_qsfp_to_linkmodes(struct wx *wx, struct txgbe_sff_id *id)
 {
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(modes) = { 0, };
-	DECLARE_PHY_INTERFACE_MASK_ZERO(interfaces);
+	DECLARE_PHY_INTERFACE_MASK(interfaces) = { 0, };
 	struct txgbe *txgbe = wx->priv;
 
 	if (id->transceiver_type & TXGBE_SFF_ETHERNET_40G_CR4) {
diff --git a/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h b/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h
index 757d1ce8d3ad..8071464c7b90 100644
--- a/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h
+++ b/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h
@@ -315,9 +315,6 @@ void txgbe_up(struct wx *wx);
 int txgbe_setup_tc(struct net_device *dev, u8 tc);
 void txgbe_do_reset(struct net_device *netdev, bool reinit);
 
-#define DECLARE_PHY_INTERFACE_MASK_ZERO(name) \
-	unsigned long name[PHY_INTERFACE_MODE_MAX] = { 0, }
-
 #define TXGBE_LINK_SPEED_UNKNOWN        0
 #define TXGBE_LINK_SPEED_10GB_FULL      4
 #define TXGBE_LINK_SPEED_25GB_FULL      0x10
-- 
2.47.3

