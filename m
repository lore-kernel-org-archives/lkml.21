Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772830;
	b=ef7V6zkMp5C3JCjUe3uBn/PlBO8JEZxQClga2Xl5mfsW20osDSswyWCO6MNIdMhX7oB9
	 6dvZB1I8iArMi8AjDrkPGglaCbc952KF3+OITzsyYKgYgE4Eq7Rt6MKfE3boB+Wb7jRIe
	 CCFNZudji5WzXjvIFkAofmTK5lM0y9sWyEtHbbLiCfqzgNn62J9PKVN6N+rRgICqdmeur
	 9LJTgjN1dN/kdfWLcheNg7VqtEADnZwAa2IQqQIoy9jukKS6HPM/S7lX9aqJh9uLTQ7Um
	 lZvc5cPZfT0TsSb0QsvsO0E0dXL5PNVMdUBvgO4nH9Sanx/T/WuZpP0BHYk/NF0QzRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772830;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rLsQ/GlDzGOb8CaVAi+lRi51pZAWGSStX7fuTRtzazk=;
	b=ijSt3TSdJcXlXJ4I91N9SUod3c8EKLSMNt8AMWWPd7m0NvaL+GMVaCuMzweFTlXZg13X
	 AXa6TVrafstMtR03thli7+CDTQsU853SI8MmLHxxqJKLX4yh8lY7H1tT7Y84QLRw3XP/1
	 pBIR5OqNLDO+faobtlIj6wN8Xi+8fS8JsJBByNM0uCpvnGsTNySC9rsSwjo4BZRGWnjnR
	 yzetakm0yBiLfpt75+ggrqPs89RPEWG+EsWl6POtYEdVBz6rNzsxZP68LRdbhXHYTs5Xe
	 AcwQK2RHCceqDrDPiGGYW2tTTvb+S1ydZ1JH+a4TMqPzdMft+xsH0LtEmtgj0XUAz3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=yyW8otla;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1703D606A691
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:47:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1703D606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=yyW8otla
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1b546061d58so18322496c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795772829; x=1796377629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rLsQ/GlDzGOb8CaVAi+lRi51pZAWGSStX7fuTRtzazk=;
        b=yyW8otlanoSMDdVOdb0Pof/Al24Hb7CxppxajEVwGiiwVZmUDhbmTFNaZ64O0T0VNi
         /cyZo2Cfe3Zk22wRzF4iNAXYJNh+yN65h7Te00QKw/AlYiZnhQ4KNsn90gjgsU0mPlPH
         mpgpDwr0orE4qPkuSQdofFP9bljO9N9nOyViIE5F3G4PyWlC2K5CIMO2PuU/3YGYFeU7
         tT6yWQfdytUT8CU+AAe/K2GgJs9FFlmOebSfV78oTDPvVXsijjkpxlIaYWvKeXLPxKiK
         t6KLMDmJGclfX+rWbocH0ESVNdOzidKHrc/S4xH6nlzDyv38mK5/Kg5XD7sfM5rzEeBv
         JWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772829; x=1796377629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rLsQ/GlDzGOb8CaVAi+lRi51pZAWGSStX7fuTRtzazk=;
        b=i1BWaYsfW4Iz1J9EpWWR84l9tiCfd2oOiNc4cVNuKjq/Hki/TytZxlYYb8cBTrrOm9
         rr4vfSTKzx4l5Jjcm5gZbyvrUm1DK1IVjoTYh6XyRbZ88hDbL//lq+9BS8kQniPESBkl
         NHdeA/OGB/g1Sy4oFkOJ1gUvqDJcDuBXvvuUsW9rkvDK4ib6g2e5V6GJWe9IezV8DAdS
         c77C+dN6Lu8vl1jmmzjjXq5DTtSeGGvj3GfNkdKv+nSNMFIiNyxXfSvlEqwEdSnzXLGv
         WG1oF8PK0/982hj/KAviwAgOghW9abSG5v6oShD4FXMTT/QJ3cgVwUfiwUBTsT+wtztT
         Jzww==
X-Forwarded-Encrypted: i=1; AL+hErFVGqZbpxsZpl/MtQF7AEepQtvwPIVhfXnV2mXCBmO7IEvjghoalTkoiSbowvCieYRRlGdZD4CSv+Kogvs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/X82GIU9cViHVr4sK10mRtMtzsMubARn5GtJ999yYKBUaFwIQ0
	AjmCnNnnyyh4EUACEkKXn2KiDZ9I/UmwcOxfx6aKRlBQhwNRgkxavsWyKFGHurdVLHU=
X-Gm-Gg: AZFdTZfb8CCs1fqL7URFGk5Bp1kbFNN/SGjO9aWz6Tw78dcpqEs9LGS73tDfgS0FNWO
	DH/Q6R86PsHYRaJPzK3/R8vO7QHMObJUD1GwUcyPekTbjmizvOXmogEhSMlYPxZ7jLEQqpabzUF
	6rjEOdIE3SrsWQQfFGViSnwsnv4lddOOWrhDWJlxEScNuxQ8fJM9YK8vM/8B5bjQ+/PdmV7Ioyr
	Cma40XKejwmuwh2cC+iSGX5jT7UZ06db7AV7Jk2pSdYQ0Ez2CJ1pvJgXpioB0AsbBYdgi3ndvQg
	sXZpV7lXiutMV4ruhcdIArNJEKu+4MNSUGcNSbrqfVNrgoZNozQwnTBoq8I1Aeku+leJK7oIX5t
	zadEGrh56A59kUlRL5P3qa3vsnlvJ0/1bqQGeeyHW1ujeyj1zDcxydi9Z0iy9kYWRu+nsRurhS0
	GgV2Pp1P80AxzM7yCKGgouq5dzK0Z1OqFkgVjdqEdEULL9Kjm2A+NhdNXZylRseqHdMUvzdEKXf
	sftcyBR1PmJUpDA3sTWEn5c0AdPsi9/eIkp4L8nidmaLnEIkLCxsXazQnXsgbVKGjMS+/WhoYN4
	7iVv5jwlsktMxHYk4qQKjtEx3P9vJgN1/3l08yC9P24fy1K/Rwr/n+JfQFoxZfzXRfUokIAr3ND
	3hKxKjJsBaQaA3qQjaKtf40Yya6o=
X-Received: by 2002:a05:7022:b044:10b0:19b:39f4:88c9 with SMTP id a92af1059eb24-1b5568a12e7mr25971086c88.10.1795772829134;
        Fri, 27 Nov 2026 01:47:09 -0800 (PST)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm55115194c88.1.2026.11.27.01.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:47:08 -0800 (PST)
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
Subject: [PATCH net-next v3 02/12] amt: send the Relay Advertisement over IPv6
Date: Fri, 27 Nov 2026 09:46:53 +0000
Message-ID: <20261127094703.3025517-3-omar@blockcast.net>
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

A gateway finds its relay with a Relay Discovery, and the relay answers
with a Relay Advertisement carrying the address the gateway should use
from then on. RFC 7450 s5.1.2 defines two forms of the Advertisement:
the same fixed header and nonce followed by either a 4-byte IPv4 or a
16-byte IPv6 relay address, and s5.2 selects the form from the IP
version of the outer header rather than from a field in the message.
An amt relay on an IPv6 outer transport therefore has to answer with
the 24-byte IPv6 form.

Add struct amt_header_advertisement_v6 for that form and
amt_send_advertisement_v6(), which fills it on the stack and sends it
with a new amt_send_ctrl_v6() helper. The helper routes with
ip6_dst_lookup_flow() through amt_route6(), which the later IPv6 senders
share, and sends with udp_tunnel6_xmit_skb(), which builds the UDP and
IPv6 headers and fills in the UDP checksum that RFC 8200 s8.1 makes
mandatory over IPv6. Like the IPv4 control messages, it marks the skb
TC_PRIO_CONTROL, uses AMT_TOS as the traffic class and passes no netdev,
so control traffic stays out of the amt device's tunnel stats. Passing
no netdev also means that a drop after the hand-off to IPv6 output, in
netfilter, in neighbour resolution or by the qdisc, is not counted in
tx_errors, whereas the IPv4 senders count an ip_local_out() error; only
a failed route lookup or allocation is counted.

amt_discovery_handler() answers an IPv6 device's Discovery with the
IPv6 form, sent back to the outer source of the Discovery. RFC 7450
s5.1.2 makes the source of the Advertisement the destination of the
Discovery, the Relay Discovery Address, so amt_send_ctrl_v6() and
amt_route6() take the source address from their caller. The socket is
bound to ::, so a Discovery sent to an anycast or secondary address
reaches the relay, and a gateway accepts only an Advertisement whose
source is the address it sent the Discovery to; answering from
local_ipv6 would leave such a gateway stuck in discovery. The relay
address carried in the message stays local_ipv6. The same socket also
receives a Discovery sent to a multicast group the host has joined,
such as ff02::1, and a multicast address may not be a source (RFC 4291
s2.7), so a Discovery with a multicast destination is dropped rather
than answered by every relay on the link with an invalid packet. The
handler copies both outer addresses by value after its last
pskb_may_pull(), and sending does not pull the received skb.

The IPv4 Advertisement has always been sent from local_ip, so an IPv4
gateway that discovers the relay through another of its addresses drops
the reply. That is left as it is: changing the source of an existing
IPv4 relay's replies is a fix of its own for net, and nothing in this
series depends on it.

amt_v6() is still false for every device, so there is no functional
change yet.

Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 drivers/net/amt.c | 115 ++++++++++++++++++++++++++++++++++++++++++++++
 include/net/amt.h |  21 +++++++++
 2 files changed, 136 insertions(+)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index 3f3205d2d..52ccaca08 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -708,6 +708,80 @@ static void __amt_update_relay_status(struct amt_tunnel_list *tunnel,
 	tunnel->status = status;
 }
 
+static struct dst_entry *amt_route6(struct amt_dev *amt, struct sock *sk,
+				    const struct in6_addr *saddr,
+				    const struct in6_addr *daddr,
+				    __be16 sport, __be16 dport)
+{
+	struct flowi6 fl6;
+
+	memset(&fl6, 0, sizeof(fl6));
+	fl6.flowi6_oif		= amt->stream_dev->ifindex;
+	fl6.flowi6_proto	= IPPROTO_UDP;
+	fl6.daddr		= *daddr;
+	fl6.saddr		= *saddr;
+	fl6.fl6_dport		= dport;
+	fl6.fl6_sport		= sport;
+	/* The packet carries AMT_TOS, so route on it too: a policy rule
+	 * that matches the DSCP must see the same value.
+	 */
+	fl6.flowlabel		= ip6_make_flowinfo(AMT_TOS, 0);
+
+	return ip6_dst_lookup_flow(amt->net, sk, &fl6, NULL);
+}
+
+/* Send an AMT control message over the IPv6 outer transport from @saddr.
+ * udp_tunnel6_xmit_skb() adds the UDP and IPv6 headers, including the UDP
+ * checksum that IPv6 requires. Returns 0 once the message is handed to the
+ * IPv6 stack.
+ */
+static int amt_send_ctrl_v6(struct amt_dev *amt, const struct in6_addr *saddr,
+			    const struct in6_addr *daddr,
+			    __be16 sport, __be16 dport,
+			    const void *msg, unsigned int len)
+{
+	struct dst_entry *dst;
+	struct sk_buff *skb;
+	struct sock *sk;
+	int hlen, err;
+
+	rcu_read_lock();
+	sk = rcu_dereference(amt->sk);
+	if (!sk || !netif_running(amt->stream_dev) ||
+	    !netif_running(amt->dev)) {
+		err = -ENETDOWN;
+		goto out;
+	}
+
+	dst = amt_route6(amt, sk, saddr, daddr, sport, dport);
+	if (IS_ERR(dst)) {
+		DEV_STATS_INC(amt->dev, tx_errors);
+		err = PTR_ERR(dst);
+		goto out;
+	}
+
+	hlen = LL_RESERVED_SPACE(amt->dev) + sizeof(struct ipv6hdr) +
+	       sizeof(struct udphdr);
+	skb = netdev_alloc_skb_ip_align(amt->dev, hlen + len +
+					amt->dev->needed_tailroom);
+	if (!skb) {
+		dst_release(dst);
+		DEV_STATS_INC(amt->dev, tx_errors);
+		err = -ENOMEM;
+		goto out;
+	}
+
+	skb_reserve(skb, hlen);
+	skb_put_data(skb, msg, len);
+	skb->priority = TC_PRIO_CONTROL;
+	udp_tunnel6_xmit_skb(dst, sk, skb, NULL, saddr, daddr, AMT_TOS,
+			     ip6_dst_hoplimit(dst), 0, sport, dport, false, 0);
+	err = 0;
+out:
+	rcu_read_unlock();
+	return err;
+}
+
 static void amt_send_discovery(struct amt_dev *amt)
 {
 	struct amt_header_discovery *amtd;
@@ -3010,6 +3084,24 @@ out:
 	rcu_read_unlock();
 }
 
+/* The IPv6 form of amt_send_advertisement(), carrying the relay's IPv6
+ * address. It is sent from @saddr, the address the Discovery was sent to.
+ */
+static void amt_send_advertisement_v6(struct amt_dev *amt, __be32 nonce,
+				      const struct in6_addr *saddr,
+				      const struct in6_addr *daddr,
+				      __be16 dport)
+{
+	struct amt_header_advertisement_v6 amta = {
+		.type	= AMT_MSG_ADVERTISEMENT,
+		.nonce	= nonce,
+		.ip6	= amt->local_ipv6,
+	};
+
+	amt_send_ctrl_v6(amt, saddr, daddr, amt->relay_port, dport,
+			 &amta, sizeof(amta));
+}
+
 static bool amt_discovery_handler(struct amt_dev *amt, struct sk_buff *skb)
 {
 	struct amt_header_discovery *amtd;
@@ -3026,6 +3118,29 @@ static bool amt_discovery_handler(struct amt_dev *amt, struct sk_buff *skb)
 	if (amtd->reserved || amtd->version)
 		return true;
 
+	/* The Advertisement takes the form of the outer IP version, and
+	 * RFC 7450 s5.1.2 sources it from the address the Discovery was
+	 * sent to, which may be an anycast Relay Discovery Address rather
+	 * than local_ipv6.
+	 */
+	if (amt_v6(amt)) {
+		struct in6_addr saddr = ipv6_hdr(skb)->saddr;
+		struct in6_addr daddr = ipv6_hdr(skb)->daddr;
+
+		/* The socket bound to :: also receives a Discovery sent to
+		 * a group, and a multicast address can never be a source
+		 * (RFC 4291 s2.7), so such a Discovery is not answered. Nor
+		 * is one from ::, which has nowhere to be sent.
+		 */
+		if (ipv6_addr_is_multicast(&daddr) ||
+		    ipv6_addr_any(&saddr))
+			return true;
+
+		amt_send_advertisement_v6(amt, amtd->nonce, &daddr, &saddr,
+					  udph->source);
+		return false;
+	}
+
 	amt_send_advertisement(amt, amtd->nonce, iph->saddr, udph->source);
 
 	return false;
diff --git a/include/net/amt.h b/include/net/amt.h
index ca35782f8..52d77bc6b 100644
--- a/include/net/amt.h
+++ b/include/net/amt.h
@@ -133,6 +133,27 @@ struct amt_header_advertisement {
 	__be32	ip4;
 } __packed;
 
+/* The IPv6 form of the Relay Advertisement (RFC 7450 s5.1.2): the same
+ * header and nonce, followed by a 16-byte relay address. s5.2 selects the
+ * form from the IP version of the outer header, not from a field in the
+ * message, so it is a type of its own.
+ */
+struct amt_header_advertisement_v6 {
+#if defined(__LITTLE_ENDIAN_BITFIELD)
+	u32	type:4,
+		version:4,
+		reserved:24;
+#elif defined(__BIG_ENDIAN_BITFIELD)
+	u32	version:4,
+		type:4,
+		reserved:24;
+#else
+#error  "Please fix <asm/byteorder.h>"
+#endif
+	__be32		nonce;
+	struct in6_addr	ip6;
+} __packed;
+
 struct amt_header_request {
 #if defined(__LITTLE_ENDIAN_BITFIELD)
 	u32	type:4,
