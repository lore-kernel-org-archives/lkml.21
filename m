Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794941391;
	b=eNRe/n8rhcMX2yUjvyJKCx1fIwNBeEEOscXjSBGCVnnx5c5vge4YHRE4T9IEbkOyXBch
	 XlvsdD6Vg5jbp/FqlKcex8G7iK95JoGEcH6H5FPt/ckHDqgGx+ba9G5WUL4GaF6CJ9DF6
	 rmeZmXAVl0SOgidM5VP7+ejw4wgHIMFg7BcEaFWny3UKCkNMdCWXHhihBwtIjIuTlYyxZ
	 95UqAARj2St8NkrpYRxrue3+on6PtZwK4gCWq5tIYl7l1c3zcYlANwChVRve9RPiGdQF3
	 610Bv87dsPqB0Q4bql0gzdL7fS870JwjcNT/HBZij1B13G8IbJKoC1jQewuSWZtQE8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794941391;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=fE96Bwoq4dvubLO/ytQscTwlirtJcyD7QHCmaubFJQM=;
	b=FRKAHi+MoSMWBOVlum5mqYEPz7u3x6L2fX/xdpb6/t2eOr9xvjB58pKURjqcxp3q7urM
	 Bo2yMQwNUQN69KypKk6eCFmlCmN9MfiYW0dhWVVOIojHob+1OahTnVDGFD6619QZCxSgL
	 52uofr/eWB0a+ZFQq5yk4M/LDe8xgmgC42TKtFB05EFcct7PKLswpyCyuLz5dCfuDQ2gr
	 Nrf70FBiWVGJ0vhV418umygSAyycePEeQmP++ym7MbRkXt7K2qkgnj9HyFjMw6jG2OBgu
	 3PBfFs8QMFVmLpmomrcS88MRGvuTFZiCk9NZ9b8hTpY9e4Uv5suXqqGyxyerVnUOjRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WW1MgN0E;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D28E606A894
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:49:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D28E606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WW1MgN0E
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33713e5e6daso270181eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794941390; x=1795546190; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fE96Bwoq4dvubLO/ytQscTwlirtJcyD7QHCmaubFJQM=;
        b=WW1MgN0E610Ng/mUsdrMraSskJo17fZb1fON7UEmlBFyhEVKKchyibrIoPxMSyHET5
         thKIRP1YEZt79vZKCCim/zvSYsvxMduKm31ec5DGc2qP9ZWg3WrzigM8Oh4bA4SXU1QH
         HC49ZsHIKiK2gk+hqXR68p4l2XWMI3a0vTDWF6g+nskYW2WyEo40yskAlm/R6fhdzFiF
         pUV98xaovmjJqptj08FUKzpRz9Yp7oKtoEjH8u/g1db9D+gBDegs9yU6/yRkvCmQh9M6
         AEPcRMMf8dKHJMveKVvJH8jadIt/Ium6pGwaj8yTUWmHr49Jybhij42eDvL/d+Q55Hvk
         P3yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794941390; x=1795546190;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fE96Bwoq4dvubLO/ytQscTwlirtJcyD7QHCmaubFJQM=;
        b=taf4eYIRBRuomKIYT6PLHcD8SHf+MmeiVrg5BqzTlxgM0+qrOOmKNIa2KpalCJy0LW
         EA604xbAe7XdRV5LRKNNOtTQ+pVr9xcvue3rPDCCIqrOGpwPIh6TPayfC4lq/xstqAHT
         fUCZTc28dVI2N86AGAtbxk30rXsoyTOXvMiyySgpTQlEhUn1Tb+BcdeSp4ijVFL7Y/OQ
         4xvAZvtwuBky0wYNDo8chBKzY0WPIDBkl0b+7MexpOuN06TF9iTrvm3C5FaU/nRxMadU
         ZoZzUl65iwcUjQs4u8mksI/B5KdgaAZWtr5BDW+jLdv+JjvUAW7t1sDSZEK6Exu7ZCJk
         M6zw==
X-Forwarded-Encrypted: i=1; AL+hErHnM3syeYFjoPAfIJ9AwyiDPr8h7qoyvJCjUywP9u5iX1oYTU9+Rtmd7gNx567VaiZU99KScx/0lWgh2+s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RZbzHoCaBq0Xr/QIPZLqDyvXl/tylyAMsrDoX0Nkm3Z3xt+TU
	ddjhRpBUfQrMwXRP2cp0LDeWMz9kKraGbYRVaVOWUyWWzR7+Zds22dAnhxj/mxx1x/Uqvu+1UMA
	iWYqj/s9yOA==
X-Received: from dycnd10.prod.google.com ([2002:a05:7301:c0a:b0:343:520f:7a80])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:804c:b0:378:2e89:3958
 with SMTP id 5a478bee46e88-38280f22793mr277558eec.19.1794941389993; Tue, 17
 Nov 2026 10:49:49 -0800 (PST)
Date: Tue, 17 Nov 2026 10:48:44 -0800
In-Reply-To: <20261117184844.99889-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117184844.99889-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261117184844.99889-24-irogers@google.com>
Subject: [PATCH v14 23/23] perf machine: Add __guarded_by annotation to machines->guests
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Weilin Wang <weilin.wang@intel.com>, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Annotate guests in struct machines with __guarded_by(&lock) and mark
machines__init() with __context_unsafe().

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/machine.c | 1 +
 tools/perf/util/machine.h | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/machine.c b/tools/perf/util/machine.c
index 0cc593d5372a..70870baa157e 100644
--- a/tools/perf/util/machine.c
+++ b/tools/perf/util/machine.c
@@ -234,6 +234,7 @@ void machine__delete(struct machine *machine)
 }
 
 int machines__init(struct machines *machines, struct perf_session *session)
+	__context_unsafe(/* initialization */)
 {
 	int err = machine__init(&machines->host, "", HOST_KERNEL_ID);
 
diff --git a/tools/perf/util/machine.h b/tools/perf/util/machine.h
index 80191545ee8a..67d517742fb6 100644
--- a/tools/perf/util/machine.h
+++ b/tools/perf/util/machine.h
@@ -3,6 +3,7 @@
 #define __PERF_MACHINE_H
 
 #include <sys/types.h>
+#include <linux/compiler-context-analysis.h>
 #include <linux/rbtree.h>
 #include "maps.h"
 #include "dsos.h"
@@ -153,7 +154,7 @@ struct machines {
 	struct perf_session *session;
 	struct rw_semaphore lock;
 	struct machine host;
-	struct rb_root_cached guests;
+	struct rb_root_cached guests __guarded_by(&lock);
 };
 
 int machines__init(struct machines *machines, struct perf_session *session);
-- 
2.56.1.703.gf848ed807c-goog

