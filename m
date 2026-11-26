Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795691648;
	b=JZsUDQk0V8HDpE4GS51PkbSEMm1nB4MsTCnb2WZ2egeoyCH9lj7j7qyQl+ElDVlI7K8W
	 KipG3ZthzDViEfYhytT8qjduw0H+eib/B0u6YvwyT5uBMZ/KSJGJZ7Bf5PHJYz8mG+0Sj
	 RW/gKgOmrmZUgyepFqL9SL7vR4cgXvo71y1IBxkrxhvSHnBGtnl0QhDM6wRE5jpX4LAg+
	 IT/QtvPDpES9qZZTNzxTvZdg3BFxdM0lFEBJDS5AEbxqu4YIi94fxateWkEJN/juwocU7
	 pB4HT00XTchS3t5fm1GnQzk/vv3RBnFv13bH0sZc4j5FDRfYOU1YqQal4Oq0kko5lwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795691648;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LFWwc3+AYfzJIpjs6+s8KEhT/u7I94YZNIJa6waYCdw=;
	b=Qymup6GKfE7Vu6sPRvCK+PiGKOc69kY5TyWpT9Ywe/VGZq2Ti13l8i+ASje1go6dowh9
	 Wx6v/IjvwTIsOekDzFLZm0Y7GnZBFXyGM4zy69fxm5ZlIedENgSUVHQYd1NXoJ5z5kgcN
	 TL5Pd0EEeZ0EyhBgWj5YJ4aXESHp3wx4zK0U+euBcGuOL9K3fkh+Lxm/77uVKvP5FiG1S
	 IPFafU02aDAwJB8W0Rw77HrG7ZolwNNop9WErlcvBEIKkznTNCc27nmmzxL/BwfW8rVix
	 tSui8M5dw0v3txj83nJSpIExlVCnCLuAoXIQCU1CwtfkrvW4RP8/XFG8So0PrPyoNUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cGD8njSp;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7C6606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:14:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F7C6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cGD8njSp
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdddc79a4afso2906105a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795691647; x=1796296447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LFWwc3+AYfzJIpjs6+s8KEhT/u7I94YZNIJa6waYCdw=;
        b=cGD8njSpm9yBoOYgmh7titWNydgvCEZKM08UtxzF4E/k7N16JtN3wLT4D7DDsTMcZS
         bKUcxitjH2pomIu/HeE34Gae4rAeLOmj5Dai/x3pGTczZu7OHT+Tx9R5kKA0qcEXzh++
         LXzeQFzWcGihYf1QJaftBJX0CcPSv8yYcAJV4Jn+4d6tCJh3irGusAwH13S7uUn5IgDU
         e81vSMbU8SDAsYZ6OcUO3TbMgExL737O8Kacb4RrkxDx6WRs7BA/vlBz0zl0+lNeWt3D
         SBqEs0JMuUhftESmvJnKr20AMoBxaW+pBEawVv6uATX8Kg5jxli/LrESf0b0P4jBc4R2
         iMuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795691647; x=1796296447;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LFWwc3+AYfzJIpjs6+s8KEhT/u7I94YZNIJa6waYCdw=;
        b=YJ0CdpgNJOsFR6RXoHgq0rWd2Z5n/egLAW8qQzO186eNHJ2B1JHIOGey50rBKhfq4A
         lrpoOttO2Aqep0Ya9udHyB61/I5D13jR9e2+9d7UO6k7+VjMcUPCPHM0OMmBNHO3hwZd
         JozfgW9YRrmhy+dedHIqh8KJuIMmlRd3fhdBXozh4NszTLc8LFAgoKh15DfSl+eBi+14
         1w6WJJUYitop9l1I1y/HbLww6Dx1g+duvexaV1FIo4NvDdPi4ORU+Us93SeSLomkqpdm
         2ljZ5LA7G3ojh9XOqzDc4WBEvJoFjcTyxqNaGvAHo1rmh2OAkrYgrwkNYld/W4L4K9mg
         ClYQ==
X-Forwarded-Encrypted: i=1; AL+hErEuYyIe9TfCDk4c4kCZEEV1oqKZJ0W1Fi2GU7oW1PThVvOI2LnQd5/05AR/3Y4N6oVIpZKQ9v/geJYbf+g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DjigzJmz1C5KJtXnKTIA8ah5Xz7RvOS00kOHxJU+PWCP2WxqV
	nb69sqtkLIvAHPquV6ad+N0OTWY0JydS3QSHDLhdlwp2TGpZPe5rnjW/2eFdZ1qOHWl8iQ==
X-Gm-Gg: AZFdTZd4vVX/bbIR5ohaWI+663o+UtbSu+N03IqkEm6yXF4G/7WJEqYNhPhWYmaVl71
	XwKrj0XS4oytPo/nKesu7jxbikAaLrEEC7Ki/Jqk3QSph60HywulX0YCE8qLBFuxy6omEQ/JTBA
	sQg17W+tETFHqjDsykhOWpymZMsZ2NuXfLBPmRHN9ttmjOHL7lZgcmu3IkaCwgjxqKV+dpSw8WN
	DVJJBpy0cAuRB0e6ayH9Odk4hvh+DmXVOKSPmfZzH1DyqR/enNv2ZLiSI1rb7vbVKqDsXg8ez5O
	o6K8zMnLhKZD4HHiKwwbV8fC+M8p25wx/7vjVRdI3BNR6xT/3bgZgeK5qliddxtOUYjFd7264cV
	cdCUmYx53opQgxQYdKsm3F5UFegVGgWxkf/TzyeWO/WJn/DhKdGc/AW37OWi+deKLywtRG8x0nA
	IIZAEOCwRJw+Ai7oqWOOu8zdjB2jNaoZeGGOnWGMyha4PNAWsIUfPu4kVpenBEMfMzGR3043Hul
	oofmlKXEaM+SJw27zLc/S1pSnAXJatuV8gioB0YXZLcLJ8o2BXFNzAXuDnKql2pYZqjj7lXW+sU
	x0efZzZQXPqn46G0vSBSO/5YAJwlCN+16QOeEkmbnVSdqKo/lUGxyLHOA97nWS3Y7um3dP86NHC
	g8KRIb4qXi2uKKyoybzFaWkHZxaZi2lung9hi9bCJ8nSxkzs=
X-Received: by 2002:a17:90b:17cd:b0:3ac:9599:a689 with SMTP id 98e67ed59e1d1-3b41c9d3111mr17009544a91.34.1795691647272;
        Thu, 26 Nov 2026 03:14:07 -0800 (PST)
Received: from lwq-server.tail118c18.ts.net ([74.176.208.23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41aab4729sm31983650a91.0.2026.11.26.03.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:14:06 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: "Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Bean Huo <beanhuo@micron.com>,
	Stanley Jhu <stanleyjhu@google.com>,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] scsi: ufs: core: disable exception work before removing hwmon
Date: Thu, 26 Nov 2026 19:14:00 +0800
Message-Id: <20261126111400.2828356-1-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
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

ufshcd_remove() unregisters the hwmon device while hba->eeh_work can
still be running. A SCSI completion can also queue hba->eeh_work later
during scsi_remove_host(). When the worker runs ufs_hwmon_notify_event(),
it can access the freed hwmon device and trigger a use-after-free.

Disable and drain hba->eeh_work in ufshcd_remove() before removing
hwmon. This ensures any running handler finishes while hwmon is still
present and prevents later SCSI completions during removal from
requeuing the work.

Fixes: 66ec6d59407b ("[SCSI] ufs: Add support for host assisted background operations")
Cc: stable@vger.kernel.org # v6.10+
Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
---
Tested in QEMU/KVM (KASAN + PROVE_LOCKING) with an out-of-tree virtual
UFS 3.1 platform controller driving the in-tree ufshcd-core.ko (no
kprobes):
- Unbinding the device during an exception-event alert flood hits a
  KASAN slab-use-after-free in hwmon_notify_event() /
  kobject_uevent_env() from ufshcd_exception_event_handler() (freed by
  ufs_hwmon_remove() <- ufshcd_remove()) on the unpatched kernel, and
  passes 10-cycle A/B and 30-cycle stress runs with no KASAN, warning,
  or lockdep reports after the patch.
- Exception alerts on SYNCHRONIZE_CACHE during scsi_remove_host()
  requeue eeh_work on 10/10 cycles before the patch and 0/10 cycles
  after.
- Compile-tested with W=1 on x86_64 and arm64; verified clean apply on
  mkp/scsi.git for-next.
- Not tested on physical UFS hardware.

AI assistance: AI tools assisted with static code triage, writing the
virtual UFS QEMU test module, and drafting the changelog; I reviewed and
verified the root cause, teardown order, workqueue/lock behavior, and
the final patch.

 drivers/ufs/core/ufshcd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 3c28bc67c65f..86100ac90fce 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -10988,6 +10988,7 @@ void ufshcd_remove(struct ufs_hba *hba)
 {
 	if (hba->ufs_device_wlun)
 		ufshcd_rpm_get_sync(hba);
+	disable_work_sync(&hba->eeh_work);
 	ufs_hwmon_remove(hba);
 	ufs_bsg_remove(hba);
 	ufs_rpmb_remove(hba);
-- 
2.34.1

