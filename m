Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795680999;
	b=P83MirYoGlOGd339EGvOedZRY3mNZZecajC2fko1OVg65/LcpJLSDt4mwoWld6YGtu1L
	 CZ+c1zWV+a5M53pWgPwOGV7uHZfhGjKy+cqAw+5SoqrIOwiQdA/IxXeDTrk3vMaWMiHha
	 khFJm/a+Eoqi/yWe3U1XjqSiYDqeypy822doOPKfgmMUB5gRZHsU969JLPtTtjHwSZlbV
	 SBTeuhfH3Qs6FZ1/QF3pNRLmd/P+UkOYShyQd0JrFZ8A9hMBt1EjuSACyKETbXQ4TnQMD
	 ysrvd7hYwLBG2kHK6R/wSz7n+7E/L5+g5FeXtmtrKBGe2iLYn9aux0MMKsojODdDGfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795680999;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CBSIDCKro4GDs12iDpbveHASbLjhtJ1zWAB1w2J4Ssg=;
	b=Y24U2GBZ11uZcQthOTcWiHV9sGYwqLOwOBxQg5U13dEC9i9EmTtbOWXFcwKCzZC7Vjyy
	 gy5fYjJN3DB6tIUTI/XgAtwy7EkKyjrRYbxasxEkgnlS06Vedl7BR1bQ9dXCWYcDKWzOa
	 hSga9eUCo2Bk4Iag4tOWkzZ07GmOKy64q0JeygEMPgt6x7F3u4bVsXiMtIE8cqSb+tzDJ
	 bDYiDHG+lwKv2Q8/Bmn9Hnea8Qcfczyl4uG82k26sUOYrwqXDToJZnFramvVUucL247TB
	 O+Fr4mbkf+yLJnjxHuznqLsIE+tQ1zKuoLUfuDvrhc3/O1JSj2O5ncDKngVV8ZryJMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PQa1AFXI;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63904606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:16:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63904606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PQa1AFXI
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so86044815e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795680998; x=1796285798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CBSIDCKro4GDs12iDpbveHASbLjhtJ1zWAB1w2J4Ssg=;
        b=PQa1AFXIZS40/OkHRWSeK9C0cJH4iXrwvZSbqalNLtcMObluAt2ryBFq+7UwnlrGtk
         Rpbe2zlplBYfObUSV+nJJDjWG678OAAU2fzBxTF8TZlvuYYdU/GZtHr7hSj8Q1IpBCmc
         8yQFV7mvXIKXGc+W+jn0ycgK+gI1vzpJ3l2H4s629XIWdwtdjEcRdVSHbORecbNpHt3i
         5mR5Xd+Jz+7wusXeD3RH9hRRtV0w7xy8BY04bYAHjHPdkXq43OacZwmVYeQZETI6dHcE
         +SCTpHV7CYu1AjQYSuSBFHoaFIFiSg29kxlBkHG1eOXjWNMT72xh4kU38MjsOXLOYTpd
         S2Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795680998; x=1796285798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CBSIDCKro4GDs12iDpbveHASbLjhtJ1zWAB1w2J4Ssg=;
        b=zLr55InkZKIivGdvj/DPK7aT+jhVL/+cCcvs/L3uXwzrZ5PEo4rVL7anCfUM61K6PM
         JlOdJ6RRurzJVPGvbOHznxVOOThhHXar1nB7LBaN4ivuI8qwZKuyhUTKv66VRxOtqwxn
         TBD1G+4i7ipbi7DuNioHT/CGE6HdZaUT3BV0MjNu9RTpEK3Ie899x2zb9AME6MDAvS6L
         KL18B3jD2bFl2yuDHwuH/Aa8JU/L0Uj3xDC2ZVGy58oJtnQul3uuhOTTdPYcE7zR/bYv
         V63TXL/nDMel7aC4itq1tYN9yXzYj+1i70agw38jh2piFemZlHcLeUBbJC3vp7t4m5bZ
         bmlQ==
X-Forwarded-Encrypted: i=1; AL+hErE5wvcJRb60B50sfEE2MyVciFR3OVTM8yVZsXE7RSFi9aj/7wDJK7J+X5+Qz3NUlfuo40Aof03gX+qYIj8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WD+AVHSzp9G5nY6eA8MwWA2T8lhxIx9iLgPsaTrjxFVc9QKcF
	4BKXP8i1rtpkwP+E6nARVqEgqbaivVs8ET2bABmUBiGQWM1+pQJw0i7B
X-Gm-Gg: AZFdTZeAc0dFzK8peJVLC8Ir8XGEpmV6+f44igAApm/++qFdfUV3wouQxQu/mOmY1S8
	NYHRBQxaGik7MxvLFPT1N9BNgfUkojGiRR1AewfXIaVv9r/tKfUA79q6aTyF8gjYSVywp0fD9Eh
	uj61aZ4NznKbRBhQEkTdmyfQXk8Op4Bwp7FCa6/di9fd7J3BrR7w66LGeJYRBcZHx/wl7x9agrg
	vnkBiZw/PwVru0aXOIfay0ZiuH3md7XySoNgPiGsLvvekRqfM9R/2vPQoNUxvvOkswTZaiWRbtp
	FeDVuviHqOYyZ2xeIzXYsi3XyQK1QLlSnZ0pti3XvoIl71z8HuLQyZsn17OUyyfWL8Rn8bfgTD3
	23hWA2gysETJyucQxZnK8M6DZRmYBSobtS6UO3OHJo4GIP0K2wehBCB3JoBcHCotlXzVAgdt5nR
	xhiCo08i16IUoO6zRvAeYJC+b5MIO6fu9Qd1LD4NN893KBkqI22cgWVDQWa94HfB/LmYleuJmg8
	SjMVwUMMahYYgRjZ1XnhAnPGpm47DCX8Mo1ELgGm7I0w7ebqQ6kfi2/ItL+tkGYzG8yolOYFJrz
	c05KARXwfIAWXJMwcJG+e8ASeq6f4nOkA72f/rf9RrW40/Q2WA5yX1CyPGmc7AO0NSCkWI+zfQ=
	=
X-Received: by 2002:a05:600c:154c:b0:4bb:6a78:7c42 with SMTP id 5b1f17b1804b1-4bb887c3428mr407967675e9.1.1795680997558;
        Thu, 26 Nov 2026 00:16:37 -0800 (PST)
Received: from grower.termidesk.ru (ppp91-78-19-165.pppoe.mtu-net.ru. [91.78.19.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf61e8sm40320996f8f.11.2026.11.26.00.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 00:16:37 -0800 (PST)
From: Alexander Martyniuk <alexevgmart@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alexander Martyniuk <alexevgmart@gmail.com>,
	Eric Auger <eric.auger@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Baptiste Reynal <b.reynal@virtualopensystems.com>,
	Antonios Motakis <a.motakis@virtualopensystems.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Mostafa Saleh <smostafa@google.com>,
	Pranjal Shrivastava <praan@google.com>,
	Abdifatah Suruur <suruurism@gmail.com>,
	Alex Williamson <alex@shazbot.org>
Subject: [PATCH 5.10/5.15] vfio/platform: prevent read-only region mappings from becoming writable
Date: Thu, 26 Nov 2026 11:16:30 +0300
Message-ID: <20261126081631.45468-1-alexevgmart@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Abdifatah Suruur <suruurism@gmail.com>

commit 420bed9131dbbe37abe9d6b32af51219875811e0 upstream.

vfio_platform_mmap() rejects writable mappings of regions without the
WRITE flag, but leaves VM_MAYWRITE set.  Userspace can map such a region
read-only and then upgrade the mapping to writable with mprotect().

Clear VM_MAYWRITE for regions without the WRITE flag, as i915 does for
its read-only objects and as fixed in drm/vc4 (CVE-2026-68445),
drm/panthor (CVE-2024-53071) and commit a5edadbae57e ("ptp: vmclock:
prevent read-only mappings from becoming writable").

Note this is defensive hardening: no in-tree platform driver currently
publishes a region without the WRITE flag.  The guard costs nothing and
keeps the mmap() interface honest if a read-only region ever appears.

Fixes: fad4d5b1f042 ("vfio/platform: support MMAP of MMIO regions")
Reviewed-by: Mostafa Saleh <smostafa@google.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Signed-off-by: Abdifatah Suruur <suruurism@gmail.com>
Link: https://lore.kernel.org/r/20260929094848.7439-2-suruurism@gmail.com
Signed-off-by: Alex Williamson <alex@shazbot.org>
Signed-off-by: Alexander Martyniuk <alexevgmart@gmail.com>
---
Backport fix for CVE-2026-99809, adapted for 5.10.y/5.15.y: vm_flags_clear() appeared only in 6.3,
use the classic vm_flags assignment so the file builds on these stable branches.
 drivers/vfio/platform/vfio_platform_common.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/vfio/platform/vfio_platform_common.c b/drivers/vfio/platform/vfio_platform_common.c
index ce67ed9510cc..64c4291592f1 100644
--- a/drivers/vfio/platform/vfio_platform_common.c
+++ b/drivers/vfio/platform/vfio_platform_common.c
@@ -617,9 +617,13 @@ static int vfio_platform_mmap(void *device_data, struct vm_area_struct *vma)
 			&& (vma->vm_flags & VM_READ))
 		return -EINVAL;
 
-	if (!(vdev->regions[index].flags & VFIO_REGION_INFO_FLAG_WRITE)
-			&& (vma->vm_flags & VM_WRITE))
-		return -EINVAL;
+	/* Prevent read-only region mappings from being upgraded with mprotect() */
+	if (!(vdev->regions[index].flags & VFIO_REGION_INFO_FLAG_WRITE)) {
+		if (vma->vm_flags & VM_WRITE)
+			return -EINVAL;
+
+		vma->vm_flags &= ~VM_MAYWRITE;
+	}
 
 	vma->vm_private_data = vdev;
 
-- 
2.43.0
