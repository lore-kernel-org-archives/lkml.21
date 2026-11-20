Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196626;
	b=MPfIx0iMTgWMISMiXlfefbRKeoQVDzwDnbjQ9eiMMudvfSuwsXLdtEmGbaatcOq+avTm
	 tL5ImyfSQyS3aScfRkiCvUUuKw//zUXQqKDZuDCFC/FDDukF7d1PpR0zhcPd1FYreY3oH
	 pC3VqTxy4AFbEFjOlbhCJFcvuPmNvj5S4/xct8lKb3kyYdgfLgUVLhRNAciy/r/y98QNs
	 8hxckB4BL2Ny6DlgZUVvWOLJlE4wD3ehaWM6/cYBYK41ynV7LakDp9qLJlUYUtaLzZ8HI
	 Pn58i4C/kY0CYRpDgXEf8XSOx1BMrnD/CxDfpi0VnBNWwXOa1hQQTupoPbXb8ODt53g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9RS1aTZbvFjlQeMzAWvxNDOmSGxq+psns4GOzN5ypAs=;
	b=GqKKfbQqDDjObfWjKNqMcl4CQGnGJFcBmzJKpXSEh9zJ98EpiTLglOB14hQCyhMScEWK
	 /JwJnM/N8Aby+AjsozL5c9jcIIusfCfnpC4PuXOoVP5sO+mE7cYLLP+SwKKNCOMA/YG8l
	 RUL1M0bGyoPL/pxLPUHhnyHobJkrAEK4VnIq9Izwuae9DbF2Wg491w4Kou4YeLhUjD0AA
	 mv+laZ7XO6XDsS0Dn32eiGYe21JBTrC8bIK0xX0+EE0+9P1MOqhjGS5lhV678hfWjTzZc
	 mQt8PnT/9myUxBOD7lVHJ3JsTqglaN4mF+B1Sh80bLGPB3yK3Pi19pL/LrkjBLMVnDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J4iGkAy4;
	arc=none smtp.remote-ip=209.85.222.50
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336B0606A7D5
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:43:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 336B0606A7D5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J4iGkAy4
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-99e0d9b3438so325084241.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795196624; x=1795801424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9RS1aTZbvFjlQeMzAWvxNDOmSGxq+psns4GOzN5ypAs=;
        b=J4iGkAy4Jk/VD59I2nqQ1enVY3HtGwVnhz0h5ynsHI2i38PPbVDFduQH6KVKdWejDO
         dMCH6d2/hpoonk0tRwe7AZuXcMDT5P0e0GJtWIAg66q8ihXbrd2L7Nd6dDDuVxu27ADT
         Iu8APcY6TUb7TKtt8nXxPLKUxc4wz0FHF+J0IebC6x1/B84QyivsAQ0dtfDfd5tU68Jb
         SczJ3Vn/qdjwVWo9zC4pPOt9fyrOQ6u7RRc99OyVHBeuA5Lfuqeycm49O63oW2A+tlwT
         TEHCoqTessyy01NuZYBX7gJafHh6cyJ/etkauWBqkJVAJZtShjbvkEayazif+Fw5xXZG
         KflQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795196624; x=1795801424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9RS1aTZbvFjlQeMzAWvxNDOmSGxq+psns4GOzN5ypAs=;
        b=lg504uTTgnLFituRGzDS/aUeVVwx8V1rApOpF53oDO/bBH4IXF7jVqSAyq6WNTtjNK
         SATV54SWF2H0oNbVgnCV4w+NeuzLwJMG8j2qalGjA2zbs1j8z0opUOMg5CKo+g6/Db4m
         dY4hFsMhg6kR0xSzlOsTkrmq7fsPbf55r5U5Bd+237Is+GZAtc0Uta2ADac4DH2wj6lD
         J9r8cGbMYqTCtd1scKHRBX4W15VP+pUg4aebZEQBDGFL/jcG5wtXqMEdQwUwqANWFMmZ
         +asUVaMXVCNSyDseIvUCnj6hyPT1uXxnl99+VL/C9twFy6Ha7NBvnceMG8lQeRTM3jvC
         apgQ==
X-Forwarded-Encrypted: i=1; AL+hErG6EtGQE+C+g/GnuywhQUtrWisskBp3ykdpUl6sy4bNiJtYvOmQW1kNvMpHYx7z803zgUSREpegfaHvozs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UFV449FseEZHzYhIfQgz5vh6378G/eZ2ktpNp5R8G8YBgIZ/J
	I/KiXqjyOt86+fFnuKX1vlwgGWXBCaLid7W8V7C9O4HrV4P4XvLlpG7J
X-Gm-Gg: AZFdTZfqQ1xhc7MXaa2nreKnEaXvLyJAg9nPTV4OCnaAS5E5pPY6/QlBqTYhYzx51wF
	dbLiMP82lJlT4IrWXOBX9ZXNy07ZSpGVYG03nWIJ/yIjY2stZAlvzPwptW44HSCWq4nGgNeqnG/
	nJVaDLXWAhGtvv5SxYgmH+TuM0E1wvTDtDaSojMZF9QHYg7WUa1ysH3P3YiGzF6HA6TH/Zc+r7j
	LrvSi6MfBbw557zf4aZh+rgWEaaq1Gu6FDvVQ+7RBzQQU9mEdq6GRKtCEDcrSLhogIRVFkVMTsn
	K69EOF6qCH7brEfPqQtrGX1/AkZUu/J7X0a0nbhubtsO7lM6WCQN67EZOJMh/yZtCQhp/ARvolP
	Jgz/NSoe3W+Pg9RGX6ZWPzL/LZ00Thyi36yHdcUsdb2kbUKMOeL56xUM50jOcrPKFIDqw160ESC
	VPUchUeGWFBommagF42WNVB6ZjwpHn0Ld0GU0BMLWPV07HPA3tHB3YBSUCbGnF7V8K1JwacExWG
	vjakJgnsHgo8kCTs0jfo4MQ55CQWMxIX+aNFVuiNhtnuPmZUXs5lS2HeoKwGEH6OBOZbxZ+PzHZ
	U1izJCIsvE5IIICFu6ODkF7gCRU+V/taV3+X41FUf+WjTnNAm6RVVG1r+BgcsIXxlv0ZOg==
X-Received: by 2002:a05:6102:c54:b0:7c1:f530:2d8e with SMTP id ada2fe7eead31-7d7396a6024mr1680666137.35.1795196624132;
        Fri, 20 Nov 2026 09:43:44 -0800 (PST)
Received: from localhost.localdomain ([2603:9000:d440:53a:a9cf:4432:7fb7:e8])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e7d784b3sm3571363137.2.2026.11.20.09.43.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 09:43:43 -0800 (PST)
From: Juan Agustin Niccolini <juanagusnicco@gmail.com>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Willem de Bruijn <willemb@google.com>,
	Eric Garver <e@erig.me>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 1/4] udp: Fix bind conflict check stopping at the first reuseport socket
Date: Fri, 20 Nov 2026 12:43:38 -0500
Message-ID: <20261120174341.35873-2-juanagusnicco@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120174341.35873-1-juanagusnicco@gmail.com>
References: <20261120174341.35873-1-juanagusnicco@gmail.com>
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

Since commit df560056d960 ("udp: inuse checks can quit early for
reuseport"), udp_lib_lport_inuse() and udp_lib_lport_inuse2() report
the port as free as soon as they find one overlapping socket that has
SO_REUSEPORT and the same owner, without looking at the rest of the
chain.

This is only safe if overlap is transitive, and it is not:

- A wildcard address overlaps specific addresses that do not overlap
  each other.
- A socket with no bound device overlaps sockets bound to different
  devices.

As a result, an unprivileged user can bind an address and port that
another user's socket holds, and receive its datagrams:

  victim:   bind(127.0.0.2:P)
  attacker: SO_REUSEPORT, bind(127.0.0.3:P)
  attacker: SO_REUSEPORT, bind(0.0.0.0:P)     /* should fail */
  attacker: SO_REUSEPORT, bind(127.0.0.2:P)   /* should fail */

Only stop at a socket that matches the new one in family, IPV6_V6ONLY,
bound device, SO_REUSEADDR and local address, and keep scanning past
the other compatible sockets. Identical SO_REUSEPORT sockets, the
workload the early stop was added for, still stop at the first one
(binding 16384 of them on a KASAN build: 223 ms before, 222 ms after,
3727 ms with the full scan every time).

Fixes: df560056d960 ("udp: inuse checks can quit early for reuseport")
Cc: stable@vger.kernel.org
Signed-off-by: Juan Agustin Niccolini <juanagusnicco@gmail.com>
---
 net/ipv4/udp.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/net/ipv4/udp.c b/net/ipv4/udp.c
index 303d0102519a..446729b41d66 100644
--- a/net/ipv4/udp.c
+++ b/net/ipv4/udp.c
@@ -131,6 +131,15 @@ EXPORT_PER_CPU_SYMBOL_GPL(udp_memory_per_cpu_fw_alloc);
 #define MAX_UDP_PORTS 65536
 #define PORTS_PER_CHAIN (MAX_UDP_PORTS / UDP_HTABLE_SIZE_MIN_PERNET)
 
+static bool udp_lport_same_bind(const struct sock *sk, const struct sock *sk2)
+{
+	return sk2->sk_family == sk->sk_family &&
+	       ipv6_only_sock(sk2) == ipv6_only_sock(sk) &&
+	       sk2->sk_bound_dev_if == sk->sk_bound_dev_if &&
+	       sk2->sk_reuse == sk->sk_reuse &&
+	       inet_rcv_saddr_equal(sk, sk2, false);
+}
+
 static int udp_lib_lport_inuse(struct net *net, __u16 num,
 			       const struct udp_hslot *hslot,
 			       unsigned long *bitmap,
@@ -154,8 +163,11 @@ static int udp_lib_lport_inuse(struct net *net, __u16 num,
 			if (!bitmap) {
 				if (sk2->sk_reuseport && sk->sk_reuseport &&
 				    !rcu_access_pointer(sk->sk_reuseport_cb) &&
-				    uid_eq(uid, sk_uid(sk2)))
-					return 0;
+				    uid_eq(uid, sk_uid(sk2))) {
+					if (udp_lport_same_bind(sk, sk2))
+						return 0;
+					continue;
+				}
 				return 1;
 			}
 			__set_bit(udp_sk(sk2)->udp_port_hash >> log, bitmap);
@@ -188,6 +200,8 @@ static int udp_lib_lport_inuse2(struct net *net, __u16 num,
 			if (sk2->sk_reuseport && sk->sk_reuseport &&
 			    !rcu_access_pointer(sk->sk_reuseport_cb) &&
 			    uid_eq(uid, sk_uid(sk2))) {
+				if (!udp_lport_same_bind(sk, sk2))
+					continue;
 				res = 0;
 			} else {
 				res = 1;
-- 
2.43.0

