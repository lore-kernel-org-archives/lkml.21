Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795723507;
	b=dhNKwKF7lLiWhY1lDcV1DiEGbcSCIcSbc0a3xWFQqEehti9VUHG6vWJXT96AseP8khmm
	 9Mz9pk5PBW1noqtfVuPTcof0VkP7AMmD/SY3kcTaX06bYLYmg48WlTEWnnPbqekvLWDJA
	 cOEsVSVb/ZK8tUOuVkouXB3zF9X59i4/i5aIcBcM+cLFYC3ECo0nVqoyd3JoN3nWRy6cX
	 E7dwHBuP0JfRD+T3E9xqEfmKmM2+YLwtO1i/DUmThRqObaOVhcO/FmJD8gdsDpGneSIXg
	 aMkH8QoBoQhCSQqMxt66JFTkBpaTC4y8bkCwObG5GT2UTmC/VlqVJGZLSOYQH08mT2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795723507;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=tjcnLeVYykQLpngMcaexUPjWqyhAHn6eUqbyAQMUfmo=;
	b=oFpNOi333Eodr1z87oRexEI4SsSCknv3t600aQ4AJOtYe9/zxJv4t24QxZ2zqevRlC4r
	 m7RWcU8f+j+it1VqAcLeXqjDwDo3eFqk6966VvusBBQUxk2XAGioWu5Ryq52L8vt+cByY
	 uH/ZCpfcD6H2HT3hCSGxjp2Hncyxu3NlNpahkI8d73WG91e9Vw17X0zT7JWI9SYkPaeaL
	 4mRHM5TaxlUCKiBvO8rO30O22GBr9+J2Qv0/2H61ptlGY5U1vBRBwjtkZJyBMajaU6hhQ
	 8+XW5krdQvcEBV8nw7hsa4zLDmeorNGXjy/Wb5U8tJXEOU09ZtLILCTltLCw6p5wg1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LiF7zBf7;
	arc=none smtp.remote-ip=209.85.160.53
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E5A606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 20:05:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7E5A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LiF7zBf7
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-48ed188ee81so3984318fac.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795723506; x=1796328306; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tjcnLeVYykQLpngMcaexUPjWqyhAHn6eUqbyAQMUfmo=;
        b=LiF7zBf7RXZhbX+O39hs7k94WvgClY0TLPmMG6CgrPmBUMHz5LCPro/F1HNhtOY7pO
         qY1BmpL8txQx7QiWJ8iavuu2nwVB5A7UOgqQVbWVFJ6wd+KoXy05h0+CiKa5K9OPb5xb
         SxXrAv0wBZnQi4kuVGPfXYYrxgtVxxjM78Op/9zcbBXaSYJwSom76jz1YTO0H1ttcPgR
         02eSktLCLbWOwnqV9B0XaOtGpbFvBElSbU//d4F4MCTOirxB0tDdZstJP3HU1voUreUx
         Epjt8UotG6Rwyk0rkeHW6tojj4Z2Vj2oIFhpxjpCZ2GlXz7YkiYQIh+LtfRqIyj2Dm4h
         67dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795723506; x=1796328306;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tjcnLeVYykQLpngMcaexUPjWqyhAHn6eUqbyAQMUfmo=;
        b=i8rh78rdSWNb15gLzOeq96OooofWkAaTSYbNBj2fkeBEScOY0y+kl8mvlxL1fLBe8Z
         gwV/iu83v8zBhC3rSWumsmQ3wroz0pa/WfvTGZZxo4rXcz1PfljwIdUpL1YV/s31gZkU
         OlVF6Momu5zy1bykse4gNIL+8zy7XnQcszmI4rJkJDanFvQq7p3dePxFJxDZQXvBX0Ly
         SE0dm0591L2M3vSQOQmHe28ObhVoiHlFXAODlNBSeR/oUoGd9obuaHqSRxN+CnZjJtsu
         QbwbNhvfnBe1/DiXfaAHEe9JEN6rOomnLqALuThsU/CvPX7N997PWFyOFQMlySTj43Xp
         JKWg==
X-Forwarded-Encrypted: i=1; AL+hErHIz1rAiJtfVK85a/BnSi8zxLR5pOU3Rvhfpd0gcmOoFQ/tEAWukgAUFlUGB25npi17Ddw9Uvvx04aU8Ds=@vger.kernel.org
X-Gm-Message-State: APuU4Z/l9KW4SM1L+S/phgh8kcW0CT/xCq0CsvGUNBMGzRSpOX70C7C/
	Y/yN7tTPbYeTrHsyD6CW1wwPnxU6aCJ5PeBqiw6bXV6Ggo0I6y/UgiMIIlYJblbQ
X-Gm-Gg: AZFdTZfNRnhlGeATdf8d/ZV+rpAWX8br70l8yFM9tKOa9FPj75Jta40S5Yxi1xnxKAJ
	gW8AJ9lvLn1ln6Y1Wb1nyNIuAzPfYpQEPTBosf+nY9k69HsgnHp6MEMKU5p/kdHoLr1W5N4sEBR
	M2e+UdEgeczyHPPVJ8WWh2YcL5ifLeFEnw51so/VFf5txuuRWLApbe1sFWDocu0EQqpjAZT4aw+
	tzOsOGUZ/nc/aXmTDNyLY9nYL7JVgj+nEsGXvfzGsdCMchg2/+HuU+1PSEp66tooCn1hIhkM3C2
	QrVYKv/pAW2+lqB9Vp9iIUX0vBerqROOhXU/uJPXXK3D7dAvcO/p7WNYsizN8OFSaCNauPg3dGm
	glprlm1RcjukiHctzGAj9VWuTDNHvRNUOHqH+DpC/tSV2q0v3ub84Ty8JEHgZ3sA6+UyDDC4/sK
	eoMG8olKtb2zgJCu70+cau43OpnR/eWCZYnFvlgf9Fkmmu/OTpt1Np5arO7ONQu9Ip6PlRZJuIp
	taQ/tP8ptRe77iuFY+TAus5raYGDpW4NpsvN5/ZMfJ+DKs4oahWOhukeZJEbQe6VzrdJXl+W7UX
	IimXCEvWCLOvDlqplYRAMTuHHYF8mzfTRWY4G+RNQNk0I9j2KXxOk2TIBX28hNmduBL4LtBbGy1
	c7yG6Jz96aYiFWbr/kQtJ1msRMAwfMmyBUYYKUdQjenwUiYEa/GInGnBmezTEgfpg2J2eXSNASr
	l8rhSrBj/1jl1D7cUSBCn7AB387B6PtsnkCF+oNoMjpBoeKH9n9tlG
X-Received: by 2002:a05:6870:f61e:b0:4a8:1837:bc27 with SMTP id 586e51a60fabf-4bc7d272a48mr21046401fac.3.1795723505731;
        Thu, 26 Nov 2026 12:05:05 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5fc97bb2sm19548249fac.9.2026.11.26.12.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 12:05:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v3 0/2] mtd: rawnand: serialize OTP and BBT recovery
 operations
Date: Thu, 26 Nov 2026 13:04:50 -0700
Message-Id: <20261126-submit-rawnand-operation-locking-v1-v3-0-cd3794332f23@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WQ0U6EMBBFf4X02ZppgVKIMf6H8WFaBra6UGxZX
 LPZf7eAiRufNOnLTWfOvXcuLFJwFFmTXVigxUXnxyTyu4zZA449cdcmzSRIJQRoHk9mcDMP+DH
 i2HI/UcA5LfGjt29u7PkiuEAwuqNKq7ZgiTQF6tx5c3l+2XXCvJKdV/Q6cXBx9uFzi7GIde5/j
 ukBL1UJAjpbdto89QO64731A1sdF3nDlPJvTJmYkIOxWlUd2OqWed1rBHo/pZvNezdmMBJP/4n
 dZGQF6aIwdaFVDhILrdFYyAlroVujoIK6UorW/gPFiNuxm+zhd/MBbfCjO3M/T5xC8CF+dxZcd
 6pAiW2JAn7yPaaA1y/XtZlU3AEAAA==
X-Change-ID: 20261108-submit-rawnand-operation-locking-v1-1a0b8fe786d4
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Arseniy Krasnov <AVKrasnov@sberdevices.ru>, 
 Kyle Roeschley <kyle.roeschley@ni.com>, 
 Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.17-dev

Route raw NAND OTP callbacks through core wrappers that hold the chip
and controller locks, and protect marker writes performed by BBT
failure recovery. Both paths issue NAND commands outside the ordinary
MTD read/write wrappers, so they need the same serialization and
suspend handling as normal operations.

The first patch registers manufacturer OTP operations with the raw NAND
core, which invokes them under the normal locks. The second uses those
locks around BBT recovery marker writes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
Changes in v3:
- Run raw NAND OTP callbacks under core-managed chip/controller locking
  and resume handling; keep target selection in the device-specific
  callbacks.
- Keep helper visibility changes with the BBT recovery patch that uses
  them.
- Link to v2: https://patch.msgid.link/20261122-submit-rawnand-operation-locking-v1-v2-0-030bc867f0c7@gmail.com

Changes in v2:
- Rebase on nand/next after the BBT logging change.
- Apply the Macronix locking change on top of the posted OTP error
  propagation fix; both touch the OTP cleanup path.
- Link to v1: https://patch.msgid.link/20261108-submit-rawnand-operation-locking-v1-v1-0-565010fc5f8b@gmail.com

---
James Hilliard (2):
      mtd: rawnand: serialize OTP operations in the core
      mtd: rawnand: serialize bad-block marker writes during BBT recovery

 drivers/mtd/nand/raw/internals.h     |   2 +
 drivers/mtd/nand/raw/nand_base.c     | 110 ++++++++++++++++++++++++++++++++++-
 drivers/mtd/nand/raw/nand_bbt.c      |   2 +
 drivers/mtd/nand/raw/nand_macronix.c |  32 +++++-----
 include/linux/mtd/rawnand.h          |  24 ++++++++
 5 files changed, 151 insertions(+), 19 deletions(-)
---
base-commit: ec1e844b9486302a488abc03ea918db60709766e
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
change-id: 20261108-submit-rawnand-operation-locking-v1-1a0b8fe786d4
prerequisite-message-id: <20261108-submit-macronix-otp-errors-v1-v1-1-8f64a2ad5a10@gmail.com>
prerequisite-patch-id: a542c9cd698d2d4c090932b8d74dc6f520a71166

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

