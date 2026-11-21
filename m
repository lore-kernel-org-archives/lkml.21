Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795231933;
	b=XiBZrNepO5VP6itCanUHRtFYmaw5mpAo8pBq17bAgiCSTg5l3cAGGTCFiEBqRE/nxwgS
	 nWHITkeivVk428nCos5hqZbLlQ2zZUeWqeuMkOurm8XsswUgG4KFM//CMIBnonR55G3j1
	 7LMhk56e/xpRknM1Vdf+UYUwoMXtAx9wmZgIp6l2kE0EG5XLrHmXQ31eVkNLaK1J4GWD4
	 o6ex1Ezxg0sJ6xJT0x8zhW8fyYTP2sJlAxYmsVp1m36igDRl3AXfjEZAMOEch3683VmjB
	 TYt3JXM3ZhpAWy8CeFzRDVLX8g4FEWNNKUKC99myFCgsUr1aICYHCOEl8Kn+pYcrIpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795231933;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dzWuG6elwKYIyR9wRkORUHH+YbmAZopYlbWmaOd8JNo=;
	b=EEwzEbTgCHWmBJWwqolNruD2jlEiiJWBRp2NAMGWtQi7bf78iqF9ApXExc63j1cEa4s0
	 WdX8HPFdBQUSnbTzOZ8/y6ekB5oU4OASfBgUmUXXaFLbOi4paaATI+vUzogbfk4lEYPLJ
	 tbfmP6HTZq5OXYvNxlY7mu1p8apMJEzy82eZyRwvxqV+f2wlRqRo/cdVpvsnuTv/+mXNc
	 ukiPbREgKbILg4HFxiNHw1K20J/XEfoDFd5zwkVhpF5/aobmwdU+3dZkyzeUCb/BhFJrs
	 GiDzutdiy4UdqJ8DPkPRAhUQUfUrvQWulNe84dAHet8GSAXT/qAaeo7w5G8RM7lyMfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S9SuaIVz;
	arc=none smtp.remote-ip=209.85.217.47
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC846606A332
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 03:32:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC846606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S9SuaIVz
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-745497ac8fcso606907137.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795231925; x=1795836725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dzWuG6elwKYIyR9wRkORUHH+YbmAZopYlbWmaOd8JNo=;
        b=S9SuaIVzCYiKD90jD7PQ6ZrHG11/xh1E3qFOAg6JWmhjAnH5BNq2uLnNHSK1DUJEqF
         HzrQPaR2It0olkcGNuV0Y4Lv3iRHKqIIKMKnvPZ5dnaM9XM/KKQX3CJvK6xa9x+/W1Ub
         VMjQefjHQX5iwvtdlNwaYjwyZrGLm/cQ8vWZJTeKQZbBJTL/tFS2Ws/Dm6Rq8LNZIvKy
         7XdOh7dbqgSNpX+XIHmnce5cUcH2HSn93/Rtfqr68Qs0VTThNLxU2iyNjZfLPw91QDw2
         MlQX/+m1XtPPwra22MV16Xa2JnbQqtsuxCGc6R+HGiELG09dn5fLA/5bHKKHGyKiLAt6
         rbrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795231925; x=1795836725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dzWuG6elwKYIyR9wRkORUHH+YbmAZopYlbWmaOd8JNo=;
        b=zzddthXgoXgBRxwLH/EhQA0f9NJeLcWu5lKJPs3wpMvfglTpSqFYfytGum5twoIOQy
         oLUAn861xtIOXC5oHAOy1UXzhcTblIC75PP4B0pI5rJ9oCXnU3sTX9wXfWav/rE1kzpG
         2Cz+WkH0vnHntETiIQo8BIxFGw9m6MUTA6GKwiZTzTPCHT2gcSyYDsI7EszC2PdybHU3
         iW5nWY6gKFXN9iDG+nMAy/Uvsd6wmr3B1Qe7pJAvAxkt1nYQ0QhZ9SAejxZy9Icuyjr3
         9NM8Xr1996kLU45hnML67YFvKd/SJscrfTlSExMA72L8klQ/bWJJqxSd4rXk1MylOmhn
         puwA==
X-Forwarded-Encrypted: i=1; AL+hErFy3JCxzpfLI1b7JHvpcebt4YNk5N/5C5P52DoPjdHUhjr6sinAuZnd4Ku+A3Bxq6XDyJNdgraz2OL52HA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DD+qNrKpap7Dw0m8Bl2Dd3I8luCyutHL7UJT3y+1mqwkAf3v5
	t+13UPEDh36gfvd2WJvpLcV70krh5u6QxKXYSQMl718RYmHh/nkwZZOKTCYeD2GYAao=
X-Gm-Gg: AZFdTZdQCX08T1njqpfheyWqCFyAdgkNRcO8erAU3O09CTduuCaEezS4bEhf0V0k5id
	7n2UWlJNoK5Jd4EczrjqWph/6fcKvTx9WhOtoOeGUpmlf0BRQ3s925MBynHSVFOKvfQASkviu8X
	Zc3FsDAIw+DlG6wu/j/vD76DBknHblzpoffYVK5RXb7plgXTN62KgWbHud0DDox+/M8n6lliMPv
	HESU0aBmFSwMVrB+uhXdUad6Nkraz4eCTdNC8Md5e8MPfftk0WmTKv/HYag/610oAMLuBWaU+TI
	sJY5XVfUW0MLZzwoOqeaQ4uD+fgvRdQKz1n6lK8BSdhxhGFxYepelPtfnScLM+hQSydfJvc0jNS
	X+yFhC9pg26jsLybhBAX+X6pZFp5ZM6VJEb4fkQVP28OClg7VV4kgs85r+yIKy9uByNwdGl252s
	WyWimGuIHWUyIHm9/Bv22DZixOhXcapoODUy5z03LYInLdJpzdtupOrak/naXTR6QyYLL/55rnv
	1dGXxfBoX9erT0DGknQNaVApvsFSVMfefBR5QXJ0OHR4IRnXeUcutI/YTN+HNGApVAh7AoEceoD
	ISdZmeuBZWv+TwHXqhjMKZoVnsoS2JV0/g==
X-Received: by 2002:a05:6102:6f06:b0:7d2:8e49:f90e with SMTP id ada2fe7eead31-7d7395fe209mr1549680137.27.1795231924815;
        Fri, 20 Nov 2026 19:32:04 -0800 (PST)
Received: from shine.local ([168.196.221.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e7f3d7bcsm4871081137.4.2026.11.20.19.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 19:32:04 -0800 (PST)
From: "Andrei A. Bykov" <andreiab9019@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] Bluetooth: hci_event: keep event waiters pending on unrelated replies
Date: Sat, 21 Nov 2026 00:31:03 -0300
Message-ID: <20261121033104.441146-2-andreiab9019@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121033104.441146-1-andreiab9019@gmail.com>
References: <20261121033104.441146-1-andreiab9019@gmail.com>
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

An incoming bonded LE connection may issue LE Read Remote Features and
wait for its terminal event while responding to an LTK Request with an
asynchronous LTK Request Reply.

hci_req_cmd_complete() accepts the reply as a valid sent command but
selects the completion callback from req_skb. If req_skb still belongs to
Remote Features, the LTK reply completes that request before its terminal
event arrives. This releases the feature hold while the connection is
still in BT_CONFIG and can immediately disconnect it.

Keep an active request with a terminal event pending when a valid reply
belongs to a different opcode. Apply the guard to Command Complete and
Command Status after command-specific handling and command-credit
updates, and continue scheduling queued commands.

Limit the guard to an active waiter. Replies following cancellation or
timeout retain the existing pending-flag cleanup. Unmatched replies still
reach the spontaneous Reset recovery path, and matching replies retain
their existing completion semantics.

Observed with an Intel AX210 peripheral, BlueZ 5.88 and a bonded Windows
central. Three unpatched attempts disconnected immediately after LTK
Reply completion, before Remote Features completion.

Fixes: 2615fd9a7c25 ("Bluetooth: hci_sync: Fix overwriting request callback")
Signed-off-by: Andrei A. Bykov <andreiab9019@gmail.com>
---
 net/bluetooth/hci_event.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index ab875b9..5281551 100644
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
