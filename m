Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095749;
	b=rFaeRZC2bkaHZdO7QRhLyXoAneyYYoQAlnfHwjNAxKCsmdQFKqPKSqVDrNvjUPR6bNoL
	 2woFi09U4KU+qokBV71HqU0yja3DY/ihHk3zcvp3/INhOa+SrX/S4m03qDovb2Koo3/FQ
	 ztYb6vThPtHfxZwr8fBAmTqhes9sqtZFW7azR0LXZI6+548MqrukBug5T7yWWCUi/1bTp
	 dJ6vlcFS3VaCV645NJyh9RtEnYxXfxepikCy0HGkfGNgRv5ZwuNlUgF8TzQUZcbBOd3TJ
	 6QJ9Eyn/GiU/yWWFWKvFDszpit6BwfTMt7lpudazbv9youXyv0fYIZaL3gjp0eMLbMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=n0YIwd+6fF1gaH/fRdW2fKrVKfd8aWdILvAcZvt6cEU=;
	b=49Rma1SQIL7dTmjYlx0U/9JcNFYew13//aBjRxzKq9Kr749WA9XGukwlG29pvVwyQoXa
	 TYIEeaq8Gu/hyT0p+u9P3R5ZY/1SDSd85BAOH+7TAPBrG+JkJXQt8Tazu1bysSgH12i49
	 g/re1/W/jfwEGUdOQj7adKMl2X4dQRaupLDyFIro6Ym7SVf0zECnzVeCQd+cyzSiaJGUz
	 yRLdIuqfgs1E4EIV67C9xR1IgE/9WvIXMl55uzGf5Y9KyGLudpj3DvXbDcULMHxJIvOvE
	 ndy8QEV46ezACG8wHEbCgcBbE2xkcUc073L6QynGTwbEUXfrj8imMqGlYripPmkafbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mGFuavV1;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A64B606A33B
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:42:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A64B606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mGFuavV1
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48dee593f18so2223967f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795095748; x=1795700548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n0YIwd+6fF1gaH/fRdW2fKrVKfd8aWdILvAcZvt6cEU=;
        b=mGFuavV1YavdLmwEQz7yj2t2DHPle+zKKdjMAbnH+VAB8YloU+Br8gnCXQ9zbjzjOy
         V5P+U8leGisyHf5mIPv58EZwTIKYJItg95W8CTG8adyeqoA1CAj/WhlrwFfsHTYzE9fe
         5Ui2udnUSDUQbpKrxdWHQm1VOyuUA2QGez2eR+VEc8Yu6OiYYOB7aMdj/pKpcwgzVAu6
         OAGanTSm4ovd2QxlBMF5BnVgRHAmORZbsxSd02vVG3CLAAQEjA0yc6hgsciztdFIYM67
         NrsgsZq8yqlMv6snABhRUgVqtKF/Y29eWkZLuPmXT8ftvpNxUoNHuCkvKnFitDxr0ufS
         pFGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795095748; x=1795700548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n0YIwd+6fF1gaH/fRdW2fKrVKfd8aWdILvAcZvt6cEU=;
        b=wn14XHoFrp7vaYt3IsW8Kl55Tr/N5f/Jlwd3jroQz011La/vt7j9VT7qNG2ra74eTc
         QChSunK9jJ+wR9ARIEHsesq/BbOl2vAHfrsiZTTqzhQxbKelNfWiohbQCXLUnIQ5U5OQ
         wuZe5HYfEt3Tk2Ho3UfiitGYSl0fM7WR2igegu3o6nKPsq/jgSilY8UzUCDfYAQqJT9w
         w/P1hhm0xyqBISUsZQlbTCjoJGD/s5dLgGZMV4FzyhmflAeQsZa0rujHO1y7ShCSi4pr
         cUWFSZtWnniMp66ipcEY4gotQu/w264ClZcyeSklwPNVinYpHkvW3Q0AhNm8iae0l+1s
         yIDQ==
X-Forwarded-Encrypted: i=1; AL+hErHFv86EnvySAY30PcItdoYWz2bttMloZcOKQylSXSxHLNxWjvwKG1h4DUaKIXu5H5F0fDKHodsCQXLjoAY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Dt0xYyKoBke1k5vIQFtnLK5Dypp/C26J8sKTZpU9xfUA9SinZ
	I8prVVu2K6ybAWlG6IzY1B6a2IfKYp/UBGnK2RrVM8qBnV4CfC62KEoL
X-Gm-Gg: AZFdTZfZl5tkIRunyDLR6ELy0Q+LZ1VzgAh44Fx3I7o/NdCX15IPG3z0kha5PQuA6Rx
	LnJ/3e+LghjvNKZfY7+dYDnaY8paIWrOOirXje5kSKgDQxrd0AnPJZQQuxs64nAGm7cFvK/OkRF
	29POsd+4S2ES2npZoh4XX9DZ66N8o+8nFSlRIF2Q9EU+FyxUCEJ4Lz3EHtCr7DTNPz1MNETNviL
	u1hQgA/SQetqyUL/94W61KPOZHVG4ndiWVXHz2fyWzRYi95f4aZVRIbI7ESbte37Y5fLYPOfxJ0
	V26lT5SD0luQpZ37zS+HguVscYuydOZg+ueRqMMHEQrJLxAVV6PTpaoWOgG5wrGM2EoWLl7WwAj
	U6yWFtCuMYx1j89gjL+yMSLaRzrTNTvw04Gr1I7+BVghSgwn1SMKcfjIPnRsYBlAAeLIM/peeFH
	qYDOmwGVV8azyyNDRQqYEBXGc1cdGkcw59UMISZPiJMccOs+VgB+ZBsZvqPRDJfZ34ygrV312dD
	DYmgoTVM12qv+EWmeXBet9ZqXmPb8UNAndoA5QNG1p2akgeqhZ1Ymx8xEaMVuJo09s8MRKr8Dj1
	L4Qs6PPY51CsYYXkqJwdAyMWACrYG2kNMOw=
X-Received: by 2002:a05:6000:26c7:b0:48c:67d6:a87a with SMTP id ffacd0b85a97d-4a639ff6138mr14542869f8f.32.1795095747665;
        Thu, 19 Nov 2026 05:42:27 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656095e98sm9437971f8f.42.2026.11.19.05.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:42:26 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	Yao Yuan <yao.yuan@freescale.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH v2 0/3] i2c: imx: fixes for a DMA write that is not acknowledged
Date: Thu, 19 Nov 2026 14:42:22 +0100
Message-ID: <20261119134225.265242-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

A write of DMA_THRESHOLD bytes or more to an address that does not
answer leaves the interrupt status behind, so that the next DMA read
returns 0xff for every byte without an error (patch 1). It also leaves
its DMA buffer mapped, as every terminated DMA transfer does (patch 2),
and it blocks for DMA_TIMEOUT before it fails with -ETIMEDOUT instead
of -ENXIO (patch 3). Patch 3 needs patches 1 and 2.

Tested on a Colibri VF50 on the Iris carrier (i2c0 with DMA, M41T0 RTC
at 0x68) with this base, the other i2c-imx fixes on the list [1-4],
PROVE_LOCKING and DMA_API_DEBUG. Each round wrote 20 bytes to an unused
address and read 16 bytes of the RTC:

  without the series, 200 rounds: 124 writes failed with -ETIMEDOUT
    after up to 1.08 s, none with -ENXIO, 163 reads failed, 128 more
    DMA mappings in use afterwards
  with the series, 200 + 300 rounds: every write failed with -ENXIO
    within 10 ms, every read was right, 4 more DMA mappings in use
    after the first 200 rounds and none more after the next 300

On a v6.12 product kernel with the series backported, 200 rounds that
also wrote 18 bytes to a device that acknowledges them: every NACKed
write failed with -ENXIO at once and every acknowledged write went
through. A NACK of the last byte the DMA writes could not be provoked
on either board, so that path is not tested.

For stable: 6.12.y and older need backports, as noted on v1; I can
send them once the patches are in mainline.

Changes in v2:
- 2/3: new. Sashiko on v1 2/2: the new -ENXIO path left the DMA buffer
  mapped, as the timeout path already did
- 3/3 (v1 2/2): a NACK of the last byte the DMA writes was missed
  (Sashiko). Its acknowledge is now checked once the byte is out,
  before the final byte is sent
- 1/3: no change
- rebased on v7.4-rc3+ (4405c18c95d2) and tested on that base; v1
  was compile tested on its base only

v1: https://lore.kernel.org/linux-i2c/20261113073250.1037215-1-mehmet.fide@gmail.com/

[1] https://lore.kernel.org/linux-i2c/20261113110501.1142036-1-mehmet.fide@gmail.com/
[2] https://lore.kernel.org/linux-i2c/20261116122707.1349139-1-mehmet.fide@gmail.com/
[3] https://lore.kernel.org/linux-i2c/20261116125940.1368194-1-mehmet.fide@gmail.com/
[4] https://lore.kernel.org/linux-i2c/20261119130542.180192-1-mehmet.fide@gmail.com/

Mehmet Fide (3):
  i2c: imx: do not carry the interrupt status over to the next transfer
  i2c: imx: unmap the DMA buffer when a transfer is terminated
  i2c: imx: return -ENXIO at once when a DMA write is not acknowledged

 drivers/i2c/busses/i2c-imx.c | 52 +++++++++++++++++++++++-------------
 1 file changed, 34 insertions(+), 18 deletions(-)


base-commit: 4405c18c95d2d0f99f6c581ef0ee8591a1aa6ccd
-- 
2.56.0

