Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795754701;
	b=fj0zhZPM7O5c+Rp+GwtBKM9l9fpDJwfahRT7pyFGdw/xS1stryavTFxp93RTFnIjMkWc
	 t+l954jm754FicQ4wiTAv1STY0a5cIaQmhDQF+TPv8qHAOc4FHqRlWk6h4ArhJxN2yKqd
	 rWRXZcxjNgS3Tso7TglfD4ITQ8RHTD4pGf3sZjwlG17n2NNpl7P3n0UtJyy6Gkp6OiqKB
	 vYaCf0rhMfKkJ63Ps34FxTFEdRXFWypGyjpDm6tGw9leeIU9P3An1318tuBzDHBFvrPz4
	 3COujwK5acvQ4Tzb6daSESS+QOoAGhGaqWRTrSbvjVa55TT5YbaszOLc++YUeFEcyFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795754701;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=up2JUVBVe7IxMJqAJpnFfm9YSUDx0gfYrWA7gUrFC20=;
	b=S9TVOSaXkeLBcxArJpzU51Du648vLN1/txWbRFSRsagXpjuO0VkSxBP0lj3lp4b6Poga
	 aiUuHSA5ze68y1AKGycrRviD93sEJfcu4FtcEk0NMHFRsx5L99KehbuU9H5JoT0LgH1dl
	 C1UT8DZdjCCZ0CbpJ4TxRVnFvd2oIoZOcpzmzwXMKzM0o0AiZkNAslIglUjM/P+JyCiZc
	 GgEq/Rq4Dr9u6N5TDqClVVtnbwx+TeaA/02svbn1Tjl9CyZ+GXXnI7alosfprhky/ifyn
	 jSQsdThjz02nzEF63fvQPhC3FR6i5rqJTEze9xmuHhhTwPM1hBCZc8pOp5Y5iNg5q/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=O5Bz3vNk;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634A0606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:45:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 634A0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=O5Bz3vNk
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b191f8a9b3so8843985a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 20:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795754701; x=1796359501; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=up2JUVBVe7IxMJqAJpnFfm9YSUDx0gfYrWA7gUrFC20=;
        b=O5Bz3vNkQhd/sRzDiaSbLoeBk9Qm9UZFhKjlP0p0uS5g0CknVx4S/Zmw+RnfRQv7lm
         3xXs4JZxv/nLBoFeNwIqyjm2GnV78olgulj5mRshrWiuyVvDfWU5vqSX+I6vXqvuZE++
         wg/pEV+BjkTMBU6qkRuciObZmzK/IrIPo/PYsy3yFqASF7jU37Qk3m7pkAgAP32jApP0
         IB1Dt9wIhprQk3hlWixTG+Dai6qg/Bb8N3LI1Qci0E1Q2WvZ4yFSzwrHEQLVrfE6V8CH
         frM0FZbeYcmvc/AyvPH6VDcLjDtjKKtgmtDdp2hJLhvpnQV3ftPKt17bzGFjUxDMJkva
         Jh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795754701; x=1796359501;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=up2JUVBVe7IxMJqAJpnFfm9YSUDx0gfYrWA7gUrFC20=;
        b=d5E1P/4OEtirZz785kg6XaAbVe2qZ4zndUgfcv+y7R0tIjViwIvf0lUcggK+st0Np8
         PqzIY8igrEEDBjyUvMiPzmJMgz2lkL5c2byRsUwKZMiNNkzckbGfMjYfjxKrHCd7/pBx
         ObQT+DRcUeHZBUroWY0BDO/h0V5Hlwo3Q4bRVfqaGykf6XKUgVDirC65wSXDIettknL1
         clER4pw6Y2/L+bgc0rc1qPwlNWeXFMJ0OFhvWL8/8rHN31JC3A4p4HL48Aup7BlQwrIs
         tZx3uq5acOh+vWiW/Ywr1I5mAe13sYWWWFcT91OcNMSR734Je6R4O7rHG9+lz2Lt3UGa
         bdbw==
X-Forwarded-Encrypted: i=1; AL+hErFPmHo0KAtY6jWLfbZFQ+UdAzrnoP6p9TWbjdrS+WqIlz1Le3Bxxfger8JJYHkGBN9T8BgvTLtPfxvj/ms=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gES6NrZrCYkOw/OzM4aWI+LNOpjM2YGbmajfb/X96QMJZnXt1
	woX8ySX57K7TUmv/nMD6eOoD1D7iobnjtkFqX1+/oHxrAo0+5MztentGiRVL6O2lUs71aqMN0Wi
	bCist/S45sk6Z+A==
X-Received: from pjbpc5.prod.google.com ([2002:a17:90b:3b85:b0:3b5:361e:87b9])
 (user=skhawaja job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2e8c:b0:3b3:b373:6a6a with SMTP id 98e67ed59e1d1-3b41c9e45c3mr23219110a91.28.1795754700474;
 Thu, 26 Nov 2026 20:45:00 -0800 (PST)
Date: Fri, 27 Nov 2026 04:44:58 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261127044458.2757857-1-skhawaja@google.com>
Subject: [PATCH] PCI: Don't reset a VF through its hotplug slot
From: Samiullah Khawaja <skhawaja@google.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Lukas Wunner <lukas@wunner.de>, Alex Williamson <alex@shazbot.org>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Samiullah Khawaja <skhawaja@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

pci_dev_reset_slot_function() doesn't do a slot reset of a multifunction
device, because the reset would also reset the other functions. A VF is
not marked as multifunction, so this check doesn't catch it.

A VF on the same bus as its PF gets the PF's hotplug slot, so behind a
pciehp port the VF has the "bus" reset method. A slot reset of the VF
also resets the PF and all other VFs, and only the VF's state is
restored afterwards.

Fixes: 10791141a6cf ("PCI: Simplify pci_dev_reset_slot_function()")
Cc: stable@vger.kernel.org
Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
---
Tested in QEMU with an igb PF behind a pciehp root port, bound to
vfio-pci with two VFs. Without this patch the VFs have "flr bus" in
reset_method, and a bus reset of one VF also resets the PF and the other
VF. With it the VFs only have "flr".
---
 drivers/pci/pci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 7c6f2aba8144..16e970d26b51 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -4994,7 +4994,8 @@ static int pci_dev_reset_slot_function(struct pci_dev *dev, bool probe)
 {
 	if (dev->subordinate || !dev->slot ||
 	    dev->dev_flags & PCI_DEV_FLAGS_NO_BUS_RESET ||
-	    (dev->multifunction && !dev->slot->per_func_slot))
+	    ((dev->multifunction || dev->is_virtfn) &&
+	     !dev->slot->per_func_slot))
 		return -ENOTTY;
 
 	return pci_reset_hotplug_slot(dev->slot->hotplug, probe);

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.56.1.839.g22a8290db9-goog

