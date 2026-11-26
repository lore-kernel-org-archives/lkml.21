Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.193
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795682574;
	b=DPwebdClntZL6QNKRdgWag1N14wLoPx3pSohhJOILFOY51NWW/9ZQ6fp25SQ7GO3rrlS
	 d20X3u4LbvTcWgY3aiK87DVqA7Oq89F5DGerFxu/tU2vaHyXtVWW2LLKvsyFRtjLrniuz
	 hD4DNXG4gji8Amp/9BjMqVHTsSsiW4htNigBAHqB1+ijBUVjgxApvV/SUhPLwzeBUDbQ9
	 zp8NKca0mtmojqXSXkG48nxhlY2Q0S944Tpnme2x+vvedInpJGsd6tj/SlhKeUdxdtAkX
	 o47V+HEDKacpW5zqUqTbZYd3rwZ3pHXCjP3v2RqvfksuCkM0nRB0KesioM/qmH0r7zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795682574;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer;
	bh=zJIBT5Y4HVLKvK92LNY4BHTcvjDQ4je5g/t9kWoSfjA=;
	b=jVS1c4fk7Qla5NrfpDszD4qCo63ij1DUCbqrtE1raxDPLNd+z3HTZVIfaN0/AzfjtgPC
	 ElYz6vrWjgLDkbvZCC4K3+xKJ3Qd9RtjTbpggdDL/3uJuebRPB9wK4wev4vWDG3jjB0mM
	 n9FkESQI1AypGBv42MYeyZWIe44sM2OvOGNZzCC7jRHYFvdNnx1sDs2OS1tIZcxzRwsUL
	 oryCvEasO+xhDtoLyaXa4MJDJKSqNli0+F+YOLrTv66kmAzq9UD2LWNKUpHl0nAUyqcRz
	 Q09BU3ShCDA5DUBYNaYOoiBjKm7+0zVU1N1x5kaJq3uGiyMyGzJRsjSxYSY0ubYkzdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=vwbZ+Nwg;
	arc=none smtp.remote-ip=91.218.175.193
Received: from mta0.migadu.com (out-193.mta0.migadu.com [91.218.175.193])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56112606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:42:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56112606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=vwbZ+Nwg
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=bZtBvinsgmcBuYbclGCAtOqwtIrHaxa1lk4yhGjUGzE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795682571; v=1; x=1796287371;
 b=vwbZ+NwgKtofGWDJSXpHSm2L5nhwGB5h3d7KeTHtX8gjKn+l+/scVcGM/xUk8qE0sf9Z2VQq
 ZPwlpde/yYw1CJhvPCJM4WifWPBGO7Cwweue70NbRphmwBqQVKVCfhEs5S3LdOqXicsTCW2KilK
 miCQcZFtzAk47YDIbUM1oLC8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c159467d56aa4bf8;
	Thu, 26 Nov 2026 08:42:51 +0000
X-Mizu-Trace-ID: c159467d56aa4bf8
X-Migadu-Flow: FLOW_OUT
From: Zqiang <qiang.zhang@linux.dev>
To: dave@stgolabs.net,
	paulmck@kernel.org,
	josh@joshtriplett.org,
	jfern@kernel.org
Cc: linux-kernel@vger.kernel.org,
	qiang.zhang@linux.dev
Subject: [PATCH] locktorture: Invoke synchronize_rcu() before rcu_barrier() in chain cleanup phase
Date: Thu, 26 Nov 2026 16:42:49 +0800
Message-Id: <20261126084249.17746-1-qiang.zhang@linux.dev>
X-Mailer: git-send-email 2.17.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

A currently-executing chain callback can read the old crc_stop=false and
re-enqueues itself via call_rcu() only after rcu_barrier() has been
inserted barrier callback. the late callback is invisible to rcu_barrier(),
so kfree() races with loading the freed crcp->crc_stop:

          CPUA                                        CPUB
call_rcu_chain_cleanup()                         rcu callback run:
                                                 call_rcu_chain_cb()
                                                 ->smp_load_acquire(crc_stop) is false

->smp_store_release(crc_stop, true)
->rcu_barrier() start

                                                 ->call_rcu() after rcu_barrier() start
                                                 and rcu_barrier() miss this rcu callback

->rcu_barrier() return
kfree(chain_list)
                                                 call_rcu_chain_cb() run again and
                                                 load crcp->crc_stop //UAF

This commit add a synchronize_rcu() between the flag store and rcu_barrier(),
it makes crcp->crc_stop visible on all CPUs once the RCU grace period has
elapsed and also wait any in-flight rcu callback to re-enqueue before it
completes. so rcu_barrier() can see and waits for that last callback complete
before kfree().

Signed-off-by: Zqiang <qiang.zhang@linux.dev>
---
 kernel/locking/locktorture.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/locking/locktorture.c b/kernel/locking/locktorture.c
index e618bcf75e2d..665fa79c93e6 100644
--- a/kernel/locking/locktorture.c
+++ b/kernel/locking/locktorture.c
@@ -1148,6 +1148,7 @@ static void call_rcu_chain_cleanup(void)
 		return;
 	for (i = 0; i < call_rcu_chains; i++)
 		smp_store_release(&call_rcu_chain_list[i].crc_stop, true);
+	synchronize_rcu();
 	rcu_barrier();
 	kfree(call_rcu_chain_list);
 	call_rcu_chain_list = NULL;
-- 
2.17.1

