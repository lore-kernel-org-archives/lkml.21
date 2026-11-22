Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795372557;
	b=e23NYs7Y8KrC4iSt4N//1OMOq17Pr/b9SnoF/RTZE0uG9gQwdTaM0y9IVD7ESvXYuvNf
	 FBWsKiHceowVh9LM2ZbTMToyZuEimnYKzsAGACyH1nehTQVJMDCYaoDO2WwtD/CuFP4x+
	 WPxFN4qbQXM08SySZo6eSEGPrijtaUbGPeDSm469b1Xvf4vqUqmxPbBq88i3rzNuOHu8g
	 JhHLEuJ6e8WEs8N2263sun/OB4VfrLcnLdnUJNasDeYqudaUnCE1/ETzBoFa9wXq4g+w3
	 hpJdELQ7CSTEjruVJaZWJbrO3DtTban0mz4DD5hWIrnD4PEmsJSIE3hNCCjuwRRgNeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795372557;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TA+pIVlFttShEJ4Is+NIc/o3+s05F2oLSxfZfJRE54M=;
	b=JD9Oqab6pCk4CkFdfJwajacNkq1yGq2x/hh8AJXqeL/yfOF9W28orkQNvpAjQfiJ9Cah
	 Q7m0QPoEo22dGMge7o6AOSWhzk6C+vd1VwvgVwBHre4h/wGp8LOdly4xQ6weI2UCvkPLU
	 mzlO9QZyWuxheaunFiVyu3/3geGLQpf1u/mQiFjDeZcxWhxbfXVARruVeoFs7C/rbeai5
	 EmuI+WZoGRJCTwEqlv14ltjaRCDB57W4pm1mZ4flV/22hXL+pC/DKGjImHvlsntOEufd2
	 +Njf8H2LHvBEVQPBuPDnwb74IIar9y8oRC3bBgXu2RiJ/0ay9h1K+ypJfjPoRocdW7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nQIqYW9l;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31133606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:35:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31133606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nQIqYW9l
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3869f03af6aso1523024eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795372556; x=1795977356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TA+pIVlFttShEJ4Is+NIc/o3+s05F2oLSxfZfJRE54M=;
        b=nQIqYW9l5PUEwLkKjJDl9/mql44+XluwIKd2Fym5P7qo14TyxvAXbB6mz4n75vVdyP
         VR3BZvnSUjpO5s79ngrBR6Iv/o69ITcfRHaNBaZKnSazJBXQiB1vjsWROftzTpIaBQJm
         kHojgydqlu0UZQCEZrEBKHu2HvSIrxKph7V6aF01IQ48OU6ptDSXQSEQLfm3vND0yEfc
         J42VpLA3KuhiEcQ4Ql72zicwMtIt+EgaR02A0wXbtK3d6xkdYJ20OMAP68CgJw7EW6dt
         niJzAPBRFNJ//tW9SwAwCLBk36VjeZB1DJLICT+VRzlwJsrFNOP0esG8mD1viS4D79KG
         hArw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795372556; x=1795977356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TA+pIVlFttShEJ4Is+NIc/o3+s05F2oLSxfZfJRE54M=;
        b=j1NQOkS3o6E4eHha6fSeGGd5RUrYidk5MEMRM2YPh7JQh+rJK3ZY+jQlkq/iGgOcR/
         WJN3FXwpXQ/yR8Yk3phXeqCRuPdiOaB1zzz60oCMSnNoElxD27iSZgbkrn/IqjiwjNXj
         YYzRFe0HOYGxPRkOAt6ftrpVMkQG8D7SaR2FV6abqm0WMKqOfCaZnUtDhSWC86mVElHH
         Bz6+4Oo3ais1SZ4fx+mpaW3P3I6GQpadcYDxpwwc4Vuf+Ac1kr6tKi2bCE6CVRl3u62O
         UCLzcsbYnQEo32E6IgmEFMgfPx4MiS3Xif/Qgu8EZruDJfbgKzJsPB4Uyuoq1dZucHYk
         eBEw==
X-Forwarded-Encrypted: i=1; AL+hErG9d9Iwrp3SDP4Oy+ZoszDYBJzcia8Y6g4zH44vqqNqYcPM5XlrnxzzOSqOSRoA37jAshDvkl/WbRNaL1c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/paYscBGxyGnJnYywXMVbmKYDgStlliDquBgTMIpd8t0dHhnFd
	0nKRV7jWqzcN51ylHewntw+rX6WDZ20iF1YMA63aPROUuyBZFvn0NEwd
X-Gm-Gg: AZFdTZcQLLCbQQ15mz49lkRje1sxu8P7TckZnjA7AaS4tWeyc/7td8v6Pz6f/zEiq89
	K3/cwuwJIRzNeka73lQszWK1Vz2b4Q4Zk3MHrGATuTD1xRz2R4X5M34vox+DO0WkhjZe5sCHyfX
	CdnbvbuOcX9yEhTsIv2Dzewi5NaduNIeEAUohhQPBNOntiG7SgGnzprszX4LWwCv7oqPiSyJTPI
	FMGbSg+FmP+rIvwp0gunu3KYIYp8gmHVrLbtL7zkJWHbH5XTxnNaPKipDsywQNB0btXViCwPpyg
	QjFNbC8bKsClgqiSGhmnyBUdp/DCsknuqMFJEWa4nm1b4A4ZVavCTyMkOrHpudfM5d86c4uGSnk
	3lK+kfHFIP7uRk21CxcOHEk+9YEWb+fd9Aaef2sGYgFf5rWBUHzwnr3gcDWYSAVqo9LzONy8hh6
	QXj3ttlN1P49yip9xT7P4i2TSeM6P/NXF7jmrIRLhp5Xyj4GYNCyouwi/wll3ofLewULgLUW6of
	ihr8NTrOnbVGEEE8btgr0OJsUDdgDJhe2rfLhzbUa7CcRhaLf7/VZ7NXJEYOFOHsSUzelthNx4i
	y2agkNRuXpCYGZw8Nvy+zxDj3oUlwi24GtjwJVy9+HJioX4N3X/Svw==
X-Received: by 2002:a05:7301:a0b:b0:386:a416:6c91 with SMTP id 5a478bee46e88-386a4166fdemr3601095eec.20.1795372556143;
        Sun, 22 Nov 2026 10:35:56 -0800 (PST)
Received: from ubuntu24.lan ([2a10:8744:5c98:4c22:e925:ced2:1029:b0e0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm30280810eec.6.2026.11.22.10.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:35:55 -0800 (PST)
From: Yiyang Chen <cyyzero16@gmail.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Xin Zhao <jackzxcui1989@163.com>,
	linux-rt-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] softirq: Limit the BH count warning to RT BH lock users
Date: Mon, 23 Nov 2026 02:35:47 +0800
Message-ID: <d9554bee441d2c763ef8d61e966a7a471915bbee.1795372382.git.cyyzero16@gmail.com>
X-Mailer: git-send-email 2.43.0
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

__local_bh_disable_ip() warns if a non-preemptible task first disables
BHs while the per-CPU BH count is nonzero. Without the RT BH lock,
this check can turn off lock debugging on a valid call sequence.

With CONFIG_PREEMPT_RT_NEEDS_BH_LOCK=n, the following sequence is valid
for two tasks on the same CPU.
Both tasks call the BH helpers with IRQs enabled. The per-CPU BH count
starts at zero.

  Task A                          Task B
  ------                          ------
  local_bh_disable()
    softirq_ctrl.cnt += SOFTIRQ_DISABLE_OFFSET
    current->softirq_disable_cnt += SOFTIRQ_DISABLE_OFFSET
  <preempted by B>
                                  preempt_disable()
                                  local_bh_disable()
                                    B's softirq_disable_cnt is zero
                                    preemptible() is false
                                    WARN on nonzero softirq_ctrl.cnt
                                    softirq_ctrl.cnt += SOFTIRQ_DISABLE_OFFSET
                                    current->softirq_disable_cnt += SOFTIRQ_DISABLE_OFFSET
                                  local_bh_enable()
                                  preempt_enable()
  <resumes>
  local_bh_enable()

The warning relies on the per-CPU BH lock serializing BH-disabled
sections on the same CPU. With CONFIG_PREEMPT_RT_NEEDS_BH_LOCK=y, A
still holds that lock when B runs. Since B is non-preemptible, it skips
the lock acquisition. The nonzero count then exposes B entering the
section while A holds the lock.

With CONFIG_PREEMPT_RT_NEEDS_BH_LOCK=n, there is no BH lock for B to
bypass. The same nonzero count simply records A's active BH-disabled
section, which may legitimately overlap B's.

Guard the warning with CONFIG_PREEMPT_RT_NEEDS_BH_LOCK for as long as
the lock is optional. If the lock is removed, as discussed earlier,
the check can go away with it.

Link: https://lore.kernel.org/lkml/20260310115534.3477871-1-jackzxcui1989@163.com
Signed-off-by: Yiyang Chen <cyyzero16@gmail.com>
---
 kernel/softirq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/softirq.c b/kernel/softirq.c
index 7fc2200392cd..f64f6b594951 100644
--- a/kernel/softirq.c
+++ b/kernel/softirq.c
@@ -195,7 +195,7 @@ void __local_bh_disable_ip(unsigned long ip, unsigned int cnt)
 
 			/* Required to meet the RCU bottomhalf requirements. */
 			rcu_read_lock();
-		} else {
+		} else if (IS_ENABLED(CONFIG_PREEMPT_RT_NEEDS_BH_LOCK)) {
 			DEBUG_LOCKS_WARN_ON(this_cpu_read(softirq_ctrl.cnt));
 		}
 	}
-- 
2.43.0

