Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795098195;
	b=rORjI9ZBfBpxG2pG4yg0vFifA8l4bzH9dLehqtyvOq0ZiVbYVPGCmGTmAnY2RcfqUZtS
	 RQpDQFS9VcO+agIQLJLOpauqrHx++G/u1IkJytLLw0JfUyVqLBECKILw52tnIeqh1OtLk
	 J7/NmELWv2OLT6b8hz6tJ3Ch4Zadvv2yQ+/Ha41g1UyT+m5PDtZWfosmRgHgnNXT8L17k
	 /26R/cPpIwwaNRQw66CAQEykzKVdqZvnk25NrmOsCBiIig7kscROGzswi5bhw+ktUM+Vr
	 Pzo/x1UM1vnDCuGyy3EKEnOTGtEUr/TfT1NtVhCrqgVt1RaTwKPijxdYNl/VbnYkTNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795098195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=N9Dht0+rK1yV0tLYiiQtWs8fXm3ah26aEzvELZDzz7A=;
	b=DBPqovEVCm8hDKUIu1NA+XNP+3FLPupEPD9Gg8PJnMj+AUsm9jJUmqNqH65JeQ6bWlPR
	 hGGda0X1y0IRT6KRJPyTlFxRbHh+9VStq6PowD5617iLwMfM6PEFu5yfQLpePVXxcslKa
	 wxP7q23q3W9K6D5tzfJXPS3ZIFvP1OQhd/mrel6Zz3UaMNyDQ7CTWn2gdg+4kEFKnJM2P
	 NaBgjzt4YYWX2cA7gQ8ecErskA4hpVSYKDdfHHxW+uatmci/SdtPpckI5GUljrNfQey2A
	 sm4tBEyJZhwlnXam/hDgRACcYbfUD/4WbcUvaAlMEVz+NwL99zu5l9DM8KkSJsP7Hww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=axbyo65u;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE15606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:23:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DE15606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=axbyo65u
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e987a2ba0cso16941185ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795098194; x=1795702994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N9Dht0+rK1yV0tLYiiQtWs8fXm3ah26aEzvELZDzz7A=;
        b=axbyo65uiRYy1wKOnS4TNNgCFqIoTwn+x5Ze2gj+TBO14/kQtnqzofZ9FJJTqbbvOi
         lruNVOiyAVsw0tQ9vzjfPHGkfhC5yK6iRYovuNUqak6SIDSakvk8lQdivcDxMkMv0mes
         aa7qcCmzqVHQ9mPvQSZOZA6/Dw50f4YI9xc90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795098194; x=1795702994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N9Dht0+rK1yV0tLYiiQtWs8fXm3ah26aEzvELZDzz7A=;
        b=CenLiNivYZ/YJebh/KMRPNo0jTgPPrfqG2I3k9EFu8eOopaaSaW/TeAIGEJUT8t5CS
         1tGgQggmVwjt1TqGgFHqs/dSNRcbiDgMYE3BLyLWImJDD0UHKZMnhumG28hAp8Rka9xa
         QRo6fz8/WqAloI9NMj753+Bq8b5pwyUSI7eqUUIGIRFeBDBPl807yhRlWhGqInio1IuD
         Qi9bCJF+X00ly8QqN6p6cjXsQ2haFVN3G1hg5FTIuHFIhc0qEYYcNdnLfq/iG8Xpbovg
         zz5K95jmU0/71Ji4dekPrbSsIRk5M55zuu+Blwq424vz/kqiSGiu4Rg7UxPcU3jK9OjO
         DAVg==
X-Forwarded-Encrypted: i=1; AL+hErGKYHYo3Rhdmk/wW+5uT6VDiAjNKAeIQQoz536UrM8Rw7g2ThbqBf3W0c2rW+Olziw89C1/DrMVB81bTys=@vger.kernel.org
X-Gm-Message-State: APuU4Z/urW0dH+kOZtLVPfaIuHpMarMpCbE1Oabw3YoX1Hbx+AC0p/wz
	WpZkxSuyN/X5L4zpTTHpAoI1GNzcj0EvLEEr3OFd5MhTkXrnp1n0ziELA2MxU5+bbKM=
X-Gm-Gg: AZFdTZddl55DpKLmGCcSWMI4nQGT/xQUnpJfSMhG9gPRqzA/mF91vNtEFf4htka1xwZ
	9JtGH+dHWg0vjFDRasjolN/VuFNMzUV4VnAhFCEm8VLo24CJaFwzkTD5IzItfP9FZhv166csDck
	7MJwz+VI9s/VruL0rjuaBFa7jYAmEixcBiGaEt8pi1yIyGgrIucHknHe4hHrvW6C9qo3NttxeyY
	G8WL5/zu2mSLmAfEUk6JTJMB2A7HK0ewU8tKkD0iesvr9ZHaIzG3wk4ScXzIME/kgkSe1ROatcK
	F2Ptkbw2Hn0A62Ch9opmvfeGmCnKl3HC8S/aO672RU9TrqrzmLHpgOvUa8a34MFUXoduszm6HIE
	ieezaWTKnJy5A0EuYngJswK10FmyNYlQz+maACYXfKH93F6AWrtMN0Wv2qEa0RhGH9tRv1Qnbmt
	ojZfTkLQifWpO6WQIGHuICdJH95iUa+mHep3ycvVNOkXaBiFjmzcxor+RGbTOVgL/7ZR8lfwM7J
	/m4g34T1Jey1r6GlpGsz+3/zLJ/Tp9vI272p63L7wuFmshklu0Y15XGgokFajQ4dHu2JKzUDYKw
	mIUeauyokvrHCn2HOLpxUB35Yrp/jn+zhlRA1nzgbxmAdXDhiiDCAHlkdtlBYxuxQijuTcb37R3
	Wsw/pYYdi5rH6i3L3Y9i8Qz2Rxc4vK3RwBI8a/rW5rnC1GCSRD37kOxrJFh9z193OdA==
X-Received: by 2002:a17:903:1a0e:b0:2ed:38c0:332d with SMTP id d9443c01a7336-2f03f16eabamr154485ad.23.1795098194311;
        Thu, 19 Nov 2026 06:23:14 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c2ab7sm213535ad.15.2026.11.19.06.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:23:13 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Christian Hopps <chopps@chopps.org>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] xfrm: iptfs: bound the reassembly copy by the buffer it copies into
Date: Thu, 19 Nov 2026 19:53:08 +0530
Message-Id: <20261119142308.3272570-1-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
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

iptfs_reassem_cont() takes the length to copy from the inner packet's own
IP total-length field:

	ipremain = __iptfs_iplen(newskb->data);
	...
	ipremain -= newskb->len;
	...
	copylen = min(fraglen, ipremain);

and then puts that into the reassembly buffer:

	if (skb_copy_seq_read(st, data, skb_put(newskb, copylen), copylen))

Nothing ties that claimed length to the size of newskb on the path this
takes, although the file states that it must.  iptfs_input_ordered() has
three ways to obtain the skb that becomes xtfs->ra_newskb.  The reuse path
checks the requirement and its comment gives the rule:

	} else if (data + iphlen <= skb_headlen(skb) &&
		   skb_tailroom(skb) + tail - data >= iplen) {
		/* Reuse the received skb.
		 ...
		 * For linear buffer space we only require that
		 * linear buffer space is large enough to
		 * eventually hold the entire reassembled
		 * packet (by including tailroom in the check).
		 */

The fallback allocates for it outright, iptfs_pskb_extract_seq(iplen, ...).
The third does neither: iptfs_pskb_add_frags() is preferred over the
allocating one and builds an skb whose capacity reflects capturelen, the
bytes that arrived, not iplen.  Its result becomes the reassembly buffer
just the same:

	if (skb->len < iplen) {
		/* Start reassembly */
		...
		xtfs->ra_newskb = skb;

So when the sharing path wins, the buffer carries no guarantee about iplen
and the invariant the reuse path enforces is simply absent.  A later
continuation then computes copylen from a header field that can be much
larger than the buffer, and skb_put() walks off the end of it.  skb_linearize() flattens the fragments already present;
it does not grow the tailroom to whatever the header asked for.
skb_over_panic() catches the overrun and BUG()s:

  skbuff: skb_over_panic: text:... len:4000 put:3000 head:... data:...
                          tail:0xff0 end:0x6c0 dev:tap0
  kernel BUG at net/core/skbuff.c:214!
  Oops: invalid opcode: 0000 [#1] SMP KASAN PTI
  RIP: 0010:skb_over_panic+0xcd/0xd0 net/core/skbuff.c:219
  Call Trace:
   skb_put+0xd4/0xe0 net/core/skbuff.c:2641
   iptfs_reassem_cont+0xa30/0xb30 net/xfrm/xfrm_iptfs.c:920
   iptfs_input_ordered+0x479/0x4f0 net/xfrm/xfrm_iptfs.c:1288
   iptfs_input+0x161/0x2b0 net/xfrm/xfrm_iptfs.c:1733
   xfrm_inner_mode_input+0xe0/0x190 net/xfrm/xfrm_input.c:453
   xfrm_input+0xac9/0x1320 net/xfrm/xfrm_input.c:705
   xfrmi_input+0x13a/0x170 net/xfrm/xfrm_interface_core.c:331
   xfrm4_esp_rcv+0x7f/0x1e0 net/ipv4/xfrm4_protocol.c:104
   ip_protocol_deliver_rcu+0x261/0x380 net/ipv4/ip_input.c:207
   ...

tail is 4080 against an end of 1728: a 2352-byte overrun of a buffer sized
for what arrived rather than for what the header claimed.

skb_put() tests tail against end before returning the pointer, and BUG()
does not return, so the copy never runs and nothing is written out of
bounds - this is a reachable BUG()/oops rather than memory corruption.  It
is reached from xfrm_input(), i.e. after ESP processing, so it needs a peer
that can produce packets the SA accepts.

Note that skb->tail and skb->len are already incremented when the check
fires, and the abandon path is not taken, so without panic_on_oops the
task is killed while xtfs->ra_newskb is left pointing at an skb whose tail
is past its end and whose len exceeds its buffer, still reachable from the
SA.

Reproduced deterministically: eighteen payloads on one SA - one declaring
3800 bytes with 1000 carried, sixteen 100-byte continuations that fill the
fragment array to MAX_SKB_FRAGS so iptfs_skb_can_add_frags() must fail, and
one declaring block_offset 1200.  skb_linearize() then pulls into a
kmalloc-4096 buffer (SKB_WITH_OVERHEAD 3776, 80 bytes of headroom, len 2600,
tailroom 1096) and skb_put(1200) is 104 bytes past the end, which is the
len:3800 put:1200 tail:0xf28 end:0xec0 above.  The same values appear on
every run.

Bound both copies by the tailroom actually available and abandon the
reassembly otherwise, which is how the function already handles a stream it
cannot complete.  This restores at the point of use the invariant the reuse
path states, without disabling the sharing optimisation.  The second check has to come after skb_linearize(), since
that may reallocate and so change the tailroom the copy has to fit in.  The
comparison is made signed because copylen is u32 while skb_tailroom()
returns int: promoting a negative tailroom to a large unsigned would defeat
the check in exactly the leftover state described above.

Signed-off-by: Piyus Kedia <piyus@iiitd.ac.in>
---
--- a/net/xfrm/xfrm_iptfs.c
+++ b/net/xfrm/xfrm_iptfs.c
@@ -875,6 +875,20 @@
 		}
 		fraglen = min(blkoff, remaining);
 		copylen = min(fraglen, iphremain);
+		/* copylen is bounded only by the length the inner header
+		 * claims, which says nothing about the size of the buffer being
+		 * reassembled into: iptfs_input_ordered() prefers
+		 * iptfs_pskb_add_frags(), whose capacity is the bytes that
+		 * arrived, over iptfs_pskb_extract_seq(), which allocates the
+		 * claimed length. Cast because copylen is u32 and skb_tailroom()
+		 * returns int, so the comparison must not promote a negative
+		 * tailroom into a large unsigned.
+		 */
+		if (skb_tailroom(newskb) < (int)copylen) {
+			XFRM_INC_STATS(xs_net(xtfs->x),
+				       LINUX_MIB_XFRMINBUFFERERROR);
+			goto abandon;
+		}
 		if (skb_copy_seq_read(st, data, skb_put(newskb, copylen),
 				      copylen)) {
 			XFRM_INC_STATS(xs_net(xtfs->x),
@@ -913,6 +927,15 @@
 			XFRM_INC_STATS(xs_net(xtfs->x),
 				       LINUX_MIB_XFRMINBUFFERERROR);
 			goto abandon;
+		}
+
+		/* Re-checked after skb_linearize(), which may reallocate and so
+		 * change the tailroom this copy has to fit in.
+		 */
+		if (skb_tailroom(newskb) < (int)copylen) {
+			XFRM_INC_STATS(xs_net(xtfs->x),
+				       LINUX_MIB_XFRMINBUFFERERROR);
+			goto abandon;
 		}
 
 		/* copy fragment data into newskb */
-- 
2.43.0
