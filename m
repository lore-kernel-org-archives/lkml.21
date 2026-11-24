Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795529438;
	b=IppbhBM0uOpy4epcoumbaJHW7BM/7/R28nr5Kxzvr3LHjpnv7xixS0FhZiX9JoUe9NK5
	 IdHIa0D9G2vnyBsmywORvptsW0PFQsBuGCYThNJJ+L8C1ej1uxyJq1dK8J1BukqAiXKlq
	 chuxJlmM/ffp2A1Mk2j9pdVOm7BIRtqmIUGLJcuZEjxhheNhCSIQn1qhGnzsVtptMDXRN
	 Yavine8dbamlc9mLBxN6kR9Ojdw7RLv4Gb0QZ34e0bOXuDN7CZjRNqxmcZzcOCgUbKnQR
	 1gZprz9rKch/l9pS0sMkK8+eNgGXgxlpM25imDaf8XIccLTtfVWKNrGxvVnFA+GDPLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795529438;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=usmzJFstSB4DaIIYnuydnpavcKscN4qLr3YgErVbc3U=;
	b=m2RrnPzw4KPjwvz/iDy1n0cnQhRj3KFgL3Szf99pqgb+tTQ9nj2takcMFTBiER8xj45A
	 nVkdqyiXQfDr4D8XEmctNPxjlp0S+Ks4fnoei5iE//+08oFmxW2jsKhx1Zl3fZuNh2nqb
	 un3CJtlTaLDeP8Nr4xVhULRtR1/DNi/iJqWe2OIv8uzShXwxqjHgamlTPOia6MtIeiJs3
	 uANf7+1+PkfEx5wOBgRTPJMztfTPyXFFAIHliXFPs7vTDl8B4K8HaidrLLE8bIt5KF3ee
	 wUPHYaddj036SsiOSwccY3yjXTG3/3Gc48LeQHHeDVeS5hKdRkywsuF6C0pH1bHzSWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J9xxH0Dy;
	arc=none smtp.remote-ip=209.85.222.43
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF91606A68C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:10:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFF91606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J9xxH0Dy
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-99c042cee7dso2440587241.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795529437; x=1796134237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=usmzJFstSB4DaIIYnuydnpavcKscN4qLr3YgErVbc3U=;
        b=J9xxH0DyVAEP6rqizec2uRhXIk6WsXIIIydwKq9un+IGnZ/tNvdJ8AAH5iBjjvg0IN
         2/+VamcKewv8Wr4uvNlCHEsY3jQIMV/MUZKA7eoNHgVN/Glqog7Ai5TbDMysKq4gGxPd
         4/apyJp72vyLpTWnDjvzequRa2brK/kF3zEJa+avxORP09Z+zJ5RfsoCyeB1QQ18+EMJ
         BWZblITOHAaLFcIFw3bcjo53LbP7JnUZo9FGrxJ1ghPha3VcxIaZ821dUBkQayWQC7+R
         pbRW96CNMpyn+eLn+b6SkryUZYD1KEMjRQIvC0JqaWzufKmX/VF6NqgBO3jyaANJ+eMB
         +e1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795529437; x=1796134237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=usmzJFstSB4DaIIYnuydnpavcKscN4qLr3YgErVbc3U=;
        b=E5nxDpv9CJaMjoZh07ZdqDIWx2MDlT8JszXwIkbbtpjDL6O4OS9WReUPWSErhEQBFv
         rbxBpTN0JTy2uq3cG+Hvxz05oySOVjPqCIn6hnlUukJUTczIAEHVbNuIx9QrbiVzrYWG
         odhIzQmj9XNVNvLugf5p2a7qcRfTMvRr/3CKP+I8ntrmNCHKVH9B7gIkFdee5/A687uV
         TaKCmv0ZJF2nRyG0z8mQchSfyr+PyUdPvkkt6lfTdADJBhwinfHR0VCRaSG0hj8I9wuX
         W8321+QilLsG0PGKHJtZzdhVcOvFhxb4sni1nfCXtXM56aFMW+nfnZpBcTyHEsRBImWi
         K0lw==
X-Forwarded-Encrypted: i=1; AL+hErENj7AHRgDYXUwh/kq9hXnNxmP6Thviw2Zc7y4P1bvxZy0H0jgUqpNQ5zccs0e8y4q8GO+dF7CuCPquVuk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GMulFsFJyt8+mZ4TwYaMwYwrZoOS/2zGBk+qzwy9oiOMR10Ye
	J2eeMdkHphmiODtKnbWL0PwXEvcO8FtlXhTGvMWMaRGDyDh00/BUUHBd
X-Gm-Gg: AZFdTZc7ZZsgi4d0y90atzk/u9Q6p10Pre2B2gOpZ8YMtyqER/h1Cv8fFkI3+xF3Y+a
	ianpIXpwlZtQyZpblbGzDnACenmuzRsPL+fQAoJEo2sUwhsZ6zdCGAFNMczs7cAVy4JjnnS/A4+
	woh1wZrQMLEQCkheN5gnxkXcoKbi8gVT++f9Q5V51lUtFCayu34DGYqcfU4WD2Ue4GuxChFHlSh
	l0piP1NFodRDrl1CtJIytstL4tiFeVKzE9gzR1FpE4qlUzYLPU/42TXDX7QN3ddzMYytLhWR470
	3U6PU03koQqs521lHeNirj9uxCe0PgB0vBbzP5VNCPTuIb2f+/soCEw2sdrSnMnHVfbDwhNq8Fy
	b5ZRN4Zw/7F7HXElSZU4mrWhqMH367zaXWDN6GbxmOulTCZXcRLL31zPhr8qGFDxu50pizgvMnq
	HxXKvIAzeukJLY3DunCjgNB7wFrlIdK05kKvlQHW0iqQ/VWlIIJUPjCCZCdB1hTR91zIsCVeX71
	38irpKI0Ha6WMCAZTLzWSELFxrDlpnZuUee+DEZ7+nswjyfwOGaDEpe3EfnstlJOoWIyGNS46Uu
	DKFnT+ZvivdN/qMf/Q==
X-Received: by 2002:a05:6122:6162:b0:5c9:a60c:273d with SMTP id 71dfb90a1353d-5ee8af7629cmr8104492e0c.21.1795529436577;
        Tue, 24 Nov 2026 06:10:36 -0800 (PST)
Received: from shine.local ([168.196.221.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee8b555137sm14056121e0c.3.2026.11.24.06.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:10:36 -0800 (PST)
From: "Andrei A. Bykov" <andreiab9019@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] Bluetooth: hci_sync: keep unrelated replies away from event waiters
Date: Tue, 24 Nov 2026 11:09:55 -0300
Message-ID: <20261124140956.15296-2-andreiab9019@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124140956.15296-1-andreiab9019@gmail.com>
References: <20261124140956.15296-1-andreiab9019@gmail.com>
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
index 255005916..ae0773a81 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -4284,11 +4284,25 @@ static int hci_send_cmd_sync(struct hci_dev *hdev, struct sk_buff *skb)
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
index 039bcea98..477b876fd 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -4487,6 +4487,18 @@ static void hci_cmd_complete_evt(struct hci_dev *hdev, void *data,
 
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
 
@@ -4496,6 +4508,7 @@ static void hci_cmd_complete_evt(struct hci_dev *hdev, void *data,
 		return;
 	}
 
+queue_next:
 	if (atomic_read(&hdev->cmd_cnt) && !skb_queue_empty(&hdev->cmd_q))
 		queue_work(hdev->workqueue, &hdev->cmd_work);
 }
@@ -4606,6 +4619,18 @@ static void hci_cmd_status_evt(struct hci_dev *hdev, void *data,
 
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
@@ -4622,6 +4647,7 @@ static void hci_cmd_status_evt(struct hci_dev *hdev, void *data,
 		}
 	}
 
+queue_next:
 	if (atomic_read(&hdev->cmd_cnt) && !skb_queue_empty(&hdev->cmd_q))
 		queue_work(hdev->workqueue, &hdev->cmd_work);
 }
-- 
2.56.1

