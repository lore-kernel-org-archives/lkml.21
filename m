Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.59
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169104;
	b=xpLJyEBoi9FDaDCAqBNh7DryNAyoD8H99TACOndLzwgRqKigqMrss//WCQjlpSEaitmH
	 yYVAtdY5Vc2/qpt1JIxtKQeS+HSWWtbt7qLGdOKprlN2kYJbicnu0s1aFKQ4f9rg6tCPS
	 lQA8K0cndPIlIglY8AbMdPj5z/aAbdkoo3Vd2lTGEYSv286ohFMXsECRiU9v1tUF09BhV
	 t8RiNQZkCN/OCXX3DKIhlIoln1fBJvJMxuGnDP/zP0MZjuEXcm4JiH9KGt3SpCnhZumnt
	 wX716GBnNKDYptdjS7egjPrRjfR8YBPtl0IURjqsZ8rqWrxrWzPiMK3Hm0mxWeXV72A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169104;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References;
	bh=RaxUZwMbs/h7cStttKdJwrH2mj/qg7rMXMZvAWgBnDs=;
	b=ADgN18IHdDPpu3lissidxn+PZbtkalp+fSD2EWFaB0YpdO4nx0F8JBHycEq8aaSFm8/Q
	 P2YjoXv4i6UElu8SjicQOgZE6M/Vf+wJ52kQrN4TrwnRIpTB/D8laRB6yxFzg6ZRTmmOf
	 wTkLWkYJuPLwTpv4nF4ebpUiwt3ZN3Dg6brg7vgp32p/s6QOiuw4/zJTNc4zFGyWf07ld
	 KCi4UZe028y+XHyWXw2F/WCM8lBOz1kHV8Tiadw9UgaRQ6CIqjM5cKTpZ9Hh79lpGxuvz
	 Uk6Sr0hay5cm1Kq8ns9GpJses7Ebl6eWJC39q5ytIRNnS9T3/aB+unTdMDbo3KFgeHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Mlg29YXd;
	arc=none smtp.remote-ip=91.218.175.59
Received: from mta0.migadu.com (out-59.mta0.migadu.com [91.218.175.59])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8002D606A334
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:05:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8002D606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Mlg29YXd
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=rZ/Wh3xREIn2/ObBRXw1iD78to3V0fSS7UBZnBWLqkc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795169101; v=1; x=1795773901;
 b=Mlg29YXdrrn9nVjXE+QUtPsqtz9GCbRrBngq+QYw1MPmiL0cpxDYkYhcNRqHBHWatZEgBGZU
 oXKzJbCc2SuG7deqb/cWZ0F9JNyncgqGo+UX0QufIMaJSXEp/Av2SMJdbBQj521PxVd27bhfTs2
 UjWHJ0lUSbn3FLD+XMM+I9Rs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id fc52afd8f0ad6ff5;
	Fri, 20 Nov 2026 10:05:01 +0000
X-Mizu-Trace-ID: fc52afd8f0ad6ff5
X-Migadu-Flow: FLOW_OUT
From: Zqiang <qiang.zhang@linux.dev>
To: paulmck@kernel.org,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	joelagnelf@nvidia.com,
	urezki@gmail.com,
	boqun@kernel.org
Cc: qiang.zhang@linux.dev,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rcuscale: Handle cur_ops->init() failures for srcu testing
Date: Fri, 20 Nov 2026 18:04:51 +0800
Message-Id: <20261120100453.5826-2-qiang.zhang@linux.dev>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261120100453.5826-1-qiang.zhang@linux.dev>
References: <20261120100453.5826-1-qiang.zhang@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The init_srcu_struct() and init_srcu_struct_atomic() can fail, but rcuscale
ignored their return values, proceeding to run the test on an uninitialized
srcu_struct and to invoke cleanup_srcu_struct() on it during unwind. this
will cause kernel panic.

This commit make the rcu_scale_ops->init() return bool, check the return
values, reset srcu_ctlp to NULL on failure so that the cleanup path skips
cleanup_srcu_struct(), and return -ENOMEM when cur_ops->init() fails.

Signed-off-by: Zqiang <qiang.zhang@linux.dev>
---
 kernel/rcu/rcuscale.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/kernel/rcu/rcuscale.c b/kernel/rcu/rcuscale.c
index 5659eaebc5c0..e5722322a69c 100644
--- a/kernel/rcu/rcuscale.c
+++ b/kernel/rcu/rcuscale.c
@@ -147,7 +147,7 @@ static unsigned long b_rcu_gp_test_finished;
 
 struct rcu_scale_ops {
 	int ptype;
-	void (*init)(void);
+	bool (*init)(void);
 	void (*cleanup)(void);
 	int (*readlock)(void);
 	void (*readunlock)(int idx);
@@ -185,8 +185,9 @@ static unsigned long __maybe_unused rcu_no_completed(void)
 	return 0;
 }
 
-static void rcu_sync_scale_init(void)
+static bool rcu_sync_scale_init(void)
 {
+	return true;
 }
 
 static struct rcu_scale_ops rcu_ops = {
@@ -269,15 +270,21 @@ static struct rcu_scale_ops srcu_ops = {
 
 static struct srcu_struct srcud;
 
-static void srcu_sync_scale_init(void)
+static bool srcu_sync_scale_init(void)
 {
 	srcu_ctlp = &srcud;
-	init_srcu_struct(srcu_ctlp);
+	if (init_srcu_struct(srcu_ctlp)) {
+		srcu_ctlp = NULL;
+		return false;
+	}
+
+	return true;
 }
 
 static void srcu_sync_scale_cleanup(void)
 {
-	cleanup_srcu_struct(srcu_ctlp);
+	if (srcu_ctlp)
+		cleanup_srcu_struct(srcu_ctlp);
 }
 
 static struct rcu_scale_ops srcud_ops = {
@@ -314,10 +321,15 @@ static void srcu_scale_atomic_synchronize(void)
 	synchronize_srcu_atomic(srcu_ctlp);
 }
 
-static void srcu_atomic_scale_init(void)
+static bool srcu_atomic_scale_init(void)
 {
 	srcu_ctlp = &srcua;
-	init_srcu_struct_atomic(srcu_ctlp);
+	if (init_srcu_struct_atomic(srcu_ctlp)) {
+		srcu_ctlp = NULL;
+		return false;
+	}
+
+	return true;
 }
 
 static struct rcu_scale_ops srcua_ops = {
@@ -1162,7 +1174,10 @@ rcu_scale_init(void)
 		goto unwind;
 	}
 	if (cur_ops->init)
-		cur_ops->init();
+		if (!cur_ops->init()) {
+			firsterr = -ENOMEM;
+			goto unwind;
+		}
 
 	if (cur_ops->rso_gp_kthread) {
 		kthread_tp = cur_ops->rso_gp_kthread();
-- 
2.17.1

