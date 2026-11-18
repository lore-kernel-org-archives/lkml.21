Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794991572;
	b=R3UT0kLoj3svOBqhyAcuucFL146hgaBv6ROYZXzkCm9w+31/1DJIe6gZxLLsQVlMal9W
	 vA90Pym3yC2blgfiGXSHie3uvfvj845VGTcFgUvKQWsJtU7xRmoEQWTmviSNGZaLiN3Dr
	 EAxG7VeBn0w0c0ksSXkMxG0YgjotYCMKMWqUiDbrXqk1IC83tSNe0eiGq7B1ixrnxZYrF
	 SdQTT7QtMj1SHG9ipeSjmqiC3BKRN4D9pgiEehDCatM8RLDGp4oyxNCmR1ZvXH2qQBLIi
	 Q4ODRROCLOP+jLaasA+w6ACxe57fBYrO0IDL4qiHTQa/SIsRuIdJZUOAoFmwLUrmWOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991572;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3QIwNNjbPCMY9vDnX5iy4rnVih4SICdsbjgMj/Fl6DI=;
	b=0Dm12DSmJjhsMsH87v4dSiABOOV6mtpKdbuTVPeEmlxkzSsvEs95FfLkkMW6onSPx5MU
	 mUfYE6OWeTNH+WInvURP/4zobtIux7ve8P50ekkcNJTJZmAfPIKKAPaFptSwLsfSBlkS4
	 lurYxpdRuSFLkvkAhGYthTl84EziEtA5PrPjPotsubjzrxBB2EfDCJsdkb2dTEI+PyIKa
	 0eY+RkKpHFSxJaR07ls8p6Sdku9Fk8SWAtSuy1lTTi9Onq5N26NFo5c2JQAlpr1Lj9NvX
	 331uVG+yMAcjDh7ZrV2Ocd14blLCuYfBtSOm4BGei2JBb+XjmkRkDkNkcKQ9YOrncNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ylwfilqf;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D81606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:46:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6D81606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ylwfilqf
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-14394530ec6so1146452c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794991571; x=1795596371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3QIwNNjbPCMY9vDnX5iy4rnVih4SICdsbjgMj/Fl6DI=;
        b=YlwfilqfImrmeUkjlmi31h8/Gtwx5R+YTc3jkhYD55hYY4e+ISCZjjjbTdIiTzhcV7
         cbSD6Mhy0IK4wtt/gqPLb3WBm/5UwX5ZaiG7GxzQQ21Y16HGi71C6/Q32aJHlyQFBTo9
         o43bdcYA4TeNLD/jN8dVcvW6x4KD5Y9xsgFAE/mXaBPcVfAQSxmdd0ZmeS+88bPuJ6/y
         GuEXauXS/+B4MK+eeDHAnsozZwqhXA3K+9RnlLJPuWqj3W0vecclR2WMx3PKOYSu4nm2
         0JE54dk5TPK5j/uixo96McpIYb+68Q936zCzgqvjbOwp/oco8cQjFQZImAqdnXwEA/h7
         eJUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794991571; x=1795596371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3QIwNNjbPCMY9vDnX5iy4rnVih4SICdsbjgMj/Fl6DI=;
        b=L6nuxqxpGDZbju4eVmPXmj7rEN2/CNU04/w0WEkvMuIrY9UHcWTEQRX5PTZggKkm3A
         Ag+tx3JgbXCT2lolqrWO791H+byLRaAto2sqPR1t0akjwo/v9Vg1yqTFPReWWzblfaP2
         8oBxToOxGQjjxs7lVVmmOKJUnFLIKWoSIIvOqJoxpCLV51E6y/ulm2+I5gjmL0Vzpze9
         BV5QqlWpUNK77vqMOHiiEJ5SAc1rGW3FYnsYR1VFn6qJrZ/FJEg+AKKgDopY7sQ7+0+y
         4ADe4dic4MemxPtm0AK0m5XHLrdNcmULlANGPXV6WVQIdz/YTbif0nFhg+5mQtw9DKEk
         JOGg==
X-Forwarded-Encrypted: i=1; AL+hErF+nYe+u0gLybtPkFQVfwKtPBS5t8SacU1oKQvxDx7HGtubKv2v+Atjcfbe7YxYp3R3s/Br5CvorSM7Y3A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rPwhEkVfqxe+EB8Y9tqSLq1T6i7mefwhg3N3E8Gs1Fv15RohL
	ja9o2X9PHlNkVEJafZ5lY0NbDnXc7YUfIpoYZgpfy4ir/Tjwr4IprXyC
X-Gm-Gg: AYBFou1OHJLGEqTACISys+yuvlzXPariBDCBZwn8ISNcUBnIp924vIQs74TQTvyr7um
	WLipEv1eFa63aCXJ6wni94JQkXJ5BhT/HXDYU4n/gFJHgddcZ+jobzM3snDfla5CR6gXJHA+U8I
	TXUjwl6k+o2B55XXz9zMv/SvsRT+0I0SAiGaMeEa5zQTTVo5lb13j1pQHjBpXFFgCGnoyDhnrsv
	VNiSY3dGt/40LFcSX56kpnAWGl4QJXOtcC9OlOGvoCZwtOAlwewC4yfrBHU6eGfsobp2isDSvWg
	keRCB9RvAcFfiZnHYhChw1S+K+9Wm3SSHKD8UfAsZBFsWGDpbQwVxbC01ze35Xby/KzVJ79Ujoj
	uqIIae3ydC/KU0uY6cU64MukMUqaI2BrQIcGa2uumMX9EoN23AdcelyWmN9HWwWjwAPmkDtvPxt
	W6Iv4LmG10JRkZ5hpVFSlxvX4FeihdphCQaPV2V3gYE7t5ryymUtRu4NDiAVErJRbY1vQzMHzvb
	M05lUXw+HAFFP/VtZBVS1/4DFAu5eWRIYPy5R+ASzbEQbhGu5avoSkiyCMLx4wX9Z0mAHvlBgmM
	t9CCB1vMqouh+RA1YOV+a4oPtMMPePlZKPCnzwxmWsZqsdU5+jJWOKRHtmiN5gMTVc/5XwWHoPB
	j2A==
X-Received: by 2002:a05:701b:4584:b0:138:30b1:4c00 with SMTP id a92af1059eb24-1b543af0334mr2051555c88.3.1794991570825;
        Wed, 18 Nov 2026 00:46:10 -0800 (PST)
Received: from zypulse-in-radeon-MS-7E24.lan ([2406:da18:1601:7200:e02b:e41c:8db0:668d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447dc5e9sm7220671c88.11.2026.11.18.00.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:46:10 -0800 (PST)
From: Yuen Su <zypulsecore@gmail.com>
To: netdev@vger.kernel.org
Cc: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Stephen Hemminger <stephen@networkplumber.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org
Subject: [PATCH net 1/2] ipv4: accept nexthop dump attributes in route deletes
Date: Wed, 18 Nov 2026 16:45:09 +0800
Message-ID: <20261118084510.332821-2-zypulsecore@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261118084510.332821-1-zypulsecore@gmail.com>
References: <20261118084510.332821-1-zypulsecore@gmail.com>
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

ip route flush reuses route dump messages as RTM_DELROUTE requests.
With nexthop compatibility mode enabled, the dump includes RTA_NH_ID
alongside expanded nexthop attributes. rtm_to_fib_config() rejects the
combination with -EINVAL, leaving the routes installed.

Skip the mutual exclusion check for RTM_DELROUTE. fib_nh_match()
already uses the ID to match the nexthop when an ID is supplied, so
the expanded fields do not constrain that match. Keep the validation
for RTM_NEWROUTE and leave the other delete selectors intact.

The failure was reproduced while investigating the iproute2 flush
report below. An unmodified kernel and iproute2 reproduced it without
fault injection in a fresh network namespace with compatibility mode
enabled.

    ip link add d0 type dummy
    ip link set d0 up
    ip -4 nexthop add id 101 via 192.0.2.1 dev d0 onlink
    ip -4 route add 198.51.100.0/24 table 1111 nhid 101 metric 10
    ip -4 route flush table 1111 metric 10

Verified the flush and the existing new-route validation in QEMU/KVM.
The IPv4 compatibility selftest reproduced the failure on the base
kernel and passed with the fix. The IPv4 group and IPv6 compatibility
selftests also passed with the fix.

Codex assisted with isolating the IPv4 delete change, writing the
regression test and running the QEMU comparisons.

Fixes: 493ced1ac47c ("ipv4: Allow routes to use nexthop objects")
Link: https://lists.openwall.net/netdev/2026/10/26/186
Signed-off-by: Yuen Su <zypulsecore@gmail.com>
---
 net/ipv4/fib_frontend.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/net/ipv4/fib_frontend.c b/net/ipv4/fib_frontend.c
index 8c123b1..6b012c8 100644
--- a/net/ipv4/fib_frontend.c
+++ b/net/ipv4/fib_frontend.c
@@ -868,7 +868,10 @@ static int rtm_to_fib_config(struct net *net, struct sk_buff *skb,
 		goto errout;
 	}
 
-	if (cfg->fc_nh_id) {
+	/* Dumps can include both a nexthop ID and compatibility attributes.
+	 * On deletion, fib_nh_match() uses the ID to match the nexthop.
+	 */
+	if (cfg->fc_nh_id && nlh->nlmsg_type != RTM_DELROUTE) {
 		if (cfg->fc_oif || cfg->fc_gw_family ||
 		    cfg->fc_encap || cfg->fc_mp) {
 			NL_SET_ERR_MSG(extack,
