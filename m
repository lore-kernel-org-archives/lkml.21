Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795087467;
	b=pq4W8D0Ir1xOWL86UMeZ8ZmGep7j7JQ8iubaIWKW+2fGDM9/XYR1Mvteg5xaqNSRLP3f
	 lwAFAheWp9axo7eBx2YVxbjj47+42oQhhoh668R1+1cHUNxnRLhpVFcAaJFrTEeruy0Cy
	 ECnRmF/rU81OIJe93HQTkMJQ8363UMppaGTe7SEYyY21gIn43et+eYe6mx90RXgH7LXoo
	 ffULFTznF1oJkBErE9ps4fWQA/HXdPUizUGvfe2SFQZE99lfm9PnYt4gjzp9/czvCHah2
	 9ra06ll+iIiNPjUvUWEl3uyi/DqK0d8z76qdsx7bKJaK91MxMqNzGcNGtuYKaWRsomg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795087467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/1a2zhpdMOBK0mOqw/Tno4RXP4oEFs74drCisxFYseU=;
	b=k8r/YndrH1aJrNpdjtkxk4o1hy9NX32LEkmLqZWrgJoFABo5hEnjKg2quaKBTh701ZC8
	 ziV/Z05umxnKotUCYkEdxme5RhrZLk/ApbgH+DgFqk7wal9AIWECyAqDwYqQM8i9X2VBY
	 HrOYxW2NRyusWxKRVVpAXCOpdqLWkMBOmfmf6+yzt65PBLYZXq5Qqllyg5RFBO+MWUUd+
	 SHGqgvr9dnmvKSRhpyEOoOLVyIpGuRNNkpUfM1oQKUWNIJclO3yj6bII1dziJRBnMQ0mp
	 1qmGfkrTHjbEL57ysfF+0bYfEAlu4Jn/37yQg/CEF4ToQfPOLqUfu2stJPBjRT1tnVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ISpxDJ5D;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49D5606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:24:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A49D5606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ISpxDJ5D
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2f037bc348dso1434525ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795087466; x=1795692266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/1a2zhpdMOBK0mOqw/Tno4RXP4oEFs74drCisxFYseU=;
        b=ISpxDJ5DVGF8N/aDoxpxQdXM4+cJL6qMmIH5RKsZQMoGzMcIXLk4VJfefJXnTwINzV
         4Ku7wouKuWuV0Dzw8z1IBDzEC2rtaKEJtKIj/Px36IRP/VBEOsFy7B0la+qImczYSi2u
         T/rq4CNWanmRV600ZLKCDKttYVJdniPRZ4bc2ZaJx6kfkNn7YaAYUUh3RM0sRNMapcr0
         SugVjQMLwU/9Faln1uxt/pC72FprBdrkp1SXmTJrJcdo45jpoy+FfWJVf68cwBspkjWQ
         NQgHgLIJ+USu0JknlFUXV2LIqLOWAwma8/dQm6dy9mrlGYI9qHEUABczO4OoMpuUYcgy
         PxOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795087466; x=1795692266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/1a2zhpdMOBK0mOqw/Tno4RXP4oEFs74drCisxFYseU=;
        b=se9oefApL0z5e5c2UbaOaeK27fpzkUSdos8FVdssySYtb0Cub41AQ8mmCLqOlLt5NR
         Oz3eiV4VXtXMpOfrny1pp4eLPHoLuhwSuDIOQL6Ebg4mDq1sLPkXK0tsn1t4122Q/r+2
         kTbwV/XkJs2kFa6Ia8gMGRrc/rrgIYXhPs7n9w0gY63LPQ+AtPGgyt9cHPbiyQedqgAn
         iNFjOIJeCQVKKOGvYxY+NMLLTZL5J6WQjc/s7jDZ4pD06jZv9ahY/hXNZlfm/i8yjbOK
         vibwJmfIjzRow19ZxbNWB2Yyjp8GW/C5IjOkiChyuWhK+MubNtD+RrkbxYwMh0/3OruA
         g5sQ==
X-Forwarded-Encrypted: i=1; AL+hErE+c8ynW/fP++h/Rm5pmQcS3DtN3pYAc8kFD5J5y9RZmEbqnODJlUvcR+fw7Zh+CniSxttmauVTFRprN00=@vger.kernel.org
X-Gm-Message-State: APuU4Z/oeMbQeAAJ8O0EdEWVS4QiA4tQpOjIab1UChXn/6nFHDqaaj7x
	J00EluvNIZcpFeeeBbQRQl5Ubw6p8Ybt9XocJDpNSqbqXhsj9fekzuZQ7DjqbQ/yuro=
X-Gm-Gg: AZFdTZfTNmkqfnZGAc0s8Ncb5aMk7uuqLjm5+CMrsnbt6bc79HlHYjb6gQ+LrwDY1I/
	rgvVZcx+bAbAJyDiFVl3wbPZ+TtdMcRagc9WArlrbN7RedI2A7bpEnfPu/BMDHLzLcZ57/RRVXb
	6M++Fz720NBruroKKiHMM3J7/JLIQv4NO0HR1nSp0I1j9N3mqSwpOu9Ut8CYe6itQCj2/fy5Mlo
	faH8N36F2yXvxk6o9cUhMs4I3lypvc552MGWs1DkAiSl/GMFsCOcX0lRAI7Y7jzuGqm3DvHS3ru
	toOIJXHNwGaBpHEKT29bEpqO0zikHAsnDfXVv4swETk/uSiCEjLi507OD71EYcT/c5DTFJ73/ix
	jgJ99BFFtYcriYYK+63wkMjUpFY658FmnfPu9DA/t5zTSDidphHp2+o4YguZKp72b9WGwFvJdol
	C+bzc8w+dIBpGUyt/UreNTcVh1N49gMjKd/S/OImVRXJYmloc6FQ6CHtM/aYb8KFbyDqJ3I1yo0
	mU+lJbq7Hn1iwPyZdzoamq8cuudjJHtz9rQS8KL7v/gfQOzvfRu/1I4YBUXh93N73EP8fZdcmVF
	xmIZfFbt85318ZV4CGKFcduesyJWI10FMxdhWk9Py764E6MNxoj5sq5IsKRY/L/Gdxd9AIcgfrw
	E
X-Received: by 2002:a17:902:d2c7:b0:2ed:2305:5244 with SMTP id d9443c01a7336-2eff752ec1dmr60082795ad.46.1795087465193;
        Thu, 19 Nov 2026 03:24:25 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:84c0:a687:3d35:47b0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62876a6sm28540805ad.63.2026.11.19.03.24.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Nov 2026 03:24:24 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhao Li <enderaoelyther@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] Bluetooth: MGMT: Retain the selected legacy advertising schedule ID
Date: Thu, 19 Nov 2026 19:23:59 +0800
Message-ID: <20261119112359.34543-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Updating the currently advertised legacy instance can schedule that same
instance again instead of the next selected instance. Add Advertising
stores the selected ID in the original request after mgmt_pending_new() has
copied it, so the queued callback still reads the requested ID. Add
Extended Advertising Data never passes the selected ID to its callback.

Pass the selected ID to both callbacks in the pending command's user
data, and keep the request ID for the replies and completion cleanup.
Extended advertising controllers do not rotate instances in software, so
keep scheduling the requested instance there, as both callbacks do now,
without cancelling the rotation timeout or looking up the next one.

Found by code review.

Fixes: cba6b758711c ("Bluetooth: hci_sync: Make use of hci_cmd_sync_queue set 2")
Cc: stable@vger.kernel.org # needs adjustments for <= 6.5
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Tested in QEMU on bluetooth-next f42f5cae154b with vhci controllers and
four new mgmt-tester cases. On an LE-only controller with instances 1
and 2, updating the advertised instance 1 through Add Advertising or
Add Extended Advertising Data now makes the next LE Set Advertising Data
carry instance 2's data; without this patch it carries instance 1's new
data again. On an extended advertising controller, updating the current
instance 2 sends LE Set Extended Advertising Data for handle 2 with the
new data, with and without this patch. The rest of the mgmt-tester suite
shows no difference beyond one LL Privacy case that times out
intermittently on both kernels.

No new W=1, sparse or smatch warnings.

AI assistance was used.

 net/bluetooth/mgmt.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index 6ed3bf6f1738..075252d72cbb 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -9099,9 +9099,9 @@ static void add_advertising_complete(struct hci_dev *hdev, void *data, int err)
 static int add_advertising_sync(struct hci_dev *hdev, void *data)
 {
 	struct mgmt_pending_cmd *cmd = data;
-	struct mgmt_cp_add_advertising *cp = cmd->param;
+	u8 instance = PTR_UINT(cmd->user_data);
 
-	return hci_schedule_adv_instance_sync(hdev, cp->instance, true);
+	return hci_schedule_adv_instance_sync(hdev, instance, true);
 }
 
 static int add_advertising(struct sock *sk, struct hci_dev *hdev,
@@ -9185,7 +9185,9 @@ static int add_advertising(struct sock *sk, struct hci_dev *hdev,
 	if (hdev->adv_instance_cnt > prev_instance_cnt)
 		mgmt_advertising_added(sk, hdev, cp->instance);
 
-	if (hdev->cur_adv_instance == cp->instance) {
+	if (ext_adv_capable(hdev)) {
+		schedule_instance = cp->instance;
+	} else if (hdev->cur_adv_instance == cp->instance) {
 		/* If the currently advertised instance is being changed then
 		 * cancel the current advertising and schedule the next
 		 * instance. If there is only one instance then the overridden
@@ -9232,7 +9234,7 @@ static int add_advertising(struct sock *sk, struct hci_dev *hdev,
 		goto unlock;
 	}
 
-	cp->instance = schedule_instance;
+	cmd->user_data = UINT_PTR(schedule_instance);
 
 	err = hci_cmd_sync_queue(hdev, add_advertising_sync, cmd,
 				 add_advertising_complete);
@@ -9461,6 +9463,7 @@ static int add_ext_adv_data_sync(struct hci_dev *hdev, void *data)
 {
 	struct mgmt_pending_cmd *cmd = data;
 	struct mgmt_cp_add_ext_adv_data *cp = cmd->param;
+	u8 instance = PTR_UINT(cmd->user_data);
 	int err;
 
 	if (ext_adv_capable(hdev)) {
@@ -9475,7 +9478,7 @@ static int add_ext_adv_data_sync(struct hci_dev *hdev, void *data)
 		return hci_enable_ext_advertising_sync(hdev, cp->instance);
 	}
 
-	return hci_schedule_adv_instance_sync(hdev, cp->instance, true);
+	return hci_schedule_adv_instance_sync(hdev, instance, true);
 }
 
 static int add_ext_adv_data(struct sock *sk, struct hci_dev *hdev, void *data,
@@ -9537,7 +9540,9 @@ static int add_ext_adv_data(struct sock *sk, struct hci_dev *hdev, void *data,
 				  cp->data + cp->adv_data_len);
 
 	/* If using software rotation, determine next instance to use */
-	if (hdev->cur_adv_instance == cp->instance) {
+	if (ext_adv_capable(hdev)) {
+		schedule_instance = cp->instance;
+	} else if (hdev->cur_adv_instance == cp->instance) {
 		/* If the currently advertised instance is being changed
 		 * then cancel the current advertising and schedule the
 		 * next instance. If there is only one instance then the
@@ -9579,6 +9584,8 @@ static int add_ext_adv_data(struct sock *sk, struct hci_dev *hdev, void *data,
 		goto clear_new_instance;
 	}
 
+	cmd->user_data = UINT_PTR(schedule_instance);
+
 	err = hci_cmd_sync_queue(hdev, add_ext_adv_data_sync, cmd,
 				 add_ext_adv_data_complete);
 	if (err < 0) {

base-commit: f42f5cae154b90a0cb6d8232dc84c7614ca2e6a0
-- 
2.56.1

