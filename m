Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772842;
	b=17aT9msk9i+mvgzril8BllY913vOFkqe+LrcKi76boHyYgFsuzt/rXUVN7J67i1n/tEE
	 WpMKhmFF/xnpS8LPyFWwYEj6EHF2twBf89FVgLcwx4WaVcqYWyXRn5uB3bmotumz/m4Xo
	 YytT1Rw0StGAtf8rcRZEZH67TysvBzDIZio25McI9+ft9eGd9+cUNEhK8ZRADyUeU24ND
	 rO3K0FYF8vXxILeiQlaih1ogqpoAMUuSLxlcxImXofsPRUgNa8zVv1jKh6qkD3wkF9E7K
	 RxOzgZUbU7vIF8pOPLEOWu7oYLOyVU8M+2tKth9YHfLsElRLQG9XQXnNUzKW5VUx5Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772842;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Xt4vif5wEBYjiEMjkmQrly0mONvLqmpv65KN9zf6N40=;
	b=VLaUDq7kbpgSFx+k1pPhJq49cYuWhpHRQcPV9DrcBUE3yEFe/X4PLNTUE9iDIjXqHaJ2
	 xGyoSZQrgZcHDgMkNY+N/fKTMl7AzvLmOGEUJzHsM+8F/XiCUP1hc5DT8LJW8fMuEVW4J
	 ogPrC00HBdue31GZlUHK40PjO1ftovYDucB2itoI+NLi2dtRQtUgNvcV2X6S6mlG5ZQUR
	 FXlsUf3MGXH0bMppCJxu3zdbfwGByrwQC1mM61p3E9x4xjSZsnEzviCz3JCKxKQJVtN0X
	 SYUzY5or1die5e3KsB7/+RyQ9YyEd5xsOEBUa4NZIYyX+ge2vpxU3omD5miAvjAW/ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=sNup6IZe;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F653606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:47:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F653606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=sNup6IZe
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b59dfe466bso195916c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795772841; x=1796377641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xt4vif5wEBYjiEMjkmQrly0mONvLqmpv65KN9zf6N40=;
        b=sNup6IZewFNdFkdq8TmftC6/uMPNdq1JFJ1GIbu3dRGwkAiMFWkZM819K1qVz1kDmB
         /iA41tts8+sgTf+Cd7P7L1S87xc9Qa5VEASt6ROcZxFu0JAm4AYsZjLX7kAznHCrIXlf
         K373+cKw9LWL96TLtPx3RXm7lt/Xe7UhPTIy2qkfEV3wN9D445+T3UmgIAYAnCdHFQOH
         vNYRheX3NMVPDZC6liJtS/YMYTcRExZM9nfneVBXrcV9YY5cQkSAktKTC0q3Ce2VuDIv
         ScBIr9XQPTRgvs26/gRH85wxYAKTrLgslwex3jcSr3n7xpJMQkSZSUPZ6AY/PYDWkA8a
         9iWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772841; x=1796377641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xt4vif5wEBYjiEMjkmQrly0mONvLqmpv65KN9zf6N40=;
        b=U/dHLUB430U3r/kMVuA3oDGFsCTZd4PJgT38ZfEnGNZvmMuD7oq41/lgxsH4CCIZuT
         ipHVshukfqGebiIt5ydfLSxZ9txrmvNDphr9uMb8ETDNimlbI8wvI3ZgjA6WgB7DA2Ue
         sEAWQtCIR2qmb5zHeroYB1ruJd64dcgOL0axmiIa/zA1FH0O+Z8WpK5N9iJQMvw/piWY
         +y517CA5/Tb6Y+DQdyjZh4NnK1ZIRvO0e5ODPCRs/fyNJG29zsCRsSjoy4jL8u9Ur7kA
         F+AOEXFXG3xf3SGcfSjRUVEqY7sotUqjNdPIS9IDZASYDnP7CdZh/Yo4WgWv956r3D2b
         CBmQ==
X-Forwarded-Encrypted: i=1; AL+hErFES1j4kzTXpfeCixn8cMD9MCbytay0WaIKBLpExOuMu/noZcNFP9I1lNdsUOqcF2JNbF9F+HLQFgggHhA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ry6bAsWYhMwFAxeQbxds33EQk5LGSnbBG3WVWfTpOgTFSbGOp
	NRN61rF9Afy4cbyE3f8CQ96oW5SSDNQmBoE4b7MJxmT5L9VcLA/iAGvuPGccH6G9OVI=
X-Gm-Gg: AZFdTZfrPEZyOG973aPWpOVY6gee7pzi1RniPHx95KkviNjHx16Rkj6Em7ADkor+GEH
	Jy44W6GEWfN5KVWyLKPmlw01Ya16wcyeu8pZWdXZkff3X8edHn0nRlvjLIZnsuMktQbeL5boBRn
	wbJ90eQa6jwitozr9+4InOgHOB20eEolrbfbR8+LYfoxYvbt5uGKG5cknazmfJnaRFZixjM0bqN
	xeNWFTUIWwA1gEQjasnBsOhoICfm/Hkxjy9lfycXhJJ/vw+DitmqVJLp8Am1xsy+C76jPBAcoWg
	BvXqUHM1kNmz0/UCV4h7sP13SRSQS5h0pbqhX6wrOFLKSPq/zqGmF393LCVYkH2OVFZssWcuZiB
	VoTNof58WisckLbT2gC2o2IojtwaDUwkOpyCOI+OldQUvOwbzB/eSVEnH580xL1szz/5sQ07YzQ
	pQfOJZHrMqRVzbcCUdRxlN4IzoCiEmpjqzH7rmW8/iHh+KVyWg8Ux0L7NZnh92rAOQbGvcZdlOi
	srxKP5tjaVayPV4QONkK0tlxx5wPQ7khWjLpjHRVBkq7G6HxhZfFZQm1XC6lM8sIgqgosfQ4upD
	mQHrFlWY2rqZX36STMYvGMsfDSm4bq0s1/OFPLBp+pyypFnax6Jz6NKyULDqm1WKzJ3yBtZN2F0
	B58abe9cLduqEHb/bFLh2xGrIeuY=
X-Received: by 2002:a05:7022:3c04:b0:188:e51:e86a with SMTP id a92af1059eb24-1b5567dd1c8mr19032921c88.2.1795772840714;
        Fri, 27 Nov 2026 01:47:20 -0800 (PST)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm55115194c88.1.2026.11.27.01.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:47:19 -0800 (PST)
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
Subject: [PATCH net-next v3 09/12] amt: add netlink attributes for an IPv6 outer transport
Date: Fri, 27 Nov 2026 09:47:00 +0000
Message-ID: <20261127094703.3025517-10-omar@blockcast.net>
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

Every path of the relay and the gateway can now run over an IPv6 outer
transport, but nothing can create such a device. Add the attributes
that do:

 - IFLA_AMT_LOCAL_IP6, the local IPv6 address. It selects IPv6 as the
   outer transport and is mutually exclusive with IFLA_AMT_LOCAL_IP.
 - IFLA_AMT_DISCOVERY_IP6, the IPv6 address a gateway sends its Relay
   Discovery to. A gateway's discovery address has to be in the family
   of its local address, as both ends of the tunnel use one outer
   transport.
 - IFLA_AMT_REMOTE_IP6, the relay address the gateway learned from the
   IPv6 Relay Advertisement. Like IFLA_AMT_REMOTE_IP it is only
   reported, and the policy rejects it on input.

amt_fill_info() reports the addresses in the device's outer family.
IFLA_AMT_LOCAL_IP6 is refused with -EAFNOSUPPORT on a kernel built
without IPv6, rather than creating an IPv4 device with no local
address. An IPv6 local or discovery address is refused when it is
unspecified, loopback or multicast, as the IPv4 ones are, and also when
it is IPv4-mapped: the V6ONLY socket could never send from or to such
an address, so the device would be created but silently fail every
send.

The existing IFLA_AMT_LOCAL_IP and IFLA_AMT_DISCOVERY_IP cannot simply
carry 16 bytes. Net requires exactly four bytes for them ("amt: require
an exact IPv4-sized IFLA_AMT_{LOCAL,DISCOVERY}_IP"), so the IPv6
addresses need attributes of their own. A kernel that does not know the
new attributes ignores them and fails the request for lack of a local
address, so userspace can tell whether IPv6 is supported. vxlan
(IFLA_VXLAN_LOCAL6, IFLA_VXLAN_GROUP6) and geneve (IFLA_GENEVE_REMOTE6)
add their IPv6 addresses the same way. The attributes are appended to
the enum, so the existing values do not change, and strict_start_type
makes the policy validate them, and any attribute added after them,
strictly. Their policy is an exact 16-byte length.

A relay has always ignored IFLA_AMT_DISCOVERY_IP, and existing users may
pass it, so an IPv4 relay still accepts it. An IPv6 relay has no
existing users, so it rejects a discovery address of either family, and
an IPv4 relay rejects IFLA_AMT_DISCOVERY_IP6.

Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 drivers/net/amt.c        | 164 ++++++++++++++++++++++++++++++---------
 include/uapi/linux/amt.h |  13 ++++
 2 files changed, 141 insertions(+), 36 deletions(-)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index e9d5fb4c3..709b58bd9 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -3951,6 +3951,7 @@ static void amt_link_setup(struct net_device *dev)
 }
 
 static const struct nla_policy amt_policy[IFLA_AMT_MAX + 1] = {
+	[IFLA_AMT_UNSPEC]	= { .strict_start_type = IFLA_AMT_LOCAL_IP6 },
 	[IFLA_AMT_MODE]		= { .type = NLA_U32 },
 	[IFLA_AMT_RELAY_PORT]	= { .type = NLA_U16 },
 	[IFLA_AMT_GATEWAY_PORT]	= { .type = NLA_U16 },
@@ -3959,6 +3960,10 @@ static const struct nla_policy amt_policy[IFLA_AMT_MAX + 1] = {
 	[IFLA_AMT_REMOTE_IP]	= { .len = sizeof_field(struct iphdr, daddr) },
 	[IFLA_AMT_DISCOVERY_IP]	= NLA_POLICY_EXACT_LEN(sizeof(__be32)),
 	[IFLA_AMT_MAX_TUNNELS]	= { .type = NLA_U32 },
+	[IFLA_AMT_LOCAL_IP6]	= NLA_POLICY_EXACT_LEN(sizeof(struct in6_addr)),
+	[IFLA_AMT_DISCOVERY_IP6] =
+		NLA_POLICY_EXACT_LEN(sizeof(struct in6_addr)),
+	[IFLA_AMT_REMOTE_IP6]	= { .type = NLA_REJECT },
 };
 
 static int amt_validate(struct nlattr *tb[], struct nlattr *data[],
@@ -3985,16 +3990,53 @@ static int amt_validate(struct nlattr *tb[], struct nlattr *data[],
 		return -EINVAL;
 	}
 
-	if (!data[IFLA_AMT_LOCAL_IP]) {
-		NL_SET_ERR_MSG_ATTR(extack, data[IFLA_AMT_DISCOVERY_IP],
-				    "Local attribute is required");
+	if (!data[IFLA_AMT_LOCAL_IP] && !data[IFLA_AMT_LOCAL_IP6]) {
+		NL_SET_ERR_MSG_MOD(extack, "Local attribute is required");
 		return -EINVAL;
 	}
 
-	if (!data[IFLA_AMT_DISCOVERY_IP] &&
-	    nla_get_u32(data[IFLA_AMT_MODE]) == AMT_MODE_GATEWAY) {
-		NL_SET_ERR_MSG_ATTR(extack, data[IFLA_AMT_LOCAL_IP],
-				    "Discovery attribute is required");
+	if (data[IFLA_AMT_LOCAL_IP] && data[IFLA_AMT_LOCAL_IP6]) {
+		NL_SET_ERR_MSG_ATTR(extack, data[IFLA_AMT_LOCAL_IP6],
+				    "Local IPv4 and IPv6 are mutually exclusive");
+		return -EINVAL;
+	}
+
+	if (data[IFLA_AMT_LOCAL_IP6] && !IS_ENABLED(CONFIG_IPV6)) {
+		NL_SET_ERR_MSG_ATTR(extack, data[IFLA_AMT_LOCAL_IP6],
+				    "IPv6 support is disabled");
+		return -EAFNOSUPPORT;
+	}
+
+	if (nla_get_u32(data[IFLA_AMT_MODE]) != AMT_MODE_GATEWAY) {
+		struct nlattr *disc = data[IFLA_AMT_DISCOVERY_IP6];
+
+		/* An IPv4 relay has always ignored IFLA_AMT_DISCOVERY_IP,
+		 * and existing users may pass it. An IPv6 relay has no such
+		 * users, so it rejects a discovery address of either family.
+		 */
+		if (!disc && data[IFLA_AMT_LOCAL_IP6])
+			disc = data[IFLA_AMT_DISCOVERY_IP];
+		if (disc) {
+			NL_SET_ERR_MSG_ATTR(extack, disc,
+					    "Discovery is only valid in gateway mode");
+			return -EINVAL;
+		}
+		return 0;
+	}
+
+	/* A gateway's discovery address is in the family of its local
+	 * address, since both ends of the tunnel use one outer transport.
+	 */
+	if (data[IFLA_AMT_LOCAL_IP6] ? !data[IFLA_AMT_DISCOVERY_IP6] :
+				       !data[IFLA_AMT_DISCOVERY_IP]) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "Discovery attribute of the local family is required");
+		return -EINVAL;
+	}
+
+	if (data[IFLA_AMT_DISCOVERY_IP] && data[IFLA_AMT_DISCOVERY_IP6]) {
+		NL_SET_ERR_MSG_ATTR(extack, data[IFLA_AMT_DISCOVERY_IP6],
+				    "Discovery IPv4 and IPv6 are mutually exclusive");
 		return -EINVAL;
 	}
 
@@ -4045,13 +4087,25 @@ static int amt_newlink(struct net_device *dev,
 		goto err;
 	}
 
-	amt->local_ip = nla_get_in_addr(data[IFLA_AMT_LOCAL_IP]);
-	if (ipv4_is_loopback(amt->local_ip) ||
-	    ipv4_is_zeronet(amt->local_ip) ||
-	    ipv4_is_multicast(amt->local_ip)) {
-		NL_SET_ERR_MSG_ATTR(extack, tb[IFLA_AMT_LOCAL_IP],
-				    "Invalid Local address");
-		goto err;
+	if (data[IFLA_AMT_LOCAL_IP6]) {
+		amt->local_ipv6 = nla_get_in6_addr(data[IFLA_AMT_LOCAL_IP6]);
+		if (ipv6_addr_loopback(&amt->local_ipv6) ||
+		    ipv6_addr_any(&amt->local_ipv6) ||
+		    ipv6_addr_is_multicast(&amt->local_ipv6) ||
+		    ipv6_addr_v4mapped(&amt->local_ipv6)) {
+			NL_SET_ERR_MSG_ATTR(extack, data[IFLA_AMT_LOCAL_IP6],
+					    "Invalid Local IPv6 address");
+			goto err;
+		}
+	} else {
+		amt->local_ip = nla_get_in_addr(data[IFLA_AMT_LOCAL_IP]);
+		if (ipv4_is_loopback(amt->local_ip) ||
+		    ipv4_is_zeronet(amt->local_ip) ||
+		    ipv4_is_multicast(amt->local_ip)) {
+			NL_SET_ERR_MSG_ATTR(extack, tb[IFLA_AMT_LOCAL_IP],
+					    "Invalid Local address");
+			goto err;
+		}
 	}
 
 	amt->relay_port = nla_get_be16_default(data[IFLA_AMT_RELAY_PORT],
@@ -4074,24 +4128,35 @@ static int amt_newlink(struct net_device *dev,
 		dev->max_mtu = dev->mtu;
 		dev->min_mtu = ETH_MIN_MTU + amt_hlen(amt);
 	} else {
-		if (!data[IFLA_AMT_DISCOVERY_IP]) {
-			NL_SET_ERR_MSG_ATTR(extack, tb[IFLA_AMT_DISCOVERY_IP],
-					    "discovery must be set in gateway mode");
-			goto err;
-		}
 		if (!amt->gw_port) {
 			NL_SET_ERR_MSG_ATTR(extack, tb[IFLA_AMT_DISCOVERY_IP],
 					    "gateway port must not be 0");
 			goto err;
 		}
-		WRITE_ONCE(amt->remote_ip, 0);
-		amt->discovery_ip = nla_get_in_addr(data[IFLA_AMT_DISCOVERY_IP]);
-		if (ipv4_is_loopback(amt->discovery_ip) ||
-		    ipv4_is_zeronet(amt->discovery_ip) ||
-		    ipv4_is_multicast(amt->discovery_ip)) {
-			NL_SET_ERR_MSG_ATTR(extack, tb[IFLA_AMT_DISCOVERY_IP],
-					    "discovery must be unicast");
-			goto err;
+		if (data[IFLA_AMT_DISCOVERY_IP6]) {
+			struct nlattr *attr = data[IFLA_AMT_DISCOVERY_IP6];
+
+			amt->discovery_ipv6 = nla_get_in6_addr(attr);
+			if (ipv6_addr_loopback(&amt->discovery_ipv6) ||
+			    ipv6_addr_any(&amt->discovery_ipv6) ||
+			    ipv6_addr_is_multicast(&amt->discovery_ipv6) ||
+			    ipv6_addr_v4mapped(&amt->discovery_ipv6)) {
+				NL_SET_ERR_MSG_ATTR(extack, attr,
+						    "discovery must be unicast");
+				goto err;
+			}
+		} else {
+			WRITE_ONCE(amt->remote_ip, 0);
+			amt->discovery_ip =
+				nla_get_in_addr(data[IFLA_AMT_DISCOVERY_IP]);
+			if (ipv4_is_loopback(amt->discovery_ip) ||
+			    ipv4_is_zeronet(amt->discovery_ip) ||
+			    ipv4_is_multicast(amt->discovery_ip)) {
+				NL_SET_ERR_MSG_ATTR(extack,
+						    tb[IFLA_AMT_DISCOVERY_IP],
+						    "discovery must be unicast");
+				goto err;
+			}
 		}
 
 		dev->needed_headroom = amt->stream_dev->needed_headroom +
@@ -4145,7 +4210,28 @@ static size_t amt_get_size(const struct net_device *dev)
 	       nla_total_size(sizeof(__u32)) + /* IFLA_MAX_TUNNELS */
 	       nla_total_size(sizeof(__be32)) + /* IFLA_AMT_DISCOVERY_IP */
 	       nla_total_size(sizeof(__be32)) + /* IFLA_AMT_REMOTE_IP */
-	       nla_total_size(sizeof(__be32)); /* IFLA_AMT_LOCAL_IP */
+	       nla_total_size(sizeof(__be32)) + /* IFLA_AMT_LOCAL_IP */
+	       /* IFLA_AMT_{LOCAL,DISCOVERY,REMOTE}_IP6. Only one address of
+		* each IPv4/IPv6 pair is emitted, but this sizes for both.
+		*/
+	       3 * nla_total_size(sizeof(struct in6_addr));
+}
+
+/* The IPv6 addresses of an IPv6 device, one of each IPv4/IPv6 pair. */
+static int amt_fill_addr6(struct sk_buff *skb, const struct amt_dev *amt)
+{
+	struct in6_addr remote6;
+
+	if (nla_put_in6_addr(skb, IFLA_AMT_LOCAL_IP6, &amt->local_ipv6))
+		return -EMSGSIZE;
+	if (amt->mode == AMT_MODE_GATEWAY &&
+	    nla_put_in6_addr(skb, IFLA_AMT_DISCOVERY_IP6, &amt->discovery_ipv6))
+		return -EMSGSIZE;
+	amt_get_remote_ipv6(amt, &remote6);
+	if (!ipv6_addr_any(&remote6) &&
+	    nla_put_in6_addr(skb, IFLA_AMT_REMOTE_IP6, &remote6))
+		return -EMSGSIZE;
+	return 0;
 }
 
 static int amt_fill_info(struct sk_buff *skb, const struct net_device *dev)
@@ -4162,15 +4248,21 @@ static int amt_fill_info(struct sk_buff *skb, const struct net_device *dev)
 		goto nla_put_failure;
 	if (nla_put_u32(skb, IFLA_AMT_LINK, amt->stream_dev->ifindex))
 		goto nla_put_failure;
-	if (nla_put_in_addr(skb, IFLA_AMT_LOCAL_IP, amt->local_ip))
-		goto nla_put_failure;
-	if (nla_put_in_addr(skb, IFLA_AMT_DISCOVERY_IP, amt->discovery_ip))
-		goto nla_put_failure;
-
-	remote_ip = READ_ONCE(amt->remote_ip);
-	if (remote_ip)
-		if (nla_put_in_addr(skb, IFLA_AMT_REMOTE_IP, remote_ip))
+	if (amt_v6(amt)) {
+		if (amt_fill_addr6(skb, amt))
 			goto nla_put_failure;
+	} else {
+		if (nla_put_in_addr(skb, IFLA_AMT_LOCAL_IP, amt->local_ip))
+			goto nla_put_failure;
+		if (nla_put_in_addr(skb, IFLA_AMT_DISCOVERY_IP,
+				    amt->discovery_ip))
+			goto nla_put_failure;
+
+		remote_ip = READ_ONCE(amt->remote_ip);
+		if (remote_ip)
+			if (nla_put_in_addr(skb, IFLA_AMT_REMOTE_IP, remote_ip))
+				goto nla_put_failure;
+	}
 	if (nla_put_u32(skb, IFLA_AMT_MAX_TUNNELS, amt->max_tunnels))
 		goto nla_put_failure;
 
diff --git a/include/uapi/linux/amt.h b/include/uapi/linux/amt.h
index 2dccff417..5290ece75 100644
--- a/include/uapi/linux/amt.h
+++ b/include/uapi/linux/amt.h
@@ -54,6 +54,19 @@ enum {
 	IFLA_AMT_DISCOVERY_IP,
 	/* This attribute specify number of maximum tunnel. */
 	IFLA_AMT_MAX_TUNNELS,
+	/* This attribute specifies the local IPv6 address. It selects IPv6
+	 * as the outer transport and excludes IFLA_AMT_LOCAL_IP.
+	 */
+	IFLA_AMT_LOCAL_IP6,
+	/* This attribute specifies the IPv6 address of the relay a gateway
+	 * sends its Discovery to. It is the IPv6 form of
+	 * IFLA_AMT_DISCOVERY_IP and needs IFLA_AMT_LOCAL_IP6.
+	 */
+	IFLA_AMT_DISCOVERY_IP6,
+	/* This attribute reports the IPv6 relay address a gateway learned
+	 * from the Relay Advertisement. It is read-only.
+	 */
+	IFLA_AMT_REMOTE_IP6,
 	__IFLA_AMT_MAX,
 };
 
