Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108151;
	b=fP35u6fgqgGrBHK0K/Vi8AmaMEHOR4GbC68EeYuVYOu0/6JOAt2Wu795KpjtVC+QpCLH
	 HYqqSQqIDjqK3QrsGXBDdywf3Ne5wQIJQ+kzH7K1YzKHZLflEgMJNA/IcHaI045B5mSuL
	 C44r+oEDZ7XTkAuWozlgbgMuGe0fbCsLT/35d7fkcNFA141yo2ONmYwe1YK3EaxSPnrKg
	 /wbxEUZWRr6IimLoFWHs1mq8xgCOR6El2vlF6yKkxmg1lu1Pci8c8sN+TKuKvPdmISDY0
	 9JNIDvmFnoCtup+5sdoPqMVAPl/TjO8ZGAbA3thrtipwos4hPjfAE+oC1RuCbaoTwrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108151;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=+J9B5x5CJ2GgYpJNi/eyfCmiUuk3TgTy4lgVddwqdZA=;
	b=I5Ewq28uC1OQoZDU8QV+0Q/tEQ1BEsJuKSuFYBqmpu9UL3SM07jgmpUdB7TNJCOBe7Gf
	 ecCGPdtLmrhxsE0OauJ5CNRA0nqYhSEosgAnEhiswIcR+0QZaWNZcPVXzRGuojrXA8WaF
	 cCGnPXc8FN5fFVBKQGm9xORLHjs2OJJU9eE7eSMHl4tyhT7ODfgZh0mPvtWfPnCXn+fSr
	 n59w1Nj+VGHNWw+TZ3x8a+1Cqf0UgRVR2XqTYUrTM2SReYuEfV9ul+nkUpcYDl2i7yCEQ
	 hhvMiFmYyRxY+AiW14SEIbCNeX/1b4eJrjjUU+avXgJ5lM+yKCKt56r7gRBaEuoJuzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aN+uPZr7;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6771E60A3827
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:09:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6771E60A3827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aN+uPZr7
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3846d5f54c1so1032216eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108150; x=1795712950; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+J9B5x5CJ2GgYpJNi/eyfCmiUuk3TgTy4lgVddwqdZA=;
        b=aN+uPZr7wvfl+O7to2Jmv3qM3aVXrZq0hqcvto/D0rwzmC/S+iOKsvLNqL0WCK9X2w
         gcc+v/eQBS05F+uEyYoXsnpAXF+flm20gQXrCYPGZq7tL4dr2D/iVbVFD6psuV5GUwXK
         aXTX8RJv5x3LArgLT7BhcItRLIodd4pzl6JDrNITgC3Dz50kioXfxAporTnsep81Mtam
         +rzKvWgjhvuw13JfFA4tsat2G23JTCjrr+mXGfPu+U7/0m/4Ipb9HJiTidgLBEw1nQug
         NuHBPvK/A8W9oS9dlbtmsVJqszvpErPvLxbpxe+KAyjOO27zclzPTvwH4OAIVe0Diypx
         PBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108150; x=1795712950;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+J9B5x5CJ2GgYpJNi/eyfCmiUuk3TgTy4lgVddwqdZA=;
        b=qlUwxtjhVd4yNbQs4YKeksI9ImwFI4FfADIAAYnsvR0MKKdD222hOiYgR6H2mEskUl
         KfZCh8WDBCQ17j2QMzz7PGVyzfDstfCxdxphpmUf75SLJTI13ZmwGwVAc5WnR9d8DwDP
         DC6PKNiy9113gUAhTgG8++oaHpW6vV/AlQDpsZDSv1GbRMWS3VFigo3OxP9xJAj53Ymd
         29o116qdtFyIYxlCfW3MOGv5X0n35/oI5kZ+agx0Sy58BF1mj/1nnVX1ESEUsx23cnXc
         67P5wiUqzu6uf8o5qj1ZoOMar42WWqzCiTOIMdyVc1de4FSIM4F6Gsih2YrdamQgBk1P
         G+2g==
X-Forwarded-Encrypted: i=1; AL+hErH5g7/FeW6I9mUZhQ1A/loY4meriQsplzMP0G2eNrCbgsLkPL2/52ryF02RrzEI4hLcUPqWch3nmxiL/Zs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8aQ5SQXeTOoXGMSd0lcTFk8zuMwJYEYXM/sh/Ab3ontaQZGQR2
	jvDXqSiBsZrtJTh0LD9r5QlZ4m+ZUROdyFGsFkc8qoW1oSTSO5p/G91dTqLlmM4Jqig6lXv2Ebk
	RsB5rG91qUQ==
X-Received: from dyji33.prod.google.com ([2002:a05:7300:7a21:b0:36c:9a6e:5413])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:9e08:b0:379:7bb6:9c4b
 with SMTP id 5a478bee46e88-38281bfc037mr5432157eec.39.1795108149205; Thu, 19
 Nov 2026 09:09:09 -0800 (PST)
Date: Thu, 19 Nov 2026 09:09:05 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119170905.1530613-1-irogers@google.com>
Subject: [PATCH] scsi: pm8001: Fix abort completion status in pm8001_mpi_task_abort_resp()
From: Ian Rogers <irogers@google.com>
To: Jack Wang <jinpu.wang@cloud.ionos.com>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In pm8001_mpi_task_abort_resp(), the IO_NOT_VALID branch assigns
TMF_RESP_FUNC_FAILED (enum tmf_resp, 5) to ts->resp (enum
service_response) instead of ts->stat, leaving ts->stat at 0. In
addition, switch (status) has no default case, so any other non-zero
firmware abort failure status leaves both ts->resp and ts->stat at
their zero-initialized values (SAS_TASK_COMPLETE and
SAS_SAM_STAT_GOOD), causing sas_execute_internal_abort() to falsely
treat a failed abort as TMF_RESP_FUNC_COMPLETE.

Set ts->resp = SAS_TASK_COMPLETE and ts->stat = TMF_RESP_FUNC_FAILED
for both IO_NOT_VALID and default failure statuses, matching libsas
and hisi_sas expectations.

Found via Clang -Wassign-enum on an x86_64 allyesconfig build.
Verified by building drivers/scsi/pm8001/pm8001_hwi.o with LLVM=1 W=1
(-Werror) and -Wassign-enum, and with a standalone C reproducer under
ASan/UBSan; not runtime-tested on physical PM8001/PM80xx hardware.

Fixes: dbf9bfe61571 ("[SCSI] pm8001: add SAS/SATA HBA driver")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/scsi/pm8001/pm8001_hwi.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/pm8001/pm8001_hwi.c b/drivers/scsi/pm8001/pm8001_hwi.c
index 55a01e533fd1..b8c59c152d89 100644
--- a/drivers/scsi/pm8001/pm8001_hwi.c
+++ b/drivers/scsi/pm8001/pm8001_hwi.c
@@ -3478,7 +3478,12 @@ int pm8001_mpi_task_abort_resp(struct pm8001_hba_info *pm8001_ha, void *piomb)
 		break;
 	case IO_NOT_VALID:
 		pm8001_dbg(pm8001_ha, FAIL, "IO_NOT_VALID for tag %#x\n", tag);
-		ts->resp = TMF_RESP_FUNC_FAILED;
+		ts->resp = SAS_TASK_COMPLETE;
+		ts->stat = TMF_RESP_FUNC_FAILED;
+		break;
+	default:
+		ts->resp = SAS_TASK_COMPLETE;
+		ts->stat = TMF_RESP_FUNC_FAILED;
 		break;
 	}
 	spin_lock_irqsave(&t->task_state_lock, flags);
-- 
2.56.1.708.g77570a6a1d-goog

