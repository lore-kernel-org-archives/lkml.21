Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794991958;
	b=2SUC8PWiDI2LiyW0q08vmCwKkMi8AeMekd6dpQVzUGCDRrtI58AwIAXs17zluV8FefWH
	 5PDvz1/srx2d1LFqYtA7Ts7zrm+jFqKjKdJBBDgGVLzHtnN67d/K+MURcREFEt1YfV0nj
	 lUtNGKfLYeJEQPiB5EAvYu7lIaha3IgrJDKy2RGEHl83uRW50xi50EGqEV7ciZKfqG6LA
	 6UpboDngqZsLbm6bPLbwgUugE1JAzzqApjYcOQoBorfuflTQj7LTPsU7Grta9DLcA0s+Q
	 kr8f7lsAaUD3oIIBwuW4VKmqJzEureBUg1PhXh5uHjnPoP/YJ4yrPaJlj9XaifO5b7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991958;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cmclyy+oqh2tP8YaWR+pfirFW50GH14lOaNjbDPN0Cw=;
	b=igCLP6ijaNrfgqEXPckqNQmh1B5OURVvO498WAYTlvw+Cvr2afVa4YHMjIJmFhF7qClr
	 RId5pLTOkt/bbSIQpsCzqABIx3Y8QshuxBfD9Va9Ie3yISqMpk2Ty2nAPnPCxiUAEgmvw
	 uR9ix6wTKWFqWOAALRiF7OhH6SCBJcT5j36Nq0MWE8Mtfw1srcj5yHQm7ya2XmEdd+azw
	 iuuuf7oAvPluvWOdTXo0YKxFrpuW8YSwJWv71sWiIB7mL7tIe1T7pov5Lm+RW2Bk9530u
	 SVKKqchuksI+MY78EefB+QfMRpVABCCLsWwq+jLZgUT17PGzsBfkEJuge6bT6e0ZVQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XAp6m8pL;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE822606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:52:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE822606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XAp6m8pL
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c50d3ac6b51so364942766b.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794991956; x=1795596756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cmclyy+oqh2tP8YaWR+pfirFW50GH14lOaNjbDPN0Cw=;
        b=XAp6m8pLBTS6qgDNHMFpn/BOdvNiOdHvPmkhQiUqH8Ik3NRAl6oD6JOt2mWcs4CZoK
         vY3jnYh+t5FIECZdNjztFz3Z0qCE5H4t4BCy1skNQyWTdWI28Y/g6Nb6z2OlIXE1FTY/
         zFKtGn1I3tyo+EOIepd9FBaacekCAuazEFdAI3DR3sWH5fMgp8FMdaLIb8qlvzK2DhyG
         LmMiAoNMA4NAsa0nM4Izh0ZlIStMJZxE4PK4RmEp7CzdeBclLRLpQCdGnU7ffLmM53+w
         f7l1em7fE3MiRusz+B6hizyk2nfHOQHO6HZVsiijZcxLxnEKxdo45yqp2zbAPQtH2XtP
         DU9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794991956; x=1795596756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cmclyy+oqh2tP8YaWR+pfirFW50GH14lOaNjbDPN0Cw=;
        b=UjM2iPS/2P1AE7RJziSA6K4YEnNkoKPO6wl6mo4x4hGi/wo1S3X6D/ldocyRoKbEzv
         AasExxH7bAR60e0w7o5Pb3CWu3WEdeZUrQTmgVLyuab43M13NKePNoYCUJwtuZGpKjPs
         dNeFb2e6jZtKMVmLRrY3DtCGfp02S1k9c1h5aXEJHnGN5AD9YxcYPxzsepkH1H0CSabO
         SK+gWPWsBuitxDvTkChAXo9Fu/cs/kNE95ENtOK2ty+aC4Zv3B2th5G2TtbieLuO0ytg
         BjunOppieHuV0W+204dc+T9q++oI1yct8EsmPDSEujrppPoBejIUvM7AHU/O1Ldz8NbA
         VAwg==
X-Forwarded-Encrypted: i=1; AL+hErHqpjRKU/ByjV+zRpPyD/HLzQZizs6OFv5zCfOSNqpe5dsNYcEByIxT3xrUV8yv6XpGss+04MRq+glchoo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bP6FVHgaBF6GCZ6ggQ9m66k7gpEhpvBvs2otc6e6tHAOkxSaR
	aS/JjeckcdeRxQioWFUgcQrFZIQ+IeeZi+B1LsRR7pIpM89F0QBngkHz
X-Gm-Gg: AYBFou11ZeCBluaS8IGnbdl1I+NRH7yaVKKkEbqgqKcGjlyf6C1qGAld15AvUw7TDB5
	6nkCcLLeDXNh21DReTmrgU22Wrufrbpe3IeQR0Rc6fx6z+m/oS82HKbGUEXW4PqvrWnBZLwj3lV
	nPoDCjsRcUKzmMG/w/9WbfdrCRlHhg9yym09IwfCF+SWxqk+3iGGy8P0QkfjgTCftMK9fWlPq++
	4p9mQDsFthny5116XZUHa2F8st8xzmXu/lNeqM+gQIwVopNJCclamfP2yAraxfbIf6frDFyLtH8
	f8UDL8VA1ESTQ3zfIgDVc4nAld4VTA9gVtxu/gTn3JSxRyEKy9BY28fb7BkQuFY3KP2NcrnMhAt
	y+3qB1aPm7rt98kYQ018Stwcd8pEJfowLtHEjuCaChguhOLCEixmn3XeRhZY/yRguSjUX4aWSs1
	AD96KohHfCmUuh5wllmKYGlreyEuiAW4euyXfxxTLGwh5u4/5iicTtIOnDcKcDzgYLHn3o58vz6
	Iy2bmh7RbXatWJu4YVnTKpjtNpdxAP/CposVMY0asYOUfd0q5ofl9RWXLIbOes/oXhrGOrevzzZ
	WT2QMWwWARiD1/vVadPOh+EH3Tk0iQ4WZP91
X-Received: by 2002:a17:907:6d11:b0:c49:8bf8:a7a7 with SMTP id a640c23a62f3a-c510e158af7mr146788466b.7.1794991955656;
        Wed, 18 Nov 2026 00:52:35 -0800 (PST)
Received: from kernel.. ([191.40.25.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c510c83f31csm71077266b.10.2026.11.18.00.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:52:35 -0800 (PST)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: dave@stgolabs.net,
	paulmck@kernel.org,
	josh@joshtriplett.org,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	joelagnelf@nvidia.com,
	boqun@kernel.org,
	urezki@gmail.com
Cc: rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	qiang.zhang@linux.dev,
	linux-kernel@vger.kernel.org,
	rcu@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>,
	Kunwu Chan <chentao@kylinos.cn>
Subject: [PATCH v2 5/7] rcutorture: Add KASAN aux-stack self-test
Date: Wed, 18 Nov 2026 16:51:45 +0800
Message-ID: <20261118085147.1668598-6-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118085147.1668598-1-kunwu.chan@gmail.com>
References: <20261118085147.1668598-1-kunwu.chan@gmail.com>
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

Add rcutorture.kasan_debug to queue and drain an empty callback,
then free and read its rcu_head to trigger a KASAN report.

Check "Last potentially related work creation:" for rcu_test_kasan()
and the enqueue path. The intentional report makes kvm.sh exit 3
(runtime errors), even if rcutorture prints SUCCESS.

Suggested-by: Paul E. McKenney <paulmck@kernel.org>
Suggested-by: Zqiang <qiang.zhang@linux.dev>
Cc: Kunwu Chan <kunwu.chan@gmail.com>
Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 .../admin-guide/kernel-parameters.txt         | 11 +++++
 kernel/rcu/rcutorture.c                       | 44 +++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index e3c5a6b68fc34..d88471dbdee40 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6257,6 +6257,17 @@ Kernel parameters
 			accurately, from a timer handler.  Not all RCU
 			flavors take kindly to this sort of thing.
 
+	rcutorture.kasan_debug= [KNL]
+			Enable an intentional KASAN use-after-free test of
+			callback enqueue-stack recording. Requires
+			CONFIG_KASAN_GENERIC and a torture flavor with
+			callback and barrier operations. Inspect "Last
+			potentially related work creation" in the report
+			for the enqueue stack. Disabled by default.
+			Use a dedicated test run: the report taints the
+			kernel and suppresses later KASAN reports unless
+			kasan_multi_shot is enabled.
+
 	rcutorture.leakpointer= [KNL]
 			Leak an RCU-protected pointer out of the reader.
 			This can of course result in splats, and is
diff --git a/kernel/rcu/rcutorture.c b/kernel/rcu/rcutorture.c
index 0e8366eb2efb5..5051ec0a853b9 100644
--- a/kernel/rcu/rcutorture.c
+++ b/kernel/rcu/rcutorture.c
@@ -112,6 +112,7 @@ torture_param(int, gp_poll_wi_exp, 128,
 		   "Wait interval for expedited polled grace periods, us (default 128 us)");
 torture_param(bool, gp_sync, false, "Use synchronous GP wait primitives");
 torture_param(int, irqreader, 1, "Allow RCU readers from irq handlers");
+torture_param(bool, kasan_debug, false, "Enable KASAN aux-stack call_rcu() testing");
 torture_param(int, leakpointer, 0, "Leak pointer dereferences from readers");
 torture_param(int, n_barrier_cbs, 0, "# of callbacks/kthreads for barrier testing");
 torture_param(int, n_up_down, 32, "# of concurrent up/down hrtimer-based RCU readers");
@@ -4639,6 +4640,46 @@ static void rcu_test_debug_objects(void)
 	kfree(rhp);
 }
 
+/*
+ * Trigger a KASAN use-after-free report after draining a callback. Check
+ * "Last potentially related work creation" for the callback enqueue stack.
+ */
+static noinline void rcu_test_kasan(void)
+{
+	struct rcu_head *rhp;
+
+	if (!IS_ENABLED(CONFIG_KASAN_GENERIC)) {
+		pr_alert("%s: !CONFIG_KASAN_GENERIC, not testing KASAN aux stack call_%s()\n",
+			 KBUILD_MODNAME, cur_ops->name);
+		return;
+	}
+
+	if (!cur_ops->call || !cur_ops->cb_barrier) {
+		pr_alert("%s: %s has no callback/barrier ops, skipping KASAN test\n",
+			 KBUILD_MODNAME, cur_ops->name);
+		return;
+	}
+
+	rhp = kmalloc_obj(*rhp);
+	if (!rhp) {
+		pr_alert("%s: KASAN aux-stack test skipped: allocation failed\n", KBUILD_MODNAME);
+		return;
+	}
+
+	pr_alert("%s: WARN: KASAN aux-stack call_%s() test starting.\n",
+		 KBUILD_MODNAME, cur_ops->name);
+
+	/* Keep the rcu_head allocated until all callbacks have completed. */
+	cur_ops->call(rhp, rcu_torture_leak_cb);
+	cur_ops->cb_barrier();
+
+	kfree(rhp);
+	/* Intentional use-after-free to display the recorded enqueue stack. */
+	(void)READ_ONCE(*(u8 *)rhp);
+	pr_alert("%s: WARN: KASAN aux-stack call_%s() test complete.\n",
+		 KBUILD_MODNAME, cur_ops->name);
+}
+
 static void rcutorture_sync(void)
 {
 	static unsigned long n;
@@ -5198,6 +5239,9 @@ rcu_torture_init(void)
 	if (object_debug)
 		rcu_test_debug_objects();
 
+	if (kasan_debug)
+		rcu_test_kasan();
+
 	if (cur_ops->gp_slow_register && !WARN_ON_ONCE(!cur_ops->gp_slow_unregister))
 		cur_ops->gp_slow_register(&rcu_fwd_cb_nodelay);
 
-- 
2.43.0

