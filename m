Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795483794;
	b=3zgfPYZfvIHoUbyAFJnNgf8kNRxd9tHI4jXAVcimklFOmpOpGAUK8QCBtiyEv67kCleU
	 8QtSxdUrIOHNaUNBNVeBI2DHBdM7nfI3udu/uraUHc0IN17oh4vrRPP0yZBGWd3n6ccyW
	 bbufevx8oLY6MtOpbUlyHlnowt0fdJeleGjMj+tzrpgfiaknkbaET7jdGEwEvGDSSCQMo
	 QE524kbYvmsh5cBNJUT3+dEDOHVdBc25iHT2h+pED/HUpLHKaPV3lBOFV50Q3Gb+ypnZk
	 ld0M5x+NWgsmunP/QG8X8TR50MM8l8pQmvwfhvuWz/VVlk6nPimfsh/zDoJ0QIxR3AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795483794;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=7Vg6PurV5UOdaOTFx6icToMm2644jnZk8d1GCxFL0v8=;
	b=taMIbLjtkPmnVct/Ur9jEwqCeffJqUP49DaNUyiRxmXts5hHPd4vrYbAVi5tfKedf6N0
	 1uB9qq9/oU2radYmnqEjwLrWjgIKOteZ/UxsWCxMqnyRjVZKS44r/Y82tIQfuVNhby2YK
	 4eCeNsOG4qBtKAKf2ixKkqU3yMDKBSi2unV+9fz+zEOIzey0VP+aRX7rozH+ZQitHppcn
	 EEGLPvh8wutuFIfVwXMw0Vcf65lOC0nyikYp/xiDdOUx5Pg9gLBvuXa0PhimWc9LgXQS9
	 JgjfaQli+k5WYVVd725aF5rfbN/I2Qo0KolfwJDzLPTR9YoA0j96cu0hxPiqWrd4kWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--powenkao.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Jpefmy5K;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CBA606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:29:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58CBA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--powenkao.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Jpefmy5K
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b45655b428so2851211a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795483794; x=1796088594; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7Vg6PurV5UOdaOTFx6icToMm2644jnZk8d1GCxFL0v8=;
        b=Jpefmy5Kth14CyehmblJACVnDWWsPLsFv9eDLLeBm3rSJT6yXESiOZ8q2aIbtfOMoq
         H4eyrMb9ebEGzSh/nNZrxixWtHstkE506pWmTBaK/Ta9QueYNnLJJFUWO5WdeyuGS1Io
         fSm5Aa8d6T/dB6/PzggN+9roeZpDCQ+b/7HfZOiRaFDy9cTOvDjloZFb3LrMRUDtCjMs
         0p2JiBIYk7pgJJFAVq7LNR/Q5wqwMoT92rPwWneTlGRq77//2rtMeLcGaZFa4TYLMglF
         2gva5WvaqvwGxSig8GUlNzBvVOH5mH11B0R+9Hy7bfsmi0X3+HMLlWVGUtPivJlXwNLQ
         QnTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795483794; x=1796088594;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Vg6PurV5UOdaOTFx6icToMm2644jnZk8d1GCxFL0v8=;
        b=D35+TnuqUfZOEPoOXFNYXkSN2kU4XBNUg61+FKBc5W4rIPf+zjpElfoR7KlogUN9Z0
         VDviWT4O8dOiecGvyhIeb/l0wl6YyQ82EAfjgX2ZO3lqXgKAGumzwiykG6oxpbTsu6IE
         O5pTrZbCrbk50/sDmlzXjI3CQ95lh+WgQXb7mJmuG2z2YHE7iEsPS0zuQ4Yx2fGacqg+
         LyORtaHwE98Yga7GzmsWaVhWrzHrITg0GqidGiQGqYDfYvIe+HasLeyqK/pOCbXbqe07
         sAPY8Rug/OY8DjLGErlFBHh/IehqcUMNcmZawsKvDwBOZ8MwAaj/g8yZAcISLH/RHgoP
         B4Lg==
X-Forwarded-Encrypted: i=1; AL+hErH4FXX5OW5iydZ9wWsqlGoc4K28mK2+t5HN1+9azrjg/yL1OdmyPKfEtTHvTZ5jy7wMn49r/XLFSpY9mlE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XJP43glevQceRdsBZo275JYUfFV5DhCt5RUWzUT/CdvVoSfOO
	1frIxutffz+AokoFMfrgEmla2bZtfhGp01IgwDQufxBgXZWIrnlbfqmm9ZR+wvVXhu+9J1+Wo48
	kuMjU7n8OyP1d7A==
X-Received: from pjbgm11.prod.google.com ([2002:a17:90b:100b:b0:3b4:3d61:7517])
 (user=powenkao job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:d2cf:b0:3b0:9781:ee8b with SMTP id 98e67ed59e1d1-3b41c9e46b9mr12143945a91.26.1795483793342;
 Mon, 23 Nov 2026 17:29:53 -0800 (PST)
Date: Tue, 24 Nov 2026 09:29:31 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261124012951.3143833-1-powenkao@google.com>
Subject: [PATCH v2 0/2] scsi: ufs: core: Add debugfs for PA TFS/FEC error counters
From: Po-Wen Kao <powenkao@google.com>
To: linux-scsi@vger.kernel.org
Cc: Konstantin Vyshetsky <vkon@google.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Bart Van Assche <bvanassche@acm.org>, Bean Huo <beanhuo@micron.com>, 
	Stanley Jhu <stanleyjhu@google.com>, 
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
	"Martin K . Petersen" <mkp@kernel.org>, Peter Wang <peter.wang@mediatek.com>, 
	Can Guo <can.guo@oss.qualcomm.com>, linux-kernel@vger.kernel.org, 
	Brian Kao <powenkao@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Brian Kao <powenkao@google.com>

This series exposes the MIPI UniPro v3.0 PA layer TFS/FEC error
counters (0x15C3-0x15C7) under debugfs:

  /sys/kernel/debug/ufshcd/<dev>/pa_err_stats/{host,device}/

Patch 1 defers debugfs initialization until after device init so host
and device spec versions are available. Patch 2 adds the PA_TFS_* MIB
definitions and creates pa_err_stats/{host,device}/ only when supported.

Changes in v2:
- Defer ufs_debugfs_hba_init() until after device init in patch 1
  (suggested by Peter Wang).
- Create pa_err_stats/host/ and device/ only when supported instead of
  returning -EOPNOTSUPP on read/write.

Link: https://lore.kernel.org/linux-scsi/20261123025745.1743640-1-powenkao@google.com/

Brian Kao (2):
  scsi: ufs: core: Defer debugfs init until after device init
  scsi: ufs: core: Add debugfs for PA TFS/FEC error counters

 drivers/ufs/core/ufs-debugfs.c | 213 ++++++++++++++++++++++++++++++++-
 drivers/ufs/core/ufshcd.c      |   7 +-
 include/ufs/unipro.h           |   5 +
 3 files changed, 220 insertions(+), 5 deletions(-)


base-commit: 08fec21faae44fe002467976befd68e6e62969b5
-- 
2.56.1.809.ga0b61035b5-goog

