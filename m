Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795606493;
	b=BR5+yiX/8GLzdqvCJtFnGjsceAFIdJxuH8BNh7ca1BxNx9M3oRCXSrgBmu4WLz1Dz81Q
	 FGBmmbYVK/YYN43tb2twj1Tq7xEFi1QW9T4+sxlY/dBQqsie7BK5iqruTntWelXWXdV/V
	 UTVYciL75S1DHDt0MMDHKpliHXU8NZxOZ8U4SH7EaJgb2lgiyOI7wEJ/Ypo0ubMM0Fh8e
	 9znYU4MGhnBlV4Rqp+fGKbpkgO/wDhTFCkCcba0rQkxbxPQrTJTZSUyobr9QspyBNMgrC
	 Kgi35qf/wmtWnCjVg8yFhgVX/V6W3pNQ7+Lmiqtc6vmlzzNFIfBKyqZO8aPWbVJ31zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606493;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=tRhNWivZSw3mIS21gLSttP0TksdvFQvMGJw8Ec1v+p8=;
	b=XkEAX8XV/ylHrbtrq2EMH/kv7r4c6PB2QPB6V8BLGlcttucuN8imEsxeMaSRm4ZoMsOQ
	 6H3keIQv60Xm8bPmUKfV28jmGA6tASmBZLc8Qo5UfKHPd578ywlLx9j/UUopmariQvrGK
	 x9FuabFQSxxjpN/fJOojMHW041ZsHiTUid6lDvglZ1W88pohZKWThS65ZvGHGuC0cbdE5
	 7702YcIRuah5w74F0qbyIXj5bd+rB3qR/AbIIi9kYrgQfHbsEMbe6gDM364xdx9EJhIza
	 G73wEAQVlvVB+btiT6SoSTRP9wAQBOtK8tI5I7FHpz35Z+06fLy0v409SR4HvqI991Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--powenkao.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="Y/OrJfNg";
	arc=none smtp.remote-ip=209.85.215.200
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3872D606A33F
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:34:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3872D606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--powenkao.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Y/OrJfNg
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso6416148a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795606492; x=1796211292; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tRhNWivZSw3mIS21gLSttP0TksdvFQvMGJw8Ec1v+p8=;
        b=Y/OrJfNgJLRf215hhyTK7rfkSb5aZTlD1R14iTqTF9km4ls8rJnhaaFdcwwE4WHjXd
         7FpVRKQ1Yy/fm/COa5H/L4HdP0ubZAH6OPQ6VX1GF078CiDZ18OLhQ4ROJqav3HVBQlH
         I47vNqs+ACXXYRJUKJUzwPvgeG4mJGPpnSIJpwW3McWi+jFS15/G+AgTDnV5fEP6h+li
         vy5n6c+KYQGMEW1IJ4zP1zZgV5amrb/2ED1Ge8r1Yk95ouN6O+5QpvSOketdAO1Xu0EZ
         vHi2iSRmsd2HWMlzNtW8wHv1j5nkPH4M3qt3rfp5j8yOjVSa1XODUcntXAsa43EwPbql
         8LFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795606492; x=1796211292;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tRhNWivZSw3mIS21gLSttP0TksdvFQvMGJw8Ec1v+p8=;
        b=g4VPlI77t2WwY2IOJTdzzdNTBZWlwIUlt2yLhIQa/vW7dpd2WPimXldCjkLfesm06C
         ieiOJtwf9sGASWxdrzgtubEVfOKSVRIFKXIAlIi+3FGZ+FDDxaCNrTJZdB1yQx20H5mU
         l/V0h8Vcmg0OFPsmhJDrKSO+noi8aDCi0S2Un4YkXqgHyP+PIekylavk6GFAGnNBlPXJ
         FEEi8HU/AdHQnAbmHRoBaKm1y2ykS//gcsBup8IKlb2C0Mgg7P8bsbo4+iliUsjMGAfP
         xE4+ab36R7xNgztS9CUDiDxedw2fTVyOAdxRuvK3jxodVqHOFTtGWmsDW4/WkaX/mmkq
         Ni9g==
X-Forwarded-Encrypted: i=1; AL+hErHLVd8wjzGcyMzaKe4F1S+LiAPzAyfG9vjlaLG2cK6M4G4/aosbwaxB24whs/jYZHoTBjpaH24Lroyp/Yo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YWNHomR+tkLblQ0CLtvtkVKPt0IstLrKWUIsMGxISuTL0RUMX
	nrtB9yMoVmN9VydfNQLpHpqmKLW1OUpXwTZY40cgja5L0UWTJyFe4Mb2VoWm8nqlV2mBD7ETlEl
	wk4GoUqMHbp3xCg==
X-Received: from pffh16-n2.prod.google.com ([2002:a05:6a00:c250:20b0:8c4:bb6e:711])
 (user=powenkao job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:748e:b0:3d3:aec2:4dcd with SMTP id adf61e73a8af0-4014c251613mr19030501637.25.1795606492379;
 Wed, 25 Nov 2026 03:34:52 -0800 (PST)
Date: Wed, 25 Nov 2026 19:33:59 +0800
In-Reply-To: <20261125113435.1426680-1-powenkao@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261125113435.1426680-1-powenkao@google.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125113435.1426680-2-powenkao@google.com>
Subject: [PATCH v3 1/3] scsi: ufs: core: Remove debugfs before removing SCSI host
From: Po-Wen Kao <powenkao@google.com>
To: linux-scsi@vger.kernel.org
Cc: Konstantin Vyshetsky <vkon@google.com>, Randall Huang <huangrandall@google.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
	Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
	"Martin K . Petersen" <mkp@kernel.org>, Peter Wang <peter.wang@mediatek.com>, 
	Can Guo <can.guo@oss.qualcomm.com>, linux-kernel@vger.kernel.org, 
	Brian Kao <powenkao@google.com>, stable@vger.kernel.org, 
	John Garry <john.garry@linux.dev>, Li Qiang <liqiang01@kylinos.cn>, 
	HOYOUNG SEO <hy50.seo@samsung.com>, Hyeoncheol Jeong <hyenc.jeong@samsung.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Asutosh Das <quic_asutoshd@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

From: Brian Kao <powenkao@google.com>

ufs_debugfs_hba_exit() is currently called only from ufshcd_hba_exit(),
after scsi_remove_host() has removed hba->ufs_device_wlun. Active
debugfs write handlers (e.g. exception_event_mask) and
hba->debugfs_ee_work call ufs_debugfs_get_user_access() ->
ufshcd_rpm_get_sync(), which can dereference a NULL or freed
hba->ufs_device_wlun during unbind.

Call ufs_debugfs_hba_exit() from ufshcd_remove() alongside
ufs_sysfs_remove_nodes(), before scsi_remove_host(), so in-flight
debugfs file operations are drained while the WLUN is still present.
Switch cancel_delayed_work_sync() to disable_delayed_work_sync()
(introduced in v6.10) so an in-flight exception event cannot re-queue
debugfs_ee_work during teardown, and clear hba->debugfs_root so the
existing ufs_debugfs_hba_exit() call in ufshcd_hba_exit() remains safe
on both normal remove and probe failure paths.

Fixes: b294ff3e3449 ("scsi: ufs: core: Enable power management for wlun")
Cc: stable@vger.kernel.org # v6.10+
Signed-off-by: Brian Kao <powenkao@google.com>
---
 drivers/ufs/core/ufs-debugfs.c | 3 ++-
 drivers/ufs/core/ufshcd.c      | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufs-debugfs.c b/drivers/ufs/core/ufs-debugfs.c
index 9f83628f3e2c..89753c40b27b 100644
--- a/drivers/ufs/core/ufs-debugfs.c
+++ b/drivers/ufs/core/ufs-debugfs.c
@@ -529,5 +529,6 @@ void ufs_debugfs_hba_init(struct ufs_hba *hba)
 void ufs_debugfs_hba_exit(struct ufs_hba *hba)
 {
 	debugfs_remove_recursive(hba->debugfs_root);
-	cancel_delayed_work_sync(&hba->debugfs_ee_work);
+	hba->debugfs_root = NULL;
+	disable_delayed_work_sync(&hba->debugfs_ee_work);
 }
diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 56a77f4a2a6e..646359d446c3 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -11027,6 +11027,7 @@ void ufshcd_remove(struct ufs_hba *hba)
 	ufs_bsg_remove(hba);
 	ufs_rpmb_remove(hba);
 	ufs_sysfs_remove_nodes(hba->dev);
+	ufs_debugfs_hba_exit(hba);
 	cancel_delayed_work_sync(&hba->ufs_rtc_update_work);
 	blk_mq_destroy_queue(hba->tmf_queue);
 	blk_put_queue(hba->tmf_queue);
-- 
2.56.1.839.g22a8290db9-goog

