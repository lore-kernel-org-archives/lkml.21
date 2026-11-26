Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795717791;
	b=dFWGUl3ORSdDsp9DAyfICALOhu0UOIu9q2pe0Dj4FBWEhfNo3wZpJvWkyFK8kUAzKW6g
	 dsuXcwuDUnbhN6prm27YcR8fymmi50v/L9S/GR1PmB/j3Ym0JgrAEv2w9H4FA8WSMjitf
	 mByg1AAYAqehZqRcaW61EZ0PKuOK7+FB4vWiVwmDazgl5/Ytn6Cc+VtlXI4NMuGdZQASJ
	 QbjUDTsZpZF9W6JK9PKXGyWTX79DwBjWAZNhxae8z1k0iwgqqk+Ga8Qrb/2vCIsdbmARx
	 Xg+5dj2ALYx7GrKG4iQkp1eFleMhoinfqGxP1s78v3mel5aDs7mPJAzP1vYnC5bkipg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795717791;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=owBndUl6B98qwPRw0FXk88D41lLAkcYrE6f1l+yGymg=;
	b=nqCKuTm3h1OuuZXfR1TTaIJy08EFgo++F/m6BRzAQcEdjgjEKGkdaotVbfxYop5FdWHS
	 t8eUpovNbQUSc6YQ24U5Ag9pjEb3pYjR7zcnNebf95pzqbb70x2c4v1NVvhph51rIHtZu
	 uedRMV2pU/Cxtq1ZxELLXRvZ9GzvAzSyOvWDfseV1QqF0zpxm76BTpH5g/yu+L5vuIjJ8
	 Qa5yXUEaO4+yxT0dRVI2l0LYZheX+4T3Sh8Use2YjombI0CjH1vBYj+C0NYd0rtOIi41C
	 MofCJ2/bpQFKEGyYSz1TQWnmD12HvF8zONWs2e0OkJawCjiQv5u1KvozRtI4JQo4iYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y675L+Sf;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154F8606A327
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:29:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 154F8606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y675L+Sf
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb9d8e8e90so44509795e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795717789; x=1796322589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=owBndUl6B98qwPRw0FXk88D41lLAkcYrE6f1l+yGymg=;
        b=Y675L+SfSBGgIp4gbRlqYw83S3pfbhJAzzPw5nqXcBq6ljlY86fpJGR3BdtNu04vWV
         a9Vyk8hnGgxUIh+vCOimccWs+lPaCJx5sYduXTaBfagVyUQ/r0KYAWbXQPq3cDjTWvlC
         ofDy4WFwyZE8FsOEOQ2HyA5EZi2aQgvwgsY4dXggjYHEI56rDiunjzl+hfCBQo5OOs0L
         B1zg/Z5jkToLM0X4U5RY7eA0Iz+1Kh0mOLmvPndBEg24tSbkspdEHmgrNKYDcOkAItU+
         T4r/80re9A+yDhu0vo1rV90lEu/m+o4UlOe0ANNCxDQAGCk6f7GNUypevDl89XT31IP8
         h2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795717789; x=1796322589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=owBndUl6B98qwPRw0FXk88D41lLAkcYrE6f1l+yGymg=;
        b=ONYSQw3IqOQlPeOe0sRVdbKB1rpQ8gfygT7xBbvgUwk42ismnh2iBcZoT4NDjq45AG
         ppXv/s0nQ4NsGCTCOgSLji83XJVKMWP1TJEyXqTQ0o9lezGA9hEbpkAY/rFqGtej7fQk
         CRrJwyQPjhr3bE3a+j0BZahp144AgRLbc9XGpKxH/DFBnH58GMy1GHwdDV89dTldObXd
         g0LXwYQywnILSWpZg5XccoXf2yMKCtNLtoh6BTlISLi+EW3FOagkCapRs102dAEma1Fa
         fdeZ7WlFh5f16RSvOb9+aLDTLyhmXUd92b9oIXDTyiAPLPHW57pAw7dHfUoQ49ktu8IR
         mIUQ==
X-Forwarded-Encrypted: i=1; AL+hErHP3eTYm1VougXrkfO85vF5exH1WGj1D3ZKvTFBFMqSHWLOFzUsUr3eIZjoNkaSIgJhmhMkeoYfhEzTFmk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xzsWZdKif06mD3LWjj2pHSpj7Awp7Vf7ryJmusAM7eXPQzYFE
	Owxy4wFp2CqzDd6z0RLbGDDa3oBqGspPVQj1KBskqgnvAYKUE23WhKZc
X-Gm-Gg: AZFdTZem94Y7mP9LoEMYsPU+AIGKlQ8FCdldvmM2GIC0IUWHJz9qZyJl+qDvHV20vk2
	QKYjmCxadk/1PkdK2KmOGnllKnMbMpIPp6X05Ec9RGNvlpOicLFe5ktnXkOr+lS1r+4t5vHSY8C
	tJc0DXoXpjhAYdjEqA3yKtoOopUVkmz9Zcv61Rs9L44tqLgsOS7CjwO5Fp4YW4AN07DMdd9FuQH
	KH2ZxBsx3fVKaxtX8T90BwhXL4o6QF39vfGRLwbnKvdpK1Fy1p8geNeWA/5JV7aCuZLrnIp6eGh
	u9KK72RYhqC3LNoluD99Qu+0I7q9w2Muyp44pEidA8i1SdUVBJEZwZquskpQzWDYAAPE7AYUMIb
	prfVaukKDT01gH3ruFdLPNwdvFU4tyNfCULTpTUFSueE3k76Sr73wGG4za6jRcWbpd5sE3ifHGv
	Jim8peHRCx+ZGNfT81CSQK+IfmqQbP8FlikaxBdi+z6Itc2++rKaxga9HvXc0A67ETUFCLNh23o
	g3c5ywMAfETJ7C1hjVZRTZqKjNAM2G7bRG7DA2f/0b8vfNfQGqvBkRVEVoJ7bQAoj8sua2yxePu
	lc03isu8+noAkdkKEqCTESi3RDOiNCa+Ev4va/yE4D3OxgkzM5eX+a0bcFy9glEDL4ZwlyzisZk
	qn7dlZnopQFOgPwTmvrxGp+FPCj9Uyal1Uh94EjWLyJ5QtL1ijDLroFaSqmFrqcFtx0h5z7LqFM
	GdxOpRr3Po343sPF6n+r2nPYg7DIVyIPd9EL5oqQuQ/v3zzJSZyeI/Lb7E5igyu26i0DC46T4lD
	r3enHH3xUhP9BYWAAYub2JIrsyMlBLej2f8BZ+F0A==
X-Received: by 2002:a05:600c:a087:b0:4bb:5c92:ce22 with SMTP id 5b1f17b1804b1-4bb887fe887mr443791125e9.8.1795717789172;
        Thu, 26 Nov 2026 10:29:49 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2052c8sm42382159f8f.41.2026.11.26.10.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:29:48 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Anfernee Cao <anferneemelokc5@gmail.com>,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 0/3] mmc: sunxi: preparation for A523 UHS support
Date: Thu, 26 Nov 2026 19:29:41 +0100
Message-ID: <20261126182944.3136900-1-jernej.skrabec@gmail.com>
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

This series paves the way for SD card UHS-I support on the A523, which
will follow in a later series together with the A523 clock phases,
delay-chain tuning and the PF bank supply switch.

It improves the DMA setup and error reporting, which the UHS-I work
builds upon: a DMA mask matching the shifted IDMA addresses, IDMA
descriptors built from the mapped DMA segments as the DMA API requires,
and CRC errors reported as -EILSEQ instead of -ETIMEDOUT, so the MMC
core can request retuning.

Tested on H3, H6 and H616 SoCs, on multiple boards, including Tanix TX6
and OrangePi Plus2E.

Changes in v2:
- dropped patch 1, applied to mmc fixes
- rebased on mmc next, which now contains the probe error path fix
  the DMA mask patch depended on
- Link to v1: https://lore.kernel.org/r/20261103183030.81078-1-jernej.skrabec@gmail.com

Best regards,
Jernej

Jernej Skrabec (3):
  mmc: sunxi: Set the IDMA DMA mask
  mmc: sunxi: Build IDMA descriptors from mapped SG list
  mmc: sunxi: Distinguish CRC and timeout errors

 drivers/mmc/host/sunxi-mmc.c | 116 +++++++++++++++++++++++------------
 1 file changed, 77 insertions(+), 39 deletions(-)


base-commit: 299ac25f5af7cbba27d80e4eaa8f9c703c96b2dc
-- 
2.43.0

