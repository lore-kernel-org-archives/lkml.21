Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795391853;
	b=EYEcY/e2WMtW+Zh4cjS6kPPCXx8Zk/A+sWkks94+pmbyg5TSxQz4bLS128+T+p7le4K+
	 y6PskxocVYEinmwbepJHkZ7zSXLJ6tJEdOPOvPS1YF6toK99nO72PvtpRIKslyNcmAA+4
	 n8KUh9/J2MUeHmiczmZIjLFkH87yqOGoVOkR0AWoDeO3wg3f4NBEaxCwTlajm59XMfzIf
	 CCRLd7OYZmqdek57YtInJCzyyXRWpGfAYxef67r5TYWTCsqHTYROHzPRS3EAAZ2vklfWA
	 MsdPTGxp8W/M9lDddJVsaUbE02P4KKxr3+WAUKKLsmhXnxRu2QhXYaeSVVL7SNtsm0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795391853;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=twwsbhNrEyvlcTQgdiEiAI2kQlmXcclrqaF8/FbQJhQ=;
	b=huDfTzrBGFHFWvUpCKFnwIG1kIMdymQIy0aBgpa2ZcyPO6X3HLhNfjQeHb/LwbWoWZ8n
	 d2nEbUO2BE5bK4SDgcjOtl9YquDwP40LbXXJ4MCksGvbQrziyKHv4FOIqRscBsDmCPR1D
	 iAJRAQwDS0fc28PdGfkB9rJ2FwTywiXcBU2dLZ+PhF8fJb0oRSRJKNeKbvnGgJjXslDvW
	 3IAPAcx7Q1eYT8vsVh2dp9O10JIkHFhB12mNDtfYeiBHk3vrVAxb3NaxuwHSaJxhQaTLc
	 6B+ZbPqgfN0PWFGj18iScGgHbbyBn5cWFIcZf1OuFri98ZOG+tmhk4wMWTCpSo2mTgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=Pb2Oilg7;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB518606A69B
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 23:57:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB518606A69B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=Pb2Oilg7
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1a2761c69fbso955478c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 15:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795391852; x=1795996652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=twwsbhNrEyvlcTQgdiEiAI2kQlmXcclrqaF8/FbQJhQ=;
        b=Pb2Oilg7pSU+FcXuYQsHj5y2eCCaT7hcox/M/7+2XQfZUkqwrk8U7rHEHGz0KWG4YU
         K+TpC4flg9W6+buOW7ybhrq1Yoz75+qRnwUNqq7qgm5BSH+pknOz80JVzX0fURvdluW/
         /a7RBJV+xkMENyFFgoGPASLHLgfbXy9u+fIwbT4bpe6M6/u5+NyBXAfzA17JHXcXOzwz
         Hlde7X+LcNlZvtyhTxuCJpuDBu7+CEEO5HWtGt7mXR5n/aMyJGimYepexwF98QwQs+kk
         9Ww5KOf6BmYqyuXMTtN1cs8fGzSDcbg0VLE4PweqpQqvOTJuo86PiyGQNEzIv9taCTJ0
         Mx9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795391852; x=1795996652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=twwsbhNrEyvlcTQgdiEiAI2kQlmXcclrqaF8/FbQJhQ=;
        b=wnJ+mav1QN9/Pm6l/BItvW8inYX16AaTjXuTRqKGsut96lce8hY0MivpaZeCEjEBeZ
         KjtWE6kWKG3ZJu418suA4NhrXMwsIsHpij1zvfjbzdDk28EY84OaFE5SWq7e6SqdBCPB
         teSNFAHakiXQAeKzdElFifi3sW6izPitcNeWTkcfGJ8p9J/sMBG+j5a6072BpjPOghMX
         Rerv40Y07X4TENYSWuGONwjXEXvBxRctZh8VVYzrgLBginudi0ARPNGVizb41HoB37u/
         uGU1QsQmIegGxgkGWzQiWS94hvFNlYHi8ddZqx+p5pf/Wcey152GT2/zXPqWm3r3lChr
         2nlA==
X-Forwarded-Encrypted: i=1; AL+hErF6y6tZqKKWSm3vKCh3YsxxpOJcySccvhNXbXYMRF5DjKH+OafgP0Kpeow7Efd0WShbJ18zLCV/z8V5Vy8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5tJkZZORTz5Mi6bi7JkDbR3Ks3nP5PnYdmIqM4RXQr8VxDrWJ
	k077d/eRA0BWNfPaSSBt97Qpog0Mo83utPuFVZFzgnrOvSs1VV3NDEgRHTaUdKL7k20=
X-Gm-Gg: AZFdTZfGs/Gf36a2iF+BoeFwiFV5fVs2dRJXMKHL12J55EL6LCZlcp7/U+CFbQJi+Fq
	4SK10oCD38HL3zzH8NaZ8zsMBdC6wC7Bqm0rgBbIXENTrvdLKyATYKOocMZXKVpPArXqfD8HIR+
	o+A8IVDNckSmOPP8EsrSzegOGWJQoImMF0fMZysxtDikziFKFGeJGKQ3HtRN3RJnFBrye0DDiC8
	PLNQxgcM437gB66Fz6VjMy2UM0Gw+cyPVIvagCKObFjdpofbO4UpmkHugog9rQsqkte8Upv+hrS
	pIMC8VLO7aPd2eiIti7Yby2UT5v5Y0/ap5uPHbF28i/bcrynsbrGciJX5PW0g85L8hzdBeFzcVz
	204cgSCnkHaynzUtODd/LLD2ZITlTgqDKpmdy0ahLcdt0qE9TgancfOq3k2DP6ufIKdE6t8796O
	Yepi/tfKjNXVm21Gnf/oAZxWzoXgAVRHK88Db0NQUXqP7gH+ZjKWF59L9x35D0X9NvOOQy8En4x
	8MO6KpAGqxvn3EDNzMTlE/6+KSTkT+79r0D0Q0Mp23/CIaYpuczU/WveyBhIwhlEgUCt6aNd2qk
	M3j/NcUWYQxnPWoYt8I8twikdCJ75RloBjnZGJDe3+7J+wqYD1XVVNnfkDETdVvc7SRzAwKu8rY
	c9BFELxgiYTx8Lu6mKaQ12UcZ9LRXSGWdbeKELK/HUbH9pIT63zN3Ih6zqf8tMqB1aNIC8Tqc
X-Received: by 2002:a05:701b:2616:b0:1b3:ba92:145a with SMTP id a92af1059eb24-1b5568e0a27mr9374716c88.19.1795391851945;
        Sun, 22 Nov 2026 15:57:31 -0800 (PST)
Received: from devbox.ts.blockcast.net ([69.25.95.32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm34289386eec.26.2026.11.22.15.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 15:57:31 -0800 (PST)
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
Subject: [PATCH net-next v3 2/3] amt: bound the source-state work of one Membership Update
Date: Sun, 22 Nov 2026 23:57:23 +0000
Message-ID: <20261122235724.2898320-3-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122235724.2898320-1-omar@blockcast.net>
References: <20261122235724.2898320-1-omar@blockcast.net>
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
records against one group already walks the group's 256 buckets over a
thousand times.

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
 include/net/amt.h |  6 ++++++
 2 files changed, 60 insertions(+)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index 79d68bcc7..177bc0b7c 100644
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
index f36efcdd9..96357b3e3 100644
--- a/include/net/amt.h
+++ b/include/net/amt.h
@@ -392,6 +392,12 @@ struct amt_dev {
 #define AMT_GC_KICK		2048
 #define AMT_MAX_GROUP		32
 #define AMT_MAX_SOURCE		128
+/* Per group record, the most passes the mode handlers plus
+ * amt_cleanup_srcs() make over a group's sources, and the most hash
+ * lookups they make per record source.  See amt_rec_cost().
+ */
+#define AMT_REC_WALKS		7
+#define AMT_REC_LOOKUPS		8
 #define AMT_HSIZE_SHIFT		8
 #define AMT_HSIZE		(1 << AMT_HSIZE_SHIFT)
 
-- 
2.43.0

