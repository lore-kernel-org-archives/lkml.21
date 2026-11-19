Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795048374;
	b=0iZbOVDHHsc/DXW1CCVXjE1L5ymYqBe7/ySYjqvg/NN24PK+6ZvrEMBXP8UtvCiueco2
	 FgO8J5uAHcctEaDCMeMQ/VTwnZYltusAGGd6jZXY3bMaVBgBMTymQ4XYmwXIpci9eBs0C
	 GBCSCdfifeSn45XjM/qm2ia6O1axKGa4bwSSSYE0TWCA+3SM53YDcHf4nqAKasaJJhcmC
	 6UwSN4A62WTSzzkQy7wRXPKcdgAH9NSeeUwQ69SsdZhvN9rEdE+RC78+zR8Dr5ZkRlJCl
	 fIaga+ClLFM7TGXKcVnbKDYS+YR7HE0lSbzW+kr/ePEb9nRSem5uqj5SNLxR+1ro9mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795048374;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HnRk3fx7u+jQY8R+1pp+cMuEBmrZFokwGNCM6chCNnE=;
	b=hss0iZb2XnQaltsrAPo/k3p09L0bChEUCrp0G1vw/9MN7jMHa4MkEa7kXWjyvau6Kujd
	 qe7M7u70rlkZGHLrOlZMp1IEAs3tqebImBE5HEQ+ocYaG6ThBVMRBng1g92616uFckArM
	 OTVwcMaq6ycdG4nzyXgBkwAi3NK4sK44W9YNuRRnpJK/5u5vVnCKPxjNOSsj1AS9DLSW8
	 oA3539h3NndFiwsdGU4Miyk7wjHvv6GasYnRzEZ6dWq9EWIZYsHNBRk82GMm/8a/Rjvys
	 T0MiSLHsMsBk6M0KxP6+IOLFY9Uxpj2EKYevNDZDsdH9TEBD/R9i1w7YjYK3mB3f0JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OnEZLQvm;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0ABC606A33D
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:32:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0ABC606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OnEZLQvm
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8a60f90a924so802798b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795048373; x=1795653173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HnRk3fx7u+jQY8R+1pp+cMuEBmrZFokwGNCM6chCNnE=;
        b=OnEZLQvmypkXI0fCPVOTYeVsYe04BE/wZwfijxBKm+wf1XTpsWoFLSKyn1/ECm9RIm
         74s8mPa+jbznMVZnl+MXtFrnPBozlh0sslG/hB8csWVv1e7metma2CCxtnkA+a3IXxTe
         kEVIqFsqexO1tep/NN0wCuNj2zDI/aBDiRRIBUCXFBpMz5reJ4/z3SClxaZ0opV6/uLT
         CAPXSxGIVG1KskfhzRv2mhZdkxLlAoMgvKalYm3b1JQ/ZrZg2E/FFVyNoSf6ltwVolyz
         YY94U2woXU6syO7BzHGFt2AtxrMWcfPmMntPz5SlBqSNyrxfvmKNDXmTqwS+Q8RKdpWd
         u1eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795048373; x=1795653173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HnRk3fx7u+jQY8R+1pp+cMuEBmrZFokwGNCM6chCNnE=;
        b=ejb8a96G/W4Q5iEdMXjzAJj0fWwtEXDRew07FZInTlSkvYbB0b64IqHo77Em7V8dgS
         RYHxwQp637I2dP2scfpqPc0pFKa13STSJmv1tzDQY7kYzb7MH6u0hR2EkQR7rTp6xoo6
         +MmAj0lXbU2CiQScwI3aGiu/qqvHvGq9O6kVRxoOxqi5ktsUb5z1ZE7r9L6tCClF4W+u
         1ZgMrQttmtt1TnnLvtQRF+bymEBBZbsf1210O3iUpJ2C189501EWm+srflIpKGwsKvLX
         qNkgKO6dCj3gP2RT0LdEoKfoUwL21GswzcA23EqCwd9sNqGgCkY+bTYLDwz++1xiJgB5
         mJQw==
X-Forwarded-Encrypted: i=1; AL+hErFCrDmoRv6A2omSii9BH3u5GQwXt6Hg0RjQYUUV4/ssH9D9twHQxCmxnQlInkuZ5guSOD6Kqm6+hp6vcmc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XHe6OsDAr2odMBMAsCwtRd8HVWMoOW8inLzjrxUj3Efn3zbgu
	2C5sqb3Qt7sfkwIRNtzPmXeRrYmOvEYT5O28T4DQqaMhQHfeGqgTfH9/
X-Gm-Gg: AYBFou2O2I1sXMcMk2MzcR8ztkjoIZuFjdnkTHx6y2Rd9o+wflDbO7Zf5lv7xG0W9II
	9HxHoW0DuJTLkJWR4Aa2PbipMiAEfIjntEEj78H5tJhu8dYm+++SBhhKPh3lDvwaJEWthsPD9K5
	MJPxT7sqgooiYDOYLAFK8pbMOBr4vAcMwTFwdJHFIw0RiAYIGdu+qzM3WW0TrWkhJxY9zX0qImL
	qe/Dd8OFrsbj1MG8SOXl5p9JfJdxxK5sE4G/eCUA9X3CQjFdekKYy5FvHStJ4DFr5NxIWlcrz6+
	kDVpeUv8UGTpvk1zXxR1hXrTvmEoyxXeCX5kQMWnhTLUOSUZIdLD20xtKhOZsmk9Pw8Qw2g8Hii
	1RDBrVofpP8eaTpn+nn83X6ERdmXaUsEJsuDbVmpkr+PTaU49fncoCngcPoecs+gIjNKgh5dHTj
	ZG+rBVw+saV7IJ6RAF+Zr0JRUPp1AOCZJaYevinzJTlmFtCcEEfKnSJPmUt2NlkUEvQ6J1UwwxH
	O9H1Y0QBOFKDwiELofunyTVzTR/3nnXaFV6YnAAn2LcbiIoWtgjYRY77kjp20i+czVhS/8OXgDI
	WrflgRKBoo31QURoiaN7cpm1rg==
X-Received: by 2002:a05:6a21:71c1:b0:3f9:bfa2:6067 with SMTP id adf61e73a8af0-3fe970faf9fmr3662178637.21.1795048373034;
        Wed, 18 Nov 2026 16:32:53 -0800 (PST)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cba3313dsm1975051b3a.53.2026.11.18.16.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:32:52 -0800 (PST)
From: Cen Zhang <zzzccc427@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v2 0/2] Bluetooth: Fix advertising instance accesses without hdev->lock
Date: Thu, 19 Nov 2026 08:32:44 +0800
Message-Id: <pm-bluetooth-objects-candidate-0245-v14-e37270232af59a877004-0@gmail.com>
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

Snapshot advertising instance data under hdev->lock and keep instance
numbers, rather than list pointers, while waiting for controller commands
(patch 1). The resume and power-on walks use a 255-byte stack array in
list order, covering every nonzero u8 instance ID without an allocation
failure after the pause state has been consumed. Widen the timeout
conversion before converting to 10 ms units and clamp to U16_MAX.

Translate management instance numbers to controller handles in the
remaining periodic advertising, BIG creation and advertising set
transfer commands. For the shared handle 0, update the intended instance
after the command succeeds, since the completion has no instance number
(patch 2). The remove-set and random-address paths have already been
fixed in the current tree and keep those implementations.

The former patch 2, "Bluetooth: hci_core: Initialize advertising RPA work
only once", is already applied upstream and is not included again.

Validation: GCC modular and Clang built-in Bluetooth builds, including
Clang context analysis; every prefix of both revised series and their
combined tree build on bluetooth-next f42f5cae154b.
No new kernel runtime test was run; the quoted report is from the earlier
instrumented test kernel.

I used Codex (OpenAI) to help write these patches.

Cen Zhang (2):
  Bluetooth: hci_sync: Fix remaining advertising instance UAFs
  Bluetooth: hci_sync: Use controller handles for periodic advertising

 net/bluetooth/hci_sync.c | 343 ++++++++++++++++++++++++++++++---------
 net/bluetooth/mgmt.c     |  34 +++-
 2 files changed, 292 insertions(+), 85 deletions(-)

---
Changes in v2:
- Address the advertising snapshot allocation and timeout/handle concerns
  raised by Sashiko:
  https://netdev-ai.bots.linux.dev/sashiko/#/patchset/pm-bluetooth-objects-candidate-0245-v9-6b34bc036455ad3dd4ea-0%40gmail.com
- Use a 255-byte stack array in list order, and widen and clamp the duration
  conversion.
- Add a separate periodic/BIG/transfer handle mapping fix; retain the
  remove-set and random-address fixes already in next.
- Drop the former patch 2, Initialize advertising RPA work only once,
  because it is already applied upstream.
- Rebase onto bluetooth-next f42f5cae154b; preserve the connection-work
  shutdown changes.

Link to v1: https://lore.kernel.org/r/pm-bluetooth-objects-candidate-0245-v9-6b34bc036455ad3dd4ea-0@gmail.com
