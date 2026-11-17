Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794953745;
	b=1N7apc++xGlGfeDfTtqKlZU5THwnmpOITWeV6i2udAKxMab2gdhGIuOeT1gUpJ6IkayT
	 HZSqbqo4r04iaDmp+ThEVEmNw2AGEgORJj5vFiBQba0s4y9CeKrPBDI8bt2nUZam07sCm
	 WwQx+hxnjX/1BRcGj1gvAzQdb8Ai2jCIgbdPZdZtlBGbI2y14UUu8UpDGIur+4Aalo/0S
	 R0X/Me8VCyDhUL0EFyLh7DdPBMZoVDafHVNQITmUbM4AJLjsN8WFpZu0SSs8D5i3f+Bxs
	 0v8ed4+DEFk4CzUnwm7E/5riV0hlIxjLtx65n4oaKdm/TcCZtXBfpn5O54jPfTYb3Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794953745;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Rcb9VySxJjHdGQ79AoyQc2byoEyKFLaM8e6F4Ddmmw8=;
	b=Gaurz+niVM2l3ZTCYYg2R1UDdM0qOd4z0I0thml/OAmntIm5pBs2Sj5++gzZofkY1O5F
	 30zi4zpoCLLVL/8YrfgNZe/Dqnx25TfBjx/sGZGXt3RNuBkyTIvOK/3av3DoB/f5KNni2
	 k9uytuHCV8eKikmEmf19L1KfotYLTgWt+OvFbhg2XXZ+Fzo2Ih+6W0K0uSiMkC6ejBpDU
	 GKrX3M3bbHS2HdNF3cQwOOrvygWHMXayWIcfORMBNW4APakWuEqq8+0A2jZoElkHrbTjZ
	 A/hrLgMMX4UzyYycPS1BdXaVsImgxrJauMD3yx5+EVc28gS4GulTKUuLt5zYnQ27qvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="F67/IN87";
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7B3606A33B
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:15:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C7B3606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=F67/IN87
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b08a162d4bso133842a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1794953744; x=1795558544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rcb9VySxJjHdGQ79AoyQc2byoEyKFLaM8e6F4Ddmmw8=;
        b=F67/IN877WOVwmfIez9VsF2w/xb1Uelpmte0J1tRiaRjODzEhj1dkiuHFPpcDARlt5
         Jfai4qps8OsgdUVNpxn6gYSpnAI6e9hcyMsR10hOoteYvBPLFNj0dA3Hy+dy7hozPctb
         dpaG38QGEV80QSzWp7eYvxgR1kE7z+hdhHYCWJhxgRKvOSIesczvLWMMcdoh2tE/21bI
         1RUYCRSag/ypoOqmClAXqwMN1H/RybLCD84LYbsdJsE8O6+DwSw7R+F5fhQ3tt5CmR+T
         kEXEck0wFQv/HgBrD43d+WB8dR8yw7Vc6IkHZuhqAVIaTqWiH2nE3CZwe3ilVqJRjmOh
         vCKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794953744; x=1795558544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rcb9VySxJjHdGQ79AoyQc2byoEyKFLaM8e6F4Ddmmw8=;
        b=1bYof0nFpzrSqjvuTsjj2vB1HinWXsE1/YP3f2tiFQUgrFpab5mQy0T8kA4ck/xj6n
         xgcVcUNlSXeaOS6bph8dOvpV+dyBh07DkigOmcWngLb7C13VZ1y+iqX0auGnauFNIoel
         oOgeBhr4UkFyiBbZIbnNQeeBR+N8cFWDluJdoz0r7M0vg8bCCi3MsFYI8pgLTYiFWc4S
         mT6hMr2fBcg0T++N32RfTpVIRZE1wNdbtmfLoMCydvsSCW2M+TFZbiBL2/u9PYtm7EUx
         Fh+IuZwdmITGuEu2A0ucpiVSfXJ64ZWCwpRlQdsMER5PqSeBQnNu9EKkS0Q3MCl3/oZj
         4oJA==
X-Forwarded-Encrypted: i=1; AL+hErG7UHa/YzwXxvLKk0+eGlJm+pogWMNn1XZj0UBB86p1sJTxsBjddfNK3TdTmkMicHqVLhyE5nK54Dq1ETc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+A/aNGnSEn765BrvcynMzOCi7G8c8SNn6kgQtszZ8qtMAnZfjI
	GP+hoTgZupfnYLJOsM5gxa3KdFCwIV9N7ENgNZ54QN6qbI3Y0FzYZrG4eVAQnOHWeb8=
X-Gm-Gg: AZFdTZc3em74FExhB2f0zy/wsh612DgqVoPEMEJ7koUku0fxoEZx5mBDEBWGWkzBSNJ
	aozrl7L3ohA292Tjr4SLIvdcN+9GQNiowS2KoprEyTfYEO4sq/gkxxJsuPtyfF+w2/prGBfRh8B
	trf6jQWXdDJd2pWTTVQB5xtVdlmk1dyToo4raB2dWVQ1ErVg5LZKE9/DAGfQdJOoja4W/noRmFz
	msvTnqUSh2bPDB24ODxOeaCbvrVRQuavmGSR1ju8sRqelZAeUVaXdHd62t8LERIv2+/pjW5zMeI
	AXRgPWkojYdoBI6Nekk+9YirjJm2VruFrwdIyizd8LY9yV9N473aCEahkP0m0EgAKR+B7xSI6Mh
	J6m5yuHLDyUe509cY9EfrjTpOYH2Ht++6ZXQhymZt8LkiwOqZacazuUiSgA0RV6RDVEF43ZF5RI
	p2R8OTOaRLaMP547BVe9BEfTl58nIQSVXlfpheBRAVH/R6Op01J4k39PU/UoXts4YEdQygC0PeD
	XONFX0X1B91ZZQsvIkVQfJWPVvpfOrlUTQSCb91HMJeovjOKbYU38LQnCGFOoUHbzRmlBV/W5SY
	It+o3zb17Q+klzsIR8uoIuDvaZjYNL+VyWRRcxxGHj2CwAXjIm6Hr/UMvMACyd5ECtyz
X-Received: by 2002:a17:90b:4d84:b0:3ab:1481:69e5 with SMTP id 98e67ed59e1d1-3b3d074d047mr804488a91.11.1794953744455;
        Tue, 17 Nov 2026 14:15:44 -0800 (PST)
Received: from phoenix.lan (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d5570208sm38067a91.0.2026.11.17.14.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 14:15:44 -0800 (PST)
From: Stephen Hemminger <stephen@networkplumber.org>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	Stephen Hemminger <stephen@networkplumber.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net-next v3 2/3] ipv6: return EMSGSIZE when first route in dump does not fit
Date: Tue, 17 Nov 2026 14:13:43 -0800
Message-ID: <20261117221538.184948-3-stephen@networkplumber.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117221538.184948-1-stephen@networkplumber.org>
References: <20261117221538.184948-1-stephen@networkplumber.org>
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

If a route does not fit in an empty dump skb, fib6_dump_node()
suspends the walker and inet6_dump_fib() returns 1.
rtnl_dumpit() then returns skb->len, which is 0, and the dump ends
with NLMSG_DONE and status 0, silently dropping the route and those after it.

This became reachable when multipath routes started being dumped as a
single message with an RTA_MULTIPATH attribute; a wide enough route no
longer fits.

Return -EMSGSIZE in this case, as IPv4 does. This depends on the
rtnl_dumpit() fix in the previous patch.

Fixes: beb1afac518d ("net: ipv6: Add support to dump multipath routes via RTA_MULTIPATH attribute")
Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
Reviewed-by: Ido Schimmel <idosch@nvidia.com>
---
 net/ipv6/ip6_fib.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/ipv6/ip6_fib.c b/net/ipv6/ip6_fib.c
index e1d49897d6ab..3b78ae72d367 100644
--- a/net/ipv6/ip6_fib.c
+++ b/net/ipv6/ip6_fib.c
@@ -755,6 +755,10 @@ static int inet6_dump_fib(struct sk_buff *skb, struct netlink_callback *cb)
 
 unlock:
 	rcu_read_unlock();
+
+	/* If stopped before adding, it was because next route too large for skb */
+	if (err > 0 && !skb->len)
+		err = -EMSGSIZE;
 	if (err <= 0)
 		fib6_dump_end(cb);
 	return err;
-- 
2.53.0

