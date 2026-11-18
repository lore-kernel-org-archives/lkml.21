Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794999767;
	b=gsjOBCIUYY1VuChrgmShJNphTVyA//R9EoF2V/C1bo4ZgdValTJiYyuFe4m/qsHYP/jJ
	 eZ1EFgmILWSksbZ8wR5I4Cj1Vcc9r5Lgqk80dJ9Mneg4vIY4KVLSDyAVcnxIBnBMaEkKR
	 eo8Rls3G/oslY0IoW7mPvTXII2qs4w02JAqTjI39p0oWv/9D7nx6n0iNgo9dwk0pFx45l
	 UkRW0bQSvEMdMdMMVRTORb0l9dOO9WGQ9AucuwFrbhCUb2DaIM5gBuVOZNsulfUrYXtMM
	 69dcD4qVdmOepAxUyAaRCWcZg9TOY0cm6MUb88Wuqm3kPxZ1SjhZtlnowsdxad4FxvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794999767;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SqV4Jv6wNfUGVd/YP57RFpsT3eJh+v6vOgo/2e6RqII=;
	b=fX5Df1zxlArQdsShY3AmOIG6ZCOudxzvfQca3FaFE4+ZqT/MVxUlesD+L7bIlXSWWxh+
	 kbAZq5/aA9lnhEQz3NWFaHqxtZ/UUB42QcnoWyp82uTeGCcxLmDKpcTcK4ruJC2He12H5
	 3pQ0wJYGk6kD/Q/r2iY44kPX0NdyXZYRBqoWh5AZa9L3jwF8dzLiSkFHVkzXyF8wLv2l9
	 X7/pWrRcmt0eM5sWnErunt/h+CmqWGfuNw9kwmAw86CxBMvBEPCmH9hRKbSll7/QuiAoT
	 VpVjIQUt84YUQPB9BVwBgIp+c6bm10XDEmK3+7GmirMz0fXdjdNuFDdkfQlsyIVrvgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openvz.org;
	spf=pass smtp.mailfrom=openvz.org;
	dkim=pass header.d=openvz.org header.i=@openvz.org header.a=rsa-sha256 header.s=google header.b=c1Nip5xs;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920BF60A2601
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:02:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 920BF60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=openvz.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvz.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvz.org header.i=@openvz.org header.a=rsa-sha256 header.s=google header.b=c1Nip5xs
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so8572195e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvz.org; s=google; t=1794999765; x=1795604565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SqV4Jv6wNfUGVd/YP57RFpsT3eJh+v6vOgo/2e6RqII=;
        b=c1Nip5xsyTHC0xGWwW3Bb2WmpVhPiD3B24SZrfsIxPhHbI4aIKmUngZA/nkDZ97KXq
         rvK3wYysqPwFB+RsrPMtRHpCjwEsFbvCxHEqjSYPOfz2UXfBTtOiOW0Ujn0aNsjohLJr
         3x68RfmSjhC/MS0zdU4CcqaUksM1VHcBjPV6MQNb3BZ1lyJkxrcjnM/UA7TAdvSr+bJi
         MdocO7/j90Yq6+LSQyrCWuVo7nGAH+ZMoYTtN/6w+M6Rmybk2UE1k7PVnhDTg+BOZ2Am
         mVDeZhiX+A2jN9DRCTyXerZG2fcD71dUck6FdGmeXmUxhgbl9trxFGcdptmF1dqM+T3x
         uZvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794999765; x=1795604565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SqV4Jv6wNfUGVd/YP57RFpsT3eJh+v6vOgo/2e6RqII=;
        b=WX/Vqmg5ilRQPXRbnx8lqYLzsZHJaelrNlEsBlxr+LEh1coC7y6Po1tina2Yphgjbz
         ov0aBcq5/2S0e7IMEvChDrZvLw0WvSpdhX+XUCb/InZtKNK0K1q3w9gV2WpNeVD+WLfa
         bldgArWohsgLFSVR1hqwBKcCmhGSyS1y/uj3v1NSxEP8rslcASeAhR1JLUDXhYmGT0ug
         FKRsAmyX2YcXHazE871ZceSO0MlD3gznAb6HCV5GjzPGwMyT6w0bRMc38NthztsMwCAH
         PK/SnDPRhIHm9LBSZr1CbeMAJbibx8E1tfQK4UntGJd5QqKoaVfESiYd0W4kUykke2zG
         Yz8A==
X-Forwarded-Encrypted: i=1; AL+hErHOocdO2+OzaMtT0VIThW5Jw20pkooy9+FStV8E4SZF+Rj6Nvil7MW7JXlcnLwf7CTzoXO5QdfiWhvde48=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UbXYoRJ4zlJbqHdwmOjRuUk3pIzlKxX9/uoKtSTIfJmsL1V0i
	0pEBZ9aPYc4wPJiEKKobXHpgRIHvmzqrt6b2WwPuUVXXdsqhmX82S5ZzhhVh99zuVMc=
X-Gm-Gg: AYBFou1WAXpcwiyxPRojUXHssO29qbz0ha4N0dufQWqluasHeoeK4rCC9v0m1VI2nOv
	DJAnX5jzbipOKMc6bR/dIpWBhsQvYB0aaPFKBiFHOMVZ9FcgXJ4EgUtcWeX9ctBbAVYzWAHevCP
	8Zc5dAhLRfTgBC+M1XP13oeQExpgKMYmr2CP8Hos5yxXLVU4Qcwi3INa6T8rWBhoNqgTYIXczVJ
	HD2XY43XypP81S34Pnu9fHJvJ5nVPP2qC/D02D9aavYIUYQMyFqwM2l5BnKpJwc/t48SlzsL9Nd
	RivozJFQBHo3rYerExcbM9krWezsUdOSHYfIg1IEObEaWc68z/lQHrEafxa/JyIMGQ5zaTJW4L9
	DYBlKU9nAHSpoBuAD9T+QPZda0F4RitmWBmEMZKLYbV5cGfmpI6r6cdir5mOXJh9HvS0buzEP01
	Yy3xXn1U6E95a5vu2youEBpmz5o0LCMXS3hu9biAovMK5x2Rj+9YrO+VPRKcka8JbDhi8Iz5dqr
	P081H2Tb/jb8QVQ62CnvRxxCsn1h1H118IPESRNH9HO06oqtoWqrt7hPP3ihOrHICQgHVOrhmQt
	XXw9Jdb0xiHffesChPnZtgiXHYss
X-Received: by 2002:a05:600c:3b8b:b0:4a2:526b:d410 with SMTP id 5b1f17b1804b1-4bb7da1b581mr53254625e9.13.1794999764776;
        Wed, 18 Nov 2026 03:02:44 -0800 (PST)
Received: from artemis.sw.ru ([2a06:5b06:b600:300:8c09:3cc3:6efa:ac1f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656c1145esm3943277f8f.52.2026.11.18.03.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:02:44 -0800 (PST)
From: "Denis V. Lunev" <den@openvz.org>
To: agk@redhat.com,
	snitzer@kernel.org,
	mpatocka@redhat.com,
	dm-devel@lists.linux.dev
Cc: bmarzins@redhat.com,
	thornber@redhat.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	den@openvz.org
Subject: [PATCH 2/3] dm era: refuse metadata rpcs once the target is suspended
Date: Wed, 18 Nov 2026 12:02:38 +0100
Message-ID: <20261118110239.2910290-3-den@openvz.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261118110239.2910290-1-den@openvz.org>
References: <20261118110239.2910290-1-den@openvz.org>
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

From: Denis V. Lunev <den@openvz.org>

An rpc reaches the worker in two steps: the caller puts it on the rpc
list, then wake_worker() queues the work unless the target is
suspended. stop_worker() raises that flag and drains the workqueue with
no ordering against either step, so an rpc can land on both sides of
the drain.

An rpc queued before the flag is raised, whose wake_worker() runs after
it, is never served. The caller waits for a completion that only the
next resume can deliver, and it waits holding the table srcu, so a
reload blocks in dm_swap_table() and the device can no longer be
reloaded or removed.

An rpc whose wake_worker() read the flag as clear can instead queue the
work after drain_workqueue() has returned. The worker then commits the
metadata beside the commit era_postsuspend() runs in its own thread.
Both commits allocate from the same space map and take the same block,
which corrupts it, and every commit after that fails:

  device-mapper: space map common: unable to decrement block
  device-mapper: era: metadata_commit: pre commit failed

Add the rpc and queue the work under the rpc lock, take that lock to
raise the flag, and refuse an rpc that arrives once it is raised. An
rpc that made it onto the list is then queued before the drain waits
for it.

Userspace sees one change. A status query on a suspended era device
used to block until the device was resumed, and now reports the target
in error.

Fixes: eec40579d848 ("dm: add era target")
Cc: stable@vger.kernel.org
Signed-off-by: Denis V. Lunev <den@openvz.org>
---
 drivers/md/dm-era-target.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/md/dm-era-target.c b/drivers/md/dm-era-target.c
index ea499adca4ce..29b0602e7849 100644
--- a/drivers/md/dm-era-target.c
+++ b/drivers/md/dm-era-target.c
@@ -1389,10 +1389,14 @@ static int perform_rpc(struct era *era, struct rpc *rpc)
 	init_completion(&rpc->complete);
 
 	spin_lock(&era->rpc_lock);
+	if (atomic_read(&era->suspended)) {
+		spin_unlock(&era->rpc_lock);
+		return -EBUSY;
+	}
 	list_add(&rpc->list, &era->rpc_calls);
+	queue_work(era->wq, &era->worker);
 	spin_unlock(&era->rpc_lock);
 
-	wake_worker(era);
 	wait_for_completion(&rpc->complete);
 
 	return rpc->result;
@@ -1427,7 +1431,10 @@ static void start_worker(struct era *era)
 
 static void stop_worker(struct era *era)
 {
+	spin_lock(&era->rpc_lock);
 	atomic_set(&era->suspended, 1);
+	spin_unlock(&era->rpc_lock);
+
 	drain_workqueue(era->wq);
 }
 
-- 
2.55.0

