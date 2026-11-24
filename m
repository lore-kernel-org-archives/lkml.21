Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795529432;
	b=yNSahxlvM+N/12VKvbWhPecbusDibSDOzek2xv0h6fO31QomEneXNMHJCm2RQLhN8xxl
	 Bxc4XTPz+QAB7hUjQu6Z3XjyNTZPS2V7e1yhxV7yQhKZ4i3ohi0qiWrM5nvpz5/akefyD
	 tNU9y6O9RHX8wpRxEJcOj78YAdgTzLdfduEKwjq4gPwBicxVn+2eQNWTyyxB+Y8RWOdYp
	 /oqidueMJLsmOEbSqoGH1gksDXst4Ar2HhbgTRkmOcLSWOQ+OxdJ7FK/wle3cN5cN9hnK
	 oSb4w+NNSwEvTQqyqcYOfCuE5jk8n5AAmtQVU3paIni0OtHKlvD7N7Qfm4UnrsVsdAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795529432;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jXiPVtfN2wZl1+H6KM7aKPWRvFLxQP41vzviKryy7aM=;
	b=n7Jn1nQGWRr9kCeXzdhigvmGrlFiZ4xOtqbwDqGfkVg8r904QZPc+UaQ6G6+DhBee+Pq
	 hMpE/WBu5HC/++hpt8CFWP5p8cdbFBJKsvHoYMb93lEbzVsQgOzL+x9KA5mmpMaENcM51
	 ZkhfCscAvX6B2n5OiqTOL3a2HKjMpcTihv5bPOfD0DTUBxbw6b3uEBs4bmwlHn2rvA72A
	 Xn8Hu7k8cgr3hZnnvLe+RhYynuvUcuv9jy7vAFRZ+WAjnml/K2h86Vz2JnpYOcXI1/l+R
	 KpumL8sxPWklawfmAZvl7C4WZdgM0t/DEhV6P3FarD5a1fnA0niGyK2WufR5rtF6jVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B9cOdsCf;
	arc=none smtp.remote-ip=209.85.222.41
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7EA606B033
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:10:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB7EA606B033
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B9cOdsCf
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-9905d61449cso1186450241.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795529431; x=1796134231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jXiPVtfN2wZl1+H6KM7aKPWRvFLxQP41vzviKryy7aM=;
        b=B9cOdsCfRSm/kHBVHQzvDZZF/z2RrcH2FFKfpsj/vjD+Terp7WV3aMU4fYavvSdty2
         +DfuMEiqNsVK3QErFBhvOWY6gPu0rMGwMdpc+OBca16yQnDzoF3rtADwW64d2+HTDYbn
         9lcAu1EEZ/4BhGNFidq36l/XsWiVYGWDUxI6nXvdI0pBLWsovczeWdW5yu/3ybCpre3q
         XdYPXaixauQ9TCHlVQ3CvEnE2FHYNH50FqFh2T9wq85/vgt/WMnDnW/ZyUhM+aBH//wb
         bOJjrA7aedUkkWYf3xaF5yiJ94ZkfqLf+nkzQ2Tn9i2mSKL8VuoiKXOmjihuQS5Jo8y8
         fSyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795529431; x=1796134231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jXiPVtfN2wZl1+H6KM7aKPWRvFLxQP41vzviKryy7aM=;
        b=d07fJW/ZWNHJ0ERzXpw2TAzK/Rf3OZZzfACh25NO1ZDunGqrsJBkTvvIpX5iq8nar6
         16sy7HuE5b5CBmrqj/HGCOPQvoXytdMJTvmYikvMvCQW9fx0sF9WqD0bMqbqOTapuIGb
         nD//190qdWkhSZ4+a+jlCk78+qGNZe7Cp4ScaBI7m5+d70jc1VD2Ds2A+8QgceNU+Rbs
         UmrINjG/KPtzNQVMio1x2z2MOnB7fdgr2WE1oq/Wu2hTyMSwnzGrL2WAMSGKr9Axfrmk
         ZM6Dw2lIPHVghpurhMRahIepQG0uEcuaB9iE5HPMNBPeQ56qftzT87snPFbOQ7tttoH/
         7VDQ==
X-Forwarded-Encrypted: i=1; AL+hErE8ri7sjB8D/aA8Kxz4mwSH6RoKnRRzmBiOP6brE0sNWguwV8EtSxJQ45YV9ngfD0Mu7OekU1Lxok/eGtA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Rv26NINctVa/JjChQGP53Pk7M0epBDtoXVo+xyLIHbQVLWC5a
	2jsqr9QgSY0e7p8PKgTqGj6VDaKKq9wIldOw2IyAoWxxkFycEXpXkgss
X-Gm-Gg: AZFdTZdisb7BDKBFNcCIiSq7RKvEusIxLidsuZYQWiFyCphJ8oyJkvhrHsX1rYXCo4C
	/qa5TvEeYtgnyBxXXCvmwI6UUrY4BG+ROiAzudsXxickAJpJ4LVm1dZVohZ5Q8jPPGgNtSe4ssA
	BUSxTQ9rVbcXD9e1GHbDptqwmWn4Jy9eMsm0xlcd1i7BgYc+53C3AY2PR84hwVLdh+3FQWXx/Oh
	CXUwsV30Vz6p8RiKmdluHfecSkZ37ZQPvCixzHme5WeVwTP/XB3nlNMD2eqI3ii8cQXJApN+aUN
	ZtOmMTtVvHszl96KzhyBY3WY5/BNzvT+csaHb6PBBHBaf/JkhXKIXhk9fedN3W32nyF9xThtwa5
	0mWDHrYh/cXe32x3kGS5dcFOLEx/1YDdcjFxdPjkq86bEWpy3AjhuighF60Rh2EFmM6Q/yjNc4L
	LHd8kZXDJIPNLm3DlaNlqYaVFbtwvZpK63dlXqWdegpILsxIPV3iGwzlFBj4sjW6V8WHfBbEtKl
	KXGbPrYf87oXOBZM5LjPU+WyNL1aAZAaJ5fjhwuh1GsA4yKwa81ZllJdcvOgd4Ue3eg67t6dTDz
	H14kj0tbU3yhKXB4nDNqHmb/YXo2pbjF
X-Received: by 2002:a05:6122:628b:b0:5ec:e6b8:eb94 with SMTP id 71dfb90a1353d-5ee8aefcf60mr8116807e0c.12.1795529430568;
        Tue, 24 Nov 2026 06:10:30 -0800 (PST)
Received: from shine.local ([168.196.221.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee8b555137sm14056121e0c.3.2026.11.24.06.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:10:30 -0800 (PST)
From: "Andrei A. Bykov" <andreiab9019@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Bluetooth: fix bonded LE peripheral reconnect completion and holds
Date: Tue, 24 Nov 2026 11:09:54 -0300
Message-ID: <20261124140956.15296-1-andreiab9019@gmail.com>
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

This series fixes two interactions seen when reconnecting a bonded Windows
central to an LE HID peripheral on an Intel AX210 with BlueZ 5.88.

The first patch preserves a synchronous terminal-event waiter across an
unrelated command reply and refreshes that waiter for the next synchronous
command after timeout or cancellation. The second keeps LE discovery hold
ownership in its completion callback and handles both encryption and key
refresh setup paths, including failed setup followed by a late event.

Changes since v1, following the public Sashiko report:
- Refresh the saved request from a callback-bearing synchronous command,
  including after timeout or cancellation; retain Reset resend ownership.
- Handle the BT_CONFIG key-refresh path through hci_encrypt_cfm().
- Explicitly abort failed LE setup and prevent later feature events from
  announcing that aborting connection as successfully connected.
- Rebase onto the official Bluetooth master at 4fe38719e673, rather than
  the GitHub workflow branch used for v1.

Local extracted-function tests pass 152 dispatch and 62 lifetime checks
with GCC, Clang and ASan/UBSan. Both the unpatched tree and v1 fail the
new regression cases. These checks model kernel services and do not
exercise concurrent workqueues or a physical controller.

A full kernel and modules build of this revision on the official base
completed successfully; that upstream build was not boot-tested.

I also tested a backport to Linux 7.3.5 with the same configuration used
for v1 and upstream prerequisite f3183d7ad101 (Bluetooth: hci_sync: Drop
the command's sk reference), already present in the series base. Repeated
bonded reconnects, approximately seven hours without observed connection
loss, and disabling/re-enabling Bluetooth on Windows passed.

A hardware trace confirms encryption can complete before remote features
without prematurely completing the feature waiter. The short HID test
sent 48 reports. In a teardown run with 20 seconds of post-exit recording,
Disconnection Complete arrived 137 ms after Disconnect, with no observed
command or connection timeout. One earlier teardown wait of about two
seconds was not reproduced; its cause and relation to this series remain
unconfirmed.

Windows suspend/resume remains a limitation: in two attempts BlueZ
reported a connection while the test HID application continued waiting
for the notification subscription. I have not localized this to the peer,
BlueZ, the application or the kernel; this series does not claim to
resolve that scenario.

OpenAI Codex assisted with the analysis, patch preparation and tests.
Sashiko supplied the review findings addressed by this revision.

v1: https://lore.kernel.org/r/20261121033104.441146-1-andreiab9019@gmail.com
Review: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261121033104.441146-1-andreiab9019%40gmail.com

Andrei A. Bykov (2):
  Bluetooth: hci_sync: keep unrelated replies away from event waiters
  Bluetooth: hci_core: preserve LE feature holds across encryption
    events

 include/net/bluetooth/hci_core.h |  9 +++++++-
 net/bluetooth/hci_core.c         | 16 +++++++++++++-
 net/bluetooth/hci_event.c        | 36 +++++++++++++++++++++++++-------
 3 files changed, 52 insertions(+), 9 deletions(-)


base-commit: 4fe38719e6738feaa90486e36b0790dd5d960a96
-- 
2.56.1

