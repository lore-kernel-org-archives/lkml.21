Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795634103;
	b=mKvHf7qKoORJaxCbyB6CL0Bkwe6T/UWTqptfXZh0FPpx1GVsteFcJ9bdKlg82nvKqftV
	 kZDntLCh8Aun8bmlHwSnfjawBdAd+5jLJTUT0krNhHWTS2YSQ55k7B7IGXoUsUFxq/vaq
	 E7HXvAZmIhXJkQztcYSOV926JT5tbpOCOb1O+l5XVv1d2pjAI3h2MCvCF8tkLAlaPm4o9
	 vAooNeKhm/l5u1jXuWFf+8D7jXKcify/ooNrOg1TCifgG/vJLpwVeEYEJvQtto56lqYik
	 WbF6Ss4TgNWv3hdNK+ySjxaqjtnntW9covsZ5bSUP5eznvtQGaikz05xn5xbwtkaPYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/kfCfRxoDR9WDta98RVoy3Rf/S1yG87X1rZYx8Gyju0=;
	b=cigs1F+4jDw30C9T95CMID+gIKokqS1CbFAdQipbagYcKuR04l3t8BrHPJ9KCZdZHZgN
	 WhKUzVkdoBrIjBaRNbiyosqtzFxGSwu49SYaK4cBJvMFwm8eWlcJffEaoh+WSh67U3fIx
	 9SG7b2IFKvAPVN0fyLczRPu+97EEfdBMoQi7ZiTuoX0gnJ3ubLZYp//EXy9vo+NJrNbtW
	 MxVfIaDORdCJU1mUM1HBmuP+g7VAHBeK2J4QL5y6N4BTajcylPYVHWYNeaIAu0H9MMo2K
	 GAfQhpJumBjwbVJSnhViP1T5MvO6me64ptbSQc41ul+HUl0csXaGS0cw9SJoQALdV4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b="gd/zF5hK";
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7A9606A698
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:15:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF7A9606A698
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=gd/zF5hK
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f0481b35c9so36631405ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795634102; x=1796238902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/kfCfRxoDR9WDta98RVoy3Rf/S1yG87X1rZYx8Gyju0=;
        b=gd/zF5hKEOZEkqzp05KGweQ5uDrrAdFMLD/+u4W9fFTMsgxbiBjPZXf8j5T9TjhdCY
         AHS+4Yfr2VSUi+2CqBcCAk/KEC/12Je0MD4dohgKgTcfPCmfHjMY2k0S6TDhZnGYPv8h
         OwzRzP1mvIXkWwp86kI7ya8UlXnWVXliwPZL2Lgvlf2OJT7CIze3QtJIpvz3Q0Pat63b
         y3I/QHq0E3vkTdwMicfKCV5qlAyo1wsxp9lmzhiAVYHyOueMWMJuecTsb7jjGb9K3MlM
         gNsufFPZ3IRjP3rITXtZ2NIr3RNl6Qyanskxj93T5C1D+KOKNFyBOvdLlRG+wi3tpq6I
         xUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795634102; x=1796238902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/kfCfRxoDR9WDta98RVoy3Rf/S1yG87X1rZYx8Gyju0=;
        b=wTw8nrsFSyCLHbh05ZzeTAYwZI/XyW1vlakgsoYYj6jIwyhhUE+VEbIgOppVpqvWJx
         1sCYVFzcvwgOnF0IEm/K5DbJ2x1p/IcpY4Osz2bXBSrMJpQcRlpqCv82KTfBir8R2rGT
         eErLQA41s9oaGGCiB04jFONx1LhtMPtiFeLvBe0StzUr16xOPEiU0xaoeN2xNB61+DaJ
         NMzP1toj2pEQppNnoeQ0GZzo8dq11e9yBXrLJLXdeY7fmjtfZ3HHZjo4H9IHtsscMjHD
         LgCUkkJL+K6Gblck/u8KU4EgMxpQ4fcH/ITAM4lLZ/GaAcMLDCiZ2naH0aJBKW0pQvxT
         i2UQ==
X-Forwarded-Encrypted: i=1; AL+hErG3ttKxSVDTwQAwX4H3P4i0o7BZRIte5OezoHHe2OuDMpyv78tvVQiDgRCfO/X3vn7AnqmbGRxb7lmSdyw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KiOob6X5buc8e61lPSrwJcsvKkYulN1lPAZ5h/K9dXRpnRa8J
	31I4BRth1JWIubmVMli4M52qdzVdZ14JlqVFkMVL1XPLLOI9gbZtyrrs0XT6xPtpu9Y=
X-Gm-Gg: AZFdTZdxlBt9Nn9hk9na/tt4IrdFFN5LThYd0msg4HkHyTJEKA/Of7vNLnYp6Oi/CgB
	E4uKNX8kHWPOOtmf6m6Tbp8Q3lL3/nieVQnQ7NBkoNfjXp85cMCB9MZbnv5ADAvlotpAbgqoV8R
	JjvYM6fssVeCURyg5MR/cAF5N+R81JM1Fz2ZOQgcQfipieVxwhah8WAU6IsQ0IVQpn8MAOw0Chg
	Fxk/6IMtCOlCka0Jqat1l2lJmUVTiF9KE5XM8NWTIRlLP1V9GAbT+5ZIf1sorBIdCH4e8Y/Z1aE
	6ucA7bc7a9ssrhsbHnyzExRvfu6Av6ehM6vizOao5/Rzjl82u1pV+Tr/494eOYbLPAfy2vEKW4Y
	JbehmKrmelE0ZXcxvi4lNeo7MUbxbgG9dsUtwS7bAwhF46KJkorupa/UXhyrlSRuwE3Cnteycj1
	HOTHN4WVE72Hm4HHWOB1IA/MeO1y3rVKb8p7bddxQ6IOQhwDv553vaZuaf/6BBuICpghbAgT5o3
	MmdvJwYqJ+vZ9EutikFKPdmI+iUAV1/o4vNRsubj1ySyWFFT57iriqnoiapWrYt2AP7QjOd34tE
	pwA29NIchDHM6v12Hc9nbZeyERCz759Z/hpl1j3NhUZQ1eD7rEdGvxZpRHDuGzhJ3E7fMVwVJQZ
	ESZlSZvW4VEsT3o+aqa0N9KI/hsSHKcBwVasScciUbqZ0dmoUC0w=
X-Received: by 2002:a17:902:f708:b0:2ef:fb5c:36d8 with SMTP id d9443c01a7336-2f03f2020f5mr155253215ad.29.1795634102202;
        Wed, 25 Nov 2026 11:15:02 -0800 (PST)
Received: from devbox.ts.blockcast.net ([69.25.95.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f105b66sm92413855ad.51.2026.11.25.11.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:15:01 -0800 (PST)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 07/12] amt: send the AMT gateway control plane over IPv6
Date: Wed, 25 Nov 2026 19:14:45 +0000
Message-ID: <20261125191450.2497936-8-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125191450.2497936-1-omar@blockcast.net>
References: <20261125191450.2497936-1-omar@blockcast.net>
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
index cb2ce552b..6158e13f5 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -791,8 +791,11 @@ static int amt_send_ctrl_v6(struct amt_dev *amt, const struct in6_addr *saddr,
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
@@ -824,10 +827,39 @@ static int amt_send_ctrl_v6(struct amt_dev *amt, const struct in6_addr *saddr,
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
@@ -841,6 +873,11 @@ static void amt_send_discovery(struct amt_dev *amt)
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
@@ -931,6 +968,11 @@ static void amt_send_request(struct amt_dev *amt, bool v6)
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
@@ -1336,9 +1378,7 @@ static bool amt_send_membership_update(struct amt_dev *amt,
 {
 	__be32 remote_ip = READ_ONCE(amt->remote_ip);
 	struct amt_header_membership_update *amtmu;
-	struct iphdr *iph;
-	struct flowi4 fl4;
-	struct rtable *rt;
+	union amt_addr remote = {};
 	struct sock *sk;
 	int err;
 
@@ -1347,23 +1387,11 @@ static bool amt_send_membership_update(struct amt_dev *amt,
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
@@ -1375,17 +1403,13 @@ static bool amt_send_membership_update(struct amt_dev *amt,
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
-- 
2.47.3

