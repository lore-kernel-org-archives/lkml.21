Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795071806;
	b=nm5KiqoPJHhtBk9CL24g/OTk1QD+4ZVH/n9NS6AXaVNzTF1DNw56ejUJaIsKH4r0OEu0
	 97K+sMue13onfJ21fRphDdRZKp2r6EeY/PmdHzezvFlNGgBFZMGLMPrcimRZX7YaIiMZb
	 hLWGksH9bFLABuQC45CAOSUuYloJ2KS8m/ZcMBRP3JA70W7jD93Mclnmg4IJafQXxfKYF
	 w+/Y3xQpgmOfUwSlJFkXhsw/HBgZlWZZ1KYGiLDjdoq/4sLMds8mcRAm9krvIcP6RUG9n
	 5aQVt1AMCbyFbY074ztD14UQtD9IHq7RzzzNHH5fJLB4FeU+xM9gTC9CVLowCFS9lUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795071806;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rmF6Xu+9wYrDXpgVne1XB3MHrNc0Gs4/uTZG5IQjBTA=;
	b=irOKthiL8Or2tlVFD1Oz1Tf4/4ynivMpdXmkkadeHfBhgKy3WabPfcJD+la+UXMjTTGg
	 UaaRpUqDa/4FDSgBxEhU3w+s221XV1XlZ4zfL1AUKi8UdW0h9OQZKpq4cFmux8QcqNzxp
	 CWEi3qlxK+TfpZYCRgtdVg71lHIfdTE4yIK6bVNY+8Pq3Qv2cyUbgaXNX0zX0dClZnKD/
	 xe4dzdKg3QllpgpgSD4Vx47AlkrU+qXaISfMMZvfelrt41mfz+vVIMoCGXBggA/7/sMw9
	 qpNuC7jaC6hXL6B4HRn3kaeDdrF2Y8IULjJYyZZJSUSjen90nAl9NjRd7vvOhBLuiZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZLpnYgAp;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1D5606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:03:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D1D5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZLpnYgAp
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e9ae391a05so4108715ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795071805; x=1795676605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rmF6Xu+9wYrDXpgVne1XB3MHrNc0Gs4/uTZG5IQjBTA=;
        b=ZLpnYgApRVjV6JLgCyz7VdxrSVlNF3dQjVpOiAd9MfestO1XWkzFc6IU3z8+L7Ykdt
         1mXavHvJn6C1fxopWwkl/zyoGDCEYOEmdIzOlF2WWMAo9IvM38lHUdgUhlRTxz7aIZRm
         nrDsiyDSTHHzWo6Xvyaees5uJeCDwXC1qrid1fX73imkbNY+pqe+VXL6/MWAnhNaVE+g
         QymlMBM+UhAtcXQ0kBfMTIGb60my1ZA7x5wLtbFGU0s+HZgxdF+Yud5gu6IZybfvAoWy
         6eFHgUBuERSHaGVDO3SlcFpycp7RwABHIFM4pt/Vtx+vbZ3GauyjKtKByk/rfJswXqKX
         7E9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795071805; x=1795676605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rmF6Xu+9wYrDXpgVne1XB3MHrNc0Gs4/uTZG5IQjBTA=;
        b=H8DB38VhGppzCM/vH50v5CqLyxmqhmy5ozj22Svvef4zj+jMLoH8xrpt7hOAamu6iW
         EMMPeByaq36QQ3WgAzOCwSX+0CqSGP0+gyjbOiHvh7+NPkTMaG6OnPJ8d7nJpb1dgh3F
         Di6Ns0bD89VnrEhn+Nmgjb+jgpCMYEMUu5DN+HBLHdPr4nxpj2WS34qIOa7beuW8bhM6
         3JTqFVg7hxbP92cwL9boOhyF+Y0EpeKSZyzfcOO3xoyhbmmIrvKZ8218aQ2WMZ6qXUmP
         r14hmU45uHm/+EE7JWMsaQPrpjkfBcwRDYSwHiIFpBDNXSiM/BGUS85qHIts/uy2hlmO
         E0Jg==
X-Forwarded-Encrypted: i=1; AL+hErHXcPHTxvfyAoGbdv5A53QFxaXmXXIbg+agp94GassudLa3EC5IgQOUXpBPO35vyaxq0kV0xQtxP6HKW9A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8eIptJmqL3/k4W+nUCcxvgjwObegK+tqEDtKRXUC5k1TrNN7L/
	Bj20p79Rfrby7xekbJAcmjSCEQBwffkBYY30pjMzBlNjTz1BPKpc0ygf
X-Gm-Gg: AZFdTZe7trFGmEAixSIeqL81yUKfbGO+LTGHHoZnrN7GlUYcTKBXrkNKeo+6zzW8bMt
	QRpkg1u8AdDTxY3//KKsuaZo3CNfpBDfa/77dy3sjiigZ3eDwoNYh2xgRaP4ET9H9FV0uB2V167
	MZYUxOQq1aMRQPuPCRfGbg17a3WRf4nKGOtObRdLAxVRCOFElQmCsiVUPz6qwgOEQjRJQTGbFT/
	qvf+Zgfz3pYWZMT3+KA8+bqLL0Ds9AaoZLtGNQPL0YFbQnSxv9V0jdFv03iQneVNMZX6ISGNtO1
	oYC81NfruaMQSy1nRjHV9Yc0QgZTrx8fq2wezMMiqwZIHAPZiezApXMqZ6YMigw96iJeLqql8mn
	uawWfz1I6K5WGPxO0BFpEwAUueyY60yb8kvQJ0lfkQ1laLdz4CGxHmXxywAz+mgrcGJZ/cifkgf
	ZBFlBreEfSmPNQnmUKQtJMoSTVnXe1dga+WVKxk8/462FhFdNTyoV3SbOloCP674zFO2CWLw2hk
	DsNnU8Ekuwi5aPbLivu3aZwzb/+ptmNWbLqlsMEs9WiPP1sez84Qqiy3tFr8/aFfGiEW1D7kh19
	S7ogUuAz5E6ps974Roy7ZY/EZa91hIvBzfyyiD08mOytOg==
X-Received: by 2002:a17:903:384c:b0:2ed:520:2641 with SMTP id d9443c01a7336-2f031fff21dmr2143265ad.31.1795071805138;
        Wed, 18 Nov 2026 23:03:25 -0800 (PST)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff617f8cesm25297815ad.27.2026.11.18.23.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 23:03:24 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: jakeld@gmail.com,
	ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: [PATCH] fs/ntfs3: accept $Bad covering the last partial cluster
Date: Thu, 19 Nov 2026 15:03:19 +0800
Message-ID: <20261119070319.3803611-1-zhanxusheng1024@gmail.com>
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

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

ntfs3 refuses a volume that Windows, chkdsk and the ntfs driver accept:

  ntfs3: ino=8, mi_enum_attr
  ntfs3: Mark volume as dirty due to NTFS errors
  ntfs3: Failed to load $BadClus (-22)

The volume has 64 KiB clusters and 7337721855 sectors of 512 bytes,
one sector short of a cluster multiple, so sbi->used.bitmap.nbits is
57325951. Its $BadClus:$Bad covers 57325952 clusters: evcn is 57325951
and alloc_size is 512 bytes over sbi->volume.size. mi_enum_attr()
rejects both values.

To reproduce, run mkntfs -c 65536 on a 256 MiB image (524287 sectors,
4095 whole clusters), then extend the $Bad run to 4096 clusters and set
evcn, alloc_size and data_size to match, in both $MFT and $MFTMirr.
ntfsfix accepts the image; ntfs3 does not mount it.

Compare alloc_size and evcn with the volume size rounded up to a whole
cluster. run_unpack() still checks real LCNs against nbits, so only a
sparse run can reach the extra cluster.

Reported-by: Jonathan Pitre <jakeld@gmail.com>
Closes: https://lore.kernel.org/all/CADjMKxV2F-vgD6kVoo58j83p9Cc-xn1U_L6T7V5Y+FNNHaGUNQ@mail.gmail.com/
Fixes: c4a8ba334262 ("fs/ntfs3: Add rough attr alloc_size check")
Fixes: 20fd9f64c005 ("fs/ntfs3: reject out-of-range evcn in mi_enum_attr()")
Cc: stable@vger.kernel.org
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
Tested in a VM on 7.4-rc3 (20eef29b7c84) with images forged as above,
64K and 4K clusters: before, mount fails with -EINVAL; after, mount,
write, fill to ENOSPC and remount work, and ntfsfix -n stays clean. An
image whose $Bad extends one cluster further is still rejected.

 fs/ntfs3/record.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/fs/ntfs3/record.c b/fs/ntfs3/record.c
index d7785f9e8e09..22c5a2c56064 100644
--- a/fs/ntfs3/record.c
+++ b/fs/ntfs3/record.c
@@ -317,10 +317,10 @@ struct ATTRIB *mi_enum_attr(struct ntfs_inode *ni, struct mft_inode *mi,
 	 * since "(u64)-1 + 1" is 0 and "0 > 0" is false.
 	 *
 	 * For a non-empty attribute evcn is a cluster index and must lie
-	 * within the volume (sbi->used.bitmap.nbits, set up in
-	 * ntfs_init_from_boot() before any caller of mi_enum_attr() runs).
-	 * Bounding evcn also prevents a malformed value close to U64_MAX
-	 * from slipping through the near-wrap "evcn + 1" upper bound.
+	 * within the volume rounded up to a whole cluster: $BadClus:$Bad
+	 * may cover the partial cluster at the end.  Bounding evcn also
+	 * prevents a malformed value close to U64_MAX from slipping through
+	 * the near-wrap "evcn + 1" upper bound.
 	 */
 	svcn = le64_to_cpu(attr->nres.svcn);
 	evcn = le64_to_cpu(attr->nres.evcn);
@@ -338,7 +338,9 @@ struct ATTRIB *mi_enum_attr(struct ntfs_inode *ni, struct mft_inode *mi,
 #endif
 	} else {
 		/* Check out of volume for normal attribute. */
-		if (evcn != U64_MAX && evcn >= mi->sbi->used.bitmap.nbits)
+		if (evcn != U64_MAX &&
+		    evcn >= ntfs_up_cluster(mi->sbi, mi->sbi->volume.size) >>
+				    mi->sbi->cluster_bits)
 			goto out;
 	}
 
@@ -370,7 +372,7 @@ struct ATTRIB *mi_enum_attr(struct ntfs_inode *ni, struct mft_inode *mi,
 		if (attr->nres.c_unit)
 			goto out;
 
-		if (alloc_size > mi->sbi->volume.size)
+		if (alloc_size > ntfs_up_cluster(mi->sbi, mi->sbi->volume.size))
 			goto out;
 	}
 

base-commit: 20eef29b7c8465ac98d7dd6d6f2ac07a8d8056ca
-- 
2.43.0

