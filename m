Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795712360;
	b=YXQ657IBkqsCt43Y0MpqHfJ8UBIRwXqPmyAIBcbcWhALao++u67Cag4pHl+5ZecveoTP
	 K2rzBGCCXcDaRi1WDIOmiWX6tN+2rbtzX37vZ5JuOEbogQIDQvEYPLBETyAGFtnzeY6ii
	 24NY5UNAfk6Bknr8S1ykoCV8GvEEEcxihiTadoiFHkQMHG8Bgcw/ovEXAL4XALrFsgHpo
	 V/d8XJWZAc80wjtmWbQ2JsbdzzqJRcRBuWc+swjUZUGLlvbW/NeyOGDrAGZ9jfdIfZDra
	 BpgG2VBZNYkklWI+sQRlpEMY9REjD+RW0YpT/dsFyK8DPUM9Ak6GCgZqbTY+RIoRCaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795712360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=bvHu9PdIza3tZOErw9g2L0SR3Amj/3cA4iNu6SeWynk=;
	b=VLBh8C6zeY8TqsmSYtPQKNzvPAEN0iBouzYD+Ca9vOv1ZctIyak1rgpYjQWOIiYdFvjN
	 7v2yGVMon/+uNt3C6PbKrE3lx5Gcl/wtpbWkuCHp1lm5KOt8BxA8k6sVWz5t7W4+6Dj6Y
	 2Qywu381N6/1uKzP/RucEOi0XtM5PPlDNYW3G3QMUp89TRwwWObR8D3kQ1koCnOwVXery
	 rlGqDArTLPS2RGgJSvMuQg4IA75/qFq044G36Tyk49IUsbvXtU1iWBdbgyZbKNdlR7rvt
	 ai47jdIZnuj2QZpgFcCWJI+7eLtTkNWdK24oWh50VMxy0Qd40qYwdw/Jlx3qzUXMH4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jFYCtSFV;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD70606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:59:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DD70606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jFYCtSFV
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so59872525e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795712359; x=1796317159; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bvHu9PdIza3tZOErw9g2L0SR3Amj/3cA4iNu6SeWynk=;
        b=jFYCtSFVmK+9jRCpSFdZWywd5ayGp8l8yTypVQKuDZdabfR8ISMG/We5D+fmmAjZSI
         F7aFFmBsLwdm7Onk4pguQpBFbxpRlZuoa+4tbtLMT8hXEWgKJ0h14ZsYkCS0Lmi9m9U4
         4CHfBiXv4EkB0jinFJUX4XsuS7PiFqtO2p9e69+SkUV4/tNBvsGR0nht29QoP1eRDA2g
         YrergSm0O+S0L+PlWzwnJDj3N6IYHj6fJlWwqyVufTOZOkyKFduFjos9loeBIM//t294
         sLhnPSq/a293E2IifXE5xaAD9L58JV9c5e2r/yPLLAULRDhq2kWYEd66UPnOQQMLa0mt
         9KPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795712359; x=1796317159;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bvHu9PdIza3tZOErw9g2L0SR3Amj/3cA4iNu6SeWynk=;
        b=TGa4jidjwe6IDpAH1WeMJqSkV2zDtlZ/KslPmi2bn60/mYVjlx9mg0U7483NPmAEQl
         kVSJ4UuoXyQWngZdRtTLvcSxs1bt8OGYcVQAyDej71vMMVb9O4ydxGzRhLopIxEz2RsX
         5XvK+paNj1azUWvrGuZ7VuPJ3fo7qVZZN9aSVA6DYZvQMn00jLQbfo7vgT/A3e0UEPLF
         XOZt8iA5MPF3DzPhl29v0ijrCYkOJJNLi87dqsZ0NuWPoqNH7GUJWLPEQ8HopeTaiVK8
         yN2hr81QYVKWUCdpux/0GYUWCb7QafhmOSUF5bBEXuF4gtu4irf1FN3D6ZvhVurMnt4S
         PeYQ==
X-Forwarded-Encrypted: i=1; AL+hErENfAiHzHS2BsQNEyN6ytyQ6ARfNG/guy22an2damLOhNjdUW4to01uAF0CfyMjnjCKrF0Jh6j62I8Pr/s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+U15WYSos/KeKOADyLTdHT9y9xkFPCk/5AGj91uZ4DwOKPWD6F
	OxsYZx+1Iad18Ii43OE0S3hHi/bE/jIFHF8qeYTeQToEnho85WH3xTun
X-Gm-Gg: AZFdTZepCpeIpbWxxD4ZZDIHZq/AqLLGK6QyFPJtpqoLMw7oe4APAYRA9uFNBC5WDI6
	yJXRScxIzoxsK8UybD+FRn8kyLDZW8f4C1LczLSR8oU6K9egPxrRYASK3lBrriolpVQGzYnzNQC
	nbaYRVRAaMLJ7AK20kW+keqUuR3FJacU/rWqVIEZxYJIgyeq4ZFGaooSp7p4HoFTVawSLP1n/tA
	Jvya04pYqgcqKFYrGd2aPcUUaVxoIUkzmStf7Nu8qRgIusytxbAQQvVS5qiPrRm+veHFK7VotnQ
	KK5ar14PqF4bu7c8kcQ/SQQzL04suxQETcHppZklqZqqGhnk6pHF4EUr0xPcsDj/PAtdAvlHm0j
	0XvfJruAtkCADOupquYjatfVhQmGLqlX7IxCPkdPhcVLfTxcxiRPWFa39772oHlTkkCPHMeI+8N
	sgWJGRlknmBsgD/7/kez7J6FtqQHo2EYVPvtKcUCAq10FCtciax9cWi+Cti5pA6kKB5oIJUvCF/
	Ym1zbFwCnb4GffHFqoQDTgMS4fdCbi0EU+nupPwC1ePbcs0GSPiROTmJ15GmcEJq7grBYnTY88Q
	JXT9gtnLuc5n6hEXLQXdkXQpWqPpoYHng8uqLmo=
X-Received: by 2002:a05:600c:b8a:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4bb88818156mr434532475e9.16.1795712358587;
        Thu, 26 Nov 2026 08:59:18 -0800 (PST)
Received: from [10.56.169.198] ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b70c05b9desm17700731f8f.54.2026.11.26.08.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:59:18 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
Subject: [PATCH v2 0/2] drm/vkms: skip composer work that changes nothing
Date: Thu, 26 Nov 2026 17:59:02 +0100
Message-Id: <20261126-composer-fastpath-v2-0-292ed6d4c4d6@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NwQ6CMBAFf4Xs2Zq2Adp48j8Mh6UsUCO0aSvRE
 P7dgvHmcZJ581aIFCxFuBQrBFpstG7OIE8FmBHngZjtMoPkshZCcmbc5F0esR5j8phGpqnmRvW
 KKk2Qdz5Qb19H89Z8OT7bO5m0h3ZjtDG58D5OF7F7v379p78IxhmiKivd6RJVex0mtI9zNqHZt
 u0DgeFoJsQAAAA=
X-Change-ID: 20261120-composer-fastpath-8e60c7f7e58e
To: Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <melissa.srw@gmail.com>, Oarora Etimis <oaroraetimis@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

Patch 1 reads a full-screen plane straight into the output line instead of
blending it there. Patch 2 writes the frame straight into the writeback
buffer instead of going through the 16-bit line buffer.

---
Changes in v2:
- do not queue a CRC for a frame that was copied without computing one
- restrict the direct copy to XRGB8888, the only 4-byte format vkms reads
  and writes back
- describe the new parameters in the kernel-doc
- Link to v1: https://patch.msgid.link/20261126-composer-fastpath-v1-0-aa7458d84a7b@gmail.com

---
Oarora Etimis (2):
      drm/vkms: skip a blend that cannot change the frame
      drm/vkms: copy a full-screen frame straight to writeback

 drivers/gpu/drm/vkms/vkms_composer.c | 124 ++++++++++++++++++++++++++++++++---
 drivers/gpu/drm/vkms/vkms_drv.h      |   5 ++
 drivers/gpu/drm/vkms/vkms_formats.c  |  26 ++++++++
 3 files changed, 145 insertions(+), 10 deletions(-)
---
base-commit: 5ce32a0c94a827ff44ee60898c28060714dcff75
change-id: 20261120-composer-fastpath-8e60c7f7e58e

Best regards,
--  
Oarora Etimis <oaroraetimis@gmail.com>

