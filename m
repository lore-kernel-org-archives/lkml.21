Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795610539;
	b=elnHM/eWggBN6W2k25gZftq99jm0c8qUrxvo7IcHS8bjoqF2U9ybs7DM8sXhde9HSEoK
	 fCIRY8HVWLgT8BHdbpfv61MfQVYRdpUOe1KDfs73sCvr/P17ljFQ0lcLuPGVgBDadj40b
	 2VVdCJaFmeIrTW6nIjFJZ1Dk8L78yK+mtmr6q6C0ZpIBOBowkxqbYprGQJq57qex/XKRj
	 vpsVyAp8gSQgcS605vF20F7i7svMdOLcalfJ5vJv3FYGqga0aUvySX6kXq2h566WBF55K
	 oV7LHuV1xs3ke2OIsd+FWF8XWPgViAArWu8Ks9Ptx/Z3U979dfDzI/wzgOjhbniKXxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795610539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Fz1HrHRhCPEILfFit7EgeydABb/j/p9kGIL6sGWoE88=;
	b=WgY5cNWkPITD9tK2taZ/RldwGbngXsXNc4/V94bNX+4VV3fcHoGLM0odKg87tGN1BQ0n
	 Hil6VMTlACosQ3zM04k1RIuCtPhcze5kntadSkkdfeHzOC0SaMWkbJr9pjcq12M+0dQtO
	 l86XyW7qYpPoI6c2IHTjLEQ6b198l8gYt6yQxFnJZTxypstG4PoWsthjA9Be5XHCIC7tI
	 i5yIBrhgd8cdr1iWcniEyMoAFLCeWzHZfNWcOk7Tfoa8POAkcGpIP+sSgisyvkzFneZHm
	 KRiIneLWr5DxkOdErYMEHxRqqOvUzCHD2gUQA0/AIQ621plzD609iUV2FE4PV9ta3CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GHV8uFYW;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B92A606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:42:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B92A606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GHV8uFYW
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-386b8f2f671so2761093eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795610538; x=1796215338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fz1HrHRhCPEILfFit7EgeydABb/j/p9kGIL6sGWoE88=;
        b=GHV8uFYWATG6RH123GTMku2BDs1rhKCmw9ndUPvy6nQTokgKOKcwk2TeFVyKVWpUv4
         g9Npy1QIgamKzL6ZIL2UmDgMfFLJo1ch6LoM4/RybjaT6LP0zUls7VCbqDymuF1lVjpT
         L0kQnC966QcIH+l0AGg1tfpD1cgrKRdiCYt60N1hpWJqGNOcHjBlQpl38X/hWaflMHFj
         BgCQwikZVorLmWhoV/ahGEDU8B9f9cazTIFLXftBwBJIwj7xrPMJY6MvXF6pt6VfhkI3
         uE1ahApK8jIZFKbxBy6ZV2MLc9MZnuR7JgY5u5bx56visACnasTg11kXOCeR5tZB9+PU
         Zvbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795610538; x=1796215338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fz1HrHRhCPEILfFit7EgeydABb/j/p9kGIL6sGWoE88=;
        b=op3jP4TlVwc/6/xH6wz0JzsYW6QhaY7MhoKcj6am2fmzMQsD0ygSBLiEiy9R85vTCU
         qyZ1g1Z1x6fGHS8Xi9yFtyMAjK7MjOfcoKtto5IGb2wRmDlc462lWvUL4baamwI+VIi5
         XjMgxIzE9Dil1Mocreye/7xjjoknku0BFhR8rkf+Q/kJELQ8/7VIA0FWljoNUdz8G7DV
         +tQEASEi73jZY/P5VA/2z818aFTaQ/PE4B+sqr5GqxSrDNcOIAHxPQUpntQyYWRWjjVa
         j2ixx800DKvr58027Amb9wpl0gVdayrwOO4UFwvDe6vh6AEI9m/bm8DBK7/66CnAgfmJ
         wkUA==
X-Forwarded-Encrypted: i=1; AL+hErE8qdgLuG956t00k9DKE5aQfa/bJSRGr+C2/4Dld473jNCYng5MZWHYk6MRBBWsbm21uiPpLCbjvMvtn7o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RDIP0Fda5ymmu07gnVPH9547ZeIJRIf+Ixq1Y8oU5wDGlw87T
	666zY3cQGSRCEhU2sKd5pvwxfsIbLldtJIipkAUtpwA6uFlYy68ucXTK
X-Gm-Gg: AZFdTZeKjqckjEDuIUKkTV8HoytskEkMGSXnbSAv+TnfbZO2zweTzD/0F51r32cY5OL
	uYBh1EqHRd7ccfs3WobaXVTIwsMZYdlNkMX+PRJS9IFWdzR4o/Phs1qzmzG05xcRAfiRIRTTJtC
	XmUvWubqBzLg3ty/25IVQLSwMg9b29gbx4xoSNl5kVzuqgHHcac8wh6mGUWdcu/whHV9qj1Nrzc
	LKPY6l63LRrVMxOduaRq8ZtV9PF1jsgEyXaJZ4/yGbSoyQRgMYUJu1RNznkEf2ORmD5+eDFmaNm
	Nh52PHwVkktPtHCu5TpDcxW7L6A5tOY+DI8mAJYJooH1Jk3de51/HVJVrTAGXWEYIrWXO0dKbue
	6QW1q2IYh/UOnetyb3VyRS2if75a+Kwk0AmdC+sf9wQHIjDpShMzcbyaubxNnWvpjTN8x9zDwO1
	b/YgRVMIf95XqqF2tQNgUDaLuE10vcT3CfTcyvrtthLNzq7hFmGRFC8ICR0QWJh/S0/8ktDzkLz
	6O5rSjrw1YfE0aujAQDWZpPzTnWOftUjNb65i/3s7PispZP2n6bcYpj8GYqrQNEr3fNQErFRBEO
	FjIpmt2EdtQw3godlVRq0lZMphr/rB9rNdT8klTyPF7vpI36Zw==
X-Received: by 2002:a05:7300:cf8f:b0:386:a728:6c12 with SMTP id 5a478bee46e88-386a72873femr11019596eec.8.1795610538260;
        Wed, 25 Nov 2026 04:42:18 -0800 (PST)
Received: from localhost.localdomain ([112.170.44.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386d605c894sm2132195eec.2.2026.11.25.04.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:42:17 -0800 (PST)
From: Junyoung Jang <graypanda.inzag@gmail.com>
To: Eric Dumazet <edumazet@kernel.org>,
	Neal Cardwell <ncardwell@google.com>
Cc: Junyoung Jang <graypanda.inzag@gmail.com>,
	Gwanhyun Lee <gwanhyunlee@gmail.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Mina Almasry <almasrymina@google.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] tcp: do not BUG on an unreadable urgent byte
Date: Wed, 25 Nov 2026 21:42:11 +0900
Message-ID: <20261125124212.4145820-1-graypanda.inzag@gmail.com>
X-Mailer: git-send-email 2.43.0
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

tcp_urg() checks that the urgent byte offset is within skb->len and
then calls skb_copy_bits(). The byte can still lie in an unreadable
Device Memory fragment. In that case skb_copy_bits() returns -EFAULT
and tcp_urg() calls BUG().

Mark the byte as TCP_URG_READ when the copy fails. Leaving
TCP_URG_NOTYET pending lets a later segment retry the old urgent
pointer: the unsigned offset can wrap into that segment's TCP header
and return a header byte through MSG_OOB. Clearing urg_data instead
would drop the urgent-byte hole and make ordinary recvmsg() hit
-EFAULT on the unreadable byte. TCP_URG_READ prevents the retry and
lets the receive path skip the hole until copied_seq passes urg_seq.

A custom LLM agent developed by the authors found this issue.
The author manually reviewed the root cause and tested the reproducer
and fix. A test-only netfilter module put a loopback MSG_OOB byte
in an unreadable skb fragment. On a 7.4.0-rc2 KASAN kernel, the
original code hit BUG(). The return-only fix avoided the BUG but let
a later MSG_OOB read return a byte from the next TCP header. With
this fix, that read returned -EINVAL, and a normal MSG_OOB control
still returned its byte. A test-only KUnit case seeded TCP_URG_READ
on a synthetic NET_IOV_DMABUF skb and confirmed that a successful
MSG_SOCK_DEVMEM read clears it. Device Memory hardware was not tested.

Fixes: 65249feb6b3d ("net: add support for skbs with unreadable frags")
Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>
---
 net/ipv4/tcp_input.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index d9a66a1342ef..50c0da17923e 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -6390,8 +6390,10 @@ static void tcp_urg(struct sock *sk, struct sk_buff *skb, const struct tcphdr *t
 		/* Is the urgent pointer pointing into this packet? */
 		if (ptr < skb->len) {
 			u8 tmp;
-			if (skb_copy_bits(skb, ptr, &tmp, 1))
-				BUG();
+			if (skb_copy_bits(skb, ptr, &tmp, 1)) {
+				WRITE_ONCE(tp->urg_data, TCP_URG_READ);
+				return;
+			}
 			WRITE_ONCE(tp->urg_data, TCP_URG_VALID | tmp);
 			if (!sock_flag(sk, SOCK_DEAD))
 				READ_ONCE(sk->sk_data_ready)(sk);

base-commit: 37fa509e43ba59d7c329025436e8ea64bdf089d7
-- 
2.43.0

