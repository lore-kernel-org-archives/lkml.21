Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795171084;
	b=kJXneyhCNACv0wNcG9yAo0kTywDNTr6CAh2WkHYjCYLF3Iy0wSst1hO9YzvrvRVBbR5T
	 jbFv0wZ10ClmZRRhIu1l0Va/7bmZZefcoyxJ4yo7GC/gnKyrHRFJ6mJZQReePuzW54MoA
	 9W8MZ+NlyhyCPJqH31/jY7t8aL80U8ksopPxolTjsnGuBLaOIaImFJhvcvuJOyd9rkYMf
	 DpR4W5FB30X2F/9NHPuWyInfueDFRcnDSblAu1JgBPsvw3rlFIq1w1Jl0/pscsT5leIcw
	 fWtIXF4UPy0zqqUVhTA83mvB0hk7v0sh5PUp8HSMu8t8tfmMckV3bT9enSrqFxIw/Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171084;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tukFCQ+V59hFAVr2BrPF0eFqsF6upzRbKksfR9edfnU=;
	b=D2xDMbCKKD5ZvUoY6jpQz8rzt1G93jMpMgAkPASJiyLnSMdphYGy34s7Mv3pl4z8VHew
	 1YuYwHxSBHbTfN4vLbVfLSxAJeTYWFJg/GB8QJZ6fwGhS8tYA9vzOwWD5MPocH3WUx5Bn
	 IeJxUaUTdVXS7ZA26pGv/tXW4qqVfhvryPI1zehr8DbsTB9N8Ptj5wJ5snAtIggkYoUL6
	 cloDKP4ZAgiV/AY2m6bwOvzB9LM2F70MmXxtW5hVg16/H4IJRjwLuZILrFpeoZA3kEylW
	 DUmnbuYxT3580Yu2GGOpmJnQ6gU7ZiywYxzIFsz5ymGHetETZqvKnevuAqMfXkPIGLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T+Igg2Ib;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E6A606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:38:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2E6A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T+Igg2Ib
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-377157fde7bso239738eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795171082; x=1795775882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tukFCQ+V59hFAVr2BrPF0eFqsF6upzRbKksfR9edfnU=;
        b=T+Igg2IbHSXbk3lUJ3V7ipg4dr2b5O7bN74Mb7eoJ2RwD+IFN4q++noFuV/aBDbbk+
         wrR91TFXQuk9t/ZR5OcttYIIZP2iNUlFqwzRJS8cyEmGQd+Toz5FJgNllcei/BI3T1r6
         JuVE4A2kVAFcdSeDPoimS1OVOCqe6MSlkDXB/Aelb0zStu4lK+ZckOSLM/3eXe6nNZRs
         zTBTX9qfRMZ2VYPwgasXqBdT+f5ydRoQQ1l3vAxUAzg9e2pwi+rZW+tqIBujrgi1a/v+
         Dpimv1Ic0DFUbO0ij24mK5miKyTtw3pGWj85fUtbOxTWRIFiWFxPu3L+gAYHV2zZ78Y3
         gtmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171082; x=1795775882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tukFCQ+V59hFAVr2BrPF0eFqsF6upzRbKksfR9edfnU=;
        b=d0geQt2gN+4FZ894BbJ1vg6sggxk2uCkpiHAI3jvZI2/MdHPl3YbjoqwQVayydILxC
         GAx3DwKpnAZ/mQ1sctaXdXtwu2W4J4IV8Kw3PI17nlsF9YCXCCD3CGBluZbWfGdL7uqZ
         9LCQ9ufpimBo2hlFdd7X8aVxHKdBzyxzblwYPzLWCdI1D9ecFENiG0AiKfoxNJaItBff
         k6lOa+7obSXsln8WcLqqL+DKscXecfmmcuS57NGLhOJOM2tL7hiflKxOX3GKdat41pFK
         C+FCLewMyndbzFBGjdTWT3ipsAwvPjFV79NavhZOEIdYem1WxAeMJwXq4p2rkkKvnJvH
         ouLg==
X-Forwarded-Encrypted: i=1; AL+hErG2tl5EU4MPbjDBpahi+VrhKtWa4C8TtGcav3qe7PtzCB+4d7SNnygYlF2l2Gn0fX4mzoqUjaF5ctDVYpM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/t+CkMIGqhyR/Uzl98dGJos5fT2hJYQznQ0nO75MfcBv0tIg+h
	lsVP65v2cfMokvddYSltXfJGl0PTk4QoJTwW7YzZEHEoMG7mGEyTLA8F
X-Gm-Gg: AYBFou3/l72xJcTJbQYI1qgbtdc+2A5jQi79/AxL1IYLt70y7uI3YX0QSiOPRHFrO+U
	+0U3V6+ph4n0wN5gKF8gQFj2C07gImGlgIT4nMfl5Ezvc7nZ9x1fXioGifsh6oXvJ/eAV8C8JHY
	K0z2jpEMecstdzSgODsL3XZFMWoPIbpVPJ6bO2inJgP3GURo8DKcWpqdeNjprvEXX/svYBGSNc1
	1XlkplJ0Rf3D70seopIOSnudBSmcRyjsXbddo2Rw+fJF2UXcHg7k1QMsu9zy08xf76ByhKtQOOr
	zjKfCoVjgkwSeIOoAlKvHVt8c65lhQ9U5z5DhPEqTA4A6ozXUHheLa+Oeh4gEBgZtDT8rEF+gn/
	hE2224CXJyQXDqH3JGLdedjzjmUAlxvbYqtYjkkNm7iHRfaXYEusYr6acuIZTiBYBVcV7rExO5v
	iAidw6Zty/soc5ucAALORgEdpY6maG+/Cpn04exQNa4U3yBFY1DG4x6ORCxll0AcKjgjx4VDrXN
	/2Husy1yV3gsLCfY+HZg7GpyYcIXMWoOSWx4ggTzTIKs5IsZK7gKz0Cuq4jyJ2DdhLKhhPnCKI3
	F8hwRf12si90jxqL7EmOmyT0Ymz/iGDNTKUtp3zaw6YU1nlZ/nXmlRvA04czXLUPonO86TLNkJ5
	Oz+KyJ9FgQVAGCKTiR7CFYAbNZCP30T8fQIho6Q==
X-Received: by 2002:a05:701a:cccb:20b0:1b2:3448:840f with SMTP id a92af1059eb24-1b55686ffd7mr2284653c88.7.1795171082505;
        Fri, 20 Nov 2026 02:38:02 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556831d45sm8924731c88.11.2026.11.20.02.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:38:02 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: okaya@kernel.org,
	vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	andy.shevchenko@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2] dmaengine: qcom: hidma: avoid world-writable channel sysfs files
Date: Fri, 20 Nov 2026 10:37:53 +0000
Message-ID: <20261120103753.56194-1-dennylin0707@gmail.com>
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

hidma_mgmt_init_sys() creates the per-channel priority and weight
attributes with S_IRUGO | S_IWUGO, so any local user can write them.
A write stores the new value and calls hidma_mgmt_setup(), which
programs it into the channel's QoS register.

Attributes declared with __ATTR() are checked at build time by
VERIFY_OCTAL_PERMISSIONS(), which rejects world-writable modes. These
two are created at runtime with a mode passed to
create_sysfs_entry_channel(), so the check does not reach them.

Make them writable by the owner only, the 0644 that __ATTR_RW() uses.

Fixes: 7f8f209fd6e0 ("dmaengine: add Qualcomm Technologies HIDMA management driver")
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Cc: stable@vger.kernel.org
---
v2: Collect Reviewed-by tag; no code change.
v1: https://lore.kernel.org/all/20261107221500.96825-1-dennylin0707@gmail.com/

 drivers/dma/qcom/hidma_mgmt_sys.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/qcom/hidma_mgmt_sys.c b/drivers/dma/qcom/hidma_mgmt_sys.c
index 9672ef9ee8fc..53b991752e80 100644
--- a/drivers/dma/qcom/hidma_mgmt_sys.c
+++ b/drivers/dma/qcom/hidma_mgmt_sys.c
@@ -265,13 +265,13 @@ int hidma_mgmt_init_sys(struct hidma_mgmt_dev *mdev)
 	/* populate parameters that are per channel */
 	for (i = 0; i < mdev->dma_channels; i++) {
 		rc = create_sysfs_entry_channel(mdev, "priority",
-						(S_IRUGO | S_IWUGO), i,
+						0644, i,
 						mdev->chroots[i]);
 		if (rc)
 			return rc;
 
 		rc = create_sysfs_entry_channel(mdev, "weight",
-						(S_IRUGO | S_IWUGO), i,
+						0644, i,
 						mdev->chroots[i]);
 		if (rc)
 			return rc;
-- 
2.43.0
