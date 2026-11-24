Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795554765;
	b=q8BvJ4AC+yCk8/na4LGf0Vx8pRMcIv9sbZvsxdncyEboM8OwEkN5BT1aLNK+LA+WbAZP
	 u8pERsUhYUUWvsWCYW73DKFzXCh+vACnUJ3fRXj0R89bzeb5WUrmDXZeIpqcorB3ZZ3qs
	 hd4tV5b+gfFvX8wNeP1qEqeC8SEu9Bn9XQRXG68z/cnXOjs9YvBFsiKkmBxZJxzXPNlO4
	 rGDgl3XiId7LqAd+eZ0kGv4p+4kKb93kB7B0cOtqr/Nv20HlgvHs3W+IFl3repjvYMU7o
	 y1A9cOtTPKxm4K7NzFHfa/Kilp+TFLO2dG7bglB5VVLikRNMG9sNB42hU2lvV96kIDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795554765;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WAbRXvtUTT0NIgHCi2z+9zTFRHAONM1bg+j6C43IpVE=;
	b=PAp7fgzKAZgovlTfxGZN6eozKxID8ijsxSaPMDo8QYBSR1l2pJlfGPqbPl22BBk4PJdE
	 IPY1GlSABAzKyh914e9nASUDwjqoN0I73R/mQAmJ+2BhN6Yukr8s+jTJAhxA2MMu1voV+
	 JUPUZir4imlvCrZzujBfNuFoX4p72oJU6Dm2p+ye94LIJuju3vFJcodkByCcfrzT1Wavd
	 N/b+FXbBZPokPj++Tw21+buzhRm5fuespThlsHEwdZnxW/XUjGbkg/8qJjikKEKeQdXTb
	 Ilb/Y0eo+XaUwCeQyNrivqClMT4OH6owTHDwoaGBQFEXijRIegjy9WKKYCRqHNLydvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wu3oHd+F;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11988606A323
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:12:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11988606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wu3oHd+F
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-380c28f9e35so6162917eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795554764; x=1796159564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WAbRXvtUTT0NIgHCi2z+9zTFRHAONM1bg+j6C43IpVE=;
        b=wu3oHd+FqdrQ3EOHIa9ttcXdZyH9OoPVyce5EjFgFp5wRuIbJ/AXBPeu+1dm1ia86Q
         rM2vBO3y9vsH5VymHJlyJbNAokV3K+JNj3n5q/oj9pM9Fyphpak1bdf9gY7we7KkDSml
         NYZK3JoQLda7i4DGMUPe0XGdrSnoGFCYhwFkA9LTtnS1NVZspu+l7xoTwUrksi16yrh4
         kVgY5rcH3wXiITbW5PrQAZPVZwn7iciZghef6tmKU6csm4VuN+Vvj8/TiSyCyAj3jyos
         eg77E2cbn4tadNo9OzymEgLEu2H9K8lRqX+i+OlPeN9vIAqGm1OrcCD8kRv4UMl05K85
         rRAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795554764; x=1796159564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WAbRXvtUTT0NIgHCi2z+9zTFRHAONM1bg+j6C43IpVE=;
        b=ACJb+bcNmqQvwBBX5o1d5jLllpdcQ7nMzKn1Vqe2rczndkXhCW5BpmGy7rcbe/sthJ
         brtIwYgaQxaQAAUtcIXn+jMK5GpCkGXsvhB6+gwoHB3wMO+A7F80Truur2PVw/QNyUHY
         IGulqmj7S3MHuM3czJpsOBDfQyRLjFKk3zZukbj4be6j3MCDXBxgRm2LSPo433rCtZFN
         R3gmpOIiW4hIi60+CM9foI3eKUmlCC1QDtbPNC8v9LGwFwjpnyVk+CfCzhhhyeweiX22
         oEnlPJPaLjea6a2E05MVCEQZmLs0PfimP4ZHg6LAw8vjSgXwr2PhUn8wnrThwpEfLCqf
         9/JA==
X-Forwarded-Encrypted: i=1; AL+hErG4e4anZHwGph0b7hbGL03QDad26er0SBIGBa9NeM3mNwLwM6xJCJY9vkNx1t+DFCILV8sCYI6MgoQG3as=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XZEmePg7CrWZgRqsMdByYk5hEm2F+Tq8viBQvY+N4/N2PkI+J
	nmu8fJp+5Cgqmb96rpL7izNxLr3Tv0y6bL71MXcYH4o7OrqpOO0OAzjcVGLq+mHUxTU=
X-Gm-Gg: AZFdTZelYOXMTTjoD2mGoAxBS0wX9leKAW6s8jas6sbceEJKCYkWmxDvn3GcuNRGJFB
	gkR0HUgFImcp1/3yf+MuOpjoyOw2y1+N8jd+TALmulcloQ5Mpr5ZZWg15GTPkjWg/9yu0jhjbsW
	CwCTGRLRb2VOfJHvii0V/yk7u9c4/NoFvNXG/hNWh1VGTF6aAn5luZOdoJBN/JcZlz04D1S0OOW
	Xw7obQabYux5A8g0p+pHnMfCk0KOEdepCobOZPrkrOzDqw2mZmdDk8oToX5f134Ps5MlHDWSiPB
	k2hZFc0stqx9BFThQOriGW1gfpMxogEoHrkGquWAKhpr5Gg3V8DgFI6zHVxjHbfwv3igpFtUuD6
	/qf8o/7aqs0oHujXlOgapXevgNrS26JhhERbfSCDH2md/w6KfkDCzUKgSSYT//t9o1rMCKZkuwJ
	zHghPG9coTVlCc8ZJNzSJVyOe2zbQuVY/dPuYzvk4QpbA5YPkZfu4/yfyu8xXOLe33nPqRQxcvy
	DBsnjVOpVPaj41BvRbqoV0GcVKdkkEDcinRPDdeCulcNFVrkNDap8G6r5YKBQfxaCZ1u1ylmBWb
	fvP44A5bU743ixNXCyN3Wf47XzeAx0NO
X-Received: by 2002:a05:7300:50fa:b0:383:9f52:e54d with SMTP id 5a478bee46e88-3856ff52e83mr17664728eec.8.1795554764073;
        Tue, 24 Nov 2026 13:12:44 -0800 (PST)
Received: from shine.local ([168.196.221.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm22124445eec.18.2026.11.24.13.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:12:43 -0800 (PST)
From: "Andrei A. Bykov" <andreiab9019@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] Bluetooth: hci_sync: keep unrelated replies away from event waiters
Date: Tue, 24 Nov 2026 18:11:26 -0300
Message-ID: <20261124211127.41609-2-andreiab9019@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124211127.41609-1-andreiab9019@gmail.com>
References: <20261124211127.41609-1-andreiab9019@gmail.com>
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

An asynchronous command can finish while a synchronous request waits for
its terminal event. For example, an LE LTK Request Reply can complete
before LE Read Remote Features Complete arrives. Completing the waiter
with that reply releases the feature-discovery hold too early.

Keep valid unrelated Command Complete and Command Status replies away
from event waiters after processing their command handlers and credits.
Continue scheduling queued commands and preserve unmatched Reset recovery.

Do not identify the current waiter solely by HCI_CMD_PENDING: timeout
and cancellation can leave it set with an old req_skb. Capture the actual
synchronous command carrying HCI_REQ_SKB even when that flag is already
set. Callback-less commands must not replace the waiter. Drop the stale
socket reference when replacing the request, but preserve the same skb
backing storage and socket reference when Reset recovery resends it.
The request skb is still replaced on the ordered command/event workqueue.

This also lets the next synchronous command complete normally after an
event timeout, without waiting for the old terminal event to arrive.

Fixes: 2615fd9a7c25 ("Bluetooth: hci_sync: Fix overwriting request callback")
Signed-off-by: Andrei A. Bykov <andreiab9019@gmail.com>
---
 net/bluetooth/hci_core.c  | 16 +++++++++++++++-
 net/bluetooth/hci_event.c | 26 ++++++++++++++++++++++++++
 2 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index 024960e9af..072ab361fe 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -4386,11 +4386,25 @@ static int hci_send_cmd_sync(struct hci_dev *hdev, struct sk_buff *skb)
 		kfree_skb(skb);
 	}
 
+	/* A synchronous command starts a new waiter, even if an earlier
+	 * event waiter timed out without clearing HCI_CMD_PENDING. Commands
+	 * without a completion callback must not replace the waiter.
+	 */
 	if (READ_ONCE(hdev->req_status) == HCI_REQ_PEND &&
-	    !hci_dev_test_and_set_flag(hdev, HCI_CMD_PENDING)) {
+	    (bt_cb(hdev->sent_cmd)->hci.req_flags & HCI_REQ_SKB)) {
+		/* hci_resend_last() clones the same command during reset
+		 * recovery. It does not own another socket reference.
+		 */
+		if (hdev->req_skb &&
+		    hdev->req_skb->head == hdev->sent_cmd->head)
+			return err;
+
 		hci_dev_lock(hdev);
+		if (hdev->req_skb && hci_skb_sk(hdev->req_skb))
+			sock_put(hci_skb_sk(hdev->req_skb));
 		kfree_skb(hdev->req_skb);
 		hdev->req_skb = skb_get(hdev->sent_cmd);
+		hci_dev_set_flag(hdev, HCI_CMD_PENDING);
 		hci_dev_unlock(hdev);
 	}
 
diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index bdeb86f78a..7991db54c2 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -4862,6 +4862,18 @@ static void hci_cmd_complete_evt(struct hci_dev *hdev, void *data,
 
 	handle_cmd_cnt_and_timer(hdev, ev->ncmd);
 
+	/* An unrelated command may complete while a request waits for its
+	 * terminal event. Process the reply and command credits, but do not
+	 * complete the pending request with that command's response.
+	 * Unmatched replies must still reach hci_req_cmd_complete(), e.g.
+	 * for the spontaneous Reset workaround during initialization.
+	 */
+	if (READ_ONCE(hdev->req_status) == HCI_REQ_PEND &&
+	    hdev->req_skb && hci_skb_event(hdev->req_skb) &&
+	    hci_skb_opcode(hdev->req_skb) != *opcode &&
+	    hci_sent_cmd_data(hdev, *opcode))
+		goto queue_next;
+
 	hci_req_cmd_complete(hdev, *opcode, *status, req_complete,
 			     req_complete_skb);
 
@@ -4871,6 +4883,7 @@ static void hci_cmd_complete_evt(struct hci_dev *hdev, void *data,
 		return;
 	}
 
+queue_next:
 	if (atomic_read(&hdev->cmd_cnt) && !skb_queue_empty(&hdev->cmd_q))
 		queue_work(hdev->workqueue, &hdev->cmd_work);
 }
@@ -4982,6 +4995,18 @@ static void hci_cmd_status_evt(struct hci_dev *hdev, void *data,
 
 	handle_cmd_cnt_and_timer(hdev, ev->ncmd);
 
+	/* An unrelated command may complete while a request waits for its
+	 * terminal event. Process the reply and command credits, but do not
+	 * complete the pending request with that command's response.
+	 * Unmatched replies must still reach hci_req_cmd_complete(), e.g.
+	 * for the spontaneous Reset workaround during initialization.
+	 */
+	if (READ_ONCE(hdev->req_status) == HCI_REQ_PEND &&
+	    hdev->req_skb && hci_skb_event(hdev->req_skb) &&
+	    hci_skb_opcode(hdev->req_skb) != *opcode &&
+	    hci_sent_cmd_data(hdev, *opcode))
+		goto queue_next;
+
 	/* Indicate request completion if the command failed. Also, if
 	 * we're not waiting for a special event and we get a success
 	 * command status we should try to flag the request as completed
@@ -4998,6 +5023,7 @@ static void hci_cmd_status_evt(struct hci_dev *hdev, void *data,
 		}
 	}
 
+queue_next:
 	if (atomic_read(&hdev->cmd_cnt) && !skb_queue_empty(&hdev->cmd_q))
 		queue_work(hdev->workqueue, &hdev->cmd_work);
 }
-- 
2.56.1

