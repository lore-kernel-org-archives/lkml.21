Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699902;
	b=RxBs9YPjoeLVEOxIc82qmvHk/oFouWcgE0nEixJ3RZ1nnj974ALIuCtyotwL832asvEV
	 4gKOu/ygYh5/xGGw46vAtMGKUBWmNdJ8sPn53H7o8R9pjH+H7+Z/F33dRpWxuQYJSLG3p
	 sDOa+Po2HfCyAwCHI7yVZ1EIRmMAqt/iTtOjuPZawbwBp082csd2q1tLaMX643tCC8v9V
	 7dGMXK5r6TARHY1I6uj16y1FAxmL28dc/UvsE7oBbHHVUBPtxjshjPMP7GHsFYI0n04n6
	 v4PgUTjMJIxl9nykULY8/uE7bZ970leLUp5Tt4uLITfvZS1VM+EoDBBPBe/H0PSyr1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699902;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4bpLkGggKND4rdI5aeb1fC1YriisxypN5V4Ha9pY8nc=;
	b=YqE7OBg4kKmg3X2I+RcDSse3nu2rjGFVn0lU7OVMqhE7k18cDI55BP9BT5IBXkohvFAo
	 WH3+zz6gz0Yq29ZVq+Yg4h1sTKeKjb2olgQ5EFnv+sv95q1RBDhdIY4SKU+VJcLsKwfx9
	 O9Qrga+TBnVKQxSanQ75os2t1eSUQNyYiQ1jsjO8AcoaQIeom/qUvfJxUgR2YoLe7OsgM
	 MrGt/KTOTspzgQS5LRh0/CQDjnevFiP+3yPC0ct5yMZ9qcnJwJkApyqdZLRb8T+hKFe59
	 1Ig87VDp1E/zRzDgsJvTIWo197d7krPdrCNWhZn76956uqlZGcgeyfJpm7wKWu5adeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ex4MPbIQ;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A53606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:31:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95A53606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ex4MPbIQ
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-386c336eab8so3477865eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795699901; x=1796304701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4bpLkGggKND4rdI5aeb1fC1YriisxypN5V4Ha9pY8nc=;
        b=Ex4MPbIQnlsBn7GAG4/VCuSYs61TCmhayVVfq0Y2vPPT1s2YO2jM1Wo16z1gICrh8C
         gk0/EROp+S/tI22esTQi/MuxCWTZHMtMv7Y19sYaiRE27ynUhlKUBUI0LrW8lGbHvU8w
         WOXbaSFDHR843eYyhcdP0O0oioe2SiAynDEpEefqLDL9o1N6K3IxwKxRMl5b2DiUr4WG
         ByMLICKpZAmRIpHEN7UOAMOIbNKLjP4oNQvhwBTxkr3DpG7AmgkJC+KUMNQjMJ3s6yTX
         zfFVYGyUdGAwQp/TVxPLn217yeFpHpXE2MjJYOOmM5JbYDaO78rrvt75w59X4j3I9yE7
         7+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795699901; x=1796304701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4bpLkGggKND4rdI5aeb1fC1YriisxypN5V4Ha9pY8nc=;
        b=erx9DyxiK/y+vtlSMonEqbU2SVm65CM8xgg51ZUR8FH9tY71WU55mYSMX/xzDRHmow
         RpIAqaTNko239SDnPdL9mnd5OS/TJggAnFjIiWvVZgdPSMN5Hpy06Gr39kb66xrufmXS
         x/cXp9oX32j4hC7VxMCI5a3mjZi5Y1tVBWFxLUoLmjJEWQ6KLY5m5QaoEwlYnQZzLdN4
         PF7msetJ5pT76wi4BBZlzniKgW7f02+VlG0Df9wAKwQBPuX9PaeME4O+LiuEQut8tF4n
         kJbYjhNdeOq9BTETL+8+yvztMN4N9SbEntpTDmdUfXA3C4pnitaR7HZGP5oYXwwANPWn
         ozVA==
X-Forwarded-Encrypted: i=1; AL+hErH/WP7OJuwUOuOanWXNlpxGxrhK6vDQe7W/olWDqGDGxWYPoCWgeMNdaSnjs+JiiDAgirgdl5EfmV2KjvU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/RcabsRS4AuvrVbJd0StNsrX9W4fiQDzSCMSVUerAMUYj66HtX
	O1RAhtTkcg7VYZW46aTF0K6L32Ze7kzT6kYLyWOTB4Aj39dHRjmQu+I=
X-Gm-Gg: AZFdTZetv4Pg1ASo0qp84GoMkKvs/e8Xpr5m4HVsq/kthsQ/VS5JW2gGpSmzYLu6dlN
	pirgjknN7K0aFg3OE7e8iTsZK9sD+ZJoj/npSClxsDXWvvpUtmoxeSljHU44fC9D4BUrrhcWIQC
	SDJ6NTUl7Ho/CKPuzZsfr5HdltUTtiSyB4RRmQqG2Mu07jjfnymdKqkytOQxIlwA5K74OtkDpKQ
	tO8Sg/ykuKl9Zhk0vsk0r018Iq2MUYMSeALM0WBDWMb6TFJxwtrYmCUcGHQf6lVJEYwd5kMpgrK
	rk0D/Q/53tUp/krr7lTuCWXM1GVFBJSdYSXs729Wth750nWUBgXuhIb5rVJdeFhKFJxO2LzGvvM
	O0hfeMN5Gmib14D8YfOwJBKaFvSUMl5Z/2+BZAt/x6NUCwIAoP9tdkm3xmcy+Z9bobEZeQCjo0t
	wm4zvFf9slqLu6JxBZrPyBFEaf3Icomtiz776+HThG2CCOeDlAmoP9YjFqFLcuADbg10VCZviCI
	DUhbCI9OtUqFXmFfROMe++IvjlkW9DgceXthFNJ8ghZNdM2ErnOMK54XNN9vV/8WfR/OEALE0/r
	xtwUVGjqQsSZ8pav0/BdLwsXL0LSEBuHRCNAwrXtGI0A7wDDxIGv+mlsfxZlx+nN7dTqVDQuRPE
	RIePeA8qJujhP
X-Received: by 2002:a05:693c:20ce:20b0:381:761b:f335 with SMTP id 5a478bee46e88-3856f94eda0mr22296290eec.6.1795699900556;
        Thu, 26 Nov 2026 05:31:40 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:a06e:23f:85ed:4cfe])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386992b404bsm50244649eec.1.2026.11.26.05.31.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 05:31:40 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: Yige Jiang <yigejiang86@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] bcma: Release the found cores when the bus scan fails
Date: Thu, 26 Nov 2026 21:31:36 +0800
Message-ID: <rc-b1-20261110-vc-96-1d8d0afe258d@gmail.com>
X-Mailer: git-send-email 2.50.1
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

bcma_bus_scan() initializes each core it finds with bcma_prepare_core()
and links it on bus->cores. If a later EROM entry is malformed, or an
allocation or ioremap() fails, the scan returns an error with those
cores still linked, and neither host cleans them up:
bcma_host_pci_probe() jumps past bcma_unregister_cores() and frees the
bus, and bcma_host_soc_probe() only unmaps its MMIO window.

Each failed probe therefore leaks the device reference of every core
found so far, and with it the core, its name and, on SoC hosts, its
ioremap() mappings. The Sashiko AI review reported this as a
pre-existing issue in October 2026; an unmerged patch by Haotian Zhang
from August 2026 would have covered the SoC path as a side effect.

Release the cores in bcma_bus_scan() when it fails, with put_device()
as bcma_unregister_cores() does for cores that were never registered,
and reset bus->nr_cores so the bus is not treated as already scanned.
put_device() is the right release only since commit b63aed3ff195
("bcma: Fix memory leak for internally-handled cores"), which made
bcma_prepare_core() call device_initialize().

Fixes: 8369ae33b705 ("bcma: add Broadcom specific AMBA bus driver")
Cc: stable@vger.kernel.org # 5.15.x
Link: https://patchwork.kernel.org/project/linux-wireless/patch/20260813100836.2913-1-vulab@iscas.ac.cn/
Link: https://sashiko.dev/#/patchset/87897
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261109 (630059a5a632).
Compile-tested: arm64, aarch64-linux-gnu-gcc 14.2.0, W=1, COMPILE_TEST=y, BCMA=m, BCMA_HOST_PCI=y, BCMA_HOST_SOC=y, OF_DYNAMIC=y; drivers/bcma/{main,scan}.o built before and after, no new warnings.
No hardware or runtime test was performed.

Needs bcma_bus_scan() to fail after at least one core was found: a malformed EROM entry, or an allocation/ioremap() failure.

 drivers/bcma/scan.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/bcma/scan.c b/drivers/bcma/scan.c
index 84742408a59c..6aea15f54b30 100644
--- a/drivers/bcma/scan.c
+++ b/drivers/bcma/scan.c
@@ -520,5 +520,16 @@ int bcma_bus_scan(struct bcma_bus *bus)
 	if (bus->hosttype == BCMA_HOSTTYPE_SOC)
 		iounmap(eromptr);
 
+	if (err) {
+		struct bcma_device *core, *tmp;
+
+		/* Release the cores found before the failure */
+		list_for_each_entry_safe(core, tmp, &bus->cores, list) {
+			list_del(&core->list);
+			put_device(&core->dev);
+		}
+		bus->nr_cores = 0;
+	}
+
 	return err;
 }

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
