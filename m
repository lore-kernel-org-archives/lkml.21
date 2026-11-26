Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795673300;
	b=ziywGHa0XOmkwcYK/q1kzDsziQ/6fOqLd6YRq5bfMAQ3THXe9l3NSVXnthSzvlBX8Q/C
	 CqVOehLLFmBmjzl9itG/nlsRj+SIv6Y0VStojnKQCLI9I62AeFmSRkGDuNfSUqoxEzKv/
	 xTINH5M11SJfqUPnpr31VBkyyaNebzj4wUXFvMcdbuXoHoYvxWt0E1+KP9F27kANBfJrJ
	 5Wdi3P6493TwlgZX2uP08i0DhQLgt2bwi2+C4Cfe6Y8sEZOwreZceHA2Iu38HjcFMf5jm
	 4oJejg9TE8P8FQ/+hJoa8x/USQ4X9ZimhAon5GbDqBDkUJMrv0eJrC40GiO/X95bt4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795673300;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DZH/wi6uV2Gi/BYsBvky+dhyis2kpdwF5WMhDFiOwFk=;
	b=DqfbeoesnQkFURrY+U/AS0m1hroc0feyqLUdCrHtg0rV0CTpr85pA0GYqUUab2pa31rI
	 t+JhlV+VrSjmQ07LuTUwxKr+XllNNTCr4O0JyvFIPNT3Wv4pCA6L/4myJdwf0JEOwaDjy
	 Of/kSruqg/aP95xAcozGT8kz6+2YDTWhxJ0ywxogIcrrCaJanBAMbh7pMhBnyYI8LJdQw
	 U/fOAbYAJT3DdL9fNIU85vG2ibc1GxHdHSyvgOX5et2Vx4J38TZbvmxv+dgnuz4P+cNeE
	 Cu7FkylmL94sOjDDNlJlw4fFS0PnzW4C6M0uK6CKAZnA7PWbiSbzFg6ETDambj8vWCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=usnqNP+S;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA78E606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:08:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA78E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=usnqNP+S
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b3a42a4bcdso2845262a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795673299; x=1796278099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DZH/wi6uV2Gi/BYsBvky+dhyis2kpdwF5WMhDFiOwFk=;
        b=usnqNP+SBpDNxE2DkrZuoELLOzn9K2ozJTnaL0TFcv/qZRb2iyFO1i0FNYDy1qYufF
         obcbeLlb0qVRRM/9fuKjm3IDFAwdJ5uqXn2vR94PMwqJkpthTNsfEasICIKdQ9LdBo9Z
         j6nq1EkI3GhbLOcBbAEjQdkZGLa85diZB5RVWzQT7dA43JDmUb6V1J2s2E1Rosi76sAU
         rX4pajtIzeYRGGnoMIrB7i3BgGsmsoyA9Uxfm0sLc29W4TfkA78oxEcaLJYYS5+eYcr/
         lXG1LqB2gGQVFZhFqxL7YMx42dWt1hZm0gV5lcYtuhe8jFUxb6vNJcYt++F5b3G1lzMn
         FaeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795673299; x=1796278099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DZH/wi6uV2Gi/BYsBvky+dhyis2kpdwF5WMhDFiOwFk=;
        b=dxHCafR9kA5m0sTQ1UKaaFmYO1NzZVTQAdDu6dJKWGJ4DhR80L0d00wMgstkVTZSHh
         cuVR07OXEYtgPLhFl/KCdardi0/Th1BF/7FapHud3L+oRj/gBcTm43247Yn0oq4myrKy
         F5bZG0yiETD8YSXPc7blzfJqNJRfLz35YjMBJ3glJ/aSvDueFGLDvkLLi3t21ASgwuFZ
         lY7ChrxqRZkImLGjPGKr6AJ+NJNd/VJbelw8jfMNZTrYxlsnV09dd4vH6kReelURyUZ2
         0XS/uQ3+pWLKhBTEYiGYipgkdXXxF3ygtCMbn/8IiTNaqbGbsJ3ISEIsWEXaj9L/kpLy
         Gt9A==
X-Forwarded-Encrypted: i=1; AL+hErG1IkSr+rs7jgzJJyerYCTrHzZD0oh5dYbjOo4vIngZu4cTNhgr9itwhhx8z6p1Km2LCNKioRGFIQi4reA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UDc3HGKde684HWY4cZ6wHsFOpiKSA5k1IIxRuVHbq+c8/UeLf
	6kRwQSuUpGLVFrNKeDiJr3B+hLz/b7d86rGng+FIWcuRxOtnXJn82WB8
X-Gm-Gg: AZFdTZdywfL32pWRwczawYwswFdHZDkUcAbr+I6xuzCD44LO9xfBh7P1I1E5FU8sf3C
	te/gidr9Q49dhg2vdic7+MbSnmbDaq8sC2yjkXB3tkMNgOGRSvSdzA0huEPCbr5zwVtxu5HO0wL
	Uwzt/9tEmkRQ1OE53aemr001QRzGKEkVXAudUj2LpgshytFE1f4VQMLjyRzB6TMB3oAbC+1bK+q
	xQ+TwH8Qmq8AGx+drA5QeYhvVUAZTGy3kRW3Rh/VS0adKqHIiQVx4VgSjD0hASJ20xrzZuIEerF
	91JY8b4YLRWlLLs6Yv6WAEGnq6TrRfo3xxrOWQlPRIiu5vdFeX+ebHZZlllSOusEVSKfj+V1g8J
	kQkkMNFlGaNCPPrkBVCAr+iA6yD1WNbF/jPfxm3zyKgY8SFyxs09o7vHGKiPW0F4JPsFOSVI+4h
	wG0Zx5yLvYnYpBvwajfL9u/mUqhV2zrUlSfR6gef8CaRpkfIAhan+wUZuCmDlimu7JMCJzTq21L
	Pu6Mut9vKRXLZNIgKnyP0S40EuWWps8gu1rODCe0wjA+Yd7DvGxm999BGf8+pWs35l2cfpBg6Jq
	rekujaW5fs6+xYvFn4DFVFKsBQopLB5sJ7tDtK5d5uPfLy0B+YmdjgtkY/PqrXlRQ9c9QeHKaKE
	5IqRfEp4lWUWqNcB6oR9B+zMkvR2mKBfrgPqF0gOSTX6OHDDbpo1lJf8Yr2A1VXhJR5KMmQWCCt
	uRMR27rJcC+pdHWbR3VXP1kKiJqxmBYuWMCW2bajEwYw==
X-Received: by 2002:a17:90b:2f8f:b0:3b0:ad59:7199 with SMTP id 98e67ed59e1d1-3b41c942629mr17539691a91.32.1795673299196;
        Wed, 25 Nov 2026 22:08:19 -0800 (PST)
Received: from LAPTOP-3B99V33A (ec2-3-38-183-164.ap-northeast-2.compute.amazonaws.com. [3.38.183.164])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b420e1307csm29928050a91.7.2026.11.25.22.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:08:18 -0800 (PST)
From: "Bin Luo (University of Electronic Science and Technology of China)" <luob87709@gmail.com>
To: aahringo@redhat.com,
	teigland@redhat.com
Cc: gfs2@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dlm: validate lockspace under ls_lock in dlm_release_lockspace()
Date: Thu, 26 Nov 2026 14:08:12 +0800
Message-ID: <20261126060812.2028-1-luob87709@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
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

dlm_release_lockspace() currently calls dlm_find_lockspace_local(),
which dereferences the raw lockspace pointer to increment ls_count, and
immediately calls dlm_put_lockspace() before acquiring ls_lock.

When two callers concurrently release the same lockspace (for example
via concurrent DLM_USER_REMOVE_LOCKSPACE requests through
device_remove_lockspace(), which also drops its lookup reference before
calling dlm_release_lockspace()), the first caller can enter
release_lockspace(), remove the lockspace from lslist, and queue
ls_free_work to free ls before the second caller dereferences ls in
dlm_find_lockspace_local() or release_lockspace().

Since lockspaces are only added to and removed from lslist while holding
ls_lock, move the lockspace lookup inside ls_lock and verify that
lockspace is still present on lslist under lslist_lock before calling
release_lockspace(). If it has already been removed, return -EINVAL
without dereferencing the pointer.

Fixes: e7fd41792fc0 ("[DLM] The core of the DLM for GFS2/CLVM")
Signed-off-by: Bin Luo (University of Electronic Science and Technology of China) <luob87709@gmail.com>
---
Found by code inspection. Compile-tested on x86_64 with W=1 and KASAN
(fs/dlm/lockspace.o); not runtime-tested on a live DLM cluster.

 fs/dlm/lockspace.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index a9c98b4..37ccb96 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -800,12 +800,18 @@ int dlm_release_lockspace(void *lockspace, unsigned int release_option)
 	if (release_option > __DLM_RELEASE_MAX)
 		return -EINVAL;
 
-	ls = dlm_find_lockspace_local(lockspace);
-	if (!ls)
-		return -EINVAL;
-	dlm_put_lockspace(ls);
-
 	mutex_lock(&ls_lock);
+	spin_lock_bh(&lslist_lock);
+	list_for_each_entry(ls, &lslist, ls_list) {
+		if (ls == lockspace)
+			goto found;
+	}
+	spin_unlock_bh(&lslist_lock);
+	mutex_unlock(&ls_lock);
+	return -EINVAL;
+
+found:
+	spin_unlock_bh(&lslist_lock);
 	error = release_lockspace(ls, release_option);
 	if (!error)
 		ls_count--;
-- 
2.43.0

