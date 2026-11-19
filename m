Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795048429;
	b=uu938qn+iF78dcDEuy8Q7gfeWGtsZXQQR8jjxB0XAoX9ywc6PXkcNX1ht4gRDWBgkgTb
	 6DHVWETsev7uQKcuymV9lO5VGdsZ5wQuapoG0dsSAuO64Q+eMdv9qjTwuORSsGgG89yrB
	 EkuPjRagEbFkNlZTzWmLaKDifpGebeH97JmXw2CU8UhF8HHIdsCJ07cB7fwCM6HMBZ2Cv
	 Fl3WPSGnH5FC611WViVbJlAoXZxGgAVpJvEiYX1ttvYqxoyx9GpKZgHRxJPzHdX8qkIuG
	 ABIwgajOSy+I8nfJKOl6qEP75dxpCGVG9gCeCx4dqQLK+SJAOrtvi7axz+GUawIsKuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795048429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=P81WPXJmA8egwXU9Dmn1Codsx2X71Blt1Qj5CaLpdJ4=;
	b=4E6e1h34w6BK39BFf496bDLSrGU7rQ5H8LkyP4WmGb/BgPewkfgdUBxf/Dxxb7jUTejA
	 9xvXEL2CcBn6PbA/iEQXfy6f5feVQvdyAoTAz1NaN6vBaIPuDPTqxfRg/iKKyJq2JZcXY
	 wHMltAeznM9e5MZH1iPal1mV9+iCUSLc65aIYZeICTc/lqfnOBP5k+i3qmUwOV0JvpsP7
	 I7+E3O0rYDRQ6FPjwfZLXGP47xuxRV5kQFzGmtqUzrlH4Mrr/uFRRao7AVmdpTSxjl9z8
	 iDSCh+WvqcQFW0n8p6AlvTYgsh1h7AWwXB5T3uU1MoC5j1TWSqd4FC2j1dWH1YXh5rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I4+l74D3;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B230606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:33:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B230606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I4+l74D3
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8b68e59ab33so1284323b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795048429; x=1795653229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P81WPXJmA8egwXU9Dmn1Codsx2X71Blt1Qj5CaLpdJ4=;
        b=I4+l74D3JqeHKDiZDmgA6lOAN8ebrJrL6BeJWSj67UxIfqZyLYnmJ0OOOg/fLEbwQx
         07CVizwSGQc/CvlqLDqZVh+AJPc9MTJ53zjq0MK3QrqNtEpLsLCY2LDqKl4LqrZx/+6X
         43wuyas2GJoJgXrEzNjUW7vfUgknxiYOlvHGs8+H9h+jS7F7ih9Ux3p0tmBgQBuTDK8A
         wWw4wjX9/fg9jT6sect00nTtvL4KstE5AlkpQvpsWJYSXLhS9KtQg9CKr0LPgz9m5JIM
         LkcMysQ4I7saR0AXWLNtn88uFXEpevILrNF6YZ0OpXClfgJ+mrCxhIUKGhb3B6T8GJtT
         /4PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795048429; x=1795653229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P81WPXJmA8egwXU9Dmn1Codsx2X71Blt1Qj5CaLpdJ4=;
        b=NakWA1yM65p3QBYxS2NYsIouYrcNyoUwVD0oBSmLG0EAP60GgkBobPBd5Nc7wXeDnO
         Qi/79bzCfjbeZqiYeNemyeYIMJvUOe6AmHs0oqn0qTN/Qn754uPDodZggrnShE6C63dT
         AEMXfi4O0O2nqeh/8uN+gUdH7lagD3fw/eBwUfe7UDfDmSW30VX9kjpFY9hdlrpd17a9
         DJnh3Sp7YoCDeBdMYEjDh0iA8Js6XoTwo9jvrSkUK+RR/yxBBj6TNBDoKuLx9rwlAWsY
         9NBaj9sBcCvGYXETfeetrEzW/JoHaMkDHlGDwfmSTyIvk6h8IDLhNL/ddk4H3kiU7GwR
         IvtQ==
X-Forwarded-Encrypted: i=1; AL+hErFDf4YxZcoKHXyxoCtN8NWBinSKGAyuMID6/MiW5D5yHOMRPrudB9SJxm/yFUnKn+vHxCuCvZSlMNQV9lc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xkEQ8Uw3+g6Xz3DiHOhDJZeARGaBX7fz/9PDr1xXufWgArIJ/
	Mgcgk3vu0Gb2FTdZbhri5AMd4ItYc1iArWf42Hw81kFIAA1t8TLXkaz3
X-Gm-Gg: AYBFou3s9Ep9ZinsE4dx/CsMNuES4FPvSjwC0ZXouVJ4976I/iAzBSzQv2n3j5pi2rs
	MbaSZD9pIT7KqUDCwfEKRg7SUeoKatuc/cv7lGfUJDLTvPvJ5ehHD0QmqhMQJdwjfeYv2UqhLh+
	YdxtzJXw0l+XAH36uaVCNn0mKbvpEPSZKPsKiBFQdUMahRMQx6VxcHyYvlbbGpEHAoS1xbs/GUG
	2VTLahekMoZ0MRQGy16xKHNDOGohoMctw7fIdjj5a6cyZDdaqJ0DUAv9c52YHYiJ9V7B1+4DHWP
	787DXtcDkS57thcmd1SzNzjN9TCr3aeXRZx1mU8N9SZFKxBpwXWTQi9SWu4D9uGWYnUS7optyNp
	IKX6SmhhDoR+bQ9Cd4pMwnzlREQvB/8ZKErVsB1dzP6xkqQJ4nm9bEYDl04Lp3YYPbYSR2Jnwh1
	fuoirfZIODE55SYsITXfq7yMrwaRT+Ixy/nXlHevTcxGXp+2mcEfrTAF+l4GV/b9Rd3+XRBgrTH
	75HkrkDPx8fMiy1TiixgsVq4OFLf+AFbdPIOpzoVXYUbhIjBmqUol5iqn2ZwO1cVsmKL9t8sKPM
	Tz3SSeXk3Yj0VAOlj55zjGsN
X-Received: by 2002:a05:6a00:339b:b0:89f:3053:9ac1 with SMTP id d2e1a72fcca58-8c5d324b710mr3874029b3a.17.1795048428503;
        Wed, 18 Nov 2026 16:33:48 -0800 (PST)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5c7f99f91sm1906491b3a.5.2026.11.18.16.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:33:47 -0800 (PST)
From: Cen Zhang <zzzccc427@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v5 0/4] Bluetooth: SMP: Serialize root channel updates
Date: Thu, 19 Nov 2026 08:33:39 +0800
Message-Id: <pm-bluetooth-objects-candidate-0184-v12-e80229724d6ad14ca88c-0@gmail.com>
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

I used Codex (OpenAI) to help write these patches.

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
Changes in v5:
- Move the AI assistance disclosure to plain text in the cover letter.

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
Link to v4: https://lore.kernel.org/r/pm-bluetooth-objects-candidate-0184-v11-900043ed2303656c76fe-0@gmail.com
