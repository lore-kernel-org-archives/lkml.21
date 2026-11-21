Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795244341;
	b=NUiRT7VfQJrAuBZuaTq/O/z9TlSKlqLN9w6JwPO0xXtVc+4sSy4chhR9ym1SJEljmTF+
	 qJfqjnapvOi7Pe7a3bv+aXHbSZXzxEhnArMPF5sFZrbno8ziE9FBcMpkMYhtZskFMeLOL
	 CDY5fNgfEfn5YxXYlAVD7A3UZan9xrNPNMoNjCKIVHlvxteBiwj1KsksV0U5XRtVp8YIr
	 vX36zMngZ+BFhP7OcnXG56RrhjNeWLnuVXFhORES0CbuJBIsHdzva9B07lITRF++M1pdv
	 UgfJY9MsBqlY9+65iZIxobMM4+C5HZUNwuMi/BODn3cyT9jAmiQqRjzKVVyiGiu2qnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795244341;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=5uxDxgfBGA5yTPHcCIqyXHP3BnAmG6Jm0Jp5UQ/3dx8=;
	b=FAa6dOZoCkz/q9h6Hwe7HKdsQhFxyGxS5JRMqKLGs+PC6qyPKv1ihuiPjS02lV1m9yJ5
	 o6WsAxYqLCtPGisGPrvaq3TAaSOE1ttXZImGVWxl0cx7BS4hD7G0sKcXY+QXgLA05IEG2
	 sx5sdWCgjWwzNEYMw3tLOLaDlBQFWAwf9TuLiUH0TaMuMIzx6LKy72GWDhhIa1oqXKYY+
	 Qq2/lwC6D6pIBLvVLBJfHhujkNVo/C0dtoaDX94hZKU8y7JcaHCK2IOTDACrpzCpvrHU+
	 i8A/FeFbTLwGFEuHTQeVaF9EZ8RH/4lbhLOpyn6QrYu1x2qgDmceE4dCMctOZJ4DISA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RXfniuAf;
	arc=none smtp.remote-ip=209.85.210.70
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0AB606A333
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 06:59:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A0AB606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RXfniuAf
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-862bca06702so3294240a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 22:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795244340; x=1795849140; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5uxDxgfBGA5yTPHcCIqyXHP3BnAmG6Jm0Jp5UQ/3dx8=;
        b=RXfniuAfp3EtgdBAKLr75KxU1qE5n7pDoI4d1alzGAlfMRAwN3+g3ZJnmIGW4r1buS
         0NF7vvAxIMfQLGu2DiyROfiBeiWT50y0M9CRyJrT5qpvGCRcoKV1gO7XCWzbUrIhH6po
         KyzoqFq/Aj/ZvpMLYhuGzkTV9W7IoPEFMAHmkjc19hMbMZ5yxxr+wk2AL4Ylo8qzKAqr
         +FwiIPzRmEtTe4ZjvPr0OdLQboYn84U7cpF6/on+F3ewqtk65+gr5q4YhrUINMSpSbe0
         KcxKZlQh/2El9pk+oyQ9X/EjtaDhXnNfpUx6x9DbbYd0iA+9I6jOpHZ7YoKXp+80Lpkj
         9nQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795244340; x=1795849140;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5uxDxgfBGA5yTPHcCIqyXHP3BnAmG6Jm0Jp5UQ/3dx8=;
        b=Q78GhHgszy1LLWWey2s8/QlsLYrL6P0yuWhwQO8dWFoRPz5XsdN0k+nOwvn0smEHpm
         CReM0IsZUIaL9lXnmvrG267kSo0vNIzGqVXAge0r3vm5iUZSFHijl8E7P/ib9LWgUNsN
         gYH/Q0y+setiRSWI3BwxZbe+VcPZ9VVJLI2/2aujYAGZHu6IUkM03IUJFFwPd0BRZDJc
         N6c2vEfBeXx0Ay0hhnbaZAG53EvfPqois4/2ovopaJcTWSy+NBt78C04+caXQ4vnd11V
         n55b2AFvmb4AMx4+Zxim64KH+doaQM9NIArremlu2dSOjuVR3YRqIe2K98tqNpCZLRY8
         9ylA==
X-Forwarded-Encrypted: i=1; AL+hErFRsETfl8w+WsGYJcwSrc5ChJyNil32M7G4LDg3moOB4WKaj3SRqv4QJ/lLcaWlvmFoQpHC31CnB6Jqjrs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9umgQjfRqFMlro7+pgDtZfM+3CYO2PtZEvSKAoSn8vMbkbXxRT
	Npv8MEOoWdcqs56fCpbOLTE0hvcTVtyz8qc7lyK5IKubaXiryhWEF46b+MUgTRNhcpjFNdG7Qv0
	+3k4mbKGocQ==
X-Received: from iobdo25.prod.google.com ([2002:a05:6602:4619:b0:9ca:bcca:dd8b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:640a:b0:572:e8fb:2125
 with SMTP id 5614622812f47-57a09504aadmr5490293b6e.20.1795244340118; Fri, 20
 Nov 2026 22:59:00 -0800 (PST)
Date: Fri, 20 Nov 2026 22:57:55 -0800
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
Message-ID: <20261121065813.4143649-7-irogers@google.com>
Subject: [PATCH v15 06/23] perf comm: Add __guarded_by annotations to struct comm_strs
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

Annotate strs, num_strs, and capacity in struct comm_strs with
__guarded_by(&lock) and __pt_guarded_by(&lock) so Clang verifies all
accesses hold comm_strs->lock.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/comm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/perf/util/comm.c b/tools/perf/util/comm.c
index 6343a3c9debe..9fc4e91a36e9 100644
--- a/tools/perf/util/comm.c
+++ b/tools/perf/util/comm.c
@@ -16,9 +16,9 @@ DECLARE_RC_STRUCT(comm_str) {
 
 static struct comm_strs {
 	struct rw_semaphore lock;
-	struct comm_str **strs;
-	int num_strs;
-	int capacity;
+	struct comm_str **strs __pt_guarded_by(&lock) __guarded_by(&lock);
+	int num_strs __guarded_by(&lock);
+	int capacity __guarded_by(&lock);
 } _comm_strs;
 
 static void comm_strs__remove_if_last(struct comm_str *cs);
-- 
2.56.1.750.gf70dc682cf-goog

