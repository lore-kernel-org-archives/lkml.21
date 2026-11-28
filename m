Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.214.127.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795872563;
	b=UDvlG3h+rCWMYQb4BpFloCb/y22cBGqtqLuVHCVed5yIsuxLUcq5Nf2GEW4R/QJiHkaj
	 k5b/zqno03F28lRUXIe1Cp8PFtaly1cynHedIwDBXE846wokCP7A0aUHiTjMmvZxoLjCy
	 OgvUJbvjJzM1wK3Do7h69MH8kLpU04S662l04WX2dozXqCS3ZF3UyepvyDAjiKH9O3En3
	 y9HTf9K5c1SOMpmFIcFCzi/UcL8fJE2z9HaE37YW2sUMrXqVEMuKIpi/72H5oZsvOberf
	 2kldydfwFWCIdWCqM/6j27S+uYVO6SMJIsgCzkyo/DZXfTYtRcEjAPWIoo7rX9CAOAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795872563;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6guL6fsIdRWO7bBe/cAJj/bQPM005atUDvW459uHxcE=;
	b=AHXFRfbrwlw57EecZDXpeT54wrdct5Wv30dfsJuSbIwnWWlup2A3Dir0gjExt81WXsvQ
	 60i2fB0XChSthpxv7PGyXmhVoqtP235s9bey9IAEc0wrLnVWWbXTIwOIYeL5ZcntB3whI
	 IgT/dNv+y1Zm8hw0+RwQg0F5ZOrLIf5kMWK1rAjUpiQSzXsdL8dBXCZr9f1MGwlH6PbvY
	 7NHI6mbx+YNluOIR9LSJOfcpjKPbFLpU8za0kPCdODq2qQ6KnXRv4URgWPSJZhSYta4Oi
	 Y4w4W8MzbFI/VV4wHCyWsx7kX3niizcP5T+BcHHR3l2t9iXA6pgfdNHPPiiBukKDx+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szelinsky.de;
	spf=pass smtp.mailfrom=szelinsky.de;
	dkim=temperror header.d=szelinsky.de header.i=@szelinsky.de header.a=rsa-sha256 header.s=mail header.b=k37UkjoP;
	arc=none smtp.remote-ip=85.214.127.56
Received: from szelinsky.de (szelinsky.de [85.214.127.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961D9606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 13:29:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 961D9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=szelinsky.de header.i=@szelinsky.de header.a=rsa-sha256 header.s=mail header.b=k37UkjoP
Received: from localhost (localhost [127.0.0.1])
	by szelinsky.de (Postfix) with ESMTP id 0D8C8E838C3;
	Sat, 28 Nov 2026 14:29:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szelinsky.de;
	s=mail; t=1795872560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6guL6fsIdRWO7bBe/cAJj/bQPM005atUDvW459uHxcE=;
	b=k37UkjoP6oGnkWwg7I9D/5tYbP3vMm3gT85ACT1c8j3MavZO5WDN7ihK2QVUk6W0wjVmj/
	A5krIHIGJB9nFjATYdpZYU9IMOH22eiWt5Na7NG+YJWVzZxUQostzpSV+3UuEd7S842WM3
	ptFm9wKPSZa2RdQONHQYGdCSo6hEKoBzxlZLUoJQi9hBRC+jJ5axKCSsmvQ8H0RlCE55Lc
	yz9Fy9K6LPuI+S9dy0oLdyk3pDfZyGwNaVlQUC0K77RYGvrvP19A8IIqngNQjIzs6QmZnG
	ZQeDzXHyus8hRcsFouzNeURoJY2RKg8Oat9wcwjgpWK1Mohrv/fbpFtyUz5u1g==
X-Virus-Scanned: Debian amavis at szelinsky.de
Received: from szelinsky.de ([127.0.0.1])
 by localhost (szelinsky.de [127.0.0.1]) (amavis, port 10025) with ESMTP
 id mAZywzu7bxcY; Sat, 28 Nov 2026 14:29:19 +0100 (CET)
Received: from p14sgen5.lan (unknown [86.103.60.175])
	by szelinsky.de (Postfix) with ESMTPSA;
	Sat, 28 Nov 2026 14:29:19 +0100 (CET)
From: Carlo Szelinsky <github@szelinsky.de>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
Cc: linux-kernel@vger.kernel.org
Subject: regulator: core: use-after-free of rdev->bdev when a probe fails
Date: Sat, 28 Nov 2026 14:29:14 +0100
Message-ID: <20261128132914.3954393-1-github@szelinsky.de>
X-Mailer: git-send-email 2.43.0
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

Hi,

since 304f5784e972 ("regulator: core: reresolve unresolved supplies
when available"), unregistering a regulator that had an unresolved
supply when it registered gives a "does not have a release() function"
WARNING. If the unregister comes soon after the register, it is also a
use-after-free. I see it on net-next f89726ffabef with PSE patches on
top, none of which touch the regulator core. drivers/regulator/core.c
is the same in mainline (7cd8495c0f16).

How it happens:

 1. regulator_register() cannot resolve the supply, so it adds
    rdev->bdev on regulator_bus. The only driver on that bus prefers
    asynchronous probing, so device_add() queues
    __device_attach_async_helper(), which holds a reference on the bdev.
 2. The driver's probe then fails, for example with -EPROBE_DEFER, and
    devres calls regulator_unregister().
 3. device_unregister(&rdev->bdev) drops the bdev's references on its
    parent rdev->dev, but the bdev is still alive through the async
    helper. device_unregister(&rdev->dev) then frees rdev in
    regulator_dev_release(), and the bdev is part of rdev.
 4. The async helper then reads the freed bdev, and its last
    put_device() reaches device_release(), which WARNs because the bdev
    has no release function. Without the async race, the WARNING comes
    from regulator_unregister() itself. From the code, the bdev is
    only removed in regulator_unregister(), so a regulator whose supply
    was resolved later should WARN there too. I have not tested that.

So any driver that registers a regulator with an unresolved supply and
then fails its probe can hit this. I hit it while testing a PSE
controller patch: the PI regulators registered while their supply was
not ready yet (not registered, or its device still probing), then the
PSE driver deferred its probe. In QEMU (arm64, KASAN) one boot gave
37 of these WARNINGs and this report:

  BUG: KASAN: slab-use-after-free in __device_attach_async_helper+0x260/0x298
  Read of size 8 at addr ffff00000535c4f8 by task kworker/u4:2/30
  Call trace:
   __device_attach_async_helper+0x260/0x298
   async_run_entry_fn+0x80/0x264
   process_one_work+0x850/0x1844
   worker_thread+0x73c/0xca4
  Allocated by task 1:
   regulator_register+0x220/0x1d10
   devm_regulator_register+0x58/0xbc
   pse_controller_register+0xa84/0x1aa4
  Freed by task 1:
   kfree+0x1f0/0x4bc
   regulator_dev_release+0x74/0x98
   device_release+0xfc/0x204
   kobject_put+0x138/0x234
   device_unregister+0x20/0x2c
   regulator_unregister+0x228/0x2e8
   devm_rdev_release+0x24/0x40
   ...
   really_probe+0x3b4/0x59c

  Device 'regulator.6.bdev' does not have a release() function, it is
  broken and must be fixed. See Documentation/core-api/kobject.rst.
  WARNING: drivers/base/core.c:2642 at device_release+0x184/0x204
  Call trace:
   device_release+0x184/0x204
   kobject_put+0x138/0x234
   device_unregister+0x20/0x2c
   regulator_unregister+0x25c/0x2e8
   devm_rdev_release+0x24/0x40
   ...
   really_probe+0x3b4/0x59c

The reproducer is an out-of-tree test driver, so I have not seen it
with an in-tree driver yet.

One way to fix it would be to let the bdev hold a reference on
rdev->dev: take it before device_add(&rdev->bdev) and drop it in a new
release function for the bdev. Then rdev stays alive until the last
bdev reference is gone. I have not written or tested that, so I leave
the fix to you.

I found and analysed this with help from an LLM assistant.

Thanks,
Carlo
