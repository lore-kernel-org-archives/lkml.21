Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795440052;
	b=38b6MdOIz+MC3LJo5agVHu+yLG8eGEjVHsi3JtVXLOZJRUVdxtYKK+qufu/tp6Shf77G
	 MCdTt1Y7Evws436KFcbvFoUqPvWg8lW+3OamuUVou8KhlsVhYIDBWyCVyvJYjQU4FndRD
	 Kg41tH77LwR7w0x0Q2QhBllMzPa/g8gCk2tOPeF2B+zOgXfc5N5cu7GPYjz21WsFwa/Gq
	 syKdE46YBQKXTsdBFHs6lyZKKQSZ3aZzwFsQD3ejgngERChLBah4E3oVR2tqyyajemU2d
	 bvfx3MX6PY+ZyI/ztnvQ9PlOe/Lt7NK6a2G7uO17nontS4JbaxG+H9Hmh5eqfqDO80w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795440052;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wLD9EjNf9HjnVz/OoDjNZ+yXnVYBBOhi0ebsNrJJZZE=;
	b=JUnZcQGgBXF4AYwBdqe/irSY26A7s99KACYmjuyt3RxBP9IWL4Kjugsj5YsDmlfQ2Srk
	 oVCh7FcvnWiudIiBPbBeS+YFtGb1RrvteJ6uyYLBN/ri/2Nt6zi6psF5zLSXyscTsFmrE
	 +8P90iMpf1uU88uYqFDC534v4Y6J79X7j3QYAR6H2jzhuRSz890ZNMNiQ1IFFy+S2O5AN
	 YfDaZzyr9qCi7K80wUvRK/BY4QnoBEKuKTv54fRWHs1cIv1QxewSW/3cQfvK3qScYdLwc
	 mX9K7plNrtPG7JnZbK8eC7bgwdaHnYV+fL04oyWUZQK2ASvyubNW1pjFHIyEyd4537g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=obxOZfGh;
	arc=none smtp.remote-ip=74.125.224.52
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23501606A333
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:20:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23501606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=obxOZfGh
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-67be4f2f4d4so3600327d50.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795440051; x=1796044851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wLD9EjNf9HjnVz/OoDjNZ+yXnVYBBOhi0ebsNrJJZZE=;
        b=obxOZfGhMQJ16/0IZ+8shfTqrEkxF800LPpR5EjHTtT8dXenYSUdSox3syl8ZnlA+T
         dkAv3zHhIoGmrLczrsehhFRoWGt6vOOE+WYxv5l7gZJD1B2NbIDf+15NK3DtI2J3jDYC
         8pbgNYNNswyo7p4nWFQnthgPwhrLVUkMy5rw88BNy7wSSM8A2hcNyjTibMDWwp6HQvp9
         sdrzlqt+h8+OQXb2G8wT28RpMsuFgmxX1IwjKf0xPNWWVe8ZtI79vRRwzab2cx+Rhv8D
         eUBxQElWfAKQIFnm813MR55TCd5Rv4K1CcESsgdAcgXo80oU5jLnJ1afeKx9v1TiSZox
         Gl1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795440051; x=1796044851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wLD9EjNf9HjnVz/OoDjNZ+yXnVYBBOhi0ebsNrJJZZE=;
        b=hS7kBdU2iDpVP3vaILgCTR9tqWwLCUKzRS/vm2S1Jcz0NdU/oqGUUp2FK+7KU0BlC5
         0P1YnZAlD64XcA/uGvy5nr2Ey8bhD/4/TXt/5+SZeG8d840fWxSi3gxLRzzFTrFznEwX
         sxBrNt0HlM3WPveKtUIRG18norXXP3gq3cKH7HZsokRvWruZfZ/+PSFIV41un0wTWT4g
         RgyyV7T/6jCZmzS/zOoJrMcNnLwouvoWAHHZ3FL+CQhtluScmsuJ8V+RQ74K3laIsczy
         W73sDJgHsphQsEwEdjx4h/DygYolQR6Z++jqx86WFasVPqfa1yQk/SBgoTiGIVhTlu+m
         qAmQ==
X-Gm-Message-State: APuU4Z/2sT8HG+X2XtSTSHNBw3vkRHReBACZXol1Xu6h52BZQF8Ihk5E
	9hMdPLfPjB5R8SgIJ/RkCCcRy5/T7SMVSFfMx9pQnPYz7ZorFAMM9oLJGLm3Bb+n
X-Gm-Gg: AZFdTZf8AyGSxVlMUF8HchpCfhfP7yj4a/sxjnF1IM1YpDFkHSed/IKp7iWUmXhN6B9
	EPeUS495jNtNg7Z2ef7x9I/UvSe7DcPub86+YrfwRj0d4r7X75DjJHWPtGMCTVHV7Gd787Jddbf
	blN1fPV3F1a7Yy1sbtbZnhAW8UxWn2BfUBhj95cPZyJDWtaLDFrODy37Kh2P0eJx/jWS7urGMgP
	rK0ykjKQSwIUj0/WJss1jEDt2vowDK0sQ7Dv4fHtgQy6p+aAaM6IIbwUoORNdak/VjvQohFDEqI
	p3RTvI8jNC9+NygqCNqpP6WwKCpd22rOnuBE8r82mmqB6IrxEdcvf1r/MEPC2N6njDp1jwRj3Pr
	Mt/ogEXAk4QGSGRs+ezSohWGNNNDvqmKaYCblCVZ8IBgz7G6Gp49rnp1X/BtmZjArhFSFVtKsEq
	y+P8x9Az5ixLNG1SzmymaEchI+YUfmCyGFA3eTGYFf2rrMNRyDiuVAYwkIqiQOBz7b0VuFwk7qB
	TXzKVDlZjXOqKZ5wfwINvrM/7ngZtF8WEQ5+dpUiciR9cHiPAGRNdJ5c7e3diM2OJAh+p7W6adW
	NO9Qc8rLKu6uocbb
X-Received: by 2002:a05:690e:80a:10b0:67d:e9c9:8dea with SMTP id 956f58d0204a3-67df448b3b5mr2481344d50.66.1795440051232;
        Mon, 23 Nov 2026 05:20:51 -0800 (PST)
Received: from pc-i7 ([192.3.12.183])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df330fe0esm5503938d50.8.2026.11.23.05.20.50
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:20:50 -0800 (PST)
From: Aaron Ma <mapengyu@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] HID: pulsar: resume device for raw command execution
Date: Mon, 23 Nov 2026 21:19:36 +0800
Message-ID: <20261123131937.5473-2-mapengyu@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123131937.5473-1-mapengyu@gmail.com>
References: <20261123131937.5473-1-mapengyu@gmail.com>
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

usbhid drops its runtime PM reference after open, allowing the USB
device to autosuspend while idle. When suspended, hid_hw_raw_request()
fails with -EHOSTUNREACH (-113), causing battery status reads to fail.

Hold PM_HINT_FULLON across exec_cmd() so the device resumes and stays
active during command execution.

Fixes: e55cf379e822 ("HID: pulsar: add driver for Pulsar gaming mice")
Signed-off-by: Aaron Ma <mapengyu@gmail.com>
---
 drivers/hid/hid-pulsar.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-pulsar.c b/drivers/hid/hid-pulsar.c
index e726dffb2f33..299baf38a2ff 100644
--- a/drivers/hid/hid-pulsar.c
+++ b/drivers/hid/hid-pulsar.c
@@ -148,9 +148,13 @@ static int exec_cmd(struct pulsar_data *drvdata, const u8 *payload,
 
 	if (atomic_read(&drvdata->stopping)) {
 		ret = -ENODEV;
-		goto out;
+		goto out_unlock;
 	}
 
+	ret = hid_hw_power(hdev, PM_HINT_FULLON);
+	if (ret < 0)
+		goto out_unlock;
+
 	spin_lock_irqsave(&drvdata->raw_event_lock, flags);
 	reinit_completion(&drvdata->response_ready);
 	drvdata->pending_event = payload[1];
@@ -164,7 +168,7 @@ static int exec_cmd(struct pulsar_data *drvdata, const u8 *payload,
 		spin_unlock_irqrestore(&drvdata->raw_event_lock, flags);
 		hid_err(hdev, "failed to send command 0x%02x: %d\n",
 			payload[1], ret);
-		goto out;
+		goto out_power;
 	}
 
 	timeout = wait_for_completion_timeout(&drvdata->response_ready,
@@ -175,7 +179,7 @@ static int exec_cmd(struct pulsar_data *drvdata, const u8 *payload,
 		drvdata->pending_event = CMD_NONE;
 		spin_unlock_irqrestore(&drvdata->raw_event_lock, flags);
 		ret = -ETIMEDOUT;
-		goto out;
+		goto out_power;
 	}
 
 	spin_lock_irqsave(&drvdata->raw_event_lock, flags);
@@ -190,11 +194,13 @@ static int exec_cmd(struct pulsar_data *drvdata, const u8 *payload,
 			"invalid checksum in response: 0x%02x (expected 0x%02x)\n",
 			response[USB_PAYLOAD_LEN - 1], checksum);
 		ret = -EIO;
-		goto out;
+		goto out_power;
 	}
 
 	ret = 0;
-out:
+out_power:
+	hid_hw_power(hdev, PM_HINT_NORMAL);
+out_unlock:
 	mutex_unlock(&drvdata->lock_cmd);
 	return ret;
 }
-- 
2.55.0

