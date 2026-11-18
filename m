Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794998110;
	b=vt1SleAUgf4XajVwQTQt0P3Fhj8BSeJ8NCOI0uQcw9Ul2TSW2U8Y1ji9orvybAyyaAq8
	 L5FX5TQ+JOzX1PMidcaNPwiTji7cLdpvWHE3ZjFU6QSrtfiCY7P951Y2Zsu0Uyaq6eKK+
	 pDPW/T9jbuCI3j8Lwt/EFwazWzyz1x0tic6+HJ0LA6YrvMgpRnfVF6SPdh7CCyfAV4Ye3
	 kUI5dOfF2hJdO5YuAznEONQlZhvXG1HIkz2iDD4h/6HcTMKFnnFSdVcX1soIkDuRMH1KW
	 6mcpPb8jzsFiKIQpqLmuonCvpLP1NTekIcokitTfsg2cHg6hebSoybHcR/+spIdKSfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ul29onCED1G/GzZehDklBOv4YKtGEiuVI0wtuD2b89k=;
	b=pydRuWL99wwaNGaPb3lE8iJxKGWe11JX0PQzKz1OgK1dgY003kemYXWDg0OOL3Fg1Xv0
	 dm2y032xUdi1oCpVsUzvwTRbJx1POpYapqkFv865Lypm5tkZLBArYSG8+obDL6HcpEdYK
	 nO+speASqqF0XrRx5sjPia55NW0zheND842zpsnI/hYS1TO5DlMCPr7b4MgP+KSfz1TXO
	 Qca8Dp9MYacHwai2VmY372T8PHPlLk1pagnlM2bx+c5p73DplbpVL1OLsD4gWrOx4mbEY
	 RdYyEVy6Zaf1a9+HhmDjdd+yKzmnHV2m2QFsOuFjJOUPvFpydaUh3msB0QW4RYf6MIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JvAFOh82;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42346606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:35:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42346606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JvAFOh82
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2efd824d492so3751805ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794998109; x=1795602909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ul29onCED1G/GzZehDklBOv4YKtGEiuVI0wtuD2b89k=;
        b=JvAFOh82Q8TfZvVvLezW8C8XFuRyy6oqF1g2WBHSOGy4oAVbiZoUp7n3tgRIO/wLAO
         NRspmhK9hspV+881yrCryQnkWhtxQo13l/Jg6UNMDbzgeqCmXAaUy2Di2yitOlN9nvlq
         suLloRigHHX4QmUzCZ5tqUYl5gMHkicdCouth7UK1s3sW0A26Gyxhfzog0OkCJWssv6r
         VV2XwQ0qwp2CbovniJdno35V6VGPm+6gNa2VDC4Y9ZD5Fv3gzL2lgKgwaBetK0jm0vDK
         JrB0ucV8e7heJnaeMjxH60YI37HGYhA+DydsT/UtueEDCINpTxKY1RzUTD7DLvMNo1uT
         D45w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794998109; x=1795602909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ul29onCED1G/GzZehDklBOv4YKtGEiuVI0wtuD2b89k=;
        b=1sz8geijtymcXC+4etndNTSKxEwJnhdK2JNWK8VR1W3mSk0cAQvdmITCvJMEeDFKZY
         yg4vs0N5oMxFNPIu5nabsb1v3TCeA+56gquQqp0q9CDMBizM1m+pa58EQnQnNEcDlBXr
         qzYcLbOYjmwDwnUn/08UA38r3/HAaStMB1uAAxxF7zY38VnrMm+fZn305zz0L3QQWi3c
         W4FlOHN3bYJzyGFmNRrpIzBY45KpvE5vgmUxCHDI0d+pOjhOLWVjlx+bJAhy3MLgnNaT
         QjFKcwca+V/gxI8r3maLbG2xmMbKsUmgv9QVtZiaQfiv/MBbvteicSONyek3zPWPUvGr
         NbXg==
X-Forwarded-Encrypted: i=1; AL+hErG/TtTU0j1JFwlY97/PYJv15yEgA1lW3FVjuBsRSplmd5lS10qq3MaWeG3kFL5iWbPxdrmlO1DM6qepxsw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+OEwg/vHxpaFsd9lCQZaZ9faXy7gYLcBOedLtxdi6xZ/0KqvF
	7znPFG/NzH60+qrPYgIgkp4VatSaEBcHZaDr0gD/ddvlmuA6YbfjZ40U
X-Gm-Gg: AZFdTZeW2mXMbXO6FMYIHYeNx4sfC1AafPUBglbeNlG8k5nPy4oCsOoTQSQBhtE2gJq
	yKWUM8ZLWzFV7Dde0X1LWIp0ZikqD9NZOYEm1mKZr6mbOuxXMzvfkXkA6WKUtfvJyyrFyCOAWqi
	6jVMPSLCKN4EwNUHoVyIyq+kwBA1C9GXSIZmHzWj9DW86uiKLnkj+vzvL16TIAicle3anWUtE+O
	HUykeC2drRfVISa7Ffq/wPzgA/Kk2csYKbfMwkO3Nl0Dese7h6wTNdLpyXNddHKuHK4HcOe/slo
	hhfRYWrhjzkTH03jpTC5sEegz9APQkX02n4ltsrlqVTx6qiL10LAH8NKVoDlODb+y9yms3JXOfy
	nhjwz94nl4GpUbxvshIHdktjUGB6p1wd0hL7iiZvmBg51X+Kky9WsxmlEZdIVcTtN4VBpMfohSe
	//0o142KQEEytnMstucwtQ8DVw3pxwjgXBhInpWZor26zJETl9vFnSEqo0yiSn2M6xJId1hfHzC
	9RnM1MzhbbOkz6Xowo1dESdCyXlMCyCciY6KtoZOMy4LF15aX0EEfi7TAU6LPbBE/7eRzvox0d1
	nGsO9RFXpOmHMuMwx7Bntr+o7a9QZdYNes7v3c+y3p6sPwGRlMU5A+HA9EDciF/Slsm26/dH4Lq
	z5h9Nr+s+y/rAXvb/loxjYDRKQ0WpcDphyftsEr+ZubZt
X-Received: by 2002:a17:90b:39a8:b0:3b3:b0f4:1beb with SMTP id 98e67ed59e1d1-3b3d074d68emr2305361a91.16.1794998109533;
        Wed, 18 Nov 2026 02:35:09 -0800 (PST)
Received: from AHUANG12-3ZHH9X.lenovo.com (static-ip-4-78-56-61.rev.dyxnet.com. [61.56.78.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d1acd118sm3757904a91.12.2026.11.18.02.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:35:09 -0800 (PST)
From: "Adrian Huang (Lenovo)" <adrianhuang0701@gmail.com>
To: Suren Baghdasaryan <surenb@google.com>,
	Lorenzo Stoakes <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	ahuang12@lenovo.com,
	"Adrian Huang (Lenovo)" <adrianhuang0701@gmail.com>
Subject: [PATCH mm-unstable v2 1/1] fs/proc/task_mmu: avoid spurious seq_file warning on interrupted VMA lookup
Date: Wed, 18 Nov 2026 18:34:21 +0800
Message-Id: <20261118103421.776-1-adrianhuang0701@gmail.com>
X-Mailer: git-send-email 2.25.1
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

Commit 5631da56c9a8 ("fs/proc/task_mmu: read proc/pid/maps under
per-vma lock") introduced the possibility of returning -EINTR from
proc_get_vma() when a fatal signal interrupts mmap_read_lock_killable().

The issue can be reproduced using stress-ng's VMA stressor, which reads
/proc/self/maps while concurrently modifying VMAs and periodically
terminates child processes with SIGKILL. The reproduced command is:

  # stress-ng --vma 0 -t 60

When the VMA lookup is interrupted, proc_get_vma() returns an error
pointer without advancing the position index. Consequently,
seq_read_iter() emits the following rate-limited informational message:

  seq_file: buggy .next function m_next did not update position index

Save the current position in priv->last_pos before checking the VMA
lookup result, allowing it to be reused by both successful and error
paths. Advance the position index when returning an error to avoid
the spurious warning, while preserving the original error handling.

Suggested-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Signed-off-by: Adrian Huang (Lenovo) <adrianhuang0701@gmail.com>
---
Changes since v1:
  - Simplify the error handling and comments as suggested by Lorenzo.
  - Clarify the fatal-signal trigger and the cosmetic nature of the warning.

 fs/proc/task_mmu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index 22361607020d..564e52f7ddc6 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -216,16 +216,17 @@ static struct vm_area_struct *proc_get_vma(struct seq_file *m, loff_t *ppos)
 
 retry:
 	vma = get_next_vma(priv, *ppos);
-	/* EINTR of EAGAIN is possible */
+	/* Store previous position to be able to restart if needed */
+	priv->last_pos = *ppos;
 	if (IS_ERR(vma)) {
 		if (PTR_ERR(vma) == -EAGAIN && fallback_to_mmap_lock(priv, *ppos))
 			goto retry;
 
+		/* Advance to avoid spurious buggy seq warning in dmesg */
+		(*ppos)++;
 		return vma;
 	}
 
-	/* Store previous position to be able to restart if needed */
-	priv->last_pos = *ppos;
 	if (vma) {
 		/*
 		 * Track the end of the reported vma to ensure position changes
-- 
2.43.0

