Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795622058;
	b=m0vnq+MS9BiUHosDonkU8XVokwYbDuZxFvNREa/VCo9ju/VmiH3IbDQzbpv7Z3kiPXng
	 WLxcme7fhiPpgPnXQJEpTaTuvGEHbR4FPoPJ6/3QRQdI2IJ/wHJsS7uLs05GHzrv9Xydm
	 w5S+rRa1LtH6u8YbmmYx1Sgy7f/zI8LJEzmZNpKrV3I7/51Rv6R0caebTQ6Z/QaW1UUHi
	 ZpXnxy21gAtzeddt4qhHT5HVgTOjDx3XHXBVrQ+QNuCxnuaFXRJIc3wxzaiHp5W7gW6No
	 n3ORAvAw5KZQZpjJTgrLx3DB6eO9bGquVFp+ztMqoj05AjOXnY3gFmxdyQRjWYpv9KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795622058;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YHXuawiUpwNY2szoFdGgfHXE+Q4G4WBDyJMC/ImDtFE=;
	b=MFU8muuk1iUiWdi/WmNojYwMhfsw4j3dqNF6bLH8ySyNYqsvFc+ZSIlx9uemnX7D4rjb
	 w6RIVQRjLQZEARrnB6/4VfTlMvTj5mJyj8DrSr/4Bq1VcmLZfdjZ9LbsGM/OnJnN26H0V
	 ZzwM/48t3K1RWBsmjXK0jtVsHX+u9rhFDWxZroij35Rse6eNAxfIWMQi01Z9t9lGp8SwJ
	 vce9m33+58N1KE5sFeU0xMHeCUhk2fPPmd1lGEfLaExvNjmIV0Vm8+c+I6O8YJsvGC1SM
	 NrjrDZpidCIdLfFoQWw/3IXvOLVBkM1abTL7zQNJlpqIDv+OjBKs0evh9lmyfM6gY+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=stellman-greene.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EhSWb8cb;
	arc=none smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C374606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:54:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C374606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stellman-greene.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EhSWb8cb
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5495d549924so63899941cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795622057; x=1796226857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YHXuawiUpwNY2szoFdGgfHXE+Q4G4WBDyJMC/ImDtFE=;
        b=EhSWb8cbvJXQkVd57RFQHhjQtapNzdaAWFC2CyPdGCtbIhojBvC3Jijq1xi1fAqSdL
         1M2cu2J3RaOBFWG9DseMyYMogqdV8f66xC+aIVjWe2uMqmOpFlU5WIakTsXLSfF6U0Nj
         AkctaGo5oYf8anZKgNWUWfm2AOGaKwjG8S7s4uv+BmT4x9V/J0aA0V9Xc/Hv3HE0cvZF
         gwydHkK2HJynUavJFO9g/rdK1epdd/MnkrPtgt7OClMwEj2xbEWi5uHvk1ZtmzDUz3pO
         cR6Jp/o0f7CjlbcXx90jY1sJgUGUiIcENgxyEEcrzztKf3hww9r26cT7fxS7WWuTPF3R
         YwDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795622057; x=1796226857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YHXuawiUpwNY2szoFdGgfHXE+Q4G4WBDyJMC/ImDtFE=;
        b=yp/77lHIlvL26xlAd2stpJSqJgJdlTR2pCBayKUEuVQv5K+woalHW9DvWIRox1fpFq
         nX+BPLyLIU8/tuw4Pg0ebVuwA83zYLsRLTj+caK9VjuXei0uwvXcm//ew/nitijTfyf4
         p8Fr0Fi1i4dhi3yo2lK2IJATs2smg2VwBWBS8x05RmcS2m1F0GEotqKeF8G9H8ohauMm
         yPhO+BtQAL8XxjlMcfciLOBmRnXwNMWK4PDTopWGnaR5vrgklbkToRplUS7+UNnL/ZhV
         Q33weKsvymnLerfg8geXe3aKqtWhs/VqFB9sL7Zxd8Tn1RwpIU9ogc0SrHiJcOH5HOkE
         AVHg==
X-Forwarded-Encrypted: i=1; AL+hErFBmRTQ76q+bU4Q1i62B+0d26rVeaPpdtML2zbBC9DQ/Ev4xanISmOa73HQRsma05VQQ5dO2FLiSsrRLKs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WBGwk/T6AXMWAh6Va9wFxOwz/iUQSgPNA9Kk6+wcIZMS1bFRW
	TBqg097hl5lpZRbl+INAshdh1UnABbalMh0V1Y9gz+6c6J6dgkXY39drIUkfkxPvmbM=
X-Gm-Gg: AZFdTZe2UqVACDAR2cBWi3Ge13VUyuVZD1ybzyPEsMOk2ABVs+HkSPRoITkSRjIudDu
	FtZ5EFm81L0L/jw06WOoq7c41D02Fuw5CL76eUb2QzHaMN6O+NaglBW1cxSUw0+6xHusrMpk0Wl
	YW0I2qhOyXtxtjSszP4HQ9SnZfdzS0UgwLj3+zhGoNJEOpn29m29RkEJKk2DUSS7dpqM4SUkpE8
	xrsLkLj90jDJUyOoej+RjYT1Ea4gyRD1tOhpSSrELS9/2kHMGBYihQHOYvdsj5jTiJq6eVht928
	giHw4ERvpde+l6d2qM0TOYktPyFJbcGmt5unDJKglY5WyqPcbEcnAgAgTxPKP8x7LsRJKAxIhfB
	uy8B/4bXEzwn6NVzG2GphLnAp2u0H8UQWwH7PDTDCib4njqstd0WcwIfu5qNqtT09kxWiIgouPE
	OyjjzScqynVHiBf4qXF3b/eY3656OZLaRKbYSo+GZFNYb9KJwme3gYTOQRS8jDzEl6IN106v6GL
	+M6LB0Eh9jXgmQJYbaVY5I4Myw1iQITlE8zkR6Ek4R7ZB5h6vAZhW+oak7+th6VuTdS9UJRnV1E
	LTylN1kbitQalTdJwIsJJLODbuAfNSqF1TewHCusvh4CrZtuMv7Z6yEpPLrdjOZ8lx8i8MManLP
	1rygADDz98gpHu7Fx+GkTX8pfAnud/DVZdu1VRo6XJmRP3zxY3c77fbyT9R3Jysx1/73uXw7Iwb
	7++sVaIExCBu0CjYRI+DO5JPniaIY=
X-Received: by 2002:a05:622a:178b:b0:536:6902:daea with SMTP id d75a77b69052e-55d769e0bc4mr338203191cf.23.1795622056943;
        Wed, 25 Nov 2026 07:54:16 -0800 (PST)
Received: from Mac.mynetworksettings.com ([2600:4041:5c28:200:44ee:a48f:70d7:4696])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134a15b99sm164776716d6.38.2026.11.25.07.54.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 07:54:16 -0800 (PST)
Sender: Andrew Stellman <stellman@gmail.com>
From: Andrew Stellman <astellman@stellman-greene.com>
To: Jon Maloy <jmaloy@redhat.com>,
	Tung Quang Nguyen <tung.quang.nguyen@est.tech>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Tuong Lien <tuong.t.lien@dektech.com.au>,
	Ying Xue <ying.xue@windriver.com>,
	netdev@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3] tipc: free the tunnel packets when failover tunnelling stops early
Date: Wed, 25 Nov 2026 10:54:11 -0500
Message-ID: <20261125155411.66090-1-astellman@stellman-greene.com>
X-Mailer: git-send-email 2.53.0
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

tipc_link_tnl_prepare() returns from the middle of its tunnelling loop
when a packet does not fit the tunnel link MTU and the peer lacks
TIPC_TUNNEL_ENHANCED, when fragmenting such a packet fails, and when a
tunnel packet cannot be allocated. The tunnel packets already built on
the local tnlq are leaked, and for FAILOVER_MSG the receive side
hand-over at the end of the function (drop_point, failover_reasm_skb,
deferdq) is skipped.

Purge tnlq on these paths and go on with the hand-over. The earlier
return taken when the dummy tunnel packet can't be allocated leaks
nothing but skips the same hand-over, so take the same exit there.

Reproduced on net (af6737b90668) under QEMU with kmemleak, with two
guests joined by two TIPC eth links: MTU 9000 (active) and MTU 1500
(standby). The receiving guest runs the same kernel with
TIPC_TUNNEL_ENHANCED removed from TIPC_NODE_CAPABILITIES, to stand in
for a peer whose kernel predates that capability; the sending guest's
kernel is unmodified. The sender blocks the MTU 9000 link in both
directions with tc, sends three 100 byte messages and one 4000 byte
message, and waits for the link to fail. Without this patch that logs

  tipc: Link tunneling error, too large msg <0, 2>: 4040!

In four runs without this patch, kmemleak reported three skbs (six
objects) allocated by tipc_link_tnl_prepare() in two, five leaks whose
details were not captured in one, and nothing in one. From one of the
two, run on a rebuild of the same commit with debug info enabled,
decoded and trimmed:

  unreferenced object 0xff11000005117b80 (size 472):
    backtrace (crc 539599dc):
      __alloc_skb (net/core/skbuff.c:705 (discriminator 2))
      tipc_buf_acquire (include/linux/skbuff.h:1441 net/tipc/msg.c:72)
      tipc_link_tnl_prepare (net/tipc/link.c:2055)
      __tipc_node_link_down (net/tipc/node.c:1053)
      tipc_rcv (net/tipc/node.c:2008 net/tipc/node.c:2186)
      tipc_l2_rcv_msg (net/tipc/bearer.c:721 (discriminator 1))

In one run with this patch the same test logs the warning and kmemleak
reports nothing. With a 1000 byte message instead of the 4000 byte one,
all four messages reach the receiver over the tunnel with and without
this patch. The allocation failure paths and the skipped hand-over were
found by reading the code and were not exercised. Apart from the
receiver's capability change, no kernel changes, fault injection, debug
code or delays were used. There are no TIPC selftests to run.

Fixes: 2320bcdae628 ("tipc: fix changeover issues due to large packet")
Signed-off-by: Andrew Stellman <astellman@stellman-greene.com>
---
v3: decoded the kmemleak trace and moved the tool credit below the
cut line (Tung Quang Nguyen); stated how many runs reported the leak.
v2: also take the out: exit when the dummy tunnel packet can't be
allocated (Sashiko review).
v2: https://lore.kernel.org/netdev/20261124001740.83267-1-astellman@stellman-greene.com/
v1: https://lore.kernel.org/netdev/20261122233958.10462-1-astellman@stellman-greene.com/

The issue was found by Claude Opus 5.5 running Quality Playbook, an
LLM-driven code review tool:
https://github.com/andrewstellman/quality-playbook
The fix and this changelog were drafted with Claude Opus 5.5 and
reviewed by me.

A reproducer is available on request.

 net/tipc/link.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/net/tipc/link.c b/net/tipc/link.c
index 6427c69f8929..ce6739d6cbba 100644
--- a/net/tipc/link.c
+++ b/net/tipc/link.c
@@ -1995,7 +1995,7 @@ void tipc_link_tnl_prepare(struct tipc_link *l, struct tipc_link *tnl,
 			      0, 0, TIPC_ERR_NO_PORT);
 	if (!skb) {
 		pr_warn("%sunable to create tunnel packet\n", link_co_err);
-		return;
+		goto out;
 	}
 	__skb_queue_tail(&tnlq, skb);
 	tipc_link_xmit(l, &tnlq, &tmpxq);
@@ -2035,7 +2035,7 @@ tnl:
 				if (rc) {
 					pr_warn("%sunable to frag msg: rc %d\n",
 						link_co_err, rc);
-					return;
+					goto out;
 				}
 				pktcnt += skb_queue_len(&frags) - 1;
 				pktcnt_need_update = true;
@@ -2043,19 +2043,19 @@ tnl:
 				continue;
 			}
 			/* Unluckily, peer doesn't have TIPC_TUNNEL_ENHANCED
-			 * => Just warn it and return!
+			 * => Just warn it and stop tunnelling!
 			 */
 			pr_warn_ratelimited("%stoo large msg <%d, %d>: %d!\n",
 					    link_co_err, msg_user(hdr),
 					    msg_type(hdr), msg_size(hdr));
-			return;
+			goto out;
 		}
 
 		msg_set_size(&tnlhdr, pktlen + INT_H_SIZE);
 		tnlskb = tipc_buf_acquire(pktlen + INT_H_SIZE, GFP_ATOMIC);
 		if (!tnlskb) {
 			pr_warn("%sunable to send packet\n", link_co_err);
-			return;
+			goto out;
 		}
 		skb_copy_to_linear_data(tnlskb, &tnlhdr, INT_H_SIZE);
 		skb_copy_to_linear_data_offset(tnlskb, INT_H_SIZE, hdr, pktlen);
@@ -2073,6 +2073,9 @@ tnl:
 		}
 
 	tipc_link_xmit(tnl, &tnlq, xmitq);
+out:
+	/* Empty unless tunnelling stopped early */
+	__skb_queue_purge(&tnlq);
 
 	if (mtyp == FAILOVER_MSG) {
 		struct sk_buff_head *fdefq = &tnl->failover_deferdq;
-- 
2.43.0

