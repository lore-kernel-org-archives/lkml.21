Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596670;
	b=W+cF9KwqMEo4Zb7HfYR/9ho1Bf4T8Wl/3TchoLAGO7sgEog3rnYctmcrshiCJoA1hRSk
	 lEG3VqIa2JKjUsOtG5DOyOYgyuwfTrw+a93HrxKfvFBWK9zQImbAPq9Lo1lNs82bqOkHz
	 frclIsZHWfTDQHUqFerIduGMDNHfoBSLI46n8+4SSpeOITjjWWE4tOEQq0NPkEieyBlxM
	 xrCwQXHV0x0vndF8/iK6Lh7w9XiUcIOOJrbknv0vp0BhSE1oRqfkLTTP74ro1XivkDFQC
	 7cn5ZcNMaro84yJBbZOTu3PLd2vS3LS8DWEcKjxT90sbebSZgFzgjbq3IYgsJW+mByw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596670;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QAnCCnK2ZlhscigH/xJOagQpGqQrgNxkKqyWM53x5U8=;
	b=Q2gIEK3BVeEAAv8z0Fwq4G3jvZ/S/NiiE6DeMUYlPF0pqRvVKYHI6osnjctQgSDsh7nc
	 sGlF2HzcF4DqsQBSkN0bgOqYa8S4niyO3fhVBZpRdwRz6sAF11E9PeFENVzOB/VYOrMmz
	 Qa6ikQiQ+NJp87/W3HB+nUsp96KOQmsMglNJoMkObixm9DxQVlpmNpe54cOM2DOmdkEpL
	 DLD1QwH/novkLApnQHJtlzotXx2XTCrNnY5lqRLr3AzAWoJox/zunzMv8FDyHol8ViiVX
	 NwCXfesHOiq3ypjdpKOI/ZtmdwbSQ+o6oCUqgt0FKYyF/YJiIjmJvavePbVv0WRWEWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nebusec.ai;
	spf=pass smtp.mailfrom=nebusec.ai;
	dkim=pass header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=TPvjrqep;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5844E606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:51:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5844E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=TPvjrqep
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2f07a960666so34345935ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1795596670; x=1796201470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QAnCCnK2ZlhscigH/xJOagQpGqQrgNxkKqyWM53x5U8=;
        b=TPvjrqep2B2ll4hmDVW5USQclSsz406+o8spiSxj70wkJPCx/pTtlFg1iCIEj9sQEw
         mFXzpVAzkCsOE25Kn7pVbV2cy6sJaglRY8WRm81FjhR9hURLCLVCP0P2ZbC+ML9JyJdC
         FG4mi+yqXNnEWn5gZQVRARK/1Kx+haWkuOgsxBapT3sHEcGUgiwXNzkPAczAPvUb34YF
         6Mi0pFfD24w6ZZAXJBSL+UaMHrzK+DL6NV/D3oRN2qTn4Wr0jXwFhJenP2Gyh6Y9hfGA
         UvsCmj0Ih/nwZCVNNo/73qASiKfj+xPBGKKBbLfh4Fx8LeEaXe4gCLbUddggqfLZr5Xp
         TVBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596670; x=1796201470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QAnCCnK2ZlhscigH/xJOagQpGqQrgNxkKqyWM53x5U8=;
        b=bLF6wMpAL5FlgHUaQ9i3dfoEogPHa2kW9sT4ru0pzI3IZ954VsitW8t2M9NDWw6wmG
         X5KB/fJvQi5GAlHTy5wlR4wG1hqLEqraoSVhYzzYo4xMwGVg0xhPXjvBPCxV3yuQTo5V
         eaqaNCm0sgSMigGUqstzMUhF3GnuuAPi7wzM+RBiWMGQ8WgPQKMsFincVS2de9djM0tH
         M3eDsGDaJJZ1pY7Anw4CSWLgTCBwdT6Pq4DZVMDNZbPaEEIwoqwN3jgfkUHEzo1D9PXM
         iMNKF2BK+XD+6YYRVrGetOpZuEHdSqgBz1XxN4Q05CII0y8WpT6Gm0jo6gP3n00/R5aO
         LttA==
X-Forwarded-Encrypted: i=1; AL+hErFGDDUT+qR1tChMDC375jCZIlxJaKpqqsa1KTBWXd/jj13VuVueYl//cdEBxYKUffUstZmyvunsBjbYtBY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hz9Cj4V3mBiMGvEBrYslq2mPcrXKRnXo5+CzveRG0YLyFCAW8
	YystGuoP1P4vRf440q4Qi8gAU5798T1xwwilaCL6Hswo+0GQkwP1uSED2UyEp7bKDxda
X-Gm-Gg: AZFdTZdiYbONkBUfPKv0CBVeQKO4kxBTsKl58smcs0dG5/YhOjvYIqSYaYQjKGLJGuT
	myPQFFEx1BSrR4zfr8jWt3cGGLZo5wHzuuhwGWN2FhQnP+M02Fvh8rU5d7xogU8dexq1rMH+UjL
	1lYL3lsBjAc/vprfopi9IkKl0XQvGLpTWjVNP16Ygy84d42C2oqEmK/NwKTRXWGxEV/NgW0SRhj
	0lPflNPuLa1Hp8sFki/BJ2sxjR1JZFKVm3wM6HMNxKmIBw+07zd6GoW780pqqvKXZOCbH858XSp
	njv2bsxM4QBv4PrBlwGaphfVpJ4aDl3+WPBf5pTgnXavj7upMkcinzbu1X81Vb0XnQc2L8ZIRkp
	2a86pKkQR6CK9L9GbMguY769ELBBlZVQD9Dq0gSB8O7AJDi+sxD2r5EllQyw5oYfYEWA2Ag+BOR
	5ShFC9MvufO2RJ5JtEPwwH8eDA/DmjL0OiPJpxDtN43Tu9TbNd82ga2e6wEQJDwJvAZ0ss88fhE
	BpyGJgQaPcketr/tjIusgWj+cQrE+BO0BHwoXRUpNq6JNNXF6XU1Y0ViLDB/fXFkQmqNEkfvRfR
	0Jiy0jApeUpYwIFSlMgecfA=
X-Received: by 2002:a17:903:b4b:b0:2df:991b:4368 with SMTP id d9443c01a7336-2f03f1817ddmr183305835ad.53.1795596669599;
        Wed, 25 Nov 2026 00:51:09 -0800 (PST)
Received: from enjou-Legion-Y7000P-2019 ([2a05:dfc1:8bc4:feda::14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee844acsm84491425ad.2.2026.11.25.00.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:51:09 -0800 (PST)
From: Ren Wei <weir@nebusec.ai>
To: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: rafael@kernel.org,
	dakr@kernel.org,
	johan@kernel.org,
	akpm@linux-foundation.org,
	kay.sievers@vrfy.org,
	vega@nebusec.ai,
	caoruide123@gmail.com,
	weir@nebusec.ai
Subject: [PATCH driver-core v2] kobject: terminate the uevent helper environment
Date: Wed, 25 Nov 2026 16:51:00 +0800
Message-ID: <39d1eae0d7c8b235f5d4b68d94205b70832ab786.1795506878.git.caoruide123@gmail.com>
X-Mailer: git-send-email 2.53.0
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

From: Ruide Cao <caoruide123@gmail.com>

struct kobj_uevent_env has room for UEVENT_NUM_ENVP (64) environment
pointers and add_uevent_var() lets all of them be used. Once the last
slot is filled there is no room left for a NULL terminator.

The usermode helper path passes env->envp straight to
call_usermodehelper_setup(), and kernel_execve() expects a NULL
terminated array. A synthetic uevent written to a sysfs uevent file can
supply enough variables to fill all 64 slots. With CONFIG_UEVENT_HELPER
enabled and a helper configured, kernel_execve() then walks past the
array into envp_idx and buf, and dereferences that data as string
pointers.

Lowering the limit to 63 would avoid the overrun, but it would also
reduce the capacity available to every uevent, including the netlink
path that does not need a terminator, and could make existing callers
with many variables start failing.

Add a dedicated sentinel slot instead, keep the limit at
UEVENT_NUM_ENVP, and keep the array NULL terminated after a variable is
added and after zap_modalias_env() removes one.

Fixes: 7eff2e7a8b65 ("Driver core: change add_uevent_var to use a struct")
Cc: stable@vger.kernel.org
Reported-by: Vega <vega@nebusec.ai>
Signed-off-by: Ruide Cao <caoruide123@gmail.com>
Signed-off-by: Ren Wei <weir@nebusec.ai>
---
Changes in v2:
- Keep the capacity at 64 variables by adding a sentinel slot instead of
  lowering the add_uevent_var() limit, which would regress callers that
  emit many variables.
- Compare against UEVENT_NUM_ENVP explicitly.
- Keep envp[] NULL terminated after zap_modalias_env() removes MODALIAS.

v1: https://lore.kernel.org/all/cover.1795426787.git.caoruide123@gmail.com/
---
 include/linux/kobject.h | 2 +-
 lib/kobject_uevent.c    | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/linux/kobject.h b/include/linux/kobject.h
index 55e37a5d405e..f546f0f732e1 100644
--- a/include/linux/kobject.h
+++ b/include/linux/kobject.h
@@ -124,7 +124,7 @@ struct kobj_type {
 
 struct kobj_uevent_env {
 	char *argv[3];
-	char *envp[UEVENT_NUM_ENVP];
+	char *envp[UEVENT_NUM_ENVP + 1];
 	int envp_idx;
 	char buf[UEVENT_BUFFER_SIZE];
 	int buflen;
diff --git a/lib/kobject_uevent.c b/lib/kobject_uevent.c
index 1d29378d4f55..25e388acc5ba 100644
--- a/lib/kobject_uevent.c
+++ b/lib/kobject_uevent.c
@@ -459,6 +459,7 @@ static void zap_modalias_env(struct kobj_uevent_env *env)
 		}
 
 		env->envp_idx--;
+		env->envp[env->envp_idx] = NULL;
 		env->buflen -= len;
 	}
 }
@@ -673,7 +674,7 @@ int add_uevent_var(struct kobj_uevent_env *env, const char *format, ...)
 	va_list args;
 	int len;
 
-	if (env->envp_idx >= ARRAY_SIZE(env->envp)) {
+	if (env->envp_idx >= UEVENT_NUM_ENVP) {
 		WARN(1, KERN_ERR "add_uevent_var: too many keys\n");
 		return -ENOMEM;
 	}
@@ -690,6 +691,7 @@ int add_uevent_var(struct kobj_uevent_env *env, const char *format, ...)
 	}
 
 	env->envp[env->envp_idx++] = &env->buf[env->buflen];
+	env->envp[env->envp_idx] = NULL;
 	env->buflen += len + 1;
 	return 0;
 }

base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.47.3

