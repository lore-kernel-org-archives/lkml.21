Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795408190;
	b=cO+dUtzEvNhjQK78Wa3Op1FFUUoxLu5xzmATvwkcPLqAq5gt86ZnBBVPTbsNvK84MQJE
	 KOjdEUMFNjoBO60lTHYHeTzAF817FAbpUlvQIaq78YdJaU4tJAnxOttBHV6Rva2kZW+B1
	 1vK2f872diBn+Usu1AAA29efGrZ9j52m/7BeSFNOPB3iawqV/AXx42LMirUkr6Utv3xLO
	 LTiaQ+BXZRSLkYXic1lLs+7xywLN5EI1rjefSXnlZbE4aVnU+Vpjxui5xD1G+47KhI2he
	 V3gpwWATVfWUQn0DAzBMFeMe2xjwJtRFt62Ul81oDOE4YF07VqSr6Q7iu2IpKRGnY3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795408190;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9WFHo8GeZELncIjowQIjRTjb0VoQunjDuTg0qWyCJAA=;
	b=MjhpPXhZvNXVHrQpuoE7G+j738JhunvbfoViZuKKb8dBSXARSAgbpaGd8ivHG6c/2d9J
	 rrb9MmUIFKkfObbK2FhyN2e9DIuSBnxQvJRjPMrCziOodyHOaXaQpNMs7h49lkBWk0dP4
	 j4f3KkTWagRJ08bKAZFqGf8WYC+labV1LG1jjLZKilY9i6bqmGpRC2E963mSmyxfMx+E8
	 WZohO70e1dxodo1BR+vJzzqs/d61BbnFvrp1sbK0XSRW36p8ReboFsWCymiBFnbDzPRex
	 EuCMvJIVqnFKk2FLoxwrbpMibIJHAwMQ/xTMdsqxhJ6bsdYcJGN1D7JiCag/pq7B84Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FYb+KgMp;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37A7606A335
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:29:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E37A7606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FYb+KgMp
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-38190551625so6042771eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795408189; x=1796012989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9WFHo8GeZELncIjowQIjRTjb0VoQunjDuTg0qWyCJAA=;
        b=FYb+KgMp5knJ88SNzdM6/goTPVmnC9olRYxHtrVa/Op5DIFfd5XMqAuVpWmTDNa28f
         aANnYXfoTT7RS/H8bWETqzCSHaIDsxhQS9YSTIzhr2KoWVGtoZudHGFxclknwBn+eQBV
         qvt1+GA1JJ49/e2r7RNUzuXWqJkw5257fLuh64SNvH/i284LqT+a+R2ndXIaZqil3yrl
         YgavGBIGVUYS7rzj//wXvOLDTcPhycv+wjXralfIycNNg+/T5GZiyws6dqehXD6TsvcW
         SxbQtP+Nv1FgVNljW1EeaVvWbuQoMoit6gnHq2KunX9oYLc2niK3l2F0q16q6HWIJ7nM
         knhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795408189; x=1796012989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9WFHo8GeZELncIjowQIjRTjb0VoQunjDuTg0qWyCJAA=;
        b=zmhFo7Hxo/5NCqAovm7TxLZV6GrTqJmiNKaXPEBl9fp7YboGbmDJzJ/eCyAbJF1IdL
         LAYsS0T2XaFOioNMPhDGK/jHtlTsI+eASL1vpMR+k0R5CdOnNPRptaRjwJzLaLQXRPqZ
         mMRbP0w4/TZc6NgzhOnnYs7c6u5r/35m6mQkRhsTmBvm4iVPhzlo6l4SUu5i28xp0AZl
         3zYA39u7Y4PBMtapLhhQwYoJ/H19ajGGDULfF1Y7B3uxfYr14lpTTqarWY+WJYrabIa3
         vKwT5NbEFT0jjUsMsdWkibE/Om7N1rNyE0jxikS5qK0iNkAX5XVMfz7u4xt5uPceE9GV
         zVmw==
X-Forwarded-Encrypted: i=1; AL+hErHKL5+Io8+gzki4h89EbkMQHoJ+n4NUkSU7RoENyB3T2ylRzmM3t0WbdYXcFPTcAqIbi4WjHszky3PAYlQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CVfnbqzuRjgSrRJdsuW1iXQb63oNWv0GHadf3GXRJguyUaWIK
	noej5GdpZvwIkL7gCQ+i/PZYcJNRwVOxOWBgUp1KATcp2VOX2vDFEiVc
X-Gm-Gg: AZFdTZepnBF1NQckgIzHGAp4lJI4LstGxhMRUIGyxLE8EVNS5OVA5X7RVivUW53Y3jT
	I19x88Jo92Q6VKKrhYjpmH/kPNHXtdRWB+eKJ8j/OyjXXETyN8njbBzeDZJNareaUKt/78J6l6Y
	w39MBMzEle/YX2rj7og9GAXvsiwwTS7hYBwFP/xSg/oyTGQNOaStFeblmxnS+Pa5wnK+iZJ5izw
	2JcvJp8k5+3fgZEnZBYtXJR0fI5CAjJPNZB/d4OFqy/1/lXKbaa4727EcxxvqldysKHV8APzPov
	bEqdAKsEld1jeiMAfY9QNXxrA9eWceI0dcfp7YP50O2QanwERZGbIb61njA4WjHhNh4gcnsvAU9
	QjYS3U0Jjx4u+y72W/Wu6y7uqIPEGQrxuYljFhYx43EYMguCJFsPtSB/fLZOX96qPobh+nyeVZF
	PB+kiAd18p5Ga7BkfuQs0mzaf/TT2TrOhC6yZ+DEFYgfIPoc8cOJ6yLLA8YhVaKZgh5ti/sUxFH
	w754qw9ZaiOsR1rs4brZE9TbzsLQTmfszbhBAKCqJsKZFzzwUjpjnTKwQZ9ZPTFrzQoEek56vkQ
	9Gu3X6fW9+UI3InStOpRLiDywEYmX35liQ6UX3Px+VsrcVspVzfZhQaUTsHlrBo1bCg=
X-Received: by 2002:a05:693c:600a:b0:37b:4a2b:81a with SMTP id 5a478bee46e88-3863f13587fmr9290868eec.4.1795408189065;
        Sun, 22 Nov 2026 20:29:49 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm33562090eec.22.2026.11.22.20.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 20:29:48 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH ipsec v2 1/1] xfrm: free the policies already cloned when a socket clone fails
Date: Mon, 23 Nov 2026 13:29:42 +0900
Message-ID: <179540803323.3139700.15088508372382876389@gmail.com>
In-Reply-To: <179540803323.3139700.5340002553684152759@gmail.com>
References: <179540803323.3139700.5340002553684152759@gmail.com>
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

__xfrm_sk_clone_policy() clones the parent's socket policies one
direction at a time and returns -ENOMEM at the first failure. If the
policy for the second direction cannot be cloned, the clone of the
first one is already set in the new socket and linked on
net->xfrm.policy_all. sk_clone() then frees the new socket without
xfrm_sk_free_policy(), and the policy is leaked until the network
namespace goes away:

  WARNING: net/xfrm/xfrm_policy.c:4303 at xfrm_policy_fini+0x24c/0x300
  Call Trace:
   xfrm_net_exit (net/xfrm/xfrm_policy.c:4372)
   ops_undo_list (net/core/net_namespace.c:253)
   cleanup_net (net/core/net_namespace.c:713)

Delete the policies cloned so far before returning the error.
xfrm_sk_clone_policy() clears the new socket's slots before cloning,
so a slot that is set holds one of these clones.

Fixes: d188ba86dd07 ("xfrm: add rcu protection to sk->sk_policy[]")
Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
---
 net/xfrm/xfrm_policy.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/net/xfrm/xfrm_policy.c b/net/xfrm/xfrm_policy.c
index cea6842e6454..dba1851f0b3d 100644
--- a/net/xfrm/xfrm_policy.c
+++ b/net/xfrm/xfrm_policy.c
@@ -2460,6 +2460,13 @@ int __xfrm_sk_clone_policy(struct sock *sk, const struct sock *osk)
 			rcu_assign_pointer(sk->sk_policy[i], np);
 		}
 	}
+	while (unlikely(ret) && i--) {
+		np = rcu_dereference(sk->sk_policy[i]);
+		if (np) {
+			RCU_INIT_POINTER(sk->sk_policy[i], NULL);
+			xfrm_policy_delete(np, XFRM_POLICY_MAX + i);
+		}
+	}
 	rcu_read_unlock();
 	return ret;
 }
-- 
2.43.0

