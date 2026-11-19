Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795066813;
	b=kmDp+j1ss9eHZDVngVpR1P/IR6DwySUbaAjKQJ06tWbxmmrXCmCEiOOkCWPspGZnAKwP
	 LiZvrB5KyJVxXZ92GI1f/R7TTZhTmQH61+TXqpJqSRJq2CrSOBpnfAcbJrGEabCuyjRXJ
	 1DxeodUr4uk2lhr0MDsVn7fi59Nkj0Kh88CEwdXw56AfunX/3V2VHYBsWnHqQvNZVcBCN
	 yvrm3H8+ezpKo69L0XpZIRo4MvwrXRGHvbb2zqW+2ahTpd8gp9qvsqPGV0oHKz59tfS+z
	 gduDL3trFAM2gh+T41i0ipTr1BR6H+9RbB7WiOXkdeGx5sfAY2TRJQeBFXaFVFZjtng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795066813;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YrU8dwo+qObApnyB8k+0XisvH5XOHsjnHWT20h+JoTM=;
	b=b+SK1Xa5lSq75Io+z72MkYdEMinHmxt5HD/v2lrzSsvorLCl/wD5Tq4bQJA7by57AP8h
	 Fx4z68r9O4VtZHFBAE271j2qlzmw8E3g/oHrKsydZ5uL4k/JhpleXs+wTWaZ/E+7+qS6K
	 obi4ZLK78Bw0P/lDU6IIFMJ5Imh/0GyLJn0LmtKDpV0N9ZKMYhdgaD/zJ01AHIedepJPZ
	 VtC3Ubz5COkCc/9XHkxFGf5caIKUGFS4NgxKFCOys6TKsHLij/wAS806SXjWhROM8oaiY
	 EMFMb3RIv8JUCY6KK7/jBRkiZwCMuE/4jFhxPYTddRuWdPKPteM2ZtfI9n9zgvb6koA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eItNKoKC;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466D1606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 466D1606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eItNKoKC
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1b3ada81853so2120418c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795066812; x=1795671612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YrU8dwo+qObApnyB8k+0XisvH5XOHsjnHWT20h+JoTM=;
        b=eItNKoKCi0OOKEyUN53A2E7NPrPnl23vAdEDt08n5d2gdZcNhIwopmPvYj5pV7vrbM
         GQv/vd9kelF3yYP1H+IY+Igo2TO6zIFbY02P5/lPijREJZnaI58kE8PmwNMQQgW6Pg91
         2CKwok02wmp6qC7GHplcxsJvDBAGsPstNE3Jk9VYigTEgLNUt8kJ2M5zwDmb7zsZivNO
         msrkV4TYDS9Jh1gVcb0z+HyfqPZsiAxAMPjyFj12Lw80xDx1CyJ1h36yP0c0ThEGPmW/
         N2Pp4Jv8DXgi3VXYSP/miQfU2KicBi6ZTEY1+cJV75bq2AbX/9c7OFdDMliQNhViGnDp
         xLQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795066812; x=1795671612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YrU8dwo+qObApnyB8k+0XisvH5XOHsjnHWT20h+JoTM=;
        b=uxCWFobxnX0Tnx02p9c9OHmPGfM6gF3eiUHXR0Y1XqFdOKigPRqkfkSi/plbEi5ad4
         q+La2IKUI58XpoNVaJX0QK12HqBR4UrNivJnIPQFvTU4FILg0WYfphMteqbpXqWoOTCB
         0VPtzpHnayovrRfPa97mUp5+PCmBU5uB5me2E3NclM1K5dO3i0CvSXV+8Qt/w8lpsHDw
         Wr+uibpLbywg201A/qdPixB1Xd2znMEtokVv2YX340dQK4qLvSvhnNdtgxBIXUS4H12h
         QKz22tzou28I7Jb3I3JpNHF/icPsli+vHRMEfrGWthMDozts1zRs3cVW+lJkC2srTaTM
         fY3w==
X-Forwarded-Encrypted: i=1; AL+hErGNb3HfxInDjgxHYRfRI2pm80KmtIM/tCJN/XlZSZlzq9fMSEUSJ5r/hD6+sG9/kmwfYOsl21oaHNHpyz0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sV+2BvBuW66MKVOxcJBhq3NyP38ftw+EYlTNHp6pRXTX3O0PS
	T6lrboLeyOIPw1xLAOCNgg4jdeEodqJNiF1cs4lRgrvIIxe8okKtXzr0vsu0Jpxd
X-Gm-Gg: AZFdTZd6cJRFHiVFxpxCIvv62GorjNIiiMBBF7jZlt1GcXPy0dUD10hevBptV9cW/OS
	XoGgNhsqFjFt1xo/deS12dp9+IstpY2TFJYfeHoY9pE1G6cNuCx+WdD6VWtumD982iJoyL+fRC4
	uOnDY2TTluv0qVMhz6M3iMHb/W9cfnDIcXqVIgWeOixqIlySdCr4JAM8N3lluh5GthPjZpaMXjG
	CX8F8If6M7iqQApYoFXJaIo1XKfF3Md5m912d0Q8Fa2ysscmxVqT4wYUQxN8XzZN9b/BTvkLMg6
	/e95m6cUSL6i2XBujxlMGbqiJLnQqO9mjQ3Rinh6bPAvGCw4fI5pmtDTODkRV2Ol8FsHsD1uD91
	ahlX2UqypDHQCXQ9DUcpTYTnj4A/aN8l+EJ9GbgANLb1j/UUh9pNel0FDpnJETGpsh/8R0GEavb
	YSHtpinC7b+9fbNdqui2i55JzoVZt31z6COeEi9pBEsm3ofkzL303UDT/TIIiyKZqz2NTDkLCp7
	nTLWoxZQPOdKh7Bgt8O+9Wa67FbyWzegMbYMY6J+OFJ2W3g18pwn7MKBsSIyUuJylIxGNCpvOjf
	URhkJdjnP/GIntEOgs6Hb05hCrcs
X-Received: by 2002:a05:7300:b2a8:b0:375:e4de:96d3 with SMTP id 5a478bee46e88-3828171b0afmr5075315eec.31.1795066811908;
        Wed, 18 Nov 2026 21:40:11 -0800 (PST)
Received: from ubuntu.. ([2405:201:8026:213e:98ed:c5d2:8a64:170f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6304efbsm22090590eec.7.2026.11.18.21.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 21:40:11 -0800 (PST)
From: mdshahid03@gmail.com
To: viro@zeniv.linux.org.uk
Cc: brauner@kernel.org,
	jack@suse.cz,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: [PATCH v2] fs: sync: fix overflow check in sync_file_range()
Date: Thu, 19 Nov 2026 11:08:27 +0530
Message-ID: <20261119053827.69933-1-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Mohammad Shahid <mdshahid03@gmail.com>

Use check_add_overflow() to detect overflow when calculating
the end byte of the requested range.

Reject negative offsets and lengths before performing the
addition.

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 fs/sync.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/fs/sync.c b/fs/sync.c
index 4a84dd837b86..a1ef2b619cfc 100644
--- a/fs/sync.c
+++ b/fs/sync.c
@@ -10,6 +10,7 @@
 #include <linux/slab.h>
 #include <linux/export.h>
 #include <linux/namei.h>
+#include <linux/overflow.h>
 #include <linux/sched.h>
 #include <linux/writeback.h>
 #include <linux/syscalls.h>
@@ -233,13 +234,10 @@ int sync_file_range(struct file *file, loff_t offset, loff_t nbytes,
 	if (flags & ~VALID_FLAGS)
 		goto out;
 
-	endbyte = offset + nbytes;
-
-	if ((s64)offset < 0)
-		goto out;
-	if ((s64)endbyte < 0)
+	if (offset < 0 || nbytes < 0)
 		goto out;
-	if (endbyte < offset)
+
+	if (check_add_overflow(offset, nbytes, &endbyte))
 		goto out;
 
 	if (sizeof(pgoff_t) == 4) {
-- 
2.43.0

