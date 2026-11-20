Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196629;
	b=WqRAxZvtpp70SsdQWVv9TK3aKyw4X0uUT1FkebOEnflBvkke8XhbsRYck1e171SLNYF2
	 1fOxXTXNVjuBAJ2Gcy0ccT7yMFyTRWBE9ny5nDeSGMlY15tkv6+EXMvkYSYsSjm2CwyXN
	 KaKb489TTVqIIk1Lcbls5UcMNyjXLvoCDbt0d++Zu1j5/xqn1GKpyaPQQY+KifU3zfQK8
	 N7mLzZHGn4gLVUjwS9DLrSL0ttaE6kJnS4PxyZbZBLOpmgYIt+e5kXBnFykh0xgkIS35h
	 9Jwn/0Bk5d2jmxBlQIRIrP/5Fp41E8dpprJ3UWcrqCqNcEcV0GTnr64oHw2at/B3NRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=v7KGyIjjX8jZtUtHgLg9K/kkFR1h+yrC9ZS5X10Hz+M=;
	b=DXO35+2htuTfGMGpitMfRRLpn+xazbV79OlmsIQY4pNxzt8+XgDQ8vfPggyji/Nv7snS
	 zVUkyVV+gA2USTke7f4CVZsJ+Zo71zaXYlXotdpOtia3K32l+XqzT21eZcP10eakWeMmj
	 2P1Dgs2/PhzIaUyUYO+jsf94YP67St0fdb4ydig+dMp4rgYyY1Bhfe//LxdpVFEeltOgi
	 SvkLL4D1V+W7mLyqd6Zf39OqvJp1PpIzQ5cZohgBXqTCwOXqLiirpQi2ogOGxAKmwVCx4
	 QBup/lmCxEveEaRgXll/spbSEPG1jP+FbCkjAHjZTsx2YlR/kFkXnFVDnJJc7bhX94Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A6xI3fT1;
	arc=none smtp.remote-ip=209.85.217.54
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7AA606A7FF
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:43:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC7AA606A7FF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A6xI3fT1
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7cc603a168fso417266137.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795196627; x=1795801427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v7KGyIjjX8jZtUtHgLg9K/kkFR1h+yrC9ZS5X10Hz+M=;
        b=A6xI3fT1lI8DKPJhlyClzuqgbSyUXbUKKP5S3dMl6Icz57s5HODVzTDdw4sdaPLsmS
         hNYEY1v+ZNq/AFAx6FoYKJOvIbBPdntq5z4+hdJdmHCN7m33SXREUCaIY1Qxjvo55Ynb
         /ZxrGyFlN76Ei6SUku+eUs0e5JEwWRdqHFie9/55QHAZD/p6sdJVXo7KIvSOecSPhWwk
         x6IiIc6nb378CNK3LnsbGLZNRDG/e2IjX3B/ZleCRaHLRxdvvoHs4x2TtB4pPJj079d6
         2AmlAr0MPJCW/uf3NP7PFuutwfvtfabMiCTKGHm1ycSSg7B26WU7Qo20ZXMhiEQrjeFl
         exig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795196627; x=1795801427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v7KGyIjjX8jZtUtHgLg9K/kkFR1h+yrC9ZS5X10Hz+M=;
        b=V0lgkpsBVL6ObVVI87MV8xV9z9yWvt/+bF8Rt8LIu7RzxjPe4YK66Bh+5+Z5rVN6Ev
         MRiCPy7FQtjyPBXNa9z3PRXLRd/WpL59vmOfR5Q2AcCK7VY7yHqJ2UliNL7GnrPM/asH
         T5EKS/rGGK6BNRNo9KiHweeRROgdaOOh8jnYHN7YmL1bLSWf4JRe1d1GgsPTfwqvDNSI
         2mJp3LyTRUmFk+FjArsr8P9GegkdDCY+TgRNUJflnsjQKXenyqwBPFvIS3in9t8x7hFZ
         wZJSqTH36HRhdD5ygMeoBwLjCYy9uG6yy+NEr7NrI+J/V8YgKJEAeAuyY+GNQ7o/tuPU
         E2tw==
X-Forwarded-Encrypted: i=1; AL+hErElbCurVkkn4epwRubA6b5lq2HKDx/36QY3uPB5/wruF+ztLh5sRFweppq2Uy/1/PalXOvFiFyJ6UUT2dY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JT7aH28Z03skyY1AzZy+5zeIRAfXwI5+YpaVR+voDo3rs43KY
	f82ASEuuyvQHY3+Q8n3Rg6cf2y+AHlD9G9PlxnfXAXWxfhqdlFw/TC1U
X-Gm-Gg: AZFdTZexUxmD+5+yUX6V627MZ5PzawXYhU45b8j829xVx4ILHbKCjgP4Jf8lHQv3Bp5
	QhE/mi8HRK7fvTkJ/xwWvDYvvr7MBafKYi/Dd3hScpJR1xR/VSAtjJzkdzApKnJM5HM4eh1l29D
	gAzxq0M1GoSrFJ5hIXRNR/UrTSM8ecP/t9IhhKDAgFxuyBDxQFmbPx3ZNfp7ZOXjEAQDZpDJcPf
	sRAYVwiKRRCriDiAyHXyIu+JhBXZ0F/pHhBP8PVvZAedCEeYTzlQZ7/0xaXOhOG+77dyfMzGQ8A
	KoUTAzubt+1PwPdSOsDKTAUoxnGHpABv+giiIC++r1U6K5I67T+vrIJsEELvW1wAX+DcUSkHhty
	Bq9zWHm+CO0YuUZnEo+I6Fg3mIvs2PwzKvS02APssAmwf/FKf1ADBnU6EWskkbkkvG0fpENWHMm
	bQn6krWBFsYvlENvKUDJO0G9xY0B1ispuvD3omPhEHHTQHfaeh3Yj8xDIoX8ByMiZyVZT+WDu6R
	Q7qcFz13INHZlsJHZXqkonvaUhMMGjR4L1omRQAFlvuWlvxrudb189UFNI0VlI4yW7dpOvostNE
	itMM18EQPmUI4srXTh75/9S8coz8fJA8hzQEaBqpUwwIfDe4MIZi4ggHkuXB6LjuUq/MjUk7nMd
	MQx/MbkbLlKIHgJo=
X-Received: by 2002:a05:6102:41a3:b0:7d2:754c:23e7 with SMTP id ada2fe7eead31-7d7396d1b09mr1556174137.35.1795196626639;
        Fri, 20 Nov 2026 09:43:46 -0800 (PST)
Received: from localhost.localdomain ([2603:9000:d440:53a:a9cf:4432:7fb7:e8])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e7d784b3sm3571363137.2.2026.11.20.09.43.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 09:43:45 -0800 (PST)
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
Subject: [PATCH net 3/4] udp: Ignore a connect()-set device in the bind conflict check
Date: Fri, 20 Nov 2026 12:43:40 -0500
Message-ID: <20261120174341.35873-4-juanagusnicco@gmail.com>
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

The bind conflict checks compare sk_bound_dev_if, which connect() also
writes, for a link-local or multicast IPv6 peer.

This is only safe if the device is the one that bind() reserved. A
socket bound with no device holds its port on every device, but while
it is connected to such a peer it looks bound to one device, so a bind
of the same port on another device is admitted.

As a result, an unprivileged user can bind a port that another user's
socket holds, and receive the datagrams that arrive on its device once
that socket disconnects:

  victim:   bind([::]:P), connect(fe80::1%eth0)
  attacker: SO_BINDTODEVICE(eth1), bind([::]:P)   /* should fail */
  victim:   connect(AF_UNSPEC)

Compare the device that bind() reserved instead: none for a socket
whose device connect() set, which SOCK_CONNECT_DEV records. A VRF
master that connect() narrowed to one of its interfaces does not get
the flag and is compared as before.

Note that the checks read the flag without the other socket's lock, so
it is ordered against the device with barriers: seeing the device
before the flag would trust a connect()-set device again.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Juan Agustin Niccolini <juanagusnicco@gmail.com>
---
Notes:
- A connect() that sets the device and is undone again, both between
  the two reads of the flag, can still be seen as a bound device, so a
  conflicting bind can be admitted. Not fixed here because closing it
  needs a sequence count in struct sock, a larger change for a window
  that the other socket's owner has to open within two loads.
- connect() also narrows the local address of a wildcard-bound
  socket, which opens the same window through the address. It is not
  fixed here: connect() moves the socket to the secondary hash slot of
  the narrowed address, so a specific-address bind on a busy port never
  scans it. Closing that needs either a full scan on every bind or no
  rehash on connect, which slows down binds or lookups on busy ports,
  so I leave it for a separate patch.

 net/core/sock.c     |  2 ++
 net/ipv4/udp.c      | 46 +++++++++++++++++++++++++++++++++++----------
 net/ipv6/datagram.c | 12 ++++++++++--
 3 files changed, 48 insertions(+), 12 deletions(-)

diff --git a/net/core/sock.c b/net/core/sock.c
index 5ce4aefc514d..48ec344a3a8b 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -650,6 +650,8 @@ static int sock_bindtoindex_locked(struct sock *sk, int ifindex)
 
 	/* Paired with all READ_ONCE() done locklessly. */
 	WRITE_ONCE(sk->sk_bound_dev_if, ifindex);
+	/* Pairs with the first smp_rmb() in udp_bound_dev_if(). */
+	smp_wmb();
 	WRITE_ONCE(sk->sk_userlocks, sk->sk_userlocks & ~SOCK_CONNECT_DEV);
 
 	if (sk->sk_prot->rehash)
diff --git a/net/ipv4/udp.c b/net/ipv4/udp.c
index 9f1f45afee53..a13bf32cbdb9 100644
--- a/net/ipv4/udp.c
+++ b/net/ipv4/udp.c
@@ -131,11 +131,35 @@ EXPORT_PER_CPU_SYMBOL_GPL(udp_memory_per_cpu_fw_alloc);
 #define MAX_UDP_PORTS 65536
 #define PORTS_PER_CHAIN (MAX_UDP_PORTS / UDP_HTABLE_SIZE_MIN_PERNET)
 
-static bool udp_lport_same_bind(const struct sock *sk, const struct sock *sk2)
+static int udp_bound_dev_if(const struct sock *sk)
+{
+	int dif;
+
+	if (READ_ONCE(sk->sk_userlocks) & SOCK_CONNECT_DEV)
+		return 0;
+	/* Pairs with the smp_wmb() before SOCK_CONNECT_DEV is cleared. */
+	smp_rmb();
+	dif = READ_ONCE(sk->sk_bound_dev_if);
+	/* Pairs with the smp_wmb() after SOCK_CONNECT_DEV is set. */
+	smp_rmb();
+	if (READ_ONCE(sk->sk_userlocks) & SOCK_CONNECT_DEV)
+		return 0;
+	return dif;
+}
+
+static bool udp_bound_dev_overlap(int dif, const struct sock *sk2)
+{
+	int dif2 = udp_bound_dev_if(sk2);
+
+	return !dif || !dif2 || dif == dif2;
+}
+
+static bool udp_lport_same_bind(const struct sock *sk, int dif,
+				const struct sock *sk2)
 {
 	return sk2->sk_family == sk->sk_family &&
 	       ipv6_only_sock(sk2) == ipv6_only_sock(sk) &&
-	       sk2->sk_bound_dev_if == sk->sk_bound_dev_if &&
+	       udp_bound_dev_if(sk2) == dif &&
 	       sk2->sk_reuse == sk->sk_reuse &&
 	       inet_rcv_saddr_equal(sk, sk2, false);
 }
@@ -145,6 +169,7 @@ static int udp_lib_lport_inuse(struct net *net, __u16 num,
 			       unsigned long *bitmap,
 			       struct sock *sk, unsigned int log)
 {
+	int dif = udp_bound_dev_if(sk);
 	kuid_t uid = sk_uid(sk);
 	struct sock *sk2;
 
@@ -157,14 +182,13 @@ static int udp_lib_lport_inuse(struct net *net, __u16 num,
 		    sk2 != sk &&
 		    (bitmap || udp_sk(sk2)->udp_port_hash == num) &&
 		    (bitmap || !sk2->sk_reuse || !sk->sk_reuse) &&
-		    (!sk2->sk_bound_dev_if || !sk->sk_bound_dev_if ||
-		     sk2->sk_bound_dev_if == sk->sk_bound_dev_if) &&
-		    inet_rcv_saddr_equal(sk, sk2, true)) {
+		    inet_rcv_saddr_equal(sk, sk2, true) &&
+		    udp_bound_dev_overlap(dif, sk2)) {
 			if (!bitmap) {
 				if (sk2->sk_reuseport && sk->sk_reuseport &&
 				    !rcu_access_pointer(sk->sk_reuseport_cb) &&
 				    uid_eq(uid, sk_uid(sk2))) {
-					if (udp_lport_same_bind(sk, sk2))
+					if (udp_lport_same_bind(sk, dif, sk2))
 						return 0;
 					continue;
 				}
@@ -184,6 +208,7 @@ static int udp_lib_lport_inuse2(struct net *net, __u16 num,
 				struct udp_hslot *hslot2,
 				struct sock *sk)
 {
+	int dif = udp_bound_dev_if(sk);
 	kuid_t uid = sk_uid(sk);
 	struct sock *sk2;
 	int res = 0;
@@ -194,13 +219,12 @@ static int udp_lib_lport_inuse2(struct net *net, __u16 num,
 		    sk2 != sk &&
 		    (udp_sk(sk2)->udp_port_hash == num) &&
 		    (!sk2->sk_reuse || !sk->sk_reuse) &&
-		    (!sk2->sk_bound_dev_if || !sk->sk_bound_dev_if ||
-		     sk2->sk_bound_dev_if == sk->sk_bound_dev_if) &&
-		    inet_rcv_saddr_equal(sk, sk2, true)) {
+		    inet_rcv_saddr_equal(sk, sk2, true) &&
+		    udp_bound_dev_overlap(dif, sk2)) {
 			if (sk2->sk_reuseport && sk->sk_reuseport &&
 			    !rcu_access_pointer(sk->sk_reuseport_cb) &&
 			    uid_eq(uid, sk_uid(sk2))) {
-				if (!udp_lport_same_bind(sk, sk2))
+				if (!udp_lport_same_bind(sk, dif, sk2))
 					continue;
 				res = 0;
 			} else {
@@ -2207,6 +2231,8 @@ int __udp_disconnect(struct sock *sk, int flags)
 	sock_rps_reset_rxhash(sk);
 	if (userlocks & SOCK_CONNECT_DEV) {
 		WRITE_ONCE(sk->sk_bound_dev_if, 0);
+		/* Pairs with the first smp_rmb() in udp_bound_dev_if(). */
+		smp_wmb();
 		WRITE_ONCE(sk->sk_userlocks,
 			   sk->sk_userlocks & ~SOCK_CONNECT_DEV);
 	}
diff --git a/net/ipv6/datagram.c b/net/ipv6/datagram.c
index 0296207dbeb0..37a093f74724 100644
--- a/net/ipv6/datagram.c
+++ b/net/ipv6/datagram.c
@@ -141,9 +141,12 @@ EXPORT_SYMBOL_GPL(ip6_datagram_release_cb);
 
 static void ip6_datagram_connect_dev(struct sock *sk, int old_dif, int dif)
 {
-	if (!old_dif && dif)
+	if (!old_dif && dif) {
 		WRITE_ONCE(sk->sk_userlocks,
 			   sk->sk_userlocks | SOCK_CONNECT_DEV);
+		/* Pairs with the second smp_rmb() in udp_bound_dev_if(). */
+		smp_wmb();
+	}
 	WRITE_ONCE(sk->sk_bound_dev_if, dif);
 }
 
@@ -275,9 +278,14 @@ int __ip6_datagram_connect(struct sock *sk, struct sockaddr_unsized *uaddr,
 		np->flow_label = old_fl6_flowlabel;
 		inet->inet_dport = old_dport;
 		WRITE_ONCE(sk->sk_bound_dev_if, old_bound_dev_if);
-		if (!old_bound_dev_if)
+		if (!old_bound_dev_if) {
+			/* Pairs with the first smp_rmb() in
+			 * udp_bound_dev_if().
+			 */
+			smp_wmb();
 			WRITE_ONCE(sk->sk_userlocks,
 				   sk->sk_userlocks & ~SOCK_CONNECT_DEV);
+		}
 		goto out;
 	}
 
-- 
2.43.0

