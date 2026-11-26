Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795676050;
	b=mGF7uOynYuElaeAQNhLCF5cXkxFYjquysLA1Q5iZLSJm1n2C9cGjf6kMsPNr+NlqtUaf
	 6dsPrXJUxdctYa4vS7QvxqTk0uQ9dFAJYjg4z/biplcFZ7hEK5YudYW5+GPm7dSFoDaXC
	 xSL6xn/FA2KWnqIps6XA92lFt03cvdmmJI74t1CUNuujgj9ykdAXL2D1TqiMVDFKH/zXf
	 MYi/Uz92uuFr2UG3ik6miNK1sSKhinbGp5yj1f6ARxQG9ePLMDKnc7LfX+AKaSmZ7O9iI
	 MjhTwffUESMJhxF0k5/QRG7HytHu3dQ977cXC7azgx2echO1H3a32SLXS8HRqRZ6oJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795676050;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=EwyJCNE1Q7H8bIeTNVXKHO12xLLgxBEZMkKMexqwnPE=;
	b=IghBGWSBoyXdinkfcvR4qTucL9OUQh2wvfCTtT8/Au/GJSD1n2zCKFxUmjXhX1s0IbTL
	 XZKDve2A7l8V6CdQRpOV+17ZfZQeOvbI36AB/1PNbhH4tw0ORbbd38Ww5xD2RlxYGnYET
	 r3EvV4z/qChv1IjVYcRt+YpQqI2aIrw08ffU3u5skze9WUAsCV2s0LhhIQOFo0fTm1J2B
	 e+sy8gV4lTpbTAFfB0D9Nza2XIpxSYUbHt7W/TpedgCF4P3vsxiMLTn3fhqUqRh7NQ+O9
	 E5/OhsYQ455Sk7d41LuwKF/2Xp1aBKUdQKsFYFBL0Gzp/9kOk0ZqFzotQsI1RTVzbDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wp+yySQ8;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD30D606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:54:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD30D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wp+yySQ8
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-386bd881d39so6299659eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795676049; x=1796280849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EwyJCNE1Q7H8bIeTNVXKHO12xLLgxBEZMkKMexqwnPE=;
        b=wp+yySQ8dPkHoU2xelbw26IvuaCNsJXy6YaftZDrhW6c+hXrOBnmoVsOVY9IupjB33
         oJIKHnX5aX7UGHmkeExTnUteVh1iWjSIpCKH9rcJ4YhCaCpQOCZ0Nt2P6HRD3y9Yfmcn
         Wzu1S7FKgPuG2IT0tMTIYtmPlkzgyx5TVvfcj4CyTX/veDcNXFgyzZIdTvAPtc06RSiV
         Nh09Kpbswr8stxH2wAf/cppYWmlTzYaQOey5s7DMsnKyHAYVan1Rjg+Fg/UXkh4Vw2vH
         DMlxgKAJbhMYTPJcYc1zSR7nitEtyUWrTVZG0IKVmgHVwKuT3xCMud5qRaKO3rdnOZy1
         EB7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795676049; x=1796280849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EwyJCNE1Q7H8bIeTNVXKHO12xLLgxBEZMkKMexqwnPE=;
        b=QEbAOPOPT0D3lJZ/0nDWZpDlFUMONymk6TjBlbLEUss4CS+3FRZbMfSHEuWYR721/f
         PXtA99lpq376CMD4Mt1qpdeMYabEfKVV+jyVb2RmrUQr/81l1qBXb1dicQgCx9HA+rl9
         ju16Gd+Mvph26Bagpoa4STKqtSQQjjGCEimYdf18yNUeYosaifrW/PNDJ08SkCO4ejxo
         nQ4CXegBV2vZDY1BAbfQMGaFCx5V/X4i30BvJAytUMzRdj59LwA3gfsglTbXm+NoFu1g
         DAyMHTpyo2HLRscEYO9ior7hQ/oGpOmM/yQccUqz4sbcnrudHMEYUk/ADCpx5L86iucv
         iKZg==
X-Gm-Message-State: APuU4Z8oL0dAaudGzpdsiY36xmUSIbjSLO5OnzWcZ7Hz0DWbSt0EnylP
	vUYb1P7y+Fy/+d70wzoRiLfXkxR8GlLSLDy7d9hUB2UpYjmlXKPhca8/
X-Gm-Gg: AZFdTZeBUBb1DvM3rO0kNK5jN2liQk43KmYU+2cVaztykx3dWLV1xxLNtUTx1U5m5wl
	UdeIB4XBpEtmvF4LkTI98avyCCeLrkVypy6uJZC55dzpaHGtHp71MPi/Z/olSPw/Qy6W4L0qpXI
	7v+1HZOsKOshAx5xtoxcWh6XLOC7cJOGicWXjVtwQkspkFwNSYbfNy8L2QvouCuhbyUtkPPpeC2
	fGx7KZYed+K21g1uLlCQ7Txfu75rTuZdEJe1eOdI4aD9lXlB79thbSEu44qcjzlQOAsJlLN1hK9
	cpOW1Jl4ntSlmrELeCXaP/C5pn7CKDMi7faObFFi5fUZDzvK18ZR34wsqjZLc1Vlmr5oklesN1S
	reuTGWtvj55mdF5rkR1OkkxSNdt20TZNIdCWNYoVDkGZ6VI6pFvNmPd5cSTC8mC1QiTnvYP6FGK
	9P+wqYWa8461NJ3YxA5NDYW5ug4BZvsKyONT7jAADvvfbhivhzY6Rmaoh31ao5D21cI2882X5Wv
	9FkR2Oie646LNgVd3AW1AxyDF/Bb08HlcAbC6o/ugHpD+PzhtzkL6fdXIuW3oz8+/N5JWOzZMQY
	P/AJXmv0GaBf58kq5DESsebUyehqYm4ZsB6/UbYDDZiXL4i3AuQ=
X-Received: by 2002:a05:7300:c00f:10b0:381:1eb7:938e with SMTP id 5a478bee46e88-3856c9a61c1mr24744995eec.4.1795676048840;
        Wed, 25 Nov 2026 22:54:08 -0800 (PST)
Received: from localhost.localdomain ([103.179.230.77])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm61874754eec.28.2026.11.25.22.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:54:08 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: perex@perex.cz,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] ALSA: vmaster: Check follower callback errors
Date: Thu, 26 Nov 2026 06:53:10 +0000
Message-ID: <20261126065310.3451-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Check the return values of follower_get_val() and
follower_put_val() in sync_followers().

Stop synchronization and return the error when either
callback fails.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 sound/core/vmaster.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/sound/core/vmaster.c b/sound/core/vmaster.c
index f43144ba2797..88b38ee5ba5f 100644
--- a/sound/core/vmaster.c
+++ b/sound/core/vmaster.c
@@ -345,17 +345,27 @@ static int sync_followers(struct link_master *master, int old_val, int new_val)
 	struct link_follower *follower;
 	struct snd_ctl_elem_value *uval __free(kfree) =
 		kmalloc_obj(*uval);
+	int err;
 
 	if (!uval)
 		return -ENOMEM;
 	list_for_each_entry(follower, &master->followers, list) {
 		master->val = old_val;
 		uval->id = follower->follower.id;
-		follower_get_val(follower, uval);
+		err = follower_get_val(follower, uval);
+		if (err < 0)
+			goto error;
+
 		master->val = new_val;
-		follower_put_val(follower, uval);
+		err = follower_put_val(follower, uval);
+		if (err < 0)
+			goto error;
 	}
 	return 0;
+
+error:
+	master->val = old_val;
+	return err;
 }
 
 static int master_put(struct snd_kcontrol *kcontrol,
-- 
2.55.0

