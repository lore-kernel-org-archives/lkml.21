Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770973;
	b=EzQfx2MYZ4y8MBBL9d3jvMWlNUqokOzliwB8IjflWZywTmLS4S3BG2yq0qsmjkbSlxbp
	 zb6q5pelgH0HOCa1Y4ePPkFnRFSlF6/sn2h8Fmzz3WrmJJ1cssol0hAw8igpODGM+FRd4
	 vc0D9rMol+MCOLUIoANFrp+6EPs7X8FcciSGqvTx5BbtBKK1WJVManeQL91JPVr4SlvMc
	 Oh3TjYgMVpX/afDSv33hqpL/zyvRDhN+QymDE+UWfVWfG7k1hPNq9Z+W1hk84Izi6PHO1
	 gb2dQHMxpCtV5y5D6VzYShyXvrNTQgkkm6bYw5FWgOQs88SYjcUDdNHSOvwuEL1hC/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc;
	bh=Nx00vavJ/sQmXrO6NCYuylVyOKfcmM2Y07yh/HykMOU=;
	b=2B71lM0/z4Lze3gpPEORsC/hdoCaDUBEcvK9cH0k5kLlj7djiPtOyakDbboDYdHw3kfM
	 k0RMwvhPRg8OVra5LPvgV312LYw/vhorcbiFLYBaLk4WIokC3EvPq2hhKEyoM8Z9iTu8N
	 OkGb6GZbivmrYxkobcs3v1Peu2xJVAB8HEPjAzXcKbDHJ7r1UV3CAzdPpoa4OAMx5JV84
	 +7nFKD+KG5SDoco/PTWa4aALI0MLpu0aOuoWM2KSfKV7BsuIx8xn+3yGjZEJrkFYGwgPj
	 mElSLdoSCi3YHSJbNfESrAFlQXEyScrTtS86yeXszY4hIwdwp57kTDS18XlL9EViPSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C6qcwxjP;
	arc=none smtp.remote-ip=74.125.227.132
Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B184606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:16:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B184606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C6qcwxjP
Received: by mail-pj2-f4.google.com with SMTP id d9443c01a7336-2f066a193bbso40609235ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795770973; x=1796375773; darn=vger.kernel.org;
        h=cc:to:subject:date:from:references:in-reply-to:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Nx00vavJ/sQmXrO6NCYuylVyOKfcmM2Y07yh/HykMOU=;
        b=C6qcwxjPYmrTxRyaoqpkViGq8K/WQ5PkHb+KWVj9FuOrHZO9A7laWWUpEfbyrp+LBQ
         IaAonyhiTsoYpUkLZd0ILYbX5LyN/lqRLgfmzf+Djt7G6FHmepOwozYvaCYQZGAf/Q0f
         Z3Gl9+vPwB12SFY4xOahYc8xXFQvwwiF+KJrerqRvxZuWnVc0jzHu1sDDDDURpMuQKZL
         MwGc/ElgAQSjaam+0U7pYOENUfmyz0jU2FulkpqXQsUzInBGnsgFCOtCzemRwTU+Ewxy
         /mtKB1InjYd43Ikrh05UbsBXsJ+ZA86kpdYJrn3EgbAThH0NxvQ3/NtY6auAvzc+Tq1q
         BJVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770973; x=1796375773;
        h=cc:to:subject:date:from:references:in-reply-to:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nx00vavJ/sQmXrO6NCYuylVyOKfcmM2Y07yh/HykMOU=;
        b=EQLhf6wXU5dnDZ60qpx2594j8Ao+I3dPLaznb7E+SPhO0w14olGU3NuNoP5sQMSEnW
         yPe7Wxo/mzksHVvkws2eELoQWwSW7yHdYQ47S9hUvuj9laOFwc1XaYpp5n2ZBd+RQcbB
         t21Qa7LbXyI4YuBY9bMMwJy6YnRqHn90VACx72FT5p52eg71FZBLhsgHbh4DofxrjVKw
         rhGdCO8DSzOyNMX1Mg7hkqGQJPE+bnsakOnO3scHAX1O/StcwinkTue5EHqKXDZfJ7J2
         HOuf4uccyie2AUiFhBbwfNbAlSqLK7MS96RcBx7QVKh0GJK6hiNSGhkzc0SflQxk+4La
         eclw==
X-Forwarded-Encrypted: i=1; AL+hErE7zAagN/oDwVurBZkFAaQhN3TinWU18RANxYkcxWCu62A9UsChwapm0A1XmkogXQ4AGVh04qF4dLtncVE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+P4xkRB7znopk5RIet3Uqkt+n0uVKVoJk3V3tuhAFsS7eJqw9l
	Uq0hkT5CmvGPx68tufheMHL26vLwBr67B2OaLlGaE3fCQBv/zQanlblN
X-Gm-Gg: AZFdTZeQi4WmvRiCONIvpkj8+by+UQSFAgbPeUsMYv03WBah3QUnPe9nMCiD/m4ytyR
	yX7K0guH+YYMGn4uifqA2CXC55QTdYji1BJxFnVvuFSXW+Faq4VN61hbBhdKuUG33v2GyitzZna
	Wxb51GWPV7Iyl6kA3ZZADp0uHGbQa/9nc0ek8ceBfwr1r3VIYCyu0pM4zD7EdSPNEKC6SjUER2I
	BaA90qJt21wP2oAOkUNYjJG9dB4a3OzqMkfO4QcCEHKW2zCw31InFtUEHt+O9xWtXwZ6OYgrTQj
	t3MQhgNtQEBN8R4nYXbw8To6jPzdtrMEmtFOmxFyppxgxG9g/8YRBAeQjt4YCKQDBQ8Mgg15GGI
	H2CNxVTO3GuMuosOCElSyee9dTZY5ZetoVZkFvIG36XH1qGi2Tn+8KoVaETCef8Q744GiNOwJCT
	Nn+yMLpFWuUOM9LLaokp353bz7fotHzI5ptgs62cKDo/ltoAHrItU2mrosnxK7A6l0qRzkSnq9M
	PH1KU8e/aN8yArt1+WemWRs5iTxj9eU+g1LVXK7050lIqZ+ECTtcITZONYcRrUsKXGFSVAjA+62
	IyJQKRw1Jg34a/Z5In7FBxQxqimCyh4RLrjPy974miOwdAm7/hTqNdFTPQLe2BHrIOksRMpBMss
	Mmb5Ed2xMgEf6fAlOQb3Qino=
X-Received: by 2002:a17:903:1acc:b0:2f0:a113:4e46 with SMTP id d9443c01a7336-2f0a1134e76mr155413505ad.48.1795770972894;
        Fri, 27 Nov 2026 01:16:12 -0800 (PST)
Received: from [169.254.212.233] (ec2-16-179-105-217.ap-southeast-2.compute.amazonaws.com. [16.179.105.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f10c9casm117276575ad.52.2026.11.27.01.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:16:12 -0800 (PST)
Message-ID: <71e47f31ab9eac91c07bc3b9535c87ef3723b961.1795769101.git.n0ps1edzz@gmail.com>
In-Reply-To: <cover.1795769101.git.n0ps1edzz@gmail.com>
References: <cover.1795769101.git.n0ps1edzz@gmail.com>
From: Zhou Qiuyue <n0ps1edzz@gmail.com>
Date: Fri, 27 Nov 2026 14:38:01 +0800
Subject: [PATCH net 1/2] ipv4: route: fix use-after-free in
 ip_route_output_flow()
To: netdev@vger.kernel.org
Cc: David Ahern <dsahern@kernel.org>,
    Ido Schimmel <idosch@nvidia.com>,
    Kuniyuki Iwashima <kuniyu@amazon.com>,
    Steffen Klassert <steffen.klassert@secunet.com>,
    Herbert Xu <herbert@gondor.apana.org.au>,
    David S. Miller <davem@davemloft.net>,
    Eric Dumazet <edumazet@kernel.org>,
    Jakub Kicinski <kuba@kernel.org>,
    Paolo Abeni <pabeni@redhat.com>,
    Simon Horman <horms@kernel.org>,
    Willem de Bruijn <willemb@google.com>,
    Hangbin Liu <liuhangbin@gmail.com>,
    ipsec@lists.linux.dev,
    linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

ip_route_output_flow() drops the RCU read lock taken during route lookup
before reading rt->dst.dev->ifindex.  The rtable remains referenced, but
route teardown can replace dst->dev with blackhole_netdev and drop its
reference to the old net_device.

A concurrent netdev_run_todo() can therefore free the old device after
the pointer is loaded and before its ifindex is read.  KASAN reported the
resulting use-after-free twice while UDP sends raced with dummy-device
teardown.

Load and dereference the device through dst_dev_rcu() in an RCU read-side
critical section.  This requires netdev_run_todo() to wait for RCU readers
after flushing routes; that fix is a prerequisite of this patch.

OpenAI Codex was used to analyze the supplied KASAN traces and reproducer
and to draft this patch and changelog.

Fixes: 95c47f9cf5e0 ("ipv4: call dst_dev_put() properly")
Cc: stable@vger.kernel.org
Signed-off-by: Zhou Qiuyue <n0ps1edzz@gmail.com>
---
 net/ipv4/route.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/ipv4/route.c b/net/ipv4/route.c
index cd69242af..b16a9d05f 100644
--- a/net/ipv4/route.c
+++ b/net/ipv4/route.c
@@ -2982,7 +2982,9 @@ struct rtable *ip_route_output_flow(struct net *net, struct flowi4 *flp4,
 		return rt;
 
 	if (flp4->flowi4_proto) {
-		flp4->flowi4_oif = rt->dst.dev->ifindex;
+		rcu_read_lock();
+		flp4->flowi4_oif = dst_dev_rcu(&rt->dst)->ifindex;
+		rcu_read_unlock();
 		rt = dst_rtable(xfrm_lookup_route(net, &rt->dst,
 						  flowi4_to_flowi(flp4),
 						  sk, 0));
-- 
2.56.0

