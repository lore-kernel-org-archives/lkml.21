Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430564;
	b=jDtEIdsRJMSz0Zf7JHPoLsScmG2BqJy5l8OJA5Zfwv4GuxwX4dIrev5soENCk9j6z/Xk
	 JxOL1k7azfL/WzDdtdIcX8s0voobR/u1S3UOaVHSEKJvKPQRWsBdFEw6Q1dpB7ICdYONf
	 T+HCKtAxrB8JoNwv82NKF4KiEQ67klwyj9ECZeqgtjIW5jw7uS4bTwZulmy1Rzot8IU/r
	 HpPD+9MD29sdWy0IEggPHPv2m8WkLP7sOhS8wKwvUYEG3e65hASrtSVE7b3JITaEGaLEv
	 6lz598OSdgvmERRBeM12qhfmB7n1cFP/Xc9ZBdHUiQJuftLhc4X59u6fuZtfTXGSuyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430564;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cwt87uUsOrwu5RSttuWdxqXXfcvorQyjbx6LQp+7f0U=;
	b=QUPL8wKTJKHVjSfasou+qbiAlnZ+6DHCYfF+0rAzUhp0KyFrkTkiIUDfRwhvYy1H8h/X
	 4xwfD9I1cB6sp7KD1PYprgbTj8uLb/3GDTdf6jqg+TV4EwG32/1Bw/qQniZl541ir+Nn4
	 C2INp9zOYpP+q4/zFSdNDU6z+xAFS8IhvuUXX+yWAnF54pQh9idlwFb7jEYAjzYcgeOrf
	 8Z3rt9mFHPdkumLeVc63ttJsfktGE5RHKtuvqavJ8USZsswYGs1Ww6ToLk28S16NgXHs5
	 JSF1iJRcbAyGVZQHFs8w0yTPnsnHt/xUfhx3KBBEQ/mReoFEvF1IHKnMB3It7zyKILQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudlinux.com;
	spf=pass smtp.mailfrom=cloudlinux.com;
	dkim=pass header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=IEmaKJxH;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784DD606A336
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:42:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 784DD606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=IEmaKJxH
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a05b210703so1371655b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudlinux.com; s=google; t=1795430563; x=1796035363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cwt87uUsOrwu5RSttuWdxqXXfcvorQyjbx6LQp+7f0U=;
        b=IEmaKJxHZzoh9SFERTTYfh5haKVCSycuxx/K3Ey6NAOHkrV0/w8s3j2r4Zuso6UDYQ
         8HsqcBTDXwaB9sTsJFNltvTKYv/BiJn89DGCt+4H19Y+QeELW6PPeyfDzAaRSS+sC/yJ
         MXQNPlX1tVbfCx4wHsfut5FDjb+qTassJhLITBv+K6EjJ1HDENme/sUZHtKZYSZaKnnv
         mSOzcM2GBXVSQFch/LEqN245ZqjzSdWerZzedMrKS0X6+4XWz1+dKcghq6mGkFFzhoS4
         wFFVOhWGxzdRZ0r3VBKyIzOr25FMeazd14E4lgZncWqYRj8Y3f1LEbouqxSYukwgt06x
         y+5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430563; x=1796035363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cwt87uUsOrwu5RSttuWdxqXXfcvorQyjbx6LQp+7f0U=;
        b=s25VATBqh81Y+ZHs/rkzGa9rO7QRpff/zBrQcv9wuAtQfYDxXgoMV9VeKyz1uU8PZO
         fTpfi9okvPFt9vTY/e+n81L17mBOdp5Z12HZSdhS7lGmXE93nsdgQKLSROFaGxBp71rw
         nIaIITgJPu98d35RTst/C8OL9WOtkKrJQ2asF9uvjuiPv2WQl4KUUuQnCuNWjqN5FaHF
         r8YYWrD3U52uVRhou7SopquSz218KDlYAbLPTGcmDRGPdZlBY+wCi6eyt07rlC0a6U9D
         LCseFVnG8YlBxQi89mYtJZI8YNvLTq/z+Xh54TL/38BuTKgUGqDluMYWKTdhW8BG1I76
         np6w==
X-Forwarded-Encrypted: i=1; AL+hErHdV9EPgvSxjvGkiOqkaVe/g0EkC+ZWdITmE+vlCOyoXT9Nck5zsI4xOL7XZMiTceY5dnEKfJMIxXIRcVc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cMnlCQuSeTubpb1WE2Vd1rySZFxpLhONQRloOOK1WFOoFO5QC
	O1Bw/ekQ9OCp/H8PG2orDZAAd8ECVx/7Ph5v7fmRWHTBnmqEeaL/Iy0yQFIPDEjLmHo=
X-Gm-Gg: AZFdTZceIt9PLGdRehSh+LQnvKk+kRmoQheUZz8oflx273Oc/zmHdS+8qhQ9tLceeDf
	G/5VmG0rI4vnxxGlocf5JfPOj7HJKFe1+eNkOUgxH6K/Qp4dmQNz2C3VXqnKZP6B/z/IUTGJaOT
	S+nCvE/BuUAGAcDw4ap/GMw9W4PO6j0bzQmFxirdZcBnHldCbwkeFVyqWXW+ACqNh3Bh6pxzML4
	Ni4gnyxwBzQs4c6yRzgU3RMmtJVE83znv2ugIaLGLhgR585bhy4rCmgj/2xAFQfHO73jSGvF1e3
	Leooqs1QqAkfGgr3WA4IVoOkfmKNVT2UGO/O+DYTyfIHk6fR/dNW0eVBhw1xJh03aOP/yhbNb5d
	h1Nk1KM+3s2okiJDJuwaBk8ZsmFUtBnWpKK8gcPT2X/5LgvZ3ogXURn/FCjJDcRH4R+liDK1ZWx
	X44OTowsdMA/YE+Y1/hMRZyfJ4htaLbtRQoZmsKr1wamqGCaAi+njbRl35Ln2CSHiDDeXohLW44
	7BfJZ0FG5FEMtMH08zprlWjYqeiLNyvtGb3lm5u+48430OA3ApPPXm7uWXdXGLPjT0bxsjf9bD+
	LeDjxJJcjbYH3p7ZgncbDiEmzKM8iJCfaQ1R
X-Received: by 2002:a05:6a20:4308:b0:3eb:b2ce:7b4f with SMTP id adf61e73a8af0-4014c34fdfemr11751808637.68.1795430562727;
        Mon, 23 Nov 2026 02:42:42 -0800 (PST)
Received: from rmustafin-laptop ([27.79.41.63])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde84cd5ed8sm2283731a12.10.2026.11.23.02.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:42:42 -0800 (PST)
From: Rustam Mustafin <rmustafin@cloudlinux.com>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rustam Mustafin <rmustafin@cloudlinux.com>,
	stable@vger.kernel.org
Subject: [PATCH ipsec v2] xfrm: use the frame's own socket in the too big checks
Date: Mon, 23 Nov 2026 17:42:36 +0700
Message-ID: <20261123104236.4179425-1-rmustafin@cloudlinux.com>
X-Mailer: git-send-email 2.52.0
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

__xfrm6_output() decides how to report a too big frame by looking at
its sk argument, but xfrm_local_error() reports to skb->sk and
dereferences it unchecked.  The two differ for a UDP tunnel: vxlan,
geneve and other udp_tunnel6_xmit_skb() users pass the tunnel socket as
sk, while a frame they forward has no skb->sk.  When such a frame takes
an IPv6 tunnel mode xfrm bundle and exceeds its MTU, xfrm_local_error()
oopses:

  Oops: general protection fault, probably for non-canonical address
  0xdffffc0000000002: 0000 [#1] SMP KASAN NOPTI
  KASAN: null-ptr-deref in range [0x0000000000000010-0x0000000000000017]
  RIP: 0010:xfrm_local_error+0x92/0x190
  Call Trace:
   <IRQ>
   xfrm6_output+0x599/0xae0
   udp_tunnel6_xmit_skb+0x713/0xd90
   vxlan_xmit_one+0x1ebc/0x3490
   vxlan_xmit+0x1369/0x6540
   dev_hard_start_xmit+0xe3/0x5b0
   __dev_queue_xmit+0x18e7/0x3550
   ip6_output+0x360/0xec0
   ip6_forward+0x1573/0x35c0

Commit 1620c88887b1 ("xfrm: Fix the usage of skb->sk") changed both the
IPV6_DONTFRAG test and the local error test from skb->sk to sk.  Test
skb_to_full_sk(skb) in both, as xfrm6_tunnel_check_size() does.

A frame without a socket then goes to ip6_fragment(), which sends an
ICMPv6 Packet Too Big, also when the tunnel socket sets IPV6_DONTFRAG,
where it was dropped silently.  For callers that pass a NULL sk, such as
ip6_tunnel, the error goes to skb->sk again, as before 1620c88887b1, and
a request or timewait socket that vrf passes as sk is no longer read as
a full socket.

Fixes: 1620c88887b1 ("xfrm: Fix the usage of skb->sk")
Cc: stable@vger.kernel.org
Signed-off-by: Rustam Mustafin <rmustafin@cloudlinux.com>
---

Notes:
    v2: also use skb_to_full_sk(skb) for the IPV6_DONTFRAG test, as the
    review of v1 suggested; drop the code comment.
    v1: https://lore.kernel.org/all/20261114125552.1319352-1-rmustafin@cloudlinux.com/
    
    Tested with KASAN on 7e1392a42ea2: a frame forwarded through vxlan over
    IPv6 ESP oopses without the patch and not with it.  Through ip6ip6 over
    the same ESP tunnel, a too big frame is dropped as before; ping now gets
    EMSGSIZE on its error queue instead of a Packet Too Big.
    
    Not touched here:
    - iptfs_is_too_big() has the same mismatch (IPv6 oops, IPv4 silent drop);
      it was pointed out in two reviews:
      https://lore.kernel.org/all/20260908224856.1591189-1-kuba@kernel.org/
      https://lore.kernel.org/all/179369310739.488856.16665150928122536725@kernel.org/
    - skb_to_full_sk() can read a freed listener when a bpf syncookie request
      socket is redirected and queued; the bpf_sk_assign series handles it:
      https://lore.kernel.org/all/20261119142231.2612515-2-razor@blackwall.org/

 net/ipv6/xfrm6_output.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/ipv6/xfrm6_output.c b/net/ipv6/xfrm6_output.c
index 44b221a09a0c..d38311645908 100644
--- a/net/ipv6/xfrm6_output.c
+++ b/net/ipv6/xfrm6_output.c
@@ -88,14 +88,14 @@ static int __xfrm6_output(struct net *net, struct sock *sk, struct sk_buff *skb)
 
 	toobig = skb->len > mtu && !skb_is_gso(skb);
 
-	if (toobig && xfrm6_local_dontfrag(sk)) {
+	if (toobig && xfrm6_local_dontfrag(skb_to_full_sk(skb))) {
 		xfrm6_local_rxpmtu(skb, mtu);
 		kfree_skb(skb);
 		return -EMSGSIZE;
 	} else if (toobig && xfrm6_noneed_fragment(skb)) {
 		skb->ignore_df = 1;
 		goto skip_frag;
-	} else if (!skb->ignore_df && toobig && sk) {
+	} else if (!skb->ignore_df && toobig && skb_to_full_sk(skb)) {
 		xfrm_local_error(skb, mtu);
 		kfree_skb(skb);
 		return -EMSGSIZE;
-- 
2.52.0

