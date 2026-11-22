Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795391851;
	b=OIS0j1Kf5OPMOyjM4waH5V2HDtkAFAVcQJO+V+eoFKIjtYwZKAs+iVlvtXEbkCBE7MlR
	 HgJOoj8ruNAs9B8f/PgcZPXAs/5RB1pUt1bHi1k5P1ylzYW9aUX1vftOuL6uzC/89InpQ
	 tP9xGr4pz4BGR2Z3XbnlkXKcB2iL7FVOfyW5fPc/TqR6VJ17W8OgtE0fPTL63kalg3Lu5
	 8oEuSDqgq9q1xqNDyQd+RbMvCVVoZsj3wWW59urpyCupz2uVhvery3RSpRx5oSBpMWSt5
	 VLm8FKHQrXJNAHpf/T+VsusSXdJ7H+dVGmMqLSRFFjHXZUJ4PxXXfrnjux6nZgVgklQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795391851;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3ZhQvCCp11cyui2gzdA+4jeQS6r4tc4Xix/KVK/fQc0=;
	b=efmNN46FADxG7tbICGR1yTn/JyrfWlYmB4zn0WMd1uZAOwHchxER7X4Hwu12T8INJG3L
	 w5dq8FfR6c9SluPiQhpKs4Dz9ZewgvtTYYbb10JDai9pSxPR50J6SW+VhslrjStVJdxCg
	 rmQTR7Tazas8Tkeu1wuZVa6RiFOAEKuQxAu7R3y3AbWgtnZVnp9hBb3ya8/ETYWJ4By1S
	 UfQzzE146Iz37A9n9xpqpUNzwwkxULv6mB7o3RYjpBnxeKZys79ca/I44ho4Su+VAiwlD
	 0QGqqdnX25LdYUn1qeMM02nJ38o/dBym0N4YeYwjb2lS98zWuKzcbe663rbKEG9z+ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b="I3i/PlYm";
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8AD606A337
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 23:57:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F8AD606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=I3i/PlYm
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-386ab9ab619so1134801eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 15:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795391850; x=1795996650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ZhQvCCp11cyui2gzdA+4jeQS6r4tc4Xix/KVK/fQc0=;
        b=I3i/PlYmvH4nq8usn6zSpiJtrQCHo8mtU3SWKpQE/ln9jU3tcy9VlPnC9lH2RRCNgx
         Aa1pzAKrhVoVKR3dGWiglYDJanmgiMlcCwk5mhS7dM/KaUNYi1tqi1fYhgTh4iVxK2Ht
         Wt8/L9EekuNk1cB+sZUvqiXh35kmmMMZPsNLjyaTx+eyLDnyrBsZcZuAF+ByVJKbOCRp
         tYamfeCjgThb7mrDMLnIb8gmlnoeYeH/AkQ85GlfJgHizZXikl1B/O4DRyFLfOntBjCI
         fesx0lZFBkEfU05Wzg6mvns0H85RIZc6Sp/KqQjCS5sB+7AvyCZXm1BK4gIA+TZQ8ZGm
         dCGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795391850; x=1795996650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3ZhQvCCp11cyui2gzdA+4jeQS6r4tc4Xix/KVK/fQc0=;
        b=Fy/2BW62vuBSte7N/fNBan7qFfwwbJXjtG59c+WEDvm8URJ3XhQi7tz/0yrJvio050
         Z5NOiws7o/3GfY9EPCz1Z0klvKunFBuksuQAqHnmZV7cp34fjPABmE/C9qVDro1pWecx
         dvzfERO5bKSTJxZcXyMxYhbj2FULewUmFqEQvBy8rTt15xIkLmbRC7HGak6q31PGyd/0
         hAiF87xAf/MHMPp9LJINpYkgxv8jNaWNgqh0S8NSQVN5RwZUz0sBcQ9PpsAzOmTiGyDv
         Tynqc9+q8YlDdxMN8fkA2lTJKBG2KZ2P5TcLUXBIbT4t9g4fJU2SCXGOwH7CxutY+XYm
         WUDA==
X-Forwarded-Encrypted: i=1; AL+hErESagxoJ18AK+QX7sTawaC9KpFyaux/kslL+XclgubjZsV6S22wDrQeVHb2oSdK9FwgEBYDGiuPsgrPrWI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nReNMuiT/UzvCHFY0cpFo+Vmhfuccz3vHrd35cEQ4cTtc9cqH
	8TGT13ZpKqEeTujE3d+wAvQ//k4MidiJWFveTUhptOgQ9XZn7qH2hkQD9YNWbbCgfoY=
X-Gm-Gg: AZFdTZfF+mYGUnLVaJIkHqgN+EHIxCG2kOz1acmFRAGUylmvkOeOQWNZrJuCk5mnxpp
	25r8cQoZ/fSqNk2YWUAPaHpDd55vbF0TyL7CQvZVy8vv+hdwieXZaMPcc+Nj+NLrZGfkd3NLrua
	t/UDb4iA3u381G/LW4HlUHXHWYlarAgL/Q23XBiTIfxpRT6XXkrk1wU1OnOT8H5e11L582wKhjD
	9SKNerGAN+piT71C3CdFeg416PTm4Dllslfrm10d8VmMG/l9o4vOrTQHpm3tzIQIi0YuC3ZK8+A
	XVmyv06pUlkrHuZqQeTrdsxD+WgokayEn4fWIchsSCfBq2HbrYsvd6AyEnqUgAzs6CAez3d79gF
	FAAHAzrZ0W7uMJZbO8S7FD/wA5NRWBrB/Rkdb2g5vtFiHg9TSoMSsFpX/s2+O7SUJWgY+rjNoVv
	0MPrWz4HUY7tGoWGBe81zR2i4zMCF1d9S2Q+9kFajtiPoICwcq2uIm5CZiHF2ldAi7YzVFyPbDX
	57TwfsisllGoPimj2oPzGBars6QYCzcHN6JA2+w66BxcOm9Ndv0VlW2bC8j5hnLavO8CIh/U18u
	RdjSZH3befMVvUUFwB7gzLfCbr3ciILpR0VE78wxZZzpYU3lg5tLhXQG0W733NtrT6JBIQXrGdj
	zA2KHUo97w9gK6PMMg2Ud/MLKfsg+CGAfsr56Tbgncic67TxR21I=
X-Received: by 2002:a05:7301:7e07:b0:36f:9d8:4a33 with SMTP id 5a478bee46e88-38570e21c39mr10880754eec.31.1795391850306;
        Sun, 22 Nov 2026 15:57:30 -0800 (PST)
Received: from devbox.ts.blockcast.net ([69.25.95.32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm34289386eec.26.2026.11.22.15.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 15:57:29 -0800 (PST)
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
Subject: [PATCH net-next v3 1/3] amt: make the A-B source walk linear
Date: Sun, 22 Nov 2026 23:57:22 +0000
Message-ID: <20261122235724.2898320-2-omar@blockcast.net>
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

amt_lookup_act_srcs() computes A-B, the sources of the group's state that
a received record does not name, by comparing every source in the group
with every source in the record.  That runs under tunnel->lock in
softirq, and only the packet length bounds the record, so a single
Membership Update can already cost |A| * |B| address compares at the
current 128-source default.

Mark the group's sources that the record names with one hash lookup per
record source, then act on the unmarked ones in a single pass over the
group, clearing the marks as it goes.  The cost becomes O(|A| + |B|) and
the result is unchanged: a marked source is skipped whatever its filter
state, exactly as the pairwise compare skipped it.

Found by review (Sashiko, on the limits patch); not triggered at runtime.

Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 drivers/net/amt.c | 43 ++++++++++++++++++++++---------------------
 include/net/amt.h |  2 ++
 2 files changed, 24 insertions(+), 21 deletions(-)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index b145ed3ca..79d68bcc7 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -1649,7 +1649,7 @@ static void amt_lookup_act_srcs(struct amt_tunnel_list *tunnel,
 	union amt_addr src = {0,};
 	struct hlist_node *t;
 	u16 nsrcs;
-	int i, j;
+	int i;
 
 	if (!v6) {
 		igmp_grec = grec;
@@ -1705,28 +1705,29 @@ static void amt_lookup_act_srcs(struct amt_tunnel_list *tunnel,
 		}
 		break;
 	case AMT_OPS_SUB:
-		/* A-B */
-		for (i = 0; i < amt->hash_buckets; i++) {
-			hlist_for_each_entry_safe(snode, t, &gnode->sources[i],
-						  node) {
-				if (!amt_status_filter(snode, filter))
-					continue;
-				for (j = 0; j < nsrcs; j++) {
-					if (!v6)
-						src.ip4 = igmp_grec->grec_src[j];
+		/* A-B: mark every source of A that B names, then act on the
+		 * unmarked ones in a single pass over the group, clearing the
+		 * marks as we go.  This is O(|A| + |B|) rather than |A| * |B|.
+		 */
+		for (i = 0; i < nsrcs; i++) {
+			if (!v6)
+				src.ip4 = igmp_grec->grec_src[i];
 #if IS_ENABLED(CONFIG_IPV6)
-					else
-						memcpy(&src.ip6,
-						       &mld_grec->grec_src[j],
-						       sizeof(struct in6_addr));
+			else
+				memcpy(&src.ip6, &mld_grec->grec_src[i],
+				       sizeof(struct in6_addr));
 #endif
-					if (amt_addr_equal(&snode->source_addr,
-							   &src))
-						goto out_sub;
-				}
-				amt_act_src(tunnel, gnode, snode, act);
-				continue;
-out_sub:;
+			snode = amt_lookup_src(tunnel, gnode, AMT_FILTER_ALL,
+					       &src);
+			if (snode)
+				snode->sub_mark = true;
+		}
+		for (i = 0; i < amt->hash_buckets; i++) {
+			hlist_for_each_entry(snode, &gnode->sources[i], node) {
+				if (snode->sub_mark)
+					snode->sub_mark = false;
+				else if (amt_status_filter(snode, filter))
+					amt_act_src(tunnel, gnode, snode, act);
 			}
 		}
 		break;
diff --git a/include/net/amt.h b/include/net/amt.h
index 9ba097127..f36efcdd9 100644
--- a/include/net/amt.h
+++ b/include/net/amt.h
@@ -287,6 +287,8 @@ struct amt_source_node {
 	struct delayed_work     source_timer;
 	union amt_addr		source_addr;
 	enum amt_source_status	status;
+	/* Scratch mark for the A-B source walk, under tunnel_list->lock. */
+	bool			sub_mark;
 #define AMT_SOURCE_OLD	0
 #define AMT_SOURCE_NEW	1
 	u8			flags;
-- 
2.43.0

