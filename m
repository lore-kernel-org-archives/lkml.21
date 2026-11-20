Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168704;
	b=n4s5aGkYnw1ew1wrK6+3mVMHe2n3bcBBsmS6JiK+PwlIZCF7VFO/QzhjPj80p4iP49mt
	 mRR2jCH3GeIAvil9Sl8+PCg4X0z4CAyY7FkcfrHPBw2K6mkiYF79eZvNRcmhgpBTcGroB
	 joAezJZ3sX9BJ++tllKZZSdFLPcfN5w19rjG0RCTFSaFXleFVOWxxyzDS6gRe8pWotPI8
	 r2FauwFIQ30aNztfzQ7Roa58YR0z0YgCH+rzeb3eKTqZl6d6vtlETVtmxCPB4VFRcbiMK
	 gKmJf0BeqGf9hvOuSk1kCfM4mnKl96NwlMAwR4iZfhcEoAxDVPo3pUzDvNY4T3+xtzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168704;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zgnXQshQ0CpU+HjXdCJoDOKBcGPL5TKBdSPVf+HpHTI=;
	b=K7UU7qjlG63u7UsWeQ+MPSZ6B4fgWOr2g5+etIWL8AubgoQs+OUG0dlsbJ9D74ybHbFm
	 XzvRCYeG9elsgVfoumLNeazIxHKE9KCBcQdVahiW/iFFzdyGeZ3+wsRx73bQItHz9xT/2
	 WJynAeb1Iyt3iV+2BzpoMQUdxYI1FZHZHUEv/f4W8giLEZvrHGj7CndybTSwJSFB7+RzJ
	 npvUVE0ff4Wrb5amFCqhkEP65iYiazoJjSLfqckgLIN5xkCfUebBHGXuNfb1lEMt6PmuQ
	 6yd/De8PfGb5oswOD3iKeHpQN4VNaX4zGmz5sMAYD6zcglcHxKxBfNA3LYMb17WaSXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IEwovvp4;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAD1606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:58:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CAD1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IEwovvp4
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so14362455e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795168703; x=1795773503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zgnXQshQ0CpU+HjXdCJoDOKBcGPL5TKBdSPVf+HpHTI=;
        b=IEwovvp4xO3pjlemHunRSsGZBDW7Pj1I/FaDpkQR6fBv9EE/LjLegS3xIMiBwpGShB
         ydCXZKbG7ScA/LAGyzcxXFM6XwuGYTyOo7wPtjcM1Qp/S6FsTA/cZTBD3JzTYi78EyXQ
         D7G/0TRreae0cmrGgdhU7Pu1fUiz3VFVzmCOXY4iBR/7KAobz5aMA5xyjK1kZdcEDzG3
         cFJpZHp1w9ykBe290T2YfSIcqd/prcVM92gn5JtazxZYfLEal+vFFMu6DPDHNLatNx6e
         oVlAebF/t4QIDOLIu+ROBJB7hOxtvS7OyvqdIZ6Cl1AFL1KxYuDCA8TWm+pyYXxwNRk5
         CqrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795168703; x=1795773503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zgnXQshQ0CpU+HjXdCJoDOKBcGPL5TKBdSPVf+HpHTI=;
        b=brAw2Q80KxUI0rMv/iENy4YEbvhTjiPk6d1Yvb5vcLIDDHIFXosFko5qyJMoGgdj1D
         7bDga8u+OJ1C6EVPYiYHkI3OVTehax8cXuLqK294v/nK8z2xJ5t1M1vFKRrjIm7roGqc
         Tvj6XkCZa7VT6LjXipkGEHKPfnwPjjFWMmBK8/walm8IkV7TcWZnqJpVhkGEM+bVIKwM
         XV5/7elY14xGvvM6Op3hCdJ0GcFTWpExdpwUrcDuISpPqGOBD0Kh1OyQs2WWE5J6cNlO
         97jCFNm7nsmAMu/yRQ7Ob0qHUXVWhWgeCqqlJmzdFgpyXrSk853c0R1hBX5vKGrYFJE4
         CLyA==
X-Forwarded-Encrypted: i=1; AL+hErGakMHJw36GyjL9uizG+YXia6hNu+zjKi4D3vwBss0MYHi780g/LLH/sH57VobuG2t6+HN3SQyJsAyEA74=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LoQw+X7mH4B3MS6aRMhofWVxhRmMsBPpfLItTJkwc008DYt8z
	Rwf/X5gqN1LzTS9HV3GJ2jey8mGSpLZpGgK5NdBV4q9WL/ZqyUfikP+tOVUoROvGuHg=
X-Gm-Gg: AYBFou0LE5TDAQ6avas1fQ39xneZm/iUKQQJTNLXbQDwCcHZYNYnp/Whj1SkTVqPw/y
	6z8aCNOO+luBGPZ/Yl7/0TZ/BNUxSNXK5pCZ4zaYpG/2DNrH9KNt3o7rlqBoLKQqfKhq7wwtV7y
	msMyiNZ/FyTd+EAjpEsxWfcE0Yb55xk6ivL2Xp15cuzC83cezkFkMqz7sS/LMUw2G5uDABjU3/2
	zJxwzPC44INSMnKXjzqK074mdOTExizEH7Yp/F5z9w8OQOlyQE7jSGCHZoS+U2eXMkGhQvLAEq+
	Is8rHMJy3d9x5XmeEQLHYrEocv85wFcBIWJnljfkw5Z6vWVsoJlVnlWZ/Pm+lWEpm7vacFaqEkl
	yC+2quesE/jy9svTmkg1Xj+xfSRmA180BH7V+QUsMJLKuHlPDAnSWnHmka1E7uDqbjxh7yU2gU5
	/wudcEmB7N471F9K1Ctw2ADMQzgMwwOfoXapQqhhDY7Qh11T4fD5tJdt0iE6rRius4OFXr9C0GO
	37MEJFBJx5geD2jlCGon/rtXtqr3lh1BCfggqQXnCY4g89SBmegnmVJYviQSpwVoP6cpYoshhqA
	IPtxFq54a1xCKSgqfc5qMKq0gYu6zG6CvDcW56lXkju87A==
X-Received: by 2002:a05:600c:4313:b0:4bb:643e:3b8a with SMTP id 5b1f17b1804b1-4bb86162fc5mr60842105e9.17.1795168702815;
        Fri, 20 Nov 2026 01:58:22 -0800 (PST)
Received: from vingu-cube.home ([2a01:e0a:11f4:3020:15f5:896a:6ea6:98e2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm4652733f8f.16.2026.11.20.01.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:58:22 -0800 (PST)
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
Subject: [PATCH] sched/fair: Always clear se->exec_start when migrated
Date: Fri, 20 Nov 2026 10:58:19 +0100
Message-ID: <20261120095819.1009260-1-vincent.guittot@linaro.org>
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

Make sure that se->exec_start is always cleared when task migrates even
when migrating on a throttled cfs.

And remove useless clear of group_entities which can't migrate

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 kernel/sched/fair.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 942140247f76..4e2674bc5c32 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -6555,10 +6555,6 @@ enqueue_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
 
 	account_entity_enqueue(cfs_rq, se);
 
-	/* Entity has migrated, no longer consider this task hot */
-	if (flags & ENQUEUE_MIGRATED)
-		se->exec_start = 0;
-
 	check_schedstat_required();
 	update_stats_enqueue_fair(cfs_rq, se, flags);
 	se->on_rq = 1;
@@ -8214,6 +8210,10 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 	unsigned long weight;
 	bool curr;
 
+	/* Always clear exec_start when task migrated even for throttled one */
+	if (flags & ENQUEUE_MIGRATED)
+		se->exec_start = 0;
+
 	if (task_is_throttled(p) && enqueue_throttled_task(p))
 		return;
 
-- 
2.53.0

