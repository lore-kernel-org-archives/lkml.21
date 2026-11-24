Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795496251;
	b=nMi9lw6MHvtE3FS+neV4cXoQFepFULHlRJ/agZToSp9FJEuVxBfTyso6Er5vBJqEQHWX
	 tS2IhBJoiob1+4/ZzdOpODyMr51eh2o8RWOsrBGDHdqQN8Oi33FKp+TumXW7e46OQ09ph
	 9sXF3mfhQqPuGKQg1u2RW2skbS4BTijPJwY9Plb4AAlRuOaRG6JR+1Q/clPDkvWEgG1jA
	 e3qjh9Vld6xzq1Uzm0as4oO+QB/EnNLLJhzz64+QN94N15+oKcevLNv1xPBjNDfO1pgZ1
	 A/jxdIoYChTbfPDY10Norr79y29IDMD7/9GpmVw+Z3omz5SEP9BivE5tIKGkMM1Rbfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795496251;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Vqq9QonjgyHUU55F23da4erYvDatTA94yztmVyJ7dpk=;
	b=s12p1HXKDBhqcgHH75hS2j/77yZOxLuvXXymtezbCOsL7hYwurEqGpif+5DSMWXHHFNP
	 KAksTFS31pQUyXpTXcfilyjHDL0jk4OOqkKXCRRlzIIPBseSxarHWD0sofddYA9g7Vef1
	 /cPSjFHEsIqi84Ehk5Y+XAlYjr7IBoJwv9LkVTKTBlwTa30eROvCUVuRbp2lI/eX2pSsr
	 DtuQLqvwBYtMXqTPreHcfxbwIX1mgsUNAstFR4WapwyIWzInqPQyZ9/+Kto87sgb1XtEI
	 7kYuEzhSyArJ1fF68uwHTw8yITzjRfMT/ifjiZZbM9K4WAOD4HVNev0PkQaPVC/6xRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="X/YkzPmc";
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE58606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 04:57:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DE58606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X/YkzPmc
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cdb1199bfd8so1845700a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795496250; x=1796101050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vqq9QonjgyHUU55F23da4erYvDatTA94yztmVyJ7dpk=;
        b=X/YkzPmcXZgazGeOUQOKY/AcJyNIgtpQbgIh3w1XZ/PxZAO9vv6ldKnLcT3QeTCstR
         QiHV6zls9nwWTW/7H3PZy3Xk3lg4l2QpS0T3IUDf4srj9XJqKtp3F6gyyDgkVngW6SN7
         YodyshzN5/H/hAJOXl/N2ZJV/8tYt9LICXc4jgsHKxFG7styeJuBk19VAt4ETjUKL6+Z
         XSq289tx9BPE0BTZJxdnoih5DXP2aaXPF7015+FBkABtyTq7RApZGaUZ7nq4k8pjhdPs
         rASeyO0VpfstsZaSz0lPw11eXRxa2zNGK/UFcEzmJE5mZHg8GfvkTaky90PWuulfWmCE
         h5yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795496250; x=1796101050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vqq9QonjgyHUU55F23da4erYvDatTA94yztmVyJ7dpk=;
        b=l04C8Oarw/9siAIapjhrFi9ZtF9icyryoRJalCwLtBLjWzbF6LKpkAIl7SSM1RYZVq
         OhKg10LN5LXwLMLc3cPODuutORneJzkPGB6uk8Z723YPRGzBu4qNgnO8aCty77DAm+Yz
         2aRPeZph+VCjiQJScj307lb6gt/Nc/Y5pcilMlL91vkjh6arsJHQCW8mZ9UxH0Xz4rZe
         8u0vu2516/ogKI7QjvTI8ccC27pabMvPbbnoJ0kPWU2mhomqHSxrGq5eEfdiXcwTsD/N
         BBW0vjSsMxaSahIxPYpPkq0n/SfbKP8YjRk/7yBmUt6Rwi63Zlsp3xfJTfCJYTsNGZTb
         aR3w==
X-Forwarded-Encrypted: i=1; AL+hErEIRP8bhq4plLk6eQMBrY2jB7Jhk6cGa1ghdcevaGiWlMBCGqSzowhQqvnnb7u9hGNr/H0haT6P21R2YE4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Pxq+ZoenkcGlGyNMMT64Dz1Y/6/iJWOrHRZ7l9NMiWK42OxPR
	ijBvCq6entF9VtfFMH79G4JpNIwIPy/amKi8h1LVj4UnHjhNlHRLsmzn
X-Gm-Gg: AZFdTZcEei1WGofsgjbVz37y57rG12fpJsXP0/ESAyVGW5XEgi6oGHcJVS74tJL+sk+
	EhlTydaOfBlul3enABLVqToJu3iKFDFumFHejWDSLQHfVEHTpUlwiVnUEE5r28Ir2SlkGeHVi2p
	BGI8XoagFcgQLguZIr6rAW4+0Yy8X4b0J0ga0vClkS8wwwUeQEmnhalrut1q0pvc/w4CWh8KvgZ
	XjXib092Mfdar1yq0RQSG//696XcAQPOKjW+/mCG763tV0edzVcJQq7sO1yi7/7Mvbq33+wywqb
	dDw1LxpVHTnuejDHpALPoJGLpVHPAL64Ts8C2/pLpMEi4JJavxS1XSGcGSEDiF24TiuIBg/Lngg
	0x50Tnm/FRdzesGYw+IGkxGRkXwVagZ/GDbZsVEfTHgdntXHs9wCO/y9NDaDA6KpBxtsNsv4HG0
	Gn6oORndjPNtHE0wc/fVBfeDtXG4ttHAf4p4sCnN7jsrv1p/R0wx5WboDT3enJE3Gn/YeeIsq/b
	R2oSbYgTJIzDJ9JhNurILhhap5dEPMZVmH5QHWFtQD5nkMdWZuPWceZ0WxIElEelnasDh2d5PyI
	Gi5puAFe1G09DOTohM5z/qF9zzn3J+vuXYxq7KB15qR1G/DQS1sTHyvl+iUVDXwTXPY=
X-Received: by 2002:a17:90a:c10e:b0:3b3:b0f4:1bf6 with SMTP id 98e67ed59e1d1-3b41c8ff7b3mr13032274a91.22.1795496250498;
        Mon, 23 Nov 2026 20:57:30 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b704cfesm7477815a91.1.2026.11.23.20.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 20:57:30 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Cc: =?UTF-8?q?Jonas=20K=C3=B6ppeler?= <j.koeppeler@tu-berlin.de>,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	cake@lists.bufferbloat.net,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] net/sched: sch_cake: use rcu_dereference_bh() in the cake_mq sync loop
Date: Tue, 24 Nov 2026 13:57:24 +0900
Message-ID: <179549599115.54577.5943710312861930188@gmail.com>
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

cake_dequeue() reads the other cake_mq sub-qdiscs with rcu_dereference(),
but it runs from __qdisc_run() under rcu_read_lock_bh() or in softirq
context, not under rcu_read_lock(), so lockdep warns:

  WARNING: suspicious RCU usage
  net/sched/sch_cake.c:2039 suspicious rcu_dereference_check() usage!
  2 locks held by test/114:
   #0: ffffffff88b2ca80 (rcu_read_lock_bh){....}-{1:3}, at: __dev_queue_xmit (net/core/dev.c:5014)
   #1: ff11000013ec8170 (&sch->root_lock_key){+...}-{3:3}, at: __dev_queue_xmit (net/core/dev.c:5058)
  Call Trace:
   cake_dequeue (net/sched/sch_cake.c:2039)
   __qdisc_run (net/sched/sch_generic.c:359)
   __dev_queue_xmit (net/core/dev.c:4502)
   packet_sendmsg (net/packet/af_packet.c:3157)

A BH-disabled section is an RCU read-side critical section, so only the
annotation is wrong. Use rcu_dereference_bh(), as cake_classify() does
for the filter list.

Fixes: 1bddd758bac2 ("net/sched: sch_cake: share shaper state across sub-instances of cake_mq")
Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
---
The issue was found by an LLM-guided test generator that we are
developing as a research prototype. Its test runs as an unprivileged
user in its own user and network namespace: it gives a multi-queue veth
a cake_mq root with a rate and sends through a packet socket. With
CONFIG_PROVE_RCU, the warning shows once the shaper sync runs.

The patch was written with LLM assistance; we reviewed and tested it.
With it, the test runs without the warning.

 net/sched/sch_cake.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/sched/sch_cake.c b/net/sched/sch_cake.c
index aa4043d662c1..c1652c0506e1 100644
--- a/net/sched/sch_cake.c
+++ b/net/sched/sch_cake.c
@@ -2036,7 +2036,9 @@ static struct sk_buff *cake_dequeue(struct Qdisc *sch)
 		unsigned int ntx;
 
 		for (ntx = 0; ntx < dev->num_tx_queues; ntx++) {
-			other_sch = rcu_dereference(netdev_get_tx_queue(dev, ntx)->qdisc_sleeping);
+			struct netdev_queue *txq = netdev_get_tx_queue(dev, ntx);
+
+			other_sch = rcu_dereference_bh(txq->qdisc_sleeping);
 			other_priv = qdisc_priv(other_sch);
 
 			if (other_priv == q)
-- 
2.43.0

