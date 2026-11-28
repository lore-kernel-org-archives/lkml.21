Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795876070;
	b=YNZCjJKlGCWkitFDTgDaq8Nvpd3z27SglLpNmdXbNhuzhmemnikxrF2zJ+BhWmehAKKU
	 EeeXxTo7R1uksq7Gu5EF7uTP70NW7R8t2CvBu9Jr+evaKTPh2PrgSftxzICiv7h+ztLb5
	 fwxC9kaXNdZScbZF1PYsZVokG0mU4m4zuVP+XajA2owZHeucxiteAKHomWQv1eqCCNYxL
	 c9FhWSQvxoc+LKkJV97lMgXaO9yjQGUOOvbB6g4iuGUNRbwdb4XxbxwbvOMktR25ucFLd
	 uxNqgWZn35vDTCfektsAL91GYbxZSWzaYc8LOEC5JscVoxKJr2AL1RimRbT2Y28cM8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795876070;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=n9+cWHs/s6hq8awQiXEdJpxL4GfKRDZ6oL3qwXcRcr8=;
	b=s6/49CDJB2INhngp2ThIsIDSHmBY6djojtzwfnMClxbqeyrVCS1vN0W/ONJh/RWvOMRM
	 X4V0c9gSZ43P+rr2ucB7s3/AzKHlKtHiQArL6G34Yfzaq2ySZPL3Olaqcoy9s9HOqlY31
	 eLhF1kKqxsFo1lL8NFkz6zHyR/63cKyzf4E+crq+tRoklCmE68EcDZTB2OriFXWGDEN2r
	 EpyZvFY8EgF+t3LzCf4pUP8daUyfOx3hJWx6bjW2VlWgS8KoJBJUt6IdRf4fEMi5sxAiN
	 thkfUkajx+hcAAxIi30DxQ5Mn++6eQ2AriLRG6LvKOOF1E2KQlAjOpZIUdo3niZ7nGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AEsEeHVH;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101F2606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 14:27:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 101F2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AEsEeHVH
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b4bd3d98bfso11098077a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 06:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795876068; x=1796480868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n9+cWHs/s6hq8awQiXEdJpxL4GfKRDZ6oL3qwXcRcr8=;
        b=AEsEeHVH2TV6b/IBxMQqKx90UR9kT+70HcrARqt0tXWdoe+x1MHU1sCZuIbz3mpnfJ
         YFjVvFEn4mI3+mWvUoL/JJHsZRBXg6MJW9ol6G6Z+086UEEqR3xUsjvyGXS7EvFgzIKi
         oc9wmPFF726vi4kfbam877EYECV8PUy1dCIOKzX7Ghriqf4Z+QZqz8ggb0JEhXaFUwvm
         aJnMTb13RemGGoya/Ua3mBbP8VoEfz5o0wGSh+TfqvvAuooCQNC0Rst4dcfkeOjEAzyQ
         ADDbA8WUXbkiNHVEStm6ByqbsIuccmRRBTy2ctlNdZxWWkCf+S52diZmHsH8gNvKHWnL
         BaLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795876068; x=1796480868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n9+cWHs/s6hq8awQiXEdJpxL4GfKRDZ6oL3qwXcRcr8=;
        b=CHm6TW1glQgKRTOKDBA3Q2Qzdj7AP6PZ63VI8054wV4m3RaV1R63NHBkd2uKuH86T5
         hDJqcsxmbYiuNSKd9fQWnIH61qQ9HkuuR8UNXIQjoT386b/AQAyDSHHCt9wNoisKbavp
         7YzqWt8/2ACuSKrpPiV/oYjiFTPGJpJ3ErnrbQer62DZYpt19Vtdzgv3nHVKqBSFuenr
         08ANQm0IizZnVqSPyyO2JJMYVyLVtgzFJu+KqQD6fsM3H8Xi4egHo2nki8Vcsqw4rAvG
         4YKairuBW1eCymOaf7/Ojf1oZwSkL23utweDTvBI+ZYgJS2K+Sacpd6ZiWPISf36YTWq
         TNRg==
X-Forwarded-Encrypted: i=1; AL+hErFl02nCa8Pa0nBrKoixHflba1tBr1NtpYHxA8IR3KV3uAy823dKqOWNhkqVJQJAjotS/DMVwX5RHjg6nPI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mV7YABzLdQ1AGlNvGIuuskE6fC+RfNL5oHhF5KUrHltJFbRFm
	n6w60Agk/dSewS+b6XfP+3+E3wS3IZELOyKwB3a7qiegg1E9XgVBsLrB
X-Gm-Gg: AZFdTZezJG68vezQQwKw/c2cf4fCd96VxyTlObCRLZWRLE57McGLDfk2WdwSQl0FjlP
	3bxuGIfHg6ojtWI4urXnvHjzyAZ33UGTTl37pxn48Cp+1pCLVWW/e2zkxMwwzH6ym2ATpGb1K07
	lvrv5WAj5vy8UuThM+W9wjKGHyi94rs/kQsG6rdX/Swx/B2BoxOhb4cbyo9m3wE21KqwH3JalvQ
	3hDI6R+V3ssvI6loEAMLf0noJJfU/R5xZaOxdfJQZ3LN09IAeZD+nACScgj1HARUI7iobnFGwyw
	P7frfyLjag/nMCakSpBeDxBZtm47LV6Koz3xQkrthw4RNytqrSMsuty/vGMxK87VGu7Wrh9JEqO
	afnyHja5XVaIjk+iQrqEgNyFvEOIyk2XAnOnKs+dZW8xfkuSjU4ZM9lAqRfSabL09KedOqhZIhv
	kjfyKYMmg6tPdTHErPxG8S+NnLwAHtsokm6aBR6Knf+Y87EKxnTlMTL6QZUULBOFY9OGmixO9Gm
	WFtxqlJq7yEiSvZVNYZsmEXZz4HoLMD2y5+GsFfWzzckDLo7WolUvZtgZB3ZDyTXef/tmeKlZKm
	n34byWkdYlzXigfBmvXyc1XXKQgux6Jpqv1ZFh3A4AsejxGeK4H3ToYEjc4qstwsf29YZIwewkE
	yL5LmIToSmt5q9zE3
X-Received: by 2002:a05:6402:1d4b:b0:6b1:ef16:1855 with SMTP id 4fb4d7f45d1cf-6ba37e7c734mr18149115a12.18.1795876067830;
        Sat, 28 Nov 2026 06:27:47 -0800 (PST)
Received: from kernel.. ([191.40.25.3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba36e35ca6sm12448436a12.4.2026.11.28.06.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 06:27:47 -0800 (PST)
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
Subject: [PATCH v3 1/7] rcu-tasks: Record callback enqueue stack
Date: Sat, 28 Nov 2026 22:27:23 +0800
Message-ID: <20261128142729.3756679-2-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261128142729.3756679-1-kunwu.chan@gmail.com>
References: <20261128142729.3756679-1-kunwu.chan@gmail.com>
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

Tree RCU records the code path that enqueued a given callback via
kasan_record_aux_stack(), but Tasks RCU does not.  KASAN reports
involving Tasks RCU callbacks therefore lack any hint as to which
code path did the enqueueing.  This commit therefore invokes
kasan_record_aux_stack() in call_rcu_tasks_generic(), covering both
call_rcu_tasks() and call_rcu_tasks_rude().

Suggested-by: Zqiang <qiang.zhang@linux.dev>
Cc: Kunwu Chan <kunwu.chan@gmail.com>
Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 kernel/rcu/tasks.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/rcu/tasks.h b/kernel/rcu/tasks.h
index c1e456e08e668..ab05131a12b18 100644
--- a/kernel/rcu/tasks.h
+++ b/kernel/rcu/tasks.h
@@ -6,6 +6,7 @@
  */
 
 #ifdef CONFIG_TASKS_RCU_GENERIC
+#include <linux/kasan.h>
 #include <linux/mm.h>
 #include <linux/ratelimit.h>
 #include "rcu_segcblist.h"
@@ -364,6 +365,9 @@ static void call_rcu_tasks_generic(struct rcu_head *rhp, rcu_callback_t func,
 	if (WARN_ON_ONCE(!func))
 		return;
 
+	/* Record the caller: the irq_work's stack says nothing about it. */
+	kasan_record_aux_stack(rhp);
+
 	if (debug_rcu_head_queue(rhp)) {
 		if (__ratelimit(&rcu_tasks_dup_rs)) {
 			pr_err("%s(): Duplicate CB for %s, %p->%pS()\n",
-- 
2.43.0

