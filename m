Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612154;
	b=jyEqg3g95UEvHGRPv0HZZtZJTc7Lflw4ogaa6zikoUGgsZme5aXNng3Ta0FtmYWGcfot
	 38TN0J4LSM5lk5xekfx3XDjTlJoHplyPxn8zaNndpxXU+TGX8/0PnWsbXw2GSSmRyAFdq
	 29hvTh5PYRaWsR2EJKfI5K4pclE/KDIP+uis2cGfurt1iGXSvZGXWLy2wiukByQhz1aU5
	 cYEXWY3jSR7+85PQEoNKSaNN02q3X7tiS6/OtmxV/55cSDAWVJIAT5nKUb8XXmwDOKn8a
	 b9ex7xMr2p/gStwoXD7R/lNma+Hhp6GdPXZDaSKOe3cnd5FDmYwOQcpS0kYPEQVZGhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PHAySPim9C43/yZnOc3cvmysHiJR3smT0StLMumDRAI=;
	b=xkxC7oOXZq/mFWgjiBTNsM8c8tQMa0wTxy54RDP7O+fiksUKeDFDYv7tHN4N3wMLCtvO
	 w6lrHxT524ISZ2dZgeY13HARmHEfnekaQKQ596XtpP9qwx4CfiHPwizwezzdSYXmJAmRE
	 boDmcFfWvglqq0swGwbdUFpbQQFBFLcjHEYOHwM13B8nAv5EHxAkEVSx9vo+fgrCSik7C
	 rRqOTm9Fqd0opk9mCdhtEHF8nkpGqJwR/zzSBypuZCYaZ2dq29oXyVdOrQdt6BLESXJdB
	 VK0Jw/Gkvg7jcl5laU66cKZtTmFZlpnZmIO/QqAepQWbAN3Xat8vgJd4e98R7gmn4IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RxsJJchF;
	arc=none smtp.remote-ip=209.85.222.49
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F344606A337
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:09:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F344606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RxsJJchF
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-98301b325c4so1576065241.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795612153; x=1796216953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PHAySPim9C43/yZnOc3cvmysHiJR3smT0StLMumDRAI=;
        b=RxsJJchFa6vwNKJ5kT7eX7qkOiUJtxEsvnKmz2KCQv7xtV4H+inaaf3uvySby+Yl+O
         s2tJnaeQBMj0IckjOmw3kf25yy++QnPlSZBmnea8u5Y0eKL8ZqzBZ/55XxRHb1v9+2PW
         CyUgTJtPqbykeIvbxG2QDipU4+Kkqu4xx8MTBBY/LK2bB6Xs9pCuF1QuK/LYdP63/yoS
         89dXoIKxASIECMp7rgQdEoK695sFT8+QVm82j6idoh0pwxETrkP8CoTZImoeYKhd+dCS
         aLenBsH6/fJd3QqX/zTces7ARUklHWkw+k2u/ny6SBoAajIVEuairxsEh8Rk4R/WKXTv
         AHYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612153; x=1796216953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PHAySPim9C43/yZnOc3cvmysHiJR3smT0StLMumDRAI=;
        b=Dq06KXvBazScIAWQqSoXFHLNPiKsKhr/anaErYpgCaNCA36C8cari46dNu0P1nVk8H
         pIrhIjBJP656ZFB5ozN6PEGQ9vb/JM6PEKvsRU32SgxPuWXyiJp9S7ipsmbYAxPa3FYV
         KR4L2bbsBMNkXy0Poz6mH2aQ0v3yhGOs4IZdJstT2OPYfUdZayU2UF9OX5FKsp5wk6So
         KGVfF/yvGYjIt06rA0sRzBu6Us3Zeo4ElYw8tdTT8vO3pMFecC998CzDQ3+i0Ci11NC5
         m6ZMUL9TqNURabSUzL8ULGgeM9ebl++dwWNxsJEzndFSHudW/YLiWHjFhg9eVyv4ZCjR
         pXbg==
X-Forwarded-Encrypted: i=1; AL+hErG8EDnoYomk2Ecz/SK94H+N6LzhiC0DmaYmgo9/bdW0SuNapRblYNV8i2x0ygG3GaSkJDRTpQT21luH1QA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XLtjy0CCBP3+xpoq6z00+/C1ZBrcumuFvXPcd+KX2IpI1GSfe
	913Lx8QYw0upLkmBVL+QpB2WLvTZh878RmfXD5b5hkPIKY9kk2tBfiW8IQePRbNZ
X-Gm-Gg: AZFdTZdqPF89ReYTvOK/Kd3f3LLASSv21XjiDuEZKXuZxSVXFTVQj1SF+ka7GISksgx
	ZOBoiPAJqDPn3yxHcXc8k5NTZ2ZqK6FowjDFTs0rQPJpqVPreDDoiMoxBPh609pSGLMcTlslXfY
	P+6QA2FVg7AdmAQVY75MNtCl91DYqZSXZKHV9QTT//YZNo3gvTRhhb+YtGMc+9l5T3P6nTDQhUz
	nxZDYLUW1lZj2DDc65eqJ/8hOBj5YCTNpMFMGkJ3O/HYfnCNqpTfagbIzkgT+uocSoEShwUIuPq
	x5SwEbmKiMuTjkdg6g4FWLFTwwi6TLN5bPZWbVZi9iEISeME6foWgLfHob43LXVE+cWs2WDGL96
	Q8gLft2jMEdSQZZKLYbK8ytM8WP6GP4EQPK98nFqatJjDJzwrYXHytNtHi50A/Lag0huXH9P+Rc
	AO87fwaTG5MBwo6sazjMHtZkCSZw6gHlRzsERTFQPrpquTNDLmTmlLf4iBMG17EmALtHNaevm4z
	Y4+eG06Z3HnjkFVaz7/HuQ/Tv1EU3AuH7m9aZpLwuH4Z0+yRveEu/5tOWGB+KLz2aoq4ceMvH1Q
	JBlHZKTU90wJAG0zfWlxfcR8fsE+H1H36eYvhVM5dqbKRhQxa1+qWw==
X-Received: by 2002:a05:6122:310f:b0:5ee:13ad:6c8c with SMTP id 71dfb90a1353d-5ee8aeaadcfmr8794727e0c.7.1795612153064;
        Wed, 25 Nov 2026 05:09:13 -0800 (PST)
Received: from shine.local ([168.196.221.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee8b60b201sm17299447e0c.14.2026.11.25.05.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:09:12 -0800 (PST)
From: "Andrei A. Bykov" <andreiab9019@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] Bluetooth: hci_sync: keep unrelated replies away from event waiters
Date: Wed, 25 Nov 2026 10:08:27 -0300
Message-ID: <20261125130828.18441-2-andreiab9019@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125130828.18441-1-andreiab9019@gmail.com>
References: <20261125130828.18441-1-andreiab9019@gmail.com>
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
index 024960e9a..072ab361f 100644
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
index a9b6a6cca..014207d2d 100644
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

