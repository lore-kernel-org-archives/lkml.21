Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795620490;
	b=ETRu1m2xlXXpHSsVS6YXqoZEBeeTJ7SAZOVRGiqYS26EUh0ujN6/tXc5+BOuS9rDsZbn
	 RLjKzwufTFg9AAvL4cng22yM5ZEa27+dDO5hX1Tm27Xbo8zo6tCvUbKnADplbsTHMS88X
	 zhOraSfSHspirvOy4PZlShWlPcYk7qc+rS9b1XXC6X0frp0WVqv3iRv/LP0BKzhmvlSLZ
	 ExSnoWXB0bTEo7i21L0d2iBwLB0Wsr91MfyQH+tSeENPNo8DxdLUeOsWYHnzOJbnODCOi
	 BPFYl2l9cEznJYbzAlVo4MNT7xpR24miUNbGwZWXTaswSO8CB8S+Tg7XLbC8oLcSTQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620490;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=isQA2L/W7mAn3CWOlN/1NqihnjIyeh2aVHy3VDpU4yY=;
	b=k9VvgaFN7QJZpi6DYEMmX25Vq6lGFVT3RJLETr08HKBI13PhOsrMEb9e1wR62wmy5G2i
	 npiHl4GOpP11ZXAJqLUCnUdWKswjc7noNlZhKP/X3iQd5onDjtKGtceAAWZtf7lkXtnU2
	 3nZWcGz44KnLfJfbb4LnvYHicyOdJz0dSGDRSKVv683dALU26OfxN22miXBbg3YuennSf
	 YBLGaNYmuIcpqXZ8CaKDXSdH9hiVDVZr9IhB1oA+ndV+1JAaEIMZZWZD9ULOrlHMgPrGZ
	 /Kg1RIqwobfAqXrk1Z7fj/fLitKh+PSsXbS0rpU5LVZNqdM9x5sLzmXwaZecDtksfeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="xR4AU/Vy";
	arc=none smtp.remote-ip=209.85.160.47
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AA5606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:28:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27AA5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xR4AU/Vy
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-4932b13c4ccso3342652fac.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795620489; x=1796225289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=isQA2L/W7mAn3CWOlN/1NqihnjIyeh2aVHy3VDpU4yY=;
        b=xR4AU/VyScPSKLUrp1xnzMlPObMcZMHn31mtmtojOQxIGIU8rV4B2prH0GrA0jbJCK
         0W4/AnJyIvnxchh+guhBMNAleqFpaSy+MPX5WjIfZTuOkVftVR5jlRDH3HfkvIvIT+uB
         ua24HOMjTM8iaM4bQEuq98eghYWTSgEHvj19I3cYOy+/qyD0wU/7xrMTsc0pAEGNz3hV
         3NLONBNfB1MSNGAATUN2WE5cRRxi+quOuXmdIWzEkckiy6Cv7a9hhFafDidK9uDN4hYY
         4WQ/AUaW9IGto49OPe3DDZnB30HuFXLToEObjnie7VkHnGYQgPVXiregtilfzXs5vro6
         ZNAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620489; x=1796225289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=isQA2L/W7mAn3CWOlN/1NqihnjIyeh2aVHy3VDpU4yY=;
        b=BK+dLcdWOC047OkO4UjDHQu/tOG1FfccZLz2BmpcQC1pJP+mu6G9MACFaAwXhiHA19
         0ddNCSGpmF+2BjG0k7Kj1MXSRE+9o81mehuHgwHfUEsJO1DDmR2xRvmPWFC9DnQOut3T
         g8QmUH2OGHZGE/GhLVIBLrsoiudF+rn49Z1hXXM0BBs+8V/GroOXUVA6HHCzY19UHoeq
         xfrkJwdCiZqOUK87GqoHacOvu9m7ZDIq1fKXt9ZbXqG6pEg5i9VH5av2IyUTM4JVJLyq
         B1EEmQBQhU+OIrwWWoEn8EVuHUUWBJzvcREQf8xdWytciLMWWil5b71v0sVVTELtWFpn
         scig==
X-Forwarded-Encrypted: i=1; AL+hErG6nK6gynWk1zSZ2keshy55EM7vavX7+zVx3o0mF1Ie+/GQEs0cCYAJdBevnIj9jnhGPa0u8cqKU5TvfPk=@vger.kernel.org
X-Gm-Message-State: APuU4Z92p/JlNYtxNv5a+Tuj+5A01ZWrx96mJVNR/VZo9KoXu5xcQ2+e
	kNb6hnGwkkmtPFto58d6jynFZN2nhO21cvsSR+Hr3u3ST4I+uffuQgQK
X-Gm-Gg: AZFdTZesIj9CHtp7AdAfutQRQZAxX04G3mOFVgaSn1OUZ351Qo4mdk5HeQYDS57V5H4
	WS/HXMSjrx5bUtIy/0HZ/cfyKBYoVODJwbOkL+HM80lVEHl/quR40mgOPSz/LSefJV2NbNbxSGK
	SuzBafzCUn+XpdNx9M7gcEDA04h/X0l+oF1HH6QPrpp0VF3lK0JBGpXExhIHtuJxFxtoVfuUzy5
	drA6dOGH6NL5tg3q8t2q9cTlM1gXgllL8trdmJrTdbJCpHVH5kIBFI4GQPT1RsbUo/VVquLm9no
	xOZziWMAm1IVEKyZTdLUA10JLVHQJC4xE0NevZDj2Nz0l3EXx4/V8iAyUU/7zzNqe4mvL09l9s9
	g1Z5r/lroY3e31N3GX/b6pk6PACCMI0fvQwdarp16vCpXslDC+pNvRAuMNqhyJmml4MN1Dm148Z
	95McH60Bavr8+1/Bzj4sR2jpVvXB4/BCfmg3lNtQ4ttm1444wEAr6sXt8ee4z/nlrD1H3jmjSPl
	bm3+kVd1J9lomJQzyHJ1QVzl/5W98Kh3g6z0Pw9UqUxayzg0A7IHqOkM4UPWqGZiLkprMGXgz6S
	jttrUnGA8WqLA9KnwWK12zFY9jMPXWuosEuAjwSMPYmkwKqtJ+4FS0YFzMDfHZK54oLZHmr+ayV
	i
X-Received: by 2002:a05:6870:3232:b0:48f:e137:dc7f with SMTP id 586e51a60fabf-4bc85aef1eemr16751983fac.57.1795620488974;
        Wed, 25 Nov 2026 07:28:08 -0800 (PST)
Received: from O1PCCC03033100.cn.corp.seagroup.com ([143.92.127.241])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc60891cf6sm18101711fac.13.2026.11.25.07.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:28:08 -0800 (PST)
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
Date: Wed, 25 Nov 2026 23:28:00 +0800
Message-ID: <20261125152800.485-1-longpareto@gmail.com>
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

VM_IO is not needed. vduse_domain_set_map() already rejects vhost-vdpa
entries backed by the domain file, and the file check in
vduse_domain_get_coherent_page() keeps any other entry from being
translated as a physical address. A self-referencing mapping now
reaches vduse_domain_set_map() and is refused with -EINVAL.

Fixes: bb2e6f166547 ("vduse: fix VA/PA confusion in the coherent page fault path")
Reported-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Closes: https://lore.kernel.org/r/awWOpS3HR_2FTN3I@gremlin
Suggested-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Co-Authored-By: Claude Fable 5.2 <noreply@anthropic.com>
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

