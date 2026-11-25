Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795649204;
	b=gn8Px5DLkx6HyDrp27HCzw05bDxDnQOOoiXnWNTJGQsg4XfV/Kx++rNVXBpyyP9PpToY
	 N5vB6C4b+RQOfEUkR9kk2fsDVwJjcbD/uW4OiB1jkkejLuTD38R2NsfwvMdB5dKDAL5GB
	 ky8AKDci+/WJZSbYmmE6KQn52utGUV/WrCf/VIAaK4Fdj4CgS9EwsAXB2D+QzpBFxNcwW
	 h48aFJocjn8Snq7zeByN8W+W+9hj85tkSJVJeUnI8lc3dK87FF0y3Ji6T/+BY1igttAiK
	 YM+R08Na3mtz4NqBJNi4X6u0uuC75SmUDw7y1rZZvNtfR/6fCLKtvKBcsm+DGPe0WXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795649204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=6h7kwsZNiIakcDOBteqgCk42cVXx+EQMyY+qUW44Ixg=;
	b=YRCpsbL9cj2mc2F9DhlydYBIujBH5A2+Rjo2cfMh1Y6PwJ0gLbitI45y3fyzZ4xP0jXu
	 Dvm5d+VQBStNpDuXqTMq1Afafg+i6EPLBzYY10hZRfjercx7zjpudwe/Hkdt8NP5xBA8F
	 SK3LXNFHvcDNMhdqnBMRNfi+nw7IR3wOFgvloG4IQ48jmdrmaMxhKKHG+6RjcXo0eAJK9
	 rFPvmVWZiqMYycX0J9zE705K0H/dRUcItNgMHPYDiuGl+7E758rqyF7OQcVDGpV3Dgz0K
	 iQw2Qk0lIVs/rWou6tdfFPeRrNVIkMH8G9pNQ6naTaKD3rlUPcTEUbR+XuCQUUxfAcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qLxuGZBl;
	arc=none smtp.remote-ip=74.125.231.133
Received: from mail-oo2-f5.google.com (mail-oo2-f5.google.com [74.125.231.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A98606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:26:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81A98606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qLxuGZBl
Received: by mail-oo2-f5.google.com with SMTP id 46e09a7af769-862a1dbb516so1149310a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795649203; x=1796254003; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6h7kwsZNiIakcDOBteqgCk42cVXx+EQMyY+qUW44Ixg=;
        b=qLxuGZBlIJO1CODoy/7gbN2TVx9a/brmOGwHaA3X7IbliSar0vj9qgQL5bwr+QaN/C
         oBEpE+csCOKKbi+Eew9oMjcICZKqGBmJkA35ZjU9N19UAMOOt7Qp26uX+sdnSye9D6iX
         dz3Ak169tAuXuwHtYqGABbT3od8RWBc/hBMB4QH/PK8WQCvA/I+lHCcvoyVJ46kt/CJ1
         0PWiNB4k2fjVKD3BDQsZn2ZO7bbEMzrZ4BAeToqyY3SmzEDJib0Hw+C6KMjlhn37Fn25
         2RJsAuwx5FaxwMaLa6V+1q77wL9OoZRSL4BJ84goi8Lr/XCQKc7XeYhBjdqKKAYUPJg1
         RyKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795649203; x=1796254003;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6h7kwsZNiIakcDOBteqgCk42cVXx+EQMyY+qUW44Ixg=;
        b=NAXZCKk6Gw1K7tTiOTeOJewzoThiuLSjOqy43rDTtPUxEIqvypcE4JaQSsl4in/Xwp
         9+nXkqoRPCQj0/VelgRr8BujMz6D3oTvxfdQN33kpJy8l9abi+7pVOl6kZAVNEKQpKRP
         vbbSnAKtSqlPp0CqhAmCfjTnjZoRBFE1MI2GbXzN/ZkcUsfLRlL33HB/S4/R6ilhuKje
         YwGO2iFOUL4MdLnfW1tBJBKjy+p+4yrIA/xyhb6ILpY2m+j3CL4l4AN30ueii7UBfOz6
         akj/RhiNjKO7QMRYtMGMAFK8/cNGGbo5DgV/oH3c9cplX0H5Wzv2+yEheIh5bsQjXn4k
         mamw==
X-Forwarded-Encrypted: i=1; AL+hErF2MwGLeTJPRHmuOfLNOj5yY5XciarXfget25IGvOoAmyBDqJ2w8ojf5K+ZafKth07/LHGuEb0PvN50N3s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yLFXRYs6X8a+uu5rR0i2G2OG39gDHrVVKupXr98z7g5SL1TRT
	VJDXFwSE5xh8sT+zWK+Xe0E0zRCXR2xrtNnEPP/XPkbd0N6LPn1sz8dy
X-Gm-Gg: AZFdTZevBZxSEyqGttsRhe2KPdMGfUrdgW6YRgjENegxrsdK46OO9/PumHeiiang69n
	RhvHLz+4BHKA9Chl+mQhZt3bkf+toNnUgdr7iaZDk4UCy69g8yWEpcbPNZeO/vlEl6boOUhEtxt
	6Z5PXhJ+YWO51iQMl2k5mCcm9YXp0MIJ56jyp2ec3QArWVp6XZ2YWj9aRbJJt3kOORBfy20NDUg
	gTVvBk8Vjc2f1BzXEpbSnVznNZC7QvX5EhUP+QVNBm0D5LfVj7RynbK0NTyb69RRZLxiARbZXBs
	kCvqvbmxeMK4ryCvIXO7XqNN0/G+37cQWZpHnjJGRmXxnNDbllU79aVjUNuHv/CXxwOpUdJjNqY
	KDHt2fypEeJbLHtjUJbe77Gtqf4h/h5BOGJLnGIDhBACaCuAcIw22/M0+x0poZunTJc5wBrhT3P
	lAUd/VnHuC7TuCGPDrac8IzFT2RfrrjRREN5lSGm4bbKSCltVM1Fe3X1oUG8WMDxkhiebfe4KgK
	7rWMsEbH2yIomulQ9AJrnAN8upvfa19HC+5izruDMKrVtralCAmQrA/WU7V6x+2WRbV7GokVSoG
	A/rxKnuPBmXl3WytkcOXAC5dThrQTllgCxs=
X-Received: by 2002:a05:6830:310d:b0:83f:f24d:fe19 with SMTP id 46e09a7af769-863151bafcamr28010483a34.3.1795649203395;
        Wed, 25 Nov 2026 15:26:43 -0800 (PST)
Received: from [192.168.0.98] ([50.26.120.197])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8631692f049sm14304892a34.25.2026.11.25.15.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:26:42 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Wed, 25 Nov 2026 17:26:06 -0600
Subject: [PATCH 1/2] drm/imagination: Report firmware page faults
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-rbrue-suez-pvr-reset-recovery-v1-1-2cea8b163e7e@gmail.com>
References: <20261125-rbrue-suez-pvr-reset-recovery-v1-0-2cea8b163e7e@gmail.com>
In-Reply-To: <20261125-rbrue-suez-pvr-reset-recovery-v1-0-2cea8b163e7e@gmail.com>
To: Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Donald Robson <donald.robson@imgtec.com>, 
 Sarah Walker <sarah.walker@imgtec.com>
Cc: imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795649198; l=1161;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=0immpeEVfo1V2B9tlmsJ5GtsVBowBS1U3ikCLcI8PL8=;
 b=VxmzF7BQwsqcVZ+C2zOAWyW7mWer5SCFRdV+aW4tFsuXDHQHHURY7JLUxsHbLkW6L7d1zPeZS
 dmX18LpCAF6AydZWUlqXqDAxXO/qGDUfztNAHSS8d0RR+sQdtNLRLuO
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

The firmware tells the host about a page fault of its own with
ROGUE_FWIF_FWCCB_CMD_CONTEXT_FW_PF_NOTIFICATION. The driver has no case
for it, so it logs "Received unknown FWCCB command (type=112)" and
drops the faulting address.

Log the address as an error.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/gpu/drm/imagination/pvr_ccb.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/imagination/pvr_ccb.c b/drivers/gpu/drm/imagination/pvr_ccb.c
index 7043b491fe54..0a4d338ca47e 100644
--- a/drivers/gpu/drm/imagination/pvr_ccb.c
+++ b/drivers/gpu/drm/imagination/pvr_ccb.c
@@ -167,6 +167,11 @@ process_fwccb_command(struct pvr_device *pvr_dev, struct rogue_fwif_fwccb_cmd *c
 						    &cmd->cmd_data.cmd_context_reset_notification);
 		break;
 
+	case ROGUE_FWIF_FWCCB_CMD_CONTEXT_FW_PF_NOTIFICATION:
+		drm_err_ratelimited(drm_dev, "Firmware page fault at address 0x%llx\n",
+				    cmd->cmd_data.cmd_fw_pagefault.fw_fault_addr);
+		break;
+
 	default:
 		drm_info(drm_dev, "Received unknown FWCCB command (type=%d)\n",
 			 cmd->cmd_type & ~ROGUE_CMD_MAGIC_DWORD_MASK);

-- 
2.56.1

