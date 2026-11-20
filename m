Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795201889;
	b=P6hQ2m7tQl+P0HEyONO8WegVy5UurDP5TsvzYfS9bytwukZ2+AnNXpBFC5BnBVmQ63SP
	 ddEJwPl4l2Be/x3OLXlJHNypkaDUAySEEXW7EnjvcYwe4bbA+auRBgHVpSH+UKSDKqX6J
	 WrOvw5KzNnQwojqFzKrgg+aV/ZwHhZaUvQAKwvFEQtcKeNV9DhIZug/I4ZVVNUbwcvHjZ
	 LfgSOIEeG3WCdMNS61Pnu0ae9ygZcHZE4sthYhkwo57dKn2m9U2BjM2zRjW+kY0OlKs+6
	 YYM+qwy6MXCcgFWfPYX9l1ku2TBZzKVL4f8z3Xb7T3l+bFmdmHF268/H5XGdxq8avNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201889;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TPzfbb3YaLrMvD09KlfQinHnJnyyczP5XVaqic2qKsQ=;
	b=VrQnVAaDGDWuG8QUuNZs3ky+2OqlSEEcb1JF7haV+Y5M27rvskxsUp4YikjisuiEyV7L
	 hggfASblrL9Q+RgwEI/Qs8KNmJjvDOPgajWPX5OKHLH9bwrf9pNA7SSL1BVUZltbHmKct
	 kTyzIEXQ3wXPRhJsU9ISeLp0x5bdgl0mjpXL3LuJZjI76KF5c9MQb2DRn/Wm0dQEMUMsW
	 PaSioDFbePL3kmzULgjwl/hQzR8uFtJjdPQbPh45cT8wgXHSc6i7Sdj5ZRRwk2/YX3a2L
	 3/mJoW05cikHwWH+VPZV7Bn5qSamTSiitvOmg/NHTdcU2OFGitFxqOb5YSjNFQl/pxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openai.com;
	spf=pass smtp.mailfrom=openai.com;
	dkim=pass header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=EyAeqo+A;
	arc=none smtp.remote-ip=209.85.160.45
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A447B60A2616
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:11:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A447B60A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=EyAeqo+A
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-490d838b425so670778fac.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1795201886; x=1795806686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TPzfbb3YaLrMvD09KlfQinHnJnyyczP5XVaqic2qKsQ=;
        b=EyAeqo+ApYsatSBApkkMjlHlP50A1jf1ordwq8G7XRSahNrIQlT44sMaDpYhR+Ok0t
         R+aY5JM6SLJY/b/xcYnYtrCz4KwIFQyyxdQPCgfcZR96rtn7ZDSaKGoklvHQh8xNRxi4
         1kOrqLVYX8IbYexCaysu4ONfbaFi7rUHFlVZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201886; x=1795806686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TPzfbb3YaLrMvD09KlfQinHnJnyyczP5XVaqic2qKsQ=;
        b=I9gn0D2D9YgN1AK5AGKDtTz5xwdgkh/7G2ej5E6mPAH6TOGT31rSek7YkB5vvXIk6t
         wCCNDS//rsnIVlU9qh+DyJfKgl2lX19iBWc9xXgOsJ5WbJ0k4K9kA0QoJ8FySlfhrAYe
         rL/qtYqxEGVfDFGvMEg8hbK50zX0c/WLqDo5WBxDNISgYP/fTDSmsKUIiFzzjUXy1I5K
         ZfvC+D7eE5lTZGTIjGzLimT52XF4roWaz4FNexa9+dPzSbc5UYjd5ieNLqI1OG1a10eU
         2zNt7KoIEhMFgJt4K1szQ7jeifMst1/67TiEdlv3ks5iHFnSaR8mXtyJbgvfcgGfDBaK
         WUuQ==
X-Forwarded-Encrypted: i=1; AL+hErGinXHOdbBIDXXdiEZJYU7M97oTRqPAiy2dpjpYPKSzvDNkbeve47BRLsXPr0zu6quR3OfY2dCJ1GQQ3e4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aUSIiNuFfTctOB0QsdHbZ1YkauBlw+Y8h+UhMUpFhdk+ljYIo
	L82YGk1gBpKEznE6UiWTQUw4ghsmt9d0CErTmmyRQRFRzda35Z2Y35GfOhozlM/UuVo=
X-Gm-Gg: AZFdTZcQNz1muTzk+Pn+aXpsyAfXkbJeIyGcZ3zWw77VPmDJF2amWNJp7K39H5+HCrh
	PPAv/S3OJS+YVrPp5dQsX53/ijLJaXbaY+6I2KRL5dD5/hQJWMeaKdA20v0rrgJ3lm0mrSK1q8J
	tLr5uEm3U8vOwCokubn02kmKRV4UOcs2gdI4UbyRD4bMYmhO9fYviZuT6VIFKr9VP08zaz0kXWQ
	4k5206zq48uvntIsHAChXeLFM/MgVhDhI1+q8YHFyR2VOCcRscuO514KsUj1l2yxauhHBuwKbL7
	RJfx0kTpUG7GeGoBfcgFGlUVCpA4KH1TuG0545R2uxvccp+PYFBxJwEri8PYQ9+coPSnajdNNkA
	hMnwl4RPRaMITArz80fWXDgVDYEE+Ja0uJcwCoWFjZv3GBXaKE6Dpb9jNSld1zPdc7pfugsueyP
	tiW0e4TUXZ+Iqp+QIDnFDCeuDykwbQ4vV1Tq3uLaJi9j/FH4rYBlSvzfSArAewV2Z1cFyLLuMsj
	IVdetGmFuc6bM4fWmsAQjsS4sqq+md0l/mkKbYAAIvR/BSG+rpp8fNX+xSRcMzyw6Zk28NlHvNl
	vYt5RDn3FzcnnLcGVWAhhtx2/hQO1HiMnTU+cXJFlf7w6iMuMMu/W7zpQwbBuWTaVPbTSMteY8k
	IycD4eAjifbtS+fWgMdQYo617xJ3noGIrjKlFrhK8N5xTUcnvDWxz
X-Received: by 2002:a05:6870:3193:b0:475:a1ec:9617 with SMTP id 586e51a60fabf-4bc80ec71b9mr3905456fac.25.1795201886207;
        Fri, 20 Nov 2026 11:11:26 -0800 (PST)
Received: from com-75606.corp.openai.org ([199.47.143.1])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc60497300sm3706193fac.11.2026.11.20.11.11.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 11:11:25 -0800 (PST)
From: Kyle Zeng <kylebot@openai.com>
To: dev@openvswitch.org
Cc: netdev@vger.kernel.org,
	aconole@redhat.com,
	echaudro@redhat.com,
	i.maximets@ovn.org,
	davem@davemloft.net,
	kuba@kernel.org,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	Kyle Zeng <kylebot@openai.com>,
	stable@vger.kernel.org
Subject: [PATCH net v4] net: openvswitch: make transport checksums writable
Date: Fri, 20 Nov 2026 11:11:15 -0800
Message-ID: <20261120191115.39932-1-kylebot@openai.com>
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

OVS can still rewrite an IP address after transport-header extraction
fails. The checksum helpers check skb->len, which includes non-linear
data, before directly accessing the L4 checksum. If the transport header
was not pulled into the linear head, the checksum update can read or
write beyond it.

Call skb_ensure_writable() before IPv4 TCP/UDP and IPv6 TCP/UDP/ICMPv6
checksum updates. Save the original addresses and reload header pointers,
since even a failed pull can move the skb head.

Keep failures nonfatal to preserve the existing policy of rewriting IP
addresses when the transport header is unavailable. A failed pull or
unshare may leave a stale checksum or CHECKSUM_PARTIAL seed; the receiver
may discard the packet.

The issue was found by an LLM.

Fixes: ccb1352e76cf ("net: Add Open vSwitch kernel components.")
Fixes: 3fdbd1ce11e5 ("openvswitch: add ipv6 'set' action")
Suggested-by: Ilya Maximets <i.maximets@ovn.org>
Cc: stable@vger.kernel.org
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
v4:
- Document that both IPv6 checksum addresses must be outside the skb.
- Use the IPv6 address fields' sizes in the final copies.

v3: https://lore.kernel.org/r/20261113232158.61174-1-kylebot@openai.com
- Select source and destination addresses with booleans instead of
  calculating offsets. Keep the saved IPv6 address across head movement.
- Remove the redundant IPv6 fragment check and correct tab alignment.
- Move testing details below the separator and clean up attribution.

v2: https://lore.kernel.org/r/20261107040238.27606-1-kylebot@openai.com
v1: https://lore.kernel.org/r/20261030042304.74291-1-kylebot@openai.com

I have a reproducer for this issue and can share through DM.

 net/openvswitch/actions.c | 80 +++++++++++++++++++++++++--------------
 1 file changed, 52 insertions(+), 28 deletions(-)

diff --git a/net/openvswitch/actions.c b/net/openvswitch/actions.c
index 12e339cbf791..7691f262294d 100644
--- a/net/openvswitch/actions.c
+++ b/net/openvswitch/actions.c
@@ -319,20 +319,22 @@ static int pop_nsh(struct sk_buff *skb, struct sw_flow_key *key)
 	return 0;
 }
 
-static void update_ip_l4_checksum(struct sk_buff *skb, struct iphdr *nh,
-				  __be32 addr, __be32 new_addr)
+static void update_ip_l4_checksum(struct sk_buff *skb, __be32 addr,
+				  __be32 new_addr)
 {
-	int transport_len = skb->len - skb_transport_offset(skb);
+	struct iphdr *nh = ip_hdr(skb);
 
 	if (nh->frag_off & htons(IP_OFFSET))
 		return;
 
 	if (nh->protocol == IPPROTO_TCP) {
-		if (likely(transport_len >= sizeof(struct tcphdr)))
+		if (likely(!skb_ensure_writable(skb, skb_transport_offset(skb) +
+						sizeof(struct tcphdr))))
 			inet_proto_csum_replace4(&tcp_hdr(skb)->check, skb,
 						 addr, new_addr, true);
 	} else if (nh->protocol == IPPROTO_UDP) {
-		if (likely(transport_len >= sizeof(struct udphdr))) {
+		if (likely(!skb_ensure_writable(skb, skb_transport_offset(skb) +
+						sizeof(struct udphdr)))) {
 			struct udphdr *uh = udp_hdr(skb);
 
 			if (uh->check || skb->ip_summed == CHECKSUM_PARTIAL) {
@@ -345,32 +347,37 @@ static void update_ip_l4_checksum(struct sk_buff *skb, struct iphdr *nh,
 	}
 }
 
-static void set_ip_addr(struct sk_buff *skb, struct iphdr *nh,
-			__be32 *addr, __be32 new_addr)
+/* May move the skb head; callers must reload packet pointers. */
+static void set_ip_addr(struct sk_buff *skb, __be32 new_addr, bool saddr)
 {
-	update_ip_l4_checksum(skb, nh, *addr, new_addr);
-	csum_replace4(&nh->check, *addr, new_addr);
+	__be32 old_addr = saddr ? ip_hdr(skb)->saddr : ip_hdr(skb)->daddr;
+
+	update_ip_l4_checksum(skb, old_addr, new_addr);
+	csum_replace4(&ip_hdr(skb)->check, old_addr, new_addr);
+
 	skb_clear_hash(skb);
 	ovs_ct_clear(skb, NULL);
-	*addr = new_addr;
+
+	if (saddr)
+		ip_hdr(skb)->saddr = new_addr;
+	else
+		ip_hdr(skb)->daddr = new_addr;
 }
 
+/* Neither addr nor new_addr may point into the skb, since
+ * skb_ensure_writable() can move the skb head even on failure.
+ */
 static void update_ipv6_checksum(struct sk_buff *skb, u8 l4_proto,
 				 __be32 addr[4], const __be32 new_addr[4])
 {
-	int transport_len;
-
-	if (l4_proto == NEXTHDR_FRAGMENT)
-		return;
-
-	transport_len = skb->len - skb_transport_offset(skb);
-
 	if (l4_proto == NEXTHDR_TCP) {
-		if (likely(transport_len >= sizeof(struct tcphdr)))
+		if (likely(!skb_ensure_writable(skb, skb_transport_offset(skb) +
+						sizeof(struct tcphdr))))
 			inet_proto_csum_replace16(&tcp_hdr(skb)->check, skb,
 						  addr, new_addr, true);
 	} else if (l4_proto == NEXTHDR_UDP) {
-		if (likely(transport_len >= sizeof(struct udphdr))) {
+		if (likely(!skb_ensure_writable(skb, skb_transport_offset(skb) +
+						sizeof(struct udphdr)))) {
 			struct udphdr *uh = udp_hdr(skb);
 
 			if (uh->check || skb->ip_summed == CHECKSUM_PARTIAL) {
@@ -381,7 +388,8 @@ static void update_ipv6_checksum(struct sk_buff *skb, u8 l4_proto,
 			}
 		}
 	} else if (l4_proto == NEXTHDR_ICMP) {
-		if (likely(transport_len >= sizeof(struct icmp6hdr)))
+		if (likely(!skb_ensure_writable(skb, skb_transport_offset(skb) +
+						sizeof(struct icmp6hdr))))
 			inet_proto_csum_replace16(&icmp6_hdr(skb)->icmp6_cksum,
 						  skb, addr, new_addr, true);
 	}
@@ -396,16 +404,28 @@ static void mask_ipv6_addr(const __be32 old[4], const __be32 addr[4],
 	masked[3] = OVS_MASKED(old[3], addr[3], mask[3]);
 }
 
+/* May move the skb head; callers must reload packet pointers. */
 static void set_ipv6_addr(struct sk_buff *skb, u8 l4_proto,
-			  __be32 addr[4], const __be32 new_addr[4],
+			  const __be32 new_addr[4], bool saddr,
 			  bool recalculate_csum)
 {
-	if (recalculate_csum)
-		update_ipv6_checksum(skb, l4_proto, addr, new_addr);
+	struct ipv6hdr *nh = ipv6_hdr(skb);
+	__be32 old_addr[4];
+
+	if (recalculate_csum) {
+		memcpy(old_addr, saddr ? &nh->saddr : &nh->daddr,
+		       sizeof(old_addr));
+		update_ipv6_checksum(skb, l4_proto, old_addr, new_addr);
+		nh = ipv6_hdr(skb);
+	}
 
 	skb_clear_hash(skb);
 	ovs_ct_clear(skb, NULL);
-	memcpy(addr, new_addr, sizeof(__be32[4]));
+
+	if (saddr)
+		memcpy(&nh->saddr, new_addr, sizeof(nh->saddr));
+	else
+		memcpy(&nh->daddr, new_addr, sizeof(nh->daddr));
 }
 
 static void set_ipv6_dsfield(struct sk_buff *skb, struct ipv6hdr *nh, u8 ipv6_tclass, u8 mask)
@@ -479,16 +499,18 @@ static int set_ipv4(struct sk_buff *skb, struct sw_flow_key *flow_key,
 		new_addr = OVS_MASKED(nh->saddr, key->ipv4_src, mask->ipv4_src);
 
 		if (unlikely(new_addr != nh->saddr)) {
-			set_ip_addr(skb, nh, &nh->saddr, new_addr);
+			set_ip_addr(skb, new_addr, true);
 			flow_key->ipv4.addr.src = new_addr;
+			nh = ip_hdr(skb);
 		}
 	}
 	if (mask->ipv4_dst) {
 		new_addr = OVS_MASKED(nh->daddr, key->ipv4_dst, mask->ipv4_dst);
 
 		if (unlikely(new_addr != nh->daddr)) {
-			set_ip_addr(skb, nh, &nh->daddr, new_addr);
+			set_ip_addr(skb, new_addr, false);
 			flow_key->ipv4.addr.dst = new_addr;
+			nh = ip_hdr(skb);
 		}
 	}
 	if (mask->ipv4_tos) {
@@ -533,10 +555,11 @@ static int set_ipv6(struct sk_buff *skb, struct sw_flow_key *flow_key,
 		mask_ipv6_addr(saddr, key->ipv6_src, mask->ipv6_src, masked);
 
 		if (unlikely(memcmp(saddr, masked, sizeof(masked)))) {
-			set_ipv6_addr(skb, flow_key->ip.proto, saddr, masked,
+			set_ipv6_addr(skb, flow_key->ip.proto, masked, true,
 				      true);
 			memcpy(&flow_key->ipv6.addr.src, masked,
 			       sizeof(flow_key->ipv6.addr.src));
+			nh = ipv6_hdr(skb);
 		}
 	}
 	if (is_ipv6_mask_nonzero(mask->ipv6_dst)) {
@@ -555,10 +578,11 @@ static int set_ipv6(struct sk_buff *skb, struct sw_flow_key *flow_key,
 							     NULL, &flags)
 					       != NEXTHDR_ROUTING);
 
-			set_ipv6_addr(skb, flow_key->ip.proto, daddr, masked,
+			set_ipv6_addr(skb, flow_key->ip.proto, masked, false,
 				      recalc_csum);
 			memcpy(&flow_key->ipv6.addr.dst, masked,
 			       sizeof(flow_key->ipv6.addr.dst));
+			nh = ipv6_hdr(skb);
 		}
 	}
 	if (mask->ipv6_tclass) {

base-commit: 2800868f63227c8237d70c41e70d441c919620d6
-- 
2.55.0.openai.911.g06873a30d2f3

