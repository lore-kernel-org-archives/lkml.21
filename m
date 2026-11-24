Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795554308;
	b=xwV7BM1qWyPKtzkJ4jZpXkWqsdHEHyTLqNdrg23psOpvtjWgn5WJlpcTgogI6gbRYwY9
	 3LV8OFQuIKLfu79zxTL3R89R4bKxiOIabcF6V3X0FWJOoV/l4gLTt1O4yWRGU8wTJTL68
	 EI1XATl8rfbvyVz+djaIuiSTDfv1+HLGz2/7pslrDR20Oxb8OeKmAuVp2PxAMKVGRjudn
	 R1/zpnwqKqBcuBY2YqDmAH+ItsGhUdSiq+jPiqS7hLqv1YcpvYMgyKUcr0IUT4OTcxfuV
	 pGgKBkSLR2Uhy9TnyMJsDMO+bGjE9hWAytkExhGH9tAfDAxD+UDGuRXbINUlS21aBHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795554308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lpgsJPZBtmfp6Rhe7SCjLiDLVJwKnJJblvuR/GL5/ac=;
	b=YxvJVFTO4NMFNCHL7AfRc4tJi83Sa8Z26K63Ir7GLgQOLAIE0RQ7DpNO8/UO9SWqXvho
	 Xf3kn3UIhFtN4/d+fXf0TuGpG1RLblTGD531hna6sFxYlXxZTvwRbd3Vv543PQJJYrPvK
	 pr2qzW89cD4aaAlhn5LuSt0qwwJ5vQtrlgs9YAyN5tc9NDWUzr/r1Iyfa8wN58yxXnQ2S
	 CdRhqoBsy9UU0g4HsU2OIHmhn8kFVkq+aw4ZtiCLLt3gf00Ib4osrrWuDxrBQfcBtMz//
	 7wERhB3CMYT7s2IcPG3CXOKqDbWm8+q4BT6w4dqSNu4pzLJuUZV99tNfe1EgkEbEc5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=pt+RZ3B3;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D136606A687
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:05:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D136606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=pt+RZ3B3
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3863db981d4so6907955eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795554308; x=1796159108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lpgsJPZBtmfp6Rhe7SCjLiDLVJwKnJJblvuR/GL5/ac=;
        b=pt+RZ3B31N5NdJCUe8LOcd3CfL1VDdnqlTSErwpLMQXpWEs0p6v286jvv8zRo1u1NK
         WkgNkKYf0coCvWLdGIt7WygP9WLKrOq22EX9WN/+pFu9/e0fjH9CGDrT119/MuJkwLbf
         Lb7oYsqY+D7nyFvbY6ZhDf2iuLwzTAPWyPkXY3U0n7N06jLrXXlmJMhOJTT0LC6ZjcI6
         mQHa9W4DbKzDvAjDlwtZhU/DUmEpehc6eVYBI3ZXymTyhUpRa5/Rt9gXZYKx+LmuMNlp
         qNVPGBHFfEo5jLIiQZuUtOczqXK7rembddXlcw51NvmxTOYdWNxO6ot7OMLgO8XyuAlR
         /38w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795554308; x=1796159108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lpgsJPZBtmfp6Rhe7SCjLiDLVJwKnJJblvuR/GL5/ac=;
        b=26I160bABMwK65PF5/Yrn4OY7M2yBmHjqE75E9BBO9Jxo9JG1I6vyig/5HBM66y/bM
         sxWCsV0mbjNn25hGuFAPr262AIodwjQUOFY17TND+XtlRz7E/4wJbxxoB/uapv9I9A8l
         7TAfoaniRQoXNiB97ewzvGI1dOZ7gM1Ts7n2ifrUBMFm8rCBLLbpKYu+aHmn9Wj1pbqE
         qV6FfVz0IB5rL/yNggR5xSrywzT1E216mOCbYKrlQZVsiy+H760o9/61osI9CdZmASkn
         CZrKyXGThYiaIqDq8OK3qJDq6Ws8ny11DUPmkMHa64ZhBHguPgOzx//K5QVHr+3PajTx
         6rCw==
X-Forwarded-Encrypted: i=1; AL+hErG5xuaYaQLGqv7YI/F0LZE7XhfZyywOAy9aAIVfzn3NBChP8HXKy/DzbxJi8L4Qu4l2Wsg4AZPmkxrMQyQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9GIbbu423GHHuB/dTzQbXuJlKjuMgluuX1bUv5WTJBW6Fz8gUF
	uZA1dutuX2d1zSXSufQStOlVxd0ZqOIIo2pf7L+spatSyXnl8DkRN3jZ8kc3Mcrm9IsZCMe/Nmb
	fxcUq340=
X-Gm-Gg: AZFdTZeUTgNs6mux4/yp+APRaCRZqIH6l2qPB/ErmJlOLwGhaGj7aebc+vIqcQrhC3F
	cQoTs4DhOgHzhGjaEc+8dQBrNEGudRSAcgWlUE7LdEKKZYHRp8DXwFSmREPRBskIQpgZCRJGkcw
	NCe+3Smb50F5DVOa7ID6Ic6fhKUM6Hn4geyklDFE5YvRIn7ks+dHYOoVrK19nwUCPr7IdHKbQuQ
	5B43kpUg5N73AvNOeuDt6n9FDH00R0Ieu3qKoHB5wBR60zUnRek8pRabi4Rq8KqgnYFcMJTTkUe
	TUx+Ss9V8CL3+80A31ilCuigjcto4DOL5TPHg+ehMDCdc2t/0BQ1xR+HcWZ8JQUn0cXrIUlXucA
	K6F6ArwhJ+qs5ulYtN/D+Pxxf660itsK67B1HdcWsv5v9U39Si9fi6oCvtbFisrxKTDkwjpEJLB
	kWHNZaI7w6OVRKm4u5N2RAyWQWk1M9+SdNFIWWB7jhVfjB2gU26+lW6GPd/Vg0S8Q6mYjbuyZ++
	2rroa/Wr0SiKE4RTC9W955Dm/wT7psurftqhH9ZoMISF98QGkBQ5RL7aFzwr2YbJCLKLL4SqdPm
	KMhAv+ucoLY9aYe6/x0iGPr2j0Pe0qcMei+Ocbvo1Ok4pLYe8j6e1MrXUdbVPZZWLtp/xiyO6BV
	oOp1ErTRhYIdjrGqTcHr1p72+SoK4U/4oReV10Q57s90uhBSHdT0=
X-Received: by 2002:a05:7301:6408:b0:36a:270:ce76 with SMTP id 5a478bee46e88-38570f2b27dmr16630459eec.33.1795554307334;
        Tue, 24 Nov 2026 13:05:07 -0800 (PST)
Received: from devbox.ts.blockcast.net ([69.25.95.32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386c7c62a91sm5577813eec.17.2026.11.24.13.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:05:06 -0800 (PST)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Simon Horman <horms@kernel.org>
Subject: [PATCH net-next v4 2/3] amt: bound the source-state work of one Membership Update
Date: Tue, 24 Nov 2026 21:05:00 +0000
Message-ID: <20261124210501.70394-3-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124210501.70394-1-omar@blockcast.net>
References: <20261124210501.70394-1-omar@blockcast.net>
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

The relay applies every group record in a Membership Update under
tunnel->lock in softirq, and ip_mc_may_pull() is the only bound on how
many records it applies.  Each record walks its group's hash buckets and
sources several times, so a report that names the same full group in
many short records costs far more than one that refreshes the whole
tunnel.  At the current defaults a 1.5 KB Update of about 180 empty
records against one group already walks the group's 256 buckets some
nine hundred times.

Charge each record for the passes the mode handlers and
amt_cleanup_srcs() make over its group and for its per-source lookups,
and stop applying records once the total exceeds twice what refreshing
every group the tunnel may hold, with every source, would cost. A report
that refreshes the tunnel's whole state uses half the budget; one that
exceeds it is truncated, as a lost report would be, and the next
periodic report restores the state. A record for a group the tunnel has
no room for does no walk and is not charged, so records the relay
refuses cannot use up the budget and truncate the same records from
every report.

Found by review (Sashiko, on the limits patch); not triggered at runtime.

Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 drivers/net/amt.c | 54 +++++++++++++++++++++++++++++++++++++++++++++++
 include/net/amt.h |  8 +++++++
 2 files changed, 62 insertions(+)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index 79d68bc..177bc0b 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -2157,6 +2157,30 @@ static void amt_igmpv2_leave_handler(struct amt_dev *amt, struct sk_buff *skb,
 		amt_del_group(amt, gnode);
 }
 
+/* The source-state work one group record can cause: AMT_REC_WALKS passes
+ * over the group's buckets and sources, which add_srcs may grow by nsrcs,
+ * plus AMT_REC_LOOKUPS hash lookups per record source.
+ */
+static u64 amt_rec_cost(const struct amt_dev *amt, u32 nr_sources, u16 nsrcs)
+{
+	return (u64)AMT_REC_WALKS * (amt->hash_buckets + nr_sources + nsrcs) +
+	       (u64)AMT_REC_LOOKUPS * nsrcs;
+}
+
+/* The most work one Membership Update may cause: twice what refreshing
+ * every group the tunnel may hold, with every source, costs.  The packet
+ * length used to be the only bound, and a report that names one full
+ * group many times costs far more than one that refreshes the whole
+ * tunnel.
+ */
+static u64 amt_report_budget(const struct amt_dev *amt)
+{
+	return 2 * ((u64)AMT_REC_WALKS *
+		    ((u64)amt->max_groups * amt->hash_buckets +
+		     2 * amt->max_sources) +
+		    (u64)AMT_REC_LOOKUPS * amt->max_sources);
+}
+
 static void amt_igmpv3_report_handler(struct amt_dev *amt, struct sk_buff *skb,
 				      struct amt_tunnel_list *tunnel)
 {
@@ -2167,6 +2191,7 @@ static void amt_igmpv3_report_handler(struct amt_dev *amt, struct sk_buff *skb,
 	union amt_addr group, host;
 	struct igmpv3_grec *grec;
 	__be32 saddr;
+	u64 budget = amt_report_budget(amt), work = 0;
 	u16 nsrcs;
 	u16 ngrec;
 	int i;
@@ -2194,6 +2219,20 @@ static void amt_igmpv3_report_handler(struct amt_dev *amt, struct sk_buff *skb,
 		memset(&host, 0, sizeof(union amt_addr));
 		host.ip4 = saddr;
 		gnode = amt_lookup_group(tunnel, &group, &host, false);
+		/* A record for a group the tunnel has no room for does no
+		 * walk, so it is not charged.  Charging it would let a host
+		 * joined to more than max_groups groups lose the same tail
+		 * records from every report.
+		 */
+		if (!gnode && tunnel->nr_groups >= amt->max_groups)
+			continue;
+		work += amt_rec_cost(amt, gnode ? gnode->nr_sources : 0, nsrcs);
+		if (work > budget) {
+			netdev_dbg(amt->dev,
+				   "Membership Update over work budget, %u of %u records ignored\n",
+				   ngrec - i, ngrec);
+			break;
+		}
 		if (!gnode) {
 			gnode = amt_add_group(amt, tunnel, &group, &host,
 					      false);
@@ -2335,6 +2374,7 @@ static void amt_mldv2_report_handler(struct amt_dev *amt, struct sk_buff *skb,
 	union amt_addr group, host;
 	struct mld2_grec *grec;
 	struct in6_addr saddr;
+	u64 budget = amt_report_budget(amt), work = 0;
 	u16 nsrcs;
 	u16 ngrec;
 	int i;
@@ -2362,6 +2402,20 @@ static void amt_mldv2_report_handler(struct amt_dev *amt, struct sk_buff *skb,
 		memset(&host, 0, sizeof(union amt_addr));
 		host.ip6 = saddr;
 		gnode = amt_lookup_group(tunnel, &group, &host, true);
+		/* A record for a group the tunnel has no room for does no
+		 * walk, so it is not charged.  Charging it would let a host
+		 * joined to more than max_groups groups lose the same tail
+		 * records from every report.
+		 */
+		if (!gnode && tunnel->nr_groups >= amt->max_groups)
+			continue;
+		work += amt_rec_cost(amt, gnode ? gnode->nr_sources : 0, nsrcs);
+		if (work > budget) {
+			netdev_dbg(amt->dev,
+				   "Membership Update over work budget, %u of %u records ignored\n",
+				   ngrec - i, ngrec);
+			break;
+		}
 		if (!gnode) {
 			gnode = amt_add_group(amt, tunnel, &group, &host,
 					      ETH_P_IPV6);
diff --git a/include/net/amt.h b/include/net/amt.h
index f36efcd..82aaa6b 100644
--- a/include/net/amt.h
+++ b/include/net/amt.h
@@ -392,6 +392,14 @@ struct amt_dev {
 #define AMT_GC_KICK		2048
 #define AMT_MAX_GROUP		32
 #define AMT_MAX_SOURCE		128
+/* Per group record, an upper bound on the passes the mode handlers plus
+ * amt_cleanup_srcs() make over a group's buckets and sources, and on the
+ * hash lookups they make per record source.  The handlers need at most 5
+ * and 7 (EXCLUDE TO_IN and EXCLUDE BLOCK); the bound is rounded up so a
+ * later pass does not silently exceed it.  See amt_rec_cost().
+ */
+#define AMT_REC_WALKS		7
+#define AMT_REC_LOOKUPS		8
 #define AMT_HSIZE_SHIFT		8
 #define AMT_HSIZE		(1 << AMT_HSIZE_SHIFT)
 
-- 
2.43.0

