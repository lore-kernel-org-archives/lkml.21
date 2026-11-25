Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607729;
	b=KZ3ABcJvWt2HTtjYzrtcV5HHe6Kuz+bdT8hqsHUKydXJ7rSpSqUJVKhhX10e5eehuENE
	 wXs80vrGCI8cLZE73+ZeiO1d3Iv1F1EnaagAEx1nsMTe6YErDsoJTxfcpQ1FyLGwBEK4U
	 lYUh56VxkqnlOE0G6RfcSxXp2W0sNNw5Rp7O1Wr3mxTXCs2ohOezFPriuzEiRsPu7t+wS
	 VSHm5M82f95293YFpSJZRLFM0pwDtfI4hL/pFL0EnR10UR1n3SGmrjpZ0Wiucm0Swa2q9
	 Nfx3Yuj2pLfrfZdOPy1NksSpNQ+PE1XhtwqeVYH+7SDVq1cmZJo86yf85D2y6o6cshA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607729;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=FGw+GuWFY4q1fwKrolCVhW/WJE9ZxtYtJk0eTf7O0+c=;
	b=hUXWaM4Xovls1GyyLXsOkFWGPR782qSQaRmt09WsLH7+bC3z20slfHS0z88HjaXkfI0D
	 tArkHUN88rjKswfQHZ+uGUlY0IHzGMOYR7U0pLjrrqk0UgZVTqRK/vdlD+d52zIPfXrQT
	 C92jb2f2xhg4sSIXQ6XLe/ZTR6jOP96jv86D2OMyfOvy/JkbMuM4kW3ivIq29DpwnbLVm
	 AAy8kKeb2zI2glagN3SkEJJpkaEm32VUQhxbsBN6msVYtVnP2NEdSKIL4+OGShPNeN8AA
	 WU0bPNzoIExYlcPzq+6new9kCfCyFlMrDE5TAj2mvn7nywrXQgtCTY0v1WaPSf1abNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=fHTKYE85;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B289606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:55:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B289606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=fHTKYE85
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cdb15cd8558so2553742a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:55:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607728; x=1796212528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FGw+GuWFY4q1fwKrolCVhW/WJE9ZxtYtJk0eTf7O0+c=;
        b=OGpmx8qRZlB3WW5o8iMpXLExbaRkj3nlfFRLh0LT8KOu2RxpAtbp29N0gKL9+sDRvU
         3rzA2Im87G7zUqYdi3sLMsvrn94f29kD0MXsaOygmTTEm/Dge3sXjkxTdGH2fsmAluoy
         TlNnktJyy3ur8Q4mPcFqKXfQGZKQLbeDQi07LpaL1DWzH7f50nPbmLgUIx6+xdGkUwX+
         cVPFlQoJq4KFoDTJ1MS3SHVCvzbyAOCAWJV4uyV3BYeIBia0db3eBrb0KJ915pDrxno6
         pi/Y6sDkqt0CLD9PXNltiHmjRvy1mH5a6JBanrdnY33G82sEpJH4obJNquOC3aWA+5TT
         Nkow==
X-Forwarded-Encrypted: i=1; AL+hErH5da3a9wXMkzAdlqmx3st6idKtwgkymzqN2/nRgd2y92iI8xEr7cAukmxK7rkL6U2Bm1MiKmP/gs8T1Hw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/B6lz32tkP6ffaPkgThsWzgTFMxDHv6vx0qGfqD5JFwpeCksLG
	fE9p8OgtF92O9DCwNRhdWUt7XzsSC6DQZLsKIi0pYEvWURIk4HJth00kXL5dWsRaCIYD1aaiR3F
	bGroEd+CndB0eW6Bn59Jv+LcbHUcV7iYGRgKa1rQz9QyuRFHQNiRrJxY/FyxH9enc66iUgbvf7b
	+pLkKBiN7iYk5Ul6Rq8/sK22jjdUqNAB2YOqDNx3kpGCQ7glMlly74yAp8UmOX4d4x2gOgFNhLQ
	AvTMtYzWNDKOapYMA==
X-Gm-Gg: AZFdTZej1H1l6T0BbK/DBe70+3WOCyzj5ZDOh4PHuquqFqmFuqbzGc8RWuJtMdslMPL
	nQW9QfE9AeHRPjoQiX1BGJ0qc9QI3IyB/ESlpMfj13TOEx7nxHEaJ3f8xgV1bh505fQzAeiZj2l
	mtT0XDu6OuqqKYNRt/QOpC8h69D93TaYM3Jvqx1VWYgw/imCcNwBe/QlO/Xr+OAzp/kFUctOFsT
	xAmbrn8WTOqSuZjD+DhCLbLOb5LynTf7CrtH35EFbdFsgUIze4uAQy+QGogijzXdx4Hxz1eHZcu
	c6d0Ha3kQoDNhdt+j9685mbMzFA5+QUbXPllNXkH6k98eM/ZVlKSF7RkHFD0CFLCRuH/rr+1ogR
	Rx6EpDgMgTqV0V5MeFjAL1JtQYfgiWft3gSI8mEmyh5aBflKriLO984+02u0AmNMXc3rYqO74/h
	qeD1C8BYq4UMh1JYTc+snE/M8DzGYuqq/cbK0E
X-Received: by 2002:a17:90b:250f:b0:3b4:f648:c41a with SMTP id 98e67ed59e1d1-3b4f648c59emr1243622a91.46.1795607728374;
        Wed, 25 Nov 2026 03:55:28 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b405960cd1sm13464089a91.2.2026.11.25.03.55.27
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Nov 2026 03:55:28 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386a0f79047so6018787eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795607726; x=1796212526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FGw+GuWFY4q1fwKrolCVhW/WJE9ZxtYtJk0eTf7O0+c=;
        b=fHTKYE85UbDtlgOCFdTu0frbCM5IUGVsCUHK9oOACG1RNV+33GBkYlb7DDRAhqaqWW
         W4vBqL+nx5xJyPe1JZjbKJ2003gf2dw8tveJmQ2dX7zH2eX7iTxBHIVcJtg9gKpLq0KJ
         B+SghgvYbIR03KFxfmaHRK4D0PLT8HOdNUYIs=
X-Forwarded-Encrypted: i=1; AL+hErG922vl2oEdMVMxfFgQJIXPFoBcpsqsZwXks6YP+PYh820B07T2WPOTHK3dBadAMQ+o7jUFja8mSE64Wko=@vger.kernel.org
X-Received: by 2002:a05:7301:7110:b0:383:b90a:3535 with SMTP id 5a478bee46e88-386a0ab67c8mr12704701eec.24.1795607726434;
        Wed, 25 Nov 2026 03:55:26 -0800 (PST)
X-Received: by 2002:a05:7301:7110:b0:383:b90a:3535 with SMTP id 5a478bee46e88-386a0ab67c8mr12704666eec.24.1795607725771;
        Wed, 25 Nov 2026 03:55:25 -0800 (PST)
Received: from H5-S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm56693813eec.22.2026.11.25.03.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:55:25 -0800 (PST)
From: Vikas Gupta <vikas.gupta@broadcom.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bhargava.marreddy@broadcom.com,
	rahul-rg.gupta@broadcom.com,
	vsrama-krishna.nemani@broadcom.com,
	rajashekar.hudumula@broadcom.com,
	dharmender.garg@broadcom.com,
	ajit.khaparde@broadcom.com,
	Vikas Gupta <vikas.gupta@broadcom.com>
Subject: [PATCH net-next v10 06/10] bnge: remove refcount from L2 filter
Date: Wed, 25 Nov 2026 17:24:30 +0530
Message-ID: <20261125115434.2080590-7-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261125115434.2080590-1-vikas.gupta@broadcom.com>
References: <20261125115434.2080590-1-vikas.gupta@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

A reference count was previously used under the assumption that any
context holding the last reference could delete the L2 filter.

However, going forward, the filter will only be removed by the same
context that created it, making refcount unnecessary.

With no reference to take, bnge_alloc_l2_filter() now returns
ERR_PTR(-EEXIST) when a filter for the same MAC/VLAN key already
exists, instead of taking a reference and returning that filter.

The L2 filter hash table is no longer walked under RCU.
bnge_lookup_l2_filter(), which also takes over the RCU lookup wrapper,
and bnge_del_l2_filter() now rely on the netdev instance lock, and
assert it with netdev_assert_locked_or_invisible().

Signed-off-by: Vikas Gupta <vikas.gupta@broadcom.com>
Reviewed-by: Dharmender Garg <dharmender.garg@broadcom.com>
---
 .../net/ethernet/broadcom/bnge/bnge_filter.c  | 33 +++++++------------
 .../net/ethernet/broadcom/bnge/bnge_filter.h  |  2 --
 2 files changed, 11 insertions(+), 24 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_filter.c b/drivers/net/ethernet/broadcom/bnge/bnge_filter.c
index a8bb441ebef9..6316f75ca36e 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_filter.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_filter.c
@@ -4,6 +4,7 @@
 #include <linux/kernel.h>
 #include <linux/dma-mapping.h>
 #include <linux/jhash.h>
+#include <net/netdev_lock.h>
 
 #include "bnge.h"
 #include "bnge_netdev.h"
@@ -13,8 +14,8 @@
 
 void bnge_del_l2_filter(struct bnge_net *bn, struct bnge_l2_filter *fltr)
 {
-	if (!refcount_dec_and_test(&fltr->refcnt))
-		return;
+	netdev_assert_locked_or_invisible(bn->netdev);
+
 	hlist_del_rcu(&fltr->base.hlist);
 	kfree_rcu(fltr, base.rcu);
 }
@@ -31,18 +32,19 @@ static void bnge_init_l2_filter(struct bnge_net *bn,
 
 	head = &bn->l2_fltr_hash_tbl[idx];
 	hlist_add_head_rcu(&fltr->base.hlist, head);
-	refcount_set(&fltr->refcnt, 1);
 }
 
-static struct bnge_l2_filter *__bnge_lookup_l2_filter(struct bnge_net *bn,
-						      struct bnge_l2_key *key,
-						      u32 idx)
+static struct bnge_l2_filter *bnge_lookup_l2_filter(struct bnge_net *bn,
+						    struct bnge_l2_key *key,
+						    u32 idx)
 {
 	struct bnge_l2_filter *fltr;
 	struct hlist_head *head;
 
+	netdev_assert_locked_or_invisible(bn->netdev);
+
 	head = &bn->l2_fltr_hash_tbl[idx];
-	hlist_for_each_entry_rcu(fltr, head, base.hlist) {
+	hlist_for_each_entry(fltr, head, base.hlist) {
 		struct bnge_l2_key *l2_key = &fltr->l2_key;
 
 		if (ether_addr_equal(l2_key->dst_mac_addr, key->dst_mac_addr) &&
@@ -52,20 +54,6 @@ static struct bnge_l2_filter *__bnge_lookup_l2_filter(struct bnge_net *bn,
 	return NULL;
 }
 
-static struct bnge_l2_filter *bnge_lookup_l2_filter(struct bnge_net *bn,
-						    struct bnge_l2_key *key,
-						    u32 idx)
-{
-	struct bnge_l2_filter *fltr;
-
-	rcu_read_lock();
-	fltr = __bnge_lookup_l2_filter(bn, key, idx);
-	if (fltr)
-		refcount_inc(&fltr->refcnt);
-	rcu_read_unlock();
-	return fltr;
-}
-
 static struct bnge_l2_filter *bnge_alloc_l2_filter(struct bnge_net *bn,
 						   struct bnge_l2_key *key,
 						   gfp_t gfp)
@@ -75,9 +63,10 @@ static struct bnge_l2_filter *bnge_alloc_l2_filter(struct bnge_net *bn,
 
 	idx = jhash2(&key->filter_key, BNGE_L2_KEY_SIZE, bn->hash_seed) &
 	      BNGE_L2_FLTR_HASH_MASK;
+
 	fltr = bnge_lookup_l2_filter(bn, key, idx);
 	if (fltr)
-		return fltr;
+		return ERR_PTR(-EEXIST);
 
 	fltr = kzalloc_obj(*fltr, gfp);
 	if (!fltr)
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_filter.h b/drivers/net/ethernet/broadcom/bnge/bnge_filter.h
index ea1acefd70b4..372657cba43c 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_filter.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_filter.h
@@ -6,7 +6,6 @@
 
 #include <linux/types.h>
 #include <linux/if_ether.h>
-#include <linux/refcount.h>
 #include <linux/jhash.h>
 
 struct bnge_net;
@@ -49,7 +48,6 @@ struct bnge_l2_filter {
 	/* base filter must be the first member */
 	struct bnge_filter_base	base;
 	struct bnge_l2_key	l2_key;
-	refcount_t		refcnt;
 };
 
 void bnge_del_l2_filter(struct bnge_net *bn, struct bnge_l2_filter *fltr);
-- 
2.52.0

