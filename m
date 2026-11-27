Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772685;
	b=eRLr24DDti9+4klAW7dW1sg5U3mOY/yFuwp6SFyVy6MlkN+9yWK8sEHUSoZ8A5YLBnvc
	 jxTPTqrNGfjpKWHA/MYKcmCIf22L9XuhUSWHyvZI7rKz8tRwVjDEkAE4fbjWNlyWJFcSf
	 vI/tnmnHX1gUFty6cUSOUV8b/BCO2EHCxM5q3x8qLcMLKAuHbgLP7heQfVTOB7zgm/nsK
	 bwpCTiKy4c/JVx/gAGQ1R/keYKQe72JaUEOyDWMNO7NTLmcFpW+wnnRqxEE7vEKY4d7i0
	 ZmLumh4AKN1tdJONIaU5GQ8eEgLUkccRtqkmqn8RBy/+xkjsmiPkgexSsFJnSorQVQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772685;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2AXdsYqzJ/4Ge1n4R0RB4I2MudVnosImi/2iRiqd2Lc=;
	b=UeT0iXRDvAxY/CmrRmnn4VHHxbjyJOZATXf/b9puPw8QMx4pQ3UIxkhqE0EVCMa0nVz8
	 gITeeN5sQ0RHyK0mAaDDPLS2imXXqnKRr3r842L47OaL/IgApMlN26nP/kkd4Pv0XEZkC
	 jLWDU+x79wMKKno8zIVhRnmWI7znklaqrA92Z77Zf6lKY4cvrQF+30GrBaTmNA0+xR+pH
	 ldSkBRixzLqSHZIl0JixGJOcBv72GUhVWfiRgMh0NNheRAoh8C4hYsNqH0mxtW01jf7de
	 DjPeJm884d84tg4ukm6CmopYJ/fSdqirUcfX+syYoH83gy8GqD1vWwCjgl8rC0rNk1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unc.edu;
	spf=pass smtp.mailfrom=cs.unc.edu;
	dkim=pass header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=mnuimqR5;
	arc=none smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C35606A324
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:44:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36C35606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=mnuimqR5
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-53664b4860bso86143081cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1795772683; x=1796377483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2AXdsYqzJ/4Ge1n4R0RB4I2MudVnosImi/2iRiqd2Lc=;
        b=mnuimqR5eHedJvkjLRpAyGMmRiLd26PQ0mdJgGfe5RpD78Crntx8uzmudIXtv7HPCL
         XgxBZpO5QGsymcc1Pv/0VTkZcQAR9z0/sHYx4l/K7LYldjewy7MuSziVnRrbHr5mB51P
         AclwtgicUar0+ty9dIfV8cYT6UApzVV+zevmC+EsG7wO8Nak3LT9U3Q7Kmm53fJMP5iP
         0SucfhQvm+xv0pVmO2SntNYYrwdR8pki0ECBXH9O8LVlZIB36IeNEcsXbMfQXULPznCn
         zlqsrzhmthpDewTB7uVqu0lsZKfpXp8zmO6z1b5oa8C3lBh5mL2zAImefRvPbc16wOXz
         iJrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772683; x=1796377483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2AXdsYqzJ/4Ge1n4R0RB4I2MudVnosImi/2iRiqd2Lc=;
        b=L/q46LpNc0QDzfIj4V9z+93J659hPyFr5QkR/78WfmGQdYS3TTsTJUtThUGBzmXO7L
         XqBm6OG2hyl530liZB0eoNFnqZ/WJvsZnabZ+KF+k1eO+EGHSt6NWPcp+/wa8xcFSdHA
         gv+o6yIwpW+ZLHUZwupFoj+Fcs1rlgY7GpSoxBTiGY8tmtojPVLlhLtFu9umxla/gVTt
         hJc4o8qTpS9WmBufmfB6hCQwmka1UzJ122yybvnmMrBCY7MVEFHig5Oo5eSzN56+AWma
         Okr0YD7ycc1H9owLmj2uRv8GkJtPydSm0sKnJukR28dhc8DhhizNLIXSk+N++hIg39J0
         AlDQ==
X-Forwarded-Encrypted: i=1; AL+hErHFajpelgLHJeKMUHhChr60QLByhQ/GX2WEBCC98AGzIEOlRdFwMiTJ/YnoYrBxNNU340vyFM9mTG1IaM8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NY3kg0edLor3WQPpC8nLj2PUb6VkFpoEzMUQE1o/NBUIHS39R
	VA3+0w47FA4tcj7aRAZ6CXDzgCRYLhaLWrwOW6E+jicR2Z/HpVO4LgFNKLX5CZsfqA==
X-Gm-Gg: AZFdTZd0GBa8CiXo43qCzM5RFJ33PPjAAHszvX9f5ftBe1ui8sNNpeB3zjYlWRhiBfX
	CsJnuxcriMCdwetnj9wHOIOmM+3jZ0dzFVhkwyzUbeIdfSStw/KvEuPahmiVA2Kc04pIO1CyeuJ
	JijQRui/rfLqiuTQTZkf4t72KufXsDYE/N7ZwJR/+AIkGBPsx+2tjo5SPU3C8lzSvfNAn/jv6tt
	itO0WZJ+4tL4K4I3MWIObNyULMa3r/3cfahhDZg2UQRYVu+TZB8G3L09LnYcMEyoD59YhvK2KIs
	+DfqdGdsouwtMtmzr7feV06jq/LQaeEdD1mPgHVsX9DCe8ONIApqi82gBKRB/OsQbxKpp7TKbNs
	9l86dqwH99/P1tUu0DaJC7wT6EvFEkypqMfq9/wRqVl2UBIRJYe/g/NUB7VSaFKhhOsxvipvL99
	U/W17g9wcCVp19oerTYI66+RL+qtWL9pvnew1YAnVLVdCO6wsNap4HvPwrmgBeHfKgwcQOB1by3
	0QAffDd8p9ds75nGqyBzM6Lfo2G/eiduot+6tFRC8a2vDLVQQunJqJ/9hoqeofRa7cXEbeW0WM7
	jM3IuXMxVveDZdA1klKntEhnNYMQ7gTYTeqlh3PtTNTrXXP4Zpw=
X-Received: by 2002:a05:622a:120c:b0:535:a5f9:752e with SMTP id d75a77b69052e-55d76aed568mr440022791cf.77.1795772683004;
        Fri, 27 Nov 2026 01:44:43 -0800 (PST)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7889f8absm200058121cf.27.2026.11.27.01.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:44:42 -0800 (PST)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: Andreas Gruenbacher <agruenba@redhat.com>
Cc: gfs2@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] gfs2: make the glock wait in rename killable
Date: Fri, 27 Nov 2026 04:44:27 -0500
Message-ID: <20261127094427.1370216-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125185332.2549812-1-agruenba@redhat.com>
References: <20261125185332.2549812-1-agruenba@redhat.com>
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

Commit 11d763f0b0af ("gfs2: Retries missing in gfs2_{rename,exchange}")
made gfs2_glock_async_wait() interruptible. It returns -EINTR when a
signal is pending.

However, -EINTR goes back to user space as it is, and the system call
is not restarted. As of now, rename() and renameat2() on gfs2 fail
with EINTR when a signal arrives while they wait for a glock, also
when the signal only stops and continues the process.

The issue can be reproduced with:

    mkfs.gfs2 -O -p lock_nolock -j 1 /dev/vda
    mount /dev/vda /mnt
    mkdir /mnt/a /mnt/b
    for i in $(seq 12000); do echo > /mnt/a/$i; done
    umount /mnt; mount /dev/vda /mnt
    mv /mnt/a/* /mnt/b/ &
    while kill -STOP $!; do kill -CONT $!; sleep 0.005; done

Before commit 11d763f0b0af ("gfs2: Retries missing in
gfs2_{rename,exchange}"), mv moves all 12000 files.

After that commit, the result for 783 of the files is:

    mv: cannot move '/mnt/a/10' to '/mnt/b/10': Interrupted system call

Make the wait killable instead, so that only a fatal signal ends it.

With this change, mv moves all 12000 files again.

Fixes: 11d763f0b0af ("gfs2: Retries missing in gfs2_{rename,exchange}")
Cc: stable@vger.kernel.org
Suggested-by: Andreas Gruenbacher <agruenba@redhat.com>
Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
I found this while comparing the behavior of different kernel versions.
I used an LLM to analyze the problem and to draft the patch and this
message, and I analyzed the result myself.

v2: make the wait killable, as Andreas suggested, instead of returning
-ERESTARTSYS.
v1: https://lore.kernel.org/all/20261125175007.3659558-1-hengyul@cs.unc.edu/

Tested on gfs2 for-next with KASAN and lockdep: no rename fails under
signal handlers or stop / continue, SIGKILL still ends a waiting
rename, and fsck.gfs2 is clean.

 fs/gfs2/glock.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 21b71fe286b7..5068b680606c 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -1298,8 +1298,8 @@ int gfs2_glock_async_wait(unsigned int num_gh, struct gfs2_holder *ghs,
 		max_shift = BITS_PER_LONG - 2 - __fls(GL_GLOCK_HOLD_INCR);
 		incr = min(GL_GLOCK_HOLD_INCR << min(retries - 1, max_shift),
 			   10 * HZ - GL_GLOCK_MIN_HOLD);
-		schedule_timeout_interruptible(get_random_long() % (incr / 3));
-		if (signal_pending(current))
+		schedule_timeout_killable(get_random_long() % (incr / 3));
+		if (fatal_signal_pending(current))
 			goto interrupted;
 		timeout += (incr / 3) + get_random_long() % (incr / 3);
 	}
@@ -1311,10 +1311,10 @@ int gfs2_glock_async_wait(unsigned int num_gh, struct gfs2_holder *ghs,
 	}
 	for (;;) {
 		for (i = 0; i < num_gh; i++)
-			prepare_to_wait(waitq[i], wait + i, TASK_INTERRUPTIBLE);
+			prepare_to_wait(waitq[i], wait + i, TASK_KILLABLE);
 		if (!glocks_pending(num_gh, ghs))
 			break;
-		if (signal_pending(current)) {
+		if (fatal_signal_pending(current)) {
 			ret = -EINTR;
 			break;
 		}
@@ -1325,10 +1325,6 @@ int gfs2_glock_async_wait(unsigned int num_gh, struct gfs2_holder *ghs,
 			ret = -ESTALE; /* request timed out. */
 			break;
 		}
-		if (signal_pending(current)) {
-			ret = -EINTR;
-			break;
-		}
 	}
 	for (i = 0; i < num_gh; i++)
 		finish_wait(waitq[i], wait + i);

base-commit: a009501c151f7d19519312ccfa2070d30d62b249
-- 
2.53.0

