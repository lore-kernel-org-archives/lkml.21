Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795726702;
	b=XNwJ0QHIYcGP8w2FVfH+vKZrcjm3zw7KGDXsCMCS1CRAtxcaRnnDmDfvp/TuT7aB/TmB
	 mjQgpIyiiTOeAnJIbRuzTRSEE2LoS05KrIiYegpcddVpnb/4j4xSOl/0iRBtIygUMYmv2
	 n5VnCwWnvP3zV7PqCdkumrEEx3ZvsUzNpLYNucRekFJmbWWdOfBxmwM4/gNKooecpr7TQ
	 D+DrfguL9yJ3haCE7m8dyB3Lhbz0doRaSCx/APtxTmrzPIP4VRkrJrgf3eLjON2TgS5cM
	 jk+kw+bK1JFz1s9Rs3oZT7Gc+OqGKrjatohu7/4ICjY7m6qpzAdTbSaXoRI+X/+8Zqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795726702;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=35h4zBjbR7gM1F3Ki/dOQbia67MOOWg2rYj7xt/yKT8=;
	b=UVbF05An4lYyzvqG93l4h+tQluj5En0P0gkdMnEVVxPzmnq3hVRa0K0+vvI5tDJO6VuX
	 u86xGOmVqt/CbjjThByAcSbhVG4zaXn2o2fMEQy/s1grVSjrMRNVIvU9lMnP2mhP45nnp
	 8YpUIBo9m2i7RSE9/761oiIHON7xZmgDxL4Zd6DbWHX/OfIdGWBUKDfL6A3zaw6Kzoz4I
	 qnsFm7s1Mp4uW1DzWi+5P6+1G8uyvr7/uM7epCMxLVsENiKtZHK0jTRthKpT6tphSXiZR
	 whUqXNDYftX8MrmxrJxfF9KW+TQd4LuUCmUpBehO/NxE3oP1ZAgqRgTJ47HFBb6kJ6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hvBpjnLi;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991FB606A699
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 20:58:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 991FB606A699
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hvBpjnLi
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so79480045e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795726701; x=1796331501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=35h4zBjbR7gM1F3Ki/dOQbia67MOOWg2rYj7xt/yKT8=;
        b=hvBpjnLiK85NBLUdP8Zb9JJdBn71rCq42CPRamnf5Zjb1T5AY2ve34vAoZippRwFPJ
         YbWLRUove/3IUPW5dxc/F+sQpOyTfD7Kx7XBjTqsyZ9tGw1hsah1BbGmvVEL+DwHTqD+
         dUK68uMWZrA7+WhJpUkX3Ly4d/xPDZCATCQioL9ptdYCxhCg3FAUDmNdzixMQUTN0sSP
         Wy+TZXle4UGWM31NKwl1k/RKElPrpO96tbkF/oE1+62pK3AB0TDId9tmrCBrTuFFjxyb
         OLlqc/QGyhR0c9I9vP9CbPQ8jOQESwMfqeIZFgvhtztvfu0zCywccUZ3+1g+LdDK7vIc
         GxnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795726701; x=1796331501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=35h4zBjbR7gM1F3Ki/dOQbia67MOOWg2rYj7xt/yKT8=;
        b=S4f0dBP9SHY7STxbB/daFsjR7aFwfc4KUHGwCy5lgPwbl3jMmZy2YACocheRYTa3kH
         j33wYK57kW9y027YU+qTDzIbohnhV9BwgYigKV/44k3d2nBRXc5lwoCkCwxCyWQaqnnm
         bKdHMiTgnK69FCqkHqk+6cSZRwFxjnkpk26OVEL95c9kmuyp+10ySr6ZkzOwLw/eJtHx
         QqIkQyG6wwjE3RtMoWe5hrzJW84xRn8KWLow/5FrP31xXC2K8g2n+vc9Y1JZKSpSBd8j
         V4QNXzC66jTnK7kx1LGO62lCFIzO1mLcdhEbeN3h/teCZIMxOXmtDibZ6dLPWR3BdnSf
         iDXw==
X-Forwarded-Encrypted: i=1; AL+hErH+vFSJ5y52SxJDv6YQCzpr+Mx/lV1LpqKim9ByhjNUGo/+gYygS7jBdJYueKR5g316N5niQd/x5K7v6Zs=@vger.kernel.org
X-Gm-Message-State: APuU4Z80iAJbvzaOmxMkQ8S//0oBE17yJO2ayP1qkSCWIt25Pj4H7n3Y
	1ZGPWetodLKnB91lgWN4KUZnPN2ocqs2WLny3Tf42KCPUx9EDd5X8zZn
X-Gm-Gg: AZFdTZefaBixCyV4kATUEnDlXAKF9jDivwzYngF/5O3Bez7pToiyAmU4eZAFDeE2rTa
	wiGwh3FNZZyMMlYMap0p+KN+OiAx69/kYnf/qh6GJVxfM6zoSJfwe4WasxOgp8NYAHCHF2H0lo+
	gHF/7WTXydsFEBjy4WY7LCtsOa1d9+UzLDIufiLoOT18Kfk55C40zqFbevZ0r1Fgf1DZ4bs7CgN
	8OcSAbqoRQxUw7SulAi5nkD2Bit0sA+ZgqLD3UMIuzRRIIwtnhJ/3hgDEa3RAgt9owKG2xTW9lt
	yGDuOQTldBI8Ts9zP7Gb0h+H9H2yGpeBxdJnp7Kp7YHnaQ3am+mVzqnF3BfZ2h9vgYNp5feaHZ1
	26Q54R8Nhkg8K0P4A71PwyR+WZg/W7vvN1oSu5SggNPXCSBro5hfdI1fTIQ8ykO6V7CVv1D/i8l
	r5ngkT2TWSqYSV5WW2dTF30/+0oRN+VpeaN3hmUcZFQFesUfqdUbo9VsQNy17jk+68dXEMRwN/N
	jjoIFbXn+FwojWulDa25uG9CzMKagL1TNP7DpMQkM514raDpgP2v0XBoQwEcQsw+491btG2ksZq
	3rt8XsxgENG5+aphirJfOzTsuBqobJjDqQOT9J1vTIKzDxc/IQfuEc2StsOJU2xwtMWN20YDYOJ
	wvn8=
X-Received: by 2002:a05:600c:64c8:b0:4bb:68e5:b952 with SMTP id 5b1f17b1804b1-4bb88819be1mr422243895e9.16.1795726700975;
        Thu, 26 Nov 2026 12:58:20 -0800 (PST)
Received: from localhost (2001-1ae9-5b-ad10--33.ip6.tmcz.cz. [2001:1ae9:5b:ad10::33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399d52sm611178075e9.6.2026.11.26.12.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 12:58:20 -0800 (PST)
From: Arisa Snowbell <arisa.snowbell@gmail.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
	Arisa Snowbell <arisa.snowbell@gmail.com>,
	Matthew Brost <matthew.brost@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] drm/xe/uc_fw: select the DG2 HuC blob for a load by the GSC
Date: Thu, 26 Nov 2026 21:57:57 +0100
Message-ID: <20261126205758.49845-6-arisa.snowbell@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126205758.49845-1-arisa.snowbell@gmail.com>
References: <20261126205758.49845-1-arisa.snowbell@gmail.com>
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

The GSC loads the whole DG2 HuC binary (dg2_huc_gsc.bin, the one i915
uses), so there is no legacy CSS image to find in it for a DMA load: parse
the CPD header for the manifest version only.

This enables the HuC on DG2.

Signed-off-by: Arisa Snowbell <arisa.snowbell@gmail.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index d0ea05923..05f51378b 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -137,6 +137,7 @@ struct fw_blobs_by_type {
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	no_ver(xe,	huc,		bmg))		\
 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	no_ver(xe,	huc,		lnl))		\
 	fw_def(METEORLAKE,	GT_TYPE_ANY,	no_ver(i915,	huc_gsc,	mtl))		\
+	fw_def(DG2,		GT_TYPE_ANY,	no_ver(i915,	huc_gsc,	dg2))		\
 	fw_def(DG1,		GT_TYPE_ANY,	no_ver(i915,	huc,		dg1))		\
 	fw_def(ALDERLAKE_N,	GT_TYPE_ANY,	no_ver(i915,	huc,		tgl))		\
 	fw_def(ALDERLAKE_P,	GT_TYPE_ANY,	no_ver(i915,	huc,		tgl))		\
@@ -555,11 +556,7 @@ static int parse_cpd_header(struct xe_uc_fw *uc_fw, const void *data, size_t siz
 	if (css_entry) {
 		int ret;
 
-		/*
-		 * This section does not contain a CSS entry on DG2. We
-		 * don't support DG2 HuC right now, so no need to handle
-		 * it, just add a reminder in case that changes.
-		 */
+		/* The DG2 HuC has no CSS entry, its caller passes none */
 		xe_assert(xe, xe->info.platform != XE_DG2);
 
 		offset = entry_offset(header, css_entry);
@@ -661,6 +658,13 @@ static int parse_headers(struct xe_uc_fw *uc_fw, const struct firmware *fw)
 	case XE_UC_FW_TYPE_GSC:
 		return parse_gsc_layout(uc_fw, fw->data, fw->size);
 	case XE_UC_FW_TYPE_HUC:
+		/*
+		 * The GSC loads the whole DG2 binary itself, so there is no
+		 * legacy CSS image to find for a DMA load.
+		 */
+		if (uc_fw_to_xe(uc_fw)->info.platform == XE_DG2)
+			return parse_cpd_header(uc_fw, fw->data, fw->size, "HUCP.man", NULL);
+
 		ret = parse_cpd_header(uc_fw, fw->data, fw->size, "HUCP.man", "huc_fw");
 		if (!ret || ret != -ENOENT)
 			return ret;
-- 
2.56.1

