Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795339558;
	b=YnhqPpU+QSsXYePt2ZRG4sL8fB3ZKDmPV6rqdLN9ioXteQW6nYPn/uM4afXT7XCR8YGA
	 MI4hRzK6W++vUX6A3ZS0P/KbSqF/rD/+w2OuK8XCJu8i5ti+cIKICn3NQ4pUKqT5ko83s
	 szfcYzqmnXZziSKSU3AgtuPHTM6xV4Ss/tBlkJq8Vqw7duaW8Ctyo4tc+qX94pFK5wepz
	 H1iWGQp/rCFbsamznkk2g9vIbVSOoopodye5tGmkaoIogKFsTNc4hyzTLnjovDRRftKl9
	 bfxbnyqWqMi0phZebnoDrG0G99wG9hFS0z/c8d/0grsoe7T32NaKtoQWC/nKc5JfKsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795339558;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=BTf5fmfGtJLtKBIVqGLksqJZqD13fP13MFLwQsUjm60=;
	b=FcM4rzfmfYx3TYZEFHY6+btxKzKJodsl68ndflEgdwqTbj26rOaS62Y63IlAyKjtCxFR
	 2GqYirudFYinKLAO+rI4smRw6ZO6p2PdYIQiGXui+KYTmiyejirIX6DWNd3Pj2cDfvMx2
	 HW958zKblBTQpy46TJUTWBtBGerL6A2PThYqUiI6tUdumown5XVIKNCz8iCjU11ZyPdgp
	 xxdec/nXWVPU6p+taZwZIJT2EH7KSuVhhEuH+UO28LP+xyzK8Ak0dnRff9BIku13yTOlO
	 Jm43BSt06IkSEoszOUXMeyjRQszyXv59x5S3CmU0+aZTpBFsrabb1YR1pr10lehIxSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J3022H6i;
	arc=none smtp.remote-ip=209.85.160.46
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FEE606A331
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 09:25:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53FEE606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J3022H6i
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-4ad587ba293so1480635fac.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 01:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795339556; x=1795944356; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BTf5fmfGtJLtKBIVqGLksqJZqD13fP13MFLwQsUjm60=;
        b=J3022H6ixoVu+KaarkZvYO6TmfdJ4oVK4lE0rjbY6gkzmV8DWN8aqVt8aeCIlv5Pwe
         TipkLk4yvIRc3LFO0QD9yxxLhFz5yegJ0O8ihwyOxU5VFCBmbBixNkaN8oJIGIewKzPz
         iVIk1Vc4GfM9gTiDiFKvJlOzlpRIFIvLvz0tvWf2YnCzqWLqhuS0dZQ7AvqNGJo8d5ld
         yr9WGOF27+eeqKQ+xHcbCXbSMNb77mNAHuSGm6vCnsI7051/rMK4dkEBwBRwyiUAw8ag
         yNqHLoHl9l7NUusdf/9WnaBJAKXiaWvRgO5KputJDUUCFfLq0oLa3fkBLMbwsN/QDBLO
         qUCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795339556; x=1795944356;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BTf5fmfGtJLtKBIVqGLksqJZqD13fP13MFLwQsUjm60=;
        b=ElPZAxmh2ALohnKZurbtjgbQoZ5zGZvmv55WD7Andz+6b20cNgQdhZTqmyIWHlWXse
         HaWv90XZ+XPHuYVGbPfTYuC0Xb0L6YNMsvza1AWes5DqftDeysN1IaMp4QSLFojnWCz7
         PSyal/zwTZJ+bi/2fzKJZ7uqyRn21F1Jsjim71Dp5fGtgvsoECN3zg7lk0tH3/IR+n2p
         h/e7z/Uw2OXM9b4c0mz9Q8t91UI5n7iknNpzZ+3MA7tnapandJ8LkE7NSyPA8NbqOb0H
         Di61lpss9wsGMObDa7eA2DvFcf8clH9gV7qg1bU4MueOBsdZwhq8b6bR907My355W7jo
         EeiA==
X-Forwarded-Encrypted: i=1; AL+hErEeJ3ROa7qFcgs+ccfMsl3G71iYbYrCGgFHvVLfsMX+KtbeYyBe2fC5h04Ay2Rz6lb5bedEOsW8ysWIJ+U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZvhStMWgX31SDpXb320cewlYvcQlvGjAWA0olenirUqdDi3fa
	mlVHQDxCPAADUKma3fKNIUh6i3SWMyY1TFi4to8iDudK9jIs0G9t/Wr9
X-Gm-Gg: AZFdTZfiYjOgNALw3nWe1Z3XrQRnjza2Cq/iEMZ9BwE3zKwCes8sduH/hJikm3lIzrQ
	1S+IQpGIevm27GIuxLmfgnB1vfOgU+O4v77EwLHS/k/XKu6EjhYveBkB/jU8RHF+dQr+LquvK5S
	cMvGjxj5pPGwm1OByj5D3MYPTUY8w8GlsRo/yqKDP5fg/viIorZIjgAXHJ0/naXDsAGu87oIfW7
	qwLxI4lw9567wPWWIwpG19VuXqT43nepBrWoerFhtJ49uFvXjfKFpdEIZt47TMKA5fGjRyCx74J
	fu5Miyp7NusIw8MKGwgaH8MxQZCk6jl4SW/zZwR9un5Riw/wR6fuhgOlnEdNcVNosdXaRlii+lv
	zL3quFzcEY8v60RTqPRoLpfyWGMEo0wDA+lOR5Dx8N29PlDzUrS//+LvelMrhuzQsrVryTNvv/W
	LCQx/RZRv8p8kEMcH1XKmQH12T7zkmfzPMDzw2OODykRRF/3OEr35ef0CqVTgwM/g/UuR7ld1tC
	GpJceb3all1DPTX6iDGEIdG9gp/ESZWLDloJ3+5SoV0JhVE6H/YnrZaVwHyft2m1F7Wk3PMZ+ZO
	0uMpVlMp1K49Zq70MzPIknizdQQh30e/ibvUNt6wEtQPSPOnlRHl1AyLYzQIukFPP7nuldSF4Li
	B8kxybl6wM/1mldjPxOZ4EcVdY/iIsxisUC2sOiPxoh0YVLrI//m5Uzcxewr15JMXCkEQrvcoke
	jfx5YKccbdV7Hm61nsrh1ESksiYAc5u81ANqRG2Rw8vJ4LdAu79DZD
X-Received: by 2002:a05:6871:c8c5:b0:4ad:73bd:91b3 with SMTP id 586e51a60fabf-4bc829912cfmr8276733fac.9.1795339556073;
        Sun, 22 Nov 2026 01:25:56 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5ebdc0acsm8698476fac.3.2026.11.22.01.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 01:25:55 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v2 0/2] mtd: rawnand: serialize OTP and BBT recovery
 operations
Date: Sun, 22 Nov 2026 02:25:19 -0700
Message-Id: <20261122-submit-rawnand-operation-locking-v1-v2-0-030bc867f0c7@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WQ0U7DMAxFf6XKM0ZJl6ZphRD/gfbgpG4XWJOSd
 GVo2r+TtkhIvCH55cr2vce+sUTRUWJtcWORFpdc8FmUDwWzJ/QDgeuyZiUvlRBcQ7qY0c0Q8dO
 j7yBMFHHOS3AO9t35ARYBArnRPdVadZJlpylS765byutx19nmjey8Wq8TJ5fmEL82jEWsc/9Lz
 MWhUhUXvLdVr83LMKI7P9owsuN9j4z0ccn3zTsHM5gIcj97twVZQVpK00itDrxEqTUayw+EjdC
 dUbzmTa0UrawjpYTbY9ri6S/liDYG764Q5gkoxhDTD58A3SuJJXYVCv7L95wB798sdu0FiAEAA
 A==
X-Change-ID: 20261108-submit-rawnand-operation-locking-v1-1a0b8fe786d4
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Arseniy Krasnov <AVKrasnov@sberdevices.ru>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Kyle Roeschley <kyle.roeschley@ni.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.17-dev

Use the existing chip/controller serialization for the Macronix OTP
transaction and for marker writes after a BBT erase or write failure.
Both paths issue NAND commands outside the ordinary MTD read/write
wrappers, so they must acquire the same locks and wait for suspended
chips themselves.

The first patch makes the existing helpers available within the raw
NAND core and uses them for Macronix OTP. The second uses them for BBT
recovery.

Assisted-by: Codex:gpt-6.2-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
Changes in v2:
- Rebase on nand/next after the BBT logging change.
- Apply the Macronix locking change on top of the posted OTP error
  propagation fix; both touch the OTP cleanup path.
- Link to v1: https://patch.msgid.link/20261108-submit-rawnand-operation-locking-v1-v1-0-565010fc5f8b@gmail.com

---
James Hilliard (2):
      mtd: rawnand: macronix: serialize OTP access with NAND operations
      mtd: rawnand: serialize bad-block marker writes during BBT recovery

 drivers/mtd/nand/raw/internals.h     | 2 ++
 drivers/mtd/nand/raw/nand_base.c     | 4 ++--
 drivers/mtd/nand/raw/nand_bbt.c      | 2 ++
 drivers/mtd/nand/raw/nand_macronix.c | 2 ++
 4 files changed, 8 insertions(+), 2 deletions(-)
---
base-commit: ec1e844b9486302a488abc03ea918db60709766e
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
change-id: 20261108-submit-rawnand-operation-locking-v1-1a0b8fe786d4
prerequisite-message-id: <20261108-submit-macronix-otp-errors-v1-v1-1-8f64a2ad5a10@gmail.com>
prerequisite-patch-id: a542c9cd698d2d4c090932b8d74dc6f520a71166

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

