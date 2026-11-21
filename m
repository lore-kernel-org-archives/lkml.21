Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795244316;
	b=bdIYCRuHitYYc2bBTyVvVXX7lVPm+N/bzbXhrtjyD4WCLaoro0aeCcpD1QiX9XJoYwZ2
	 x+Fn4iym3iSH4zkxe+qzUBz+BEZfftbheFUGyKlz+esR05N4nJZHLUL+0RhWr4Iioa4St
	 PO0WuKLNTV5Rua+Rpc/Xwe7APhnqhKsqQnrPz3q+hfZaYNYLKqAmTjbOj6Uby4dC+ztUK
	 Mg2+wujiuuQXT061hM3vmibMtR1uNsDqbaBiwfc62pawvMxbWfi5lBwlZulEw2Za4HU09
	 BFXPGCtYOwqHlmjGaU3dyIY8gY5dw/VjLQekk+FF7VHo+4OLU7E3BNSrG/YsNianc2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795244316;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=WFQYbBMhFIDNWh8RpPfdlWzTylnEhajA5E05wFXNi1k=;
	b=D7bUiZi0uIU7PbM6TIPe8ygvsBhWenh8vYp2UyzSaw04AwVQDUeZhpq5VSJYOG1tdzq8
	 NOqSULeuEvGuPBYvEalzmBiSq/Cm5gFUAWuD1LwunrssvH0RDpsvlr1ofqJjPWl9zcyOy
	 uHQcRNtq6yxIXL4amIPAisouuq83mpjVX3h08rOgmSd8c7EAU1LhEPCMBY7nqC9FBuZeZ
	 idnxGbRJxrCrn7agJhFDGyar+tVSVTTVs3Hq7FBpRlxmoh90QPUz+xI5NHVh8RFI2zCoa
	 9ZbRBy8sb5plwPM4bap4aljsIPC6ircmpUDtRcuDLL8NU366Uh4XxOjGnwk2G9sN7hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JFYp3AiY;
	arc=none smtp.remote-ip=209.85.210.70
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209C7606A334
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 06:58:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 209C7606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JFYp3AiY
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-862ae90bbdfso1933741a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 22:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795244315; x=1795849115; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WFQYbBMhFIDNWh8RpPfdlWzTylnEhajA5E05wFXNi1k=;
        b=JFYp3AiYr2KxTluRFn6uMY7+yBx6+T7HVipHkYOk9Cez6+9NOVHCYf/1XHQvoqqhYi
         kuTEGw27MbAqIiq9lj62ufeFNKUuGJe9LTgTPBqISdFmvpdyCYf1ZAkZ3wSvKYDUGwfz
         T+faDkqA8yLt73wfcrpmH/5y3MaQEyarDdetrktLzodFY9LHSMFzHw5R/yS9BmRmMg7S
         uXkMMv9p17DA1Js2E/yz9a/fq7GysX9eBK/9QV9SPjOwWi/umVw02v5pq9Dcv9kkPXbt
         I9+q2Fo1vzetwxkYzcNdAx9xWCerlftk2PrWgUOXvpHSo9CFZb+KFYCOfwN5aS3vKaCG
         9pJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795244315; x=1795849115;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WFQYbBMhFIDNWh8RpPfdlWzTylnEhajA5E05wFXNi1k=;
        b=0505im8Ld18a+7bG4EMlHzft2dvAQLxAQNwnkMX3VQN4olQA3f6nOiIwTTfy9FiQgL
         h/An0gnAcOt+WYm6AbKDXi4YJgI0juTGVBeEacJaE93p1AvsblCbtyjnAcnija+ni/jm
         ErU+qxjpM8ADYX1Syvmmgfp2kZrZ0WU+CEz2VWmU50q40e0zeC3LXEqUInQ+pMffyjiJ
         42F2qgsXXLlKv14UA1sQ0cxapDjtRbGinpau66BVPEL6brCX4YJx90SIQ6Rj3YsZN250
         wSjo+gTl9wIVGM/IMolDA1PqXxyOk7w2pFTi70g2olMx6w38US0bx905zwHif0i/CEF0
         LP5g==
X-Forwarded-Encrypted: i=1; AL+hErEyZev0Rb6tM4Qo462QxVHgBSumIAVV/LjTHh6xxgD5LaE2ThM2axsGoCRvn+tafEqQ3EgDEiai4NWKefg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gFB39zDD9yDCVO2QE8Dld3T+6EbFjretGzU2u0az7wUH4UfpV
	ei1jIRdTmHPsnoBwkFA16eGiS7wPAfcZfEELGDs7wliH+3GIlRlShugB66VFvKYwmZdpHMnBlh3
	MhYl/Gj9fBA==
X-Received: from oibmo2-n1.prod.google.com ([2002:a05:6809:702:10b0:579:7e19:d2e])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:1314:b0:572:75e6:1cf3
 with SMTP id 5614622812f47-57a0b3464fcmr6263252b6e.35.1795244314813; Fri, 20
 Nov 2026 22:58:34 -0800 (PST)
Date: Fri, 20 Nov 2026 22:57:50 -0800
In-Reply-To: <20261121065813.4143649-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261121065813.4143649-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261121065813.4143649-2-irogers@google.com>
Subject: [PATCH v15 01/23] compiler-context-analysis: Avoid unused parameter
 warning in _context_unsafe_alias()
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Weilin Wang <weilin.wang@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

_context_unsafe_alias() does not use its parameter 'p', which triggers
-Wunused-parameter when building code that enables -Wextra (such as
tools/perf, tools/lib/perf, tools/lib/subcmd, and tools/lib/symbol).
Explicitly cast 'p' to void to silence the warning, matching
__assume_ctx_lock() and __assume_shared_ctx_lock().

Reviewed-by: Marco Elver <elver@google.com>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 include/linux/compiler-context-analysis.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/compiler-context-analysis.h b/include/linux/compiler-context-analysis.h
index 8302ebc2ea8c..024e303188ad 100644
--- a/include/linux/compiler-context-analysis.h
+++ b/include/linux/compiler-context-analysis.h
@@ -243,7 +243,7 @@
  * alias as a function argument).
  */
 #define context_unsafe_alias(p) _context_unsafe_alias((void **)&(p))
-static inline void _context_unsafe_alias(void **p) { }
+static inline void _context_unsafe_alias(void **p) { (void)p; }
 
 /**
  * token_context_lock() - declare an abstract global context lock instance
-- 
2.56.1.750.gf70dc682cf-goog

