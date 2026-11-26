Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795670127;
	b=okJ2dTDmGYUXWtPwNkFy0I1svJhmgSSpf8E+asbdSL+sNLGHyadBWl6Jg/hla4kWhE6V
	 xur9bM0Z6sBk59cGs0Jc1NH9nu8d217lSa3fOLP9VH2Mb/LPm0LSWUR8/gL0w1/Bwa+zG
	 QsR8HPcHjItHJJiTgvkQR/BaxhXCiARQDNKXuXZP2PNuJBJZJLshAdo0Nf+KTrFecqyyY
	 OEgVOStU7/ShkKY+WaiueeX5tLbQk94OsHCCb7hkOiVy4EF6NvNFGvu4vQw64k8jy9pJL
	 nzp6UHmCem/1wb6mBpCCJ3jgYsOlf7fg0ah79esNLGcxEO6i6mxNnKJoD83RY9VY9tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795670127;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=x7dWTwMm4SzHnnHqQMC/uPsi8F2/ZPntO42FlxEQFuk=;
	b=OAyNxFfwI8GD/tRCC7E4GNimNwp4Sxg2NtspZJw2ZF7SAq24ImuMHPtB14lIuvjNqceE
	 yI0n0/+AEmSccDRmKKITbT65RdbS3fQLg9bMVSlm1ODDZIZOMGwjLgrEKKx0TGnyq+EP0
	 dR3SJ/EulmB582ehobEJH32QDZiY8xT2rMvmi94+Q/+kIh/J1tCow5KA7sLewuRaWdRSF
	 rSsaPg8oKrPz46mpKbHU2StGMrczGmwGBDXsDG1juJQtff3wOx1hKucy0nPZBtajHnkvm
	 50jNIuBw97Ya+MscHQq/vs0tTh+dxbOaYIMhXFHu7lVm+etaBsD6v3Xa4wRc2F2b4iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iKbOWIiG;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9C9606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:15:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C9C9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iKbOWIiG
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8b904d10882so2796777b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795670126; x=1796274926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x7dWTwMm4SzHnnHqQMC/uPsi8F2/ZPntO42FlxEQFuk=;
        b=iKbOWIiGHkqtA/5jKZhAMxeTxrmFx4BpZ1moKvCoQDRApIYarchwp5lVytCoTupgc2
         zENqTOk2aoJK0Suy2Rsr5Uc4eHztx+KtI7kYR2j91GEAstX1Erk3yC3iNWP6ahTBBQci
         ooVLRuEs7ra+r0IvrEB7btVukXZAjKKT3Fytzi/cM6OAMaBnPoXk+YcF4QZGkigqbknO
         W4/k4neFAwEeRorFy+Pz9VsJtUVPV6ygrjE3wYFHj1iYYmFUe1NlCm5TqF0ouoMcL+Wv
         OKBk7mltR+quXS4RYAdWKfH6RXVkMLnE9JAWjcGi6daraw14/7dng+nK8/B/ggQ95OMa
         GYnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795670126; x=1796274926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x7dWTwMm4SzHnnHqQMC/uPsi8F2/ZPntO42FlxEQFuk=;
        b=jJFxH+Hx3DhMxC+fC6Fa0uluVoutxYoIAOSYg2ZXtTcXL2bqk64H/a4BhhpqVmGF3B
         /VRPQyNNZ21dFrd36MqxpQ9+ZZGZpmJ2XTd3yZeyCP4Ooy8d0thYdZVmk2RdiDmNe8zl
         yE0YmKmXmMR5RMeypN22iSirJA5uWExZfP0zkSRpkqPVbZrpn2TduYZqqAA1vtGsCoXl
         Ut6ZYw91GG5xcVIW6VJhtqnrh2wueSqu7RmlzkqKDYcNjZQZsMQjVKKkumUJNxAjIpkH
         4nSXd4JHjYDiPaLnjFKDxBkgbavnVWb5FzNU0gYEHWEvaMaq9NKnxuEwQ/tJJRXtZjqe
         bInQ==
X-Forwarded-Encrypted: i=1; AL+hErFj3Um2dywQ9rloRqf7kjZD9vKLnDYzuPNyMq+rQX0mJCubpiaMy4eYBovZQzXE/OmKxdFuI7/WiQ4lr/A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9aZfLJAor4pvVvh9V3QnWo9DGGE8bxFF+GgLvz8/RwSDHj1Sbq
	TRsAvmfdY0GX3dWZ3Jdf9XfdZ24OEKr6r4HPe8zP/jPMWSYL5c+r4uYb
X-Gm-Gg: AZFdTZdkpenJt2r3rRYogvxgxqtwTWLynTgp7iTvzKwSSrsj2zttaq3J0VyvD3TD1So
	6luIY0yH66U3JRuyBQQ722/LEkl+lFQ9508ii/JMGPhadTLk9GG+DJOMmvV2DR9LxxmAD6LSZpg
	gYkmZ8axFjR7CJeB2eueeIEZEG6PxpNzTnSJSphcD+QMtguXLmwnr+aFFefDczIgJHXqiFydel3
	As/5mDQDLZdhiRx1q18e6AGaxsfvVwgmjG6sRWdPYEltUpw/M3vTO6w7m1YgXAdV1krCEpmE2+O
	U3sg2Sy82R0NtBkdCRETloX+DU6yQCz/buRCvVc5kkEe8Of1DD7iQVe2BM6NMJU54OMQI+taKdt
	PfZYBzcBf7dd4wiw5+M2eM30Od0PMvUPIPjM5XrHAsV+TkYix4Udj1JVIy/QDZ1ZlZrCQ4F/sfw
	ln4Gk1fy2C0fLyw2T5XzLQNjg5aXTI6HLxrNRjXS5qY3U5a28p7OXci1nO6NbRCy3xsRFn82L5b
	vqkk9Z8YeL0fzhOCeJNnQ1KcPiBcsdwUB89ysUmHWaF0gytU6LQDSGgvLQbKgEkGCsmtaEDqD37
	Isof4XKvOLrAbJyn9hlLW5p0MJ8phS4Gao7Rd9qJQe/OQ+NYcg==
X-Received: by 2002:a05:6a21:7704:b0:3eb:4b16:1afb with SMTP id adf61e73a8af0-4014e6566f5mr18994749637.56.1795670126494;
        Wed, 25 Nov 2026 21:15:26 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077a058sm10179820b3a.8.2026.11.25.21.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:15:26 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: vireshk@kernel.org,
	dlemoal@kernel.org,
	cassel@kernel.org,
	linusw@kernel.org
Cc: linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH 0/4] ata: add missing newlines to error messages
Date: Wed, 25 Nov 2026 23:15:19 -0600
Message-ID: <20261126051523.14431-1-artem122novak@gmail.com>
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

This series adds missing trailing newlines to error and warning messages in four ATA drivers.

The changes are only formatting changes and do not alter driver behaviour.

The affected drivers are:

- pata_arasan_cf

- pata_pxa

- sata_dwc_460ex

- sata_gemini

All four driver objects were successfully compiled with an ARM cross-compile configuration.

Artem Novak (4):
  ata: pata_arasan_cf: add missing newline to warning
  ata: pata_pxa: add missing newline to DMA warning
  ata: sata_dwc_460ex: add missing newlines to error messages
  ata: sata_gemini: add missing newlines to error messages

 drivers/ata/pata_arasan_cf.c | 2 +-
 drivers/ata/pata_pxa.c       | 2 +-
 drivers/ata/sata_dwc_460ex.c | 8 ++++----
 drivers/ata/sata_gemini.c    | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.56.1

