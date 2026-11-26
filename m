Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795735041;
	b=qct4m4FzYIkREfXGjUiyRNV4qRhd2RiiqL3fB9ANi2vCOJ0gFWl26BEm2S6Lhi5ZFtMx
	 uR48ExWpqDGVDmKfwAe4b9asruUvahA4gVrKmhMuOZA1OD8RXWFiqEmmTy8BHYt8XS1sB
	 iDxhHlqEzAMxVpsgOHrkJqzi91TI/M6mdMsTA4xxLo6AtiTc1305sG8D92zOrPFVjnykj
	 XbR6eFrY7it5larfCvvcYtcYibrEAU6s+UlN8QgHnvYBp+7gc6CGPKVzWuLk8dvzPU46O
	 7AWvK7Id6NqT02Rn76e1jG239Hme0wHtGWEHm96FrBLFGX5KWnMCmrwWu33i34Yo0Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795735041;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sELqHiChtNn7m4IH7Gf25iIdBWe6nyu+Z7VJekXziME=;
	b=VdTNFpvBbeh9itaPUVGHZHNdLnvpPObr2GTesYxGxg6toI5oBGIYIEp2app8K9dEOlUK
	 WFHDHrR70SBpa/H9e47q5XhB2TSPYdKgBVWxkO2LRAffOPN4JoLqXs3I9xocydFINH91y
	 ym0rZWrUp/7XfwC9LFdX7HwjdQdYSXJ/3+khnxwue6L7l/TQjztKhcCoZs6UWrsF1Mvzz
	 mkafUIIRhyIxBqounqWzBcp3Byd4dkbXPIl3TvqJQ9IZmvWj0C8Tz6Yq+aYR3aWcdA+4Y
	 ARL3NmxTHUCVvOMDVh022wVr6eA+RU4IatLDN86Rc6iP+Oar6wfv3w/wg2XYgKDcrYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t5L1qbzT;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EB2606A324
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 23:17:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86EB2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t5L1qbzT
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2f04f61282dso34254395ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795735041; x=1796339841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sELqHiChtNn7m4IH7Gf25iIdBWe6nyu+Z7VJekXziME=;
        b=t5L1qbzThYKYAbPScTID4WymE+B+9qpTRQsCvknxV6SPRCByDLEkb6OZYBeYFWoEHy
         gRxmXFaCuoVV9mcZZ9EWVCOWduDT9MlQFysmBwhlDWNvQzQ9d+5LZo64wyeVJS1kGwNa
         kXh0VRWSwmjn6sXS2bDL2SB8/sCaWW4gWDgrHBS1XJyv2ZFki4+QUzN3suvV3ekfECjr
         6BMe/4cxIXmo7Ei+oC4kfgOzuhknCawWOMVhumWDQqNCiSJPML8MLF3IxehWXk8pNP9z
         B4UAYnPk+jIMofA28O2lZKATo4AVmBzblMd+RRkKuDQHFKIt/HHZ76eiac6m7ZVoaN3d
         n3Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795735041; x=1796339841;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sELqHiChtNn7m4IH7Gf25iIdBWe6nyu+Z7VJekXziME=;
        b=qpwTiT5IbsYvqssKh8WbOGWoJz5L5Pq3OlFBwhMIAsfG9fuD4aa4zcKaqgg2G5mupu
         /TaPTx58eFJDjKIKxj0K7v54dAN4fcMSIqEApK9ZeJaacy85lQmI+CTVANgDNUU0CwzE
         bBoSdkItbJgOx4Dvgj5zXlmsPg9XsVlq+WMzPVNyd316024WmSR4J5PLiHNQqI2Snr2l
         M/7aGH1VOgVWU6DYhqXljOssYIFNCVB7v6Zvur2AWSuKQLJfhe5b2aS3txVxxs2J90YK
         mbCJacnOckwYZQkjt9AIXhoZmshD5Y+QeYcqD16jvswxGguIaw0TJmf3dYt2+cHnLkHS
         aEFA==
X-Forwarded-Encrypted: i=1; AL+hErHmkynALEL4YDBGY8UxV/KUoAD/oieIhr4p4zs7K3SNUAlgs5p02DDzB0haVMPgIBbztYxTs7tfU4JONRM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/e8eatcRrxLxsQmXmk+NLhH01EYmfjUx93vzhoRMq+V5lCWNzx
	rc6HcPMsJzHmsvTGuQJ5rXGLFYyoDt+a32bHsnYzWZ0QTGS7e5X0/K3w
X-Gm-Gg: AZFdTZcNHju8x8jioroPUTSScwXnqElSDlBXlRNOghDXkgRvUJmwN2tzAnIhyX9JM2m
	9i0l2Cla660byAePEI57Rj2x0C7c4Tmarrd/kn2X0fG0CC5/RZOR1vFaKoPiTzCM00nhwTPtIFZ
	2ZTejTsOGMxb2gZLyKmEGgH7PucANSQpBBPGVbSwzad5DJFLbCtwPRMvVeAL8F8Mp1Cwtu87nhD
	BMzMhgBSMk1UHQO5FTGcRgZIeps6pszf+yC/vETdDTr6mkQ/WC9lLa14oCGuUlgjnE7sNL6nH6W
	c3aZFHf5zUS5PUigPxJXUR80uXrOco53X00dad1cmySHJU9ScVID00Ly/DAN0wYBRXC3lfJ+aEd
	2xxxN4HPzAVKyzLbxTOlfhmpqcoQWfEvWuYXnmX57j2x94ULyCT2XfuR8w6hKkFNMKkJCsWXYXY
	Pu476yzKuWkUNr4DmEsMNNK8e96w+HGWMwuMHKdEkoA6uptdVnJfYFDmmOpXY8mC4Wvgt5iJTvi
	45Uk6gfLh31y8n7mOWJ6jtZmG28nD/XPUc6hLr/C+FJxanqnwQjFoZJGqqWDqA0w9CxvZsM3iby
	Dbqiep7jArjX08Wl6g2yaljiiwhW+D7Ue5a60CMjqUIuV84Vcg==
X-Received: by 2002:a17:902:ce82:b0:2ed:69b:9e76 with SMTP id d9443c01a7336-2f03f1a1aaemr232395345ad.28.1795735040782;
        Thu, 26 Nov 2026 15:17:20 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1276c5sm114418555ad.67.2026.11.26.15.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 15:17:20 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH] drm/i915/selftests: add missing newlines to SLPC errors
Date: Thu, 26 Nov 2026 17:17:18 -0600
Message-ID: <20261126231718.65690-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Terminate SLPC selftest error messages with newline characters
to ensure they are properly formatted in the kernel log.

No functional changes.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 drivers/gpu/drm/i915/gt/selftest_slpc.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_slpc.c b/drivers/gpu/drm/i915/gt/selftest_slpc.c
index c3c918248989..083e472b2338 100644
--- a/drivers/gpu/drm/i915/gt/selftest_slpc.c
+++ b/drivers/gpu/drm/i915/gt/selftest_slpc.c
@@ -57,13 +57,13 @@ static int slpc_set_freq(struct intel_gt *gt, u32 freq)
 
 	err = slpc_set_max_freq(slpc, freq);
 	if (err) {
-		pr_err("Unable to update max freq");
+		pr_err("Unable to update max freq\n");
 		return err;
 	}
 
 	err = slpc_set_min_freq(slpc, freq);
 	if (err) {
-		pr_err("Unable to update min freq");
+		pr_err("Unable to update min freq\n");
 		return err;
 	}
 
@@ -76,19 +76,19 @@ static int slpc_restore_freq(struct intel_guc_slpc *slpc, u32 min, u32 max)
 
 	err = slpc_set_max_freq(slpc, max);
 	if (err) {
-		pr_err("Unable to restore max freq");
+		pr_err("Unable to restore max freq\n");
 		return err;
 	}
 
 	err = slpc_set_min_freq(slpc, min);
 	if (err) {
-		pr_err("Unable to restore min freq");
+		pr_err("Unable to restore min freq\n");
 		return err;
 	}
 
 	err = intel_guc_slpc_set_ignore_eff_freq(slpc, false);
 	if (err) {
-		pr_err("Unable to restore efficient freq");
+		pr_err("Unable to restore efficient freq\n");
 		return err;
 	}
 
@@ -313,7 +313,7 @@ static int run_test(struct intel_gt *gt, int test_type)
 	 */
 	err = slpc_set_min_freq(slpc, slpc->min_freq);
 	if (err) {
-		pr_err("Unable to update min freq!");
+		pr_err("Unable to update min freq!\n");
 		return err;
 	}
 
@@ -322,7 +322,7 @@ static int run_test(struct intel_gt *gt, int test_type)
 	 */
 	err = intel_guc_slpc_set_ignore_eff_freq(slpc, true);
 	if (err) {
-		pr_err("Unable to turn off efficient freq!");
+		pr_err("Unable to turn off efficient freq!\n");
 		return err;
 	}
 
-- 
2.56.1

