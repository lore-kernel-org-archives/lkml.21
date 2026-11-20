Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168038;
	b=N0gI2zl1Bzn7cI0o5dYWnG0+79U4m8ulmyY+eFgEe4r9bilq1CcDp08OsjkVukk/Q9z8
	 2Pl2HryykSp1HPuUVJIYcR3uuW1iGI7dds1pXI62FraAw7EhBJEqe/6hV7L2ogHOt3Ia8
	 /f2oUIQ+7mKS0sBkUSig65Y4yjHJMpgbaoqq53i75oKvxNOYVltrLMOCEghTqRcnvI2Mp
	 xcQL+VAlYn/GaPz0Up0CvcfBnoFWlHcmhja8FyjGlFir+4qbf3TUbpPrGfNhDZsVbf9a9
	 O1jSSxFhiYkzc2DBOVUwkJigcKW/TyqC6+o+qBA07rO9hX/AWdyg3g1txdhxtpKaAKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168038;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=SvTdqnVwIENDhZTrSuh8g7cNIkRmaUcL7O5Mg6MGuzQ=;
	b=t8Ofz/erEd0cxkLnJ8Us2EbMA8WPv8xcHx9DNzV0stWUkJuQbzbAR1fb4axSJH8zI5YM
	 CSrXWJD00POqFqplUPswjNnuBxyE2CclrzRZUFVGUf/DISbsCIRhTxKFY0M1CBOQT2SK8
	 C+itCvgi3mFbwUvPKo5XePWUQFbFSCmaiAYZFqLCPyST9oUs3pihi6KNoJw1ayNON2YNx
	 cJfbqKDo+2c74S8GKSGiWN2p36qu4UUgYzWTt81yO56pxDoi9EdSJHPdYj5ldUftQ7dGc
	 1Efq+3fj+fmsd1p1gE7zIhgf7ygaVnDGyaiB5TdpypYwkW9tv/yU1dNxHJHisrjL3bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=J9AE9jX6;
	arc=none smtp.remote-ip=91.218.175.3
Received: from mta0.migadu.com (out-3.mta0.migadu.com [91.218.175.3])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA31260A2600
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:47:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA31260A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=J9AE9jX6
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=rAEFlL3ehnQf0utZCaA12Sm49W28OORcQYGQItYKVKk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795168035; v=1; x=1795772835;
 b=J9AE9jX6wAeP3qm9/xD1RHirECT6wkPpuHj6mQ9BFWd3FeBysvnrai0d9kxxkVNpg3akTf8k
 OM4sAp+jZza22OKO4lC+HfVWzGPiMBykiT1aCQ7k+zGjZ7eOVzzwx5CHir9OGfExUkxkxwKSkuO
 2OD8BetTI382/XPcTVjLmL18=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id fca0a44074f6fe16;
	Fri, 20 Nov 2026 09:47:15 +0000
X-Mizu-Trace-ID: fca0a44074f6fe16
X-Migadu-Flow: FLOW_OUT
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: netdev@vger.kernel.org
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	Eric Dumazet <edumazet@kernel.org>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Patrick McHardy <kaber@trash.net>,
	Florian Westphal <fw@strlen.de>,
	Hannes Frederic Sowa <hannes@stressinduktion.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2] ipv4: fix conntrack defrag forwarding after ip_frag_reinit()
Date: Fri, 20 Nov 2026 17:46:59 +0800
Message-ID: <20261120094700.46500-1-jiayuan.chen@linux.dev>
X-Mailer: git-send-email 2.43.0
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

q.max_size and max_df_size are used by ip_frag_reasm() to set
IPCB(skb)->frag_max_size and the DF bit of the reassembled packet.

ip_frag_reinit() reuses the queue for a new datagram but does not
reset them, so the new datagram inherits them from the old one.

On a router with conntrack defrag, if the largest fragment of the old
datagram had DF set and was larger than the egress MTU, a new datagram
without DF gets DF set after reassembly and is rejected with
ICMP_FRAG_NEEDED, even though all its fragments fit.

Reset both fields.

Fixes: 5f2d04f1f9b5 ("ipv4: fix path MTU discovery with connection tracking")
Fixes: d6b915e29f4a ("ip_fragment: don't forward defragmented DF packet")
Reviewed-by: Eric Dumazet <edumazet@kernel.org>
Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
---
v1 -> v2: Target net
v1: https://lore.kernel.org/all/20261119061751.222641-1-jiayuan.chen@linux.dev/
---
 net/ipv4/ip_fragment.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/ipv4/ip_fragment.c b/net/ipv4/ip_fragment.c
index ef7fd61284a3..0688be8142c4 100644
--- a/net/ipv4/ip_fragment.c
+++ b/net/ipv4/ip_fragment.c
@@ -250,6 +250,8 @@ static int ip_frag_reinit(struct ipq *qp)
 	qp->q.flags = 0;
 	qp->q.len = 0;
 	qp->q.meat = 0;
+	qp->q.max_size = 0;
+	qp->max_df_size = 0;
 	qp->iif = 0;
 	qp->ecn = 0;
 
-- 
2.43.0

