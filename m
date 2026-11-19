Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107964;
	b=cX+g6bgfeQSbjpzQDXVOqV4z7xcSAwO/fH5T0e7jnyJ41wI90y+RDNczJRXiTfyyy5g5
	 P62SQ6DJDErf/T3r/2c/W/fQanmdGkH5k1kpxs8SNCNmgmFLxi+l4LhWCRDd18Wbgc9p4
	 YqK5POgubNQ65I1V5FrfAagPq7zdO4nS8A2rEqWCslW9dpT2iX3IsQXaXYtATFSXhLyV4
	 ph5iMZJVVc7dOofeD9bsHQ7W0N0SX88X+Z8py134QY1oiODPXfqsrgssl5c2M6CzYwgJ8
	 A01xQuuCJ2F8LIQp8Is2XHaTlHuqIr0Y539JSAtW/sI3BlWjhu2MoAhooD59Bzh9QMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107964;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=1h+Sq3Mx9K1Q37YybLS2Zwd/Px/dYRHS/FdSGiDfU98=;
	b=Uo/53mMG2tpp+tNpJiHJAk186OztE/+zDFeXlEYVWGV+WjzAYU9kus+wNfOoPYaUHI2e
	 iT0IsEt2TomDGsr2itt92yYYbPvUoeaOKKFpMjJ8ftsyN3+B1DjRxWXTweJxEPhZo6uVV
	 WvM3sqIT/ZovqcIssPjzoXmFPJHJPrXB1tHVr7S8w51rBPjIhNYXjNS+9mQVEhOV2X1pu
	 C4woT8Z6sqiOtUgoJq0nGkUTb1TC6nkPtM6jD11kODfnIUg8Q8mgd9ZnFjrQkIi1wRPRR
	 VROaCuNB3kl5928R6KZdwcIAbv2rYRVg/zleN1Y4imgFmWmpge9aEeOnATTQAM4T25w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AdC8JO5c;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EE0606A32F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:06:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3EE0606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AdC8JO5c
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b3b5b49cabso2093133c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107963; x=1795712763; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1h+Sq3Mx9K1Q37YybLS2Zwd/Px/dYRHS/FdSGiDfU98=;
        b=AdC8JO5cfYkREzBuevSsmBRofyeI2viaNdzDHn22fr5zHup73OzTY3NnOWjx8+gR0H
         slfgJ589QAW3d71exm+NVYNH22zUkwviQImI6St9JAHQ7XQisL1Wauv1RNIjWSyNtDAV
         f1SwR74ongcjXN/5+SWXfwvl5qGjVyyLsTrnl/ITt9tbeLTFW/E64tzpQUNSqgBjH9Vg
         OkmvgI+Uss1oalxYeB3K0h/Zv895W0dTN/0xXn2ClA+rg5vhATHczFlWEljWFmJRT/47
         4/bp0BnPee/FEc+IMaPVhet7FvufTKFGTAhZVT34AG8vcATrAhlgfHjKeLETqOmhAfZN
         R1MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107963; x=1795712763;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1h+Sq3Mx9K1Q37YybLS2Zwd/Px/dYRHS/FdSGiDfU98=;
        b=LcWsNIX74vV9J/MEB3tgtsR7I7MZELo7LIwfkyZY+SHTQkMlPSVZ+PX7avjR4b4YSv
         wofc0ZztNCgfcLjXJ2lQB7oU801Q3ajSTQxDXXuxI+abP9af9n0FzRbQ0AbERvp5H+Yj
         uMYRWxXlF6VmjmIv/PLmvFq/9Anfww//f/Wxt6qv5p7OB7seOfheErFCsTYNiIUI1Hz9
         yKvF316OPTac6SiSdIwFl8gjw3ZJM2oibr7rky/RwwCmB83mALiFQu8wYuSuQNdmGMLG
         J7xjtLrfqxSZ74yeAlZr3qsOJXYisIZUVguiBzw7yptSlpamE8l0TVCvFTmdBbFwxYEv
         zCiA==
X-Forwarded-Encrypted: i=1; AL+hErFiDUgp0lClbKdLWeVTL5X7iQhVfb7MMYnBk7kKWmUTJ6gM2hglujAQnV0lR6SGY9FDIOh/O5EJ5YFtSWg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0PTMTgyb+4DQv5/pXsDkD6H30C9SydMoRK5/lfyLKSLsSMXgy
	+gpiUcw0rD4C7mrheZi9yVubV/Mh6Ysl5YwLNE3jRc3hnuV8qF3p7aDrhP1oLdhVmMLkHj0oQqU
	RomBLHG1Ong==
X-Received: from dldz5-n1.prod.google.com ([2002:a05:701b:4185:10b0:1b5:1a6c:af8e])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:4196:b0:1b2:3b5b:b80b
 with SMTP id a92af1059eb24-1b55689ee3amr339019c88.8.1795107962438; Thu, 19
 Nov 2026 09:06:02 -0800 (PST)
Date: Thu, 19 Nov 2026 09:05:56 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119170556.1518068-1-irogers@google.com>
Subject: [PATCH net] tipc: validate peer address attributes in tipc_nl_peer_rm()
From: Ian Rogers <irogers@google.com>
To: Jon Maloy <jmaloy@redhat.com>, Tung Quang Nguyen <tung.quang.nguyen@est.tech>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
	tipc-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

tipc_nl_peer_rm() documents TIPC_NLA_NET_ADDR and TIPC_NLA_NET_NODEID as
mutually exclusive ways to identify the peer to remove, but implements
them as two independent if-blocks with no fallback check. If a
TIPC_NL_PEER_REMOVE netlink request provides an empty nested TIPC_NLA_NET
attribute (or only unrelated TIPC_NLA_NET_* attributes), 'addr' remains
uninitialized on the stack and is passed into in_own_node() and
tipc_node_find(). Conversely, if both attributes are supplied, the second
silently overwrites the first.

Return -EINVAL when both attributes are present or when neither is
present.

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wconditional-uninitialized enabled; fix and changelog drafted with an AI
coding assistant. Build-tested under LLVM=1 W=1 and
-Wconditional-uninitialized; not runtime-tested over TIPC netlink.

Fixes: 43fcd906d9c1 ("tipc: support 128bit node identity for peer removing")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 net/tipc/node.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/net/tipc/node.c b/net/tipc/node.c
index 53b0993c2c23..d19ed94b8f41 100644
--- a/net/tipc/node.c
+++ b/net/tipc/node.c
@@ -2277,18 +2277,21 @@ int tipc_nl_peer_rm(struct sk_buff *skb, struct genl_info *info)
 	/* attrs[TIPC_NLA_NET_NODEID] and attrs[TIPC_NLA_NET_ADDR] are
 	 * mutually exclusive cases
 	 */
+	if (attrs[TIPC_NLA_NET_ADDR] && attrs[TIPC_NLA_NET_NODEID])
+		return -EINVAL;
+
 	if (attrs[TIPC_NLA_NET_ADDR]) {
 		addr = nla_get_u32(attrs[TIPC_NLA_NET_ADDR]);
 		if (!addr)
 			return -EINVAL;
-	}
-
-	if (attrs[TIPC_NLA_NET_NODEID]) {
+	} else if (attrs[TIPC_NLA_NET_NODEID]) {
 		if (!attrs[TIPC_NLA_NET_NODEID_W1])
 			return -EINVAL;
 		*w0 = nla_get_u64(attrs[TIPC_NLA_NET_NODEID]);
 		*w1 = nla_get_u64(attrs[TIPC_NLA_NET_NODEID_W1]);
 		addr = hash128to32(node_id);
+	} else {
+		return -EINVAL;
 	}
 
 	if (in_own_node(net, addr))
-- 
2.56.1.708.g77570a6a1d-goog

