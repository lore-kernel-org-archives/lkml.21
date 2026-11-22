Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795359561;
	b=sYE/CGzL7BrcJiyRhOUsO6hYEhad6nsrozIdfdbZ+Gh/3sdNn70jiOfnBWj1yP0SnMD3
	 2TcukDjLLm+yy7uKtv9VFW4w9OhaSbSH8s2rnA5lWfcVI31IJ3Ixbc1s/+dCoJ4vXCw9j
	 4xkte+EkAzWbncZW8sJ3HD92LbfzJJ09EtaZrXeu7v1qKGrW8mVLei8NeR/WIN1nS6qyY
	 hwDPHHOKuK/Zz1VFKcHlLfAJMN0uZqVDMWMeqExBmJ5iknYsRH0uhlKMcVRzg7zqyr8se
	 r5Tz6F5cbYRG+rmw7qqwNI6d7rsmr61lAWHZtxBfwfiM4zYwaW7XjUMpRrgE5w+SmPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795359561;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yQ1mnXXpX8Ppp4sEQBFb/1XPRgAsvxmRrXL11uhRxSE=;
	b=EFpd/RCE2rkAgDnAA6htWw8SS1v72ITY5cBxAOUzsfVdr0lDOowhSMNGIQTiaXtnCU//
	 pMU/YcD/+jhYBYKbuNrO5Tiu+mt7HRE+sIPwJGmtkdKaNTRdtUetZxGMbeSR2Wq76kEqq
	 sD+A8v0zOwA88igGYhzfI41oOebjjex9+0w6k4KR/+Mvar4ArMTmt3t1So8lWFAddJjfH
	 G1czorqCX4rDrs3bY8sms37yxrK+Dr5dyE+WV22HOFAqTO3PmFHGCdCwfojY5mTk6Bzjf
	 TQ5rGPmDYmWjp2Qno639LgtuhM4OLPtpicmX/lDobqjIxexAJjTn8QgK1xbTRV30kcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aERxkzmF;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE2C606A680
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 14:59:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AE2C606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aERxkzmF
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b413d04c93so1460141a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 06:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795359560; x=1795964360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yQ1mnXXpX8Ppp4sEQBFb/1XPRgAsvxmRrXL11uhRxSE=;
        b=aERxkzmFuUkN28xwnMV1dFYkCXVVdce4HrnW4wlWu+Vro5TiEF3rTpC+Uugv183fkX
         A6ZpX9AEls9XQSb9KG1roun4Mh4hI4AyH9jCQwNk6jXUat87UolGU1I8aSqD1tkhAryb
         16XVE94Xth0TzQprV4d6mTthSdL4UpQDZEq/t6+5PPmEM+HeA94udq8xvbEZCKMdigzT
         iPvoQ27LHnqBJi3yTaptb4Qbkm4F4uHhpisdrGQk9hwpndsmtQNK425Vojir9hUKWTcb
         AuX6kHkfMa5RpeaPnh1CyPNTfAeMJwhJgjzF0lcdnHivZyJsFD7IvdGF5Wm3Cxvy1zSe
         r6Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795359560; x=1795964360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yQ1mnXXpX8Ppp4sEQBFb/1XPRgAsvxmRrXL11uhRxSE=;
        b=P62z1yGtmR0Nk31fMkqI+JHcycxL+wtMLnLD8ZjQ9xj+Vj+QWcdofLBtS8j1yVAItb
         4OKdaUaq5iN6aSDJlrCNTi0QYCFFr07iC4FpvUPSHSdVQ8cSR5cuM1OW0jMh2ZI6AQmM
         1qt5D/RBP0AcOFdF3xQ55mRFJvt97McyiDbFDQqZN6Fitll8YW8XQUy+FklwgQPz8JTi
         OJrFwSEwa3W3jYboNrMfeVMTpqFwUXqKHuGjACZm8/o0okbjPLcd/xb8o0kyyNkH/fnK
         uwcWgySFrPGgMin3QTcHk7znC5KGg5/K1G/r2AR4Pm9bCyj9GGm8gxfG/FOs+LkHl/Zk
         MXTw==
X-Forwarded-Encrypted: i=1; AL+hErEfG90UXGMoX7fyWUmbfeWQdvGiHs4mg2IS4/TML4sPE5WDOqal+VXNSGTNqcdZ5iKjKlv9zz4HCrQfFQc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8e78aNEpMkd1lwCNSeZlfacgd7OQZtdaw5g3SW+EsKUgqhvsBQ
	7zBcgZard3jxFFS0zEkyQnCuIa4byTI3cGkxMyfAUfuaZneOrnpzQmpJ
X-Gm-Gg: AZFdTZdQYI0Srfmubeb8157Mg8KwOYwdG//oSwlGwfOtLPiKCU+0lL8eOd+oXmOgKu1
	hyAFgjrjUpocoHwCjTdyz1V8ZUhv4YPl2jmUTivmhqg0W5phGizl+wrFCmw/9smNr7d3dneMsQO
	0j1NT8CNefMMgxY0/72fuIewQ9Po7gZMQXQVaj0bXtcXritoetZLvPUr/3cZg8ixbM5k0Ie7yH4
	pTaUdB3xac/dQCjCncAFujeXnYeoiikbkgL7/bqSQOM6qCQGuz62tAvXywAo+WomJHEgKopRuZZ
	D2oteZ6OxU0qiaxq6BJQY0uQZO34+4mQYWJ9A3qfl4RBFOtaJ9SUPdfQEGT2iEzECRzZGRbgJi+
	I3pcGCJyYvyZplC95GYNQeHNE8DpT1QcE6+Af0jfA/ce7il0wItXO4LVo8wYh59EmynTiWguZ3k
	E28oaMAeuZrqGPmgVPAXiqzMbv9OStueL2TTETjy8m3l2+zfWExWVBO6EO4gIWikBXTt56s91sl
	1T6hy+cWfnqSD66acrS2BrTIdGMZEng2WPRr5W6FoOzNmptTt/n8cdEz+kyYMmVy5h+4u6BESh+
	DuOaeAOfPnhirzuuVjviStkGbwBDhubzRsFT/jrkn7D30OP26i7Q6qOTKaVFvNtugwU=
X-Received: by 2002:a17:90a:e7d0:b0:3a7:3474:b1ee with SMTP id 98e67ed59e1d1-3b41cb3276cmr8477165a91.60.1795359560597;
        Sun, 22 Nov 2026 06:59:20 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d639fdsm16387442a91.10.2026.11.22.06.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 06:59:20 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: netdev@vger.kernel.org
Cc: Jay Vosburgh <jv@jvosburgh.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Hangbin Liu <hangbin.liu@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 2/2] bonding: don't let an 802.3ad slave change its type
Date: Sun, 22 Nov 2026 23:59:10 +0900
Message-ID: <179535729502.2645501.271186140389290426@gmail.com>
In-Reply-To: <179535729502.2645501.5219010464870440@gmail.com>
References: <179535729502.2645501.5219010464870440@gmail.com>
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

A bond can be a slave of another bond. Enslaving a non-Ethernet device to
an empty inner bond changes the inner bond's type in bond_setup_by_slave()
after NETDEV_PRE_TYPE_CHANGE, and nothing refuses that while the inner
bond is a slave of an 802.3ad bond. The outer bond then adds the 8-byte
lacpdu_mcast_addr to a slave whose addr_len is 16, the same global
out-of-bounds read as when such a slave is enslaved directly:

  BUG: KASAN: global-out-of-bounds in __hw_addr_add_ex (net/core/dev_addr_lists.c:102 net/core/dev_addr_lists.c:157)
  Read of size 16
  Call Trace:
   __hw_addr_add_ex (net/core/dev_addr_lists.c:102 net/core/dev_addr_lists.c:157)
   dev_mc_add (net/core/dev_addr_lists.c:1036 net/core/dev_addr_lists.c:1054)
   bond_open (drivers/net/bonding/bond_main.c:4405)

Refuse NETDEV_PRE_TYPE_CHANGE for a slave of an 802.3ad bond, as team
does for its ports. Other modes still allow it, as
bond-eth-type-change.sh expects.

Fixes: c84fcb79e5db ("bonding: limit BOND_MODE_8023AD to Ethernet devices")
Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
---
 drivers/net/bonding/bond_main.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
index bcc12ef34d9a..1a926b8d28b0 100644
--- a/drivers/net/bonding/bond_main.c
+++ b/drivers/net/bonding/bond_main.c
@@ -3981,6 +3981,10 @@ static int bond_slave_netdev_event(unsigned long event,
 	slave_dbg(bond_dev, slave_dev, "%s called\n", __func__);
 
 	switch (event) {
+	case NETDEV_PRE_TYPE_CHANGE:
+		if (BOND_MODE(bond) == BOND_MODE_8023AD)
+			return NOTIFY_BAD;
+		break;
 	case NETDEV_UNREGISTER:
 		if (bond_dev->type != ARPHRD_ETHER)
 			bond_release_and_destroy(bond_dev, slave_dev);
-- 
2.43.0

