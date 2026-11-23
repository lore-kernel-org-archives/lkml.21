Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795428669;
	b=ZD7d5RHT93lqaqzVr8ZOl93qCrWMxa/cm85TrzuFZt9N7t6plJ2SNSnruH1yafaLss63
	 xpezj5A+pGcAnfnJvHgyof/YCOYZ6YayBx+/FvgG7Om68l3OaMNBEmKUWjyVTE4IO5ABa
	 uaYBgx0jJ+GwZPEngyEQsUp13F4KzlTdxGerr7mkRQe+nYbLMPYXI1T2lt9tpggrOyz6l
	 jX0GciqVM8xQQslR428yPOmmXBtG/LLekEG87RqrTweyuppk8YLMGj3/zjXP7/GVGq/fM
	 uYbpAZJAg4o3Vw2QHduDohu57wzYI2qfuLdeEQ8zmkU/S8HuD9v5g0UcARhROZh7qpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428669;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=XJyJ08sR86/xKJbZYcdm5hXrclIzfYMcFJVS99ypPws=;
	b=nKEZN1zsNlWFdjjnku7crztu59+Z6moI86uNSxDjih8RCBPkrOqcP7beaXnxqtZnrPvv
	 WUeHko79pGdaTZCiMn/waF4hTYzmX1N/IRF7jzXS4oaiQN/Ae2HjK6RZOfm6SE+EVfE1T
	 ZRyIg/tOfQhm7AOSMYI5fmvId/My0ki+VtVy2VoWPByxLQdbmtfgWEE47Vdga8ocrRw7Z
	 CBNGjwb9pWbH4vq9d/HVv15MC921my0/tNh8lKi5ML96vdLG1KV440lDHSMSqX0+0axV2
	 qY7szxyQSLvjGTw8tza2lxYqLIQC10vntPiBsw50ZSJAXalaoaUXc3yToXJv1h2+X8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=atOe2YCa;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BFA606A333
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:11:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03BFA606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=atOe2YCa
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3b0e0e65adbso1273957a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:11:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795428668; x=1796033468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XJyJ08sR86/xKJbZYcdm5hXrclIzfYMcFJVS99ypPws=;
        b=eoa0Q+DSlivAFfsk7TOzJkZUamJ7ZWZm25zrnkVZLm6YkNDDtnfHbIpGcjh+kDos7J
         iafo3BVSU6dBNRFRTVcMlhLQ5KuoQ4rkVlTY+GOpr7FyGQs1Vkd+aDQgyv5d+jhl2fwq
         MEdBp8MO2WpM7cGvaefqqkmStWHiEH2P9lTsFT5EhuQf7keb1R+BP2/uIvmI1J6J+ez9
         +q14PC1/Ntmn/1EVD7hdxp3iWhxIlDrUcOTQEd0aZ9kVtrJWjzuYvhtzskeh0+EuIbpd
         Bz/XHRE6BBoOBbUvrDMbxLCfaqScP9Li0trkoEwqF0zuJ3i12glw7DBon2GO1IXrE13m
         feVg==
X-Forwarded-Encrypted: i=1; AL+hErFkM8PhF8hfOAvAWjS8iR9z5imtuR+3A/fYF2xwEbAIZj3F46mvu8Q8u6fUTA1pyQUKl2iyqaKOJzzuuCg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+REEU2IRhYHTwWANm2eeXAHMAJ3Ax7J9dVPRaYPuP/31T6Pc9
	HTVWQZn8E36AwUuuOPwMnhy2yA0dWwoevmvzzJl5x4sGZliWQyJ8/6LpVo6H6YJ+qP0B4GfdcEu
	ZNnlhOzeB0pbB80KXT51X6Eqgb3ZVZmhUMiTXiRKvlr+WEDUH2JyVhnvKCQUNqGzqtPUbItLP/5
	bu8XQQg+pHRLqM/5+MzKoFy/QFf6sKVNaUFWI5uCsIBJYEmInT/Zf79kp3o+CQZrWWRfpVIeCHg
	8XJ4YbMPpK+xuyuug==
X-Gm-Gg: AZFdTZdSsvv6eGyxipY/3bkNFI7MUQcz/ewANWDXS/f2sTmDM4iFrMPikaketWD5eB6
	0OXEYOT6P8ZTMZdbOLksiQjed4Frg7TE6c5o06xF3Sh+ve7HbUBKGiZeMly2AIrh2fLH0tzd4Oa
	s0LPVNZAuXg5Hmyg444qFiCn/8mT5gwt5Ap0sTilyN3oUm8OwtNKFbqQSOgy4VKoil3J2//GWtP
	K4WtYjJBd3keIL2u9hJ5koS+hmIyyQjoRdRGoIsMJcgCbd65QO6Hvk89wCkKWNWtC6FqsDMDy5E
	Su4FENNHbKTTE0Or2f4i2ObJLLi+cxBRVYrUoUSCFTIOL1ra52dUqVpHzvknwt8X7m5OQbceISU
	/CLJtQydoZM3lz74a+MP5W3XhZrfLPIr/cTwljA9E6gu0Q4GCpv79I3lHCcvO5VjnEQANK1uyof
	aa3I3EQYRt3Onmw+ftbRN6HqqsMtszvIc4MfhH
X-Received: by 2002:a17:90b:3f0f:b0:3b4:1b37:ac89 with SMTP id 98e67ed59e1d1-3b41c8ff71dmr14953568a91.34.1795428668232;
        Mon, 23 Nov 2026 02:11:08 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b411775fa6sm8916718a91.1.2026.11.23.02.11.07
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Nov 2026 02:11:08 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386a65fca25so1589305eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795428667; x=1796033467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XJyJ08sR86/xKJbZYcdm5hXrclIzfYMcFJVS99ypPws=;
        b=atOe2YCa29+s9EF0d4UQ+9tN7K3Trir2J9P84ytCDug0SW9J5lK/2dTfjVBisewM5G
         k9WSqXc2+fwKjei5kbU45hHqnnTZjKfJ2IPxA4GXA2twWhZPrrTqad0RyYN9OZS6bjI6
         ZX7JYXvgvWxl4NyjwF5FGIWfMFt0YfmCOD3p4=
X-Forwarded-Encrypted: i=1; AL+hErF81tkyf+GQoDWXmLk52JCA3hBl1+InG83NDpqGjYNc4F/ShxdEzWJJebWanc+egcfp0+ErSDXa0vrrbfs=@vger.kernel.org
X-Received: by 2002:a05:7301:259a:b0:36e:800a:71fe with SMTP id 5a478bee46e88-3856c4b844cmr11088260eec.1.1795428666580;
        Mon, 23 Nov 2026 02:11:06 -0800 (PST)
X-Received: by 2002:a05:7301:259a:b0:36e:800a:71fe with SMTP id 5a478bee46e88-3856c4b844cmr11088237eec.1.1795428665918;
        Mon, 23 Nov 2026 02:11:05 -0800 (PST)
Received: from H5-S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm1084358eec.9.2026.11.23.02.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:11:05 -0800 (PST)
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
Subject: [PATCH net-next v9 06/10] bnge: remove refcount from L2 filter
Date: Mon, 23 Nov 2026 15:37:42 +0530
Message-ID: <20261123100746.1975030-7-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261123100746.1975030-1-vikas.gupta@broadcom.com>
References: <20261123100746.1975030-1-vikas.gupta@broadcom.com>
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

