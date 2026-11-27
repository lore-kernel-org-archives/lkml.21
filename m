Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795766260;
	b=0fv2KE+7DrNLzxCsr4RT0UvSCsB0t6B3maplTSAchojGfnU8Y64XB5oBt7mLo9k7KbtA
	 iP27VL+4wy6sYWsc47mnpXj3VuZTdwMTkRpRsVwbWiRyT2mj6tXcFe8d2PJtV3nyMHtzw
	 RFVK0Dp5fK3RMuOhTTvoXlbfm8vz+lJfs+EgJbN9mCKEch4+/mMXsRfpMn48rXrgVgj8g
	 t564rxo7grCeqLS6zuB7v87KM2Llv3350RYGV2hy2GLaaWrEFkIMo0kIOpcoNbvtzQvRi
	 7ct9+X+edOfuKuHeZ1R+v2cyWUcGQ79tezsY7rHugz6uinslf615lDeUQqOSs6cbibA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795766260;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zhpeeEWvxQlHrVzNb+mIhoDErkTSVTwiHheVg6+HwpA=;
	b=3XUjcGNr6X+a9urkHfOcByZ+mDpHv68ZyIuZmwyIMqsTS9R5nlDu9YXW6gKlpmBS5HOP
	 VFGRrgBzM2uZ/c9L8R2Ezgw5LGtngubf3nSvKp5qJ4mVd3Pnjdo4MIDENZJi5s3httcfZ
	 uXBG8krqyBDGCXRjvJQa1cojMKgLYlK0NTxIsbr9rLgH0REN3WsqHD96mjy5ZSx6LOo0N
	 ukTgGETOZ4Of3GKBRRFV5EoyxOZwxiWExtTYC+8vYOyIDxbWduDNKAF9KNjkCsZ89ZPwT
	 iSmzUdp8OrlhmT6yGM6S1CSyFYXMGUBZl+Ew3ciYP+OFbnjvVY7tpKm8Tzbyh5XLk1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VljMGSJL;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC348606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:57:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC348606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VljMGSJL
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3863db981d4so10948942eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 23:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795766259; x=1796371059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zhpeeEWvxQlHrVzNb+mIhoDErkTSVTwiHheVg6+HwpA=;
        b=VljMGSJLexutiimCumKOoGUm6WsO6r/0+Z+nXt61SWCA+zdAzM06ZztMCKGHP5EFiY
         2miqjQh01oYY6Vkt1FCTBvV1m9iWlhmsjdsU/ne6eqvLoVCQqhEGzpMbd0dDaTjcnHkL
         ofx5oF9kCDnCON3nxwDvOdv06bVfa2YMcco5eDy7dvlJQbnDiol+7uZqUuiAs4CaNQyq
         O8DQWDvUbJ6rm0vWQ3iBKxBq5PyTbMubnM7o7d63l8JsHx5yUs7nPpLjd8SWF54fE+fF
         ej9rj2DVrUcKf6Wc7eFW92ewj4XjHVg6tZhlVYbG5GYz0vk3W4k7yEfR8iYtt0ns7AOT
         rh/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795766259; x=1796371059;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zhpeeEWvxQlHrVzNb+mIhoDErkTSVTwiHheVg6+HwpA=;
        b=yx4K2gntRydRBK33bkwkdeL7qF3ZXTpa4wMZo5ylF4vqH1Wu1LklMjLp5tdiJLaK10
         GuwA2Js3mJaTdocdUlQzerumeQ7ZfEyGeicpbaR7UB0mx8UisAxDViEubassRXHwLNBs
         la2P6YYnldNCW4U4APV201xy9Oe0bvZGlRk1ys8wkeaTQb/Iv1RwCNiKJOgGTOPHMgeo
         QmMNmda1s1+9nFs8UvqnwFk5kxjj2bxDiBq0yWODf47XVaZBBtroZ41nLGgHl82nwOnq
         wFxZIRDbyCj49EJujnJtVCbx25jXtPi+DFOrKUvqqvMxhU94yJiS2R2qab7fv8URLf6R
         gfSQ==
X-Forwarded-Encrypted: i=1; AL+hErGgGOzwhEeu2OHes9mZqa2+BiqU6X4fm1bWHkBw4UuTtTQYhC9NJYOelVCoScWVr1/KfVvkrZX2FylMHHg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eG5H6pwVVN5YlEjy7IBGxTJ14Jpfjxkcb02wpPA9WVyYYU9sp
	ltdMIZfAqkUNROSqbpUtyapQNZD7QgIphHXDYJW97laMkjwKqhIivH4p
X-Gm-Gg: AZFdTZfD50sTy1H42h57Kqxqmz4gg3vgxhkmOugvHOicdLpakYHxHJxstuCs5MOczw4
	rusj7WBL78o0iCQJtYbjX4LLTUtTdtH330EW8SxvifS19/dKDt1LHHZYN1BteXwPIeDVyHjAePd
	yqeSUxgrDYTI3itY9J+zVo4p/l85b0bhF3wiDIe4JV8NXGSUXNL9Xx2mkIBtj6zOQXoZymDbp1v
	oco0jFrztXecoIl6w854Ga+LGL4ie070vQiiea3WjU/5SKS2jlQIegBxacYMN9eEO23E4iEw6BY
	2TsYNvdtK1BEqLi4OpGsqx7UN/4eLU/wc8Qr8fUdcFm+YdV46qfG/+vThiekxwB2OtT2uTiAR3Q
	3AcRWCPji1pu+ULwca/Xg6IyAECjxyioSWsi0oIr1JBPsdPnja1d5vl1lOeKkMyTb5CAcloB+62
	T7dGLeoO7rIOfb4IlIvp2YzbZ615BtlxAHvIbrrPFUCuSAm19RcBRQC2dcMeISbWNgi/1VpEWq6
	NpGsSY5MOax6nufPvcMlejZYTZx8WTvyHMc3+iU+I4VYsVS/bPswEV/EwfzmYov6ybTGDOnEV/W
	TUts4kKK1TlPqlqEONMECL0Py1G/XCswdsNXTbpsh4wwR2s=
X-Received: by 2002:a05:7301:d81c:b0:386:b7d2:a279 with SMTP id 5a478bee46e88-386b7d2aba6mr12774546eec.34.1795766258950;
        Thu, 26 Nov 2026 23:57:38 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm65363944eec.13.2026.11.26.23.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:57:38 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: Mimi Zohar <zohar@linux.ibm.com>,
	Roberto Sassu <roberto.sassu@huawei.com>
Cc: Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Eric Snowberg <eric.snowberg@oracle.com>,
	linux-integrity@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ima: allocate the new hash table before detaching staged measurements
Date: Fri, 27 Nov 2026 14:57:32 +0700
Message-Id: <20261127075732.252471-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
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

ima_queue_staged_delete_all() moves the staged measurements to a local
list and clears the staged counters before it allocates the replacement
hash table with ima_alloc_replace_htable(). If that allocation fails, the
function returns -ENOMEM with the entries already detached from
ima_measurements_staged and never freed, because ima_queue_delete() is
only reached on success. The entries are then on no list, and a retry
finds nothing to delete.

Allocate the hash table first, so that the -ENOMEM return leaves the
staged state unchanged. Both steps run under ima_extend_list_mutex.

Fixes: c26d9d9246cc ("ima: Add support for flushing the hash table when staging measurements")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 security/integrity/ima/ima_queue.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/security/integrity/ima/ima_queue.c b/security/integrity/ima/ima_queue.c
index 67782c004cdf..d58b33950bcc 100644
--- a/security/integrity/ima/ima_queue.c
+++ b/security/integrity/ima/ima_queue.c
@@ -377,14 +377,6 @@ int ima_queue_staged_delete_all(void)
 		return -ESTALE;
 	}
 
-	list_replace(&ima_measurements_staged, &ima_measurements_trim);
-	INIT_LIST_HEAD(&ima_measurements_staged);
-
-	atomic_long_set(&ima_num_records[BINARY_STAGED], 0);
-
-	if (IS_ENABLED(CONFIG_IMA_KEXEC))
-		binary_runtime_size[BINARY_STAGED] = 0;
-
 	if (ima_flush_htable) {
 		old_queue = ima_alloc_replace_htable();
 		if (IS_ERR(old_queue)) {
@@ -393,6 +385,14 @@ int ima_queue_staged_delete_all(void)
 		}
 	}
 
+	list_replace(&ima_measurements_staged, &ima_measurements_trim);
+	INIT_LIST_HEAD(&ima_measurements_staged);
+
+	atomic_long_set(&ima_num_records[BINARY_STAGED], 0);
+
+	if (IS_ENABLED(CONFIG_IMA_KEXEC))
+		binary_runtime_size[BINARY_STAGED] = 0;
+
 	mutex_unlock(&ima_extend_list_mutex);
 
 	if (ima_flush_htable) {
-- 
2.25.1

