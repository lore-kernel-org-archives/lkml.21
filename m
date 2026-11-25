Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795593982;
	b=VMG8KxBwfQJId5LMthCsnU52IcPeVLB+ldB0N6fljyW8fz6dnKoOoBxvzNOvmsw6kvQY
	 L22tQR5+jGyor4+NpG/4rUUQccncl9KBPggqsR6UdwCMsry2eqzqzi5wvQR5mCdPyXO3E
	 0fhk5o/guHbpqT/jfXznErvsBs0zkIw7e7YVfIxnmq2S/C/5fOmMM0Tq/upCDBeW3OR1Q
	 InHg0gYGk6BQUjcz8Cf9s4WjEeyINYGxOT8RryyJYgKRQPpx5Te3tMmd74g7AdXvi64WV
	 kn1uvfk83hhwm+9a/CUzKImfuc6SaHqtV5T9C1e/PQRG41IcMCXMTZKCudb/I6V+3cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593982;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sKV2vPrXRT3DyV7gNQ89Lv3MmHhwVuLo1d3P1yGnLgU=;
	b=XSD6dzyM4DCIv8NOi2LxD2XsTeJrU+FStO2/UgycXEL72ToKf1piNAFvOgdFx9OnIdVr
	 mkUIMj48ofpLgkEQWq/CKigVI/GPLUstY0ZPcbnO+jmVpXEzFhtgvvytLEbmO0ECc68kc
	 fWoxms0cCGj7jcBLAWSj3SlmH40TvgWdzJ5iy1Q0S1Q2k1jGcIs9kzIPcrwm2oXYg9U5R
	 t4QPeZfVnIlN5hAJIjGn6Kj88pQOJ3bJFcHbtkVPCrqxEyRv99cupUqRRxCSiGboq17QA
	 TbNjZfSvigonADe2yWFg3zev4x2ye2Sa7Gb88kvh25Six7qYbe+wNUZyz0oCzryxEQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dOgmEFAK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M05iZ1P+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCAE606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:06:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DCAE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dOgmEFAK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M05iZ1P+
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68bIm3630236
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:06:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=sKV2vPrXRT3DyV7gNQ89Lv3MmHhwVuLo1d3
	P1yGnLgU=; b=dOgmEFAKM1/IgLulpGR1NimjAHrnA2tEsxS4CwsLaQ81ccjWW1E
	qD1+mriH+I4U7dJXU5rXYtFGnzkQcQM8xJyl/OKnHsXNJ2oBpJz79gCdqwRbz62W
	eFb1vsXzJZXuN6Udxn2stARmD6huOEj7rDIKV3jM9bjCnASHVPT33FEoE0L/ZOJp
	KA7iRQQt2WXbgEm+Kpn5CQEgZMQvEuklSUwUfhudCKaiNDLeHSFGL7UwTWnaCz01
	+6IkAvPmCpRIfpPuv1qlDD79qir1B273eBrvG3Q9X4xzDclasq3teZvl3rP9plbr
	CaGH1p5phj0HsTIwQLyT1KoWNpv/51btbSw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5b8048s0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:06:21 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a05b68f851so4846524b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795593980; x=1796198780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sKV2vPrXRT3DyV7gNQ89Lv3MmHhwVuLo1d3P1yGnLgU=;
        b=M05iZ1P+bHXGaKfP4T+YY8stZWk25N80uiN479lXi31x2/cmBkQFWsvBnqqF8Nu5Rs
         pHIMsXO7D5sL3P+xtOqt8649eikT/U+hEaC/SYDmBQ5W5ayHX75K7oM5LZcJy92+n9r/
         m0jl40LWjzoSDKdF5ysGAj7hwp3dMoNcFq0pzXH2NIps6QZF79+wW1xk03KPxMRSuSSw
         Z8RB0dive6Bvdqv3Y16yvT0EFv6sKLOn0DrySjkKAAvESFYnIBkeQRZu5Jxn2jqzLw7K
         521l2z++XeLIGdXnw/fEreuVKZFh9b/dkl8tXJjCHjAx89icwypMiyXZWviUkW16ucWV
         TaTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795593980; x=1796198780;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sKV2vPrXRT3DyV7gNQ89Lv3MmHhwVuLo1d3P1yGnLgU=;
        b=vvSJLlaILxBt8bO4dYq2vori5t6HNj1bx4d3PpOLCXLxAuH17QcwMN0pWjoIIfSEHg
         Z0v4TMS753+fmFrDRiCrCkENukyGi0qGpBssmjV/BWO1Qk3cwpDYtDfZvbiYP4XaTd9N
         W7bXofa1Nc/qq5CmrExPLv7wsVv9r+Sef9Q8TPtKclxiey3inh6lgOMRPXiraD5rvT6d
         smkdYi+FZHia/CHe2v5FYmBCHdZAXQ+CaoRp0zmjNVnYHnqkGxl0FrEWMIhGk2rsPR7N
         vu50IUAKEhpBHVS9vsFeYa52bsP+zRm9s1nZpoKMGswdbzOuUziTQ6n6qNdDfDgFyrLz
         Cb+w==
X-Forwarded-Encrypted: i=1; AL+hErETSEJ1fUITc8rgX4kloD7VrXzcmTVsevr2pT31AcMFsyzRm98joIxnQbDjJh37appBJ8fxSykRtTWAM+o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kuqjMZ5365S0YrTyLYTDIWvTefKy4jn4IeyP/GV8PqQ9D71Zk
	dLTsqKjAxILDM9uSFYOjtVSHnIhE3W7WlwEPzRGfoN11tWW5qAAD79VKYcJzAJgbFuV6/FVUvNQ
	iI1+KfbsxgzxJEi7zgKkXxO/oPmrlhena8XBUVkXKf5ccJ8Q/WjgVcPTD74SC3L7pZVA=
X-Gm-Gg: AZFdTZeR6lot5nP4J5w5z9ZEfCOnxFDTc3nlejXNgaK4mXYxNYhcNqcyNwgCjYBoP+y
	VFmZK68qFSh9dR9QgbazIzyn1qz2fB+JcKKiAzJCFPZFeMCIqM4snh4qR3iYTrxTTyVWtYQ5wPX
	d6QG3ykLOU6Os6vg9NquNKmvF6WgLLANPO222i8pbFLbqBRzxo5Pc1HiglsOixCveVwP+OXqmKf
	Dsyw0Wyfl5xcA0CyLBzCJ3QwXTI6RumECVyFZJMZ3ljlWDoou4nstN5gffST2U0uHOFhpalisWE
	mp7Opb2VCVHo6X+GhA+RkIb9m00wjkT0Z0/CcsWSGPrw7kGj+DRst7g6RQ8TvvkTbcPAJ27SWHx
	Qw43e+Xy2wJtZe/Q34QJBF9WWVGfXbvduBIbEJSMV+NujQ/slMA9qfKM6owcrQwKad+wd+sF887
	GweZIZtUB9omXqxy+qIyNqnT5FfPh8wOnQKutlmig=
X-Received: by 2002:a05:6a00:21d6:b0:89f:2b65:2a1 with SMTP id d2e1a72fcca58-8c87bcb7b35mr10647275b3a.8.1795593980090;
        Wed, 25 Nov 2026 00:06:20 -0800 (PST)
X-Received: by 2002:a05:6a00:21d6:b0:89f:2b65:2a1 with SMTP id d2e1a72fcca58-8c87bcb7b35mr10647255b3a.8.1795593979558;
        Wed, 25 Nov 2026 00:06:19 -0800 (PST)
Received: from zhonhan-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873b25bfasm8558604b3a.46.2026.11.25.00.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:06:19 -0800 (PST)
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
To: rafael@kernel.org, viresh.kumar@linaro.org, mingo@redhat.com,
        peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        vschneid@redhat.com, kprateek.nayak@amd.com, bigeasy@linutronix.de,
        clrkwllms@kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rt-devel@lists.linux.dev, zhongqiu.han@oss.qualcomm.com
Subject: [PATCH] cpufreq: schedutil: Run irq_work in hardirq context on PREEMPT_RT
Date: Wed, 25 Nov 2026 16:06:13 +0800
Message-ID: <20261125080613.1138573-1-zhongqiu.han@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzMiBTYWx0ZWRfXzQcWiekHtpXa
 Js9XrPxot2XIncz1AwQFqzMbnfYoJ2QO/s8Kfr8Xi40XBcPrNUhBj6//UdEaL6Ip02081p0/yPm
 h6uefMsZcI6KYe2E6yC0Zj9eYbWZMyYVEbUdffjj7HkiIx+PfTJS6+66OlsQAiSLd0FW9hiGYRF
 MiwHlZbXi3SXeYK50HckSpNsu2680BXI3IXPBAnF8NdwwA8RUIqLyl9ruecZ5Fdi2kFM1/WgqZ8
 xcVxsf2iPJmzmNYm5bY5fB5NOYzJjTJQhkWlXnGHmrywJxRS6dqsKeEKYitndNfvO3uzosutSR8
 WY4uDi1uByNwk7rtSSoi6/0sJPPY4ITjBGcG/kNsSbKyswMTDckxZTElhyMblQDlILcPa8OTQbT
 0FTYrgelwY508n+fLQM33EK+h1GCNHv4eHufWGlSucsECzl9ztW1W88ZBREjy59ndUuK6wEu7B+
 swsadGUUl7ZILJeSz4w==
X-Authority-Analysis: v=2.4 cv=K5W3jCWI c=1 sm=1 tr=0 ts=6b0696fd cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=m2RqmQonHRMwM0EXqw8A:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: t8FRfOSjQzsH3L_ThP8paTJRMvF2G6q-
X-Proofpoint-GUID: t8FRfOSjQzsH3L_ThP8paTJRMvF2G6q-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzMiBTYWx0ZWRfX2FTzPvEsjeL4
 iu6v8476XbtetzHAfAzYvJVRNVyvsFVtXOvo+E5NY+fQ4EUKca8KjaKXJ7LgdWsqEi5dvcgMj+p
 Ao5/lxA1FEm+qLayMxAOxNQ1h7D1Ug0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250032

On PREEMPT_RT, an irq_work not marked IRQ_WORK_HARD_IRQ runs in the
per-CPU irq_work/N thread at SCHED_FIFO priority 1. The schedutil slow
path queues its irq_work on the local CPU, so the wakeup of the
SCHED_DEADLINE sugov thread is delayed until no other RT or DL task is
runnable on that CPU.

Meanwhile work_in_progress stays set, so no new frequency update is
queued for any CPU of the policy: one busy RT task can freeze the
frequency of its whole policy.

sugov_irq_work() only calls kthread_queue_work(), which only takes raw
spinlocks and is safe in hard interrupt context on PREEMPT_RT, so mark
the irq_work IRQ_WORK_HARD_IRQ, as commit f8d958880933 ("srcu: Use
IRQ_WORK_INIT_HARD for srcu's irq_work") did for srcu.

Tested on a Qualcomm SM8850 board running PREEMPT_RT, with SCMI cpufreq
forced into the slow path. With a SCHED_FIFO 10 stress-ng worker on CPU1
(30% load, 50 ms slices, 15 runs of 5 s each), sugov_irq_work() now runs
within 15 us of irq_work_queue() instead of waiting for the RT burst to
end (up to 212 ms), and the policy frequency is no longer frozen. The
irq_work latency below is measured from irq_work_queue() to the entry of
sugov_irq_work(). The cost is that the kthread wakeup now runs in the
irq_work IPI handler, as it does on !PREEMPT_RT. In a separate cpufreq
stress test with cyclictest (SCHED_FIFO 90) on all CPUs, this raises the
average IRQ work IPI time from ~0.5 us to ~1.3 us, with no change in the
number of IPIs, and the cyclictest per-CPU worst case by ~2 us.

  PREEMPT_RT                           before              after
  ---------------------------------    -------------       ----------
  irq_work latency on CPU1, max        130 - 212 ms        <= 14.5 us
  policy0 frozen, total per 5 s run    0.57 - 1.25 s       none
  cyclictest max, CPU1-5               13 - 16 us          14 - 18 us

On !PREEMPT_RT, cyclictest and IRQ work IPI duration are unchanged. No
lockdep or DEBUG_ATOMIC_SLEEP splat on either PREEMPT_RT or !PREEMPT_RT.

Signed-off-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
---
 kernel/sched/cpufreq_schedutil.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/cpufreq_schedutil.c b/kernel/sched/cpufreq_schedutil.c
index 14405a614991..b2e9ac7e3517 100644
--- a/kernel/sched/cpufreq_schedutil.c
+++ b/kernel/sched/cpufreq_schedutil.c
@@ -726,7 +726,7 @@ static int sugov_kthread_create(struct sugov_policy *sg_policy)
 	else
 		kthread_bind_mask(thread, policy->related_cpus);
 
-	init_irq_work(&sg_policy->irq_work, sugov_irq_work);
+	sg_policy->irq_work = IRQ_WORK_INIT_HARD(sugov_irq_work);
 	mutex_init(&sg_policy->work_lock);
 
 	wake_up_process(thread);
-- 
2.43.0

