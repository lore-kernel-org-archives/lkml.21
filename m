Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795754845;
	b=eYSVMtaybOVhaC1wcjKWst6BHRCNkKUZvxWpk2Bdcsv+kLwxgTPfhGOMUCQzWQycgbR9
	 Q8oo20bhl3MbqMR/aWlAJm7nvoGeWYSl7zVg8UV5CKK9bmqLimboM8CcUy506gz85KX9A
	 ZgeQD4ZAEz37cDPg4SSuFk7e+BFMi0Ll3PN2xOIiGzlGLFAsY7/NvTEWJKOJQzYCzFmTN
	 +JipSjCXts8U4XEFCdhgmgEK6MWjklP4W2+Q1R2STnLMUV6yXK0ANwUCiY/0oOa+c0/kC
	 jgTuU14NB7IPmo9ppVe2S+fZjKExjCSyL9usagO1WGFRYDDwJ5L9qSDbAsHW+9zDlsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795754845;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9t2DbkE0vspryX+BIV9Sqh+KsqUVz4iGsjeeoIK/L0A=;
	b=hr3xcKoIn8U5HwmcsqsQd4i5AennJvT6PhrLOqqj/h5sKNlPGznf/bBiKDnNUYr4OxB9
	 DyR/a1YThQ1crZP2VbfqrcwkYOnmasWJhLkqza/1Kws18Uy0bIhPSRRZ3Is9t4C0ROsp5
	 8OvQfJgJKc7uqJBf/6g39250gOgo04mUlw5k9poeIHokfOGvffxN2NsAtNxfgn0vB6kLS
	 1a3uu6BbpSnmBzgoZfAKMaLlCuGTIlMLgoGlar/bxHfsPk+ByBG9YmGX06K1K0v/Orwlm
	 3QDuafOlhvSdTcQrS6Lb9vrqJt1AAMeBrtVnPYUMYLAUqm6K3tTQtwse6+yZLzX+2AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uDgozVT8;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0A4606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:47:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B0A4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uDgozVT8
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-385d8a00598so11234295eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 20:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795754844; x=1796359644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9t2DbkE0vspryX+BIV9Sqh+KsqUVz4iGsjeeoIK/L0A=;
        b=uDgozVT81GzdoBupMhTN1YF9fAIrh0xhQXANC/Gy/yDIKLE8xqYze7Tn1N2EPh8UcI
         2CoINkQMLuD+xorQJ5M/iM0iLdr7A2ng0YQQwv/ByMyYNt2qBFKf3qVEovN41RSj3Gfv
         c6arWW61xtR3WbDt7gfzXBPubPWvD6V9+/CA/ekbfGPsYWUwe874e+UxLh9Alj2xeYKw
         Muv0yGasa9pZIs0C1nlWM+a6sJeppblS6ii7mEL2AX5+eeNC93wci+XpI/XWo1RLQa/a
         9iiaCcWgWQJsshSSvKVF6mhl7zfqThwks4YehQlgaqJLTHFWINaj4qrAOOmFRfV0h4SK
         q/Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795754844; x=1796359644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9t2DbkE0vspryX+BIV9Sqh+KsqUVz4iGsjeeoIK/L0A=;
        b=JGTw/6FNosMWZ5Zi17WZ9YXYtgfm+gq4bXIUsBq8Dfw9yEysZT+TaIGnmZ92PG6f8U
         n3Z14d9Yqv+zWJu57q11/PkAzCPWEUQxTdEq1bIoFPpIb/+luVIcHcPZHPEmIGHStieG
         UKcNaYXOEK+yz3AZW3es16pKdJ28yEm1UPTs5bQoNnLeurEn3YoiX+JR3gHUCa6W1QC1
         vmMtOeZEBZCZazlQ7MX5jg6M9daOUgbUJn6SY3HmGIoDPL5UiYyBLeVWc0TYELNSRJBo
         VBAccYpg2PDOs1clNAdsJLGtwf0k6JG7zKPnLXEkYMBunjDfq22cIHRZSwGj0h6fk5hB
         b+gw==
X-Forwarded-Encrypted: i=1; AL+hErHD17ohvfkEzy1kTT6tz0ub+xuhs27lNsWBxStUqzSaxmHWrJdPC0cRjTA0AU1erAbs8hQ3MdKj91M4sf4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+luuLnRKU6tluq4pMSm0U2+Ufin8rV4FQtF52WUZIM9/KmfzXe
	MJShgRxrqMWIXbX8MNO4JKUCzbVbgqjSCZiBDmLGls3EnC4Eei++7WqZ
X-Gm-Gg: AZFdTZdtKZJnuU1Xh3qVe3aDNb//AYK8yajpRiJDKh567XbbrydRmKyY0syHyYAgHhs
	215JXBRNduhXabg1D6WaYYspuz8/fkNAoyWbV+EeWJZU+M3F3VzhzN8BpRuBh1lDwQednnVN0QB
	MlZ05lDs7A+5wQGdo6u41hYCPa5vW0Y8PyzOD0v9s6n45spOErDH4hkoJEhtoOO5Me6iDlSvVl1
	RpNQ1XL5O6rnZ0onBs2/bth1ByAT9LC1LAfOStiD6E90ycan0azdZ4QnkpXB/2RwbtGXadrcNHJ
	6+uux9EVeXlPyc3ZapShTtUz3Tnqo0JWqaFJbYBKQp0iigMKKtsxu/xmd2OuCetoP5QjRF5q08c
	TUB3Z9z+C/UI3R9M9KNnRVZgH6wUosXAJzHDeMHGNAdTn5HXzw0y7qJyvtTMlAV5Klk7MHDJUA7
	mbJYsOarbXOeULMBYpfsMNIhXvizT5Uje2jRFhIteP+3t68PAgJ1XIFblBqeSuAo4+3rgXWY9ql
	d+BcN1r7op8ybIDmC1ft/ru2uiaCRDe8xTlPdWG3H+a4h3M9ZvFt4sazqk5AF9FLuSzvaFRI59O
	xL9z/0AUYDpAiDZ20iNfpEAeyvVpQsgX0Q==
X-Received: by 2002:a05:693c:41cf:20b0:386:c803:49df with SMTP id 5a478bee46e88-386c803524cmr9151437eec.28.1795754844138;
        Thu, 26 Nov 2026 20:47:24 -0800 (PST)
Received: from archlinux ([114.79.176.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm77084648eec.26.2026.11.26.20.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:47:23 -0800 (PST)
From: Gururaj Naik <gururajnaik166@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Basavaraj Natikar <basavaraj.natikar@amd.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] HID: amd_sfh: Fix MP2 DMA mask and add Dell Inspiron 7405 quirk
Date: Fri, 27 Nov 2026 10:17:15 +0530
Message-ID: <20261127044717.129941-1-gururajnaik166@gmail.com>
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

This two-patch series enables working sensors on the Dell Inspiron 7405
2-in-1 (AMD Ryzen 7 4700U Renoir, PCI ID 1022:15e4 rev 00, BIOS 1.20.0):

1. Restrict coherent/streaming DMA to 32 bits for pre-SFH1.1 MP2 devices
   (mp2_ver < MP2_VER_1_1), avoiding MCE hardware memory corruption faults
   when dmam_alloc_coherent() returns buffers above 4 GiB.
2. Add a dmi_sfh_table[] quirk for "Dell Inc." / "Inspiron 7405 2n1"
   calling mp2_disable_intr so MP2 firmware acknowledges sensor commands.

Both patches are based on hid.git for-next (commit 4a30b295fc34). They
were validated on Arch Linux kernel 7.2.9 using an out-of-tree build
with these two changes: all four advertised sensors (accel_3d, gyro_3d,
magn_3d, and op_idx) enable with DMA addresses below 4 GiB and stream
cleanly via IIO without MCE errors.

Changes in v2:
- Rebased onto hid.git for-next.
- Dropped the HID report routing fix, which is already queued in
  hid.git for-next via for-7.4/amd_sfh.
- Replaced the global intr_disable = false change with a targeted DMI
  quirk in dmi_sfh_table[].
- Scoped the 32-bit DMA mask restriction to pre-SFH1.1 MP2 devices so
  SFH 1.1 and newer remain unchanged.
- Added Fixes tags and corrected patch formatting.

Link: https://lore.kernel.org/linux-input/20261113213533.13139-1-gururajnaik166@gmail.com/ [v1]

Gururaj Naik (2):
  HID: amd_sfh: Limit DMA mask to 32 bits on pre-SFH1.1 MP2
  HID: amd_sfh: Add DMI quirk for Dell Inspiron 7405 2-in-1

 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

-- 
2.56.0

