Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795511593;
	b=UOBhYwoHQRNjegPT7TYuvMBjCsowprkLIuhCqk090X1E/YriiMNBkxvqjPbx0+TDl+gH
	 KGNsy5qp6QBGvMNMjoI5uUhoIsHVcGICBovbBHpqyS4MWu3CJ3qSG/uj9tIWe0C1yybL4
	 U16t1UPXJ6yO56c+WPw2ocqAH9IgG60CtvXRZVInISgP32xwMEtIBBArtOz4jg3YyUxQ+
	 LUjAqEgBvXTHhqve42rGGd2Ifw3PF4cnivb5caNVFw9so8Y9/0fv44+rFJhGGnTzFauEG
	 eUid3VmYHAADk8zyxuX+px8Vn5FHvylVaAL4cfA3GosM/j9hq7JIJgE/GBvRnXe56Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795511593;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=285F8rEC74nMX2FnbEwp9EQ7OPlK3L+w9+JpHnSwueo=;
	b=JYEw4fzk+khnxBicvcAqDQQegGbgTB+MGRnNfA3RNEGfC/dQCbSwluDMuOq9wfTRAS/0
	 VTsVA7F9nQ+FDUr3dx98PxB+UXKunpeVxO6ISouQQiN5edQU+I2rB9wR8P9A59WIdwn0g
	 do/EgqglI/KKCc58Z0lmiAe/uZrINC4al1fggEYxrDfGmsk0oraunVz/orwxV8kFmUSDx
	 03jkmhoXISy5fbsu605mepFeJj3BfRrGBbK+aG9IGwdM4XPc6FATSkSfmrM52q/k5D3nZ
	 tsD1tdyqXEa5BpK2xMfk1o0yFYd6oAzhmlHZMrg2wNfb8RjLM619Y6peNsUfV+ScBtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CrvWKLZT;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5015B606A322
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:13:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5015B606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CrvWKLZT
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so4042781f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795511592; x=1796116392; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=285F8rEC74nMX2FnbEwp9EQ7OPlK3L+w9+JpHnSwueo=;
        b=CrvWKLZTMDbHqKh/5iyDZV9KoZQJgBoBEFMe6sOBH30S6/GroRWa4jAP/zBH5eU/JZ
         SkwQQITeMoXrcZGsPuZFKxcXu0abYnZaKrObFXphGm0+56lDdEboBu88TqNT0N4m+66m
         mkZlHi7HOFpztGROVA3zbQU4P37H5hAD9Bb7bYOCbu51IYbOOWjORO8rdhJjcxlrBsVt
         u1sAbqtlznvoxYKgxdlud2+UlTnlTfPVmMobd+0d85uDFln7TbY36Mku+mGT7gpwuxSq
         uOyaXspgVNG14PrMIQpconkRdZzFqnNh7JlFqblXOF1AGHcry1FONzMcWs0G2zyU6E50
         KLDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795511592; x=1796116392;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=285F8rEC74nMX2FnbEwp9EQ7OPlK3L+w9+JpHnSwueo=;
        b=XxeR8i4rJV2v/nCvuNP2A+wSt5yhUhsW6YcIMk2iR3bqLgu6EoU/ZVBDLaZsC43Bhk
         eSS3XiESjW28w68jbDnkLPFnagE1Xg7mCI3AyOXB3iCXtcdx9c5VStsoPlNSVEkjXZFv
         GRi8HwE9eexeexfvbGt7lX6pWhsd15/9tQTwtu+NTwhfXiGgEYy1TFu+3ocWqGx7yjpn
         uUv4bjQsP0k2T/VNCdDrvb6qumrMGFKZm9AcZ1AndwbZrSUqjcKACNMGiOEtQXSIP7uC
         pKftQYDjZTYc4l02j+RU5Aq8ZOOEEQ5wsG77vhVqEMKsjRO6TPx82SIp9Mt1G0jJxOHu
         OS3g==
X-Forwarded-Encrypted: i=1; AL+hErH0JBl4/rc3Moq96MhMscUS1ziuXskMFUwi/D/hrAp5R6uqbE88QtJPq2pVCKJYeX50mwMU22EUVWp5kOs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MJi/ifKwlPG/QyV72xoOctGtM0/Key/rHZOxhDLLmtpIHjuG5
	zAa3t57P3PaTVyILChVlePYyBYa4urGbqgEVvo5fusXbSbOaeBoVsZwV
X-Gm-Gg: AZFdTZerZlfcHvhEq7XpvCncYaihm743rlV0K+sKUQZ0Hz9PKjFuQekWp5dhi8IfZ67
	vgr55u4zf36nxYV/ivPay3JsekJjwt8w7/x2ozWcmQH5HbcPCjwnzW30PvnKXM7CAXoKsUKXlC7
	5wApa1N20z5ECXmPk3u21wZZNEjrx20Q5CDBP+7DWbiUAPu2j+nTZP7msLuiCQQSg8T3hdlYc5j
	GGFUsSyqNhT1tive3Ur8XC4LxGvjrsRSi6n/xPZQ4PjwD+1pV+l556G7Afs9euQhgh2NRFjblGx
	//x3C3akG187SYNHo5FeR91DFF2KHY/FUMnxcmyk41ywatNsaelRr/zysFAFKN+NxO6eIn28y6F
	jv+8ICvRhPkEIkS7A0KxZI7cmZeWdJe0qU5zn3GAakAlaBBGRdfSWr0q+k4drtOmLIu1OTqsDDo
	WVjdOw2B8iLjnWdDiQMHC5YnHMKchzTykREcp0jtHpncHH/pPJ+mKuZk1XSYnBdmn1d+udeqDO6
	+4i1oDyGxShiCna+pLQwhVIr/bdmoti+0EGGIquba5qRkWRlgoYCMp3dYJn2RF61fPrARu8kXeq
	fFwo4PNWZWwrPCveYDReJmRRBHovZGo=
X-Received: by 2002:a05:6000:4705:b0:4a9:3fba:5eef with SMTP id ffacd0b85a97d-4abb5db6cd8mr25609288f8f.24.1795511591322;
        Tue, 24 Nov 2026 01:13:11 -0800 (PST)
Received: from thinkpad.lan ([2a06:c701:4770:2100:9c14:8a7c:ec54:34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa397asm27559136f8f.48.2026.11.24.01.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 01:13:10 -0800 (PST)
From: Avi Weiss <thnkslprpt@gmail.com>
To: mhiramat@kernel.org,
	oleg@redhat.com,
	peterz@infradead.org
Cc: andrii@kernel.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH v2] uprobes: avoid postponing return-probe SRCU lease expiration
Date: Tue, 24 Nov 2026 11:12:52 +0200
Message-ID: <20261124091252.567037-1-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

prepare_uretprobe() reprograms the per-task return-instance timer on every
successfully installed return probe. If a traced outer function remains
active while nested traced calls arrive more frequently than the timeout,
the shared timer keeps moving forward and the outer instance can hold its
SRCU read-side lease indefinitely. This delays unrelated synchronous uprobe
unregister operations that wait for the same SRCU grace period.

Keep the first pending expiry by arming the per-task timer only when it is
not pending. prepare_uretprobe() is the only rearming producer for the
current task's timer. Order return-instance publication before the pending
check, and order the timer core's detach before the callback reads the
return-instance list. These full barriers prevent both sides from missing
an instance at the expiry boundary.

Fixes: dd1a7567784e ("uprobes: SRCU-protect uretprobe lifetime (with timeout)")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
v2:
 - use timer_pending() and add_timer() for the per-task single producer
 - explain the actual store/load ordering for the full barriers

 kernel/events/uprobes.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
index caf444762a27..838e0080ae1b 100644
--- a/kernel/events/uprobes.c
+++ b/kernel/events/uprobes.c
@@ -2052,6 +2052,13 @@ static void ri_timer(struct timer_list *timer)
 	 */
 	raw_write_seqcount_begin(&utask->ri_seqcount);
 
+	/*
+	 * expire_timers() calls detach_timer() before invoking us.
+	 * Order its pending-state store before loading return_instances.
+	 * A publisher that saw the timer pending must be visible here.
+	 */
+	smp_mb();
+
 	for_each_ret_instance_rcu(ri, utask->return_instances)
 		hprobe_expire(&ri->hprobe, false);
 
@@ -2304,7 +2311,16 @@ static void prepare_uretprobe(struct uprobe *uprobe, struct pt_regs *regs,
 	ri->next = utask->return_instances;
 	rcu_assign_pointer(utask->return_instances, ri);
 
-	mod_timer(&utask->ri_timer, jiffies + RI_TIMER_PERIOD);
+	/*
+	 * Order the return-instance store before timer_pending() loads
+	 * the pending state. Either the callback sees this instance or
+	 * we rearm the timer.
+	 */
+	smp_mb();
+	if (!timer_pending(&utask->ri_timer)) {
+		utask->ri_timer.expires = jiffies + RI_TIMER_PERIOD;
+		add_timer(&utask->ri_timer);
+	}
 
 	return;
 free:

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
