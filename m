Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795455748;
	b=uxtK1wfv2YzZ/r7jAzwwc5bRTxvU4cXRMJg9ZW4sT+Yd2HOBlxMQWAYMmQqrgGR6zJKL
	 EGPSC96pwC3mwMkBZamfELiGHu0rG8HstK3UJPnKcBXiwMJJ6JxgOtnSeYAiI8Ljfo3D+
	 N/7WHXUskE9Ndo3ly1U/T4t+cvaUspxL1bitJoXCSf7v7eDghD6CBn5jdDXgk4ptg7NNK
	 racaqye9Tpz/FFkgN9XoqVu+iK/29K6s5dcn+NGd2JaNcNwiY18yCjOj9CM3S00LPfNaE
	 Am0WsMgZpxUHwlU1CBDqgJc6sZO5WYqtfm9WpR1z4hodtvasbAVYDJc3oDcWdv6DvTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455748;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sjfp7sZFhOK52knRIHEyZ66Px2rvM9c24Jj9S6rf+y4=;
	b=5MyiLviFWdRoAiHHHjmGT19FPXGB17lCBG1ziurlOejhGR+B9QBObCxLjesACmHnQlVW
	 U/SPTMSOBLdwLdiLmR3oJ+F+BQs6H+uohzmzSiiPDoKpccYbSWB3R88M3T7k9gMUa871b
	 0OInhb90r20V8rz0tl3Vfei6SnQhWqgK38paMwVunhaZBcnEHc8YS6pB0HlDFiIBvWAOS
	 e+4wCIzCbafp/P2hucSbXiYHxgLUpYekHEvbJbRhLdrbq53U7BV08Sqroe3YHh3YvEiex
	 FOEb6Id49wYMrDS02Y8rmwUOJkA8ev0KvKHVb3yKZssuy5vUpZhixAt38dfNoPAi8VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sh45LhTQ;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5456606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:42:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5456606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sh45LhTQ
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b3acec6677so5075841c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795455747; x=1796060547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sjfp7sZFhOK52knRIHEyZ66Px2rvM9c24Jj9S6rf+y4=;
        b=Sh45LhTQn15DZAS5X7oZivPkdPBVyFdRTaSbK4uSRSZCsF8joxtnrE/bZBDj73+mSn
         hEQ++9/6jp0fwkZ9A9L/Wg7lhQlbFd+aPlOvwwRYIIFtlaW0zix2f8oKVfbBQuTvk8z7
         0ASYKVHyW94I7ahgoQ9V2dRS44NIw4Y3a+g9dNDwDV4G4EPN7PH5s+A0Op16kHEFPKeu
         Clxbx7eC6U8JUb+HqnbZLTDI0mLTK7/MSUE2oxmYRr6gqb5bXOR++tRjRjoInb8Z9hmz
         KHV/KdIFSlOMhdAnIy8DTS8ds/hoeBvEbIT+axII0fEe7I/hhBqnGH1JL2QV8dKsi6DD
         1GuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795455747; x=1796060547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sjfp7sZFhOK52knRIHEyZ66Px2rvM9c24Jj9S6rf+y4=;
        b=JF8qV+L2ZQ8IEMcGjz3KTS25JgdwKmCTb8+1whgrSZUB4H6njawY/x4w7pXyg3UObZ
         DkFFs8uDEQLoA8bheumr3pDa5mk+OBQkUWmUshS+ZQoNRv+eILZtj78Nx3DcUm7SJib0
         jmzUgi9OCVEYSCO6BJKR2SLRiZiKdaQE6iVMFnwIPqz54XVUYCwrglzKgoSC9qegFojw
         PnNYU7h0HMDXEUZ313+/DSW0qmFlY1bN68VrzYH7QlV/zVBdwE3ykJevBUJfboWw+GU0
         UOnmYLVNrrg/PHax9JdaviIyvPqEzeotcLYK7PDLd2bHaXfvgNaED7Q6jt6Oa58Vl0Ja
         9SyQ==
X-Forwarded-Encrypted: i=1; AL+hErHA1+Pd2dPpBeKnUGXVePXf/AzqHlHXZ3n6VVzypFl/pOFJNaQuqUK1JFaD+wrhJ1ML3vgowazecyUG6CE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MZHqn/aXfben7n6sUPt3l1BrxZ4eYqjqnb3UmFhgxEpzYPIhJ
	RzubMVbInRhlzgUU9CqBeYBfEb5iRa5UTOhL0fJRgZk8g5Rl4DQ0Dxlt
X-Gm-Gg: AZFdTZeA6wm2y3nnRnczyUxBFRivAN/o0pufkowg8gPm15rZIsOX2gw3VtR4CsdzXfa
	uZv0gCV2CG1ZwG2kOitYVG83MNsZwMUjNhxr0sX3AmabM0BLX/zBncVCXQIvfBVuxbAQxIJRsca
	5zigoTWeKc/qeyIMVbH/Yc+yBdHWNYzo7TYIcT2h21QJipvDBmcZfdliddA7SSTtRD4Dxzlwbf+
	P8Uad/PEvMVXgXUdrsjSpoksA10qlaE2md5J23JubC33Pc4Pw7p/RbcSvqQjh4J7qDS7uKsgnEi
	JUW2Fxe8mF4I3+ygoDQgDB5vXwEvGp/0J6ktOM0WMzgUQJ2EKV/XuoQH+lTQbZZPmt3657bzf/W
	Rex6QQgOTqlxsieGsBLRbZvNeDIfxzHzrQjuLI8O7mGIgQUB37LW0PRsWA9jEjqnsVtLNhLXsIY
	6uynt1f1brgfAO3LOUfuNHkjK5ONmlLclQI7u82dDctgdQ1FX0K5JYHRVQIX4scAGCk70SbjyHZ
	sJCM6vIWjPBmnR9JCIT6FBm3HH9wt1+3xoYhQSAfy/U+zMtTVMDC1sYOpljw/a0o7Mj9zFi8WPF
	LdSsfKuOy8ZWx2SG79nPZbnLUi7Lc43yVw==
X-Received: by 2002:a05:7022:f106:b0:1b3:afa2:2d7e with SMTP id a92af1059eb24-1b5567dab3cmr10210370c88.1.1795455746895;
        Mon, 23 Nov 2026 09:42:26 -0800 (PST)
Received: from ubuntu24.lan ([2a10:8744:ed6d:42a7:c0c5:ca32:d121:31bc])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm16613911c88.4.2026.11.23.09.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:42:26 -0800 (PST)
From: Yiyang Chen <cyyzero16@gmail.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Xin Zhao <jackzxcui1989@163.com>,
	linux-rt-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yiyang Chen <cyyzero16@gmail.com>
Subject: [PATCH v2] softirq: Limit the BH count warning to RT BH lock users
Date: Tue, 24 Nov 2026 01:42:11 +0800
Message-ID: <4103eb7e6caea1afad16e5523ded3f2a30c40ee8.1795455101.git.cyyzero16@gmail.com>
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

With CONFIG_PREEMPT_RT_NEEDS_BH_LOCK=n, task A calls local_bh_disable()
from preemptible context. Task B preempts A on the same CPU, disables
preemption, and then calls local_bh_disable(). B therefore reaches the
warning while the per-CPU count still includes A's BH-disabled section.

  Task A          Task B
  ------          ------
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

Fixes: 3253cb49cbad ("softirq: Allow to drop the softirq-BKL lock on PREEMPT_RT")
Link: https://lore.kernel.org/lkml/20260310115534.3477871-1-jackzxcui1989@163.com
Signed-off-by: Yiyang Chen <cyyzero16@gmail.com>
---
Changes in v2:
- Clarify the description of the timing diagram.
- Add the Fixes tag.

v1: https://lore.kernel.org/r/d9554bee441d2c763ef8d61e966a7a471915bbee.1795372382.git.cyyzero16@gmail.com

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

