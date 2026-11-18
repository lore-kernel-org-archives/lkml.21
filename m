Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795025170;
	b=dlPpk85KWnyU5uXSoayopNpebljiqGYpieE/hifEceI/qsbVrIfhKCzsmRS9XnyW3k/3
	 rVGi1kdv5YKkvpFeTSDfZyLfDUlrDX/QgnqxbscL3fmydVGzEfiJAFjFs3J8qnedS4Ry4
	 /bp2SjGWvJ4WFTEMyevkz/v78zVKLI53p1A7l8RLmQq8CZL3s1HgeQP/xsmdc0rS7IOv3
	 VzOocgSJq9tdrH6epwJo0gye4aYA9gL2fiX17AlHc0BnQMoKyFDmnxESV0NvTUBaawX7F
	 9gsooNnr0Gx7NJBgANCAwO5ALUQtPUwWM+gs/1XKP4aJ6KHMjGIyEpEendCXJkZbz0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795025170;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=eXUvvDMI79T0vGt9VRNdz/EoDy6fjzlLVq4Nma9GGH8=;
	b=WkdM7sJO+VCwPgKoQ1ybYtIt1dAYaF1wxeJYnNB6hzuzf/Ua8xoh2kSeTs6LUebO4IJd
	 tLR4OQUOkl8e9yhCdheWG2iUt3kOftrHyR4sv7niJkY9aussztN373eOFQh21Ek4vF6bE
	 P95KjiTIfxMkBnMQpxXXEw1Io8m/UF8WqWdnfJpmwRq71RIpU6j+prJAUORnc2gCSQIXH
	 mICZXWB3NUD2xDfvRiBuu6KES+rVeWR+vjZylQ4u0CMnV+/U36pa8SfLzvyrae+JqT2cR
	 4W/LrCrG5jvB7alC4Z8t8DjsU03sxJ4siDSaYgGB0m0yC24o4X52Rb8fBNaCTE1CgLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IPVlw3na;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5272F606A33A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:06:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5272F606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IPVlw3na
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc751eddf25so1027023a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795025170; x=1795629970; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eXUvvDMI79T0vGt9VRNdz/EoDy6fjzlLVq4Nma9GGH8=;
        b=IPVlw3na5/CvdnAc1RKdNpm6kzADjS/7Ald6sHb6TWpEoAQNKmVhTNLGw9NVK/WlJz
         ZaeaynDc5ckAMFRdc2Hw7Le/4TZ0jlwLWXNznuG58vOfxigOfkZ01l+0vji8Q8aA6SpQ
         FFKhZiHZZ/NjtRSf2a5SV7+5cL0vJrFrh2rguYwkKJBJLPfm2Bj2zOKt5iGn/ijPsehR
         XPzh0bxVnTDXUfL5GsU1/ThU89yrS6zy99rf75MP8tYahrjAQbGiDhg3ACWuRW/WyviZ
         jGM6AqtpZQoBJTQ5Q3FMSzDuD7GQ9KGTXD5pS8HtNJMxOBT9Pwo0TVgMtks4EcSGnNN/
         ZYtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795025170; x=1795629970;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eXUvvDMI79T0vGt9VRNdz/EoDy6fjzlLVq4Nma9GGH8=;
        b=E1fsRMKiYYB1XwEyMARk9oiVhIkVDqR3t3tLzf/O9rG3bHb4V+pLr0VGeXWhbq9wk8
         nqmXqUqXAVj/5qFp9HcQZQAZBaS4mjfpjXO5vwYdM6rKIj0c0HPCUkOZlgi8A0j+OsG6
         L84TBJMIFHcOFj150SnIPX0ReXhaS0ycGP7BsT7cw9b0hWHJT+FM2+iahQzh7IV8XHOH
         JT6dIFjej+4acbY0HyrHfWBhQPLD/ilKsh7Xk9fQ56aMP/KLXG0kZXGKdNzHry+3d8iK
         VP7JqeXiaZR7RFObcXuzU00GN0mGZyb8tCGVWr4N3RKDFlXPy8BYvrX4jxzAy9Hje18v
         7FdQ==
X-Forwarded-Encrypted: i=1; AL+hErHzBJ7eDXJwbTgTl5bnHpIT/7A6juW6juK7Nbx41USz+QwTzlJrK3a3X0XiCt56GIU3mBb+sYHf8H1VT/8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8b7wAwgFepUrAzVaWpUQz5Fxw965mNH+fbE7FL2EULSVx1ESF2
	MLNJ5cFoSoXM3WOLHjTT+k5M051JMmsdfWcl+DjHLSWz+DnCuBwfCTPN
X-Gm-Gg: AZFdTZfAaXSHLNkoX5bZ+gQDOKtSebz1gqiyiqSvIoV8ja35tBpSGqUxIfQX4FHUkQ7
	Te9Bf1E48A7zJuy1nTPxMyxw2FfknQ9oddnSmnUhNeWXoHcTOxzlH9bkZUYF9iz9TA2dn7YGazT
	m+PHGmtxCU3tdOM44qqP/b9HuXarVU5zJODVAIAb9O4vp1+YPsIV1v2Az+TOI8ZM91/uJzxaHUl
	zHICmZCGm8wGPueSeFo5KkrE/5ZkCmt7vpAflzO+6J8hzKpqlAd/gJ3UHQVodu89OQlxPIpblIS
	LpeKH7bQOR1H+cvarP+sdOPVuA3Gn1+LGTCsEnjzARm6wYX2qlou4IESwZa76VuFcoAJ8nCKuLi
	XJR5UTnN7+9htJD9/FwLYoerYlBzJ+7DQOJgZmy3V7nUqkvO25l+ty5mjIOqDCPR+CKANr89HdQ
	EK59JV5UPdPbbR2rPQoO6MvpwCEFE+uS/5JqVMEgqpnNhLKx9FbDsWuxHESzGzMXoCMYTrMH+Rf
	7/TNyR10JcozKRNjDxZmMEcix0Fhtn98PrFqC9VyRa2byOEh8YhaitzFtCpykciV1C7e8w=
X-Received: by 2002:a17:90b:3c83:b0:3ae:533e:7e40 with SMTP id 98e67ed59e1d1-3b3d074d836mr3433754a91.23.1795025169495;
        Wed, 18 Nov 2026 10:06:09 -0800 (PST)
Received: from [172.21.0.2] (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3f56df516sm368042a91.0.2026.11.18.10.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 10:06:09 -0800 (PST)
Date: Wed, 18 Nov 2026 10:06:09 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: Aaron Conole <aconole@redhat.com>
Cc: Eelco Chaudron <echaudro@redhat.com>, Ilya Maximets <i.maximets@ovn.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, dev@openvswitch.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH net] net: openvswitch: don't WARN on a non-IP packet that
 needs fragmenting
In-Reply-To: <f7to6bmjayg.fsf@aconole-thinkpadt14gen4.rmtusnh.csb>
References: <179492834266.3639154.14679778183890331729@gmail.com>
 <f7to6bmjayg.fsf@aconole-thinkpadt14gen4.rmtusnh.csb>
Message-ID: <179502509517.2983267.1652158471891914135@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

ovs_fragment() only handles IPv4 and IPv6 and drops any other packet
with a WARN_ONCE(). Since OVS_PACKET_CMD_EXECUTE takes the MRU from
userspace, any ethertype can get there, e.g. an MPLS packet executed by
an unprivileged user in its own user and network namespace:

  Failed fragment ->ovs0: eth=8847, MRU=500, MTU=1500.
  WARNING: net/openvswitch/actions.c:831 at ovs_fragment+0x239/0x840, CPU#1: test/106
  Call Trace:
   do_execute_actions+0x580e/0x7380
   ovs_execute_actions+0xd3/0x3e0
   ovs_packet_cmd_execute+0xc21/0x13c0

The packet is dropped either way, so use a rate-limited warning instead.

Fixes: 7f8a436eaa2c ("openvswitch: Add conntrack action")
Closes: https://lore.kernel.org/netdev/179492834266.3639154.14679778183890331729@gmail.com/
Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
---
Aaron, here is the patch, with the rate-limited warning you suggested.
It was written with LLM assistance; we reviewed and tested it. With it
applied on net, the reproducer from the report prints the message
instead of warning.

 net/openvswitch/actions.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/openvswitch/actions.c b/net/openvswitch/actions.c
index 12e339cbf791..bf3f2b328b53 100644
--- a/net/openvswitch/actions.c
+++ b/net/openvswitch/actions.c
@@ -828,9 +828,9 @@ static void ovs_fragment(struct net *net, struct vport *vport,
 		ip6_fragment(net, skb->sk, skb, ovs_vport_output);
 		refdst_drop(orig_dst);
 	} else {
-		WARN_ONCE(1, "Failed fragment ->%s: eth=%04x, MRU=%d, MTU=%d.",
-			  ovs_vport_name(vport), ntohs(key->eth.type), mru,
-			  vport->dev->mtu);
+		net_warn_ratelimited("Failed fragment ->%s: eth=%04x, MRU=%d, MTU=%d.\n",
+				     ovs_vport_name(vport), ntohs(key->eth.type),
+				     mru, vport->dev->mtu);
 		reason = OVS_DROP_FRAG_INVALID_PROTO;
 		goto err;
 	}
