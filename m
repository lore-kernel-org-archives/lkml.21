Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795606479;
	b=Fyb5uwKD1k1SM25pxuFOEmcOLvoGJHkH9RfGG6UeBlvaOvylQqKhjkLoXuipA8H6BSup
	 eQz4ttSbALcwWpBwdqOA2PqAc/JUpiKj+WKtd9aFnnGn8e51LXaSBpDApWNXW1QsQmNEv
	 n74+ABlajRbBil2nM1s7uHDPoa/CPdaoRvaW+XWy2lBVmyjHzuhggZLBuCmroAGiC5D+o
	 OJxvGPcHu1sJRzn5YWl0q3Y5VXgh/CsbbGRNQdyDGpgHHv5CIHC26lZ8a9Eal9bBo/JeK
	 4HZCuV+I8NGiW0s+RJgeV/hfsAG0juYmTT01XZvv4qnnWVULH7UrbB2sBZKnpwSJYIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606479;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=61AAU+vu7fdoI9/33C3yVl5TzGMNl01fQ5U7CEh62QE=;
	b=GGo/v/CSc89Fw0d8vafG8CU9hvYnoPPvnhP/DIZ3YsoXNdH/f4h0cOk/XkBNl/kyA87v
	 kha08yeC37OfI5aDJLRC6p1BkWOScnbXNY0vRd5ZWmUvmWOPJC2lWrYFihc2+AAhLf8Hx
	 /IffO2eby8XK0R46n02gjryEEZjGbg6ULqYrZdOfBrkCfsJO74zv8av1KHN8aZhBkTOjz
	 QoHBZq4ZOagRPP0nkrPZXIueZF5d38h6bquELzvaUq0XWte/TKLZGiFyhwJhCd5D/rF04
	 XMG5rjRSMpywIYyUJFvan6Hepmf1ejdqR6YnDFhR9gkMeuOoqMwuzVkGU/ivqRCFrhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--powenkao.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="EOyauq/5";
	arc=none smtp.remote-ip=209.85.210.200
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5F2606A331
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:34:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B5F2606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--powenkao.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EOyauq/5
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8b647bbf8a9so5119584b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795606478; x=1796211278; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=61AAU+vu7fdoI9/33C3yVl5TzGMNl01fQ5U7CEh62QE=;
        b=EOyauq/5Z9V3fRPTUvrk4T2ff+my56KA+lTB9XWquEQZSAkhnODJZn5gf3KYkBAZjP
         Es0qaV8tAbj1eFRn4034orG4NoMcJ1VUvxUuSU8Xi4LokF4w3zKeuq5LsFXONi6n1qCk
         /NZlkPOANbKXr2TOFCcXmLOVCaEGqAK4ry8RKxAQ8peUJ71tFUt7uSS3Bmyo1RFif3+k
         bcVgJxbeS114yjBsK/GmriuoK+cieDMipuqzYsJUJDSZ0LdFFimqLD8YNfak4PuS41Ye
         7VawVXRXrESocVwPaLXJvuZVZuAZEnp9cGuHbCzj/+USWKoW41rFnPeGJOUyv3qqWPGX
         7KWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795606478; x=1796211278;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=61AAU+vu7fdoI9/33C3yVl5TzGMNl01fQ5U7CEh62QE=;
        b=kC4x5A1DdzHNTlAq9nEDHWz1jA2CIKiKciMcyC0R7bJwtltH4KlXcUuu2lkxPdi6j1
         qSE52atjGr0ljf9wNRn4kKS2Z6+FywIc5FXARR0TYVb62WPQyjEB61mF0LUcpUDuaNj3
         otnmmAAnttLRzo0Jo+wsEhpwcqmwFpVJsv6Vo83htNH6zaNs/u2PIjPLJda3h3ihL1cJ
         mBA1wvlTHQm1xL/t8bwknCwstUDsfLFG7OEidiDNIf7xANdQzGayfMGcXSufQo0oj25D
         GHn0qrIlcM0y7Z8w7gJCnlu1XMJ2HE9JgpX5NMAkQoOnsqW4rQiPpHckfS08S7dioFp7
         +G7g==
X-Forwarded-Encrypted: i=1; AL+hErFPG3pDatWYZ2HKGiHz+AI1kN4423qm/MadzFf6A5H5RcosxVfzRSx2X07GcuAZLSPcZCqZM62QuhBIHvc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hckL7xS0zgLsqRDyEhhdFdr1H2ehBk0NZo+yc/3l5Yz+eCduc
	gACB7wRzvz9WkIpNRPqfThw48PxDMKIMqn806ks/kxSGb8QoymsN93yRlCCicPdg6CxFAAuFZZy
	BA1aqAbetJycLZQ==
X-Received: from pfbig16.prod.google.com ([2002:a05:6a00:8b90:b0:8c5:614:d2c8])
 (user=powenkao job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:734f:b0:3e2:6f90:b54c with SMTP id adf61e73a8af0-4014c350660mr19069811637.47.1795606478059;
 Wed, 25 Nov 2026 03:34:38 -0800 (PST)
Date: Wed, 25 Nov 2026 19:33:58 +0800
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
Message-ID: <20261125113435.1426680-1-powenkao@google.com>
Subject: [PATCH v3 0/3] scsi: ufs: core: Add debugfs for PA TFS/FEC error counters
From: Po-Wen Kao <powenkao@google.com>
To: linux-scsi@vger.kernel.org
Cc: Konstantin Vyshetsky <vkon@google.com>, Randall Huang <huangrandall@google.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
	Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
	"Martin K . Petersen" <mkp@kernel.org>, Peter Wang <peter.wang@mediatek.com>, 
	Can Guo <can.guo@oss.qualcomm.com>, linux-kernel@vger.kernel.org, 
	Brian Kao <powenkao@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Brian Kao <powenkao@google.com>

This series exposes the MIPI UniPro v3.0 PA layer TFS/FEC error
counters (0x15C3-0x15C7) under debugfs:

  /sys/kernel/debug/ufshcd/<dev>/pa_err_stats/{host,device}/

Patch 1 fixes an existing teardown race by removing debugfs and
disabling debugfs_ee_work before scsi_remove_host() removes the WLUN.
Patch 2 defers debugfs creation until after device init while keeping
debugfs_ee_work initialization before IRQs are enabled. Patch 3 adds
the PA_TFS_* and UniPro 2.0/3.0 definitions and creates
pa_err_stats/{host,device}/ based on PA_LOCALVERINFO / PA_REMOTEVERINFO.

Changes in v3 (suggested by Bart Van Assche):
- Split the ufshcd_remove() teardown fix into patch 1 with Fixes and
  stable tags.
- Patch 2: Initialize debugfs_ee_work and debugfs_ee_rate_limit_ms
  before IRQs are enabled via ufs_debugfs_ee_init(), and document the
  later fault-injection attribute initialization.
- Patch 3: Gate host/ and device/ on UniPro version (PA_LOCALVERINFO /
  PA_REMOTEVERINFO >= UFS_UNIPRO_VER_3_0), merge the duplicated host
  and device attribute arrays into one via debugfs_create_file_aux_num(),
  update the hba_from_file() comment, and clarify the 64-bit read/reset
  comments.

Changes in v2:
- Defer ufs_debugfs_hba_init() until after device init (suggested by
  Peter Wang).
- Create pa_err_stats/host/ and device/ only when supported instead of
  returning -EOPNOTSUPP on read/write.

Link: https://lore.kernel.org/linux-scsi/20261124012951.3143833-1-powenkao@google.com/
Link: https://lore.kernel.org/linux-scsi/20261123025745.1743640-1-powenkao@google.com/

Brian Kao (3):
  scsi: ufs: core: Remove debugfs before removing SCSI host
  scsi: ufs: core: Defer debugfs init until after device init
  scsi: ufs: core: Add debugfs for PA TFS/FEC error counters

 drivers/ufs/core/ufs-debugfs.c | 244 ++++++++++++++++++++++++++++++++-
 drivers/ufs/core/ufs-debugfs.h |   2 +
 drivers/ufs/core/ufshcd.c      |   8 +-
 include/ufs/unipro.h           |   9 +-
 4 files changed, 252 insertions(+), 11 deletions(-)


base-commit: 08fec21faae44fe002467976befd68e6e62969b5
-- 
2.56.1.839.g22a8290db9-goog

