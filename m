Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674782;
	b=hnRrYMChicYLFegpAhA9JSyWHOi0LvSZYtv8PvcIWyMtkzvSt1un6D6jypO2x5STJN0e
	 qM7100x6cbJbp+7IlNC+zL5Sn4ZAQFxIwzurH+gzMC1MtGufTCL54+pjluWCU6iJ9D1MW
	 DzsbkfdGa0KCiPKjY7cRNgyP/qxPuhlo+bUKE5eT89Qvj2AJBDPs4G9XSRFM2V8aVtn/P
	 dn+bkzSSIMgsaepKrMvlXa1C4xjr6Zxv/9tdSKlyaJKQojSoSsMtdG5BCWg1f6LQFHuCf
	 cDcWIBv+ulKoGRKbH5Tliqv+W2yfuYHQSL+rWTSBW13OiuJT2tffbv8vWIuKUpBGlOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674782;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lRVIMYvdf6lF/95MD5+qUVrsPegHxOugjRhGDq12MEI=;
	b=upUhdTGeGOBy+dQEfc994uuuR6eecZNL+wvslb8TN2QZ5eP4kNU7k7AWdpUsnNR6005V
	 cv+EM/etamr5Wr9DnCAn72snDLJZr0cA5C1Cmj2kJe+1EhCgVIw2mgBAIFUoNlViUnvMA
	 lcbEKwOfcJXpiq0CsqMkPvcfBEEJwyLOMHaKPicTMGjy53gsVhpevqnzjlHCwe8JLvnnQ
	 xTidZw3cx4EnhAGizZ5LJZI1TDrqlkh9BsPCXF1NPp5uTa+U/9HMXslVdshdqFikHXTCF
	 GzeMey7H0FiRuWO+5wV6bjZHJNKMpZEyPoxeblSYHQmVdp3bF7+kkTs/exWgAWTjqtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l0sP36HN;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB07606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:33:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FB07606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l0sP36HN
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b244fb7fffso7030273c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795674781; x=1796279581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lRVIMYvdf6lF/95MD5+qUVrsPegHxOugjRhGDq12MEI=;
        b=l0sP36HNYMiijmhcqdtbL2X+/zWUx85UFFKGYk1Di07BB+WlgxTHPsfW1zKRBl3HE7
         HmpT7YRdNQxI4ESP0kM6GsnW6JildF7J/2D1Xor8SAEQOLkN4mhARWCPmcmXevpW/gqr
         Iw3q6DfJkfOMd04PrtIdEUNwyuO+iiQ4H6SrBeX6TmBksIghkJ5clK/6Bzb3VHQdZ0oE
         8FX078sj0vUflTIQAm02ClwgqGr/Xgr1AOb+w02vUfuPkWwQ730biRKa+mMpx+sTyJQL
         EQOGDbPk+gBlQaFuDCNniuiznMBZJoHh0g16Lxj8W7ym7pYgPxsbIcXln3nLwjqCJsFy
         Dsyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674781; x=1796279581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lRVIMYvdf6lF/95MD5+qUVrsPegHxOugjRhGDq12MEI=;
        b=OYyMnqoOXTdPv3+eAoDhonUu1hLOxAA3QacMtAnY/67m6sTJDUuPbCgBkM8JCy3YDc
         pSybXqZYWinaOgrhAVg145t6SAcEAtP0yGj3t8XuCT4QsYtA7P2eKl0V1/9i57ID0dyU
         1YzgqsBL24KeOg+Nod/6/gSAtr07e6ySyS0ojXivXUEyMPqSOwHeslS+lZ5NNvqsaPnm
         ErX+keL2RrlkmCUbWcn9YlYqgJo9kErw/f7WyctUtBMZ3IQCOxVN9pLTa4HYIU0jsBeQ
         i9GLhH3IYMqb/juni2CBhqCezthJjZtBF+GS0vmo7MF8330JSKC3jKVh1GnUmW9r7WPa
         qsqA==
X-Gm-Message-State: APuU4Z8NBrUDC9r40cJBkAsMoU6eVavYyMevPoG+DMgda2cvdPQ6lm5a
	SGLagzWFzk91sJdjnKPd2yM1FmvfBNMfWXe5RTHHRYpTFJyzJnJksrkH
X-Gm-Gg: AZFdTZdTkVNzTNEA3f9IHxu7BY8GhU0HCEQRdiHtj9jAhxTK6mSiIxR8C7s3H7BuiZ6
	xMQ7rq/m0TWk4oouGKW/ylvtEWXm8GlJAUrSm2oCNRMeuKGp9FJpnDut48zClLPHziI8evUJ3FN
	yOxc0hs0Smk4DD3dJuurBBUh3WX77u0DGZSC/qhv+hHULXxPZueUE2gNwIc/lhGSAjng9Y+ogLN
	ZamzWHZpRdmhB+WiuTu1tXboIfKTaH1/WwW4bFsl+3gLUe6wE/YmyAEnvZfukb3zjZXr93B8cDh
	wQWqDUrUwYNvxqOuRpUKzrreUxmcxmVIv++412vyUtTIITpkYMklvo6Vjc/Ix5v2CybDqgZH1m8
	qs01q7cnqxvC8413G3BDEkCFTRtPFsjK3i3zRFeWmZxty4zQ3ilAwcmWF4JNJ7wKg0ZEN6WOBOt
	cEVFJZHmw8chYXfzQaXANDzim8n57D05pHLjSJKa1JyChSCVGs5wm4pF4hrLF+gBKiYaRYR0mT7
	5IfOUpk2pSsPP3X4Gk8AeRLuk87AZee1tv5lIS6F11CTcCXrWKFz/3QWdMY1l0JMxwbxbMcwFQp
	CPHt9rBf45jFejTbqLShf9JxAS9DCE1u2To2yg/tK/AWQ2aSHow=
X-Received: by 2002:a05:701a:ccda:20b0:1b5:9075:232d with SMTP id a92af1059eb24-1b590752372mr1359447c88.29.1795674780587;
        Wed, 25 Nov 2026 22:33:00 -0800 (PST)
Received: from localhost.localdomain ([103.179.230.77])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm76423745c88.9.2026.11.25.22.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:33:00 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: sreekuttan2156239@gmail.com,
	perex@perex.cz,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH v2] ALSA: vmaster: Restore follower values on put failure
Date: Thu, 26 Nov 2026 06:32:25 +0000
Message-ID: <20261126063225.3166-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261126061910.2840-1-sreekuttan2156239@gmail.com>
References: <20261126061910.2840-1-sreekuttan2156239@gmail.com>
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

Restore the cached follower values when the underlying put
callback fails.

Otherwise, a retry with the same value may be skipped
because the cache already contains the requested value.

Fixes: 3b0a5f22d464 ("[ALSA] Add virtual master control helpers")
Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v2:
 - Add Fixes trailer.

 sound/core/vmaster.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/sound/core/vmaster.c b/sound/core/vmaster.c
index f43144ba2797..f5cc11eba25d 100644
--- a/sound/core/vmaster.c
+++ b/sound/core/vmaster.c
@@ -193,7 +193,7 @@ static int follower_put(struct snd_kcontrol *kcontrol,
 			struct snd_ctl_elem_value *ucontrol)
 {
 	struct link_follower *follower = snd_kcontrol_chip(kcontrol);
-	int err, ch, changed = 0;
+	int err, ch, changed = 0, old_vals[2];
 
 	err = follower_init(follower);
 	if (err < 0)
@@ -204,6 +204,10 @@ static int follower_put(struct snd_kcontrol *kcontrol,
 			return -EINVAL;
 	}
 
+	/* save the original cached values */
+	for (ch = 0; ch < follower->info.count; ch++)
+		old_vals[ch] = follower->vals[ch];
+
 	for (ch = 0; ch < follower->info.count; ch++) {
 		if (follower->vals[ch] != ucontrol->value.integer.value[ch]) {
 			changed = 1;
@@ -213,8 +217,13 @@ static int follower_put(struct snd_kcontrol *kcontrol,
 	if (!changed)
 		return 0;
 	err = follower_put_val(follower, ucontrol);
-	if (err < 0)
+	if (err < 0) {
+		/* restore cached values on failure */
+		for (ch = 0; ch < follower->info.count; ch++)
+			follower->vals[ch] = old_vals[ch];
 		return err;
+	}
+
 	return 1;
 }
 
-- 
2.55.0

