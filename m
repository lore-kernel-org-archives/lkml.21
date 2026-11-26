Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674564;
	b=Bt964FwBwC/7WKE5NJ6ZOJKlDf0z6QDgL4TXfMCZmO5jEWbpdpzT6afjgt/P3c06sBKW
	 79lrDcXDayzGZVatSD5jVO+XhrSmQXa4F8d5bQ/1ovDnBRqFBwPjgTY7dyby9lFkpqx9S
	 Xrf8kXSYAUUqKu1YBbq+ACEtIDEu4X6yD3fpYkALz3LjgJAOworPLGOk69N8THtO5Lg4D
	 Tevz5VdjDD9IEIHa7FIjr6WOxI9Obx8TvDMZAjRDSCx4ftkSuGs20VjKjIMJwfUPipRvn
	 yxX1oOqSTP6NK8k2EcfQdFsJ2zmUbO8E/RoVnCS8UyHwCQxi31Ia8zrxVXaC0gSA9fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674564;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JVkKj+MviR973qeK3IxIct8h8x1cxOZtExZD7KHlWJ0=;
	b=CPUGl4Za18BdBk9MD9B+5tTF+gnpHy9OizTExyNRsh6UlNY5yt0taTehZCk9JEuteMk6
	 eb1hLWwkDwDBYESCdiHSMUrV+b0NlTVJnDFFN76pzTz8vtb4miQzbCVv/GtTPKPrwSzs8
	 Tp+jte90ZCpiRfRSK/YVYsB0KIO8oXgksqRD97bizeq9P4qKwPIZ2cTzD06QX1T32TA2A
	 /8cWZZm5PbqXYfVWo+vkCfp4sfKNVifAFt5fhi/MQG/FAAltd7wYHdYW4rSs2pPFrtgkR
	 Bz4U3hskDiwDwMUCrFUnVlZbNpCc9DRnw56rQ3/QVwNqwt/1VRIDfZP/vBj7mYh447A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="JHV1PqN/";
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43BB606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:29:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A43BB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JHV1PqN/
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso2690831a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795674563; x=1796279363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JVkKj+MviR973qeK3IxIct8h8x1cxOZtExZD7KHlWJ0=;
        b=JHV1PqN/9nk122wIFsNYQnWLAcOHkGCA74NEX69BFn/IwmjL6KsW9wv1As5vnffULJ
         d8u8mHX8ly7SZbjh2H/8vxNS+ftU3+bDwooZwxnYcgnGBWfUSnFETGmkK72mR/lesBId
         BCJYrb7+uzDrblORIgzIF1Y5wbXCYnqxVJy7bww5MbKx0/NtiGPD2KXxvfqu7icmdG8k
         aDdiWX+gA7rgr8Ad9nY5p5V4z+e4/H9ttLWAdzbk+WH/IHYal4aSkE/lPBvFhnI1gqRS
         kBauC2Kt6KVssfSrk0seAeovqc9Y0DA8Xhw3+cA0H+hGzhdA68X1EGBU1yG7ApMZi6O6
         rXxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674563; x=1796279363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JVkKj+MviR973qeK3IxIct8h8x1cxOZtExZD7KHlWJ0=;
        b=TFY9McMMhqV2jtp2OWBwXSN6MUiydWzh/clGkBYeMlBys3c6L22mMSQHOWfonmDMNP
         cG38GkwfRJPLc8ITzBp7mdI1d2fbDQdQ3ULKbGi7h00gHMBYS5aYq/d9zmT/VbHSrlKS
         cIeWlAhFWalTu+o2tICJ2+GQMpPJ5XyDiVp06qWoK4+oi4C8cISFLnlVmGTDOgqa+z1g
         pRszEWr+YO1gXuXvZ/HqybntWxBODOnIt3hkH4548AMKjhVaiTonuFSOTjFFotrhEXzz
         /QZ7mRHKQCd7JLYCzFakyCF/6jI8zXjs6KoSzFxh6ykqBSk3zCWsgIvTTBhZ3259LqA9
         Wm7w==
X-Forwarded-Encrypted: i=1; AL+hErFhmgvlAhx0dp38HCwn5mJYNDkAp0xEiYIzSSoFzfMrRryidK7cKxj/zzO5Dof2La7VCIWSZWBhAl31+Vo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WP5mAcIlGrKwUb/bKD96in2ThaLwwKnEZwUJD0qrEYZlZ18zS
	GHSexjzhzBEW5wyhvXCF2k+OPj1CTzDYHjPB5XHFb9pL4eGBZFf0dOgC
X-Gm-Gg: AZFdTZdL55Kv8HpFouFJDpLskNnFZuOn+KTgxNtLzx0Cjw8d7lWQA4Hv9w+SCfvLREN
	0vhXXSPE50RDkjpIs3bDUfYhQzjsoBLPJlpTTjZ9adUyy3wvoEJTk/14aMZG1/XasREyLL8ekjl
	sYDooj8zZ6SXih9Gvo4eYOZGdyhMOdzDwm0PIKWQhw8Lq+l69I3TfET3a0uX6T0343+AcAXn8UN
	cU+HJbjyxPcrA68lUkS2pf514pmcccLZwvZcuFGkG6p914DmGWq2aKQdtUsZLc6ExwDlDdU0YM9
	iV1NSRgn+kccr8H2ltjwFdeOs2Kq2tNRsdY5OWSiv374AmzhIHMwdZUJxAG/nogIjZg4oUHV6W/
	XY0zQ5iBenGfHn1cTcEDRXVFoTKMbF9iZ4u1Ie6gWMsgABdIy/FyeghLvyP3jQ+tyIKV4VvTe3N
	3GECNHASY8356BUhBnzdB7Far32EbzZ3C9eeYl01fInH7bYmFv3aBvZekgDL0I2zlFQWHknZlHB
	mPQBfZkUdMTjccuNLdmvrTurQYmCBRgagtQ9SOk+zs3XW5ODml95qhnlD6IeGeUZ9cnfy/X1HYW
	zG6wH71skEOswnfIkY6HkoB7G3w6ZwFzK0fgaP1Ybq1a3MkSCcFqvgNfyqXgHI48CbDEkSs+/lh
	H
X-Received: by 2002:a17:90b:48d0:b0:3a7:b260:9ced with SMTP id 98e67ed59e1d1-3b41c96cef8mr20119025a91.58.1795674562851;
        Wed, 25 Nov 2026 22:29:22 -0800 (PST)
Received: from O1PCCC03033100.cn.corp.seagroup.com ([143.92.127.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b420e1307csm30016776a91.7.2026.11.25.22.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:29:22 -0800 (PST)
From: chenglong ma <longpareto@gmail.com>
To: "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowangio@gmail.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Xie Yongji <xieyongji@bytedance.com>,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] vduse: don't set VM_IO on the domain file mapping
Date: Thu, 26 Nov 2026 14:29:15 +0800
Message-ID: <20261126062915.209-1-longpareto@gmail.com>
X-Mailer: git-send-email 2.45.2.windows.1
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

Commit bb2e6f166547 ("vduse: fix VA/PA confusion in the coherent page fault path")
set VM_IO on the domain file mapping so that vhost_vdpa_va_map() would skip
it. Since 99fd6bf43d5d, mm refuses VM_IO on mm-managed mappings: mmap() of
the domain file fails with a WARN_ON_ONCE() and -EINVAL, which breaks VDUSE
userspace. VDUSE is currently broken in 7.4 because of this.

Drop VM_IO. vduse_domain_set_map() already rejects vhost-vdpa entries
backed by the domain file, and the file check in
vduse_domain_get_coherent_page() keeps any other entry from being
translated as a physical address. A self-referencing mapping now reaches
vduse_domain_set_map() and is refused with -EINVAL.

Fixes: bb2e6f166547 ("vduse: fix VA/PA confusion in the coherent page fault path")
Cc: stable@vger.kernel.org
Reported-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Closes: https://lore.kernel.org/r/awWOpS3HR_2FTN3I@gremlin
Suggested-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Signed-off-by: chenglong ma <longpareto@gmail.com>
---

Notes:
    Hotfix for 7.4: VDUSE is unusable on 7.4 without this change, so please
    consider it for the 7.4 cycle.
    
    Changes in v2:
     - Moved the hotfix remark below the ---.
     - Added Cc: stable, since bb2e6f166547 is marked for stable.
     - Added Lorenzo Stoakes's Reviewed-by.
     - Signed-off-by name changed to "chenglong ma".
    
    v1: https://lore.kernel.org/r/20261125152800.485-1-longpareto@gmail.com
    
    Tested on v7.4-rc2 (commit 7475ea8b58616b33c04afb976cf0fbaad9dd63fb).
    
    Control, without this patch: mmap() of the VDUSE domain file fails,
    with the WARN_ON_ONCE() from 99fd6bf43d5d.
    
    With this patch applied: mmap() of the domain file succeeds, and
    importing that mapping through vhost-vdpa is refused by
    vduse_domain_set_map() with -EINVAL.
    
    Dynamic tests also confirmed that vduse_domain_get_coherent_page()
    refuses to translate entries backed by any file other than the domain
    file, and that legitimate coherent vring mappings are still translated.

 drivers/vdpa/vdpa_user/iova_domain.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/vdpa/vdpa_user/iova_domain.c b/drivers/vdpa/vdpa_user/iova_domain.c
index 28a977248a0d..3c6fa18703b4 100644
--- a/drivers/vdpa/vdpa_user/iova_domain.c
+++ b/drivers/vdpa/vdpa_user/iova_domain.c
@@ -588,7 +588,7 @@ static int vduse_domain_mmap(struct file *file, struct vm_area_struct *vma)
 {
 	struct vduse_iova_domain *domain = file->private_data;
 
-	vm_flags_set(vma, VM_IO | VM_DONTDUMP | VM_DONTEXPAND);
+	vm_flags_set(vma, VM_DONTDUMP | VM_DONTEXPAND);
 	vma->vm_private_data = domain;
 	vma->vm_ops = &vduse_domain_mmap_ops;
 

base-commit: 44293796526f4343639f87b2acc53811c78b5d54
-- 
2.45.2.windows.1

