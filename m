Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794975725;
	b=Dkm2XuaFI/5Lrx1LfJVavaIf7jYMqt+RQpijnBJEed2a8dlsl3209NKWrPLvk0MjdfzO
	 fLhoyPY+wO80AOc1X9zpx0TzybPRUo5ZA/rruhRanm5g7UJmOzNtU4/7owduG7xi8hpzp
	 gfJSyhLH828Q/Go39kgyU3tPdP5RNDf7SeFNWz/9SutzBctBQOyj0aWgRxN8Z0+lP/XFu
	 usNWIQqRy7AqRrBSWuJomKUC77d2+HT//6og17mGC+3LVzB3kJj4qlA7h+tCERP61VGBc
	 n4QA9a8Ols8+gvoAGV49HTq8DKt9BoHPF7JZhu+h2FQl5m2wfN1Eube7PiokvlKtKrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794975725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3ySKCiSWgBlwtkoa+bnMANotGsGSd06xoNSagHbZ3Ys=;
	b=kTu0+J1yhBgQmg2xd+WyE8Njh48JM7gjHAQ6RdL5VetLRbQNcaVbDUGfRBAAat4MPoXU
	 /BazmE1SwaZpKz7EIO3vATStd3xzztnc1isnBDhc2bdfA3YxZu12VdFd8BfZJFQNiipJH
	 S7KYXRXGHI66WhGm1TPVCMKEnX9gsjM4j7sy+vXyRRIzcMSgCvN8OGzVyK7sXh2+bsPET
	 TBRqRQ4suA0J0dzWsj/fKWeSEvfxNgAn+xlVAYgU9+J9c6kbpV/j+Hq0IBBm6Hu9KSVo8
	 1znZGZ+W2pcdFsbXrnTNIy+wOePjMDsChnz1cTjEL+cYEmJrXhz1GBKYIfH3udl4+CQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OGTHkrFj;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7D2606A330
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:22:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E7D2606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OGTHkrFj
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8a058315c79so261776b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794975725; x=1795580525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ySKCiSWgBlwtkoa+bnMANotGsGSd06xoNSagHbZ3Ys=;
        b=OGTHkrFjJwfpKZzlmvBYulpQV071JZlDp+TC5aiofULsAiovcElnfYklWWnUucIuJ+
         OZH0YHoGTt2nBfdpDzR1Bv9q2jrX89UzJTFNvoI2zMmY/aORykvFXvZpLJVA9BNb96oe
         3PO4vJSX7XRpIpH2w4GPLVizoGC2SCJbpsrR7XCNtrqTTR0fhv+yn0j3p0jMAXdSDgyo
         corC9PW35aSh/Dri2Q8b9yhEbQ11sx6mqhbN97vMRdfuHqqeo5+zagCTXsyFH4RwQKKx
         ON3PIy6bcTDQut0eHm6OGyyCkvtSeGGCrmuqY59j7xr/d8bKeHyn97kpTuZk78puYLgN
         zVeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794975725; x=1795580525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3ySKCiSWgBlwtkoa+bnMANotGsGSd06xoNSagHbZ3Ys=;
        b=a2tmLLKZXQsdDrmf8ni1atLoxq6zRvAD9msHCEWcJQQNTCBwSagNQfAJcCYWYL3Q6P
         EWfDDR19862LzjG/0R8KlSFuPdVDc6mF4OCTnEyCU1M9Nc0VxjGf35RTXAGTLkDYiJiV
         NaXo5HTW6B9zYQTQlV8uzn0T2HeTxb8TBXb73ARPnAtbJr2WFH9sQ65DdeqLP1BNHPMR
         w60hcoLenvS2WRSXgFLtQSI5P7lIgDDC6RBzhxWmrnLZo32MVmvyYpYHy0I6cogl1dcr
         bompHRRmuXqbgT5B2IcjbM2JpJqCjwCuyhGeTesUtpjZxK/0cn5ieI5tMRnpb9kse9oq
         k7vw==
X-Forwarded-Encrypted: i=1; AL+hErF6aDkcduOhAd6Bc0LFGNBEnIlg6WWzF7Z31FVvuqpuyWDOQdw7np2v/pD8JezLADNps9yowAgvUSb3qd4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8S7KxNum9IDztPWjCr0vr3/JjM5yBSvSsztWTnmvKlcLeTFMYI
	TzlOh3uLF3Vyn9G1onJAoglTS/18dGhDTqt9pZShVOELiSW8/UIS8TQ36Whpq1P3GFc=
X-Gm-Gg: AYBFou0pti7KSyZNbw+Mr6bToD18sXm2kbeOc2RfNnA3+aRIQlZlZ0LJJz1jwmGLsA/
	NFTdJiko4ZWEB+YlTW9rVMhV6l/Gj5TM90L9h1QNMSiPD++EF+ToP6ROEB+U9eiQHWVNRcifWJe
	rxcdlGika2V6aOdWqE60BnMKzF+44YUK+1cKnbpfbvwMOIyeWROtnR++RjX18+b5dV0xugRh+ph
	Z7zRFuMTk0js/yfrTdAWpsIxKpJmziAFftrCG9dHjCu8TNclT4/shnKkDZNp3j1n6rsJYT/25dX
	+p+R83ITVqYrdC/ApBJHcz9Li1jVqRcW94pnAGV+eGRpZeaJf3MS6joyFnn6a6hYbOQ/ElinlYL
	VDPGH8ydvyJJDr6bTqk5DG47H7HmDdNqkDJ3svbsGrgjDWJ36IgKQBX69yio9L2rIC5DfahGcap
	iPzoyJVIdxRagpn5BFPqbOUG7PMyWQO07hDVP7YKjovLXm1qoGtSiLjmE89bAS3+cZlKHNn9PYO
	AW3LyKw3UXch/TDgnzxpL5W4PmDColqE6lu5Uj2cD2Hm36taFe/SmKo1cSQQlaiRfLe2yPyb2EC
	16YILpmmwIg36aNlL742y5CW
X-Received: by 2002:a05:6a00:1994:b0:873:5267:dfd0 with SMTP id d2e1a72fcca58-8c5d101b6a4mr1020103b3a.5.1794975724498;
        Tue, 17 Nov 2026 20:22:04 -0800 (PST)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5ca7aaa8dsm455003b3a.10.2026.11.17.20.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:22:03 -0800 (PST)
From: Cen Zhang <zzzccc427@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v4 3/4] Bluetooth: hci_core: Hold the request lock for the power-on update
Date: Wed, 18 Nov 2026 12:21:37 +0800
Message-Id: <pm-bluetooth-objects-candidate-0184-v11-900043ed2303656c76fe-3@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-bluetooth-objects-candidate-0184-v11-900043ed2303656c76fe-0@gmail.com>
References: <pm-bluetooth-objects-candidate-0184-v11-900043ed2303656c76fe-0@gmail.com>
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
Assisted-by: LLM

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
