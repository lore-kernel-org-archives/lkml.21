Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795048439;
	b=bGR5aKelhutKJVsvdQmrBAITGeaL23zkQO910Nh0GRVjUF/bp46ZY/kNgyh0aPa8g2u0
	 BhaE1ZbGW87dE0nW+Qe7Apfp0+jLQXWYpiV/Cdx08th48A/lJxGAelEDZzdUrkfZPpFUR
	 9vZ+Q9x+K302WL6O9h8S7Zh70Eou6xlB1/LB4RDuWBFkBpG1U+gJYFOn1KHezvzYJ3tq+
	 +nSr7X0EZznyg3rfrz0Slio5w6i54YP7owniVGlZQLasDOOf6y3XIYo8amrYHp8oF9w+P
	 gXLYcqGEkGD/64EEYMLzeGXvxor6lscfmp0fwRnzKMZ/kJhMyWL6P5/q5fW34/XzkRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795048439;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=w8iB8hXj1rJtYCTecMKdoTMO0/3sA+9tX97nJ972+uI=;
	b=vgjHfzHVDQeWxFwqmuQRyz1PBUW+fB6ahJSx1LExrj/pBF/Ruq84GnfMWS77ISmuKzAg
	 4XzbWiZNktHjEr5KL3ngaZMOeYnA95uWJz5cvMKYSDRK5TuK7ck4FJaVwVJ1cRaSXusk3
	 LeBcdy+uachscFFSjoW6X9KINtbRHUWFao2yDwYD/3yOmcPTP8QmVCYyCzRO837qab+FF
	 IsnLycYY/spvNcdR+aXMfAbeLysClSPZQsKsResS2Y9TcRR/tEei3gj491HxxhWAZYUYP
	 LLtgd/tLnqfkDPtIbPsUVMsr2LETz6yIedyfFGFFdeq5Rjg2/shnF7sBewPbOy25nkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UibzzQer;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1DB606A33B
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:33:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C1DB606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UibzzQer
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a06e79e152so1050870b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795048438; x=1795653238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w8iB8hXj1rJtYCTecMKdoTMO0/3sA+9tX97nJ972+uI=;
        b=UibzzQer0/Z27aYe84shXuHWDo4bIPhHIwF4PtXRxat2/Mr0euEQTYucRs7REOMSuJ
         VU7dPPHeL/yUhsrET0f2G5zXPyA/Re/4N5wxDTGembLZe6RzS7rJPSSJsz5lHfx3UkFW
         SfUgOLfa0Tjifp5eVPv4DsR7CpRBcS6TJc5ZObsF0LABXfP3WNWxajUwIQr3UeqNbJZt
         AuaE6QUNBl/GcdZWPk4/Pi7/cmT1VPGQhi6NYhzBA4yr9tpAtobYjUmZAb7ARr6Uq+/7
         Oz/AFzj5d/pvYj685xi/qs8Cn8WIFhBAdI11QYLOxc5yC3Bh6eQ1LFyGdjhHoM6CWarN
         pqqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795048438; x=1795653238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w8iB8hXj1rJtYCTecMKdoTMO0/3sA+9tX97nJ972+uI=;
        b=VJho4llA+WdmqV1L4NaSQJu2Qkl6/g8TP51ibBXCyirj3a/0nayo7CwAI7pNzui9DS
         nnTplYGj5qG5+H7FjzCo3Bl6xpfpdUAF8UcWsXqT1NNnkUjBPa0E8ZBY2Z3D3jaREBFH
         oQVeal3QEnj2HB8+2rLoS6QNJINx1C3C9E0aojkTcCYDt236z3ajPEsXf5nK8eLSHmbx
         6AdVeJuZ3LY8YkHWIRKo6EZ5G+VVi72izUoNs9Sr8OoliROtzru1nso+//ojueC3ESxQ
         n7N11LzfUJpYR7Q8Uh579X7dX4PaGP3R/xCneXMac057UQQea8bScxMzFmuiiBjr3tZX
         Hajg==
X-Forwarded-Encrypted: i=1; AL+hErEPuygsiMiSXUstZ0WOy2M3LcAcDk9J4kJoJkBZJzbvKBemd1ENWjPEig8hX60sleEEYMzTBaekdLvd6Gc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BySM0MJGZDTXNHjXGX7p70S80J0jgap+zjyYkeVFvl6TTiG0D
	O67nzkxBuyYeafz9qqDosJzsSGkPy1A1JhPCezNy1rY3ua/D1gvlOzwa
X-Gm-Gg: AYBFou3oKR8l4oTciYpeU4fM61+i7mx5jpBu1q+VI4fmCqfafUnEoG6rJ0GbPtF08HB
	MVKYR0MY2Frx6y5qMiUdc4BCBDRSXcj21maS5LtsrzRJkUXCdxbFnBMJfX+yRKffQcUHUYbyQPP
	rfFcsNcwSHyc7WsMS/pKwBrforzqYwkPcybEE35zfj8iVjFfr5/CNeuOZCUvKY2Gq8FLILBDwlF
	L6f68vgQdPR+ckqNhOMSAMFGhKv4CAfyX+K2IEmbQ4+cZ1hgyPAWtUfXHmAFXEcb4JS7A2b0m/2
	l7ax7SR4iW21vCvSK/JPz2UuoEz5tgV74KJwiY5+wqWi2L58pp0Gqd0o7RQIds2SB8iDehTX34X
	4ZYh3RRJCKsv9M7++Lbc7zrvoKzibc43T0vTHBC9nIF5L8ulbQFBD/zwVRvtvJwxHMhcfhBu4+j
	HhyUzSfElinWpYxkDe7+G6hptn2GMotmEVaeGzO3cm4bWmiNycLMR9dmIkVl9TX2YojGQiWL5An
	nyKGIK+ksfedfvW+fV3CmTWrg6hRVL49zgNu8bKAcwYlwgp/EDBXg56SG+iLD35E8UtWvpHx0Sl
	t5DksMCZY/5laMBoQo7kLoOx
X-Received: by 2002:a05:6a00:3e29:b0:8b6:5a07:7768 with SMTP id d2e1a72fcca58-8c5d305264dmr3968760b3a.21.1795048437940;
        Wed, 18 Nov 2026 16:33:57 -0800 (PST)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5c7f99f91sm1906491b3a.5.2026.11.18.16.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:33:57 -0800 (PST)
From: Cen Zhang <zzzccc427@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v5 3/4] Bluetooth: hci_core: Hold the request lock for the power-on update
Date: Thu, 19 Nov 2026 08:33:42 +0800
Message-Id: <pm-bluetooth-objects-candidate-0184-v12-e80229724d6ad14ca88c-3@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-bluetooth-objects-candidate-0184-v12-e80229724d6ad14ca88c-0@gmail.com>
References: <pm-bluetooth-objects-candidate-0184-v12-e80229724d6ad14ca88c-0@gmail.com>
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

When the controller is already up in the HCI_AUTO_OFF window, for
example after set_public_address() or set_external_config() queued
hdev->power_on, hci_power_on() runs hci_powered_update_sync() directly.
The update registers the SMP channels and sends HCI commands through
__hci_cmd_sync() and its variants, which require hdev->req_lock. Commit
cf75ad8b41d2 ("Bluetooth: hci_sync: Convert MGMT_SET_POWERED") dropped
the request lock that this path held around the update.

hdev->power_on runs on hdev->req_workqueue, which orders it with the
other request works, but not with request lock users in process context
such as the HCIDEVRESET ioctl or an rfkill block. Such a user can close
the controller after the HCI_UP test or while the update runs, and the
update then registers the SMP channels again after hci_dev_close_sync()
unregistered them:

  hdev->power_on                  HCIDEVRESET ioctl
  test HCI_UP
  clear HCI_AUTO_OFF
                                  hci_req_sync_lock()
                                  hci_dev_close_sync()
                                    smp_unregister()
  hci_powered_update_sync()
    smp_register()
    send HCI commands

Take the request lock again before testing that the controller is up, as
hci_power_on_sync() runs the same update with the lock held when
management powers on the controller through the cmd_sync queue.

Fixes: cf75ad8b41d2 ("Bluetooth: hci_sync: Convert MGMT_SET_POWERED")
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 net/bluetooth/hci_core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index 0c0180a616d15..be087b9fcf3df 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -1006,14 +1006,17 @@ static void hci_power_on(struct work_struct *work)
 
 	BT_DBG("%s", hdev->name);
 
+	hci_req_sync_lock(hdev);
 	if (test_bit(HCI_UP, &hdev->flags) &&
 	    hci_dev_test_flag(hdev, HCI_MGMT) &&
 	    hci_dev_test_and_clear_flag(hdev, HCI_AUTO_OFF)) {
 		cancel_delayed_work(&hdev->power_off);
 		err = hci_powered_update_sync(hdev);
+		hci_req_sync_unlock(hdev);
 		mgmt_power_on(hdev, err);
 		return;
 	}
+	hci_req_sync_unlock(hdev);
 
 	err = hci_dev_do_open(hdev);
 	if (err < 0) {
