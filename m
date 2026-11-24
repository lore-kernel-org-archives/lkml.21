Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3B2606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 00:59:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E3B2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bILxebaV
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b413f6dda6so417789a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795481979; x=1796086779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U0AbLqC+dvvuaTRdzZr1WjUTeIhbYCsIpiF/j04HU2I=;
        b=bILxebaVtlyYdqQbI4UTdZVMnoS0L9AGiAKZefVN45MPa9vrQeIAk0eOsABlXYUAaS
         75vsFmZYzSRxMvZRYTvJHFNzazPsMgw0V+SaJ4O/1SfDiu5/LgJBTEvdoyMAE1FQPQWP
         sefTxSOOOT9iIq4dAQe2Z/xJPAzHc8kpEhVGsVpE/jyeJ++KSpoB04GzkSH51p+i1l5a
         kz0NtjhsthhEy6NqBLbuhA162EDjGmKO4uM2AHTHlDtz02fBkzwVRtwG66A5psVtKjZV
         KrIufyuGuEAMhYQ+QssEtxrB1PDbNbSBPRbYdmfYRvSBaCMzjTpk3FNQgXwoCsXCn3Sk
         RQGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795481979; x=1796086779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U0AbLqC+dvvuaTRdzZr1WjUTeIhbYCsIpiF/j04HU2I=;
        b=fHZz4GUygenPays5OsYp80PzoyX5k3axR/lXf9qCrBDkKfu6x/wEtP/M/aYojMcoXc
         CCSJ7K9GlfO6WwJIcrWurGZLx6y+Hd1+T3v2ET2mPJFu3HlY4jwuigjmmB1XmjKHtCUs
         +ckgqW7N2yhVj6SSFriNCMw4bPfnbX/HyClACwjZjsH4eOKi45tHx1/kOQQcCdJ/dz+s
         hneBh/DIBsXJjtigbJ6ePQJbYXq6a9qPo9V3NfDPLh+uyPg0NIfdk7qwuymodqWdtDls
         u59XxeGHIljUVePxxHDJ18Vjx3aUyUJ5tnrBj0DIWw1t7SmxUcBo6bTsqwHtxOHYe+Yi
         V8Gw==
X-Forwarded-Encrypted: i=1; AL+hErFiUo8Pk1BzowbLTQHxh3mF7tq5wicgaBtzr6YXRbp2sjDucdf7rUiO6K8DgQhdW6K/Y7oiH3/xaxVHCLU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+o5fuJS9F0c+7slESEiS8gA8XcY7oyqmynbd16wj4gzzOcrh1K
	zrNt8ZYQF86SuKQ9CrIG2c9FrcCw7czZu10YuUzYgPeQ4AntclaXo3Sy
X-Gm-Gg: AZFdTZerW+jLRqR+r9+F4doGoF3goInQ7Fq2wSvFrxE08bdwZlvl01vy+B11gWJk+k+
	0CVg87nMAeNdVl1ohFP4gRreUtugKuMf5LAgdq9e/7+8iAPG6hQzlriwUryGA56LLKDueGnHYrE
	82/9xc+0klZo6aiIGOCSvYOVxRi6gP+ZJ64OWn6i594mYEYInFU7mWdm5NTGsL2QZkCldkPI8cw
	in3DU6Wl7SP9spL3Yd1XqKa8J06gkUO7yGSJ+Ih70KWSXwmTBDzc6l01JAWXSP9NUFqjR/9/FEJ
	JpdksrV10LdZ6LkZIsqP3Nzpqqg6xpp6Y2mMBqvqNaccl+9wum93fNK49in3+3m0efywVyOJ6O8
	f8g4t3/d6gvlWJ1sObu6gWuPk9DtuJyK54KQ4j8PUAk1ZsPLjwOv1xV1vJlAKlVo3fuijFeGkGe
	diob85LACgYHW9ubict0o4clDF5mOvXDNrA9msB9tnexhlzKhpjGNzTnF8IqfdsGG+pvH59miKj
	+uTDCioSctamKRagi6jz74n/d3OHXNnuLiOOqGiibcZcMtCkEQ5aAoMvMsUY8VohlVm7IJBTSaj
	uEgF48JRoXHww8bR0Dtzz2aC7DaRCE+DrTx4h+5qzLLLDvjFIGp/isT6zxPwKgvg94JKAG307l8
	syxfO4xyEl46uzbZYb5Mouh5fLS+mq53WQSjVFqov7mbIR5yIPH2XKb4k0fiqMN2pEQWDaCEY9d
	nskSkgQHRrTWU=
X-Received: by 2002:a17:90a:e705:b0:3ac:9c37:9422 with SMTP id 98e67ed59e1d1-3b41c7e4cf5mr18161625a91.2.1795481978687;
        Mon, 23 Nov 2026 16:59:38 -0800 (PST)
Received: from esteban.lan ([2001:f71:5160:2b00:ae2a:b9d5:71b7:3bb9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40578d771sm22990964a91.1.2026.11.23.16.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 16:59:38 -0800 (PST)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: Brian Norris <briannorris@chromium.org>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: Antoine Pichot <antoine.pichot@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH wireless 0/2] wifi: mwifiex: pcie: fix NULL dereferences in the card work at teardown
Date: Tue, 24 Nov 2026 09:59:30 +0900
Message-ID: <20261124005935.290010-1-antoine.pichot@gmail.com>
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

A command timeout makes mwifiex queue a firmware dump and a card reset
on card->work. If the driver is torn down while that work runs, the
teardown clears card->adapter and the work dereferences NULL.

On a Surface Book 2 (88W8897 over PCIe), this crashed the machine at
shutdown four times in about 400 reboots, run back to back for an
unrelated test. In each crash with a full log, the firmware did not
answer the shutdown command, and mwifiex_pcie_shutdown() tore the driver
down during the dump. NULL dereferences of card->adapter in the card
work are reported on a Surface Pro 3, after the driver's recovery from a
firmware failure, in [2], and on SDIO in [1].

Patch 1 makes remove() wait for the work, and keep it from being queued
again, before the teardown. This brings back the wait that commit
7e34c0d2f631 ("Revert "mwifiex: cancel pcie/sdio work in remove/shutdown
handler"") reverted [3]. It is safe since commit a64e7a79dd60 ("mwifiex:
resolve reset vs. remove()/shutdown() deadlocks"), from the same series,
made the work only try to take the device lock.

Patch 2 makes the work return when card->adapter is already NULL and
skip the reset when a teardown started during the dump. This covers
firmware initialisation failures that clear card->adapter before or
during the dump; they tear the driver down without remove().

The RFC in [1] adds NULL checks only, and a NULL check cannot help when
the memory is freed after the check. For example,
mwifiex_drv_info_dump() checks priv->netdev, then reads its name and
transmit queues. During removal, mwifiex_remove_card() can unregister
and free that netdev in between: it deletes the interfaces before it
clears card->adapter and waits for the work. With patch 1, remove()
waits for the work before the teardown starts, so the two no longer
overlap.

mwifiex_sdio has the same race, and [1] is that crash, but the same
change is not safe there. The SDIO card reset rebuilds the adapter
inside the work, so with the wait in remove(), a reset queued by the
shutdown command's timeout would run in full during the removal. If its
reinitialisation fails, mwifiex_cleanup_sdio() calls cancel_work_sync()
on the work it runs in, and remove() would never return. An SDIO fix
would first have to keep the reset from running during removal. I have
no SDIO hardware to test one. Andreas, if you can run your
rmmod/modprobe loop with such a patch, I can send one.

On the Surface Book 2, running v7.3.4 with the linux-surface patches,
patch 1 was tested with a debug change that queues the dump and the
reset in remove(), and both patches together through repeated load and
removal, a runtime reset, and failed resets and a failed probe with a
second debug change that drops one command during firmware
initialisation. On v7.3.5 with the linux-surface patches, lockdep,
KASAN, debug objects and the hung-task detector, both patches went
through the same load, removal, reset and failure tests, and through the
dump-and-reset change with the dump already running; the kernel printed
no warnings during them.

With W=1, the patches add no warning on x86_64, i386, arm64, and
big-endian ppc64 and ppc32 (the last without SMP). They add none with
sparse on x86_64, and allmodconfig with CONFIG_WERROR builds on
wireless/main and next-20261123. Not tested at runtime: other
architectures, a kernel without SMP or without preemption, and
linux-next. No fault injection.

I made this series with an AI coding assistant, Claude Code with
Anthropic's Claude Opus 5.5 model. Over several sessions I asked it to
find the cause of the shutdown crashes, check whether a fix already
existed upstream, then write and test one. It decoded the crash records
and the traces in [2], wrote the patches, the debug changes and these
messages, and ran the tests on the Surface Book 2. I reviewed the
patches and the test results.

For the stable kernels: patch 1 uses disable_work_sync(), added in Linux
6.10, so it can only be backported to 6.10 and later. Patch 2 does not
depend on it and can be backported further on its own; it then fixes the
NULL dereferences, but the dump can still run alongside the teardown.

Not addressed here, and older than these patches:

- A PCI reset started outside the work (sysfs reset, bus reset) whose
  reinitialisation fails frees the adapter without waiting for the work:
  mwifiex_cleanup_pcie() skips cancel_work_sync() while
  pci_reset_ongoing is set.
- At probe, if the dump ends before the failure path clears
  card->adapter, the reset still runs. mwifiex_shutdown_sw() then waits
  for fw_done, which _mwifiex_fw_dpc() completes only after waiting for
  this work. Both wait forever, and the work holds the device lock, so a
  later unbind or power-off hangs too.
- The crash in mwifiex_hist_data_add() that [2] also shows, which is not
  in the card work.

[1] https://lore.kernel.org/all/20251118072527.174375-1-andreas@kemnade.info/
[2] https://github.com/linux-surface/linux-surface/issues/2350
[3] https://lore.kernel.org/all/20180112210837.112628-1-briannorris@chromium.org/

Antoine Pichot (2):
  wifi: mwifiex: pcie: stop the card work before tearing down the
    adapter
  wifi: mwifiex: pcie: skip the card work once the adapter is gone

 drivers/net/wireless/marvell/mwifiex/pcie.c | 36 +++++++++++++++++----
 1 file changed, 30 insertions(+), 6 deletions(-)


base-commit: dcf495789037ab78d8ddf5844239cf85d92ac5f1
-- 
2.56.1

