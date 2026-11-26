Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795673316;
	b=jjntJRBFSEuoHdGFIPmUdMu05vkx4l/nRTpYnN9MNpkz5hfsfwZ6rUm8F+mLwRDXMKVo
	 tU5NvX4nFVZfHWc7bjEE/l9+dNRMHdo+FwUkH6ytR5KjXeozLkoTPh+NH4wPLFmh0Vt80
	 erPvpj5DIPejGVlBHP/5E1ZHJsD3WeCOotO/9HXbfaLUvGFWQE7s9yk+Oq1zwvSVwz5LZ
	 H2uvb6E0EwKj9l54imA7w1r1FvPtcD2Kg7oBsyRCwiuRpkO7istGtleLIg5VsYXfBIJBB
	 5d9NaAPzjMEa/mvVCoEoiUeQRpjwppOMmhnvY5uNTgVXVgcxPnEVEw8leE54lHMI53g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795673316;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1KJK27VBvu4wl3DCI+QxhINQYQCh2tz3wSZqtMb9WEQ=;
	b=GJEeN2HKVNUKNSlBusEcPjhtEBA3p8LkZQ5bR3su+kHnon6k6Z2FAH1Fn/ImK3PTHD4v
	 0mmmf8RLdMOXpCG1kk7/DW1Di8sDe+UGdiB5feGMg6t69UALEa0r0+YLnkr4Pixa4I1MT
	 z1Who1e9bjLs9eq5hJkQxsz38AEq6bMvysgcPQqC56TFDaIV+FcOM9RNVNh3ilsYlt0we
	 3/hHGOC5ibhxEff8RDNotYHUjfJiaX2tC+9kxSv51oSrRCknes963fabPZWrLDDzx+HZT
	 pSuJ0/SlGgX8vZ0FTpeOA6FG6z6FO4y76WaHZ0wG1m88y3+gT4PXrl71W6FeLgxIk0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OBHMZoIs;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DB4606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:08:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2DB4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OBHMZoIs
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b501791bb5so615249a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795673315; x=1796278115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1KJK27VBvu4wl3DCI+QxhINQYQCh2tz3wSZqtMb9WEQ=;
        b=OBHMZoIszhXVZhBFy0YvsVDqVYXnRw4ZCPO1xIt2c6/QYXBp/ynZHicl7x5IlOJM9P
         q7af7HLHehQq6jqdgdO4Co92EJghiR0WQ2IUIoS+0hYmoKSVIcAvgTRpAFxpgDxRBZQK
         fgcLdYH02O4JYH1BGjluM0IvlkI6MqU3ORXNjAoAIkMLs+PzWMGHKmq18gMp9tm/wQCO
         v7VagIBoZlVdXuAy1Eiji2sMZ4945e06/1yL3vUruTNTk2sJnOnlENz45LeqeO05d787
         z6usTsddaTSlo4d90xHpu0Ju7BLCFFUVI7RgIqlzGp4wLhIPU8ejEEtokX7CCrr2Pnsi
         DWyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795673315; x=1796278115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1KJK27VBvu4wl3DCI+QxhINQYQCh2tz3wSZqtMb9WEQ=;
        b=QcZ00Zxz94A6HAYMW6keVFVmdfWtX5WAV1pgywr/mVJxinnJrqwWyZAVqrdvmNwMZo
         oDtnvUggmwFRdzV2PFYFJt7ldTTvEL2DiZXjEuz5SGce6jTZqLvT+Q4iFlhsY8D3dCrq
         sd7hX1TX6rlu+FSNH0skWyOrYYksfGJFRLopkAoF6jA0HIMIlVHwb7/Y7jZ3qUN/mi97
         40rrIvGCnF2iqbqTrv/YbZIoLm7chWdFnrGoJYSiJz0wvqnAbPdfPHoURqBX8Gu7bhTg
         74wrqH5B0akPfwmngRyMAlDOPfEMPWZQk6A2+1MjUXwJtgpOIBI3oDNC5hYprQ0eaoNj
         GOIw==
X-Forwarded-Encrypted: i=1; AL+hErEF88MSAbCF9mVXzxxxkzhXylLZS4pkB75yrHAr/TE4ijM/agWXfEw8qpz72PbCQs6tV8Ecx2RgMBPHexw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3j7iWyFSYpcKGsJPnqSqliDuQwA5E1bbdGS0V7Egqr0F8P11g
	nsMTutjVfKqJulDpaIPXG4uTj6WmAMmeIZC/Ek99tz0F9g6kf7wklMt1
X-Gm-Gg: AZFdTZe5o9schsHqIvn4mkoDNa4/b4rr+mwkVO4N48/HBGzEBLUwe20Jo1vhRNVzufd
	+J4UZPct8cWGvMqcJ23YC7CttN8FTT8ZvaweJAX1hphE4dUV3Zv37EN/ESE8phDyJVRqWUxDPW2
	idFtyG3QBUndxqe+rDYa/C8yvPoLx3kr6xeEe17pCyQ5IpdGYcF0xd0s/AmhZxQwD81o75GtYly
	708zcthGk2MOsBcSl4aRVQIUb1TblLz9XyH1jahDUbo905NsjuTmBzO7IZgW4hS2nbnxrBKOEB9
	kjopU2pXxwuP0e/cvSZKJ2U7hXaM9GQ8HZNdS/Ufw6wYWIjOHLEedPdQ87KCxOH1Th4W+4PggoM
	i9kwN5FuNlku3isAXU9dv6218hNlPJG0QFF51ofEJlNRFagZosb4G1niPq04jTIlBhm1e3zF5NL
	rVb7tQuh7UsThPhQkzZniYfCcwQjKIl2U6mHAdCj6hiQ9zo5JEn64dol4lEqnFnxd2FesMoqtD5
	/dFtAAN/51gdafe9MVQdVWr/ASNUVHGRK6oXS55Z5/OrqH/hxxOwMA7JJFhjdF2hwb7yZGN90Q/
	SPpk9MRC8WKeHzN3uD1VvvkGUyxnbVXRfYMoHOALkKYoEl0lyBchnPW3pd0n22HdpiDT/fEyYrm
	9gtUIeOv/gzVCp/jfZoQBsXtW0oJDryvfTWAiFL7ZjCLkyn7rUs/5YoF4PtgdD3Fyp1LAKBJHnX
	tpxeNNZK2isUXvxdGA3G/heFY/dKSTfa273gpO79bmeBfIiw8BSohFNp5gZV4FVw==
X-Received: by 2002:a17:90b:57c4:b0:3b0:9cc6:62ba with SMTP id 98e67ed59e1d1-3b41caead33mr17941240a91.38.1795673314993;
        Wed, 25 Nov 2026 22:08:34 -0800 (PST)
Received: from LAPTOP-3B99V33A (ec2-3-38-183-164.ap-northeast-2.compute.amazonaws.com. [3.38.183.164])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b6fe711sm13646238a91.1.2026.11.25.22.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:08:34 -0800 (PST)
From: "Bin Luo (University of Electronic Science and Technology of China)" <luob87709@gmail.com>
To: rafael@kernel.org
Cc: tony.luck@intel.com,
	bp@alien8.de,
	guohanjun@huawei.com,
	mchehab@kernel.org,
	xueshuai@linux.alibaba.com,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ACPI: APEI: GHES: sync ghes_proc_irq_work before freeing ghes
Date: Thu, 26 Nov 2026 14:08:25 +0800
Message-ID: <20261126060825.910-1-luob87709@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
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

NMI, SEA, and SDEI handlers enqueue estatus nodes holding a raw
estatus_node->ghes pointer onto ghes_estatus_llist and schedule
ghes_proc_irq_work to run ghes_proc_in_irq().

During ghes_remove(), ghes_nmi_remove(), ghes_sea_remove(), and
apei_sdei_unregister_ghes() stop further callbacks and synchronize RCU,
but do not synchronize ghes_proc_irq_work before ghes_fini() and
kfree(ghes). In addition, ghes_in_nmi_spool_from_list() calls
irq_work_queue(&ghes_proc_irq_work) after rcu_read_unlock(), leaving a
window where synchronize_rcu() can finish before the irq_work is queued.

Move irq_work_queue(&ghes_proc_irq_work) inside the RCU read-side
critical section in ghes_in_nmi_spool_from_list(), and call
irq_work_sync(&ghes_proc_irq_work) in the NMI, SEA, and SDEI removal
paths so all queued estatus nodes for the removed source are drained
before ghes is freed.

Fixes: 67eb2e990767 ("ACPI, APEI, GHES, printk support for recoverable error via NMI")
Signed-off-by: Bin Luo (University of Electronic Science and Technology of China) <luob87709@gmail.com>
---
Found by code inspection. Compile-tested on x86_64 with W=1 and KASAN
(drivers/acpi/apei/ghes.o); not runtime-tested on APEI/NMI hardware.

 drivers/acpi/apei/ghes.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
index 5d888c8..75dd603 100644
--- a/drivers/acpi/apei/ghes.c
+++ b/drivers/acpi/apei/ghes.c
@@ -1483,10 +1483,10 @@ static int __maybe_unused ghes_in_nmi_spool_from_list(struct list_head *rcu_list
 		if (!ghes_in_nmi_queue_one_entry(ghes, fixmap_idx))
 			ret = 0;
 	}
-	rcu_read_unlock();
 
 	if (IS_ENABLED(CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG) && !ret)
 		irq_work_queue(&ghes_proc_irq_work);
+	rcu_read_unlock();
 
 	return ret;
 }
@@ -1600,6 +1600,7 @@ static void ghes_sea_remove(struct ghes *ghes)
 	mutex_unlock(&ghes_list_mutex);
 	ghes_unmap_error_status(ghes);
 	synchronize_rcu();
+	irq_work_sync(&ghes_proc_irq_work);
 }
 #else /* CONFIG_ACPI_APEI_SEA */
 static inline int ghes_sea_add(struct ghes *ghes) { return -EINVAL; }
@@ -1663,10 +1664,11 @@ static void ghes_nmi_remove(struct ghes *ghes)
 	ghes_unmap_error_status(ghes);
 
 	/*
-	 * To synchronize with NMI handler, ghes can only be
-	 * freed after NMI handler finishes.
+	 * To synchronize with NMI handler and any queued estatus work,
+	 * ghes can only be freed after both complete.
 	 */
 	synchronize_rcu();
+	irq_work_sync(&ghes_proc_irq_work);
 }
 #else /* CONFIG_HAVE_ACPI_APEI_NMI */
 static inline int ghes_nmi_add(struct ghes *ghes) { return -EINVAL; }
@@ -1921,6 +1923,7 @@ static void ghes_remove(struct platform_device *ghes_dev)
 				ERR_PTR(rc));
 			return;
 		}
+		irq_work_sync(&ghes_proc_irq_work);
 		break;
 	default:
 		BUG();
-- 
2.43.0

