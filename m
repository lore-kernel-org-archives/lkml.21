Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794998057;
	b=uPl473ewThlb6uyW0xoLL8wX1K36FKScUb7QCaIsc5j+SkWaDsHoQ6i2emF52Wi0zXgE
	 zKb8MWRoX1ih4QAV9bE4XX3bGEDorKE5tl+J+koRJFeF5Vcz6AeslZDEUemvcl85XcBDB
	 b5TLxC/Kn8fMNBIe+9BUf2FsCvaJL9AK8WH6SpX4Voxsh+Fu/De50/2OdXvy8HoJ6VOZE
	 mZUNFsaVt0jA5Iy/EgFzNtVkh1cZGFsj1GpRZFEo1UcblF5AO3+EJJlszPAydPYV9MBqC
	 vqTje70NCr+24MJ+k9m6zlqoj49UYFv9l1YNffGBjUH/3C2qvAssS6Lxh0sa/+IhaTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998057;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=aGe5/35woBldXiPfqQ49uVeqf5gd1K2N9K/JlpgH0bM=;
	b=hDSzivNIQ7XjQLB4pcVZDsXL6zIkW7Tnqb/+vv752rzm5QHFWt341GsVNqRT+TsrO8ni
	 3aQxPcUgPmkubmb1iIaPQwgSvrW2jlJx0BRQ+JFhXcCmIrgNnFY1zoSp1un3WHz9fnNzc
	 Of1DweS+0iGA5pUa3RlGrdWQUgAQbrtoDuG3YWXsm7vJd8SqO+v6JcMIVhQOL97i9vx+q
	 D6W1Nq3AxgU3L/bc9BZIEw0erKe2KljLvtTk4sDsH0lCIcKZqRhLeaSW/AUhX0SvdH0BB
	 685544WOF3X8dPAEUN8uPPa99D9gAWGGHcVFltgXAvVxFF6fdcy7SlzNYnxvPaAJQNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d2PcsH4x;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KPrV+OL6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2183606A330
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:34:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2183606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d2PcsH4x;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KPrV+OL6
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI9kKGK3071642
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:34:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aGe5/35woBl
	dXiPfqQ49uVeqf5gd1K2N9K/JlpgH0bM=; b=d2PcsH4x0fz27gATpvfFFjXUxTP
	Iqx+SHqvWPtcqOe4Nxybmu0h89MAVxrgdfDrOs1maertntw//gd1ZBJMh4Ji0HR0
	xUDL6FfeQ+rBgBcpwwSD5em/fHxN5aTuuPH6I+v9FtJULznJpih9vTAmvhWa6q/X
	S1M3E22AYYZs+GAVKWGxSo6TOCIz8+YX3i72Q61Jlrlyk1GChiS+J2cS2HealNJ3
	Theko5Uolj2m7PSzSXLhJEbG2yLe5Ll3CZTt7MG7zMNggyXz3Y9s/yiNtd3sBvbB
	NaGx5AfukLxxkGH+RoCrvQNA5Bxuta00iVhUSBHXWaPo0OrmQB3Z5gzPJJg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8thg6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:34:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94960131b4eso161332085a.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794998055; x=1795602855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aGe5/35woBldXiPfqQ49uVeqf5gd1K2N9K/JlpgH0bM=;
        b=KPrV+OL6mY9KdMLC0dNBwbCZNL9cCSbHbMqsgkZYteU4aBGoXFFLo6JMwgUODDwTPf
         XfnZ5M/8RVaCKlIWErNCsZHDcP81klEH26Hrkh+qbhyxSVeYlx1HYe7Xlzown1jmgdUx
         pkYGsV3E1Wq43GjqoVH5mwg1QMON041Vwcjh42Gt/H2XezPNVCQLIk685z57E/OxoemQ
         Mn8zotF4yzPP2PhyvT47H2gAa0srI7u3Tjs33SQBbDUQYwYYN2DZGJb7cIihk8OwuQ+i
         SdJwfUVDO7YnKMNJPbdQwqqTRT4qoxL2IczZgYmvHjAlJqWX0aumimLu/Br5zs5tDpKR
         7lTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794998055; x=1795602855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aGe5/35woBldXiPfqQ49uVeqf5gd1K2N9K/JlpgH0bM=;
        b=ot8pQJqVuqmI/x3vdT5iGh+809LuACvTEQxO2JWDgOt9e6pHabCp61tvlCJyLg3n/G
         ue+dAPO9XKPDanNXN4zQc796oSUOUubl+TsuvO4R4asn3bgCmqq/sS5hCAhXHL59Jzlk
         P98OJby82R2V5bTcNoMgdp+V/OwYQKRsT9C2qfMz4d/XrzhYZ7VszUGugHb+p1XwJBBI
         PfMTIy4fbqikXyiS8Segw6WYFxOBcKdbQmC/LJzmxhDfu35vKZYfQMMO3qfkgNoBEAXY
         CasyADziSzEmyMo+aCoT0I7DodCc5qQ6avdFF6ANJZzRAHXrwpum6bxNlrVSHVyNQvr0
         M4PA==
X-Forwarded-Encrypted: i=1; AL+hErHuhwpYK6Dc/tHAd0dvdahkQMQAje2kbwzTFserLlImMHAW50KRJZ5K6LIKxCZ5E7esODA2n+kwajIyG0w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+069/uxlrjnWjW2ffewc1tkiDnSt8DLvCacir10b7PwPZizO2t
	x0P4mf3kKFiWmyayvN/mf7xFNA6Fx+T0VOjI0Z47eXP+KILyFhpW6eyNb5M9uLoqG4nJxaSp/US
	og4IIv4d2csNFELOovrvruX0NzLOZ4wXQUKxEAiCDvAzDOKKbiE5K5xnU5APDLaphX2s=
X-Gm-Gg: AYBFou0JbpoqJB01zvbd86RVpgGy0EcUeLJ7wSMLl6hhFPi1ProM7s2L5C3363AWkzy
	geZ4Byzq1PnMJebyDFbgTvN9gpYSIaGiIY4UFnFnIKTppfGal6MulSZU8h/bmtB4TrjJr9JZGZ4
	107Rg7ijPIu7imawmaixa3qudvu+/6cD/OOh+wweM47pY7daYol6Albw52/936srU9rlMhc4YDq
	zt590ZgfDa2N4zpWD33fPBWMke2dJIaSENqKHUyLDvaCpYhviX7eOdgi7boi/J8vXM2BTlqnJ0K
	MabeXPtcotZQjHnTQ4hP3jVTT7ejdEItYiFj/Zcjl+g4thLGDLe9/Gti8GZEyiR/HUUPoSPYC/I
	4ToRHrhe2+YLhtsxgRnMO6Do9TY7SGwF8zSrpoG3RU4g7I/L2dQEL5tlh73yKq1Fpr9pkh6zsKI
	Fk
X-Received: by 2002:a05:620a:3710:b0:947:8344:17a7 with SMTP id af79cd13be357-949995f8716mr384303785a.11.1794998054895;
        Wed, 18 Nov 2026 02:34:14 -0800 (PST)
X-Received: by 2002:a05:620a:3710:b0:947:8344:17a7 with SMTP id af79cd13be357-949995f8716mr384298685a.11.1794998054258;
        Wed, 18 Nov 2026 02:34:14 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:d355:fe70:14a0:ac8d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a650d2ecd0sm4519631f8f.8.2026.11.18.02.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:34:13 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org, tglx@linutronix.de
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Peter Ziljstra <peterz@infradead.org>,
        Bradley Morgan <brads@mainlining.org>,
        Heiko Stuebner <heiko@sntech.de>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support),
        linux-rockchip@lists.infradead.org (open list:ARM/Rockchip SoC support),
        linux-pm@vger.kernel.org (open list:POWER MANAGEMENT CORE),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/2] powercap: idle_inject: Create per-CPU threads on registration
Date: Wed, 18 Nov 2026 11:33:49 +0100
Message-ID: <0fd0b28b29f6d9ad38bc91f3582bfee511fbf4f8.1794992905.git.daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794992905.git.daniel.lezcano@oss.qualcomm.com>
References: <cover.1794992905.git.daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: Ee-tMDaL313YEYJTPWQHhY1fXIoTBzBB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA0MSBTYWx0ZWRfXyxRA/erUKxoF
 n8dDkZ+xXF9ODnU7HSAQZVg50O3h0nLpL5mDzC0nojC85j9Tc7W1UHIT361AEa+3h6RVVc2dSp8
 11LqkC+ZBAKXEbYIu5I3X+tl95ixf9c=
X-Proofpoint-GUID: Ee-tMDaL313YEYJTPWQHhY1fXIoTBzBB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA0MSBTYWx0ZWRfX1H1W1OWdkRBp
 Q4Iv0WG/XMCjeV+89USE49hgBTqQofpRaJAa8PqpE5GMn/PGXMF9hQC3GDA9j6KOM0EdMlrxO5b
 n4/kluG9aoO19rJvz8gMrwBHLVQyBUl6ML//DqTGsDxXj1f+bUbzaJXR2JxTQU1mDOhkTda3UBu
 +NRE3BXdqnI8qei8jRjGkmlwkg0p0QPHu3i0fzWeaw9jmeDqg3qROX6XUolMr0KEYlNbMEZFmAY
 tMSNyxFr5CfUEaCUIin+aPcehpIIkkPet+DnwdiYCQZUKXhaxe1P5Z1D/n1aT+ZdFYr0BclgfzC
 PCWVsWawAY/BmMP3pQBhmcDW+RrB/CRmo2tmcIF31MsxtIvllUDYfN4itKuq1Hyw2vtUclb0SgT
 leTbMSySBtnpuN61cUkxP3lyH7mnGekHGY1ioc4ucMgkMo/9zTgcVlEJUGPMciawo4ui6jMyenC
 f1Z8QSdRraFCs0mgeJA==
X-Authority-Analysis: v=2.4 cv=NNVAaE6g c=1 sm=1 tr=0 ts=6afd7f27 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=Z4Rwk6OoAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=OuZLqq7tAAAA:8 a=z2xlO20o2AOZ5rEB0BcA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=HkZW87K1Qel5hWWM3VKY:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180041

Create idle injection threads when a device registers instead of
creating them unconditionally during early initialization. Destroy the
threads when the device unregisters.

Use a per-device smpboot descriptor with the device's CPU mask so thread
creation and CPU hotplug handling are limited to the CPUs registered by
that device. Allow stopping devices whose offline CPUs have not yet had
a thread created, and update the registration documentation to describe
the thread lifecycle and possible failures.

Serialize CPU ownership checks and claims with a framework-wide mutex.
Without serialization, registrations with overlapping masks can both
observe an unclaimed CPU and overwrite each other's device pointer.
Their smpboot descriptors can then share the same per-CPU task, allowing
one device's teardown to destroy a thread belonging to another device.
Registration rollback can also clear another caller's ownership.

Hold the mutex through smpboot registration and failure rollback, and
during thread unregistration through ownership release. This prevents a
CPU from being claimed again until its previous thread is destroyed.

Stop idle injection before acquiring the mutex, keeping timer callback
cancellation and stop-side hotplug exclusion outside the ownership
critical section. Neither the idle injection threads nor their smpboot
hotplug paths acquire this mutex. The existing caller-side lifecycle
synchronization requirement remains in effect.

Reported-by: Andrew Morton <akpm@linux-foundation.org>
Cc: Rafael J. Wysocki (Intel) <rafael@kernel.org>
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Reviewed-by: Bradley Morgan <brads@mainlining.org>
---
 drivers/powercap/idle_inject.c | 69 +++++++++++++++++++++-------------
 1 file changed, 42 insertions(+), 27 deletions(-)

diff --git a/drivers/powercap/idle_inject.c b/drivers/powercap/idle_inject.c
index a25eb2018acd..24646b8be9ac 100644
--- a/drivers/powercap/idle_inject.c
+++ b/drivers/powercap/idle_inject.c
@@ -10,11 +10,9 @@
  * It relies on the smpboot kthreads feature providing common code for CPU
  * hotplug and thread [un]parking.
  *
- * All of the kthreads used for idle injection are created at init time.
- *
- * Next, the users of the idle injection framework provide a cpumask via
- * its register function. The kthreads will be synchronized with respect to
- * this cpumask.
+ * Users of the idle injection framework provide a cpumask via its register
+ * function. The kthreads are created on demand for CPUs in this mask and
+ * will be synchronized with respect to it.
  *
  * The idle + run duration is specified via separate helpers and that allows
  * idle injection to be started.
@@ -40,6 +38,7 @@
 #include <linux/cpu.h>
 #include <linux/hrtimer.h>
 #include <linux/kthread.h>
+#include <linux/mutex.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/smpboot.h>
@@ -60,6 +59,7 @@ struct idle_inject_thread {
 /**
  * struct idle_inject_device - idle injection data
  * @timer: idle injection period timer
+ * @threads: per-device CPU hotplug thread descriptor
  * @idle_duration_us: duration of CPU idle time to inject
  * @run_duration_us: duration of CPU run time to allow
  * @latency_us: max allowed latency
@@ -82,6 +82,7 @@ struct idle_inject_thread {
  */
 struct idle_inject_device {
 	struct hrtimer timer;
+	struct smp_hotplug_thread threads;
 	unsigned int idle_duration_us;
 	unsigned int run_duration_us;
 	unsigned int latency_us;
@@ -92,6 +93,9 @@ struct idle_inject_device {
 static DEFINE_PER_CPU(struct idle_inject_thread, idle_inject_thread);
 static DEFINE_PER_CPU(struct idle_inject_device *, idle_inject_device);
 
+/* Serialize CPU ownership changes and the associated thread lifecycle. */
+static DEFINE_MUTEX(idle_inject_lock);
+
 /**
  * idle_inject_wakeup - Wake up idle injection threads
  * @ii_dev: target idle injection device
@@ -279,7 +283,8 @@ void idle_inject_stop(struct idle_inject_device *ii_dev)
 		iit = per_cpu_ptr(&idle_inject_thread, cpu);
 		iit->should_run = 0;
 
-		wait_task_inactive(iit->tsk, TASK_ANY);
+		if (iit->tsk)
+			wait_task_inactive(iit->tsk, TASK_ANY);
 	}
 
 	cpu_hotplug_enable();
@@ -319,12 +324,12 @@ static int idle_inject_should_run(unsigned int cpu)
  * idle
  *
  * This function creates an idle injection control device structure for the
- * given set of CPUs and initializes the timer associated with it. This
+ * given set of CPUs, registers their kthreads and initializes the timer. This
  * function also allows to register update()callback.
  * It does not start any injection cycles.
  *
- * Return: NULL if memory allocation fails, idle injection control device
- * pointer on success.
+ * Return: NULL if allocation or thread registration fails, or a CPU is already
+ * registered; idle injection control device pointer on success.
  */
 
 struct idle_inject_device *idle_inject_register_full(struct cpumask *cpumask,
@@ -342,6 +347,8 @@ struct idle_inject_device *idle_inject_register_full(struct cpumask *cpumask,
 	ii_dev->latency_us = UINT_MAX;
 	ii_dev->update = update;
 
+	mutex_lock(&idle_inject_lock);
+
 	for_each_cpu(cpu, to_cpumask(ii_dev->cpumask)) {
 
 		if (per_cpu(idle_inject_device, cpu)) {
@@ -352,6 +359,20 @@ struct idle_inject_device *idle_inject_register_full(struct cpumask *cpumask,
 		per_cpu(idle_inject_device, cpu) = ii_dev;
 	}
 
+	ii_dev->threads = (struct smp_hotplug_thread) {
+		.store = &idle_inject_thread.tsk,
+		.setup = idle_inject_setup,
+		.thread_fn = idle_inject_fn,
+		.thread_comm = "idle_inject/%u",
+		.thread_should_run = idle_inject_should_run,
+		.cpumask = to_cpumask(ii_dev->cpumask),
+	};
+
+	if (smpboot_register_percpu_thread(&ii_dev->threads))
+		goto out_rollback;
+
+	mutex_unlock(&idle_inject_lock);
+
 	return ii_dev;
 
 out_rollback:
@@ -361,6 +382,8 @@ struct idle_inject_device *idle_inject_register_full(struct cpumask *cpumask,
 		per_cpu(idle_inject_device, cpu_rb) = NULL;
 	}
 
+	mutex_unlock(&idle_inject_lock);
+
 	kfree(ii_dev);
 
 	return NULL;
@@ -372,11 +395,11 @@ EXPORT_SYMBOL_NS_GPL(idle_inject_register_full, "IDLE_INJECT");
  * @cpumask: CPUs to be affected by idle injection
  *
  * This function creates an idle injection control device structure for the
- * given set of CPUs and initializes the timer associated with it.  It does not
- * start any injection cycles.
+ * given set of CPUs, registers their kthreads and initializes the timer. It
+ * does not start any injection cycles.
  *
- * Return: NULL if memory allocation fails, idle injection control device
- * pointer on success.
+ * Return: NULL if allocation or thread registration fails, or a CPU is already
+ * registered; idle injection control device pointer on success.
  */
 struct idle_inject_device *idle_inject_register(struct cpumask *cpumask)
 {
@@ -398,23 +421,15 @@ void idle_inject_unregister(struct idle_inject_device *ii_dev)
 
 	idle_inject_stop(ii_dev);
 
+	mutex_lock(&idle_inject_lock);
+
+	smpboot_unregister_percpu_thread(&ii_dev->threads);
+
 	for_each_cpu(cpu, to_cpumask(ii_dev->cpumask))
 		per_cpu(idle_inject_device, cpu) = NULL;
 
+	mutex_unlock(&idle_inject_lock);
+
 	kfree(ii_dev);
 }
 EXPORT_SYMBOL_NS_GPL(idle_inject_unregister, "IDLE_INJECT");
-
-static struct smp_hotplug_thread idle_inject_threads = {
-	.store = &idle_inject_thread.tsk,
-	.setup = idle_inject_setup,
-	.thread_fn = idle_inject_fn,
-	.thread_comm = "idle_inject/%u",
-	.thread_should_run = idle_inject_should_run,
-};
-
-static int __init idle_inject_init(void)
-{
-	return smpboot_register_percpu_thread(&idle_inject_threads);
-}
-early_initcall(idle_inject_init);
-- 
2.43.0

