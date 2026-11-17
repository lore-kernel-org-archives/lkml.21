Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794941357;
	b=h79bo8JoyNATIusOMAJ2Pg3/iA/xnTzTX+IVbutOmjNI8+ej4l3AYHKAJR7MHd2QEw84
	 0ORLNo/FWH6VPH7Iep5B0G63keUwJxkyv+PwOfehFWZXRtCnRprxgH5iSO4PhXOpIl6kN
	 h1Z4tlEboVBoh4nq7I2lL8UYOGvLz4kXvYA6ebQj5l1Vh9SxT+LbtD8Z16QjlRdBkHa9r
	 kIx4pFYNC54grLceDnVIkKbmvYuC7pLxrs+uQCVS+L+Yj1jDpohfIRV6Q08ETRWLSqWLy
	 9oJL4HuvEt/HPYPwdtS9EMo2Ir8pH2gYyFQXokh+YNj98k0lZ3+F2YOojl9KwjYNHkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794941357;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=gRNK11YgcY8cyMOB0/Yo8DNfUbiIMkO6zRKLCyKH5W0=;
	b=bzzMfgNHmBM/bUiyqgA1ZYTbxbbz0saQmeJDzRbp+TKV1yuUnpzTnf1wLdiD6DSQAg3o
	 Z2uprcIwLUxq+szoZfZtaVpP2IzhYg4P80uzAWt55OiCCe11/KpaswqUZSAHx3eLdQebx
	 jX93Nkl7dyTyCO0bK99ajV3OAL2zvVJCWDVS/CyNlyWkXdZGvyDxIHTrFVYvF0n8SMkah
	 LIeOzNYslgN3CGtMnDIhsBrp9oPOoyAR7DSuGYFmLom4CU6fLkTz6f797Bi17Lz8kjRYS
	 2zcXc6+p7AhgiKLwyTXBD4IkFh5fm4mUjYl45pdTYIzHO0m0/dW01csNV1+eO8NPIrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="h/ph+T14";
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E44606A888
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:49:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20E44606A888
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=h/ph+T14
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b25d977b91so125164c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794941356; x=1795546156; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gRNK11YgcY8cyMOB0/Yo8DNfUbiIMkO6zRKLCyKH5W0=;
        b=h/ph+T143MTdkEUM9+rF3Ol0mZmjixyyX8F4HbpBuYsH2n+8fwXGw2oXPufVenKweA
         6eSythBIxd9kJMnAgEujXiOHYyJAWkBrGDyh17t873RFsLR26Dx+s4Nn6FvVwB+wEVH7
         hrnKeuZvwh5M9S6DROCv5IH5efAx7nDQ7nllCwHvMcIuJ2TVJkVB39oM8FuruIgi2TFy
         47atAWJBCBvjkjUWQmrck4l9UwdH6ocp1YmY5OQLjr8aJ+vnuHMhsLm+E9tQ655ktEaV
         dVKsSbP5mF7QOYkBsQisVcg41s2Y5MXCPdRf55ZxDNBLgVfRpcUeM+GZvN3M7WU5X9sy
         rlpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794941356; x=1795546156;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gRNK11YgcY8cyMOB0/Yo8DNfUbiIMkO6zRKLCyKH5W0=;
        b=j2v/D0VnPLdVE4xkWZR3o+QEGiuwN8W+RegDFF9hS3wQP5WEnqaJ5B95WO+ICpGEr4
         n2bH3qqVZjNMRAFIMoLO+/5vyBgX6CxBXFOJrvHl0wtJXz7UBSVX+7EgUKEcBkx+yrHs
         X3k6RZncMgxwddGF2qyJZKG5uLjb6B8h1EV1I1ipeQzraqAeu4oxrz/dcLWIk4HjS8qN
         0/tkjzpjviO9a2lX/JMWZq97E+z4eV9zDCMqBEpHs+ZdqtYAMEQNJBD6Qur6VyxZ3A5Z
         XjyxC/gNCBwLimpUpdFLrRNLGQ1L0u/rT9iVMmyBUAJhGploJP/OvQkaAv4vOofGX4RK
         1WoA==
X-Forwarded-Encrypted: i=1; AL+hErH5kqTut5aNkVVNRKEm/Pe8qrPbIg7LP7PDPL9bu7LcLfM/ZS+WvSu6alEtWdqvd/op3s3LaoJqWMUuO6o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sil7eppO4HInZja6LOEq5VUAa6GrCHbDXuf7uhEd4Uo2QC6z+
	/RckTLzN9KtI2GbEA1SwzluuMoLY18wjVgR3+2U1g0JT4nm18BudW99O2jnWqb5Cbwf9pM/ajiD
	tRHkHcJbibg==
X-Received: from dlbur7-n2.prod.google.com ([2002:a05:7022:ea47:20b0:1b3:b4d2:9bba])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:f509:b0:168:3243:c91a
 with SMTP id a92af1059eb24-1b543cb5110mr354520c88.13.1794941356013; Tue, 17
 Nov 2026 10:49:16 -0800 (PST)
Date: Tue, 17 Nov 2026 10:48:27 -0800
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
Message-ID: <20261117184844.99889-7-irogers@google.com>
Subject: [PATCH v14 06/23] perf comm: Add __guarded_by annotations to struct comm_strs
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Weilin Wang <weilin.wang@intel.com>, linux-perf-users@vger.kernel.org, 
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
2.56.1.703.gf848ed807c-goog

