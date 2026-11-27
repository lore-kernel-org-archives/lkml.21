Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795804951;
	b=mWx5fl/owloDP5zx9zTcbuKoQ32ALIJl4CFEQ06Oe2dJf5hsDq7RM9B6HhxUmQXiBJbe
	 MwvVew1S8X+i1GmPZbNC1Aoo5g2hFQEbkK84lMfvULjWwC6knIlSzReeL4+hr5SlSGNOd
	 nYDb3eIdiulaGHKEpIanwb9Ddpr8ddRkjCk0QocWt0A1GgKdrnc44gyXLQmvE15JMBNhP
	 nHozR2pASCliZDR6PSIPzi4JH6uPSEzOmOK9brUCXqd92RvUuJCv+daJE7t4xYHztHv0B
	 HzaUjX0e7R2NwdTxzUc4dhL0Vb7cUIEU09dUtyf2QwQ/8tQVq6sUbZckujzBXE/afoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795804951;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gjZ1e898XhWXCBqSM6QfJZ0rrSlqOu1Q/txUinvl18o=;
	b=GJ2MtETYUsTYA9y/IF+u0xymMKkQpWyLjCZZwIAAJQn5R8Xf65vlpT16GrjmYkOiHjPa
	 9M7WK7fs1VVtz8HW0TJNGRx8+crT9wRy5tHobGpv8/EeGNz3AIh93dMkdKjgKpafW0tTx
	 3cG4gPmjJiEcTIgtYLLLS4NW8tz12hiUXEsWZ9pSNxgBVtdXwMUeXaDSPo9uzESi5nPMJ
	 ixMz3Mzm/iA14TLxouG3i4tNwsvgCoXmCY53gkLAm+T/OYR/MX7ZdL1NUjkGTCgOUGd20
	 Kd4wEYoPl8rP0XDtA3lukpXBQUoJxcSl+Ou0InWoyp3dFQMyL35tSenLHw0c5YCGjKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ndeu8bMI;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7D7606A330
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 18:42:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F7D7606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ndeu8bMI
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2f02f04a426so67161115ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795804951; x=1796409751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gjZ1e898XhWXCBqSM6QfJZ0rrSlqOu1Q/txUinvl18o=;
        b=ndeu8bMIlo8ph9k4IZSIGAiPigffhdj5Jmt47H8gHWJ6e9U6tnylNbxHjMU1fE/7b0
         ASnFvYNAAECXOasS2Af4SNRtui0jXCgvmiZBwouX+28v5ToVC2Tc4dwDf6wb8bpvB/Go
         +iJ7HLf6WWxopmu3uRChSmU5nhRjuIrWaTw6ycNtwyZaPVFuap3LCJVrpy6nst4P5s4b
         J4TPIeVV3GyDceaJrQmc9Azhv0XnJV7LbNiFqYo6BRZVmpKmITPCygKHbzYRR4x2OQ8u
         2BYVMhXRplEVT5zvFho/AuL1kx0//nvAXSaYCiAI5FfIvzK4zkVgvnKZnQj9C714SFWV
         4muw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795804951; x=1796409751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gjZ1e898XhWXCBqSM6QfJZ0rrSlqOu1Q/txUinvl18o=;
        b=BIUAIDst318jldXkSyUByVKDugeQIIOE29FVhvqDPMVD5nmOs61CyM2yDMDR4eONNb
         eavgyitE6GlM2rNN09bvN/wdqLQd4md5/HyqeE7D1f2GEx5r0vePWSgMs2LAZmrpb8Sr
         48DEh9GjFh4rqsdCfpais84b7/+haB2z9G0I8LokR/3EBvykLevId1HZBAmTKUdGnQsX
         nu3DWEDIDTCgHVMyxDmWY11P35/3ZLXJ8y6udzU9RcWk+hMKOLeJmKDYFgA2vv0aaDzW
         n/IkokwmTsCDNDxAcyyhsfsZ2ZVaeEnUztI/kSo5zvYVwbKf42dzGTCcxXC3MylPlbnC
         wU6w==
X-Forwarded-Encrypted: i=1; AL+hErGXGZEbAngcITRxN9Ql3vXjmOKsvdKbf8BY36a1Gk4h1bUvLLDjEI6UhDTkhyxKDXJ5zaGgXTCkxSoo328=@vger.kernel.org
X-Gm-Message-State: APuU4Z83m4cag6nrE0IrqBxoCN34I2NGsnuU0CkaijFVl9zdNkWlWrGm
	uIR8jYPm80mq90p5J3Aj5gePDz1Ls86CQ4Ug26+MdaKWKmwatTRMY2DR
X-Gm-Gg: AZFdTZcEGgjRzGPJBkSFOpmiMLGI9Pedy7phucJvrQsi9+9+VgoduSYQ6T4CJ4xkCwj
	S5cbcKdmz79fyg4sZtQtAHZqLzbrE0eVreT1dPBcQGI99LsDMxJx9KBSg9q7NsZIXMouxvMbcOh
	tjiN8CRSt8yMvUu+BGOtWXS4snHKFTgeBp9XD5jFS26IZOIS34sUxRtIRgFYriVsUwY7HlzQrXr
	FdBGaSRrRwpCXNws43Frmavjjqnrg+F3fWPvhVuoBNCGLURB8lIUbRoBljErRQrxefvrZFZaKmT
	0M/cF2LtYF4zCF7nOeXWtn03yiWhL+w9naDumCl8x8TpAePBODrf8PQuO45qFD0o2DOUee4qTlg
	rY3jczy6/+wBB9lGooVKFJq6R5KvvfV/gFWeGrieF5GqxjOMNdSWVSZxMvrhZYBDKDVtj75C9mV
	KVYdv7xKl72R8rnwaTfABEb+8WjaXJ/KWbVfHlxBThdEJsbz3E7ZCaqC3x4L8dZ3k/21OsW8ADp
	xWwpod+UWIktEitmEReo13lCrBjL0phVDARKPAdb2K62ylkKkq+9Vx7n6jEwFSbIy7Tufd2uv+t
	WEsAUexwIgQuZURxMQrfF2I9u2pWRpWuxPO63CuVYd7pLsXepg==
X-Received: by 2002:a17:90a:e705:b0:3ad:aa1a:312e with SMTP id 98e67ed59e1d1-3b41c7e127cmr25168456a91.3.1795804950922;
        Fri, 27 Nov 2026 10:42:30 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4dfbe54a2sm19149071a91.17.2026.11.27.10.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:42:30 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: artem122novak@gmail.com
Cc: cassel@kernel.org,
	dlemoal@kernel.org,
	linusw@kernel.org,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vireshk@kernel.org
Subject: [PATCH v5 0/4] ata: add missing newlines to error and warning messages
Date: Fri, 27 Nov 2026 12:42:24 -0600
Message-ID: <20261127184228.185827-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127181619.183139-1-artem122novak@gmail.com>
References: <20261127181619.183139-1-artem122novak@gmail.com>
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

Changes in v5:
- Restore the sata_dwc_error_intr() newline that was accidentally
  dropped in v4. This change was already included in v2 and reviewed
  by Damien Le Moal.

Changes in v4:
- Rebase on libata for-next (3391ac405dca).
- Resolve the pata_pxa conflict while preserving the updated DMA
  timeout condition from the new base.

Changes in v3:
- Carry Damien's Reviewed-by tag on all four patches.

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

