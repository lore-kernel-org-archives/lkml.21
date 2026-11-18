Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794975711;
	b=aumIKpnEBOVgZrJIOcQv1fZfs6RMYdhSOr8aflzSiWN4B8lwRza+XD7TxxIXeHgjhFLK
	 ++pdPGZTadbROQhUQkzf/f2/3JcDNleE/hyEM2XDTXanxsVoYgbjFENlSLJnEVo1HHwpN
	 vl3wS/aocVMJjZ/4MMc+SBi62kjJ4j3a0YMrCKGjXI0p1juzbVRDw2ytEnoJSnJiFL2Tj
	 9WRSBrIoElzdDh52qHDm/NEnQQ0t6Cfc5+JOsA0EgfnC5v+a06lnEDWfMR1is3Gh1Xr6k
	 IHFdu7S4lj1carh7Ufx4hWeovEP2r1/KUL/ZHTW7wMg0t78N+QBXqBZMVjuLFaPzFfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794975711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EgWW/8tTggMrSKDZfyyG8vdUOL5ZUz6+50xvEDNKnOE=;
	b=2Xfs2//xCZSgaIAbd85DUnkjl7g0oS/jnyZk5tVojfbYC2vHWuiOXyf9EkpW9AAxyEe3
	 Ibu9l/E/HpfgnGTe3s6LDKJeOaEm6Ui9Rh5bYDmStAw3FV57Jf4xuCBc+YHS1fvHxzTPf
	 +fFFJjh/sjUZ0p+D2gu3tmDpQmmf2EK+k80a2OQkTmlZaQKPBGpCmTcsSLLuvUmBqtApn
	 B2DJLrWI17c7j5aZY3RlQG1MrbvqnQEvL4DH5BPkfEmPH1hL8Z1AsolDmf9ag/wEt4HCQ
	 PFbNbZzSQMaDB4lFC6idRuhPRfpW2ZbMbetWwboEg9RM69vaa8pwiK3syf4FiC6FtXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gA4NZHpr;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316C6606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:21:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 316C6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gA4NZHpr
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8a06cc097c7so411315b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794975710; x=1795580510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EgWW/8tTggMrSKDZfyyG8vdUOL5ZUz6+50xvEDNKnOE=;
        b=gA4NZHprEeYkTP/6D69vqa8UNiJAMv9duN4yD+EivK0VhX/LapyjkM7e6RB0PE3bEr
         4JfdsFLXmwrk/UDnbnmvwwxO8MeewAcx2bSLGpTriTKCqm8Uv4J1UB1uiNuEHkFYnJNE
         VLAPRyGxJsEijKzKY/RaB0y+zWeoqjXC2x7h3MZ+REqV01erU9eeoXANWFfpbqtdaCj2
         4O7KUAT5L2sA/0LjoSyk30KVo6ohkobBxic4+eOMw4BsAwJxLYQCzOOh4XsQPGw5GOQk
         4MaeHqMwL6Q1C5806JZzmyyQ/v1J0TTnzJAGekuqPhoRA78Mt87/VinpPZxIgFz2v1A9
         91pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794975710; x=1795580510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EgWW/8tTggMrSKDZfyyG8vdUOL5ZUz6+50xvEDNKnOE=;
        b=CNafi1iaxDrd6MfHL1nGfcv/oOe2t1EgqYzTA7FXj+npM3k9K9uxv11n66DM/Qw82I
         nBg6MlqJi/6jmW2n2y3Iy3ZxJ+ukFrktVTG0VS/Y9nM7hnzcMUWUOyFpgREQhkwQTtoz
         1SueL+SvBuK62fWRrGOW4n/ujAU9n3KRfYvwHbkxFoRo+kvOab+5s7KUmLJAx+k1vgKK
         pPh0thlr27q7kt9gy+SF7mq8JbN4haJ/fyZqdtCMLPmHIGTYtK5vJBvUxhXnU/luBk7Z
         1YLFSRw75RiDSm3iaOxY0gxNUD8I8oW8Mt0rCffztJ3YTwR3FqGNA2fenaycSQf4k7V3
         2r7g==
X-Forwarded-Encrypted: i=1; AL+hErH0JFzyqZNdrABHKDtat+Hc/5KglZ0eeLXYgGDWFSoPjXAhRfLSDSMkZcsmxIl4mT4LTlmoBA0UHebGMFg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EC9EsZw+l47S4dPNCknREbTgrja70JxRu1LUwk548F7w72cGN
	mfrP3POYStBfew5ip4i0t7bLtsTOSIHQuKpGG7B/w0Cp3nn/uCn+nAVP
X-Gm-Gg: AYBFou1Q2zlmUZY0R006YyC5ebHZ0P00QnVlnHsW1VrpqM0OSUzCsVpNDCQdKWIirft
	nNhMAJeDrrN8mByZXSTQ57g/aAsOzRl9a7/6MXnU6yY1NVpLE1cwT5eVfGXjmfG1f2iv2qw5IH7
	L2MN0TzK7b+mmieVUT0i4GdLUUjyS3YIOEhQDXXUedl8U1wyyEaPXK8DJ62X446xp0hrR+VGauU
	0SCYsFqsaimeSnxRdfDyCG1HS0mOx+Lrv7LBSXFiN5FVI98WfdSWRo/gGWufhYqiWG90bZBTP5J
	LcCqxuIj8PLTPGv3FHuIYJYPF5acdY5HeAjY9tLLS8+wOOUccGtANVXq2Jg3owh3o9f0C+qtmKf
	Q46fV5/R9JiQ3Q/JL3SRF1kp9FXSR0sxJpY75NNEEKmRb8AcYeUtJMWzfE2BIVnXA8HCoR0Emiy
	tea8iqDBZarVxM+SuQdMQVVY1KcqUa3Tt/vRu2/jKHjds50RRwlGX/IqaCbIqaEtBY2yvfQPo4W
	UJIKPmWiI0813akk/7LM04gBd5T7C+TUC/rEoEkztgxJOilm26w39rKIjpPSonzdTR/4wIV4rCb
	MAb47ZGd2Oh/2+W8YmFxHlM48TaXuLjntNfnMdbtYq0GDw==
X-Received: by 2002:a05:6a00:22d2:b0:880:b709:cefb with SMTP id d2e1a72fcca58-8c5d4cbd63dmr1158086b3a.45.1794975710241;
        Tue, 17 Nov 2026 20:21:50 -0800 (PST)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5ca7aaa8dsm455003b3a.10.2026.11.17.20.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:21:49 -0800 (PST)
From: Cen Zhang <zzzccc427@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v4 0/4] Bluetooth: SMP: Serialize root channel updates
Date: Wed, 18 Nov 2026 12:21:34 +0800
Message-Id: <pm-bluetooth-objects-candidate-0184-v11-900043ed2303656c76fe-0@gmail.com>
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

SMP root changes must serialize with their users. Publish BT_LISTEN only
after the root is initialized, under the global channel list lock,
so another controller with the same address cannot select a
partially initialized root (patch 1).

The force_bredr_smp writer takes hdev->lock and changes only its flag
while the controller is down (patch 2). Power-on holds the request lock
for its auto-off update (patch 3). Registration then runs on the ordered
HCI workqueue under hdev->lock (patch 4), excluding both HCI event users
and SMP receive callbacks from root replacement. Patch 4 depends on
patch 3. Patch 2's exclusion from power-on also needs patch 4.

The old mgmt_powered() called smp_register() synchronously under the
device mutex before submitting the HCI update. It did not run in the
receive worker. SMP receive callbacks began using root-owned OOB data in
March 2015, before the synchronous HCI update conversion that November.
The shared root transform use was added in September 2018. Patch 4
corrects that history and tags the earlier root-data access as well.

The WARN_ON() for replacing an already registered root remains. The
separate HCI_CONFIG auto-off shortcut issue mentioned in the review
also predates this series and is outside these root lifetime changes.

Validation: GCC modular and Clang built-in Bluetooth builds, including
Clang context analysis; every prefix and the combined tree with the six
new Bluetooth series build successfully. No new kernel runtime test was
run; the quoted reports are from the earlier instrumented test kernels.

Cen Zhang (4):
  Bluetooth: SMP: Publish root channels after initialization
  Bluetooth: SMP: Serialize forced BR/EDR channel changes
  Bluetooth: hci_core: Hold the request lock for the power-on update
  Bluetooth: SMP: Serialize root channel replacement

 include/net/bluetooth/l2cap.h |  1 +
 net/bluetooth/hci_core.c      |  3 +++
 net/bluetooth/hci_debugfs.c   |  2 ++
 net/bluetooth/l2cap_core.c    |  8 ++++++
 net/bluetooth/smp.c           | 46 ++++++++++++++++++++++++++++++++---
 net/bluetooth/smp.h           |  3 ++-
 6 files changed, 59 insertions(+), 4 deletions(-)

---
Changes in v4:
- Address the cross-controller root publication and powered-off debugfs
  concerns raised by Sashiko:
  https://netdev-ai.bots.linux.dev/sashiko/#/patchset/pm-bluetooth-objects-candidate-0184-v9-4094fa28af7bd56a283a-0%40gmail.com
- Publish fixed roots only after initialization under chan_list_lock, and
  change only the force flag while HCI_UP is clear.
- Correct the registration history and early root-data Fixes reference;
  state the dependency between debugfs and power-on serialization.

Changes in v3:
- Address the hci_power_on() path that reaches smp_register() without the
  request lock, raised by Sashiko: https://sashiko.dev/#/patchset/99158
- Add patch 2, which takes the request lock in hci_power_on() again, and
  correct the locking description of patch 3; the code of patches 1 and 3 is
  unchanged.

Changes in v2:
- Address the CheckPatch and GitLint long-line failures reported by the
  Bluetooth CI: https://patchwork.kernel.org/series/1197223/
- Trim the crash reports in both commit messages to the headline, call trace
  and allocation/free stacks; no code changes.

Link to v1: https://lore.kernel.org/r/pm-bluetooth-objects-candidate-0184-v7-c26e53b52c260063ab6a-0@gmail.com
Link to v2: https://lore.kernel.org/r/pm-bluetooth-objects-candidate-0184-v8-60106ad0c49170f5bfb4-0@gmail.com
Link to v3: https://lore.kernel.org/r/pm-bluetooth-objects-candidate-0184-v9-4094fa28af7bd56a283a-0@gmail.com
