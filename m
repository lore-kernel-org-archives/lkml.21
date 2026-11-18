Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794963296;
	b=PvuqcZqznr0iUJmQdMfvhEiqTObB1/xfq1NOO52PdEYY1vPLJr0WnZ7dC0tReOkTPiVd
	 4wOl2Dn6svkmmmA4UmHg84ctUA24eDLSrSZCLjT9fyqpL2Lsui603qS6tnK2DsjMJfdJt
	 mUl5ebL2QLklvPN1wjPbnTaTqYa3LQ+KCqI1iAm7YBaMn4Szqcm4JaRxWXeOmvhYwQ3fR
	 3v80hUlu51ayP1W5NSG26r8W0D776UhbgTxA8Rvr0DHSjSbyyz6WS5MV6pkohstYBWYJm
	 ga+H5JzaDVoZKtWNxyhkCuDkRQ0O94dC6Q+fdPWw63q1k5xucgk+rpRR3umiPMSutUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794963296;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=znacOD0B/B/YrxiKPxJW5WlLxDS+ZPkOnsp55TXuXXo=;
	b=DlrndQ2OCa1o8H6DStN7WXGvA98TMCHPzw0Kmx9G3ODltNp9YeHIB2tw+g1gl/lv9le2
	 z7paUKhoE47TlrEhFSNpnHvYo2PCIjMCXTutW7J70N4yrF9xL6CZJiJ6RNkFGjUKvQKkr
	 M8vmdvxZMZL3NTsxL+rl/SGS4gKW6TQJtKL2WVcBFEi9+aluOijV5n/tLWErKh0808eoK
	 TgwDWaWe0gmNk4dwt0b3uyuBNloZ/CiGODi5jgHOFHRTCInTWdgIViD1xZXjlsvbDfFaE
	 sUDYr5VWKVwaGxJdex+ycebuu0VAy4y34+Dwe+BQDpnu7rETYJHQMyaNW9oXkPHHc+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andrii.net;
	spf=pass smtp.mailfrom=andrii.net;
	dkim=pass header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=nKoR2Ncw;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CD1606A331
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:54:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21CD1606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andrii.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andrii.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=nKoR2Ncw
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3ae1da332bcso119988a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=andrii.net; s=gmail-2025; t=1794963295; x=1795568095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=znacOD0B/B/YrxiKPxJW5WlLxDS+ZPkOnsp55TXuXXo=;
        b=nKoR2NcwkaE8X7zx+Bf1UNS1WXyI++xeFpsYswkqzghJmd/h4/E9kX+bxt5CkWVeYt
         oHMXoLKsGoKYXng5/A6cRnhwRZbar08FYSdnHV6qVKLpecnmvznUVmS16ppDuAALZ0ei
         cEnmDso2vg/woOsxJs8bRrku2aXb1NpiEsIobmvrlkbrI0ebHqM0jPYV+pBeZNwm8Pz+
         Zc/HFswj+UFVXgL0GuIe1idfTm4Kjf8960xIJ7V+9Xr6VrGaF6eipCBOtEGgmmZdkSbL
         U4QD4p9dgVjbcXnH4VaPqgUMTFv/RxiQTjez2/0nfohscW5FywXJhwMZ+mqz5Bx5ONV7
         jEzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794963295; x=1795568095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=znacOD0B/B/YrxiKPxJW5WlLxDS+ZPkOnsp55TXuXXo=;
        b=QCj8OWN4vdZQZP9wEziCc1bOWwzAkv4xT4g+JRSeJ8xr+PUe/l59N5ewJLjjh3HxRG
         Y1aR7Ic2Cxns3NqZuqlfI1OAc67mIHCD7l5DNM2NCCEPc+AFwWxYdrWn3rjebOyijf2G
         Tcj0F5r3dj4fAszMMV7wkngvKgl7ahuD81CFiC0BqtJkr1i1S874tqKP34/uwFpJauWB
         H9OqUxx8vmKmpcQxE/0pO1fcfHBK5xVt/FmgXukEaJ2xDvYDUaXvtlRUXarHeKkIC4WO
         b6gN9e1sAC1b1kWvHkUBJ0od0HX1xdMQKoRkDu1Kv95xwCUaNIug3aG7tydfhwBify7w
         m13g==
X-Forwarded-Encrypted: i=1; AL+hErGgES5Z4kQAT8LQTO5hlh2AvGk8IKSZGkAq8K4oyn7i7hiV/JdJk9AzR4e1RwweJTMQV4Q7TAtLql99vcw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+v2DVPkS/akrIzBsrxZHQCdXEtBrq0hyLKDUxSFI21glsqVZdn
	cQqiN21qyLC3LNz/TBx/XkHmfhWuMGlUTpav9O7mApU34Ji1jVVdOEF4x7fH1KE7jTCNAFjLaP1
	onN2q61+RI7r766qlBGIH/XQ/u+05DyFRSgcI+lh3iKxHBBOoztp2
X-Gm-Gg: AZFdTZd3Od4VZsz/Xjr6O5pqZ3/MeOWTqE5m1EHWdwlZT83c1W1+vE5UcADulGRMSKr
	veqqOgZiSQwgopS6fXcOECV25BqP6lbjoTSFyfNUBoXrkfWCCafn1Z4gmPOmPBWQWBIvjJhfxMO
	vwKtEry+jgXHLu8cx1pPQHmK7ZE2PAilCbeZFM0IvvajYOe42DzLkXt8e2Jie863WKvMtCeqzUD
	kMMU4hpRs+HxVzefRQ05Xje+Sc9uyU/Ogju2Lo4/SyudlpFz8FyyuOLu3+svqSr9GnU2j5q4DGQ
	lvsAzhMDuugDHJYtsXl/p1ULxzWEv8HAZKkYzEYTOqjOgdTd5isWt8CipY2njnjKQ4348R8Ka3S
	lJbQIDR9olmoKOh2vw4ri3K26Ajw=
X-Received: by 2002:a17:90a:d444:b0:3aa:fc22:8aad with SMTP id 98e67ed59e1d1-3b3d07c23bfmr1077396a91.54.1794963295498;
        Tue, 17 Nov 2026 16:54:55 -0800 (PST)
Received: from andrii.ai (mac.hestia.andrii.net. [2602:f337:ed:4865:7374:6961:204d:6163])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3d4914caasm161524a91.2.2026.11.17.16.54.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 16:54:55 -0800 (PST)
X-Relaying-Domain: andrii.net
From: Andrii Tereshchenko <opensource@andrii.net>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Christian Hopps <chopps@labn.net>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	security@kernel.org,
	Andrii Tereshchenko <opensource@andrii.net>,
	stable@vger.kernel.org
Subject: [PATCH ipsec 1/2] xfrm: iptfs: don't modify the shared info of cloned skbs on output
Date: Tue, 17 Nov 2026 16:54:48 -0800
Message-ID: <c1e999b5-15ee-468d-81c5-530a560e84df@mid.andrii.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <b56bbced-a8b0-4ae9-80b4-1958ea36684c@mid.andrii.net>
References: <b56bbced-a8b0-4ae9-80b4-1958ea36684c@mid.andrii.net>
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

TCP that a host sends through its own IP-TFS SA can panic the kernel
when segments are retransmitted.

iptfs_output_queued() aggregates inner packets by appending them to
skb_shinfo(skb)->frag_list of the first one. It appends even when that
skb is a clone, which shares its skb_shared_info with the original.
For local TCP it is one: tcp_transmit_skb() sends a clone of the skb
that stays on the retransmit queue. Appending to the clone therefore
sets a frag_list on TCP's skb that its len and data_len do not count.
ESP copies the head before sending, but the original keeps the stale
list.

When TCP retransmits that skb, the new clone carries the stale
frag_list. If the clone is then appended behind another first skb,
iptfs_rehome_fraglist() moves the stale list to that skb and subtracts
its length from the clone's len and data_len, which wrap below zero
when the list is longer than the segment. ESP copies the clone in
skb_cow_data() and skb_put() panics:

  skbuff: skb_over_panic: ... len:-340 put:-340 ... end:0x180 dev:<NULL>
  kernel BUG at net/core/skbuff.c:215!
  CPU: 3 UID: 0 PID: 0 Comm: swapper/3 Not tainted 7.4.0-rc3 #5
  RIP: 0010:skb_panic+0xbe/0xc0
  Call Trace:
   <IRQ>
   skb_put.cold+0x1f/0x1f
   skb_copy+0xfc/0x180
   skb_cow_data+0xc5/0x630
   esp_output_head+0x38a/0xb40
   esp_output+0x1c5/0x390
   xfrm_output_resume+0x113c/0x22a0
   iptfs_delay_timer+0xdb7/0x1990
   __hrtimer_run_queues+0x16d/0x340
   hrtimer_run_softirq+0x136/0x210
   handle_softirqs+0x162/0x420

Unclone the first skb before appending to it. ESP copies a cloned head
anyway, so this moves that copy earlier and does not add one. Send a
cloned first skb on its own when it already has a frag_list or cannot
be uncloned: uncloning the head does not unshare the skbs on its
frag_list, and appending writes to the last of them. For the same
reason stop aggregating at a cloned skb that has a frag_list; it
becomes the next first skb. Do not let iptfs_consume_frags() take the
page frags of a cloned skb, because that empties the frags array the
original still uses.

A first skb that was a clone can now take the page frags of the skbs
behind it, where it always used the frag_list before.

The panic was observed on a machine in real use while rolling out
andrii.cloud. It was reproduced on an unmodified v7.4-rc3 built with
KASAN, in a KVM guest, without fault injection. Three network
namespaces form a client, an IP-TFS gateway and an HTTPS server that
is the other IP-TFS endpoint. Clients fetch a 50 KB page for 40
seconds and netem drops 5% of the packets sent to the client, so that
the server retransmits through its SA. The boots ran with the server's
normal segment size or with the client advertising an MSS of 130. Most
boots of the unpatched kernel crashed: some with this panic, the
others with the use-after-free that the next patch fixes. With only
the next patch applied, a few boots at MSS 130 still crashed, all with
this panic. With the series applied, no boot crashed. Kernel selftests
were not run; none of them covers IP-TFS.

The analysis and the patch were produced with an AI coding assistant
and reviewed by the submitter.

Fixes: 0e4fbf013fa5 ("xfrm: iptfs: add user packet (tunnel ingress) handling")
Cc: stable@vger.kernel.org
Signed-off-by: Andrii Tereshchenko <opensource@andrii.net>
---
 net/xfrm/xfrm_iptfs.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/net/xfrm/xfrm_iptfs.c b/net/xfrm/xfrm_iptfs.c
index 0313a43aa..95ba73013 100644
--- a/net/xfrm/xfrm_iptfs.c
+++ b/net/xfrm/xfrm_iptfs.c
@@ -2234,6 +2234,19 @@ static void iptfs_output_queued(struct xfrm_state *x, struct sk_buff_head *list)
 		if (iptfs_first_skb(&skb, xtfs, mtu))
 			continue;
 
+		/* A clone shares skb_shinfo(), and with it the frag_list we
+		 * are about to append to, with its original, e.g. the skb TCP
+		 * keeps for retransmission. A cloned head that has a frag_list,
+		 * or that we cannot unclone, is sent on its own rather than
+		 * aggregated; the skbs on a frag_list stay shared with the
+		 * original even after an unclone, so they are never appended.
+		 */
+		if (skb_cloned(skb) &&
+		    (skb_has_frag_list(skb) || skb_unclone(skb, GFP_ATOMIC))) {
+			xfrm_output(NULL, skb);
+			continue;
+		}
+
 		/* If fragmentation was required the returned skb is the last
 		 * IPTFS fragment in the chain, and it's IPTFS header blkoff has
 		 * been set just past the end of the fragment data.
@@ -2273,6 +2286,13 @@ static void iptfs_output_queued(struct xfrm_state *x, struct sk_buff_head *list)
 			if (skb2->len > remaining)
 				break;
 
+			/* Appending re-homes skb2's frag_list, which a clone
+			 * shares with its original. Leave such an skb to be
+			 * sent on its own as the next head.
+			 */
+			if (skb_cloned(skb2) && skb_has_frag_list(skb2))
+				break;
+
 			__skb_unlink(skb2, list);
 
 			/* Consider the buffer Tx'd and no longer owned */
@@ -2292,10 +2312,13 @@ static void iptfs_output_queued(struct xfrm_state *x, struct sk_buff_head *list)
 			/* skb->pp_recycle is passed to __skb_flag_unref for all
 			 * frag pages so we can only share pages with skb's who
 			 * match ourselves.
+			 *
+			 * iptfs_consume_frags() empties skb2's frags, which a
+			 * clone shares with its original.
 			 */
 			shi2 = skb_shinfo(skb2);
 			if (share_ok &&
-			    (shi2->frag_list ||
+			    (skb_cloned(skb2) || shi2->frag_list ||
 			     (!skb2->head_frag && skb_headlen(skb)) ||
 			     skb->pp_recycle != skb2->pp_recycle ||
 			     skb_zcopy(skb2) ||
-- 
2.53.0

