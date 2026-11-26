Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795660271;
	b=H+Lgyj1+wXOp58nSZe1uljdHPbJTaq73ZU78C/y0+Qpm28QyhvyYQDORpAZm4up1sJRL
	 +8oek4qVLWJEGPAwKtQtHHkdAtp8XJLXFQczwQOEOunjDbRNcDRfeGIEuLTULbPwnQoz9
	 mm2S5Z9wWFjVtETg0GyYtJEHXttFgOlZLK4HlIhBZlOmxBkGclVheX6kj3bHMFEU9IJ3I
	 FWRSPPt++iKmSr+Jtt37hV4Z7aTjsWZ18vMU4UUTXhjbxVk1HBhlZVe8KXJfQkagUCgWj
	 cH9zUY3CuTb+BJbBRGL8cGRfoz/yI9Yux50F5SUP+67XRuatHbIsrvWGM0goYDjgJgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795660271;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yN5H3rKOI/8+8/yT1waYVkwONxbU+zHepwtMaoJjEe4=;
	b=AulWure8Y4nIG26zCpVELxpHQGYfWtXljIwzt2k/b5idgH57w9d3dcmDA3TsdbGtGLvf
	 b7OMtb7M2BkDjmfWfVRUPBaSbu1Qz3gN4svvkrZLWxkax5S08ULWRwVUNy15lvKvgQTmr
	 MZkB7CU4dsdaYfeccU6T3WF1+Re+OYJbbDfJTq0bcZvDMfzloaplF53TjQfuX5u3J5L7D
	 +qL8mre+1BJmy4QqIjxO1VRU3qmGLvykfLTIGV//CFKn55d6m6djfA+G5jY92pIly3aN2
	 ffuysg/iF6C8HFgndgtRuhUD67zGEa6GuqgZdobKNWVnuH+7PS1ZEk/WP8RZsfixBLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sp3vYyEe;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB316606A69D
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:31:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB316606A69D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sp3vYyEe
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso79983745e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795660269; x=1796265069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yN5H3rKOI/8+8/yT1waYVkwONxbU+zHepwtMaoJjEe4=;
        b=sp3vYyEeIzdhmt/2NwQA8bgBqIVHI+phLfbI6wKT3iWAoTwwuGZz1IyO9rmEYDKgXw
         I4QCJbHNji4RjTk7q06rodTVNRoqedu9oQrRkq5daFrrrw7a7PQlDqWs00HiZQYNMS4Y
         fs78czPKWoQMClgGKDBbFbAkuGR0j+9RKAlD3QSLHs4+BQfdNZ6mJ2fVQsIsCPg6wvw6
         EnaKCnfz9c+hOozBpB4XIeN/K9Kyy7hmD2Zq81JRc17dVxuzR0A17Sn6HBg+r1kRpPI4
         ePd758R9egnFXEGuqqzpBAVgUJyQXRCbSW21psTFLMoXDtSq+CWlDISk1Mjvxq5YnxnQ
         ra2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795660269; x=1796265069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yN5H3rKOI/8+8/yT1waYVkwONxbU+zHepwtMaoJjEe4=;
        b=m2P/9CfaGEWNYL3roY3G9CP8lNAKwCZPa2C4N+Ia1R3zHgMrG3MMhfD+RrH5tYPGnr
         TZTYxvg0U/0ae9BE/zUNUldgopJrajd7WjbkSuq3jOsv77cFFMxJoyLhDTIitTnF6RIQ
         O7aAQfbXPp8Kw3w/J7lXb3WrzG9QFNmgCCU+W0qyf4CblsAmDqKHv+sHTL/hLDU6+PyY
         P3alyam2mSaq2GEpq64wSYCB0b25Jri/SQOtH4Sx6/AirlQlYAkjWI601S3AtQ7O3dT4
         DwsqRXOYFEPJg0W1Q+4tVTfzxoJalduR+dgLKDWN2eiYHFZ3xYrUclIEYQ1YUXYso8xp
         Racw==
X-Forwarded-Encrypted: i=1; AL+hErHZ+AQNDEJM1y7guTeuNLr6zDtDZM3/WbFw/mF9u7gRvqTOP1zkPRao1n+wt0VzX+i2WVk7A3a86/B9Kpk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+m56j0rIWzLv23zczXPMCm76ejZ9QAxnsDaDJcfKp0LYJSI2Ru
	7oVOZaGmoa1/ipUos6wxR9+yLTBisYhscYeTHnS2gPAsexNeWQaHlpp0
X-Gm-Gg: AZFdTZdsjwdCCNnC4YdlWwO/nz13ORFvZ48AhSvd1RZhb9JwqPMOS0TeeQ8gZRJDbe1
	V7OAKsYH5QjJPOQCUvOwKySJmuP6YhDvrvYBBzspbA0KL1dkShKQaKAKzzUWI57O3GmcqM4gJvp
	NHfztqZQctXf1CTL+AAdRuNMaxePl6vTmIL67AjvJWOvBswn2gmfop5vD+7vbjx4aw4d68kQ5fw
	4A71qPMu+lfR/gUW4M+Nv8TW+R0m6PrroQMucy9Y2CwTiraOU63JokWQvm8eCyeoXlLuNODqmRz
	E6QCzdbKxUonCuQ8WM/o5HtYFVIMxyAZIp5uOxdcXCA38U1X/SvlA+/2otTdNYymAGoCktF/EQW
	qOgNn+utwW1Fm44+M5hmjB/Qn49P376I5UQZqkOX3TWJosneHtMNq9ltSqHd3gP95LmwvUJdSxZ
	icVXn9u2zwH1oFZEm9dG5PsetrwCKf0nYv++TplGwEjy4jDvMwLaE0TEI7lLQ2zi9iESpNe5WT1
	L79djFxbcW1utGl2seXJgKJxp1YHWZcyKDJAmnsskZ6BQ2qfVbsJ7kmp+Iy3O3RqoIWoLmzzYZv
	A6dy6r7RUba8JF6x2iypbpkIW/127/uNkzHfUti0KPiE53byC3aLLFrOmXnAbDpBmAqb3kJDGL2
	NNHLTLCzGIMadx4g5vli9QBHvXfQNPGNCMmYXpAzA1lHWZqtRqlCJDCQk2xGggFqrjQ35TjKnXk
	g0GSQDLqEEuFbUo43enS5wILO8WjIltmTifc/L6g==
X-Received: by 2002:a05:600c:3ba3:b0:4bb:6118:4c9a with SMTP id 5b1f17b1804b1-4bb88819940mr456668815e9.30.1795660269096;
        Wed, 25 Nov 2026 18:31:09 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-b10e-d501-d0c4-b021-8d77-e472.310.pool.telefonica.de. [2a02:3100:b10e:d501:d0c4:b021:8d77:e472])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf685asm37722445f8f.20.2026.11.25.18.31.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 18:31:08 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Hongyan Xia <hongyan.xia@transsion.com>,
	Song Liu <song@kernel.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] arm64: Always inline preempt count and reschedule checks
Date: Thu, 26 Nov 2026 03:30:53 +0100
Message-Id: <9546998cffeaf365f8f67901a48ef103945dc342.1795631277.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1795631277.git.kmehltretter@gmail.com>
References: <cover.1795631277.git.kmehltretter@gmail.com>
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

The preempt count and reschedule checks are plain inline functions,
which permits out-of-line copies in instrumentable text. The checked
notrace helpers added by the following patch use preempt_count(), while
preempt_enable_notrace() uses should_resched() with
CONFIG_DEBUG_PREEMPT and __preempt_count_dec_and_test() without it.

Force all three operations inline so noinstr callers keep them in their
own section.

Reviewed-by: Hongyan Xia <hongyan.xia@transsion.com>
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm64/include/asm/preempt.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/preempt.h b/arch/arm64/include/asm/preempt.h
index f3a5c2cd193..805f7b33baf 100644
--- a/arch/arm64/include/asm/preempt.h
+++ b/arch/arm64/include/asm/preempt.h
@@ -7,7 +7,7 @@
 #define PREEMPT_NEED_RESCHED	BIT(32)
 #define PREEMPT_ENABLED	(PREEMPT_NEED_RESCHED)
 
-static inline int preempt_count(void)
+static __always_inline int preempt_count(void)
 {
 	return READ_ONCE(current_thread_info()->preempt.count);
 }
@@ -75,13 +75,13 @@ static inline int __preempt_count_sub_return(int val)
 	return pc;
 }
 
-static inline bool should_resched(int preempt_offset)
+static __always_inline bool should_resched(int preempt_offset)
 {
 	u64 pc = READ_ONCE(current_thread_info()->preempt_count);
 	return unlikely(pc == preempt_offset);
 }
 
-static inline bool __preempt_count_dec_and_test(void)
+static __always_inline bool __preempt_count_dec_and_test(void)
 {
 	/*
 	 * We must load the combined 'preempt_count' after decrementing
-- 
2.39.5 (Apple Git-154)

