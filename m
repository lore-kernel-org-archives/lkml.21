Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795390801;
	b=I410SJ32xzOEiZqDhpAxXG5apZuNUPJ9Rjn+vUNdVlG4bOciNnF6jxHRpCFW0tEZrQII
	 e8dYqVUh5jfhNB6hlN5iH35RYiny+6Id7NcySKW9tx57SwrKRdGv/JVhOt5ExLJK/GHah
	 kOd5pXgGTAs02DMb9e9fgPG/5prM6gnfc05dwenrQLOTf0ErSw6hFdtkcTXeqF8lcvrQW
	 DtKUukUlVo26n6suOUqyZTh9so4NKPlCNcRqvOsqzKkUtwSrBxvbQKVqtxP0SWUQ5K9cN
	 U1b1GAJiTWYj8R8Tk5WM8r6C5mdxesyzvncxB66TLub1KdEknapjS9pU6rFbEsdSk3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795390801;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TQb45l1RsU0Lz4sB7qqB+jyVNMLFZAFcVIiy/3FWzuo=;
	b=gTLdCEUzpArujdkqEOAw9yv3F8zul/vcw1fi+JdrBevTlXhRRsP8V9Y5etkNkVF2C1b0
	 twHsiFCynvnM0pmzl+n0tnjCDkf1WoKGRtwr72hKJZb0SNcP7UvyP83IhWxJFYZ7wFy6e
	 VtI6ECwsM0dWW0gZxVgjypLhi/YdBq1Tqm2VeOuf71X+PUtJ18ms/V0MSAuNP5etoepXH
	 OjSYXPEGVDzq6Z8WXoXJd1SnStEfKojK5FRjKTa4Xon3a3HOkYxin1Psx2HzztzhocVk6
	 xQw02Hun1ROxmZmyR/9BXGvlkeOXdAuhCw0gdhMb/mwUnyTUchBi+vBaJbQsSOx0bsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=stellman-greene.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JoFkxyyJ;
	arc=none smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC91606A335
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 23:40:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EC91606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stellman-greene.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JoFkxyyJ
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-94961bfe1a0so181977285a.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 15:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795390800; x=1795995600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TQb45l1RsU0Lz4sB7qqB+jyVNMLFZAFcVIiy/3FWzuo=;
        b=JoFkxyyJLHpNVekneO1pBCAfzUiuj6FsnPF+f9jmITq2rUJSsSdYR0bXQa/JDkA07z
         3Ia4RY7sTeIL3ojqsk4+cE+v1ubAAIFukwpBSf5qBb+B69kKAdyyaUzoZvhIx9Ul+erW
         jeFUD2Zz4k4eR076rfqWAorFnRQYaCePKKB5idvb0ueu0TtsuqcJkoc6OCH1Bv2URybb
         f1FzDhCjPJKNBfl3JGgBdVs5SB2FeNYmPdlOgiyvlhOPAwglC0Gm0LG8ljywhCy98A7U
         HRIo4uTy9rNe7EyJHc8pOfP3L7mhNLnB4X+DAh6EABpj2A1HY3aLgkz8S7xFQp8gFHLB
         +wsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795390800; x=1795995600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TQb45l1RsU0Lz4sB7qqB+jyVNMLFZAFcVIiy/3FWzuo=;
        b=QuJ1K/LLPgVo3ioLBO0riZ0oEbCLKywbFLZj1OezV9Na5izPpcxAc5OkkCNMFVH1u0
         yWH+5CVD9v/IUruuAH3rHVKFXrsUnJ/GF2od3qV1JMkv7q7GIhCgTtvIG1a+valDtLWd
         ui/y423rAreLd76UHv99+cVRHVcAIyH2CeseHwOIEMOt2G8vteSv3LMF9LdgP93eizAe
         9PPiAqw4t1FJ2bRZpLGKVppyXZmctg49zoWtgvCKjRPTK+SAjhyPaeCiRurqijsNEDXw
         y3UqjILndMAapdzjpvPAPpA/PNXeC6/q+ZKm+hVOpg28vdTZDAv6IT+dP21OeEii9s8X
         WP1Q==
X-Forwarded-Encrypted: i=1; AL+hErFSsdPACjkOz10I7fnFHdK8vg4PFGLvws3A+ZRzZqUkKYj9qAZRKfHeHmMmDkZD8F545UzgQhaV/Zn4UPI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sH/SyRVa2Y38rQ2OpHmV9FDGhFuk+Z/wF+FHc4b1dV5+AwkdW
	SGJzAuv1R9P/i+JZ8fboxdlfKVGfARv8CAEzpsBWGbFkn6r6z0y6AgFp
X-Gm-Gg: AZFdTZcbHlXj5MfmilRHFVgKoi2eYfB+oLJGJpzyXfWPtDgpoO02fvsb54VC89/BeKD
	fIlO2IUOvfwechPtqfyJ3tE6iJnzF9ym/gVu68c7rgCFjKdFdLDgZ1GEdu68YSe/MT6g64PIbTb
	BtspACgkTiH/bzXhJx4YDVBzrPUl9jbvYSEFhYMUaxCIMx3ly1cc+LRkNAhnFI+dlgZ5PTJP4cC
	T9H1xr6B7PEayZIfK4vOjx18QO3i6laPTU8l1AbB6eictAlR9l0gMZjpq8VohsbvLoimllmr/of
	wTbXgxQLp+pNoOIVI0HUO/ZQjraKLhTay8QDIt5lf4P5WTb9IEhYJ+Kbtt5WPEa8BdhFCETBZDl
	hbv6y7KR98a9ZLk2u3k+30w58V7dL7fr7NrnNawsv22fr9ktbjhr+nuF4qNNJPDKdaXkmyjtrnH
	tvIRrmOXNe5O56pBbr45NkAn16hdC1O83gHl9V7i/TRs/QSRLdK96ca1KBjgglkv61ghYRDtAoJ
	PYZ/2qkWYw3I6FCeAkP4l//xcL+aglU6LdyMFvLJ81po9WTiEKfW5/+3LCvYb9P+BEUNMLEHNkE
	K+qrWpfDDuUFr2DkHSBvdCCUZ1wRaCLGDXORILwFaQ4HwZ+zYfnnmYBbHyjwVIiVrX337fOW7tB
	VuNHqbGzodq1OO6TJTG37LdhAcylQ9xTkUGReM4JCgUq+w8TOUKoFlh81q1uxY+Qh7INvaQUOkq
	pIRb3ia8/FbjddwsN9ZrG9oZS1kw==
X-Received: by 2002:a05:620a:4012:b0:949:3365:7402 with SMTP id af79cd13be357-949ba9b8ee1mr1662958685a.17.1795390800245;
        Sun, 22 Nov 2026 15:40:00 -0800 (PST)
Received: from Mac.mynetworksettings.com ([2600:4041:5c28:200:c8ee:a73:9097:862f])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb41a341sm686330285a.37.2026.11.22.15.39.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 15:39:59 -0800 (PST)
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
Subject: [PATCH net] tipc: free the tunnel packets when failover tunnelling stops early
Date: Sun, 22 Nov 2026 18:39:58 -0500
Message-ID: <20261122233958.10462-1-astellman@stellman-greene.com>
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

Purge tnlq on these paths and go on with the hand-over.

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
patch. Apart from the receiver's capability change, no kernel changes,
fault injection, debug code or delays were used. There are no TIPC
selftests to run.

The issue was found by Claude Opus 5.5 running Quality Playbook, an
LLM-driven code review tool:
https://github.com/andrewstellman/quality-playbook
The fix and this changelog were drafted with Claude Opus 5.5 and
reviewed by me.

Fixes: 2320bcdae628 ("tipc: fix changeover issues due to large packet")
Signed-off-by: Andrew Stellman <astellman@stellman-greene.com>
---
A reproducer is available on request.

 net/tipc/link.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/net/tipc/link.c b/net/tipc/link.c
index 6427c69f892..2fead2f4ed0 100644
--- a/net/tipc/link.c
+++ b/net/tipc/link.c
@@ -2035,7 +2035,7 @@ void tipc_link_tnl_prepare(struct tipc_link *l, struct tipc_link *tnl,
 				if (rc) {
 					pr_warn("%sunable to frag msg: rc %d\n",
 						link_co_err, rc);
-					return;
+					goto out;
 				}
 				pktcnt += skb_queue_len(&frags) - 1;
 				pktcnt_need_update = true;
@@ -2043,19 +2043,19 @@ void tipc_link_tnl_prepare(struct tipc_link *l, struct tipc_link *tnl,
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
@@ -2073,6 +2073,9 @@ void tipc_link_tnl_prepare(struct tipc_link *l, struct tipc_link *tnl,
 		}
 
 	tipc_link_xmit(tnl, &tnlq, xmitq);
+out:
+	/* Empty unless tunnelling stopped early */
+	__skb_queue_purge(&tnlq);
 
 	if (mtyp == FAILOVER_MSG) {
 		struct sk_buff_head *fdefq = &tnl->failover_deferdq;
-- 
2.43.0

