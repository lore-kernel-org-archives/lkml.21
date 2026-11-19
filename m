Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095387;
	b=GE/nz8o5THuaGN5wWfc04FIXowOvWcca8fC2VXHFcNL/Jjie9eEfLr5J6/5n6RVdL4Wq
	 i1k1MKF+DahHOFY+ODP8ubndGTHU6JpqdFfQlnEQvYX0NvZrp24XYiekoHYC9hVCMzWWz
	 3IBBUXm0pmaVpbkhlwkzoseaWUr5ykeA4zjIInTvL4KS8VEo2m4FHTjB0Nd0KwUQ/5hVS
	 BgK9hYtrbxl6+4O91hukej6LXpPrGcssFbJ7CkQZQBomdRqXv2CHzuZYzE0+1GEfaaWXi
	 ICuFvZu0LTaIso1CSWGRwXbTUTX/i3Rt1yPBBB7noQPOkuEy0s7BTZOL39Fj10jHgwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095387;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=1o95545vLBlL7TyXtLwPVUZGaN8C7nShjfd8XxYNHPA=;
	b=Igfw3QBGMwKis4ZiqT5fqLEUGPukIvEnN9Jmo0RiJNPqOnjSj1UGYt4+XtUVpg6F54mG
	 AHhvr9iRajfcxufSUGTFqIt7hjxz0mqeey8SAZ+j2qc0SMYH6zWmyTtiphw9RLAeAH726
	 NuO+1AtzPCYbkwSsmHjOq0PJ8QoNqiRBDdSELwhhNr0pMcEa/gxvqV3VqjX0rsZ6Wr5cB
	 xJ1zvq4EHjJZ6ANHasC0NHhRmHFUKxiIqPECs6oq8Trh/s3Lo++PrrloQR+JLGUIKQEd8
	 2mF1PNHV6s4OtXUvY7ObXsLrMD42TnxYT3msuMenYIShhdga4AOe2bNKLsclI+R4CAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=imbIvVnG;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D5B606A330
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:36:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02D5B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=imbIvVnG
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso1070669f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795095385; x=1795700185; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1o95545vLBlL7TyXtLwPVUZGaN8C7nShjfd8XxYNHPA=;
        b=imbIvVnGlnuxVAd/nTLbRi7ZrjLPdlr0QSNGutu/hLxVTJOSFIuJqF9bHSWRI/3t+m
         EbnVBNJV/paz5/ImCrHFD5wgepKh3Fc/9/JvE45PmFk9UyMPOFQ1NEPzpJDe0Bsw17Ft
         +rbnvhdn7hDHkjnt7+sdzono6/yT7ERYLrx279MN171s4qv5rUpE7R6062l+3kehnSAT
         To1rYVXkNZjWIpiSQNB/jcrwVlD286eLRnk4O8Y2hhmvtajgFMi+8WiQ4FOKH3oFLlIw
         zDwdnNIWk8HZZJP7T+wccs8GVlOwdUWcLgAt5Lxt6KIIFtxtCHBrUlIr83i9L/KDXPEh
         QsGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795095385; x=1795700185;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1o95545vLBlL7TyXtLwPVUZGaN8C7nShjfd8XxYNHPA=;
        b=RDCze+gRyiwtOWQfEZvMvoJYhpfwOmEdoVjWroZ/VR47bttzZ34uCnj/wwd/aY1rSJ
         3dOgmbZRtR9rKWK81lhTryxcdEijYS46Q+eNeIj9b4RNL0ePKEeWAkT/g24GBRUN0pp2
         wX06z4pCNt5LY1O8vygjP+GgDz99fYZgYjC2llUS1+iXVv0TALHp5RzgBHvp/BSIeh9P
         QNz0t5rPv2d6I/tf+0m7I8dLLQRfzeFrHB4nfpePD5Mr6gABgGpnX6NPVXlCo0b22haH
         cgZdEvo91hJTJ8t9GyNrLj2vcvsf4FUpEJD8OMuiU8X9KbcKsEfi58jlcFVAawew+3Vz
         rdoA==
X-Forwarded-Encrypted: i=1; AL+hErFnw7ZIGvIGjMFh6SZjfl3JPU5TMJjNGYTqRZg8AAms7IyCDjQoHNy46d4mVlHjDNU5TiX5J1yzseQmzes=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XqKIVcZzpl/eWd3GzOhKL78hiPFVbS0aka+gek/lP8iE0dqPg
	7fur2OEJ5cNSOtQm8ZsgHr8fN+mqHaBWunhBvVHvio712ggo0XStKXR6
X-Gm-Gg: AZFdTZdDZuFCKSmlH0idEHkdQUzlrIHSAlVErihIqWSWFCNc4fbGyQklwRfQPUhMJpC
	njuaTLtUHTUvB2u0QJKyRXBets2FtQ2rYd7oeOrPPD2mdkFfQz5dXS8e4BsuOYxeh3VOS/hhzkb
	VEKz/PH3yqeDZl/1JdrdDido5oTrIVClUbO3I9RbVEB46GlAG5pqrELkgcnztPPxB4UB0ycstqd
	B3WQIimjLOkbyVUxM7AoVIXsWjn+1eoNkh+m9Yk6iu4vMWn/sciJ8c1Vd/DKwQ4iMDbqG7FHWjY
	L9mdb1paiAAOAz6QvH4eCyMfD2caSoSidzXz+M3neMl/bJm9DbtAcj6uftMbEnO6nJcxb1FI5Tu
	AYPg/kNCxxJ8ITLIfAH3yXe9ropLvSYdcibjjkzaBLa2pzT5WNtCCqTz1b6A6ajvY8Ig5M/0D+Y
	tvtlqbbjt8B2DekSQiO8arcssxoCV2KVeGC4k2c4SXyOhjW97cJh2BI4r04vwScv5WAclc//WKE
	HOPjJGlxFkYcT0+g2RVW2Y8bLe0cA+Y0SMbfMdhxHCTeBruEM4OyapluGuJM28hGdokYBhqce9u
	NVc8mJllgrp8/6RdK/Yorf6jjRXrppuJOv1pGbqtDQ==
X-Received: by 2002:a05:6000:610:b0:48e:3085:7cf0 with SMTP id ffacd0b85a97d-4a63ce05ddemr14483518f8f.51.1795095385263;
        Thu, 19 Nov 2026 05:36:25 -0800 (PST)
Received: from [10.111.176.198] ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a6573ba95csm11547911f8f.56.2026.11.19.05.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:36:24 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
Subject: [PATCH v3 0/2] drm/vkms: give every composer user its own switch
Date: Thu, 19 Nov 2026 14:36:02 +0100
Message-Id: <20261119-composer-v3-0-dd470a820303@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQ7CIBBFr9KwdkyhQsSV9zAugE5bjC0NVKJpu
 LtQN104u5e892clAb3FQC7VSjxGG6ybMjSHiphBTT2CbTMTVjNB84Fx4+xyBMZIwWpOuTYtyfr
 ssbPvbep2/3F46QeapfTFGGxYnP9svyIt3p/ZSIGCbHmn5Elw0Z2v/ajs85gFUmYj24dyFzKoQ
 cmGo9QKhcZ9mFL6AqkcbqHrAAAA
X-Change-ID: 20261111-composer-cc9620515bcd
To: Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <melissa.srw@gmail.com>, Oarora Etimis <oaroraetimis@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Liviu Dudau <liviu.dudau@arm.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

The composer has one switch, shared by the CRC reader and the writeback
jobs, so either of them turns it off for the other.

Split it: vkms_output keeps a count of holders, and a get() raises it while a
put() lowers it, so the vblank reference is taken by the first holder and
dropped by the last.  The CRC source takes and drops one per open()/release(),
which the core always pairs; each writeback job keeps its own record.

Patch 2 keeps the lock over the count and the queue, so the state the timer
read is still the state it queues.

---
Changes in v3:
- the CRC source no longer keeps a flag of its own: it takes and drops one
  reference per open()/release().  With a flag, a second reader skipped its
  get() while the first one was still releasing, and that release then
  dropped the reference for both.
- vkms_composer_get() returns whether it took a reference; a writeback job
  keeps that value and only drops what it took.
- Link to v2: https://patch.msgid.link/20261119-composer-v2-0-a935e9bae6be@gmail.com

---
Oarora Etimis (2):
      drm/vkms: count the composer users
      drm/vkms: queue the composer work under the output lock

 Documentation/gpu/vkms.rst            |  5 -----
 drivers/gpu/drm/vkms/vkms_composer.c  | 33 +++++++++++++++++++++++++--------
 drivers/gpu/drm/vkms/vkms_crtc.c      |  5 ++---
 drivers/gpu/drm/vkms/vkms_drv.h       | 29 +++++++++++++++++++++++++----
 drivers/gpu/drm/vkms/vkms_writeback.c |  7 ++++---
 5 files changed, 56 insertions(+), 23 deletions(-)
---
base-commit: 97429bac371273886238bfcf63d78e7405cacb46
change-id: 20261111-composer-cc9620515bcd

Best regards,
--  
Oarora Etimis <oaroraetimis@gmail.com>

