Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795205206;
	b=kFrufG9MUeGbyGBm7tEZU+F04JG1pN87TJrvpcUdqttPSR8SMsWHHPmOCpDKlXx/AuP+
	 hSHXGRgbuJ1FziVjdNwYlupQyOSgT19rAnZHCPksPaL4aemC5HvIV+tSgcj9pbIt26hwf
	 jvoQZHfv65pzKDV23Daf7kNfa68EbJbLew0P5WxYJckIqs1tUUKfPfi6mawvqUFSMfmPR
	 P/ggRjaGak/GPmNEumXOmRpSHB9fBasQ83GxdDURI2lFMd1u7s86CnLiyBP/Q2r6tPpQC
	 FzUz9e5R3z2s730HCYKnqnIYKE0xSbGCDdBF4W4nMEDNYUmFF3qvtMJl8Na/WHsQ2sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795205206;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fTxgEaVxhHmOUdcDyX7j7Sl4kwlnSnl/hIzR6hvUe9I=;
	b=t3A8CfwzOPRWgbRw8A24JZteLxijQgGvufHLPdpblxZSnV/lT/aeLMKQf7HO0zMDih0G
	 9qSYE6u3x3i+wNdHNt+YtZSdGPbmgxExZ7MPmkjgPYl+eqgReIeJNigaLZ0VNS00Husrf
	 BsseYn80mMdXg8xwFtNWRUW9Abv/36DKTz2pSCmRVsYZc8veMrawQqZ9UWrQ227deLOEh
	 AoPMa9yOTQQqVE4RdklH7SgHUaFKxp3V49MtxJuTG88oA9kMgKFy45pQaxI1QqAG2kh6b
	 Po7y088XNrhd9sZy5DcqvDWayYq2ZYcQpC6v/TNkGHlHiZdmaKdOEG0arVbO4H4bd5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=hzazFVuU;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF93B606A6EC
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:06:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF93B606A6EC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=hzazFVuU
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8b67f25e6e1so745406b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1795205199; x=1795809999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fTxgEaVxhHmOUdcDyX7j7Sl4kwlnSnl/hIzR6hvUe9I=;
        b=hzazFVuUW2ei9PcEpujkv5wFeDOuV6h0rny+t4LX2agLpFkOoNaDPcLbMJq0mb10gv
         KdEip3lIhQQurO55QUVFWIdrqjxp+IfzNemVEjWLPCnBbFXVxqVR/IT+Mkzhpj7CykId
         r38jbjXQfKPfC0LvAAtcaTbfQuhiQww1kEKxXCcBA55qT4u3272/R9OEAxKKQF7R8KiF
         SQEqKZcwU8aC2ZdUZmoct0e/9sh1Z9CDXGVtJXqzf+dAK+5z3W7pzJrgcBVaU9YCk8YN
         oMhiA3whflYXCDAy7BGHBAhXwzreOE4C/EwQrb0Ugj99QYhfHzY73r6PhzhRZ2VV3adJ
         8Z/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795205199; x=1795809999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fTxgEaVxhHmOUdcDyX7j7Sl4kwlnSnl/hIzR6hvUe9I=;
        b=ld7bcC8Y4urthi332X93UZ/GL/q+sZtOAMeW1TEp3dG6U7dXMThvC2b3+XitiqeMnY
         jg+AfhdrwmBFZNIuRezVcCKTjMK5RDzjom+rcjBhIHC2cQjNhQcT03O7DGnRkQDF4qlv
         m5Sq+fu2WqHdcmlklRTIi9MaL5xwUx5moUMWWysudTzAUTy28jVtqrYsY4PhGKMvToUJ
         k2uk0d6TIZlXbdqRaLQWsWd5t4vhRbdHiFmuGrvhu6TUn1dJUPFTnsd9aL00oF/LkvWp
         FfGiuJzw3fEDa/uGQ2iAMZusmo7dXThooKX4j49M06xY4IiVPnuuZ/PSaH7apwe6Ya5t
         eEDg==
X-Forwarded-Encrypted: i=1; AL+hErGWMYdY6kQvDeXjGlRyBqnSOqxs+bNe19GdI9FQ9M+0T64am72xxE9xE+jSSEOJ4CglLr2GiWyn27I/MKQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fBYVNnYNgxXN05BEzP/1KrjcmaAcJe2X1PsHo08lfYYhnYpni
	+pODuSF0qOZmhFQpxmf0TrXxfLrU1gvwl3YrUcWJXmqnUxtKYHYABulYUfIWboznG9I=
X-Gm-Gg: AYBFou2zNhzPOidGINjRpPx4UxUiGXoCeHzE+V2zGZNzBr8E1NrV+8PF+zqE4DhdRs4
	2CwGoauUALj1M0yPyOpjz5gm7JaYasuRwu36Xb32IXAfVEmX9Oc2o89YkNMMGvIjzfpcdsea8CX
	8T5gQvxs9k/6VLa51qL29zsgIl3y0uhy2gcAl9PstD2ehjfTQ5QklMYOdtJlfQwT9jDS+9In8Pg
	cyCVal+qrfWnjALwfYB3j6HtjzZ0Pv13asYtP/tBkN50zYuV41LnosNkVrBmxnkB5vv09HYC3XI
	ndvXJo7Xsb0S9w1TyNKGeOOC1KzpY9HZbozgK0t8f/iRyEsBr2GTN+aIOIftbFAyUEhn2woPoUV
	zScCgOhB86JZa4bbnDlxxkBpjGg1xe602ZVtFvOPih5aveWYkq0lp/Fx1TIojiZMv8GW8T4rIvp
	9+4Rqc2lsF2/JcXtQPKy51wiRD/3gxjxEA4uypQNRfcykdTioYRQ1Lk7Lu366xBeMtEPmQqSeXc
	7EZWuS03U8A8I+MeTjaLPywH84IWX3BW1VFgrGiu2pnulkDmT7bBDZjKcMZb7Dpy5pEn3WxlmeP
	9wn2GRqFd6h+el+rI4WiozN2uSe7pyl8Oorl73I846FNL9nwdhW0lB+QEKYTF4NT6X/f
X-Received: by 2002:a05:6a20:9149:b0:3e8:ef7a:36 with SMTP id adf61e73a8af0-4014d4587d1mr4534291637.31.1795205199065;
        Fri, 20 Nov 2026 12:06:39 -0800 (PST)
Received: from phoenix.lan (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d028a54sm1619282a12.18.2026.11.20.12.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:06:38 -0800 (PST)
From: Stephen Hemminger <stephen@networkplumber.org>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	Stephen Hemminger <stephen@networkplumber.org>,
	Yuen Su <zypulsecore@gmail.com>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [RFC next-net 1/3] net: accept legacy nexthop attributes when deleting by nexthop id
Date: Fri, 20 Nov 2026 12:01:28 -0800
Message-ID: <20261120200635.95798-2-stephen@networkplumber.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120200635.95798-1-stephen@networkplumber.org>
References: <20261120200635.95798-1-stephen@networkplumber.org>
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

A route dump expands a nexthop object into the legacy attributes as well
when nexthop_compat_mode is on, which is the default. Both delete paths
then reject the result as "Nexthop specification and nexthop id are
mutually exclusive", so the kernel refuses its own dump output.

That breaks "ip route flush", which dumps routes and sends them back as
RTM_DELROUTE:

  # ip nexthop add id 101 via 192.0.2.1 dev dummy0
  # ip route add 203.0.113.0/24 nhid 101
  # ip route show 203.0.113.0/24
  203.0.113.0/24 nhid 101 via 192.0.2.1 dev dummy0
  # ip route flush to 203.0.113.0/24
  Failed to send flush request: Invalid argument

Setting nexthop_compat_mode to 0 drops the legacy attributes and the same
flush works, so the round trip is all that's wrong here. Any client that
deletes a route by echoing a dump hits this, so fix it once in the kernel.

Ignore the legacy attributes on RTM_DELROUTE when RTA_NH_ID is present.
The id is already authoritative in the matching code: fib_nh_match()
decides on cfg->fc_nh_id alone, and ip6_route_del() compares rt->nh->id
and skips the device and gateway tests for nexthop-backed routes.
RTM_NEWROUTE still rejects the combination.

Clear the parsed fields next to the existing exclusivity check rather
than filtering inside the attribute loop. The lwtunnel validation done
there cannot reject a dumped route, because an encap route holds a
reference on its encap module for as long as it exists. IPv6 drops the
attributes in rtm_to_fib6_config() the same way.

A delete passing both an id and a nexthop spec now ignores the spec. The
request can't tell a hand-written gateway from a dump-expanded one, and
the combination is -EINVAL today, so nothing depends on it.

Reported-by: Yuen Su <zypulsecore@gmail.com>
Link: https://lore.kernel.org/netdev/CAC9WPdwmM4=64DH5nY85srnLhRBS7PkjR9vrsALpob-GutbmZw@mail.gmail.com/
Fixes: 493ced1ac47c ("ipv4: Allow routes to use nexthop objects")
Fixes: 5b98324ebe29 ("ipv6: Allow routes to use nexthop objects")
Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
---
 net/ipv4/fib_frontend.c | 17 +++++++++++++++--
 net/ipv6/route.c        | 14 ++++++++++++--
 2 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/net/ipv4/fib_frontend.c b/net/ipv4/fib_frontend.c
index 8c123b111b3d..1d5a42dd35b5 100644
--- a/net/ipv4/fib_frontend.c
+++ b/net/ipv4/fib_frontend.c
@@ -869,8 +869,21 @@ static int rtm_to_fib_config(struct net *net, struct sk_buff *skb,
 	}
 
 	if (cfg->fc_nh_id) {
-		if (cfg->fc_oif || cfg->fc_gw_family ||
-		    cfg->fc_encap || cfg->fc_mp) {
+		if (nlh->nlmsg_type == RTM_DELROUTE) {
+			/* A dump of a route using a nexthop object expands
+			 * that nexthop into the legacy attributes too. Ignore
+			 * those here so the dump can be fed back as-is; the id
+			 * identifies the nexthop on its own.
+			 */
+			cfg->fc_oif = 0;
+			cfg->fc_gw_family = 0;
+			memset(&cfg->fc_gw6, 0, sizeof(cfg->fc_gw6));
+			cfg->fc_encap = NULL;
+			cfg->fc_encap_type = LWTUNNEL_ENCAP_NONE;
+			cfg->fc_mp = NULL;
+			cfg->fc_mp_len = 0;
+		} else if (cfg->fc_oif || cfg->fc_gw_family ||
+			   cfg->fc_encap || cfg->fc_mp) {
 			NL_SET_ERR_MSG(extack,
 				       "Nexthop specification and nexthop id are mutually exclusive");
 			err = -EINVAL;
diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index 4a4c5ace63c5..7467ef5d5f1d 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -5258,8 +5258,18 @@ static int rtm_to_fib6_config(struct sk_buff *skb, struct nlmsghdr *nlh,
 	cfg->fc_flags |= (rtm->rtm_flags & RTNH_F_ONLINK);
 
 	if (tb[RTA_NH_ID]) {
-		if (tb[RTA_GATEWAY]   || tb[RTA_OIF] ||
-		    tb[RTA_MULTIPATH] || tb[RTA_ENCAP]) {
+		/* A dump expands the nexthop object into the legacy
+		 * attributes too. Ignore those on delete so the dump can be
+		 * fed back as-is; the id identifies the nexthop on its own.
+		 */
+		if (!newroute) {
+			tb[RTA_GATEWAY] = NULL;
+			tb[RTA_OIF] = NULL;
+			tb[RTA_MULTIPATH] = NULL;
+			tb[RTA_ENCAP] = NULL;
+			tb[RTA_ENCAP_TYPE] = NULL;
+		} else if (tb[RTA_GATEWAY] || tb[RTA_OIF] ||
+			   tb[RTA_MULTIPATH] || tb[RTA_ENCAP]) {
 			NL_SET_ERR_MSG(extack,
 				       "Nexthop specification and nexthop id are mutually exclusive");
 			goto errout;
-- 
2.53.0

