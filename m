Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795479469;
	b=RTLEQOXxDBcNEsaA/PGoFd1PgDaDHgmVbvTwZ9tnpje/HY/aRWe7xeWU50uYCe74plHV
	 Z+RMSh4rNkJpjQ+fHWth7JpB/fFZnh0QBqv3tNRjL7nxkHmfMC+SQRcxtLIUpoWzyAyGm
	 AvP2sAICb6YpP1B9riWcUaDr/U5NJwJFYr2tszUEuTFvs6OmiRV1ICZF0TooFpcr8/2t1
	 OmR8YTBAM8JCOdKD83ZbvIAyFKMzl+zCfTKZMD09ICXa1NXHm8OEKu0yLyGf/JdTfv2j/
	 0lMmdoy7m6liafk2Ya6CSkZvwuySt6SFVnLAC0WXp+ZuHxwT9iiESk8JKgyaYVbWZ5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795479469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hM0eVvv3ckNmqNx1hlLmZhTZXfCWOxofv85JN3p3tO8=;
	b=N6tzFUCWvJFDqOgug/sO7orlaGpow/SrDAH02WUMdqyYdlNsncEEP8UP1t5nZhp4CBUe
	 ewDEG6lyYu9JyAgEWZyTdaMEC57z3/celEs/i6lueIIEjXcb/YZHRPYlvQv6zxAQyKbD+
	 qiqvGxJkXFk6RiQNy+RnDj3Fz4MAkecLA6lWAUMpB+bFm1wr2D3YynP0CMXnZ6VCvYVey
	 xSWjiNjzgoYRCqmcSTyH9WBZ1zXU+me3XslMb0J+OQss3BhzAXuWC+/p6t6rmLNkN+N5y
	 fb7Q0pplgs5RJBkl6SJrTUy8CFOimYyf2bHVrbFiLOXWpbNfu9kLFZrErFEMSjGH71A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=stellman-greene.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y2Y+3jOX;
	arc=none smtp.remote-ip=209.85.219.44
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76511606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 00:17:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76511606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stellman-greene.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y2Y+3jOX
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-91f0274f88cso54564366d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795479468; x=1796084268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hM0eVvv3ckNmqNx1hlLmZhTZXfCWOxofv85JN3p3tO8=;
        b=Y2Y+3jOX1GEao9CJkjI4KQvehfCQRg0hJwPgndNx1Z5vOdWSNye4CzSBlc5r/OPYB6
         ek+CoV9LSVmKhVw56oBDdwMz8DJcwT8oCagELB27XXlzmH3cn3vaUH6Mpjth9i3G2+Mk
         SGK4QyYlYoowlgaGWvOgxVZvpILUBaIeZ1iinLLEyo8TDU2MPR9Y76wsZlKFHRCqDFAl
         Yp6PmdlcMevVox+9ITFfUVtEAkHiqJW0GiOzRpoNxAqUcjw6Mh7rAbomteu15SwjNXRk
         4trpY7TDJk+sivLCVI8/x9QQ8Kod/UKsqsWIxXyuy0c4iKCHl73Lko3IoL1GO21SSWvv
         ic/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795479468; x=1796084268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hM0eVvv3ckNmqNx1hlLmZhTZXfCWOxofv85JN3p3tO8=;
        b=jIFt6Ox2nvWNiQ4m5zTqNynxFVV/E+lrROQQ4UJkNnH19POpN1Ojj953fK2m5aWCR4
         pH1FkKxsA2wQiqehkgCSI+M+g10XkNoiFkmLYIbQzRvV0d7PuLrYQAwO8+vE4Oo2tWy2
         uKOJnSCntm4YcReHNZngR8sPl7cyuUbTKyh05oPsnDOMAJ+lLf4UZlKXhosroEfTAnlS
         +exe5lYENegfRnhF6z9Xe2wNISzTZipaXowS1cI/kNfe3zb84Ha08C7OP+/kfX317r/T
         b3NTHxih+aLc3nDUTZWt9WwSAlxLSVwyIkv/QqDKg0vJMA+/ubu6P4s7QCDc4fQ0xqba
         OoAg==
X-Forwarded-Encrypted: i=1; AL+hErFWLHszL7Z5FI8tm8WivmnuDNius6cEcM8+YNCFdVejw5DoNz0X+IZC+Kl4K4x56qwkxoJn6Kz2icMeGyM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8/cZJD2CT+6EDEOj9VOHiuUA+NlPGPdo+jQt2J+7+ZqZ2MMZJ
	IAnb1XnELObGXxcVrNpkv9wlJNZeA539V6ErtRWIL6m9rtpDLuCH27vU
X-Gm-Gg: AZFdTZdui/y5COxBMwUefAezKc4/OqWyj7IEUnsvI+SFt6REOJKs91L4zjcoYArPd58
	YgWJL3NEnBfRLipWwbQk4Ji7iYSk6O3T2b+7mr87REMGizX2JMC+aWwDmHq7lKlxeXheuYm7/jw
	jTfiMzBjOJXUjpq2x26ObKQph5ptsMwUXV9S5E0XxrSEjp9GMMkb2YTEhErdttHFlrLfj7NFg+b
	aPwBIIFe8tyECA8geDcQ9HjOSyyTUSKoXiTZqrtmuBXgvsAVIQ0sq3kIClA8dZFKRJkgSQ9urFf
	4IqccQW6ynxC7SyZj1VUlspLK7cLvou41ci/hMYcxmXg+FCS/jkbD6BscTGKl9lO+uyysjyLP8p
	N/gAgA2NBYYGrEvo/wMeRV0VV5RqI/V0V4GgPqP54l9vMOhOIwoc3iexXigqhmQZMjda0uFV7Ak
	nKlmQX3E4yS/G5SbAglx8b++GmqEvMmiJ49n9llcA6gCrgBvJWbYgAyKR42zwJ3nxmQc7Vrzdgq
	ADYXvBwqhefcFNXDKDHJlDgbakj8gESemQ79BJT+MJ9+pdYBSwQy+XrQe9rh8uYm95IueoRzYI0
	wykXx90sQKxUTZiKmGoe5rjg1DpigQ5VgyxupGqbvwklQxwr0gjYUr/HNvOhfYCZT1QRy3R4c1u
	tQpUZvfyPwDW2w5la7mA0ps3Kvwd7L9KhA8YOMkMwLrif/c5zBayiu7sXh5Gjwvy2wEq1ZyQbba
	TzR6YImCrRa34MUjpv1p4treoYYSsmxq4ieJ0iDUZOfywPYmRv
X-Received: by 2002:a05:6214:509a:b0:921:394f:72af with SMTP id 6a1803df08f44-921394f72c6mr215749656d6.22.1795479468286;
        Mon, 23 Nov 2026 16:17:48 -0800 (PST)
Received: from Mac.mynetworksettings.com ([2600:4041:5c28:200:2c1f:24f2:550a:1590])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134a24e91sm118927056d6.43.2026.11.23.16.17.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 16:17:47 -0800 (PST)
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
	linux-kernel@vger.kernel.org,
	Andrew Stellman <astellman@stellman-greene.com>
Subject: [PATCH net v2] tipc: free the tunnel packets when failover tunnelling stops early
Date: Mon, 23 Nov 2026 19:17:39 -0500
Message-ID: <20261124001740.83267-1-astellman@stellman-greene.com>
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

and kmemleak reports three skbs (six objects) allocated by
tipc_link_tnl_prepare():

  unreferenced object 0xff11000004d34780 (size 472):
    backtrace (crc dd2ea0a1):
      kmem_cache_alloc_node_noprof+0x296/0x3a0
      __alloc_skb+0xde/0x890
      tipc_buf_acquire+0x1d/0xe0
      tipc_link_tnl_prepare+0x94b/0x1960
      __tipc_node_link_down+0x4ae/0x13e0
      tipc_rcv+0x2187/0x2e20
      tipc_l2_rcv_msg+0x1d8/0x2e0

With this patch the same test logs the warning and kmemleak reports
nothing. With a 1000 byte message instead of the 4000 byte one, all
four messages reach the receiver over the tunnel with and without this
patch. The allocation failure paths and the skipped hand-over were
found by reading the code and were not exercised. Apart from the
receiver's capability change, no kernel changes, fault injection, debug
code or delays were used. There are no TIPC selftests to run.

The issue was found by Claude Opus 5.5 running Quality Playbook, an
LLM-driven code review tool:
https://github.com/andrewstellman/quality-playbook
The fix and this changelog were drafted with Claude Opus 5.5 and
reviewed by me.

Fixes: 2320bcdae628 ("tipc: fix changeover issues due to large packet")
Signed-off-by: Andrew Stellman <astellman@stellman-greene.com>
---
v2: also take the out: exit when the dummy tunnel packet can't be
allocated (Sashiko review).
v1: https://lore.kernel.org/netdev/20261122233958.10462-1-astellman@stellman-greene.com/

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

