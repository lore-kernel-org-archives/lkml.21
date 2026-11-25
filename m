Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795574554;
	b=dVqoPe1ZBp0zNJ7cbWv17EgyZnhHysWVpWocpAvNiDlY8+2IReoQfRMx3tZhyGZz/M3I
	 ENohLvyFW+GiP0WeyLgQsBMUj8sl/qlJTf/tp+lvptYaW3QqV255Wqo9WnmmhCX6nOBOw
	 i7HIQofIL/J+vnnXd9vWg+CRmm5p9Ji2lCgSxujbqh2IK5T9z6ZLf+l51Y4RLNmv+EewY
	 6kYYeDQpO4ksMCkG/dqeecDPHz+NtpgwtMIPLMv0lL/SSdWFdoi/rbgXoavYMdGAx+Vtz
	 xw6F9ey+QHqz7lNqTsazwbyUJPLSRuadlkNovisEEfvGdQcC1AQkjR+QHdYJgLN9JnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795574554;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+vLaUSGVzrenn35n8wMC/NJVDqhs0L2Vc/oVTJI7Ix0=;
	b=tkWj8dYiypglpn8UYzStKK4fQlj9/xCjgoVrbdMQgae2qx8YreWb9/RDyKgbRQeCuS5g
	 2DRb/85nenciFx8aOiE91V2H/H+UOmm7LXIrW/JqCq6/YbfNlk+JAZJ+QFeOurmkhKtks
	 sc8bC8MN5j7u7F46lADeVhlWgSf/Q+bswOz+C26F85YbTBZnpQ2nNRWKPw8nI5Mf/xytK
	 RmDKGjdiiQwFIyy1U1nOW4frJqhtWiuP6cp4HOKc4OO/Ix5+s+h2vCGAEUHUDmtA6MDYP
	 mVD4yAcJvXA1eUq1p0ya/Hs7fB+mMz5wOIomRNPhaoC5vh1UPJw4h/eCtiMbuO6e6XQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wAdERpM2;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BF2606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:42:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08BF2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wAdERpM2
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso2543387a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 18:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795574553; x=1796179353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+vLaUSGVzrenn35n8wMC/NJVDqhs0L2Vc/oVTJI7Ix0=;
        b=wAdERpM2eVBpy6AqMsBIoVQ4UlF4dIeQyQna04l6cWqH7voIF+WVlOC9Fgqxa0gRmr
         uN7Zqrxiy6rRikjmHoiM072ptof345qJR+9HlEiIcGCgBrY5GkS4JSmz1Q52ncumi0X1
         JpYm8CpCqE1at/gBzk/OYNsE8WRTcmDhoxjro8YG3ru045OS8NhQ8YrZbyYhsawRZe5i
         ITjj0JCyfxJYeJ9NmHvuPTMHhIqPOQeSNwjmrXA1YR5iKwZV/eFJO0E24X9SQM6TKRuB
         usp10dKaurz7TlUeJ4eDPVZKhV0zjM3DnBMpZGz/NuBkk3RQsJd24sfd73OlM683MhNW
         9ocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795574553; x=1796179353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+vLaUSGVzrenn35n8wMC/NJVDqhs0L2Vc/oVTJI7Ix0=;
        b=PmjO8pQ5Bg1GKsWg24kvgy/8f1B5P6AAzuSW65E3ZnY1Tp3sUWt1fMwCKyc8DaEOom
         5tz6W0C4RkO/7Wqk+o/XGGjqZ5PZLzd1JRLE1ISv2TYX1apF7zTQfljypNoojTNAREIZ
         XrH9rtpiD5Hw23mfq4ZQQO2A9nDzWTjg131UwZKlivwxQY+sW5K6ZMb8phHddK6l0/Gk
         uj0RD1Ng7e50MSX0w6WfJF2GoT48uKh3lEdFAm59qiMZfzic9JXcNzpCm6xQPK5XY2Gq
         2jJER+GeS/90x/2v9GDhT59kba0gW8zleA+vaY9YVXZCl86sCUfw2DvAn3XpHddps6nM
         RhAg==
X-Forwarded-Encrypted: i=1; AL+hErEnke1vilCI/lzWKHtAqOuFLzT6il8VNVpWPTIsggq4v8E7wuS74itCE+591rw/enF2nNtKPUSrr9D3A0o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tZt75jtwAy9Z6n75444E9uxx1WNhJ4EmdlyRc34NzbDzC0UFU
	H/iqFuvFS3eTODcK08It/B3isGfY6Vck+KsBZQvE66OdNBtCwBBAv1nj
X-Gm-Gg: AZFdTZeLC+ZVYVcYLU8f4Kn+u7YC97GZ19FsM2Jcj3379f5+dZAU/Q6efzU78C+/K5U
	iVFvqEvM4VHOpJ6Ul4JNsUd8hH6I7Nckh2jntoFlcqYPeNN5rveayCjOKsP/lrmJm2Rw9AHfokf
	pYLYBOk0YbkufVu5MjgN+gWcltqM9aiCjUZVxPxnUqajcGhSChoW28Mk3u5Q87Z6Dv7ybASuYBa
	suE4cTrCobDz/DqN6dr9Pn4555FnrvN2tQU65HsA3+3zMgXDr3qU76Hf8DD8fHB65vvfQos+Khj
	1vhHwFtHyw7QAH0dFDF6XnnilfB94PaBykELCwGEsQuP7iGzv2Ia/Jy6GIUbw1C5YaCuefT6mD8
	iL+WWqxllcZCP0NpH4o0CI7BhqByrP0lXM//bsVL7p4MsJ97KqzSTekqwjBs/mY14bUxgZtJlQX
	EbOJ3GwC0C08hGLvAHv1l0v/DbYihVu+Artc38zGT+8Fo7+ZW2esNdF2ADLV7c3RdPUeLkeIzon
	8nZQO5I1AiVnQ12ZbM83H+1PnryPIcj9kk9KeDIExfWrdNgwvTnTXxrEYBr8axYlXaGg4pruTHZ
	wlwtT6MX+svvITUjzekiBFspmmjklaLnp53T29JCN0j8Z9JzA3/F3uEFNf4PQzw49nQ=
X-Received: by 2002:a17:90b:3f43:b0:3ac:7406:b49 with SMTP id 98e67ed59e1d1-3b41c8e0512mr10754930a91.15.1795574553339;
        Tue, 24 Nov 2026 18:42:33 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a33fsm25727086a91.6.2026.11.24.18.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 18:42:32 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Florian Westphal <fw@strlen.de>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Hui Peng <benquike@gmail.com>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH ipsec v2 1/2] xfrm: allow route optimization mode only for DSTOPTS and ROUTING states
Date: Wed, 25 Nov 2026 11:42:27 +0900
Message-ID: <c1901b79c9de8fad23fecb49f1d4ab7ecdf04f57.1795573672.git.kyuwoncho18@gmail.com>
In-Reply-To: <cover.1795573672.git.kyuwoncho18@gmail.com>
References: <cover.1795573672.git.kyuwoncho18@gmail.com>
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

verify_newsa_info() accepts XFRM_MODE_ROUTEOPTIMIZATION with any
protocol. esp6_init_state() accepts any mode and only adjusts
header_len for the ones it knows, so an ESP state in that mode is
created, and the first packet through it hits the WARN_ON_ONCE()s in
xfrm_state_mtu() and xfrm_inner_mode_input(), which assume that route
optimization never comes with ESP:

  WARNING: net/xfrm/xfrm_state.c:3264 at xfrm_state_mtu+0x239/0x3d0
  RIP: 0010:xfrm_state_mtu (net/xfrm/xfrm_state.c:3264)
  Call Trace:
   <TASK>
   xfrm_bundle_create (net/xfrm/xfrm_policy.c:3992 net/xfrm/xfrm_policy.c:2785)
   xfrm_resolve_and_create_bundle (net/xfrm/xfrm_policy.c:2885)
   xfrm_lookup_with_ifid (net/xfrm/xfrm_policy.c:3114 net/xfrm/xfrm_policy.c:3245)
   xfrm_lookup_route (net/xfrm/xfrm_policy.c:3344 net/xfrm/xfrm_policy.c:3355)
   ip6_dst_lookup_flow (net/ipv6/ip6_output.c:1299)
   udpv6_sendmsg (net/ipv6/udp.c:1699)

  WARNING: net/xfrm/xfrm_input.c:449 at xfrm_input+0x2176/0x5f50
  RIP: 0010:xfrm_input (net/xfrm/xfrm_input.c:449 net/xfrm/xfrm_input.c:705)
  Call Trace:
   <IRQ>
   xfrm6_esp_rcv (net/ipv6/xfrm6_protocol.c:119)
   ip6_protocol_deliver_rcu (net/ipv6/ip6_input.c:479)

Accept the mode only for the Mobile IPv6 protocols, as IP-TFS mode is
already limited to ESP.

Fixes: c2d305e51038 ("xfrm: remove input indirection from xfrm_mode")
Fixes: c7b37c769d2a ("xfrm: remove get_mtu indirection from xfrm_type")
Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
---
 net/xfrm/xfrm_user.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/net/xfrm/xfrm_user.c b/net/xfrm/xfrm_user.c
index 217f65faa2bd..c4bbfd638d73 100644
--- a/net/xfrm/xfrm_user.c
+++ b/net/xfrm/xfrm_user.c
@@ -477,9 +477,16 @@ static int verify_newsa_info(struct xfrm_usersa_info *p,
 	switch (p->mode) {
 	case XFRM_MODE_TRANSPORT:
 	case XFRM_MODE_TUNNEL:
-	case XFRM_MODE_ROUTEOPTIMIZATION:
 	case XFRM_MODE_BEET:
 		break;
+	case XFRM_MODE_ROUTEOPTIMIZATION:
+		if (p->id.proto != IPPROTO_DSTOPTS &&
+		    p->id.proto != IPPROTO_ROUTING) {
+			NL_SET_ERR_MSG(extack,
+				       "Route optimization mode requires DSTOPTS or ROUTING");
+			goto out;
+		}
+		break;
 	case XFRM_MODE_IPTFS:
 		if (p->id.proto != IPPROTO_ESP) {
 			NL_SET_ERR_MSG(extack, "IP-TFS mode only supported with ESP");
-- 
2.43.0

