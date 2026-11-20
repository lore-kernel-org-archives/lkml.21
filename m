Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795197532;
	b=JulYvAc6vJPukmsqfM9G7bjyI1oVyDP1QWF96Pm9KbdRDpnk6QT9GuwwYVki9SBazcwA
	 KC5LxAaFBDdndYqZ5egdHFMDoTK0KTj7jftgdsluug7DdLlDOv/v71qwThXV+8DmfbGeP
	 IlQA71MfsjNdsBffV4GLgGHPfDy/weP32Nh//s9TrsVJde43s8sItEKQ1EtrZ2d+gChet
	 dJLYeDWAcZsw5HtWMiEavR4jV/ABNtjMcNQkgTExE6bGnNBj0Fl0mGZa/JPpHdY1wKGWy
	 2U/J6Xt74G5eYBsc7W9JFlirs7Ky3IKexfH36Hfr4qVutAf8LQMtR3oe55kppGccgIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795197532;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7nDRG9zrad8XZYWJ2RuZhWhptkwYw+WrRQqA28jZw/k=;
	b=fXAxBOMnnZiJktkUos1ft384gSvJ1mQNOU2IKb9Ww5ZKCUFlj6Ag1LC0DG1NWSnxwLyf
	 r77lzMnnvnS83GPGFxgw7xJS6tVj/HneMCne6810odrq3cNC5XdM/YN7h3YEc60N4lTa1
	 nDU9MclMK1UliaqYkRlERgahPXqBvMYeSPCtl/un4yJe9UAJmJeeK99VcnGLTw45Qm6N+
	 +O27a+2Q1YjKSqWMctr8FoiQ2OpEAdCEQ7/eqIk6kYg5UL54qGgkNNZZpIaL350NCHTfk
	 ksTSQuBqee2GH5U5Vre+uWvApSD6/wLoCnlLlUY248M+fEvrbGdP8JXLMoslLr1Kk8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uDjDauzO;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DD160A261E
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:58:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28DD160A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uDjDauzO
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-14394530ec6so1852761c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795197531; x=1795802331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7nDRG9zrad8XZYWJ2RuZhWhptkwYw+WrRQqA28jZw/k=;
        b=uDjDauzO+yHPOyuhPIgIu4Vcr9VVJ2nIRKVnXWsaY9sfg5H8TdEVaDvbbblBMl/Zq8
         6nvKrf9RcDf1QOYEbsNUXI5ErWFO2RwWulx3OATD1nvKMgoSKqBN+f9wyjhNiDi4SqGi
         X1U7rqovWvdWuUTztQdoXVMy99Fga2+gegb9H+joOirHQwazISwiOCv7lFrnFsH7wNOv
         kBli1uX2dux2yjS3ZqtLqvYrVnoQtxWwXrS8qWjCr8kquCzCgviidUL+C+Zn447B1NWt
         RfNZFU+JLuE18vrJyt/EjboNzecmx9cNJ+AU1cseCTDIwFgt8ySqqjr4gR/84RJGbxqo
         GVrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795197531; x=1795802331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7nDRG9zrad8XZYWJ2RuZhWhptkwYw+WrRQqA28jZw/k=;
        b=NE3IC6D3x44DX2wAQGoCCNwY4z8tsfrNWLWqzgYj28h/C3sept96nEdt/vNCpSoB3/
         b7JonQ72k+WvAcuUD/BqWrxVE0LoO4QA2F3HTfYxWZTlYpDFAQ/th2oGf8s3eGrvkIm1
         P3Jemtm8BsB3EylgUB1ACdIW48vaHV2LRCmwPeroaoxSoAYXtzRfqkZMBTyqkGI/aRpo
         cmoEPeu0iVYEoF24Sc4SM7nRPoHM6XtMsS71VrLA23KOb5JXH92AXzni0xEoQ0FXQWV4
         bQ6Rf267p20UPXo1ws5/J2JRxBURkACN9/rZCEDkvT6ueqk5z9J1SBkFyk99g8wTZNoc
         ioXw==
X-Forwarded-Encrypted: i=1; AL+hErFWJu+9vSBKg9K7TBc6CHma4NzCnypAHiNqwkQAOeFOSEBbzLFD2FG8a/Rur6/LWut64VCe+a2InlUZsXE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9R6RvOnba7/tiXxNbHiAYfdeK8ffGd+q8WapW+e8ZJMzAl07CN
	8km5VBuDMCyXe6ZlWPjShfs9MLUJzkNDZoxMEZ46iwxBMNNw4WB6q3GO
X-Gm-Gg: AYBFou3YcIJO0V3+fJ2UVYhzCNY/9CRCS6KQyA51ILa1puPcCANSWCtrE6Bg61g3rEc
	jThdva5ISUw0AnnrTtPlWKHlPxsgugn7lv4BKg9xgjYLSAC9hNXOAGtFUkmgS6FUTdABp3Be9rQ
	L1dwYz+PbEBcW5QUqMKXGaY+AKPOH2lVPSaUqsdzL3ZEjAhS2fv8jgHvI44MGlx/mr4GZsn1r+u
	db21mXNx6zcoKELPWbcLXHBwlls5ls/Qto+qyKo8QexYCxo9/ifC3s8Hc3tWCAwajpRp7qPFkD/
	4VNxoSaKnGLIrKfJdag97INIJBwgPpuzeR5AP+YaZqV67zhtUdQfr+DKs1KhTm0nlz/MffRNdB6
	byC9elfOy9W9YhQvoeHcVq1H1qrKPthV39VZ89lShjI0zCbfZxFkODffTZqbv5xjNJaMlFiWMCZ
	Iopj/Ywxlvv9UOVaCI75aE+/zyq1KKPB7j8Fd2fwcGvh0188aht6oy/IR+tsp9Sa2H+ABmnNbuZ
	Gb0TZLKI6eq/H55GVM8lkJE2YsRjkIalsfYZftqKVmX5/BK8j2juOskF0sSPq9+KwMz7/3LJxSF
	SPLeaYVu5RjRQnbXHrWl
X-Received: by 2002:a05:7022:c84:b0:15d:fb47:4268 with SMTP id a92af1059eb24-1b5568c9b56mr3220926c88.21.1795197531216;
        Fri, 20 Nov 2026 09:58:51 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b562a82b3fsm681084c88.5.2026.11.20.09.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 09:58:50 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: linux-perf-users@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH 3/3] perf vendor events amd: Fix a misspelling in the amdzen3 table
Date: Fri, 20 Nov 2026 17:58:40 +0000
Message-ID: <20261120175840.1274637-4-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120175840.1274637-1-takano32@gmail.com>
References: <20261120175840.1274637-1-takano32@gmail.com>
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

One word is misspelled in the amdzen3 branch table: "Instrcution" instead
of "Instruction" in the BriefDescription of bp_l1_tlb_fetch_hit.if4k, so
`perf list` prints the misspelling as it is.

Only the description changes.  Regenerating the tables with

  jevents.py x86 all tools/perf/pmu-events/arch out.c out-str.c

leaves the generated table and the string table identical except for that
one word: every event name and event code is untouched, and the string
table does not change size.

Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 tools/perf/pmu-events/arch/x86/amdzen3/branch.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/pmu-events/arch/x86/amdzen3/branch.json b/tools/perf/pmu-events/arch/x86/amdzen3/branch.json
index 018a7fe94fb9..a3b53845ca19 100644
--- a/tools/perf/pmu-events/arch/x86/amdzen3/branch.json
+++ b/tools/perf/pmu-events/arch/x86/amdzen3/branch.json
@@ -42,7 +42,7 @@
   {
     "EventName": "bp_l1_tlb_fetch_hit.if4k",
     "EventCode": "0x94",
-    "BriefDescription": "The number of instruction fetches that hit in the L1 ITLB. L1 Instrcution TLB hit (4K or 16K page size).",
+    "BriefDescription": "The number of instruction fetches that hit in the L1 ITLB. L1 Instruction TLB hit (4K or 16K page size).",
     "UMask": "0x01"
   },
   {
-- 
2.53.0

