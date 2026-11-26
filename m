Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795711241;
	b=1V6+zVgYoPhKvn6xtHSzEDa+QoVwoyIM1V/9jLalxliV/Di0i1bmq0oVd8isgSiFdtwG
	 YM4vBynLmCOOnFDKMOOdlvIgOX4Mcfzy4ruxF6Ubct4PJ4dQMdqYyvm/9YF1g+ZF7XSRr
	 oq8rtSBMRMT8Sh7T3zcmTnyy0k9fkDvkxmfi3X6aJKxgC46YT586QBGm5AnrWXAHM8YTW
	 51R8SfQgy3VFi9SX1rySTMGUUrNCxqem2zMEirs+QhMWu4B2y7mcV4JhCp1t2rZw/nw9B
	 c27mH1rJN7GxofFJtF+LP6tqMd35GvQxOHnRjxrJU8Ps+AX3TwmjCY8r7OTY9u5ykag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795711241;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=M2EdbVsFY+9G2zM8yUV2c1OY9TmmPOalQL86zS3ZJK4=;
	b=ZROagFzT085y+ofk/x8/xCJdaPWOhNHkq4efQaleOAQfZuUKYgOBsrUafi+a7rEmf7hh
	 6t2xZkZnOPVlAsikguD79YlfgqSgqpj4JJi6nBp0ooxs0IEDqfWWtXXs6GshukESeO9f4
	 E2d3CsvP3GipGTk36qqF6ObPhids6a1ZfGZLg/JgbsEhc6oaTpR6+ESmxe7/BP3mq8Dh6
	 QgikfwIjUr3BfjQRjn16Vcaqb2gl81NvBUk/iZ2MzTMkA5P6gXxmLIzwyJzXkS0lEx1IP
	 lbqXr2bMcYMfCmwLcolpRkDFm7vwB7/lj7uTxlxLGKnj+gXJN5qG2pUdOd4pqE3lwaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=E6Qeu9vx;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3026606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:40:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3026606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=E6Qeu9vx
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bba5e17728so19148685e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795711239; x=1796316039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M2EdbVsFY+9G2zM8yUV2c1OY9TmmPOalQL86zS3ZJK4=;
        b=E6Qeu9vxktnPKCW8eViY7vJXZ/s/CIR4yLUikeahokIpNDShfGo9Q0BA5F7HDS/mRY
         hM9uRc1ZrrdKROgO1ffOyr1khVHc15Mmg1LKaiYO09vA9URNrTi7W1q1ach7zntkjy88
         qDBAz27wpuHwUNXOecV9h+Je7Hz84V1/xyROre6CVTV3iMnZoDonubN8xqKGIai5vrsK
         ZOusmtibGkXG01FYsMHdcjv2KFcf3qy1/ZYtfhIJbTGyC455k4jQO7zzu7/IjuhaPE6G
         qsp1kKyhk5fiXfqm4WqiE4MZTbBN9U3XVjZu5nLn36AUNSk61DQQKe0/bQGuA0wzgoOF
         H/8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795711239; x=1796316039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M2EdbVsFY+9G2zM8yUV2c1OY9TmmPOalQL86zS3ZJK4=;
        b=KON1e63nR3nT7PbLmMpjDfvb709nVg2onstzr90U/trEOgZ35NxXftWFoVmbI7eqpC
         +/6Vc1QOgQUr0yOxZs+6x+rsqF2aMsVUdTJ8K1XiJ50ebo/OJIbCZSS5vlSae3uXxd/4
         DL8cLUD+HKOEntaxXD2Ls0p/oOQSx4gDV31RqmR2F9oaZ03HMK1ACYKfEqYthrTMbTH8
         4REM3C2WMov/sXz7gQ2hWuNvRDCULbBX95dOHMychZw6P0p92FO/bp6ZJ3Pw9YWfRaVg
         Ygto4tKSgjOJ9iK1M4WACDiAFpfSUokGe3GPcFjzbVnguxVoXXRlzKIsgB2EMPLoI2tJ
         933Q==
X-Forwarded-Encrypted: i=1; AL+hErGUjr78X2BDL02+4fQtMNVBPjqA/TFwmk5xmLNktl5209EoBBkZfuiK6MXtUkIGvxGy9FP6P0jrxTb86Kg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+iAkIdsFZFYMbAdhCR2KaOaZyIuH2aW1z5REK4FBEbZzYrj6ir
	ooeUMM6eXsYGXqZfDMJws77Ihugt0xd1g6afa+8wvn2yHfq5oe+PUFAoPOvDXGitY08=
X-Gm-Gg: AZFdTZdsKwWmpwL1pIkxPw+hwNIh/RdXy3csPVpuAKvnD5i5xmX1GEYqxmQAraI9Caa
	uz7TcWmBsVp4ucT6sGMvoOXSCuwc4yzqRZKGEgjpDpBDeoARAOOhECWWVRnsoHAshT3SEEl9PxQ
	87aEdMeD50kMSdkOq5nOK8JJq38tztUW/T1/hjthqz5xTsTxL3fXYeF/e3klLdaVY8a3J/U+yD0
	2GOR2PJ7NIIVxhNoyYHN6Zyp2BDkr9o4Qs1fpjLXHrHoixmrVx92Bc/mbyN5Pr60uVfgH/r8u1W
	FBACy+tClBER0OFJFAZf0ZX0eiYKhSQtYoxik4ZsoniJh89iYNDgWtrdCL9uv8x8FQD9VEdO1T0
	SxMThHcHP+p4vyfGYsO7GN08Rge4JqL9A3TxlbhdFbVsCIdyaGlciZqE536fxNmtVVIJDj0fur0
	DONvEDfGAShebz12eOPuFs0X/SBAd1wJkOgsDNTCryOQ1b/Gbbm96sEk/9pjV65RMR9rslBc15+
	ptGzUoLchGtDMlRkUxt0S7ovFon5FvNuD/1ZeyAs2u5BYuDY2MdfJA83uVLP2mXQjZGntwMsxAh
	dPwN/jnch9DH7cdYbg6XbNTlPd0V4AL9Mj9nriTYtJstTdIZgqpC+7/YFNqB+lR7s8c=
X-Received: by 2002:a05:600c:6708:b0:4ba:7e6:53d6 with SMTP id 5b1f17b1804b1-4bb88940848mr385091835e9.33.1795711239273;
        Thu, 26 Nov 2026 08:40:39 -0800 (PST)
Received: from vingu-cube.home ([2a01:e0a:11f4:3020:734a:cabe:eb62:d0c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865b1sm624354785e9.5.2026.11.26.08.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:40:38 -0800 (PST)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH] sched/fair: Use task_delayed everywhere in __dequeue_task()
Date: Thu, 26 Nov 2026 17:40:36 +0100
Message-ID: <20261126164036.1938852-1-vincent.guittot@linaro.org>
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
Content-Transfer-Encoding: 8bit

Reuse task_delayed instead of checking flags bit

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 kernel/sched/fair.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 731d78155e65..942140247f76 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -8354,7 +8354,7 @@ static bool __dequeue_task(struct rq *rq, struct task_struct *p, int flags)
 	update_curr_eevdf(cfs_rq);
 	update_entity_lag(cfs_rq, se);
 
-	if (flags & DEQUEUE_DELAYED) {
+	if (task_delayed) {
 		WARN_ON_ONCE(!se->sched_delayed);
 	} else {
 		bool delay = task_sleep;
-- 
2.53.0

