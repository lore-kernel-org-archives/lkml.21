Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795554307;
	b=M8FnBP7yIFZt4naoOQcqb+cXJTksTLbtUkPULhamMoWisUlXQI1dhx05bqFfZ6U1B1oo
	 5AD0E6TTGq4P8DWKQc6htL8Zhd6IvQv4K86rMSQqs11ODJ413dqZJhbc70coFEDQk5fF6
	 7cOCKoMk4QdXUMRJMFqCGxYcN3VqjOeWLIEMbW2gtA/8Weagy4ID5v+jOqQExULq8DjCY
	 c0GhU2tDVaCe+5VBkrpPhFxfXN1F5vY9IW/KSP9SU5ZFh+AYN0MAm+jH+8bytNnfkzsuT
	 rQawb4QT2vSODeBMlz5X3iVtelzEK7cm9nzwePiPbFWPu0Zk1727AyMkiC1o6Z+IlZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795554307;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UmA2umeLZrbw/WzpeTlK+rLisE0ZHQXK9KgTiLSI5UQ=;
	b=FstcdNzxEoZAAz92bukojV5MtNPj4qZ/JD//eC9Fgxj5Kp3wchrJctS6M5xaLZ+sUQMO
	 4Z9ZUKrFIBhHRBOUScJZoj80kpjYi2h/d1U63ErKQ8PW+fN2N6LLwKsBLIhTNryT9a5At
	 b00RIl0oITsoUAv24/Y325I4wttnc6cc/d98IuVAi+TZRaLpa/Ad9tLv61TiSAm4IRhxJ
	 Lht86ExX1vfIUnyeu6QZOI1SpfYt/1H65LrAmGQ8YWwTSKRwYtn4R1Mlf2c1iSL3ikDIP
	 yD5Yu2AsfwDhMoNp8m8fyn4n3ZLV+Rm9/bGLwgdEyZ2eRq45WnFleMiLXCbIt6qfXsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=pLN0dEUJ;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E71606A680
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:05:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94E71606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=pLN0dEUJ
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-386c71feeeaso1185794eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795554306; x=1796159106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UmA2umeLZrbw/WzpeTlK+rLisE0ZHQXK9KgTiLSI5UQ=;
        b=pLN0dEUJsTDnVw+3dEKjTxvx4nnyo4iT3CkdrQD4cCNzoGPlDM8cNc64o9/bCGe1pl
         gZ/yPeHtZW09V+9a5knWliWmIhhpjUC4Tx8CepqV2BGZ6p12MxNf5IvqkwB9PhuAp0Da
         68rFiEHSeumPYo/funN1/bZCBrCsbjoJdAzhB57UPjtyAHgEO36UsqNf63tNvoOZaIBz
         aupa7y9ovlYbXrbEkWcPDO6/ps0NCHX9dwUcYgaM6tlNVZG4MDFOF3OBPsHmzRypKAer
         lcBZVcA1ghDtGzVha4x/aLXXXbuI1jCcQE5SdsxZ4p2o+7LcUOTpsBDswOQfG+d33VX/
         McCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795554306; x=1796159106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UmA2umeLZrbw/WzpeTlK+rLisE0ZHQXK9KgTiLSI5UQ=;
        b=QEDnsLvsvkGgPk0z4NupXLGKn0Rso/fAk+OGtGjiyhc7NO1FhHdBo1+QpH04IJI1Gl
         dh2dv7pwkm7CVD5l+zsXC9yPd/onyPUviw4WCWTfW/VA/pHgMfTGcnQUKLMX6EGq+t/E
         VjXb5Y9WjoDSid5DIsfhUs6ywY803cnKhXAjJYyK+33igiGKinLO/L+wxfLUxj5OpibK
         HjbesaX2RSu0entr/+HydM45L8cWWDKlVW1xmMC4kzFnl/AZEciOXlvNs2sjG6aaWPCY
         j1QGokWN7tSNZz/XEFO/RMzA1HLzeDTVQ+OY/KH4Shyl5gzI0zUwsWIkvFqQKt9DD4j1
         SgVg==
X-Forwarded-Encrypted: i=1; AL+hErFI/G3Jbh9oc28dTzJUTxH5frjx84hHtdFSCx18dqY/+/9fgC0vJTgMKyBcIr33TthECFFdmh6W3RXphg0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wIk6UeZ/oBJC3YhtENEj/TxO6goM0VDgstXRLiW3hQGH9lAlU
	OAY4b6PSVIiEPFHXTCRPzDfOOtNkqGVLXgvLXO66emHMw3xPDv/R8LE3tNez/SSU/04yHxWdx7y
	uu+SNK/w=
X-Gm-Gg: AZFdTZcTOwbWRRRktmeh2yHKW0rIqLa6eekMz48lsb2x0X0ZS7g4xkeRWZk0EDsGNEK
	mTCy7NdhCQYqT6+v6BiLM/xI9ee6+/MV30YYi+I//f8CxZr3ccOpMqJPVeIiOpIDltwumh79DBR
	M5DgOWtrioOriS+Nd21Unv80liRpbzZFK0iLqY75biGYxxXlDGcVd94KoYe7DDnay3By/yzyqE7
	kQI7ZxQc9xTPcxKjBlpXNEKBfQpyyogT0wWhnv1fbG6Fp5XDfRGIKNxJORlmSloCw/D4IHjimfx
	yQcgkB2iuMMcvznc9u7UyqAqsV1LsdQbaCyyUo2+mX98xZmGXifXiaY2kC1cd6boyXr9lqHpyUs
	wVXaGjbpJisFMU+3Ss4WMrDkY0SIpBvo012GKxx6VmuS98kN6MpgCIcabXT8HqwmbLIGDa+Szhr
	BwhcayWozzLVu4YdGuGHs4FdJ9FQ4vt6rVVt5r0YpT/rDi+DdK1/vS+Vo4dYDFiexVyotzs4pSA
	Py3m3/wIncvCudEyKCwIbw5XOEXggCsbY6Rhjh2stNkt1RwscjE225lsCrFmGvjyMgXtbjUX0v+
	MiTFCD2hzmpY5i3Rm6bBoA3gqUG+l6+6aQSeWtXLzCouIVlSUq0PPwF6r/u0qoz6iJ4DuEmVlpb
	rasK3ETrO2ZzsPJSQg9o20E+iYR8ENIN1b1lQ929gMYIWB3zhEWE=
X-Received: by 2002:a05:693c:87da:10b0:386:aaac:7017 with SMTP id 5a478bee46e88-386aaac73a6mr8299966eec.26.1795554305617;
        Tue, 24 Nov 2026 13:05:05 -0800 (PST)
Received: from devbox.ts.blockcast.net ([69.25.95.32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386c7c62a91sm5577813eec.17.2026.11.24.13.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:05:05 -0800 (PST)
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
Subject: [PATCH net-next v4 1/3] amt: make the A-B source walk linear
Date: Tue, 24 Nov 2026 21:04:59 +0000
Message-ID: <20261124210501.70394-2-omar@blockcast.net>
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
index b145ed3..79d68bc 100644
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
index 9ba0971..f36efcd 100644
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

