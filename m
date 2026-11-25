Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795634095;
	b=08YyDKqHmAElNiHaPyVwUTcmwQW0ITJ86m6gg0FeScrUg9PdZFstIjn74vPbSwK3oi+n
	 7rx50Hdds+rXGoYQ/3CNeDQBXtfnIio6ppRWB3OajlQFFLcNzRZfNpeIZCNg5xKA5sj4z
	 BeZQ0h7l/wnq38WDKk2ueU4sO395cJnV/oIzTqOYMpBZeSr+LSr+hjJl5mZz3Y3bVi4ms
	 YPja79Cm66071SdDzUcEOvd8INeAVBXp3IKlDyLMK3zBD50H2mD7wH5R124a5rLSLjT4X
	 HYicsK4x0wHhRrU5LmRMdSrccm8sTvxsURFt6plJZvmRV/852wlcWMMC8io+m+xDpsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/u8JtBXWrTUayWu9Ilvo6hMsG+mxMh8x/BdVXPiMsSk=;
	b=Wp8Jdk9r/r9Gxrq7+8Jxu9PpuC209ae48NpSQSouURpIDoWwlczIddEPOzdyON0lFd+O
	 ObiCm0SqUIq6211h6jTcBIyKeyaAuv11XnK4WudaZXzoAn1TNVXxO6D7BiY5VggnhOF3K
	 TdtOYa/AY+ue4I2eVXFFhqt4HxvrOVmkQNN+bpvW5jfi9RVCpnE7XKTdmSZc7/DPC/OJ4
	 a9owGE9Fus+2WGbs/GtsSb7wB9Cb2ikqXTZNgsj1LS1cKimAt36ZzN8NkbJGjIPLqKDjc
	 YWQ+tOKTzzGmOTTMTX6Ih7pABQOqaH5rTtW6e+wB2niEJC5LoTxdWRnyVX/tGbBJg7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=O2aUqdxr;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD3B606A338
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:14:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DD3B606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=O2aUqdxr
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc751eddf25so4023963a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795634093; x=1796238893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/u8JtBXWrTUayWu9Ilvo6hMsG+mxMh8x/BdVXPiMsSk=;
        b=O2aUqdxrWCjg7dDaNkqMKwj5QsKJip9yrAyWbYm1i6328Dt7cKh9pGyObbHSa1MTgu
         OUjc9PiplFLo+3+r3EF+2qr7fnF0CctereiYWoCsaJOOY2WoVj8f2672qHEoXX8IR0aR
         XnvpywPlrIDlW4G2EoMxMLo8kslAPvSsxr9vab0Utc06SkccZXW2It83xdGu2J/4azVB
         Azh0srKy7BVovY8LxDSvnKpTd9lnrMohr48NPssmVDPpeFGnfYWJPqchDfIC5eFEG2tQ
         uR7XAVZFusswf1ukpVOsLo+vpoJ7BGqEz8ug2odaw7KGOqOWGSd6JN2TIIdzqD3r0fVx
         srQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795634093; x=1796238893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/u8JtBXWrTUayWu9Ilvo6hMsG+mxMh8x/BdVXPiMsSk=;
        b=TizFwn7H+kojk+/F9JjGToMlhNNq7e1fSvanfvvExMm0m7Ut61ALV/ScXtrAtclMBO
         zgYAesloC8Fju4K6a1qG2rl3R6ovvNXcIMVRBx7sPA3S87fq7YlhJvBb+tHVEpbXN9LI
         s3Sapf3NOxM0fXegq9fd0iL28r0QUks/B0YfAdn0ytjLsovfQgG5475cKhFqIIz7zg0H
         sYmbq1kP4pb4YxzmAa64lrETSPX3Ha2iAlqeTWtNX95y8e0dy5txGHAthSlA22UEI7MB
         wrJUEg6fhOvjF6AWctfvhzbMnEety3dU20paO6cuhSnT3ZdT+kaZRvcVXtJIYK4oye48
         NZUw==
X-Forwarded-Encrypted: i=1; AL+hErEiFlAuN4BeixfdP9cG2DZ0m57Dm2FagRjjCrC7V4mnZOKhFH72y6RRLu3J35m0iPDbhOu97PYeuyg22LY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bA9Rzdmx4rjldRIb9yQdRcB6zvHurI/Tg6nydfPRSbIS6RRlr
	8yKe4hsubqJ2rKe3BBAEjY5E6rbXegMblu2JPLGZWGBYKWrFi2r44lqu6e28TDOu9PA=
X-Gm-Gg: AZFdTZf51NtWEKX7auAVIOkYihUqavw3xOVYeeJnu2wIJ9XM392MMXGKgGQCxqheVd5
	8RGpfUPBKNFszFZSGMtZT0IXQmMv+x1bMCFV5eoDZutRxrMdqhnYCxd91NwXwrW7lNmDTK7KKOH
	7N0GhEgX8+KN5oHuBzFr2Ldbx2wa9rJhpdXG3X5sMzt5FJpMg/sV5iyo9/WMXk9L6yLN1RsYbzR
	DHDQGkEwF5fwwOihl72eLDktgwA+QBI1oaYG8yAVWT8YslSRbcxlp4w2i9D/6kELA7O8YmrDkc+
	32qkY6thiKGdsZ7vLmRkAypNUeFiJOSEOfwowZEMKcVIzRDtoUFgMeObyjEQJOVz0JvHCo2M6ph
	czHCDJqoBBZkyb9bzTL1uPQonzCs32j4GamfAKg10WXjeHaxHuPo+3xkX9hPAx2kW60B0t6xI7l
	inHM6eG/RxC1ZHnU6xeTiMra594L01jVy6ogsdeBPB0hNgXefRmHn6WJXL8QMfJ79FJPCzXvpmA
	9gGk9/h5dH6YLWt5gFP9jUSBBVGO3KLF4RdqurbromhjX0s0DH8+JBSQwNffcNkfZkAKIb2rVkC
	Z0tn7V3jhC+SdgAaH5qobljnaOOsgSVC8GnK+tpfkIUVhsGZcLSZHifTsmH4DKKLq5mkh+Rd54Y
	AyIRFEc7zDVZ48MFuBKyw01W3iQvJ+5slxEmJXIG6nnJwYSxMzgs=
X-Received: by 2002:a17:903:41c2:b0:2dd:b795:9cb6 with SMTP id d9443c01a7336-2f03f1cfad8mr200173395ad.21.1795634093613;
        Wed, 25 Nov 2026 11:14:53 -0800 (PST)
Received: from devbox.ts.blockcast.net ([69.25.95.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f105b66sm92413855ad.51.2026.11.25.11.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:14:52 -0800 (PST)
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
Subject: [PATCH net-next v2 01/12] amt: create an AF_INET6 encapsulation socket for an IPv6 outer address
Date: Wed, 25 Nov 2026 19:14:39 +0000
Message-ID: <20261125191450.2497936-2-omar@blockcast.net>
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

The amt device binds one AF_INET UDP socket on the relay port, so a
relay and its gateways can only talk AMT over IPv4. RFC 7450 defines
the protocol over either IP version: the Relay Advertisement carries
an IPv4 or an IPv6 relay address, and s5.2 selects the form from the
IP version of the outer header, so an IPv6-only access network needs
an IPv6 outer transport to reach the relay at all.

Add the outer IPv6 local address to struct amt_dev, and amt_v6(),
which reports the device's outer family from it. amt_create_sock()
binds an AF_INET6 socket for an IPv6 device. The socket sends and
verifies the UDP checksum, which RFC 8200 s8.1 makes mandatory over
IPv6, and it is V6ONLY, so that it does not also claim the IPv4
wildcard port, which an IPv4 amt device in the same netns may hold.

The socket is also bound to the underlying link, IFLA_AMT_LINK. The
IPv4 paths pass that link as the output interface, and an IPv4 route
lookup then only uses routes through it. An IPv6 lookup that has a
source address, as every AMT send does, treats the output interface as
a preference unless the socket is bound to a device, so without the
binding the outer IPv6 traffic could leave through another link while
the device's MTU and headroom are derived from this one. The binding
also keeps packets that arrive on other links away from the socket. A
link-local address is unique only on its link, and relay tunnels are
keyed on the gateway's address, so two gateways on different links
with the same link-local address would otherwise share a tunnel, and
the replies would go out the wrong link.

The new socket also hands ICMPv6 errors to amt_err_lookup(). This relies
on amt_parse_type() pulling the AMT header behind the transport header,
as "amt: pull the AMT header behind the transport header in
amt_parse_type()" in net makes it do, since on the error path skb->data
points at the quoted IPv6 header.

Nothing sets local_ipv6 yet. The netlink attribute that does is added
at the end of this series, once every path can use it, so there is no
functional change here.

Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 drivers/net/amt.c | 36 ++++++++++++++++++++++++++++++------
 include/net/amt.h |  2 ++
 2 files changed, 32 insertions(+), 6 deletions(-)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index b145ed3ca..3f3205d2d 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -90,6 +90,14 @@ static struct in6_addr mld2_all_node = MLD2_ALL_NODE_INIT;
 static struct mld2_grec mldv2_zero_grec;
 #endif
 
+/* The outer transport family is fixed when the link is created: an IPv6
+ * local address selects IPv6, otherwise the device runs over IPv4.
+ */
+static bool amt_v6(const struct amt_dev *amt)
+{
+	return IS_ENABLED(CONFIG_IPV6) && !ipv6_addr_any(&amt->local_ipv6);
+}
+
 static void __amt_source_gc_work(void)
 {
 	struct amt_source_node *snode;
@@ -3310,19 +3318,35 @@ static int amt_err_lookup(struct sock *sk, struct sk_buff *skb)
 	return 0;
 }
 
-static struct sock *amt_create_sock(struct net *net, __be16 port)
+static struct sock *amt_create_sock(const struct amt_dev *amt)
 {
 	struct udp_port_cfg udp_conf;
 	struct socket *sock;
 	int err;
 
 	memset(&udp_conf, 0, sizeof(udp_conf));
-	udp_conf.family = AF_INET;
-	udp_conf.local_ip.s_addr = htonl(INADDR_ANY);
+	if (amt_v6(amt)) {
+		/* Bound to :: by the memset, and to the underlying link: a
+		 * bound socket makes every IPv6 route lookup strict about
+		 * the output interface, as the IPv4 lookup is, and receives
+		 * from that link only, where a link-local peer is unique.
+		 * V6ONLY keeps the socket off the IPv4 wildcard, so an IPv4
+		 * amt device can use the same port in the netns. The UDP
+		 * checksum is mandatory over IPv6.
+		 */
+		udp_conf.family = AF_INET6;
+		udp_conf.bind_ifindex = amt->stream_dev->ifindex;
+		udp_conf.use_udp6_tx_checksums = true;
+		udp_conf.use_udp6_rx_checksums = true;
+		udp_conf.ipv6_v6only = true;
+	} else {
+		udp_conf.family = AF_INET;
+		udp_conf.local_ip.s_addr = htonl(INADDR_ANY);
+	}
 
-	udp_conf.local_udp_port = port;
+	udp_conf.local_udp_port = amt->relay_port;
 
-	err = udp_sock_create(net, &udp_conf, &sock);
+	err = udp_sock_create(amt->net, &udp_conf, &sock);
 	if (err < 0)
 		return ERR_PTR(err);
 
@@ -3334,7 +3358,7 @@ static int amt_socket_create(struct amt_dev *amt)
 	struct udp_tunnel_sock_cfg tunnel_cfg;
 	struct sock *sk;
 
-	sk = amt_create_sock(amt->net, amt->relay_port);
+	sk = amt_create_sock(amt);
 	if (IS_ERR(sk))
 		return PTR_ERR(sk);
 
diff --git a/include/net/amt.h b/include/net/amt.h
index 9ba097127..ca35782f8 100644
--- a/include/net/amt.h
+++ b/include/net/amt.h
@@ -361,6 +361,8 @@ struct amt_dev {
 	__be16			gw_port;
 	/* Outer local ip */
 	__be32			local_ip;
+	/* Outer local IPv6 address, :: unless the outer transport is IPv6 */
+	struct in6_addr		local_ipv6;
 	/* Outer remote ip */
 	__be32			remote_ip;
 	/* Outer discovery ip */
-- 
2.47.3

