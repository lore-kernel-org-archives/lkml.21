Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795848756;
	b=NczuQReHUXERYFIdLrt3U9wMIQM00mmHQ2aQKHPJ0ltIXv7PsDcysvxdycEpuG32/Hus
	 I4FxljvE4rxItkI4zL/G3upWMATslcojyAYjyGAREIqjj99/rk3dy86gQz+z1/8SEndYb
	 SXx0fINsIiTD6kiyRdnchE0R+9YRA+dKmjEPmJdi7ILLdDsy2ebmXUhyLriQz8nopcqH9
	 XGLlhI9vO7HXIIiCByiXFHSmCPfUyULNCaTV4R18jKZ+XF+Wia7Pjy97+TChe1MPK5KAc
	 ATAhc+3Dm7wBBrCJhocs2c9EmFR8GhZBqKlYd1CnTo7Br6rmRBG6nNkFuhmuSVqh4ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795848756;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lPgoK6f/peOX7Xfa1riXw4UN8djQFdFslFnwrQD5OhY=;
	b=eZVOcboAxRCXGW/iaoa9xQ2AWM1Zw+vxcfEYqfwzVIl88jCAARTKYYNuiF6NX+4mqf78
	 W6i0VSjYPtkq99oDFoUz/Qlx7SAahNXz3cJDIjFvgvEok6rT1AC7p7NUFy7woJOk+xvge
	 nWWdY3jdujvX0u7PLB2gFeqAz+RmaMnuUwGSnGO2VJzI4P3EKlff9Kr3xvDn5wEJXEMNL
	 DgLlzlufBZajQb4ZCCiGy2zpzx7rLdVmpXMiRuoJcdHRWIzE4ab/ckBAPMK7H/iYWgPDG
	 W30fT8iTENd/+yKzctS0F4Al8jws7CU6QOdMO3jaBIS8sJKT9F64NdCh7MOayeobXCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ozrzSuj+;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8A2606A338
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 06:52:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E8A2606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ozrzSuj+
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cde1479f76fso4666931a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 22:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795848755; x=1796453555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lPgoK6f/peOX7Xfa1riXw4UN8djQFdFslFnwrQD5OhY=;
        b=ozrzSuj+tBVwucEUNw6rNl3r0Dl44+0eZyMmIj86t/YsGlH4ry14kwAIdUVsGkGzur
         Z3/zDMKQx7HCbpoKnQltGelr0o9ZvEcTG13i3rjzgfnAz6FvtoAc5mGFQFbFptg7wIWn
         6sfXlao+lCegr9lfIOXWKQ8+stqw0U4kIewGOBkSIWVo699lcYBNtssLoXOU0AHM9Tyc
         dsAbv/NX49N0zY/0ehTJGILTZKOtithPRIRj6LcFkdqc4lHqa3fXKzryxpyRXZL1JzrL
         cJCs7lLl9Uu90qMMz0wPd1xwd7QencG7w2MG5cFH0Mw9lBJMzX22HaO8MUJlHxhQ5iAQ
         4mhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795848755; x=1796453555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lPgoK6f/peOX7Xfa1riXw4UN8djQFdFslFnwrQD5OhY=;
        b=B+XTehnpzYAy9xb3UE1Kjnkngh9TLCKEHUwzIy6D/M1CRNe3xZG7Vq7pKetNLnx6aF
         LKZy8MWbqeu+Z7VuAgLpwfOUNiL7VcAtLFgLUo5cicDCaWsvChX04J6pUYJRpaMC/0kP
         heQ0xH/2E6LgKK567tdr14DLioTKpv0dUODSes60PhRDu2UCjB1IcoJEfwRIAOM8gEVR
         uEVE51RL4+1Zcol0AcbzDVj6xoMw5bhTXhcxxHxyUQf8NVjqwMF1aXGkln8o4yzWVZHY
         Q7pam1BoL++GowiGlFTo+qP8oNQYby/CGqrcUSQ0bU7WY4kVbXi6aBRzI84dqWdxAA4k
         5fFw==
X-Forwarded-Encrypted: i=1; AL+hErEVFIBUF7DptgfNitjBP6UNNQG6NAL+IAKm87FqOi8rOvsGekLjTu5JPKHuTzKJZ/njg+A0wKds8GxjiCg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Cr51YK2vW26ZOOWOeYcpKiCGf8FDSSelULwkU6B/css1yepfG
	w6WX27/YL4NTmevjv3mQy+fHOjW0IAM1/MT774V++z4QTncceLVhe1cm
X-Gm-Gg: AZFdTZeGiYOpaiQkrmA8BJ76f+6PoseIwuc9gt6rU+U3ZJam02fVJ0g1GolJuurrLnn
	Ca+i3Ks2y22hnK2YgP0FOb6pqcL9njDsOBCGN3cbi0pyPu4cLiN4n8uJxXhRb1dCMCn0C8M+/Vj
	6o5oENksoUgF3+3AEBKklO5hkFyXYSpGR898GIU1NRCXdCGr+wa5iFTVoKZtkKwP6XqICtjUsjv
	Zat5t9KDY/m6UP/xcRhqI4MkSN36CtoUS0PFvCTwa3teeYQs3K5PzHVGKndwVXKRvE7vLxPVQkP
	ejWDHt1xLKuL68W6jD0Zuvd7DpcbdiEshckja9a9o9RjTgYoMXStHTCy9CAuvLJlEhOmE8AFXE4
	R4xX5O55kh8yoSniU4H2i35zC7LnpfQUrDqTsSOJfWVYvvsEL6/JGqXULt/H29cMXUMf4AeyNea
	+7JIdQzZunKgaiJaJi2oE5AyIMzxeT2G6anNpRiYegZyzlXj5aNh3JYHSeQiERff5+c0DSycZ5h
	L2fMs2LyDf8ICkdry3z6EcXJ7PKpURgAfUkFRGJiZzCQaUnC0Oh6hV0FJsIyuu+Z4uFGFbIcBfE
	N8Wz/+8wyqbE69jqJ3FAonlC/PxMWunEvHxORIzaVo6B9zg8gGVraAE6sBNrJNHbH83RJH8ZyBV
	w9urZGZScEnmkjFpmoZnuKpqHU5X2QR5JWkwZBke/
X-Received: by 2002:a17:90b:48d0:b0:3b3:b5b8:1f43 with SMTP id 98e67ed59e1d1-3b41c97115amr29820014a91.62.1795848754776;
        Fri, 27 Nov 2026 22:52:34 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40a878d50sm44372965a91.11.2026.11.27.22.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 22:52:34 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: broonie@kernel.org,
	tiwai@suse.com
Cc: perex@perex.cz,
	shuah@kernel.org,
	ivan.orlov0322@gmail.com,
	ben.copeland@linaro.org,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH v2 0/2] selftests/alsa: Let the pcmtest test run on kselftest kernels
Date: Sat, 28 Nov 2026 15:52:25 +0900
Message-ID: <20261128065228.3628550-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126035526.1779288-1-sammiee5311@gmail.com>
References: <20261126035526.1779288-1-sammiee5311@gmail.com>
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

On the kernels that CI labs such as KernelCI build for kselftest, every
test-pcmtest-driver case skips. The KernelCI arm64 kselftest kernel has
CONFIG_SND_PCMTEST, CONFIG_SND_SEQ_UMP and CONFIG_SND_UTIMER off, and
nothing would load the pcmtest module even if it were built.

Patch 1 adds a config file for make kselftest-merge with only the
options the tests themselves need. Patch 2 lets test-pcmtest-driver load
the module itself and unload it again at exit.

Tested in QEMU on sound/for-next 486060b97284, on x86_64 from
x86_64_defconfig and on arm64 from defconfig, each followed by make
kselftest-merge. On both, test-pcmtest-driver passes all 10 cases. The
module is gone after the run when it was not loaded before, and stays
loaded when it was. With a base config that turns off CONFIG_SND_DRIVERS,
the v1 config file lost CONFIG_SND_PCMTEST and CONFIG_SND_ALOOP in the
merge, and this one keeps them.

Changes in v2:
- Patch 1: Enable CONFIG_SND_DRIVERS, which pcmtest and aloop are under
  (Mark). Name the options that are off on KernelCI. snd-aloop is on
  there, so v1 was wrong to say all four were off.
- Patch 2: Unload the module at exit if the test loaded it (Mark).

v1: https://lore.kernel.org/all/20261126035526.1779288-1-sammiee5311@gmail.com/

Prepared with Claude Code (Claude Opus 5.5).

HyeongJun An (2):
  selftests/alsa: Add a config file for the test-only options
  selftests: ALSA: pcmtest: Load the module when it is missing

 tools/testing/selftests/alsa/config           |  7 +++++++
 .../selftests/alsa/test-pcmtest-driver.c      | 20 +++++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 tools/testing/selftests/alsa/config

-- 
2.43.0

