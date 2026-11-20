Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196627;
	b=Wc6v4o8CqiiZ35NrmcnVkFCQ7HuBmFoGisdmX879chueONgT+KeXWSoxAaH0ACmJnVYE
	 +EPMXwFhez1iuWPAraO+o571W2wak10BBv55z2MmPuvDly8hftUG3uyvPXD0JUf1HUzuR
	 mDaqylxBOi9vC+OWHM1Fu7t2nIHd2n+8haFCd2EQhrUcDWn9OOjSef251hCPO8YZS8D+7
	 +aILF5qVMyoRNPJotzaB1OMGyp96IMfur4PA16seTVLmkUNIdd3jRvlzKI9brGpTmv84P
	 fcbzFyL3aQ6MkonxPY34TYuBiMSGESQyTVnvGWrLaHqM66rvc9hEBsqZS1Ff9S+cQiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196627;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Z2vlB7NbKGLoTXOXAXKnGvAFGuwLLDoa8HHQ3kIB5h0=;
	b=2+LZe/uWzHCVK9gKAmQicvqB+xQqC9b55jyA6+qdWmcMYxM6Wi9+v7JEUpO+cvFl8e4w
	 kkyM2vvFSNP1B7p5mdOcJ3KoAOT2c0rBV2cIkGM7LxUIt2lwgfDl0/yyxnHkGTxvY9YUt
	 ZlFPWgGqUwrczJlAPBMD/bi3hdGJWgeVScV8Y2Am/rW0BqeRf/iPMFJFFggW0HMowHlNt
	 VhWo7V2aXG/JGZwFDq16JQVVCE4pfvbeoZPLaFl76EyjC7e9YSi24HULIAUgpCn9GW5fP
	 Xif8AX3MYx3Io08tnyxLd+F5vMpSwkyciOi9gYJ4ENIuExfW2USNroJXyYPbV97fBeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q1YKlIeL;
	arc=none smtp.remote-ip=209.85.217.42
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327FB606A7DB
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:43:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 327FB606A7DB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q1YKlIeL
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7777fa8f1ccso457051137.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795196625; x=1795801425; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z2vlB7NbKGLoTXOXAXKnGvAFGuwLLDoa8HHQ3kIB5h0=;
        b=q1YKlIeLQUegIpe4ga8FgyMH86d9w2x6f28HPugD7Vnsq927O3G5OoL00UC665t9cX
         2EfzeUgnv/9pVJe6Cxj4VRZaADBGjW6tCniLeIcrprs9BIcqlizgkHT4HZSnuDRsZ8E3
         CkzuHeQp/ebG+jLhIyU2fTQ92pXuZ3yrveQrDbsz8NxjfHuDwswlKZ/K/31wmpxRf3uZ
         ubL411aejf+KNcuudeIryAdkvfxlZzg+bKCsYu7WFjZOzuxM6O7ji6OcbMY3Kxi+qIn2
         Kq3tc2MBr8LgTyAmM+hNZJqJlPTyuTbCy8UT6GRHtN+ZH7lcSpmFq0MQ7MTSKsF9ca1n
         /ocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795196625; x=1795801425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z2vlB7NbKGLoTXOXAXKnGvAFGuwLLDoa8HHQ3kIB5h0=;
        b=ZcNNfpQFH6YZLA5y3/Br5QWNfFgVbDIWQeNhgSac/Bh1OKADYVH2e8piBOu5Yg8Dce
         XJ21aimQ/Dp/9HFbRml15naj6Zu92XOdz/brs4GxhHmrCrJcB3GNc1tnpNZ4cCNqSxMk
         XUcN/R5HwIUGAvXdYyWAVrcxzq9Y1P7EdeBcYaGUbTta56WChwfNu8RNiDqKoBIkSHVl
         V5U/9zk4tixKnksxRvpwqutkZ0+RmpRB4YTMv1d+wy9hxlK6PuluYWH13qi/LP7yA1C9
         H122PKZadiF7R2myYRRd0q7wh0HMTXi75I8G2aZKLyLl7HcdRk88RBpb65vWvv9R0E04
         bF7A==
X-Forwarded-Encrypted: i=1; AL+hErE6vJFTaOnl5kYiqlacKmUYBTHNTpebtM5VH39I8YDLo0bXgbGTv1B/LXcLlRsYaQaQMtRz0zS9Oe5hlUw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VG1nWP+HgjaGRH7nqK2Q3U1BRv5Hg1yQmf5Uno5M3CYPAEuyZ
	Sbg7WSzoyRolNKMSoB8JYb7pt0CFP4RHuT4pWlH+byOcmGuCxwijFQPN
X-Gm-Gg: AZFdTZedZJKHPZo0HI4/r7uV9zcEeK1pK2x5zJpeS/Hchdp4H58Iro56p6QljTArade
	1rsIN78dLb0TdShKHE8Z0DsO7bTryO3Xlmxt5D/rrN2hPfSFSX4sXysZoZpkrPjXqttT1C23ezv
	O6eAgBrDCKQr5lyYALXNW1j/JFl3gnuGkO2oGF9MiwmqKfqGRzobkI07+xl8X442JBdlGsBA5cy
	8SWlpsGvHxAwA/NNQFR4/TSfFnVoM0q5xaTr0NxbNEc/sn5KHsMk/x/CJa72lZzR/IcTg6VoTd3
	MbphcHN0xqfCOu89FiHZkJH7mtpPpGQ7UZWfKMBqgze1q7h4uQquwuEKhCFPDgjJgVNTFtRHbQG
	f1zpLGt6U/5vVTo80ghqMCV7irAzrbLh2ODqAAO2HjjX4w6tjbkHWhwrvj7nAmVghj+MRzsz5J3
	5cF3vZP+lE4sdTPpGnemQL+QZLVQV7ETHE6MS9ghEIihgQsAsmkak48BQOxuVuXkacP9p3TXjvC
	R4UWaCXzOUHmDKsEDU9LKHnUzaJMNfRhDL8PUaa+qAWRaGPQuZFNmI8KEoYKPcoiZJDkdZj4N2H
	mOmBG/f1jReen0mNnucbezZjkXtZGxEWB1P5u6pVQ6utdUZaaJfDJcm94BZOkWo4wDTb1g==
X-Received: by 2002:a05:6102:4b06:b0:7d2:8dd0:301 with SMTP id ada2fe7eead31-7d7395cf0e3mr1827338137.29.1795196625209;
        Fri, 20 Nov 2026 09:43:45 -0800 (PST)
Received: from localhost.localdomain ([2603:9000:d440:53a:a9cf:4432:7fb7:e8])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e7d784b3sm3571363137.2.2026.11.20.09.43.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 09:43:44 -0800 (PST)
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
Subject: [PATCH net 2/4] udp: Keep the bound device on disconnect unless connect() set it
Date: Fri, 20 Nov 2026 12:43:39 -0500
Message-ID: <20261120174341.35873-3-juanagusnicco@gmail.com>
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

__udp_disconnect() clears sk_bound_dev_if unconditionally, without a
bind conflict check.

This is only safe for a device that connect() set, which
__ip6_datagram_connect() does for a link-local or multicast peer. The
device can also come from:

- The user, with SO_BINDTODEVICE, SO_BINDTOIFINDEX or a bind() to a
  scoped IPv6 address.
- A cgroup program, as with ip vrf exec.

The bind conflict checks treat sockets bound to different devices as
not overlapping. As a result, an unprivileged user can bind an address
and port that another user's socket holds on another device, clear its
own device, and receive the other socket's datagrams:

  victim:   SO_BINDTODEVICE(lo), bind(0.0.0.0:P)
  attacker: SO_BINDTODEVICE(eth0), bind(127.0.0.1:P)
  attacker: connect(AF_UNSPEC)            /* clears the device */

Record in sk_userlocks that connect() set the device of a socket that
had none, and only clear the device on disconnect in that case.
SO_BINDTODEVICE and SO_BINDTOIFINDEX drop the record.

This changes connect(AF_UNSPEC) for UDP, ping, raw and L2TP sockets,
which all use __udp_disconnect(): a device that connect() did not set
is now kept, so changing it afterwards needs CAP_NET_RAW, as on a
socket that never disconnected.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Juan Agustin Niccolini <juanagusnicco@gmail.com>
---
Notes:
- Within a VRF, connect() can replace the master with one of its
  interfaces, which is now kept on disconnect, so binding back to the
  master needs CAP_NET_RAW. Before, disconnect took the socket out of
  its VRF. Restoring the master is not safe: the bind conflict checks
  treat a master and its interfaces as different devices, so another
  socket may hold the master by then. Fixing that is a separate,
  VRF-wide change.
- Ping, raw and L2TP sockets call __udp_disconnect() without the socket
  lock, so the sk_userlocks update is unlocked there. That predates
  this change: commit 286c72deabaa ("udp: must lock the socket in
  udp_disconnect()") only added the lock for UDP. Fixing it means
  changing how ping, raw and L2TP handle disconnect, which is separate
  from this fix, and a lost update cannot cause a bind overlap anyway.

 include/net/sock.h  |  4 ++++
 net/core/sock.c     |  1 +
 net/ipv4/udp.c      | 13 +++++++++----
 net/ipv6/datagram.c | 17 +++++++++++++++--
 4 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/include/net/sock.h b/include/net/sock.h
index 173b37b2b8bb..78fc65adbcb8 100644
--- a/include/net/sock.h
+++ b/include/net/sock.h
@@ -1534,6 +1534,10 @@ static inline int __sk_prot_rehash(struct sock *sk)
  * define SOCK_CONNECT_BIND - &sock->sk_userlocks flag for auto-bind at connect() time
  */
 #define SOCK_CONNECT_BIND	16
+/**
+ * define SOCK_CONNECT_DEV - &sock->sk_userlocks flag for a connect()-set device
+ */
+#define SOCK_CONNECT_DEV	32
 
 struct socket_alloc {
 	struct socket socket;
diff --git a/net/core/sock.c b/net/core/sock.c
index e2401d735c5a..5ce4aefc514d 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -650,6 +650,7 @@ static int sock_bindtoindex_locked(struct sock *sk, int ifindex)
 
 	/* Paired with all READ_ONCE() done locklessly. */
 	WRITE_ONCE(sk->sk_bound_dev_if, ifindex);
+	WRITE_ONCE(sk->sk_userlocks, sk->sk_userlocks & ~SOCK_CONNECT_DEV);
 
 	if (sk->sk_prot->rehash)
 		sk->sk_prot->rehash(sk);
diff --git a/net/ipv4/udp.c b/net/ipv4/udp.c
index 446729b41d66..9f1f45afee53 100644
--- a/net/ipv4/udp.c
+++ b/net/ipv4/udp.c
@@ -2195,6 +2195,7 @@ static int udp_connect(struct sock *sk, struct sockaddr_unsized *uaddr,
 
 int __udp_disconnect(struct sock *sk, int flags)
 {
+	u8 userlocks = READ_ONCE(sk->sk_userlocks);
 	struct inet_sock *inet = inet_sk(sk);
 	/*
 	 *	1003.1g - break association.
@@ -2204,15 +2205,19 @@ int __udp_disconnect(struct sock *sk, int flags)
 	WRITE_ONCE(inet->inet_daddr, 0);
 	inet->inet_dport = 0;
 	sock_rps_reset_rxhash(sk);
-	WRITE_ONCE(sk->sk_bound_dev_if, 0);
-	if (!(sk->sk_userlocks & SOCK_BINDADDR_LOCK)) {
+	if (userlocks & SOCK_CONNECT_DEV) {
+		WRITE_ONCE(sk->sk_bound_dev_if, 0);
+		WRITE_ONCE(sk->sk_userlocks,
+			   sk->sk_userlocks & ~SOCK_CONNECT_DEV);
+	}
+	if (!(userlocks & SOCK_BINDADDR_LOCK)) {
 		inet_reset_saddr(sk);
 		if (sk->sk_prot->rehash &&
-		    (sk->sk_userlocks & SOCK_BINDPORT_LOCK))
+		    (userlocks & SOCK_BINDPORT_LOCK))
 			sk->sk_prot->rehash(sk);
 	}
 
-	if (!(sk->sk_userlocks & SOCK_BINDPORT_LOCK)) {
+	if (!(userlocks & SOCK_BINDPORT_LOCK)) {
 		sk->sk_prot->unhash(sk);
 		inet->inet_sport = 0;
 	}
diff --git a/net/ipv6/datagram.c b/net/ipv6/datagram.c
index ff7a7ffbf983..0296207dbeb0 100644
--- a/net/ipv6/datagram.c
+++ b/net/ipv6/datagram.c
@@ -139,6 +139,14 @@ void ip6_datagram_release_cb(struct sock *sk)
 }
 EXPORT_SYMBOL_GPL(ip6_datagram_release_cb);
 
+static void ip6_datagram_connect_dev(struct sock *sk, int old_dif, int dif)
+{
+	if (!old_dif && dif)
+		WRITE_ONCE(sk->sk_userlocks,
+			   sk->sk_userlocks | SOCK_CONNECT_DEV);
+	WRITE_ONCE(sk->sk_bound_dev_if, dif);
+}
+
 int __ip6_datagram_connect(struct sock *sk, struct sockaddr_unsized *uaddr,
 			   int addr_len)
 {
@@ -229,11 +237,13 @@ int __ip6_datagram_connect(struct sock *sk, struct sockaddr_unsized *uaddr,
 				err = -EINVAL;
 				goto out;
 			}
-			WRITE_ONCE(sk->sk_bound_dev_if, usin->sin6_scope_id);
+			ip6_datagram_connect_dev(sk, old_bound_dev_if,
+						 usin->sin6_scope_id);
 		}
 
 		if (!sk->sk_bound_dev_if && (addr_type & IPV6_ADDR_MULTICAST))
-			WRITE_ONCE(sk->sk_bound_dev_if, READ_ONCE(np->mcast_oif));
+			ip6_datagram_connect_dev(sk, old_bound_dev_if,
+						 READ_ONCE(np->mcast_oif));
 
 		/* Connect to link-local address requires an interface */
 		if (!sk->sk_bound_dev_if) {
@@ -265,6 +275,9 @@ int __ip6_datagram_connect(struct sock *sk, struct sockaddr_unsized *uaddr,
 		np->flow_label = old_fl6_flowlabel;
 		inet->inet_dport = old_dport;
 		WRITE_ONCE(sk->sk_bound_dev_if, old_bound_dev_if);
+		if (!old_bound_dev_if)
+			WRITE_ONCE(sk->sk_userlocks,
+				   sk->sk_userlocks & ~SOCK_CONNECT_DEV);
 		goto out;
 	}
 
-- 
2.43.0

