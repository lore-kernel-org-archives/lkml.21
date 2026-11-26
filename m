Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681018;
	b=aNoFdnHxD8Z4g5JGfprxPcjOQxMfyw3/l2vpKT8xPNHOkz1xmF6ulKOdlmsO9TMDFk5Y
	 W+nY/8S2bCB0IgdJtDcMfyH6rVd6TVHnWfHteGXYjPriSUu5V9D0dTfLreOg7v84B18gQ
	 IJ0J6WH70OrkQ2KZj3FzagJqMzPtVhQl4ZaHykNZ/id4SSitJmWi/TilsTMZTofxRpuej
	 0VTZef2w+sMcikMuNXWLvbywbxFXCAk4Kzzj1c6NdmAEjT1/cJW/WoqIlYpdqzjTKIiYJ
	 g0L2LS2V5qe0T2Fm2YhsJkyX+xFH01tUbi3smtx05z8oYyuxIWefZ1eCQXHaRhbGSiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681018;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=X0MsT9VS5PnQqjPZkQqcoPk4cS0Fvp5tQXMqwf/FufA=;
	b=V2ESVWEbkzbyDgBHkG2T0ay3DNMbTyvPieyGnrkHJIQr2lnejEYq+icznYqq0eSs2bs0
	 eG+Iixx9Sc1AMVdJQIlq9e74TkeAtzFMAGKGWijsVEgYUjU64rkBnPR1gy2T5BjAei3/L
	 2f3W7mTsEOyOPKOvcbR4FnkX/j3u3BeT7NOZtHclPmTKruHR0gTPk/acwsTGdkU046jqs
	 vadBKcoOvujs27y9pMdMLIqkkMgvFM9h6ZfmASDosDn9o0hL6oWHfbW+NGsxbuF6wYCOH
	 K50KWMktiSYRzz4rHjiN4fErjpR6zHbGmPCznwMj++Xg0P/L73BkUO6aDtYwJLDk48g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E4g89c3f;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB171606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:16:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB171606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E4g89c3f
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so38562285e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795681016; x=1796285816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=X0MsT9VS5PnQqjPZkQqcoPk4cS0Fvp5tQXMqwf/FufA=;
        b=E4g89c3fzgxg5QIvPnv6tLIC5e9P/xerz2hTlcaCclvGQUsULLHmf+dIs5m3Uk92n5
         MihN+RGjNO59CgCoYS6Gu8UYdGub4to9Sw1DNtDam4r+oBxl7bsSchL03JGJVRtj3dvv
         6JhE6O6DyWCypXB6rDwRSn1aLXxdbkegSMP+r8ySn8B0RBQxO4D83peRip7WcYFveaPo
         Z4aHOm8tDOidjPNQ+gmPDYIb/C87ZhGUpShGjY4KXIgg3Lsm8ZSTucksLgYoTgLrSQ3r
         BIO+c4IZdbQtDNLAlDavIh263Ya86JIAqvFHWmFjyVpZk6gCqpJERQZMLhZqkuStCc1H
         sRKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795681016; x=1796285816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X0MsT9VS5PnQqjPZkQqcoPk4cS0Fvp5tQXMqwf/FufA=;
        b=cknhogjhtc41i0KTzCX1vCzepmAzpjBC+M90XU0JiZWLa90vnYE9nHjJFYtnzbJxhN
         K7snZTMZBflTJFP4xLVNpSOQi1NeOrxhCy1cpqGD3W3FlnilRwuRQusgZ2VB611V8sSz
         qoBrHy//Ewx234B9UKPuCKK/FMrJlcQFogO9h/tEy4xUAitUwbTOuG2G0bVyhCKRIA4s
         sgZMKMri+GM7YefQ09+hwlLo1cNQYlA3d78QqlG2D1NpRzG7QNPECVTT7Wofs/+owB3p
         QNXUzSeGT79ohd+GNp7RWbR831+GwURCkpecFmMVCPkqv2IorL8Uh5IA2iSZuixjqqa5
         +V0A==
X-Forwarded-Encrypted: i=1; AL+hErFNbVSIkBw3kawsdva1cJNNvRuQxSY19YUwh0DsqwiTzqFLw4U5jI+57Mdy92+F3Qj9kTRZN2oii25hWPA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rDRW95+h1oTcDxKIIbfqFC9fn5pKGhkDoXVaYgwFiBlD2iPdn
	NIWlvxjpMaoI1w5Ny48Y1Lr3tp6LntGF3NhIuR2sN6GSGMDtZpax1s+i
X-Gm-Gg: AZFdTZc+e8iSHpwCQL2+RbsdazrrkF2bbNgEchzJTodSS5ee8+vZaTNaIzCqRLpQ6fM
	lz8zPKurd7KpMqQWsfWLvsASK7MUedyRW/4XAImw69YtjF+U7c6VFjeuAJXBBjU+Klct2YbgvKv
	ElRX4fPVzCwaFkZkOKu0kd142GAlDpb/vrIG3+PmSqKJ9iGLx1IwkbNa2dN3lqaFEH3zUz/uLZ1
	Roxs9Cbceol6P+DSby7ySzRxqcK86TYPKFbnFRQ61fP5Ghs3NmD0SHBU6NcKQSc3abFFiOF9s+a
	AewgBHGdXXWRf4Jh5F8D5CVKGX57WAU0Jp9mm3WZed55mN1W4ECyXtbFDwNbDGLnyohUxDZFpuc
	igV0nE41cp0jiewWYD+/QOag/V7pLo8BPQR1N73i2isjN0p01aPlAkn1Xd2okv7cl0tAEcOsi4d
	XdVOBzdtFfobePL0UkMvkYE9+1icW4yxOWM18VE5JAPOgno6kDYsz/M3En7gGGAEqc4frKbdR2t
	6U+O33grw3kCUOPzPIGq47yGKqsJ3dWTlAznuzx3tbWfam1YVZcVekruCr2LkuxkMSI/DlCBzJ/
	goNgqHlbGni05dNM5RQcxZnSgNHgQo3jBisH+1Agfbcq6HNeZBOPb+dHnzCAIzwx9P7VThLa6Q=
	=
X-Received: by 2002:a05:600c:4f4e:b0:4bb:6c71:b268 with SMTP id 5b1f17b1804b1-4bb8882672fmr425501975e9.6.1795681011621;
        Thu, 26 Nov 2026 00:16:51 -0800 (PST)
Received: from grower.termidesk.ru (ppp91-78-19-165.pppoe.mtu-net.ru. [91.78.19.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm569559155e9.10.2026.11.26.00.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 00:16:51 -0800 (PST)
From: Alexander Martyniuk <alexevgmart@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alexander Martyniuk <alexevgmart@gmail.com>,
	Diana Craciun <diana.craciun@oss.nxp.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Bharat Bhushan <Bharat.Bhushan@nxp.com>,
	Eric Auger <eric.auger@redhat.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Abdifatah Suruur <suruurism@gmail.com>,
	Alex Williamson <alex@shazbot.org>
Subject: [PATCH 5.10/5.15] vfio/fsl-mc: prevent read-only region mappings from becoming writable
Date: Thu, 26 Nov 2026 11:16:42 +0300
Message-ID: <20261126081644.45517-1-alexevgmart@gmail.com>
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

commit 25fd8b27ee8d4f59cc2ad99cf67aef4570b82096 upstream.

vfio_fsl_mc_mmap() rejects writable mappings of regions without the
WRITE flag, but leaves VM_MAYWRITE set.  Userspace can map such a region
read-only and then upgrade the mapping to writable with mprotect().

Clear VM_MAYWRITE for regions without the WRITE flag, as i915 does for
its read-only objects and as fixed in drm/vc4 (CVE-2026-68445),
drm/panthor (CVE-2024-53071) and commit a5edadbae57e ("ptp: vmclock:
prevent read-only mappings from becoming writable").

Note this is defensive hardening: the fsl-mc bus publishes all device
regions with the WRITE flag set, so no device can currently reach the
read-only path.  The guard costs nothing and keeps the mmap() interface
honest if a read-only region ever appears.

Fixes: 67247289688d4 ("vfio/fsl-mc: Allow userspace to MMAP fsl-mc device MMIO regions")
Reviewed-by: Ioana Ciornei <ioana.ciornei@nxp.com>
Signed-off-by: Abdifatah Suruur <suruurism@gmail.com>
Link: https://lore.kernel.org/r/20260929094848.7439-3-suruurism@gmail.com
Signed-off-by: Alex Williamson <alex@shazbot.org>
Signed-off-by: Alexander Martyniuk <alexevgmart@gmail.com>
---
Backport fix for CVE-2026-99810, adapted for 5.10.y/5.15.y: vm_flags_clear() appeared only in 6.3,
use the classic vm_flags assignment so the file builds on these stable branches.
 drivers/vfio/fsl-mc/vfio_fsl_mc.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/vfio/fsl-mc/vfio_fsl_mc.c b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
index 8722f5effacd..e77062cf066a 100644
--- a/drivers/vfio/fsl-mc/vfio_fsl_mc.c
+++ b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
@@ -494,9 +494,13 @@ static int vfio_fsl_mc_mmap(void *device_data, struct vm_area_struct *vma)
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
 
 	vma->vm_private_data = mc_dev;
 
-- 
2.43.0
