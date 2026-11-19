Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795062443;
	b=WuSji2aFxw7aw+kaW1XsP4yu67mHOF1YD1yLhjdOu6MoftEtSmKo14ZX+R7caiikyzU/
	 Nx40aPm3b/vfQ8xwsomWCttg9rQQ2AxSwsSyWFa6y1/0tlK4izVypUoLpl0gjuXUE7Fnp
	 sexAk3vEsXwP1l1j2ZfNYMzNM2FoLiObsQUA/6CWCcDBVaiLDG70EUF9LUDnIyqWjn5WN
	 kAG4iS+4mbjGjksUM1nr4qiRKqCdFgjRlTomMOW/B4sf4rLM3OY36z/JMj99D9ov2Q9ql
	 12avijRtiY4x+foUikvLjju4tlfbDKH4OxT6dy2UF+rmOb9I3MHHZaKilENKpNeVWrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795062443;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3Hxcc3mWV4vpK8u9zPUdfbWlyMV/Lx3auErCWtJ/vww=;
	b=qbDtSSGe55NTScrcEmj+MtNg5bjVlgn/aVWjPrhOxV/vLDFSJS5/fntCF9Mh6HPfr8zg
	 kLbpdxPCWBqe2T+zUvRi3pLWQR7a8rqf8Ktqj/TnUzgKnRu8/aR8JRW1jqEgFcMf+o7wJ
	 OVyDUrc3wu6Hqf5R2vqH6wYNsxlQEn8IVxERoRF/2A8aRtoOTeEDNROQ1CNTFhtU9iuay
	 ufkZctGC1IdISZa6KlP8qHpVECsGI5OaNddtD1uSa+S9t+xAAhcKzKT44moIkBZxG5n0s
	 RPf9HbA+VieVFke0lOmqKWnJ/xTInJzlow3LQ/c1jo2icP5baqmr2b6++6d/bQ9uW8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bdZ5luSc;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935BA606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:27:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 935BA606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bdZ5luSc
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8b66d1a08ccso1498699b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795062442; x=1795667242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3Hxcc3mWV4vpK8u9zPUdfbWlyMV/Lx3auErCWtJ/vww=;
        b=bdZ5luScc7SG3YNewnCwCgsSUxO4L668OOhIJJW+3KnwrEKUzPXmaSbigfrzIcBnmx
         KSSVyoP2KeqXVWwDmBezvL61+GjMSe5jcv1IZ3far/x5lRc83bqAxViV0F4PAEXwxPKL
         c1u1XZLNxpy68zHWWUf1R50aWbfH2GW5QDf10KXIb/BEDYi/a/FbdDYN187YRU2YMrN9
         3OO0SSj2PDmW3LtQ2oRzhDhpjoLpJ88j/9KCYJQv/9E//M1g5b0AYOtCWcAwR7EVpmgi
         /AuSMNFGnNZ+OqO1BMWddOQU0ex6UIrbgjooIM/z8mfpUy56tsAX+bwPOpNgxnPwt896
         Z4Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795062442; x=1795667242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Hxcc3mWV4vpK8u9zPUdfbWlyMV/Lx3auErCWtJ/vww=;
        b=HO0VoaaHO9OqeQl9Qw6tDw3gMIuugyPoyw/VkUMZW9CPLNiigA0bfS9jf+DhzGguSK
         2Ca7bjconJ22QKrtLXzaEQZkjeHkeP9m3OsMVC7eSAUKUjEEzzXpifHsUcUFEbsLB411
         AfzEtZKtz7CN5jzfrIA+mfRjcrxsrq/DSSvbeEVWRTrPAeBl44biLxgOiVRL1OjRExyE
         CFOXCSal1cEdzMFmYWmkiwZB+/Vq45gkeNQqNeG9hjP7Y07XrUr8yPjOzngxjW3laRYq
         +gx7q+MFEJx3f9cFufF8PO2RyDJOXK7K1WskbnarAj//cHC+d6LS3kFMN7uDNg3YLFyB
         8NBw==
X-Forwarded-Encrypted: i=1; AL+hErF728Xl4DQOcqFau0b8LQK41O1sn8pgESjc0CB7J/TOdlGxAW43GhbM4OfeLCzx9eET62RQWBTAh8qvkuM=@vger.kernel.org
X-Gm-Message-State: APuU4Z84/rg7EBJYnaL4AvcLFkoBEdfDuWVjWrb3aD+FscTk7LdtNdE7
	S6J5n083aSLeKv5EbybT/iCps58SVY5luH/6PTZb3+aF1wU8ri7+js1F
X-Gm-Gg: AYBFou1KhtUZWaoip9LPmE6/uxrc2Fz+hbLp5/0ZiNPg7zNZQRmn0eVpb6ONwpFGuQc
	P/YJvw07wfWi94YmfEdjfYZfRoRiNXkxOtEaTK/OSBu5AdIy+49b1c1hOKBZtQRrEurt7GA1nWm
	GV/w6k+v2FTezixvSDSfVxK6GExCMyo9m2A4t5P+QfV4KB9X4vRquj5oJakUYZFWkI17t3d1vf+
	ZHLKMBuj0DPy1c3yfajaA8zXVnEswQPSIfGdSOFKYNcheEkoDmy1reRN0WT4cCB3TxVFRWTYFe7
	5z7kUXtJfPU7+JUabjJwWHbJVJqBjtUdwhdd/MP9MwjT47bNid8RbbvMD5UpI2bEDTdcDms/F7I
	tqnm2yRzC/XDnE3SRyLXiDEOd5eMc0IvqBn/8gxW+Og+OE3oYDgijlQJ1hdSJaLHc9hsBYp4N5+
	qKtJzvom7bHtgt75Jc6ienG8MzAie/sgzlPFgz92VCvZca9bh3AH7GIebVN2aPy+HRFDdCycU0x
	weLtL7dPz6k8nGAYgrjeb7fvBVerj/CizLVVhu/kcWmIwQ29BqmgL+3D60CeXmvlBAuChKxT2Bd
	tVSe3hvx1tVvE3vp
X-Received: by 2002:a05:6a00:4c17:b0:89d:eb23:4e83 with SMTP id d2e1a72fcca58-8c5d3d12f10mr4182188b3a.30.1795062441855;
        Wed, 18 Nov 2026 20:27:21 -0800 (PST)
Received: from x1.hs.local ([2601:600:a482:7d70::5e59])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cb35830bsm2077636b3a.33.2026.11.18.20.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 20:27:21 -0800 (PST)
From: David Westen <davidlwesten@gmail.com>
To: netdev@vger.kernel.org
Cc: loic.poulain@oss.qualcomm.com,
	ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	m.chetan.kumar@linux.intel.com,
	linux-kernel@vger.kernel.org,
	mail@maciej.szmigiero.name,
	nihaal@cse.iitm.ac.in,
	David Westen <davidlwesten@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net v2 1/2] net: wwan: iosm: cancel the ADB timer on cleanup
Date: Wed, 18 Nov 2026 20:27:13 -0800
Message-ID: <20261119042714.505405-1-davidlwesten@gmail.com>
X-Mailer: git-send-email 2.56.0
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

ipc_imem_cleanup() cancels the other imem hrtimers but not adb_timer,
which the UL aggregation path arms for 500 us. If it is still pending
when the device is removed, its callback queues a task that finishes
the ADB on the freed MUX, and the hrtimer itself is freed with the
imem.

Cancel it along with the other timers.

Fixes: 1f52d7b62285 ("net: wwan: iosm: Enable M.2 7360 WWAN card support")
Cc: stable@vger.kernel.org
Signed-off-by: David Westen <davidlwesten@gmail.com>
---

Notes:
    Build-tested, and run as part of this series on an XMM7360 that uses
    MUX aggregation, so the timer is armed there. I haven't reproduced the
    race itself.
    
    It comes before the S3 fix in the next patch, which makes this teardown
    run on every S3.

 drivers/net/wwan/iosm/iosm_ipc_imem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wwan/iosm/iosm_ipc_imem.c b/drivers/net/wwan/iosm/iosm_ipc_imem.c
index 4405c8531888..20f8da53a3ea 100644
--- a/drivers/net/wwan/iosm/iosm_ipc_imem.c
+++ b/drivers/net/wwan/iosm/iosm_ipc_imem.c
@@ -1239,6 +1239,7 @@ void ipc_imem_cleanup(struct iosm_imem *ipc_imem)
 	hrtimer_cancel(&ipc_imem->tdupdate_timer);
 	hrtimer_cancel(&ipc_imem->fast_update_timer);
 	hrtimer_cancel(&ipc_imem->startup_timer);
+	hrtimer_cancel(&ipc_imem->adb_timer);
 
 	/* cancel the workqueue */
 	cancel_work_sync(&ipc_imem->run_state_worker);

base-commit: e203d8a4751d48aa00eda31e3b320ba8e0d47dbf
-- 
2.56.0

