Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729477;
	b=l0yHnmqHkRLQiHHICXxsrz9GnaEU4EjU4CqWJaFuR0A6goKICqC3+CUw8xQvHg+CNgtv
	 PcEhylWmAez1pe5V+Bwh6H5zWPwkSIx59vSfqHbxMJshvgCYIWCnLF63sMrh++m8hsh1t
	 ZpoJqD17Wki0n7fnYyvVlWHJD8F0ljbjLnpbBnmNq4ZX0HQt6a3hgbarM3v9g2BKYbItT
	 a+TTAl9cV7A4w/6/fOuwaTZBl7hg91ie0khyFPICXFzHLuecjeyp++mJeSTh0l1JS/S75
	 9jLlB4REzmaqvTM0Ti42UxT8W206lYnrEfpdstBDdUqG/vEgiq81p7exy8aqaGVwTVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OoXG3LYwaAjDPYu54stPd/H0Rb7wdL1aptwzNRaRwSQ=;
	b=DAea/L26UlQMtOeyyPgffl0/o2xKGbIsbsPsXzFqozwo83A6XngQZZUdAwrLOBDI9dSi
	 wLD0hScRMnvDHpYqoQW33WJOrhlQdOfydGi6d/objSZL3n73E75Cx0/7C2AW9BF0+SUd8
	 r8IzSSkxfzad4/ZZPD4hMIfBWr4gXLdyEpIbSSuVotRfoEvvA3jFIk5BX+iqTYIA/te5v
	 1diKyjYB6WdGREAOfa5sIljMKa8iCo1gTS2/mhdDSKqUI7SSoIrsI+BVZ/hS62X8qSZuu
	 +onMjBEPvLSAi9M0G9nUOAEenQrdp/HYJ6G4WqpYDmlIKwQ8wb5/z5pRxo5/Jvw/Ncw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fEQSc3RZ;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DA4606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:44:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6DA4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fEQSc3RZ
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b44bdcea8aso4207633a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729476; x=1796334276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OoXG3LYwaAjDPYu54stPd/H0Rb7wdL1aptwzNRaRwSQ=;
        b=fEQSc3RZSnuYQIs0UZirSTJrYgwbqOblwQiNXCLSO9R6BVV4x3qrtXKumdGstl3Jit
         3v5TWPWu37E1ydD5i8AQbAPsfF1CB7fUbqDTDL1qARxSnsYv1ZfSB1aXNLIwJ9YIUX/L
         V/8XUm4ATd/9CIPy5iGkbCv/5C33ukxh2YBMHetDBsLLBq8bPDXDy4NJvZW/iXN/U2pU
         IF4ztzz5id3wATDrkIcJi+KrjtEK18i6aTSCSViy3Hj2B3IMAwzSsp/X2yiwrW+c537x
         iAzHb6ExCtNFpE3G5MIz0M2xUb3vo8MjcC/AdFp62YygnftKWyeg6+MoU2keEThiLwy1
         3shg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729476; x=1796334276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OoXG3LYwaAjDPYu54stPd/H0Rb7wdL1aptwzNRaRwSQ=;
        b=jHa8ToILvQcAprGBl5sLLIjTfZWPUJA3CzvfIoI8WOvnTKVL+Ek9d9ppnhAtJ6yMJ9
         oxjh5I3ivUJc4I7vZvU2fGGM9TTsXdsd1PlFiidbSwJS4ImrXMlQP5GCfYHGSJwYksOT
         QfXI/dLuWyodJXljLHUkRgaYX8kcCJ4jCQmMCDXDvaaIyPQnZa0Zlye57TBLn7yWnOsv
         rSomUqyg5AuY/ti6F4pZWA34npOIy6JQ8sRWY2h0+4fFiRyqZgGhk41M42dKDKJkprL1
         U9LPt2U1x1BG1TmTYhB0+oti7MMFJp0OYaJnBb6OMqoFcrtNzOXAcafy6eirUaCy6tXy
         Z+LA==
X-Forwarded-Encrypted: i=1; AL+hErG+ty7nUp6VO5+WTGcxfxXDxI0LDa8twsqs9eRD43Mz49ZIqTdqokIlk3R5pyL6kkM8Ktf1Hb9BJlJjLfM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IPdgqWGScH2VZoMBnu6pqnfaC84L5GzT8Mh1Ga2wfOZ2K1AY5
	3EsOZfT31gNfAT0L1hJoP+AvuHDWV3ILcx+q0QSwmNI47I/6K3/AMA4I
X-Gm-Gg: AZFdTZc2dOYqafBS1NXVLT57E0BkhI7DCtIHnDKCxiyOQTe2b1FbSwkcvBRNqLQKHOT
	oesKfXDKtT6mi8VBcCOyCuAuaSpZglnQ8HIW9MpxshEWIgeIBrqt0D2eAtpUHR0YyCCiLxomE25
	1Wlg5vk85LvQb7p530NnZV6AoC3nTEoURsKSl8ywz/660W3zrL9Yqb7zDpisPTU/FhaMZlkIzZL
	3V3+5c4t0GDUooYdp3C3gpNByDmVvOo58LQ4OlgnJVFBmgMT6zZYwPoR3KT15liAOMDns9twqil
	jiBvRmN2yRyhr9fe+jG1guROj4gb4W9GEnL8z3Ul+JYmBCEN+PhI7+cuOYcDyU2hb8XsUcj2FNb
	99WX9T67QZrj0NqbxDlOt1FHO/pFdzEiFBa7d3lJaKh5o81CBZX3kTpSbkOFgl+wgIJlOGoErvN
	3CItRmIT/SA48fEbDHS5ZeNbMkYbiUFOIDgqgdPEHNoAqQykYArbZayOMRd5HQ4O29QzQpqgCrb
	L97clJaM8Zj5156XTcr2DH4b1sAVZLZjCC7WYREhPbEiQm7KxQQeOPJbNrBzHEUkKkxZbYzqA0c
	I4vcu2fcCPVdVASQf9XhPvYUaWlMlK+zwOJqv76ipENqnxkjauUSFISpYRPzBhgDNpoXG44=
X-Received: by 2002:a17:90b:5887:b0:3ae:3e9b:5265 with SMTP id 98e67ed59e1d1-3b41c93c24emr13850192a91.26.1795729475941;
        Thu, 26 Nov 2026 13:44:35 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40f4312dfsm36176538a91.3.2026.11.26.13.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:44:35 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: dlemoal@kernel.org
Cc: cassel@kernel.org,
	linus.walleij@linaro.org,
	viresh.kumar@linaro.org,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH v2 0/4] ata: add missing newlines to error messages
Date: Thu, 26 Nov 2026 15:44:29 -0600
Message-ID: <20261126214433.38317-1-artem122novak@gmail.com>
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

This series adds missing trailing newlines to error and warning messages
in four ATA drivers.

The changes are formatting-only and do not alter driver behaviour.

Changes in v2:
- Fix an additional missing newline in sata_dwc_error_intr(), as pointed
  out by Damien Le Moal.
- Add Damien's Reviewed-by tag to the sata_dwc_460ex patch.

Artem Novak (4):
  ata: pata_arasan_cf: add missing newline to warning
  ata: pata_pxa: add missing newline to DMA warning
  ata: sata_dwc_460ex: add missing newlines to error messages
  ata: sata_gemini: add missing newlines to error messages

 drivers/ata/pata_arasan_cf.c |  2 +-
 drivers/ata/pata_pxa.c       |  2 +-
 drivers/ata/sata_dwc_460ex.c | 10 +++++-----
 drivers/ata/sata_gemini.c    |  4 ++--
 4 files changed, 9 insertions(+), 9 deletions(-)

-- 
2.56.1

