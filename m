Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772839;
	b=nRJpUIgYHD/SNIlSBxlC37LuMPXZDW1x7f8tql6cucdq8ywe8+UWufNx2sDCGNofAyno
	 fylyzEjp/ZukKNTKVZtKZrIGQaMoQu0HWnDRy1iQjyyCylEkPDgt2X/TkL+Yd+juPk40u
	 YqrdgRmeFsnVtv/g4OmEZIeLzJO0sLVTfdbH5SPDj3QCPcYc5noZpxcbcH4ZfsCV5JRC5
	 Tv8VYhkrnVy4C/J0yMrIr5LSwxT/8L8kk01qbX4Glw4ehytvGzfDTBw7GNdNNMRxMEW0k
	 6o0+Thr8GM0WoxpSrrSjxc0bW5PPwUJ3NrSv85Pq6M7BZCCwYB55cBR3iQeqXspzoGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772839;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ERPoF9AE59h/mhHC3wm9YzsbJsPqwKz283ZpiLJXs94=;
	b=bXlwDWT5PBjvfY1otdNAlkM2AiOdL519UR09A+9t4byDF1cXtb6ACz//5KSWZ/91ZOwj
	 xeG3h+/09tA0N71ao4dXpM1HME4D04Aw7CllmtpyV+gRK6XxNlzZ02I5enCNFyoNFXTZF
	 XecSDR/pqW2fqAoDa2dAckiNvPTdMN0Gw/YMaoYUR04W0rRmS36cttzEfMHEQ5ZoekDIB
	 ikthuW6v/M5cmiRQnSc3WS2tdZbj8DdhfEefrDqEKHcBjZL2n1sKG7s70EtAVE3EwZ7gN
	 d2geny7WsHRcqS8UwTQBsQ35MRCSHKGJBZ/tvl1sZdIzGWk+9JvYqucy/bOo7YCfJsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=YBgas6Ug;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDAC60A261D
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FDAC60A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=YBgas6Ug
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-385d8a00598so11736936eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795772837; x=1796377637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ERPoF9AE59h/mhHC3wm9YzsbJsPqwKz283ZpiLJXs94=;
        b=YBgas6Ug76VRLXKqDbshk1HEhFnj1GzM2HxxopuJfGUUkAhHarJg/0kfS5lKxB8B3I
         OS1YklOAFOseS0DU0BwnlksLGQSrfnGpTNxGeSnQJAxNlg791PebtxBrxzfZUBDuypwM
         G4Oa9FCHB7hxcsZslHDLBITe66ojBzfIIXikCAGpu6xDq4ifxfxjNuYx66OvxwHGWwD2
         +cwh5UKTMUovw57vzO3frAmMg2EDoLPst9mbpDJxeQZJk29eOIo+/1LJSehDVis9XwZc
         UU+Nb5kT7DfkRkSINq3FicF/GARL1ZOFJO/O4MlVMOPOpn5ZmU41zAvFJN+KwqDc3k8Z
         A4KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772837; x=1796377637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ERPoF9AE59h/mhHC3wm9YzsbJsPqwKz283ZpiLJXs94=;
        b=HT0HibdjUIP/MvyqKxFad6xrdHZgpTcB7UTi2LCTgR9pjSWCg/tJ06n+Ljt/4Xr9U8
         j98/nNKkEEtcNpdfHCewCLJp19URWp85GFEa+lJuDwlh7moQYwxosReVOeYrG3xMKB2H
         Fo0jFF807iAVt49wdUQzBUPz/5IEgD1d7uXj6YKwq7WUvp3m8Lj9Wua9OV1FIxisu8bR
         jUq2WW42MOR8Kb3/i9NO/NRQ6wAQrsbhgQ7jp9mWjxgo7UJXS0iIA/jeRBVaj6olJJip
         ea/SkfA/FX2ptCg9qf1WZCaLs6hIojUQWmQ2a0Hte+IWmXjdH4X0YMrumb7ff3MxtqH7
         fdDg==
X-Forwarded-Encrypted: i=1; AL+hErFn2e2fH7ZCOBd9KL0GmPzRaX/oY9dVCCCyksZP1jQTUy2mB2OWrNrLWWSgmrOrB7DBZdGPi/wGmE+9fBI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Y4rTp1Or8xInSBHe8Q4det4JWLPypS2xWIto5MjeobrbrgOgm
	HINLONW01sLL21FGbS7dTLeDRKzHQmCv2yEsTJmcLt96PKjr/fqR6ulqLZcW5d6tYX0=
X-Gm-Gg: AZFdTZcfnrnBFubjSi0ZBSFR0GHTCZk/FO+l02xw7k+NJf1XiqA+SqKYq2MFRO1Dt4Z
	gxE06b/JSzOOZWMY+QgIuFL6tyWwQsq8ss68nRgtp0OM63OFgv8dN9Iz0Ipt47NozInIuvfWAJI
	ihVKuX2ZsNu8ZFal07C0i+VXdgbEOzl84ljNY8/t7/cJFf4bFTuPYUuAPTaHsND4dsHl8Kvbmkk
	um01wzgpU3MxrJXjnNemXs6MZ+Q8Q0nd3/VfhvP18eWKObXD/S6NeUOrkxxGH/tebHKU07ERihV
	wA8XbAasm6//ZFOcW9w09sjYrPE4XlGtYuW7LHQhLZcoojLmG/xbdGTW/9fGlpQvuDISKAogSex
	0F4LRzVVu5beOqD/+JuLNGa/NNzOqBhHxx9wUe6j+TX4KZEkFIEYvgCi07F0zPqdlUsWwRXD1fJ
	T1ELMcq8s8hiEgYWHkFCjF2XBpXz0/lVGTG3m5UeP/SLmwtYtQPxcU2E4D35+N2gtx207cxEdi+
	scf8D2+LTKB/IaszZn+WGjSrV+DJHu6OYxL0RXeMgqZ718X70IKMMoN+8ujobqJK6GShrVi5Vzc
	8l+6lbqnlifQJRmxNRbhncNnJMCCn/bqaffDNlIAsrcjZ/UL/kz5gy3yJfGhN/Yp8qhiXGP2AOC
	AJbYTnzuq6aZdLrmYERQR/McCg7U=
X-Received: by 2002:a05:7022:f513:b0:1b3:b53e:b4cd with SMTP id a92af1059eb24-1b5568a951cmr22122554c88.21.1795772837417;
        Fri, 27 Nov 2026 01:47:17 -0800 (PST)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm55115194c88.1.2026.11.27.01.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:47:16 -0800 (PST)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Willem de Bruijn <willemb@google.com>
Subject: [PATCH net-next v3 07/12] amt: send the AMT gateway control plane over IPv6
Date: Fri, 27 Nov 2026 09:46:58 +0000
Message-ID: <20261127094703.3025517-8-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127094703.3025517-1-omar@blockcast.net>
References: <20261127094703.3025517-1-omar@blockcast.net>
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

A gateway sends three control messages: the Relay Discovery to its
discovery address, then the Request and the Membership Updates to the
relay it learned. All three are built for an IPv4 outer header only, so
a gateway on an IPv6-only access network cannot reach any relay.

Send the Discovery and the Request of a gateway with an IPv6 local
address from amt_send_discovery_v6() and amt_send_request_v6(). Both
messages are a few bytes with no payload, so they are built on the stack
and sent with amt_send_ctrl_v6(), the helper that already sends the
relay's IPv6 Advertisement, rather than with a copy of the IPv4 skb
construction. The Membership Update carries the gateway's IGMP or MLD
report, so amt_send_membership_update() keeps building on that skb: it
sizes the headroom for the outer family and sends through
amt_udp_xmit(), like the relay's Membership Query and Multicast Data,
which avoids an IPv6 copy of the function.

struct amt_dev gains the gateway's IPv6 discovery address and the IPv6
relay address it learns and sends to. Nothing writes the latter until
the next patch, which also adds its synchronisation.

amt_send_ctrl_v6() now holds rcu_read_lock_bh() instead of
rcu_read_lock(). The gateway sends the Discovery and the Request from
its event worker in process context, and udp_tunnel6_xmit_skb() reaches
ip6tunnel_xmit(), which increments and later decrements the per-CPU xmit
recursion counter with __this_cpu_inc() and __this_cpu_dec(). With
preemption enabled the task could migrate in between and leave both
counters wrong. The IPv4 Discovery and Request go through ip_local_out()
and never touch the counter, and the relay's Advertisement is sent from
softirq, so neither is affected.

Nothing can set a local IPv6 address until the netlink attributes
arrive, so none of the IPv6 sender code added here runs yet, and the
conversion of amt_send_membership_update() to amt_ip_hlen() and
amt_udp_xmit() changes no IPv4 behaviour.

The P bit of the Request and the inner protocol of the Update still
follow the inner family, so an IPv6 gateway requests and reports both
IGMP and MLD, as an IPv4 one does.

Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 drivers/net/amt.c | 84 ++++++++++++++++++++++++++++++-----------------
 include/net/amt.h |  8 +++++
 2 files changed, 62 insertions(+), 30 deletions(-)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index ecc30823d..42de266f3 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -808,8 +808,11 @@ static int amt_send_ctrl_v6(struct amt_dev *amt, const struct in6_addr *saddr,
 	struct sock *sk;
 	int hlen, err;
 
-	rcu_read_lock();
-	sk = rcu_dereference(amt->sk);
+	/* The gateway sends from its event worker, but ip6tunnel_xmit()
+	 * counts xmit recursion per CPU, which needs BH disabled.
+	 */
+	rcu_read_lock_bh();
+	sk = rcu_dereference_bh(amt->sk);
 	if (!sk || !netif_running(amt->stream_dev) ||
 	    !netif_running(amt->dev)) {
 		err = -ENETDOWN;
@@ -841,10 +844,39 @@ static int amt_send_ctrl_v6(struct amt_dev *amt, const struct in6_addr *saddr,
 			     ip6_dst_hoplimit(dst), 0, sport, dport, false, 0);
 	err = 0;
 out:
-	rcu_read_unlock();
+	rcu_read_unlock_bh();
 	return err;
 }
 
+/* IPv6-outer variant of amt_send_discovery(). */
+static void amt_send_discovery_v6(struct amt_dev *amt)
+{
+	struct amt_header_discovery amtd = {
+		.type	= AMT_MSG_DISCOVERY,
+		.nonce	= amt->nonce,
+	};
+
+	if (!amt_send_ctrl_v6(amt, &amt->local_ipv6, &amt->discovery_ipv6,
+			      amt->gw_port, amt->relay_port,
+			      &amtd, sizeof(amtd)))
+		amt_update_gw_status(amt, AMT_STATUS_SENT_DISCOVERY, true);
+}
+
+/* IPv6-outer variant of amt_send_request(). The inner-family @v6 sets the
+ * P bit (IGMP vs MLD) independently of the outer transport.
+ */
+static void amt_send_request_v6(struct amt_dev *amt, bool v6)
+{
+	struct amt_header_request amtrh = {
+		.type	= AMT_MSG_REQUEST,
+		.p	= v6,
+		.nonce	= amt->nonce,
+	};
+
+	amt_send_ctrl_v6(amt, &amt->local_ipv6, &amt->remote_ipv6,
+			 amt->gw_port, amt->relay_port, &amtrh, sizeof(amtrh));
+}
+
 static void amt_send_discovery(struct amt_dev *amt)
 {
 	struct amt_header_discovery *amtd;
@@ -858,6 +890,11 @@ static void amt_send_discovery(struct amt_dev *amt)
 	u32 len;
 	int err;
 
+	if (amt_v6(amt)) {
+		amt_send_discovery_v6(amt);
+		return;
+	}
+
 	rcu_read_lock();
 	sk = rcu_dereference(amt->sk);
 	if (!sk)
@@ -948,6 +985,11 @@ static void amt_send_request(struct amt_dev *amt, bool v6)
 	u32 len;
 	int err;
 
+	if (amt_v6(amt)) {
+		amt_send_request_v6(amt, v6);
+		return;
+	}
+
 	rcu_read_lock();
 	remote_ip = READ_ONCE(amt->remote_ip);
 	sk = rcu_dereference(amt->sk);
@@ -1356,9 +1398,7 @@ static bool amt_send_membership_update(struct amt_dev *amt,
 {
 	__be32 remote_ip = READ_ONCE(amt->remote_ip);
 	struct amt_header_membership_update *amtmu;
-	struct iphdr *iph;
-	struct flowi4 fl4;
-	struct rtable *rt;
+	union amt_addr remote = {};
 	struct sock *sk;
 	int err;
 
@@ -1367,23 +1407,11 @@ static bool amt_send_membership_update(struct amt_dev *amt,
 		return true;
 
 	err = skb_cow_head(skb, LL_RESERVED_SPACE(amt->dev) + sizeof(*amtmu) +
-			   sizeof(*iph) + sizeof(struct udphdr));
+			   amt_ip_hlen(amt) + sizeof(struct udphdr));
 	if (err)
 		return true;
 
 	skb_reset_inner_headers(skb);
-	memset(&fl4, 0, sizeof(struct flowi4));
-	fl4.flowi4_oif         = amt->stream_dev->ifindex;
-	fl4.daddr              = remote_ip;
-	fl4.saddr              = amt->local_ip;
-	fl4.flowi4_dscp        = inet_dsfield_to_dscp(AMT_TOS);
-	fl4.flowi4_proto       = IPPROTO_UDP;
-	rt = ip_route_output_key(amt->net, &fl4);
-	if (IS_ERR(rt)) {
-		netdev_dbg(amt->dev, "no route to %pI4\n", &remote_ip);
-		return true;
-	}
-
 	amtmu			= skb_push(skb, sizeof(*amtmu));
 	amtmu->version		= 0;
 	amtmu->type		= AMT_MSG_MEMBERSHIP_UPDATE;
@@ -1395,17 +1423,13 @@ static bool amt_send_membership_update(struct amt_dev *amt,
 		skb_set_inner_protocol(skb, htons(ETH_P_IP));
 	else
 		skb_set_inner_protocol(skb, htons(ETH_P_IPV6));
-	udp_tunnel_xmit_skb(rt, sk, skb,
-			    fl4.saddr,
-			    fl4.daddr,
-			    AMT_TOS,
-			    ip4_dst_hoplimit(&rt->dst),
-			    0,
-			    amt->gw_port,
-			    amt->relay_port,
-			    false,
-			    false,
-			    0);
+	if (amt_v6(amt))
+		remote.ip6 = amt->remote_ipv6;
+	else
+		remote.ip4 = remote_ip;
+	if (amt_udp_xmit(amt, sk, skb, &remote, amt->gw_port,
+			 amt->relay_port, inet_dsfield_to_dscp(AMT_TOS), NULL))
+		return true;
 	amt_update_gw_status(amt, AMT_STATUS_SENT_UPDATE, true);
 	return false;
 }
diff --git a/include/net/amt.h b/include/net/amt.h
index eabe6fa7a..be564c710 100644
--- a/include/net/amt.h
+++ b/include/net/amt.h
@@ -390,8 +390,16 @@ struct amt_dev {
 	struct in6_addr		local_ipv6;
 	/* Outer remote ip */
 	__be32			remote_ip;
+	/* Outer remote ipv6 (learned from the v6 Relay Advertisement;
+	 * in6addr_any in v4 mode, mutually exclusive with remote_ip)
+	 */
+	struct in6_addr		remote_ipv6;
 	/* Outer discovery ip */
 	__be32			discovery_ip;
+	/* Outer discovery ipv6 (v6 gateway only; in6addr_any in v4 mode,
+	 * mutually exclusive with discovery_ip)
+	 */
+	struct in6_addr		discovery_ipv6;
 	/* Only used in gateway mode */
 	__be32			nonce;
 	/* Gateway sent request and received query */
