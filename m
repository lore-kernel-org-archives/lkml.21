Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795488219;
	b=0OG6bUGDA3IRdNBhdsS8Kxj3FSSqrIwN/d7SrTKgLH/e4EqRCtDyVxfY0Ueso6eogfrk
	 llrJUULIuC8WWCTPz0Y7hQiCaLkWn0GEZnvmmtJnFVXKRUXoE4ljkSZijFziUANU+tz29
	 LApsxhfYfjqFdI4kv+1yln4lOKdlrHplLaIfeF+SYPAjA8M4vR4ibn9Z6TZY6SdKXv79K
	 UJSfuHxJD9HzobLdNDDOd6w5kH/MdrAOgKveeSYjdBpSclLpUqujHknelCzzdzRRMhW5a
	 pSHYe0gbmdiIuyXbVrtsv2aVyiuww2m0Wmk7MNjUjLaeqqXpwjsqcfIpk91ljynz62A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795488219;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dfJXkkeb0ApTzxVDNytY+c7oklywOuGiEXXhBpMLKW0=;
	b=RGIUMt+IXmnD3yLSHqyB7WYcu+96QqKTz+Cje16j0tyoZBlKecMqO29oaApLoz1x9zfU
	 ne2GT+8JpxE1gMp7f4ff/Y/KbbmhrEJEXMCDgg8bRD6WE52O9cPJVlBWGzOEC3kLAPBow
	 MUapMdiYbvESScqXiuY4eSzbqmrwljYkK0I75PcCd5pUQZOSqz78tT1nE1TedN0faYdf/
	 IEd1nZFaRWix/vdvPo/wH/A7EKlO35ToJKgLBBjpg4uxLhrvHxpHOtWeEZ+NjPSQRKPXn
	 +8w8IoPoQnuVQiinXb20/BgVN9mCtevkO3BwjHYM5ZnjHkc3jV4PqYMxPtndK3T6oXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="MXML/Syt";
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4D5606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:43:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE4D5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MXML/Syt
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b405d8f1cfso1918119a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795488218; x=1796093018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dfJXkkeb0ApTzxVDNytY+c7oklywOuGiEXXhBpMLKW0=;
        b=MXML/SytBlV2Rhzwz2uGnkNYZRhPPO/PJ1A33pIztFOdowCjvjSS9F7A69IbFX1wlY
         Ur0fD1JWElQodmwyZdjNCnGe4aKHc/PLSS68ITSKjyYouYTZTVPhQ/BFgJ+6+HLvcNLy
         LzYp+g0NfLagtKxrza3aYbZDHfEf4atg1dK6ML2XHi36iN3foGy1+a4YC2B1Xq4lVJqV
         T8jhWmQlEKb0VV2Mwig9Y46pp3uJ16XkCXzPfl5fKyjWLoT8yRTs5rQ3ulNK99T+bO+N
         hdKXIbmHdrtphsZEpt/+jwQCe06AGnHNkcITUmHRK/DN6U+TcchGiuSFlsuxvyYnicZx
         Ef4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795488218; x=1796093018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dfJXkkeb0ApTzxVDNytY+c7oklywOuGiEXXhBpMLKW0=;
        b=fV7dcfxzayLKC5erUJFuOWPGAqIW9EXiJZnVHIjXSEqRO/MxY9ZP6VWVFIktm+00/G
         p7YWlEJewhM8E9PM2hm2Ow+9yGhDm/lFINyl3VafVaOmQRrIdMKsySgvwyUX/GvO6gJ+
         Td3gAK5V71S3co8Sxb0m0dFWBySyd3XNy4t/HCCe09BBmpHkL0o7NI1tS/53RKmCjZP3
         H5tOs8njCV6yVUXdS4B+QSYCWi37PAWRHr5pGyHTUbP/587ZDnB7zURDgcDaKId04SGc
         G3fLW390wHobKCT6oiHLEYoz0PB8v8qG+NCpeAlVCigLhyef2BQIVeNZEMeWwWOW2eVy
         QMrQ==
X-Forwarded-Encrypted: i=1; AL+hErHXhat/QT4igwGPbUqqDS4wwh7bcFdo6L+7F8CbWvUGG/ScrcMkHbfxEk+2v3KEwkrvR9mwQBzDW0YpxzA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TtDOiTSQBszgsq6vpReM/ithjBAxUuSiTsvPvgV0sdohoTigM
	aJatQ0XMDhC2UtpNAlEIQsB86xll66oqB+7FlxmzQMnVsJgxHzPqXss9
X-Gm-Gg: AZFdTZdSDGTCxwzh6y9bLmSii8yuSGJfETjcOx9Oww+cg/pDCzTpARtmgHBfHJT6OLF
	r0Tg5CS7FMup/8eoeTLH1zsx3yhokyhzI08sxw+rp46uakbGV8/pYR26Kyc1AEFpJq66HYjRKZ8
	Jjmx+LwHwcduJ8Ou7rmaOpAb7vixxX2OYxXQjeEYjXHDLXo5+hvW1hq6CJ8DsyYMffNyZ6P3YkD
	UzOHtpwwPJJS6qnDzBiSpVKB8TDhp6+L0I+Qbs4GvAKmhhvod9pgNzcnJZLRO0ugnaOzZBqXLyy
	k70n4CvyU7ES0V9QbJa9KCN1jMDOGlM1/QkICnkbWcUs75Zj71u0lKCP555gwSYmRfgj5BGkMEE
	Wr6NS409hKu+vAh20huiZTpiVp4NCiGGicUrhokL2pPMJVLS2NcWgtR6+1OduImjRzC7XCOij+p
	afrg0V9Rze025smmhoax+ILrlh31eogDqj/wkkWzVeQW7WgXre3OlmeymtS/XCsHA2Q/8WL6mtH
	tir8CLHxXLRvZrbFs07xGdH5OlWy1JP4nrTBO1GC61ske9VRKsfI2pb0lIqzssfM3ApBNYlxfTg
	XBsW41lC+9qz7GhRGEliykugLexAOgsiQCtQdT5HjrS+Tbu24sMXLZMKUJuQ9UxUp6HNMvqLcap
	QNlgX+OEzAdMLy00xKA==
X-Received: by 2002:a17:90a:e7d0:b0:3b0:aaa3:ce8c with SMTP id 98e67ed59e1d1-3b41c8debe8mr11949265a91.14.1795488217934;
        Mon, 23 Nov 2026 18:43:37 -0800 (PST)
Received: from JIAPENGLIN-MC0.tencent.com ([43.132.141.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d002a77sm5916794a12.16.2026.11.23.18.43.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 18:43:37 -0800 (PST)
From: Lin Jiapeng <ljp1205831794@gmail.com>
To: jv@jvosburgh.net,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	sfeldma@cumulusnetworks.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Lin Jiapeng <jiapenglin@tencent.com>,
	TencentOS Corvus AI <corvus@tencent.com>
Subject: [PATCH net v2] bonding: unbind 802.3ad slaves on enslave failure
Date: Tue, 24 Nov 2026 10:41:21 +0800
Message-ID: <20261124024319.52145-1-ljp1205831794@gmail.com>
X-Mailer: git-send-email 2.55.0
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

From: Lin Jiapeng <jiapenglin@tencent.com>

The 802.3ad enslave path binds a slave before publishing it in the bond's
slave list. The periodic state machine can select the port and attach it to
a LAG while enslavement is in progress, including while NETDEV_CHANGEUPPER
notifiers are running.

If enslavement fails, rollback can free ad_slave_info without unbinding its
port and leave later LAG processing with a dangling pointer. This affects
both a failed upper-link notification and later failures such as
bond_sysfs_slave_add(). A test-only kretprobe forces the latter to return
-ENOMEM, after which KASAN reports:
     BUG: KASAN: slab-use-after-free in ad_agg_selection_logic+0x1a0d/0x1fa0
     Read of size 1 by task kworker/u16:0/13
     Freed by task 110:
       kfree
       slave_kobj_release
       kobject_put
       bond_enslave

Drain the RX handler before unbinding so receive handlers cannot race with
port->slave becoming NULL. Unbind before upper unlink when the link exists,
and also unbind after an upper-link failure without repeating the unlink.
Rebuild the slave array after aggregator changes and leave earlier
unpublished failures unchanged.

Fixes: 07699f9a7c8d ("bonding: add sysfs /slave dir for bond slave devices.")
Reported-by: TencentOS Corvus AI <corvus@tencent.com>
Link: https://lore.kernel.org/netdev/20261113130454.63032-1-ljp1205831794@gmail.com/
---
v1 -> v2:
  - Drain the RX handler before unbinding to avoid NULL dereferences in the
    802.3ad receive path.
  - Cover NETDEV_CHANGEUPPER failure after transient upper-link publication,
    without repeating upper-dev unlink.
  - Rebuild the 802.3ad slave array after rollback.

 drivers/net/bonding/bond_main.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
index e9f5e753f677..7ca948bb27d0 100644
--- a/drivers/net/bonding/bond_main.c
+++ b/drivers/net/bonding/bond_main.c
@@ -2355,10 +2355,21 @@ int bond_enslave(struct net_device *bond_dev, struct net_device *slave_dev,
 	bond_sysfs_slave_del(new_slave);
 
 err_upper_unlink:
+	netdev_rx_handler_unregister(slave_dev);
+	if (BOND_MODE(bond) == BOND_MODE_8023AD)
+		bond_3ad_unbind_slave(new_slave);
 	bond_upper_dev_unlink(bond, new_slave);
+	goto err_update_slave_arr;
 
 err_unregister:
 	netdev_rx_handler_unregister(slave_dev);
+	if (BOND_MODE(bond) == BOND_MODE_8023AD)
+		bond_3ad_unbind_slave(new_slave);
+
+err_update_slave_arr:
+	if (BOND_MODE(bond) == BOND_MODE_8023AD &&
+	    bond_update_slave_arr(bond, new_slave))
+		bond_slave_arr_work_rearm(bond, 0);
 
 err_detach:
 	vlan_vids_del_by_dev(slave_dev, bond_dev);

base-commit: 7e1392a42ea288d70a266f6553fe06f57f8647ea
-- 
2.55.0

