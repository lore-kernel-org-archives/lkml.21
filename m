Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729071;
	b=BAnG7Fv/++UQGfsFmgiFcXlmpo0nD4CcNna379vNahE3MLJwSLOPGwBhSUR0qh95rNe3
	 iot9EHIic8Gds6ejpeoRfPRp+14tOytOCs/s4I0u0VIv4bW4iZRMWj5AED9BrFImnCL6r
	 +5ke9qtFFq4m0NIVfsfNQl/pBuC4eZMWhElG2SIAmMyDdV8f0ENucEuwoWJShmoMROuVx
	 Q4P9aEf0hRvqimfHtzrdYr7J9Jg9zh4eJbDbaWQsN36M6XizyIHVQou4djx8JTltnX/IR
	 eYP+8TWwr9WP70nUEq+uCZVpLq0TDqaHnsEEVLIfJ0iBUQLKKbmX0+ce9onpeImu7tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=+mFlV1Y/d18LL9hJ2/iQPBUptGZF6KZfpVM7ZDgF2QM=;
	b=drUI34ELRox5u4zZgP0RG7h3iibrs1AxDTlgiOywv6VIKmhNpXx2C+JPUIJtT7wuMzyB
	 RIrGPrRwDNAoa+inOq7Bhs+W7hIB12diIxXHp/or/H+CFH5dN3rlfz1rxOmtoDlVGSkHm
	 /HtdGRN8nSPe+9bFtnEYEET8E9a8nKuJ8x2SGXkq9g4kUCMT5hQDrBEv+TdOLMtMvwL5x
	 mgd08+jWS87+Az/Gmd7kOXFbbSOlL+05GFpn7DlqJ7yzeARu1FNueUpYVQu0yI7Qn9WIE
	 5xxz6Wf/9tX7D8czRyqCw8GpbUcWUg3OMFwB7XUJuYVvqFVstlIDUP7tHjZrNYxLqfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eX0cfqBM;
	arc=none smtp.remote-ip=209.85.128.69
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA95606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:37:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBA95606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eX0cfqBM
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4b9f8c66f72so9575615e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795729069; x=1796333869; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+mFlV1Y/d18LL9hJ2/iQPBUptGZF6KZfpVM7ZDgF2QM=;
        b=eX0cfqBMsqkjTdAZKa26yO8ixE52LhB94CBDyUa8d9rxejQ/65p00cva/9T98VenN7
         sYwwtl9hqLhOyLjfuHjjAX/cdXD7Q+nlu/d5dq187nNAJhB1HbQO/ZVJOJkec5m3434p
         ZCRDW8OBfGSd+1JEGki3VSqNRc5tDfOd7mq1oJCZkDJNn8N319qBR9zGX0/Je5HHmYQB
         Q8kWLs4+C5xZvyA898bccsqQ2ULta1jzBx0PvWf19oHpfUpfCEqxfOaXGKX/fhEqlMpr
         GG6EuvuPh0rKf8pbjdrCJkaK/lJ1Bu6WehHR274j4m7Ti4IW+tfPSApopXSwaUv6n7QT
         FtWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729069; x=1796333869;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+mFlV1Y/d18LL9hJ2/iQPBUptGZF6KZfpVM7ZDgF2QM=;
        b=D9NXU/7hgt/Z06WBqm2Em4Ts/glADvNhJkzYkTCUmsPhCZfHkDtnV4Abb+5akgoE+e
         Qg69+vTHK5UWlmnGQHTEdemSJe5biEbAD2hij51MyHem1sicffLHzlTRuRGrzOuqL4st
         2/BDTVcg48FlVDsvTFGmaK5whg5cpCo7qKBmboY0eYh925pgwXBcvh8N7E8TzRPB1ecL
         OMDTc4BNJ8fXn3UKapCjA7hS+hb23cz/9Ss5ahWxUDOueMF9Ox1f/W6xm3qs4hGiRl1l
         xZHSv8GEauPRQVlf4C4ENUJqhXivMh2Iq4u8FNb7z3OUk7SdHtml66V7BdPh15iC3NuV
         1O+g==
X-Forwarded-Encrypted: i=1; AL+hErG5j0T++uxjJJ7fLW6+YX+DTCmGiZOC2qNXUtGeflxTkKrfZddoxN5s9S9sGxR9YTjk6PvBZ04zuHxl1lo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8iFx5Ze49YXlRvq4J0pTVERzwEyry03ittdsfYMMtY5G6jsVH
	fvl7p51s010gBMONLL9m+mX0Wn1G0YVrQYG8NYQz8pJj8+vp11+qJzSDeYo2QyebUsJKYynnuDh
	lTZARAar4Mxt1021aF//yPA==
X-Received: from wmsp23.prod.google.com ([2002:a05:600c:1d97:b0:4a1:811f:6de2])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3ba5:b0:4b0:a307:46f8 with SMTP id 5b1f17b1804b1-4bb8880f29bmr507010265e9.10.1795729069135;
 Thu, 26 Nov 2026 13:37:49 -0800 (PST)
Date: Thu, 26 Nov 2026 21:37:41 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261126213743.3044079-1-vdonnefort@google.com>
Subject: [PATCH v2 0/2] ring-buffer: Remove unused absolute timestamp mode
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Since commit b94bc80df648 ("tracing: Use a no_filter_buffering_ref to
stop using the filter buffer"), nothing enables buffer-wide absolute
timestamps on the ring buffer and userspace has no interface to set it.

This series remove that dead code.

Changelog:

v2:
  * Drop the tracefs timestamp_mode file and its documentation. (Steven)
  * Rebase on 7.4-rc4.

v1 (https://lore.kernel.org/all/20261105202814.1350312-1-vdonnefort@google.com/)

Vincent Donnefort (2):
  ring-buffer: Remove unused absolute timestamp mode
  tracing/histograms: Drop stale absolute timestamp note from docs

 Documentation/trace/ftrace.rst    | 24 ----------
 Documentation/trace/histogram.rst | 11 ++---
 include/linux/ring_buffer.h       |  2 -
 kernel/trace/ring_buffer.c        | 77 +++++++++----------------------
 kernel/trace/trace.c              | 43 -----------------
 5 files changed, 26 insertions(+), 131 deletions(-)


base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.56.1.839.g22a8290db9-goog

