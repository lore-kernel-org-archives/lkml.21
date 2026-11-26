Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795676912;
	b=4J7PQZivTL3J8g5Pv6LFYxxqxPIMptug9+4l1rFxaH5jbOhkNw9xJFUQXf4BIO7Vxpkp
	 yqGH2CImhJde4rPAExuAIqacs0hMlExvv5a7vVAfdoRERkdR+vlR/XVtnQdPPqnuLJ/jv
	 XB00fOwejxg8HDjGPNCtJsxhw3jHVVJdZa4fh6dwOOHMx/JIbat0uvbDyTRan7YxDgHq2
	 lK4yoCicbz1Jmrnm++XBUNVtmdciyjf5rra3ot/fFQnJ+dl5ANA6L6Y5Wmm88f0tJWMW4
	 bheXzJtzBg8iZCOEsZ/bAn62nYQe1X/JG+KOghaEAhvgCBP/E/ZqV0IIjkPb6erjyFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795676912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MhXRZswgd+U0p/ly0mQ5E1v8PAV92b0lht4ULwHSrRA=;
	b=Xku85gKg8uxweRVitW3S9RRXxJ2ptuqDEYGYS3jFOiEaxCx7lzoNnsq3YgmO+cWCD6Jd
	 2l/amtuoY2TTm5ameYmWWmfQegnUVHtIC/MuN/pkkv3ZXcFGjXphKqy4sbuH+ICyTudKx
	 34qmVeAuJBLGJPZA6Xdj0oJnrx/S4V097n0fRM09AuFyrS5SRGpSA6/IDE6gh18CtdwOX
	 wryCmGLb1oUiHWvXaFZJLyexkkp9ONieEKJVREjDGuEe7OhO05jNXKJUDqvjRnqW73YuF
	 MutNPF6S6yJKEYxc7YmcdFub7XD+HDIjzlyuGa/yLokCRH3cbIMoplu42+wjIkqS4Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z29TyGwS;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D51606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:08:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17D51606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z29TyGwS
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso81751435e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795676910; x=1796281710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MhXRZswgd+U0p/ly0mQ5E1v8PAV92b0lht4ULwHSrRA=;
        b=z29TyGwSSWP62Y1nUFqF7ClnFbHIgdsGk0TLzLWtId9e8RFLYn3yD+zJYHB1fRm0JV
         Hx6BVI/6Eu2G89I0iP/Me+OY20byQDnWeiZCA1mMHPrfC+L6n4anMe9slkLF2qFrLRb9
         JdH2NmmZTBKB6lxRtpkkc23kBKPO88OoOmjr6Pny0XQSs0QidFNETLlgzEzQsaEWLK0F
         gcY/EoiUgF7SzDK/kelp/hYp2iOL4LSwi9Jio+S7IDfonveRJHKcQhgt0lWgoWezTNV7
         cm4k1jntyMGGVm1JrI238LBKsLCYeK6JJa2PVnvCu+p1zfpNasz5vu0Bx9FFFKEoBaZv
         2yoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795676910; x=1796281710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MhXRZswgd+U0p/ly0mQ5E1v8PAV92b0lht4ULwHSrRA=;
        b=ESf9bWw0xVVzCCnY0RU/AJY4T8jW7qYxt/QTrkPaGgoR+0li0pRMUE2/wVYs3A/vyK
         K8tILjPyEpYeVDzkNvuYEQCc/6zIeU6SqF1VTtTdPz7/1ngdiedknVt1Hu5knBX+bZpg
         BrMJQIV1hBf/jEH4lg0xrjiEjqL60C0/L5aIsaWos780+B5zkYgu8tZifZg2Vno/vTIM
         zcbaEKbfKubD9mxwlUK/V5SXsGTqrbSDsQ3W3j17XhfBUBan/lBeT/qoRieDJWnPBe1g
         7WeXPwFHYhsaIFXZ9Vajad8Y5nLr20tdZqNx6QNb71U4Um1us+JDKitjEyGrxS6Gks+F
         nEpA==
X-Forwarded-Encrypted: i=1; AL+hErHzKN5j+iE6DHjHkvfz9iOHn7PcCugvEv9KacBza1zl68DaB0x362r7yQSYEX4zz2qQ/H3hBHBEzp2WcPQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zp7NyndHl3xPkp5agRIbMNWLmMRszRm5w7Hmw3YAH89brAxUJ
	2a95z9Nk34NYz9xuPraz9Cm2Di20FT1C1VAVsubrgH0xwsFIgYH71OL4
X-Gm-Gg: AZFdTZdwFHMuQ6+/4TyAsXJ8Lt7x9J5LgIAghrY3NTuCxMkDtRnRQ8q+SOU7YfHFy4O
	Wal2YRYBnJFs5uoDPdOVP3XmMRtb9I19GtaqvWTDiyzOL/Du24WNI8ZhtMd8zonTsv2mNfW1Kwv
	Kis7Y8ONXZ0CGC2vR4R80N1wQIcnuOU2H0nsHMvSs1egEPPg0mWNhkaHE5fGEQvHymgOgHhkkg9
	NiT12BMO7/D8L9Y2+lFfLDiDA5C/Zf0rT5Gt8d9syLbbSWNj/0p5/RHfFqnu8pKmEBvwyypPCgd
	Ugi5VqbbuE50jigxzDqqb9RLgqOcoiVsJpvNZ64h4siY2+CAMW4cOuO6c9Tp7FQA7C0hcjUGKWE
	GxIp87h+sNYIYekue6hxb+no4F2+co9HSbd/iM/ViuPzOIk/wozJ3WTL/BVTIDI9larmBnkIgqi
	w45XZmh5ZaRydcf5oiaL/I/K4yXyDwvr1NepCWrgKxkycV+FvSZuQqCpIW8fjFAFZAuNZsJhBMh
	Di1jFygtipsRiTOWFDlerb5I5rvFaRTO0aJsfs+4BnwL+jACF80L6+y3EDHCTBplwE5MFglaXYF
	PWY8cNm41TxPxUSm28xbP7xGPvuobs8YUM00iSocWpGu65TJkzE=
X-Received: by 2002:a05:600c:3555:b0:4a1:f377:5c68 with SMTP id 5b1f17b1804b1-4bb8881da76mr402294455e9.34.1795676910365;
        Wed, 25 Nov 2026 23:08:30 -0800 (PST)
Received: from DESKTOP-V28CTA4.dbs.corp ([110.93.227.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm1071077895e9.4.2026.11.25.23.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 23:08:28 -0800 (PST)
From: Arbab Haider <arbabhaider649@gmail.com>
To: tytso@mit.edu
Cc: adilger.kernel@dilger.ca,
	libaokun@linux.alibaba.com,
	jack@suse.cz,
	ojaswin@linux.ibm.com,
	ritesh.list@gmail.com,
	yi.zhang@huawei.com,
	yebin10@huawei.com,
	linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/5] ext4: re-check inline data under filemap_invalidate_lock in swap_inode_boot_loader
Date: Thu, 26 Nov 2026 12:07:48 +0500
Message-ID: <20261126070748.272109-6-arbabhaider649@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126070748.272109-2-arbabhaider649@gmail.com>
References: <20261126070748.272109-2-arbabhaider649@gmail.com>
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

swap_inode_boot_loader() checks ext4_has_inline_data(inode) while holding
only i_rwsem (via lock_two_nondirectories()), before acquiring
filemap_invalidate_lock(inode->i_mapping).

A concurrent ext4_page_mkwrite() -> ext4_convert_inline_data_nolock()
(which holds filemap_invalidate_lock_shared, not i_rwsem) transiently
clears EXT4_INODE_INLINE_DATA before ext4_map_blocks().  If
swap_inode_boot_loader() observes !ext4_has_inline_data(inode), waits on
filemap_invalidate_lock(), and ext4_convert_inline_data_nolock() then
rolls back via ext4_restore_inline_data() on -ENOSPC,
swap_inode_boot_loader() proceeds to swap_inode_data() on the still-inline
inode.  Because EXT4_INLINE_DATA_FL is not in EXT4_FL_SHOULD_SWAP, this
swaps raw inline data in ei->i_data with EXT4_BOOT_LOADER_INO's extent
header and corrupts both inodes on disk.

Re-check ext4_has_inline_data(inode) after acquiring
filemap_invalidate_lock(inode->i_mapping).

Signed-off-by: Arbab Haider <arbabhaider649@gmail.com>
---
 fs/ext4/ioctl.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/ext4/ioctl.c b/fs/ext4/ioctl.c
index 83630cd40..e0c53d62d 100644
--- a/fs/ext4/ioctl.c
+++ b/fs/ext4/ioctl.c
@@ -419,6 +419,10 @@ static long swap_inode_boot_loader(struct super_block *sb,
 	}
 
 	filemap_invalidate_lock(inode->i_mapping);
+	if (ext4_has_inline_data(inode)) {
+		err = -EINVAL;
+		goto err_out;
+	}
 	err = filemap_write_and_wait(inode->i_mapping);
 	if (err)
 		goto err_out;
-- 
2.53.0

