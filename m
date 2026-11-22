Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795341152;
	b=GJj1igER2jHJABP6IFB8pmCxMyU91vvzFC5S0gxezyfxWvSLCGkofpHHM2V7nGTi6bh4
	 KSvAeDMD+9hTjeriX92EcprJfORWHHGzaO3f9AX2IPyn4OrSLZe4F6oqVtUm+YDp9vXMa
	 Lr25VexneeIvf8oZAgv83Jo60DAcNkaeTBpsOBfYsSNdB8kIHClkYktQIT86nMyrL+/XL
	 Rw3du2FuTWNDFANI14xO9ir2ymbvA+XNxoyii+ZL3JUIaDwQUDyivphGF9ilV68WvX5Su
	 R/3z8vRxUzG1E6ae69OLTtLE15l7T2vfmi87j4BImuUGfcT1alR3/yc/8xKxmUEuf/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795341152;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0NWssteZPPVU+nMk7IUnyZcBf2kF3Y2sa8v4XCIsjDk=;
	b=0AoUyAqHv9He8416zY/gS0vPFiw3LQ99xDQVRnmcESA4jgvmrnztTfHjy1czLF34www2
	 sJUpYZDdh6EPp08NgoG6V5WJ09HVMJ3nF5itg7QyZsTpwHLEFd+K3kA+uZ41OjWmjdt/8
	 Z/7+CCuXP85SCRRar4UOHccUabDcDyP76F+vnagUnTjqaFdp8APypq1rvLp//T3YzKnqc
	 rp+pctxQpoERCU5w2Z2QYDe2yj32YMpILJgI/bhoVruuQaEoeMazWT9bLvoRUQzEOgS/Z
	 A/t50Sl/CHQnreTYBHcLIA8yLvMvzA+NTW2byeoGnbqcSJ3l9XlzArFEzaRocIgNRdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p5s5r2ZO;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11811606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 09:52:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11811606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p5s5r2ZO
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso872551a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 01:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795341151; x=1795945951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0NWssteZPPVU+nMk7IUnyZcBf2kF3Y2sa8v4XCIsjDk=;
        b=p5s5r2ZOw7S2UK5YF2dVjoCiXwbvOZ211XbGS3nEH7tWVh+lgd9aL5CAKSCYTwNBJK
         fZKuvblVH4mBSvqONI19trzwTMvJ1N7CZX7vw3IA38b7Dc5p3AHV5vHcKlP5PNO+sxD0
         GMijWtMbZZmZV7+4wiUvzbu/2RmQIF9nsdbdcn9tK4l/gN54hQtKkKjUsqWKrikfBGBl
         yUVoJzMrEFFRty/I20UzT1ik+WfjCPGn2eso3yBkJHv0G5bkO2u+V3VkKXjsE4+ZhTlP
         iwSyyiqr/yJv7SPp+PefocR6NepFwFnuypqwBY+e+1TwSmLBb2jYruDg1RJrTy+UnxOP
         ZIYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795341151; x=1795945951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0NWssteZPPVU+nMk7IUnyZcBf2kF3Y2sa8v4XCIsjDk=;
        b=h429bg2FnRddbwG63B1lsJq1WS06MNdwZCiNDwZX7g4sQen13S2N7nTAqO9beb1oRp
         xImN/1QjCPmTdAcCTQRT1d3yoT0iXKfF0iTnRnUuIjB4CJtfFAyRWNUlfLqjYheArvTJ
         +SJ0a6M1QfqZq3BrChT6BTAffBM4JbeWti7tF4E6nvtD5wsKhrlC70IsPIeh6BoH9BcE
         I0vqezN8aCof06UcDJwJxnD5yOF1btyXCd1zGf1+WVyCq5VqdnqTg0C4SfFtxhuB/Wkm
         UtgiWiSTLtE0nKe+sWfjyYocsxYDfn7h/+mKWBcAY0eBsrQIUI5YWXFfa9WCCzDpHxO5
         X8AQ==
X-Forwarded-Encrypted: i=1; AL+hErFZmP10bM34oY9hb1Wmm8YC1ysnNPyNPCT/eKDqfn1Owi6K3hTPUIzVJIBbwMxCKk9J+Ysr8Z5aA4u1vls=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Z0+Nh0k951QJaZMIZOCX4B8G/9+6rhFfE9tzbh4JeQPUAVSD4
	YQIxw+l4UAzyvSiZBidV+mbMAq9Uhyz67LAQNTpMW6xDr/FMWWizCjqjC74lgpw3+mAk2Q==
X-Gm-Gg: AZFdTZeLvM1NPERc6O0oqQjbuOAMCApiU3cW70uH3Jc3ICsjOUjfDHPa/xY1kdOB9xO
	Bif60w0U0qjWNUZdxsv799Qygw1vhJRQGMGDHkfuO1GceYIImO5tEUUjqSeeXl0dleQrv8PfIbt
	e4zWGcqlEehgSgDseV1BZPgz5OR8mQx2uHzoz9L2YG6PW4hZCZ7fwhoLQXGRmeV3eElvxcsfQhW
	sF+leXQYjlEg+goqGe68fdB64aRNnHINZhW6SMvE/v3Uv4bd2JgaLHRi8osXggD+CKQjMGWPAUb
	VvcVgLB0bMwaXfWa+Qn6Z4SY864NDlneTzeaqm8KSFyXmPTOwI1vKaD26HbR8BazSoFvvMZ2PCs
	1O7BOgDOqfGbOSoDEWUzwmB1Pf2OFs943CKQNchb164vEtxthw76j0FRNvUjOtC8SU9olEB15n6
	SFIXED8sm9wb5ja1aYC9YOtpWCnPqCERaz3+N80k/GmwlUXjMtoKLEZl4+To0peGMZWhZ1Rs+Ma
	C8176kQ2L4QTSX0b8A0LBExwv01/+sKGHI2aA55gK2raKBgSwQMWGzh+Rsfc7mF7I7hoN+z5wiK
	X4exCykiZgCy6CWfJKCIq2Qo4vvQlL/bMi5lCUyPISl+fndOBMI=
X-Received: by 2002:a05:6a20:ef0e:b0:3e2:84a4:8875 with SMTP id adf61e73a8af0-4014bc52bf0mr6906650637.53.1795341151175;
        Sun, 22 Nov 2026 01:52:31 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([134.82.71.171])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d028a54sm3289722a12.18.2026.11.22.01.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 01:52:30 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: florian.fainelli@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	robh@kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH 0/2] ARM: dts: bcm2835: replace deprecated LED fragment
Date: Sun, 22 Nov 2026 03:52:23 -0600
Message-ID: <20261122095225.200916-1-artem122novak@gmail.com>
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

The Raspberry Pi Zero and Model B device trees include the deprecated
bcm283x-rpi-led-deprecated.dtsi fragment to define their ACT LEDs.

Replace the fragment with board-local gpio-leds nodes, preserving the
existing GPIO assignments, polarity, default state, and heartbeat
trigger.

The changes are split into separate patches for each board.

Artem Novak (2):
  ARM: dts: bcm2835: replace deprecated LED fragment on Raspberry Pi
    Zero
  ARM: dts: bcm2835: replace deprecated LED fragment on Raspberry Pi
    Model B

 arch/arm/boot/dts/broadcom/bcm2835-rpi-b.dts    | 14 +++++++++++---
 arch/arm/boot/dts/broadcom/bcm2835-rpi-zero.dts | 14 +++++++++++---
 2 files changed, 22 insertions(+), 6 deletions(-)

-- 
2.56.1

