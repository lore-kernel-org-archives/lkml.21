Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795481983;
	b=PFlhXm4kMj1sWfIlsNYbHMqbOVkw2uGCDefQT/DwGv01gIiJTJDWt0ElJ4Rh2g3qjPci
	 RahZNMUbxGAOMbmKogIgnhm6/oM9rYV1+JhRGIQc/gKlukG3PhzZZ9EAqwequ7EXLpA1m
	 uBL6z/piLkHq5HCRvHR1KUDPDRJ5dhfDMbTIgWPw93IeSsQssoOc7ososJq3H8db0t8Kw
	 a20H+J/9ML93Ha+23MnB5Gqe/6md9LtF9n7MEt7+bkDr6o9XkVB9vy5/43/uBa7eV269L
	 KoJa/ZIToqNC3yXrQNo7OhDRIgXZgGTzzMSftRsFnOKVVV+Y9XILicazbbu2Q521kZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795481983;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tb+J4grrziNRGAo5T7DYul9U5wujwe9VyddWPwEAkYY=;
	b=3lr+iVkXeGF277N5vwQgBP+iWclc0XydlKm3iUg1KZ+6ZR84BgXFDdzVI5ViIJQ0iXyG
	 zvmQEE9iebwAZhtRvb8oHIwpDKrHql4T29Yjpc6OM8fpObvGl695BaIa4EFncpuhlSeDB
	 Woms/TWPdeq8p5WtxuHfsU0OyJ/IP7NiyZvfPlk+urNY0095Nr8PCBDYlc7W1nkYTFdP6
	 cw6jtA36Ed6mkSe1OhCNkpzQtW4xS/4EaxlEAyIHGqtHSmEjb6VkgPJYKNWjQ2qP/hZIq
	 OwcjULGjLj91TiB/ndefla8z/gnc7NDq3mEIf95380zEtAVzZM7Rx3f2O0nxyFc0RXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wek8TN7k;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE63606A33B
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 00:59:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AE63606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wek8TN7k
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ee20b82356so4246915ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795481982; x=1796086782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tb+J4grrziNRGAo5T7DYul9U5wujwe9VyddWPwEAkYY=;
        b=Wek8TN7k5mzTTV1daBakIMoT6MI2Kiu4AGlfuzfehdioXNylj9hkrVTsl2I+KQ1u56
         wRS7P6IEcExGQxa0lXr2D4tGxM9ATqOUVaNrD3aB09lH8zyP5p/oxqzOyO12S+tMnp2E
         aI6iv8FvgkNWDdHzSr5BQenJg03x2Vk4rygPy9gRdJQTWH87ziEAgf/hiI6NtnPq7yKX
         q+wKskvSy5EO/mOomofYM7ms75ewbnBLJkdZ+rliqX1EFwOjJeW83h38/7wvumewBFjA
         hfVCepPElvo+9Ws0UgQTyV2kox2aotuwDdzweCQyLpS0WcJfaoOCFTUPXfGM5cL/sgRr
         YWnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795481982; x=1796086782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tb+J4grrziNRGAo5T7DYul9U5wujwe9VyddWPwEAkYY=;
        b=V0Gfn65f7PTNY+tDcQD8YhERppuyoF7Jf1hpm/Nawwk9/VMlS7J6YykMMdGNBiwQd0
         UHIQ3PljTCR4jJJWHI3ygPOi3VJ6zNjdaDyIGw3sjmKi8K2UR5JU2tQw50dYmy2Do5wa
         5JHNzSKqsryp+WbJLWKn4oELFXpLTyJafCV9M/3pXAFXbJaiEemxbwxrEoMcKM63R3MO
         nTQj1PzYiBcCZvDgxc6H39HR5ueCN1ymFBiP+vhsbt5h7ObPY2Ewp98pxuubDypBfSLm
         OdvYROhlvAMYMuHWGZZBD/qsg2EaYWMx3b+LdrjVcHx5HqDvzSt7ivx/Tpqaz2+CsDZ9
         g+mw==
X-Forwarded-Encrypted: i=1; AL+hErH/2msj7avJ/Vxnm86elNiC/HnzIH/MrDsjt85F3F4ZusaAf91jm58+N+R9QI3xtxGfASHJQXqYMOkEiYY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZwoLFwrnq721iMJnhDwLfLbKBJnFNHVyEycG9hRmf6TEnLM73
	ScK4HMtjPbBguL1BoJPv/lRsV5vY2//VKRcv10QuOHVc9Sc+lNWGcEt0
X-Gm-Gg: AZFdTZdpzoTeHYb7qGUGoTXWyI9K2hcvbxmq1/OM4ZgYO01VWM2o3+2uJdalYBkgYIP
	lhYCn0bRoy2Tswue+OCfGfi17IYmy+GC+RMQJTz81WJIn+9fMufOyUHq3D9p0CUoYJP7jNJ9cXc
	zDcRBgYuqakrs1Pw0mwDnGM2FLFwWgXZww42IYjBJ8yr3ms2LKQRwBojU0vhLOL22/6VoyY6Qfj
	HDscvWr8nVorBtDCUd3oRD9XI8pMDHdvdbn2HASxLuslHTTYV78rGFFMO52sVq7e+/8z+h1mBEn
	0AdjKbhjULwxQVP2m8bEeXjH2yuRKIX8MrQsPkuGUQGEIqkX1DJ96Sc0ynxYr7cqqu9C5XcbbCn
	HIPTaPb63yW1IvLm1rQhBcod3THPjc4zes9vAhWlVE0bT1JNHMl/5EhpUb9rfHdd9ybdSh8p49A
	WJklnrTHlN4vranzX2VEKKH4Kf0W2IgGDxLTjFYvMwsOLVCBtbgrOIXcbclGVLpf4sHWgQB80vP
	qXHhO59qjwcfnyUnP7zW1S4yW4q0evSHabU8Soz1FT++K43iPusYV2a59PEMjJWmLPX5zNkyK5U
	mIX4Y/xHg81ygAui5GY6EF8Vc2VuELHZIr5GsJnsj/eZNhww8vvCj/Yyy4QuhDI4ZPQ+M3MkLO5
	pkiKLfiTpK8Sf+YhV7CiuVzLR+jHrN5ENogDNOgj8HF3HAuGGiNFI8F+NVQh9rjbj96PAxBSMy1
	d2VB0uQkamjJQ=
X-Received: by 2002:a17:90b:180b:b0:3ac:a7ee:6785 with SMTP id 98e67ed59e1d1-3b41c7d0dcdmr20444551a91.1.1795481982478;
        Mon, 23 Nov 2026 16:59:42 -0800 (PST)
Received: from esteban.lan ([2001:f71:5160:2b00:ae2a:b9d5:71b7:3bb9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40578d771sm22990964a91.1.2026.11.23.16.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 16:59:42 -0800 (PST)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: Brian Norris <briannorris@chromium.org>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: Antoine Pichot <antoine.pichot@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andreas Kemnade <andreas@kemnade.info>,
	stable@vger.kernel.org
Subject: [PATCH wireless 2/2] wifi: mwifiex: pcie: skip the card work once the adapter is gone
Date: Tue, 24 Nov 2026 09:59:32 +0900
Message-ID: <20261124005935.290010-3-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124005935.290010-1-antoine.pichot@gmail.com>
References: <20261124005935.290010-1-antoine.pichot@gmail.com>
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

The work can also find card->adapter NULL without remove(), when
firmware initialisation fails at probe or after a reset. Both paths end
in the failure path of _mwifiex_fw_dpc(), which clears card->adapter and
frees the adapter:

- At probe, a command timeout during the initialisation queues a dump
  and a reset. The failure path clears card->adapter during the dump and
  waits for the work in mwifiex_cleanup_pcie(). The work then reads NULL
  for the reset.

- After a reset started by the work, the failure path runs inside the
  work, and it skips cancel_work_sync() while a PCI reset is ongoing
  since commit 4add4d988f95 ("mwifiex: pcie: skip cancel_work_sync() on
  reset failure path"). A timeout during the failed initialisation
  queues the work again, and it runs after the adapter is freed, with
  card->adapter NULL.

[1] reports four crashes in the card work on a Surface Pro 3 after the
driver's recovery from a firmware failure. In the reporter's kernel
build, all four are the work dereferencing a NULL card->adapter: three
in the reset branch and one at the start of the dump. This patch was not
tested on that machine. On a Surface Book 2 the unpatched driver crashed
on the probe path.

Read card->adapter when the work starts and return if it is NULL.
When remove() or the probe failure path tears the driver down, the
pointer stays valid while the work runs, since both wait for the work
before freeing the adapter. Skip the reset if card->adapter was cleared
during the dump: a teardown is then in progress. Pair it with
WRITE_ONCE() where card->adapter is set and cleared.

Tested on the Surface Book 2 (kernel 7.3.4) with a debug change that
drops one command during firmware initialisation, so that the command
timeout queues a dump and a reset and the initialisation fails. After a
failed runtime reset, the work queued again by the timeout found
card->adapter NULL and returned. At probe, the failure path cleared
card->adapter during the dump and the work skipped the reset. No crash
or warning in either case.

Found, written and tested with an AI coding assistant (Claude Code with
Claude Opus 5.5) under my direction; I reviewed the patch and the test
results.

Link: https://github.com/linux-surface/linux-surface/issues/2350 [1]
Fixes: 3860e5e39532 ("mwifiex: move pcie_work and related variables inside card")
Cc: stable@vger.kernel.org
Signed-off-by: Antoine Pichot <antoine.pichot@gmail.com>
---
 drivers/net/wireless/marvell/mwifiex/pcie.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/marvell/mwifiex/pcie.c b/drivers/net/wireless/marvell/mwifiex/pcie.c
index b63e6ac6e582..c4837102f0cd 100644
--- a/drivers/net/wireless/marvell/mwifiex/pcie.c
+++ b/drivers/net/wireless/marvell/mwifiex/pcie.c
@@ -2842,13 +2842,24 @@ static void mwifiex_pcie_work(struct work_struct *work)
 {
 	struct pcie_service_card *card =
 		container_of(work, struct pcie_service_card, work);
+	struct mwifiex_adapter *adapter = READ_ONCE(card->adapter);
+
+	/* The adapter is gone if a failed reset or probe has torn it
+	 * down.
+	 */
+	if (!adapter)
+		return;
 
 	if (test_and_clear_bit(MWIFIEX_IFACE_WORK_DEVICE_DUMP,
 			       &card->work_flags))
-		mwifiex_pcie_device_dump_work(card->adapter);
+		mwifiex_pcie_device_dump_work(adapter);
+	/* A teardown that started during the dump has cleared
+	 * card->adapter. Skip the reset, which would run into that
+	 * teardown.
+	 */
 	if (test_and_clear_bit(MWIFIEX_IFACE_WORK_CARD_RESET,
-			       &card->work_flags))
-		mwifiex_pcie_card_reset_work(card->adapter);
+			       &card->work_flags) && READ_ONCE(card->adapter))
+		mwifiex_pcie_card_reset_work(adapter);
 }
 
 /* This function dumps FW information */
@@ -3171,7 +3182,7 @@ static int mwifiex_register_dev(struct mwifiex_adapter *adapter)
 	struct pcie_service_card *card = adapter->card;
 
 	/* save adapter pointer in card */
-	card->adapter = adapter;
+	WRITE_ONCE(card->adapter, adapter);
 
 	if (mwifiex_pcie_request_irq(adapter))
 		return -1;
@@ -3215,7 +3226,7 @@ static void mwifiex_unregister_dev(struct mwifiex_adapter *adapter)
 		if (card->msi_enable)
 			pci_disable_msi(pdev);
 	}
-	card->adapter = NULL;
+	WRITE_ONCE(card->adapter, NULL);
 }
 
 /*
-- 
2.56.1

