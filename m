Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795602900;
	b=Hvc86ptrlUlTrxhkvES1Sm04m9mchy5RR1+3cuO8Lk2BNtGqQywqUzxNtkEyqEkKH/Z7
	 brX8AAlwxrjxtv/y8de2rh3SYp8ZMEqnjJ+GCGRdyvg+w5M9tY/yq7Glof29laQqV0vzV
	 C7yursKRdOIE8641Tr20IH1nNw95CzwFGkioprvuBewRQJF7ZAsV0oeKv4Nb/LP7pZp3S
	 2EZJzuYCU3eLDQZRHYE2en126ZFa9ZuyobCjV3VchWAXh5ghQU3zSXexV0aELV16HKgBZ
	 5waAc8eMtuuMcahHLCsmCmjBzOwJXPF4xi6+rOIZ5VjgLBnQux50l2bzsnX8AbMVfRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795602900;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xlOmfRoB6zB9jpYaxnGjQXgLmnAlfwFUUKRDLf85eBc=;
	b=rFymefWrTCLCmyK1kbzqoPP1YPHCEvPszPCzX597Ez7vAdbSpGFwWb82FZaLVi3z4wAO
	 kxIjeJio5NkI3F3V4QERsSYe8uMOYSxd284CxGx3bOI1RgGZky9Pvkf4ZWtMC+EfZbhJ/
	 +ZdL5a7QawGmMR8IQrYnrHT/6xO02RZYuvsTixgszQ3SWYYjJtHTFDRw9n8a8MUcUnTSm
	 VzLuT4n8m5m6C0mXjIKhMHkbPSI2xlurWMaCe5KcTXDQw6RNDkdNLLQolIO7o4D+DDAk1
	 JheLxj3f5gCCho6XA8E1OCDpYk6LAEgzab8G270i8RonEkt3o/l2PEQ2F6uvObJFpLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WEJxPzW4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XwSuv1a4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31E4606A333
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:34:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F31E4606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WEJxPzW4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XwSuv1a4
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mTti4034191
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:34:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=xlOmfRoB6zB9jpYaxnGjQXgLmnAlfwFUUKR
	DLf85eBc=; b=WEJxPzW4QNtLm2FXJyMaQDhU8QRKMgn9q2nwODpdPKmp4xadd/Y
	IeG/KEximjTHnDIYrqcEFj9FVsy2uXcmrthC+DT1DZNnZKNjgSKdHmSJQhQlIn0h
	ABXOE20uMP7WO+C3fFsAx/p5m2nfmFCPp/GybprE0jhwgd4JHIS6EnS3TuOF2wxG
	fiB3ck6sB4vY4rOstVG4YDvGZzN6ah1uZInLBkjbHOVept0AtywwlprMG3w/QwF2
	K5gGGl7nb/LexzDvrKE8ewAvV5CQEF/9CU7ET8RQ1Wsa0+cQSMLFEYpQILxi4FhX
	9w1qMHEPnMXTKbzqCKuUpOCzTYvusOA+xFQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mqbjahp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:34:58 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b456fee3b2so3585433a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795602898; x=1796207698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xlOmfRoB6zB9jpYaxnGjQXgLmnAlfwFUUKRDLf85eBc=;
        b=XwSuv1a4qxWKI5iYYS4KUUxHsPlDF6kjVP1fdV81t49aF5Ao4UeL7JUHKDhwbhtS+m
         dMwAQfjOvqklhbt57LucjmRLG3kWlI2/6+ylcjimNKNqohl3356t4qmp42UkXprzCJuS
         esUwL5OrFFYoeFEUoJlDXb1+cL2lLhRJ937H1tLrOYyXLiM/F+/7usq46zvW47tgzU6y
         GKAFvag16BwBptt1GGOGxHqw8xtrnwX1avas14c0hwUYVFe1DDWkx8nv42iFwpbGztSG
         81SQGZq0+3JUrzUw3ivKCOTuI/yL+EEb33+v86grbCrn8zBzlx6UzdyMqlnDY0wF142W
         8Jpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795602898; x=1796207698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xlOmfRoB6zB9jpYaxnGjQXgLmnAlfwFUUKRDLf85eBc=;
        b=jyoCsg7eAxxhw1nu6RHBbMfaG8Yv5+28DM10llNvXgklo693EK4WuSlmJjKs8p3PYP
         8USuMTpI5x0Zj/AYDOmLIHYSEO6xFHrjz/nXttHtDGlCcq/PnEwUC+K1ti4JZzVL6kAI
         ByJX/wMSwCgCwkY09vkPn/tvGj1jhyJqWhpp3AEs8Os+QYdVv5x0U9abnDuf8JieGHyT
         J4CTpAUgpGtDr9+GRrh2qaBs7D7ChfGDTrSZwWTw/ThUntlgU5WuCJaELQz78IxuBIWx
         YzYakTg7bFYk52IvRdkl//wV2x9AtEVzWDGy38OP2N8tFXyjo2dWAr9MIHGMvMoe+zjn
         HDWw==
X-Forwarded-Encrypted: i=1; AL+hErHqqHyLG/HOlulGCoW7ObinIRM2mp5AVsp1y6N73eOoBFRcXsceP2KGSixM0XMoOMhIhbXzIsckF3P/H0s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ugdSXcbnHGDc4MKAECE37+29ZAoKF6P5qiJs04KfD0jo8G92X
	HFQVUHUxJgY0JXxItxJfrSzsrBKC8k5cLrfJz48/yY0YQhr75Lj3pFfwyxvSNUMllhyTGZ027/W
	t7CNDicuZGB/iIkYbkGEiKz9Z1DrxNoBBjqj2eR3i70JMqWe5EWPOXWv/VCAzob+hMJPqW9MdSF
	UILw==
X-Gm-Gg: AZFdTZeLm1P+TsyNcb4d2XBZxFT2xacouO/Ph33dc6U8ZN9M+zTqeCm71ASN1nw/dGg
	JFIMAubdIQjg2pcFV2I4pjr4fqEUvouGkpBlyIT5wMg6wpT1ulrfNIssQCOv0rBEofNe4OdlhzJ
	UmPulxGIIRAWezYgCffQrn7QyOH4KVXwQNAtmGadlbDHhrUHLjJlgR1EAwG6YKsA54BWqBelJ5W
	8fK0KInNobrIPFfY0PpYZePciGnBl/X3jOKU8Ep9h94hRoXu+68IOLZIvNQ5YuONBokT1P9PntP
	sRMOqOUc9CeVINjlYc7MQZbmJf89yqmHL7NalJ99MUfL9spM7oZNG6gzeoAvDsSWQzFMsvdKYy+
	XS+HcAZ83A8uNYfpMAk7orHxaAdMBD1b8h+bjR2UzQRJllyOFz781l8PH9mLpIwreebFqJLrsDe
	hIXdOWdHEsaURDEY7j5T2GGPbBVdoUjhX77yNQPi4=
X-Received: by 2002:a17:90b:2792:b0:3ac:4e18:238c with SMTP id 98e67ed59e1d1-3b41cb0c476mr14212913a91.49.1795602898242;
        Wed, 25 Nov 2026 02:34:58 -0800 (PST)
X-Received: by 2002:a17:90b:2792:b0:3ac:4e18:238c with SMTP id 98e67ed59e1d1-3b41cb0c476mr14212897a91.49.1795602897652;
        Wed, 25 Nov 2026 02:34:57 -0800 (PST)
Received: from zhonhan-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40f4312dfsm28776942a91.3.2026.11.25.02.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:34:57 -0800 (PST)
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
To: rafael@kernel.org, viresh.kumar@linaro.org, mingo@redhat.com,
        peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        vschneid@redhat.com, kprateek.nayak@amd.com, bigeasy@linutronix.de,
        clrkwllms@kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rt-devel@lists.linux.dev, zhongqiu.han@oss.qualcomm.com,
        Christian Loehle <christian.loehle@arm.com>
Subject: [PATCH v2] cpufreq: schedutil: Run irq_work in hardirq context on PREEMPT_RT
Date: Wed, 25 Nov 2026 18:34:51 +0800
Message-ID: <20261125103451.1385246-1-zhongqiu.han@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MSBTYWx0ZWRfX1iiJvTpIJhqY
 6+eU5RMub2ezaJjkNHW5eXvghcZQQuV2BvqK0pygI668qwXk8fhbSEz3CUjdgNmRpiQTbWkM7vZ
 BawUjULFJB5S+F4SDY9Jz+lscONkPXg=
X-Authority-Analysis: v=2.4 cv=Bb9NQbt2 c=1 sm=1 tr=0 ts=6b06b9d3 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=7CQSdrXTAAAA:8
 a=EUspDBNiAAAA:8 a=m2RqmQonHRMwM0EXqw8A:9 a=rl5im9kqc5Lf4LNbBjHf:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MSBTYWx0ZWRfX66qYOZwE3rLC
 isIZurjQ+uWreYB0G9gcJm38sa778ApMSlotDKLvX8B8IgtIwjb+xQtq5/jdlzd7aiZzFV6TS+v
 A1dQlsQCk6jaYAcw4/hMOYofwV5Yj+an2287EOPAv0CaEbP541vpCWh2vUGrsICQDheqQWSrA2R
 2y1yVf4V7ifCM7fsSt7fVdWaIqU6ozj/hvqtvfzie9p5UnDuJmcEpzaLlbH0Pr6iWksQXBlX3bH
 lRYi2aMWHGjT8H7+VpSUQOB3E9Px63Zwqc65Xetzcl/D1kJNwGE8RSuJmHX3OlgjU6W1l39gTes
 Xa7Smiojk8Xx8RYuLtPEi7aUqUOAlqeT/IQb3pln/WVCiDU3A4a6t6zSjAg+IDS5jG137rMsJas
 WZWOBtskfb6OMdoBuXLgWHiFAiBbnY8X+DdAel7JGBdGTTYpwTBgiHLhgQ9fvbJ7mX6Qw2er3A4
 N5p6zrdi/Ybk/fm42Lg==
X-Proofpoint-ORIG-GUID: Mu19EN87YaucDqQAMDKr1uW0ACLEwRQ7
X-Proofpoint-GUID: Mu19EN87YaucDqQAMDKr1uW0ACLEwRQ7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250041

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

Fixes: b4c6f86ec2f6 ("irq_work: Handle some irq_work in a per-CPU thread on PREEMPT_RT")
Reviewed-by: Christian Loehle <christian.loehle@arm.com>
Signed-off-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
---
v1 -> v2:
- Add Fixes tag (Christian).
- Collect Reviewed-by from Christian.

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

