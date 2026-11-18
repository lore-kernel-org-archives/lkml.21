Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794975238;
	b=AFBtphH4ZEql0iGW2UkvZr3vqQBPv2cWY8v5isdUHE3aWuuALPz5x7y/t7+z4wEU4T7c
	 DYapf0Zp4IecR34tEAn+nMw5ASftfcI4GavS3pTqteUa8163B+67DCaKdeTDdW5XOInx7
	 k9PUZbz/qDS0ZtBq66CoHbHwDABsn6KSDczEdj/cKsx2ubrBV03ZVaNGHToqQsS6Le2+o
	 wVx9RBLHBrz3IsPADlH8ZUWaMN65V6zoAc+YnLUQhXgBjkCtkAzZfy7iqRSL/VoU43Mr5
	 yZjAWfHPquWryU7/92fTYXrk6O3UutCOjqRqkfGkRanGtKUAOX4fcb9NkopKOzzYNlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794975238;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Fu1m7ZEN5/rsF3HjhNuEgJi893J5oEhA5qYrglHCai8=;
	b=HUdYkO/gVFwkSns3xZAscoxiZJ4OIG5U4UDT5AtySt19z/f7MBJjxzqd+KmnoWe2s+eb
	 DWajEbop6AItBVozgG1nnN6BkkhXOarqdgj5xMQFlhsTQhCoH5kn6ukn4MCkTpRV4+PHa
	 tnWUMWrVmSR7ZyeYM3T0ImYdJeGUJqWc5MsHSTDhnmeEVy2rOdYQhiftjCOyP/phs14SJ
	 dvzbWjK/nJE/IkP41xLhWiuJdTfR/RjnJ4nmiEI8+rIqzD0VHn6UaecGavR6n9GsM0Nit
	 2Y6dDE80TGtPVJzqXKFt33Ib0K/JIY/SlleoEbIBaQ4vWMy2zEe+SUGgwH7uXr2W36g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hHzlUa3L;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5495E606A334
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:13:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5495E606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hHzlUa3L
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2efd993e9d6so2195835ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794975237; x=1795580037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fu1m7ZEN5/rsF3HjhNuEgJi893J5oEhA5qYrglHCai8=;
        b=hHzlUa3L8oeFVoRTNRPd3jqxrDytrnAMuKpitUROtse1WA+Pl3Ra/c03SJlC9mrxnb
         ZeGrJTHM4ct9uXLmcR6NuNrizvLVQEAbItCIDoXtVdBdohe7e3WGUBqY20K1ecbPjl+2
         HQeE1p1JNs9jVkZVr4UGGWb+nAeaAC7/WQU4yLNDfmcxjN97IkGBDGOmjuzAV/ZKtQ+n
         w9TnNVX4n2e48KuWahKY2hpM3EcOm+x/hU8Lu+PeZL45joaBfItFaQduz8vJ3/3At8cA
         mUP64ua8GzRtyapA/8C0ET8wWM80K98chEabonISWm6rh2KkjlgadCFdcqOrQ6UxWJS8
         nWNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794975237; x=1795580037;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fu1m7ZEN5/rsF3HjhNuEgJi893J5oEhA5qYrglHCai8=;
        b=y0oaW84/goE01AaJ9x1kY/K+3RrzKDidqn30cYGd0wbqahFQ90GkIt7hDAf06M7Go6
         HjEYrVI6XhwvenM3l1KN06x7kA897TuhTAgVYobn0vdFdAwl+1obilwOMhECx7hp90++
         05UUcfnu7HRhaSY1h7a8r6BKBG0zH7dgD700AmzvNF88Sdz2m5Fo06Owc7G5vKfjmNYJ
         p+3PBwlNTgxg9DkTnpBdMIx/UgNzp1TprEYVrwFcZJL0Q2SaUaklKW+57ql8MGwJdonN
         VAEhGsyZSo7dXqpzbXRNeRAKnfzPJk743OF/YPMttVrxBzAudLz8Xslc04+PUD5d8EU1
         afTQ==
X-Forwarded-Encrypted: i=1; AL+hErHhrLVK++zMWNZaGbdpPSwu706pUd4sXaqF/vLY0pJs2LH0EGUPIm5tD7vW1DLUFPKsS3AMQtQPkGgQkvY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kjkeIDtdHMss5y5uQGSMAtatzIMM4rdFfyMkOdDvI6tNN0rTW
	dTJnlHede1y+pVfGvCW4uqJz8mmpwSr9/6k4U1q3jjWGtsXsUTwJGgwB
X-Gm-Gg: AZFdTZczlJrMANyYJEWM8xvkh/FyCk/LW7KUQ2bQ+V4VBuP0svOf+4t7HFHi1Jtv/hD
	xZhkp0O/D3NjFfgowPWW/KGJSDbKhKdCnV5uKrOX32RxgMv61KSH+4tOrmpBbXx72ijtmxcrK3z
	QnsC0iibc8ZZIJXlh9oIuft4tbJSB2ePrdPeLgU8AELFDIPmYm2mQXA71WqqmnFW+gdEFTqqcPR
	qNv0Jpn8nfsP6cTRF/mfkqhvGbOU8apdjthrZjd9DjnCSa8/CgD+9DHwgnjefd+9WIfolwdDf52
	CHpN7MZaiBCcygem1G2hBVEb1gR2QV51YuP2fuKHFPNuqVQr+fWc8S9MRdxtG4+pu9zZwv2hPvc
	JTkgmFQI2npIGbi2ZtZIkwJriuL6pnswBUf+s7EHpzh2DSBnGlRDLT1VttTNnec14VGAtNHOCHh
	hL3qNA5I8DizqDT9Qzi858RQNWZK6sWx0ZClMfKQteX+klPk/lNjMKrM6Igb2A98XJXfQbXkA8/
	M+ma010bLyz0MCyGelK0sC08HSat2sXEcdEMYbLbT6o28OF1pb+6Xs5fhp6oJBPUYm9McOjJUg6
	pPm/KEz57Ceyd5kOZnVnlQ==
X-Received: by 2002:a17:902:f683:b0:2e9:528c:b9ea with SMTP id d9443c01a7336-2eff72fa3c1mr9708575ad.11.1794975237447;
        Tue, 17 Nov 2026 20:13:57 -0800 (PST)
Received: from gmail.com ([2407:cdc0:d002:0:188:253:12:32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6214f4dsm5728685ad.43.2026.11.17.20.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:13:57 -0800 (PST)
From: Jia Jia <physicalmtea@gmail.com>
To: "Martin K . Petersen" <mkp@kernel.org>,
	Jan Engelhardt <jengelh@inai.de>,
	Hannes Reinecke <hare@suse.de>,
	James Bottomley <James.Bottomley@suse.de>,
	Akinobu Mita <akinobu.mita@gmail.com>
Cc: linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jia Jia <physicalmtea@gmail.com>
Subject: [PATCH v2 0/8] scsi: target: keep command bytes inside the sg
Date: Wed, 18 Nov 2026 12:13:03 +0800
Message-Id: <20261118041311.19011-1-physicalmtea@gmail.com>
X-Mailer: git-send-email 2.34.1
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

This series fixes eight target-core accesses past command-buffer or sg
boundaries. vhost-scsi can supply guest buffers whose sg boundaries do
not coincide with command fields, logical blocks or protection tuples.

Patch 1 builds the COMPARE AND WRITE write sg table from the entries
that contain the write half.

Patch 2 limits each REPORT REFERRALS LBA store to the bytes remaining
in the response buffer.

Patch 3 rejects SET TARGET PORT GROUPS parameter lists that end in a
partial four-byte descriptor.

Patch 4 lets sbc_dif_generate() write an eight-byte protection tuple
split across protection sg entries.

Patch 5 lets sbc_dif_verify() read a tuple split across protection sg
entries and rejects a partial tuple at the end of the list.

Patch 6 limits each CRC update to the bytes available in the current
data sg in both DIF generation and verification.

Patch 7 checks buffer lengths and uses sg copies for the pscsi MODE
SENSE write-protect byte and tape MODE SELECT block descriptor.

Patch 8 makes sbc_dif_verify() advance past an escaped block spanning
multiple data sg entries.

Patches 1, 2, 3 and 7 are independent. The DIF patches 4, 5, 6 and 8 fix
separate bugs and are posted in that order: patch 4 can stand alone,
patch 5 uses its tuple-copy helper, and patch 6 builds on both. Patch 8
covers escaped blocks, which bypass the CRC walk.

Changes in v2:
- Keep data sg advancement before the escape check in patch 5.
- Retain the existing atomic page mappings in the DIF paths.
- Fix escape advancement with the existing cursor loop in patch 8.
- Use the existing sg copy helpers for pscsi mode data in patch 7.
- Correct the Fixes tags in patches 1, 3 and 5.
- Explain why PI generation reads an existing tuple before updating it.
- Shorten the commit descriptions and retain the relevant trace frames.

Jia Jia (8):
  scsi: target: take COMPARE AND WRITE data from the write half
  scsi: target: keep REPORT REFERRALS stores inside the buffer
  scsi: target: reject a short SET TARGET PORT GROUPS list
  scsi: target: copy a DIF insert tuple across prot sgs
  scsi: target: copy a DIF verify tuple across prot sgs
  scsi: target: limit DIF block CRC to each data sg
  scsi: target: keep pscsi mode bytes inside the data sgs
  scsi: target: advance past escaped DIF blocks across data sgs

 drivers/target/target_core_alua.c      |  29 ++-
 drivers/target/target_core_pscsi.c     |  37 ++-
 drivers/target/target_core_sbc.c       | 422 ++++++++++++++++++++++-----------
 drivers/target/target_core_transport.c |  11 +-
 4 files changed, 338 insertions(+), 161 deletions(-)
