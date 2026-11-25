Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795622502;
	b=SAccQQqqwExSkH9eldCPa3IZij9cCOktzEXXZDur6OBFS9yFarIaBNlLLn4rHoDeQwtE
	 mJ+RoTi6K+BPHRpTR76vjeaOOKlVWtxJePkC/JXkB7lvKLxNHelaD1piNgE+FO6e6pC8G
	 8JxJ3A3Jcv3pe2OrEhsYL77Anqcfo7Sx7E/FHYaElGusjSTODRG9afum0l6202TXPvFDd
	 4X2uVpRtMCM42q+7AcC7OeJizOpq78/qSyj3z1OLCAAGUt70e9kvqpWBvZzq+THAxPsg1
	 tUfx28GB1Dk4Rl7CNuzAdrNhJJX/khV3WE2DmfIPb2Q7BWjWQIR3TAGOtKgUeioi6Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795622502;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5ClKnQa/VnC+RbYcmAaKA5Lo4uOLHVVXMvjGc4c3TSI=;
	b=U/xgHjBJHy7yjdJo+P5FHj1o0lClBQv3bSCTS63P255qUlcdlkPokXskL3/u7AAkkqDG
	 CiT1SbsoeeAO1bxpK9f/IyDMYZ6szcoR3mtgwJRWJwr9VJi5SpfNa+MIhE1Dszz6/qRWj
	 e4CFzU2HKAHeFcqKvfGZQbJPKMtv9cAA6l3d/yAEdreDJrilNdgf2KtCY1AOyPH1qxxgz
	 X4VYbXRqWZwn3JiiR/rC7xBFkAH+vHsirwErHPxc/oGoMUvJ9eQLAqrYkTIgTHfQENDPE
	 Cvk3APh9N2Go/Y8DPHWpADm3F4+w4hVPhar8HJIhwNygKmjNWf3mYBJETAF+rWZGYcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iEeJgjxl;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AD9606A332
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:01:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27AD9606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iEeJgjxl
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8b271e573adso2565101b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795622496; x=1796227296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5ClKnQa/VnC+RbYcmAaKA5Lo4uOLHVVXMvjGc4c3TSI=;
        b=iEeJgjxlmyg/bq+265eLVnD/CDYGY3Waz41ACGbvaoRgsJjMfeBOfFdvkHXErxwshU
         SDtccYTVx85Lw1zWDzDEd7Lu0EQIqd8uTsqtiVkgqM21XkbNQXLa0aAPGbOCO3aHoeug
         z15S03FzXx0IBbiFHm1xpu/fWDCGshbvhKFQssd71bSFY6g3V2rYePXkedx9H3nmKlt1
         zq+0MgYKpbEIas1o4j+zYDuk1esZpI/nX88MK5r9tHrqDyzbjjMMYZvscByynw5Qm92b
         RPsUanqOKf3gHBTPxw9FERmfKZ0fw5t1EoHjLa/P895wavfxhozbKA1Hb+IUGare58+t
         a3sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795622496; x=1796227296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5ClKnQa/VnC+RbYcmAaKA5Lo4uOLHVVXMvjGc4c3TSI=;
        b=CIH1JzLWcoYFTLiATscAtj7vJ0PA+ITYf0qoDaMskWe90qqRdk0qzUqZOA88QtS270
         uCigqniWJaj9lAeg4eApuMa9OAJonjrkdq/IY33CNyZ+0e9z6FwP31+S3sWwp4u7uUQU
         K9/C5+rCpRB3WciFK4TIV42lIbM9qIw9yB0rw9X4Jek4jhgItkJkLmJPhck/Z8d+KWsI
         kY9HW/1G1lp6auk8TIXbZVjBKR50/CXs4kGYhbksU3lfmbWY/YXf/rne+vefFegv/CnS
         qFejSU9BuJn3keK+orAEuTlKwNxuJ4+5Edj8MlOQWueAa1BU9xLPpdn9FTpW51Y2lunU
         QQnA==
X-Forwarded-Encrypted: i=1; AL+hErE53Za0/Yen7CjwV3oGQYQvNxPTo3Z70hz6xhmJITj17Sc1i2HTizdoJgu0XRu+ys3K7mtHdi19QrJNUQg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+M82pJxEZ7TSRMYKRDLcDzWmRC5KB6ziDhyGBCF5i9/AJ7uQBs
	7OXjNIOMGktqOj9cb4tU5ryondlkUz7S/q+/p7zSH5oAD1d42lCJ+rNU
X-Gm-Gg: AZFdTZc8tfK1t5tVgeHC/sfBsUl/MZoENzj6kHuCVi8Byskjf6iAMDVVP9/+1UDKPvZ
	zNPUicZiCue27TX6c1zXsuTVgUGlXRVG+F/bMN7vFC4U4bMlbPQ1W2T7ki0wrMhZJ4paJ/2S7Bt
	3Mx+MuhxLWQDHoE1dnT9J72P8oK+x9hAAhilo9PcRzYPQFjmZw4rD9nfYKFsvIKe8yTSYiqHiX+
	9ZUEhmSwo9jQIuJVTndVrZEHXSSWl+pgesOEWMlGz/kExbA98/3AddOSYqQjaNMBWBjuBC/I37M
	58er5PLCmOmTpAi5i33q3v9cCfc3pYLXCc0q2JhvphtMLkNcHfXnlgNYJwLySMw+KHSrqIhHOLM
	jKqtC3imxe/SMRzpI0+vptt7xOxoNUZImhKTFG5vQ2CFdjZ1Mck2j7DoMc5jhILBFJutcBk/9H3
	cCwSDl4auMTrKIQE112xpuTHPkIUMpumJDPbI00Nw0kQcqwpdtNktU9up5e77YF0WuMAQq1LMWS
	00nksnCd1nGLlXVxoWOxFTzlX41cXCIWjcnFnf67tJOleuJ5FXtvRm6NiepjGczByIzzuCVYj8D
	howA0XGsMcFNZSqEOozUgXkyZcjCQ7S6jpSe+AuvjJ2pje9shHMx4ltWbwb4BuJzwYi57ANrXRH
	W
X-Received: by 2002:a05:6a00:3c92:b0:882:bba:8791 with SMTP id d2e1a72fcca58-8c87c4845d7mr14583753b3a.34.1795622496414;
        Wed, 25 Nov 2026 08:01:36 -0800 (PST)
Received: from O1PCCC03033100.cn.corp.seagroup.com ([143.92.127.241])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8cdfbe269b9sm3645215b3a.20.2026.11.25.08.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:01:35 -0800 (PST)
From: "chenglong.ma" <longpareto@gmail.com>
To: "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowangio@gmail.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Xie Yongji <xieyongji@bytedance.com>,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] vduse: don't set VM_IO on the domain file mapping
Date: Thu, 26 Nov 2026 00:01:28 +0800
Message-ID: <20261125160128.796-1-longpareto@gmail.com>
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
set VM_IO on the domain file mapping so that
vhost_vdpa_va_map() would skip it. Since 99fd6bf43d5d, mm refuses VM_IO
on mm-managed mappings: mmap() of the domain file fails with a
WARN_ON_ONCE() and -EINVAL, which breaks VDUSE userspace.

VDUSE is currently broken in 7.4 because of this. Please treat this as
a hotfix for 7.4.

VM_IO is not needed. vduse_domain_set_map() already rejects vhost-vdpa
entries backed by the domain file, and the file check in
vduse_domain_get_coherent_page() keeps any other entry from being
translated as a physical address. A self-referencing mapping now
reaches vduse_domain_set_map() and is refused with -EINVAL.

Fixes: bb2e6f166547 ("vduse: fix VA/PA confusion in the coherent page fault path")
Reported-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Closes: https://lore.kernel.org/r/awWOpS3HR_2FTN3I@gremlin
Suggested-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Signed-off-by: chenglong.ma <longpareto@gmail.com>
---

Notes:
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

