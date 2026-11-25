Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645504;
	b=RYw9YBgOUbOiLmbjCNka+0somuGbNVUTlARZ96ys9ouWZDYR3IPOj1hWs/lpO9XDazQL
	 xXlCiZssPWfKO8w9oZhltEawFQN0j+KeBWHrAfkw9CLBiXSjntVJLgFr5m1MaQe2dUytY
	 KS9p7lDFv+jy+DwkVCnXqE0NsMxqlRrFou+rrCgKs8X9DgDyYhRFXRfegg/hv/5+O4uIs
	 0eHYQQK33fkc5xnm3a5ycMsx+Y9jaeyyNXYemTirswldItH0GLIhVaI6+fdVlZtfOdkYQ
	 9wvUcVtZfaJhgiFzM8JfiVxlzZrT545w5gj5MGCg2ofg3k2HKZlSi8jbXsphdi09nVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645504;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=TveV0r8kvBsLiHa8p0PGJpcHtG/h8NzyM3pacyz3dFM=;
	b=gEGSLCBFnYXXlSpaai7YhZUmMTl5zc7K909iT4fErb4Pi/89qx4jlbAOSugm4pid2gJt
	 LYtbG6wBcAc81ibbJA0mYabZKKmajxLdHfhvWLe9h0mkZrW7fcsRcH1dOHILt6hVRjWZY
	 deZQ/a7m94SD6CtGU/2Ok6y0XYyXEeqNJNF44xCsqnkcgdY4qWTZG+jMBS++HS6SPF8fn
	 3qqKNeisTUGzQw7TUyAtRlPYtUahLN1qTMLyNmjKgjpmwb+H+94m3CyNa7CJytGP7VX69
	 Zdv0qODDMU2dFpmNoYOF6y2vhVFhEW4iOyLQ2Wkzg2YXUheUCVVJwQqySO/9Kvu8DxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=e0WlNX4e;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7B360A2611
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:25:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B7B360A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=e0WlNX4e
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386a0f79047so6681282eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645504; x=1796250304; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TveV0r8kvBsLiHa8p0PGJpcHtG/h8NzyM3pacyz3dFM=;
        b=e0WlNX4enakGTJw2PF/5zMRxY/lc57Z6ZUdDGeAgJAEDwG3jd+wTRlt4lRyAqY9aqy
         6pnENjenp6Zz7NfMk2uBv70FWiUQjerm8TalQbWpfJc7e1zZdLJM15SrMieyPkfGHWjn
         iYrg8bzf8fbnw9rpBUIDQRaZXcqlBFzbyubHZyAfX4a3FKj6A2EIrOiSSVOVIJX5mYis
         LyMXzt1aOwz1BDiC9lR0wLAtTnJzT5boW78AKUcAYXwVjVlXrDo+W5hcRfzB3rO0Klv+
         13c0PxQrprvm7m2Xgsmx9QUfWp3U1vc+DWj6Kd+yOlZL1R7HKxOVploVUCcPJPhVqaIG
         5YPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645504; x=1796250304;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TveV0r8kvBsLiHa8p0PGJpcHtG/h8NzyM3pacyz3dFM=;
        b=hbJdsyiqHCxG5e7JgMavHHWEjr2mG8cNCj7V6pKLvs8CzpKbHfL8Ig8bsBFSBl6PMr
         LQxKlng0bCaGL5412fJ8hDpKUXu4pY67UhBzJkTff+FZfp1G93wrw/uok7adGUJ63Jz+
         5sJOKiG9PzrXqLv3fgAaceVvzn4MEh7Xr2zjxdnFI4isQOwlONfYPnUWTzeOF3dC59oz
         Zm3L3Z0CspN8tjHdRt2AvdwxPFpy8NAR5+8ls1rThR11wQ36Xv7h28qCw6bk3IEOHCmW
         EgymmoH02/htiGXJyb5Oq4+8ln0TPrmfubSAW/jhfl2vPoTu/NWeXPJQ3kmnRBz9i2YY
         K8QA==
X-Forwarded-Encrypted: i=1; AL+hErGr7nPA9v7YDL2A7QkwM9RuWMZRS0TRnJhaO4sIQFKKjZSS2dxhOXQzNQeynShCEtnAlNgDAfyZLdyXOf8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wyw8kf/Njw/cjztw/j8Va/vfs7Nd4WuyjLoDnMif9u39zL7AG
	5HVmxWf8yzyIdIaWDylxVDYTJ6YHXv2QdxaRTimJt3JDej4bCLfjsQrWoFG0Eg34F7Lmtn3AAWM
	yUQ==
X-Received: from dyw26.prod.google.com ([2002:a05:7300:881a:b0:381:e4bb:7fb7])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:152f:b0:376:203e:7d7b
 with SMTP id 5a478bee46e88-3856c6b35b5mr21680529eec.2.1795645503284; Wed, 25
 Nov 2026 14:25:03 -0800 (PST)
Date: Wed, 25 Nov 2026 22:24:55 +0000
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
Message-ID: <20261125222455.1445007-1-elkin@google.com>
Subject: [PATCH] iommu/sysfs: Clear iommu->dev on error in iommu_device_sysfs_add()
From: Elkin Cruz <elkin@google.com>
To: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, irogers@google.com, 
	Elkin Cruz <elkin@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In iommu_device_sysfs_add(), if device_add() or setting the kobject name
fails, put_device(iommu->dev) is called to release the allocated device.
However, iommu->dev is not cleared to NULL, leaving a dangling pointer.
Callers that inspect iommu->dev during error unwinding (such as
free_sysfs() in amd/init.c) can invoke iommu_device_sysfs_remove() on
the deallocated device pointer, causing a use-after-free and potential
double-free.

Set iommu->dev to NULL in the error path of iommu_device_sysfs_add(),
and guard iommu_device_sysfs_remove() against NULL pointers.

Fixes: 2926a2aa5c14 ("iommu: Fix wrong freeing of iommu_device->dev")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

 drivers/iommu/iommu-sysfs.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/iommu/iommu-sysfs.c b/drivers/iommu/iommu-sysfs.c
index 937d1c749843..3b9e5578978e 100644
--- a/drivers/iommu/iommu-sysfs.c
+++ b/drivers/iommu/iommu-sysfs.c
@@ -85,12 +85,16 @@ int iommu_device_sysfs_add(struct iommu_device *iommu,
 
 error:
 	put_device(iommu->dev);
+	iommu->dev = NULL;
 	return ret;
 }
 EXPORT_SYMBOL_GPL(iommu_device_sysfs_add);
 
 void iommu_device_sysfs_remove(struct iommu_device *iommu)
 {
+	if (!iommu->dev)
+		return;
+
 	dev_set_drvdata(iommu->dev, NULL);
 	device_unregister(iommu->dev);
 	iommu->dev = NULL;
-- 
2.56.1.839.g22a8290db9-goog

