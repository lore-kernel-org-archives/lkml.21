Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795634102;
	b=W7N3XA8gtqGSlTGo3A0XMhVgTylX2vAkRZRyiefQuJfSUcNnZRYuSbX+uohCFCYeh01j
	 lk+lU3ernhlm4TLMeyfoRn3B2TQUUz4FL0JSNq+4D5x8G7RXJLM1GDusbMMBMBcKQ/2Q2
	 eb5CTMqeNXTX9Lz8ANgkPdhaz/ettVY5zTfizoWSlnr21l/KC5Sfd2K61cgswLrfdvLms
	 sqqx1aCBBNUaDuS59OQywkCxpWDHCBSXJvMQcgnLMl8/DImrClzEQWcruPjHExNPVEdSa
	 R9Fc8fxV7E4/NiHWr+CNM4sdJv5sk4lm5YX0pS/Gm4T1d5rZHhNcSIx9c0myXLe9hJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RQ0qOYB/39Na/Yq4hwyOeXHfqpAHtgIw+NnAsae8SXo=;
	b=E8HPEihS40gkIFUrMmjnqwGobahJZFBGWRCghsd3gPfx9W8LYPItMVz//cFHmikW0JoE
	 3nMRAGqAoGnV/2KrPHBalqcz3A53S+hIXLTWNtcHeH7aArqMjR+5hKIJBuY686NVADKaQ
	 9413xIU8UGWNc4qbHdWqKX0STVb6xbJWUaQHXfmUsm8MXQtykGZzuaW6MimTvDjgjAijB
	 hmp4i9BrelwbuTmh2SGX/P6mBLImXwvyoSUKD+uwYPIOa/bwBweiBfhyr39yt1Zg+kU95
	 6smySW21cKMzb7f2qDcDRP7fkYLL91B85TwT3SvA8xREFK8sFBrqnN0cHVHKVM1MCig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=DfL9MmBx;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C27D606A6A5
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:15:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C27D606A6A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=DfL9MmBx
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdadf7e248aso2529806a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795634101; x=1796238901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RQ0qOYB/39Na/Yq4hwyOeXHfqpAHtgIw+NnAsae8SXo=;
        b=DfL9MmBxHLNIrneAJzkABBCadW5CUPH10Suv9KIUmuiMYUg/Tj0PJ2cJ9lWOFluUa3
         7LHMbLAU4eDtrxzz5vbMCpBZXANW/VsrJjg58laKT+wtfGcAzpfz0zsWXFp7sQpoo9NV
         vgKla2lZCtSeabMIDIILOgQFK/hebgkx2JdL9uPbpLhPeNXdzx4Vph+DxnkR+54jmLZb
         BHBaepE6QH+z1L3qAWpTZLIHQHLLBSoNkf4Q12yi4kcjTadL2T7N3GNgZV6hIoBAcenc
         Vn66n1oaz3HczDeE9ImE8IC8HHOQ82j1TqIjOmO1qW1r5BJHcaX+b0yTiLpF9TnlHtNR
         VB+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795634101; x=1796238901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RQ0qOYB/39Na/Yq4hwyOeXHfqpAHtgIw+NnAsae8SXo=;
        b=QrLlbFxptWJSJIPjrd5aqG8mOJGLMTh4Kp27HJAttmGDp+0A4/DJZnzV0Pn5pRPjKv
         /tSrQorogcaYkq4yNpxnaxrfJR18ZICWWr5la6uzXysX3TCLLjejq1DLdNp2B7okBctG
         D0KR1cQmWtqdSaogDapyk2PAZPCh8S7ZSwVdbw5K67nVpJOWZIIAt7maC05IFtJGOjHF
         XnT6pdNCWj+53/DpcQByP8D/j6Sh0/2xicQK55D3scMF96EDDpFvLJOfSstnMhzEdU3k
         81SDgAkqyJPxuI82JTRVjp80JSt4Z3+l4VYyyLokb9EwS2ebVbqQmOr9hUAWo7weHVQ5
         WJKQ==
X-Forwarded-Encrypted: i=1; AL+hErGH51ccSlhOR4d2pk8gQmKHvrOQPu7dLADOA04dnbOe0SuCLhVH9EV6HlLbmgupeCYCmlh2p5JECdQIOYQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bsA8++LK6doKazMDNRLMqQNnANl5Kf2cofAuRZrH+ETAamEDV
	1mEgRxTQ+zYaaRFuC7PtW5yd5jcFmvovQfp1LZPvdTR6/+jEOMgPde40mhVlh4LIiqU=
X-Gm-Gg: AZFdTZeJv/NpDSTrIxoD+ZUgIfZT/y39oEWMjVizT4kI9R9yU363MknkPEURuKVyMUK
	LTasoh/lQFEmzX72xBCOvLbxahD8jW3VD5wbylBg0SDVeJ0gqfrX6jwFkVjP0rUuUo76rcwSiKI
	JahImKIMqq7bxjaH3dVAomtd1gSIqMd3uDmEcda0VLEY+Apqq3gIBQOyNtfDIFwWZ/L+6xYVydS
	nPxsmIJDrgJUEcmRq/BFT0QEjqrStPIbwdKN3rD1xyRbnB/6lpkj7+Y9aRQFJ2PAnJKdsd+FVi+
	Ooh4j922Mq7VhQtcqa+M+0eDUs6jIyJTk2smMxxdrHNR+CazZ4AUXXTseF18aCV0FzNhFZ3CfhQ
	D3WTieD0EgGerX1fYlM6mBzbU+lxQcXa1wchYZY1h+Zy21F6gEkV+d+gXpqjyMwvUUwyqPBXcNQ
	sermXztEEcnJfPsK7Wcax5IbQQUMAdsueSUiBLW8zm56w6ugHRPdXTisu/65tusKFnnKvzdyuc5
	LJBewcpdzhM2Tud86MziLaKx8mecMNhd9SOVfqSU3fymnItI2a1PEXGVoUbQYLeRAXpz07AIK2U
	EmOoaWNwqx4eNKTTajcNRBSUTH7wwCaOmtrib2vRG1V0exE5+2PcwG4mBWxGwbKW6I2vWRjsZdm
	Lo3Y17ojQQzpAZsruVFgmyl07ixWx5KYDwgYsQ98DU3rNOr+/ky0=
X-Received: by 2002:a17:902:ec8b:b0:2e8:6ae2:75db with SMTP id d9443c01a7336-2f03f18a9c9mr172756885ad.41.1795634100805;
        Wed, 25 Nov 2026 11:15:00 -0800 (PST)
Received: from devbox.ts.blockcast.net ([69.25.95.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f105b66sm92413855ad.51.2026.11.25.11.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:15:00 -0800 (PST)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 06/12] amt: size the encapsulation headroom by the outer IP version
Date: Wed, 25 Nov 2026 19:14:44 +0000
Message-ID: <20261125191450.2497936-7-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125191450.2497936-1-omar@blockcast.net>
References: <20261125191450.2497936-1-omar@blockcast.net>
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

The amt device reserves AMT_RELAY_HLEN or AMT_GW_HLEN of headroom and
subtracts the same amount from the stream device's MTU. Both assume a
20-byte IPv4 outer header. An IPv6 outer header is 40 bytes, so on an
IPv6 device an inner packet in the last 20 bytes below the MTU would
not fit the stream device once encapsulated, and ip6_fragment() drops
it: nothing sets ignore_df on the tunnel skb.

Add AMT_RELAY_HLEN6 and AMT_GW_HLEN6, pick between the IPv4 and IPv6
sizes in amt_hlen(), and use amt_hlen() wherever the device sizes its
headroom and MTU: at newlink and on NETDEV_CHANGEMTU of the stream
device.

amt_v6() is still false for every device, so there is no functional
change.

Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 drivers/net/amt.c | 26 +++++++++++++++-----------
 include/net/amt.h |  7 +++++++
 2 files changed, 22 insertions(+), 11 deletions(-)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index 823367e82..cb2ce552b 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -104,6 +104,14 @@ static unsigned int amt_ip_hlen(const struct amt_dev *amt)
 	return amt_v6(amt) ? sizeof(struct ipv6hdr) : sizeof(struct iphdr);
 }
 
+/* Headroom the device reserves for its outer encapsulation. */
+static unsigned int amt_hlen(const struct amt_dev *amt)
+{
+	if (amt->mode == AMT_MODE_RELAY)
+		return amt_v6(amt) ? AMT_RELAY_HLEN6 : AMT_RELAY_HLEN;
+	return amt_v6(amt) ? AMT_GW_HLEN6 : AMT_GW_HLEN;
+}
+
 /* Snapshot the outer source address of a received AMT message. */
 static void amt_outer_saddr(const struct amt_dev *amt,
 			    const struct sk_buff *skb, union amt_addr *addr)
@@ -3903,10 +3911,10 @@ static int amt_newlink(struct net_device *dev,
 		amt->qrv = READ_ONCE(amt->net->ipv4.sysctl_igmp_qrv);
 		amt->qri = 10;
 		dev->needed_headroom = amt->stream_dev->needed_headroom +
-				       AMT_RELAY_HLEN;
-		dev->mtu = amt->stream_dev->mtu - AMT_RELAY_HLEN;
+				       amt_hlen(amt);
+		dev->mtu = amt->stream_dev->mtu - amt_hlen(amt);
 		dev->max_mtu = dev->mtu;
-		dev->min_mtu = ETH_MIN_MTU + AMT_RELAY_HLEN;
+		dev->min_mtu = ETH_MIN_MTU + amt_hlen(amt);
 	} else {
 		if (!data[IFLA_AMT_DISCOVERY_IP]) {
 			NL_SET_ERR_MSG_ATTR(extack, tb[IFLA_AMT_DISCOVERY_IP],
@@ -3929,10 +3937,10 @@ static int amt_newlink(struct net_device *dev,
 		}
 
 		dev->needed_headroom = amt->stream_dev->needed_headroom +
-				       AMT_GW_HLEN;
-		dev->mtu = amt->stream_dev->mtu - AMT_GW_HLEN;
+				       amt_hlen(amt);
+		dev->mtu = amt->stream_dev->mtu - amt_hlen(amt);
 		dev->max_mtu = dev->mtu;
-		dev->min_mtu = ETH_MIN_MTU + AMT_GW_HLEN;
+		dev->min_mtu = ETH_MIN_MTU + amt_hlen(amt);
 	}
 	amt->qi = AMT_INIT_QUERY_INTERVAL;
 
@@ -4053,11 +4061,7 @@ static int amt_device_event(struct notifier_block *unused,
 			amt_dellink(amt->dev, &list);
 			break;
 		case NETDEV_CHANGEMTU:
-			if (amt->mode == AMT_MODE_RELAY)
-				new_mtu = dev->mtu - AMT_RELAY_HLEN;
-			else
-				new_mtu = dev->mtu - AMT_GW_HLEN;
-
+			new_mtu = dev->mtu - amt_hlen(amt);
 			dev_set_mtu(amt->dev, new_mtu);
 			break;
 		}
diff --git a/include/net/amt.h b/include/net/amt.h
index 245947113..eabe6fa7a 100644
--- a/include/net/amt.h
+++ b/include/net/amt.h
@@ -434,9 +434,16 @@ struct amt_dev {
 #define AMT_GW_HLEN (sizeof(struct iphdr) + \
 		     sizeof(struct udphdr) + \
 		     sizeof(struct amt_gw_headers))
+/* IPv6-outer gateway headroom: the outer header is a struct ipv6hdr. */
+#define AMT_GW_HLEN6 (sizeof(struct ipv6hdr) + \
+		      sizeof(struct udphdr) + \
+		      sizeof(struct amt_gw_headers))
 #define AMT_RELAY_HLEN (sizeof(struct iphdr) + \
 		     sizeof(struct udphdr) + \
 		     sizeof(struct amt_relay_headers))
+#define AMT_RELAY_HLEN6 (sizeof(struct ipv6hdr) + \
+			 sizeof(struct udphdr) + \
+			 sizeof(struct amt_relay_headers))
 
 static inline bool netif_is_amt(const struct net_device *dev)
 {
-- 
2.47.3

