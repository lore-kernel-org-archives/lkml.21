Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770983;
	b=tyJxDzWYtFJAa9dam4JmNpb78KDesymDArfbfsjoCkv1ttfxTcfTJrmPZ0rinUtp0Lp1
	 /nKqOOkLoFbeEbg7OhMhUv0m/cKLfILIDu7AiWHnvWOq2pQA1qT5AwDFDDt5QfcK4dG3y
	 UBIl2Gu4SwUon8/Vk5elMx900IIDZ2CN+Qq3bIzleCx32AKCqsJxw9hBUbetZ/wZN2w5O
	 9VfZPeVmX0cz6q75Q1cL23MCkTQixlTicWbnuGb/vB0lKCan9MWxPJhhkFiaktnk1UQrb
	 g1hWbRWnVOgy9U8sJKT0Z7KQZJ1YTcXGyqiDGxAUMKlYs+o8kqdscMpQ+19JHns0Cag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770983;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc;
	bh=HcE4U4ajhU0fYFPRjlDViUPtdh5ql807zszqwyGOmGE=;
	b=z27ixXt3cJK0hU8zBul/4x9veR/FU9Ow4qYFDExRzYVxBS/cGGqBzQM8k7/IrJfiOoH8
	 KwtJr1AIqzp6dPWsoeWcwxH7nCS+BgI7KuzPBt4kOM55QFbTd35UpNaKwe+861UFWQb40
	 c7b6QKSYPy1CegaUflEJ719VdJ8P1fKeMWa4spgDxvctBWUKRstrheAP9+lu0g+jhvZBh
	 8MSc0dOhDr30VUanDAgFlsx7XzzSBakqMsXYdZYqih2mKGatFSUUJ/2DvgA34QHs1TKkh
	 LBu3IJGNlCjO/k5QscEADbt+nuMg/YxL6vrlax4Eo7HImTV+ADxo97OnaCkKT6MguEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hgr5fBXG;
	arc=none smtp.remote-ip=74.125.227.131
Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E1F606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:16:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67E1F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hgr5fBXG
Received: by mail-pj2-f3.google.com with SMTP id d9443c01a7336-2f0f18feff0so4371885ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795770982; x=1796375782; darn=vger.kernel.org;
        h=cc:to:subject:date:from:references:in-reply-to:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HcE4U4ajhU0fYFPRjlDViUPtdh5ql807zszqwyGOmGE=;
        b=Hgr5fBXG0bZ3bzYqiy+3LV+7WCIIx1bGGoCLitdyX4rocGedwC5eIvB8pyCZhOpvy9
         /Zq9BN3CfDeXnsIWRlq70Tzg8eYVFG3SMeI1xHsNVeJ+A5XNXj6Xq9q4kYaqjk3A7J5x
         N4m8kSlcn3oQBTnMCWIV9C9b0/TuvBfhQdZoAYBz0ZW3ZUkcQTDJFLDj9WgJXUCfjsVR
         IJTJLmgVMnR5X4j+/Doyy9ZC8PWEqJzqHSIZz+By/Zdn0ryo5lfEfeMDjClZVuxKatwB
         d5Ygf4AhnNffkoEpkNMdhhsyadAfkD94s6D7Ra+BaiXNulsiLVicyQZMUIEV8VT8ZDbR
         eG3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770982; x=1796375782;
        h=cc:to:subject:date:from:references:in-reply-to:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HcE4U4ajhU0fYFPRjlDViUPtdh5ql807zszqwyGOmGE=;
        b=fu4qdWDxwhJxSxOUVCVJ40mcotHuhhHduuAaZrdG/wNuYgRW8ANZ/BiSMSrmCDglzr
         b9DnZYJmciVFQtmvwAy+ZpKbBMDJ3xI1DJO9a6bCh2XJujXXmI9Ho2bIvP/1+6h5EiQv
         quU/XcuAFJ32xIbVizqmIRxxbfUZuaekhduh0zr1z3Oas+fKP1NclvwQudmvOCeRCl27
         BTOmFd0cqZL2rUkbiEix7g/u2bPz6dRAheb0YyTq62SlMwO6yY3OxoTh2SmLHUULM/Ht
         YS1AWa987NdGOq7wbk9RmKsZssfa9lty4PgLKV8x+W7P2GyLRDdKV0gNYpsHNFQMo29T
         SuCw==
X-Forwarded-Encrypted: i=1; AL+hErEfeM3ZuNSM6hc0w99RrTuJZmahe/FGKYWpGOAvwc32ksiE3rGEEWOCtX69yIPjFR28JX82sj3CSmyswHQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bS5sWkL2QeBXxugWAbed473hlB+FQM4IYlaLJtOArzsYoYjAF
	57q48gxfOl4DvMdAqEGKWBgJLzyuIXz0pH6J8flLaTTrgdJzOmITtnFu
X-Gm-Gg: AZFdTZeSTBRkidlBCzJmTyfXb6W519LW63f2eSZpMJpT4+MT8W978E+StbaPHlIbB+m
	2IWkMEYS8AzUuvaqq/TjC9YURrbENSPLJSSRZGMFMs2MOtbTPPzTRnSrR0h4AVJKE4S4UDFXNce
	JI52e5sc9eXfOmoF7oog+/6FSvL0X2gJ04m2KRa8GVJ6JAEiWzoCrTvn47AtekYnVTLyDBUfPTV
	OiCI5DzTVsAl7bJV2u0nCPfG7Gdkgr1IFfYSKOj4EStAg5+rX8H7ZOfmlbs8vX7wYVBvMSp+FZq
	V7zl2llr0fJIJpMwtR6el0VuuHQzGDMB476k9d7gBRH5tfVQh4CHwLFJ1KRaRbEdYxdVTpPbj83
	lUPO/JfcQiMSwj0zyLEt+tBmSlN4KU/xR42jjWyXKiwpqwADE+0/WOsadOXeuLYBKEw2iDkqeHb
	vZ35ANNpngGiYMY5kPltQghu2Tjocf9otXKb6i4g4lpI+Rj1zWE4SlnhuSjsnmpFaHoBV6zimlZ
	g53AdlB+Oit/YXaMrzC39G3zysTK4DPpm4dfXYqqErCS7iKtk8Fhwk/x4jusI9YH2Wzt7gEC24W
	CwTNgUjQxcZvGMH08Nofc/Tte6BQ2vjFosAUjEueJWKjKYdYjKGe9/+AmCI2YDBduuvyYHKE14o
	zLhUnzg58n3l7lAuwiZK4Z70=
X-Received: by 2002:a17:902:d4c3:b0:2ef:e20f:3eeb with SMTP id d9443c01a7336-2f09ca84710mr142455805ad.20.1795770981749;
        Fri, 27 Nov 2026 01:16:21 -0800 (PST)
Received: from [169.254.212.233] (ec2-16-179-105-217.ap-southeast-2.compute.amazonaws.com. [16.179.105.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f10c9casm117276575ad.52.2026.11.27.01.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:16:21 -0800 (PST)
Message-ID: <624bf99e815ca1a98d13ef06684c86148166fe9b.1795769101.git.n0ps1edzz@gmail.com>
In-Reply-To: <cover.1795769101.git.n0ps1edzz@gmail.com>
References: <cover.1795769101.git.n0ps1edzz@gmail.com>
From: Zhou Qiuyue <n0ps1edzz@gmail.com>
Date: Fri, 27 Nov 2026 14:39:57 +0800
Subject: [PATCH net 2/2] xfrm: fix use-after-free in xfrm_lookup_with_ifid()
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

dst_dev_put() can replace a dst's device with the blackhole device and
drop the reference to the original device.  The device can then be freed
after the unregistering netdevice's todo work runs.

xfrm_lookup_with_ifid() reads dst_orig->dev directly in its no-policy
path.  It can therefore dereference the original device after that device
has been freed.  KASAN reported this race three times while a reproducer
repeatedly deleted and recreated a dummy interface and exercised the XFRM
no-policy path.

Read the device through dst_dev_rcu() in an RCU read-side critical section.
This requires netdev_run_todo() to wait for RCU readers after flushing
routes; that fix is a prerequisite of this patch.

This access was also identified during review of an earlier XFRM device
lifetime fix and left for a follow-up.

OpenAI Codex was used to analyze the supplied KASAN traces and reproducer
and to draft this patch and changelog.

Reported-by: Jakub Kicinski <kuba@kernel.org>
Link: https://lore.kernel.org/netdev/20260908224901.1591334-1-kuba@kernel.org/
Fixes: 2d151d39073a ("xfrm: Add possibility to set the default to block if we have no policy")
Cc: stable@vger.kernel.org
Signed-off-by: Zhou Qiuyue <n0ps1edzz@gmail.com>
---
 net/xfrm/xfrm_policy.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/net/xfrm/xfrm_policy.c b/net/xfrm/xfrm_policy.c
index cea6842e6..eafd090e3 100644
--- a/net/xfrm/xfrm_policy.c
+++ b/net/xfrm/xfrm_policy.c
@@ -3186,8 +3186,10 @@ struct dst_entry *xfrm_lookup_with_ifid(struct net *net,
 	struct xfrm_policy *pols[XFRM_POLICY_TYPE_MAX];
 	struct xfrm_dst *xdst;
 	struct dst_entry *dst, *route;
+	struct net_device *dev;
 	u16 family = dst_orig->ops->family;
 	u8 dir = XFRM_POLICY_OUT;
+	bool is_loopback;
 	int i, err, num_pols, num_xfrms = 0, drop_pols = 0;
 
 	dst = NULL;
@@ -3312,7 +3314,12 @@ struct dst_entry *xfrm_lookup_with_ifid(struct net *net,
 	return dst;
 
 nopol:
-	if ((!dst_orig->dev || !(dst_orig->dev->flags & IFF_LOOPBACK)) &&
+	rcu_read_lock();
+	dev = dst_dev_rcu(dst_orig);
+	is_loopback = dev && (dev->flags & IFF_LOOPBACK);
+	rcu_read_unlock();
+
+	if (!is_loopback &&
 	    READ_ONCE(net->xfrm.policy_default[dir]) == XFRM_USERPOLICY_BLOCK) {
 		err = -EPERM;
 		goto error;
-- 
2.56.0

