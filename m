Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794998056;
	b=cN3uruY4SletoDdd6diRzSrxOe9dgAM9ePmK0qIsCucVaqeT0p42oZkwHgELZK/58BdW
	 9AOjNkYFUkQh2dia+B1arM/eBCmNUH88YiIT/3RAiQNsexj77wE/igl66vO46kb+vBres
	 6Y29Be3BxPGYdmLeVlV+0GqcoVWeRm3GXJIZzr5T+ypKNutv1YolE1j//7GMxfCP2xQ2B
	 6HdNZo79I356QHApINBxRcyRkd1FZAAWcrRqak3usTXh62u+UIdrR4cgYRlPYmRQTz3cT
	 QBWdI9Y3FRgt9svHcr6u9MbO66YQ+vclqUGa9cZh1kF7rGi1soozt+7PbJ86wvWvasQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998056;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JM0P9MP8V3Z9pRfWYuZq7GLzbhT+pDJLjfew9vz2LnA=;
	b=PbAyZ8/kN/wF5EOfE5a6fnsnoPzBeegjkUxe6J2n+3pjOidCfhaU1lUC0jLj5w3daBTE
	 vXfS2vtMVGtIJWFsWhYQuoNSE9HQe9ksGCw65DYPk0OnRBqYz2DYIleJ7dQoRN55wDgoV
	 6O1pfeVJERrodaKmwzOcneH6Lye99C8HK2WjuEknvJG4P+AlzlOjfUzWDSc7QA4QN0oLW
	 Es/ZwRVc1EoFHzn9a1jtLhZQOYWB29VTxDE8W/dDSmJuk/xsIE8mBP2ef6BQZqOhAYaKS
	 ake6HMXqDX9umO8kb+5LeINMStsemnwOYzNE/hxJIJKGHcFJEP6Ng+7h4M3MngcIEiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BrRsi15Q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="VI2s/E4u";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B60B606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:34:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B60B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BrRsi15Q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VI2s/E4u
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI9kLhB4082587
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:34:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JM0P9MP8V3Z
	9pRfWYuZq7GLzbhT+pDJLjfew9vz2LnA=; b=BrRsi15Qn6gRPGJ00LtpID9bdaB
	MVKAcwjaZE+xrOeDgjutOTF8imQFK6o3AuN/9R44zMt7BKGIHdm+rV+8kNncLumY
	OI6Wj7AvToP2pjoFnZlvJ/g7UuknaDZWqtwOhiXNpWSYa8U/ePcI62HDeXS6Y0Eh
	N//xJ55tmW2Ic78N3HSO4guCnydth2j2ftHxZYl7wXD/63FJFgWpUtFnGC55/Yug
	jv95vOmZ+qwTk5xP3bLuU+ocUm7giG2VTx7Oi2oTxhObjSApzSRI2Nr31mileXrT
	lz+ETUEiLFAH6xTf7lWZVg6r+KWtBYO028zvE7/IADOv7dTbrDnrU87ItyA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9jhat-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:34:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb7f9bb86so177114585a.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794998054; x=1795602854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JM0P9MP8V3Z9pRfWYuZq7GLzbhT+pDJLjfew9vz2LnA=;
        b=VI2s/E4u8jJ+YNrCQMOIE5JAc3R+gcYDnMCxaw8mY2XYMKUt7o7Z2CeMSZFa3Uu+Gl
         LtyZbvravIgksGqnaK6BJlbjU0LugSg5Auj05pOzDhFvuqDZqieQwyP80sM2gVK68H+g
         xoZdK8iA0RlTdIl71rG7HerekzMbQdgs4qnZq0OEOTCOHR/ue3gX5YHWUiVh60VnTTO8
         Jx7uovkyhp2VqUh+6+cI8wcOhppBDC0Wuw4uWY6uyY57GN1rjEJ14UVd52jEzWH5m/sV
         0PmVbPhJuIvRPlL4YSZIZucsPg2itywJy+kd+sz6qfAcEijbuwyWVtoCHvHK3v9onZG+
         L5Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794998054; x=1795602854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JM0P9MP8V3Z9pRfWYuZq7GLzbhT+pDJLjfew9vz2LnA=;
        b=HJO64Mlrc4v26jo2Jgi6ikuJ9udsc1TWkaNGi0JDeudnQzClyUxtA8xNBBP63FGiMY
         O6xIkKJOrWX5CnP+h+KqluqT6hsdfauR01eNCDT7ZQFJbEH0N/zx1tMqJhVlRnRJ2Igm
         5vzA6bAUxTmQnIT7jmejWQBry5WG17n5iCk3rwvQ0QR4OJAMv8F0ZhGwzDtqbhcqdedS
         MqkiVgYlU6zz00rNlXt/qzS1r10jir1xw9mSbJ8psX/ABCsYHk3sZwdUuhjryHj+8Diy
         dpS02QLciV7hZlejcqJssEHt5N3A37kq9X+PvPqcWZOSoIVUW/keF3P93qmOfeHLOOxM
         oA/Q==
X-Forwarded-Encrypted: i=1; AL+hErGl1aDgxvEqfbiorYfRG1QQgkgGOyNb1ss5sjZ08RYbHtFcXCoIpgP8V6WXaEhGh1DGxu+Qx/o3CI86mQg=@vger.kernel.org
X-Gm-Message-State: APuU4Z//6OzfQp0JckLo1OCsXGvPdUFiDjlNxtUM4wg4nDcdXb/P9wvY
	VsbkvPuoooZq2YDY0WNc3KZjsgVeJ6DykdoOpG+YF4wKCgVPNIYB9TYswONuC6qf5osHds1Bkrt
	HRGO9ulwf8ytVDDSdzExSpQVZdKHQq2suVpMvuuviG1nNVqReeyF5MXWeE5swOXDUhiY=
X-Gm-Gg: AYBFou2lsXbf2n9it8h/uy72T3xnWS0JQ/viqSgOZEbQT3WG3sTdG6//2t3LGbUrhyH
	S0f/Km67GZnqzsMiSY+jkwIqlKjkUEdxNHPNNdMrEUqEGcV8BoRo3S4yUR27nWheUHMiDEcrvN0
	qSdIRR9vFYLuCZOBaWWh/aC3/Es5/Hzlp/PwDGrht84D58loEy35Lr+mG+b1IGa/K5DfGBq9RGm
	AP7S77O0TyZ9jAWdf6EqGno7RYMBHQnDmkPv+jLNDoAHvPZPdxfGjfI5agR5dHtJY/m/IhnvM6K
	lqVSRwB+zQvu9roAhhZZMYe+xMB4Ue3a6KL+cutAfJvAltp/xuJuUputRq1CfKyt52Tg4J39Xxc
	bVRMMg6kGhUyYapqcZ5QcNCWJoEGN22KFxGOel1M6AOr2+p9zrPvqqwOJ3V4LbY/08pBmNI1E5O
	Rw
X-Received: by 2002:a05:620a:44c2:b0:949:6841:60d4 with SMTP id af79cd13be357-9499957e934mr403492385a.24.1794998053362;
        Wed, 18 Nov 2026 02:34:13 -0800 (PST)
X-Received: by 2002:a05:620a:44c2:b0:949:6841:60d4 with SMTP id af79cd13be357-9499957e934mr403489085a.24.1794998052798;
        Wed, 18 Nov 2026 02:34:12 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:d355:fe70:14a0:ac8d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a650d2ecd0sm4519631f8f.8.2026.11.18.02.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:34:12 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org, tglx@linutronix.de
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Peter Ziljstra <peterz@infradead.org>,
        Bradley Morgan <brads@mainlining.org>,
        Heiko Stuebner <heiko@sntech.de>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support),
        linux-rockchip@lists.infradead.org (open list:ARM/Rockchip SoC support),
        Thomas Gleixner <tglx@kernel.org>,
        linux-kernel@vger.kernel.org (open list:CPU HOTPLUG)
Subject: [PATCH v2 1/2] smpboot: Allow restricting per-CPU threads to a CPU mask
Date: Wed, 18 Nov 2026 11:33:48 +0100
Message-ID: <7a1e55d24c39d70caa157e6e2c823d9be5db07e7.1794992905.git.daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-GUID: H4ioMC_qmbeGQ5kXCshMTvI3DQE7htr5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA0MSBTYWx0ZWRfX/pMYYaegwFde
 Tu4SqQ5cOb8c8F8XQyroCsN6dlodXpbO8GZKCB1+hDmCx0NtsNZOJl2qSwMz5jWhKWltff3a8gZ
 uJTcJOzabovksMo6puCOKVZs0DZnFYU=
X-Proofpoint-ORIG-GUID: H4ioMC_qmbeGQ5kXCshMTvI3DQE7htr5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA0MSBTYWx0ZWRfXx9Ph3spsBJXs
 hQBqSvN2jOOHgYufWTRVD4NLBM2+o/mxQKQeRz0NEY0wKoSb7QWhZEWKNMdBPXDfLr6/Evxs/za
 cvOqCER3Btk3K4L1Lov7n9dj6EAUc3B2NAsVtROnWXETawLRZTC53e3o217+LU5vuHqOnl03N9a
 vurEYEbE7NfugurLC1yM8uZAQ9HricpdIJshef7sfznJGdx/KyMDR3MFdKN2YEbcv8w/YVnlhuL
 CSQeMuaMjhqoSF5IWUeWFk8FyT7K1GohqG6lg5CAygT/SB89FPtzlbxj8dOJfXtyTpBqn9q0FZ/
 0nVMt2eOwxY2mwsiJL8LvryII9OaLpUI7xMquLzjoI3LjodC154+PHEHWswNdy/jg62scSy2jEi
 mq4RehymGC8OxAUvSn1sqtVUD1uWOlgbx1ZRVmLQLf1PoAxfPRVs8dsYBWOEuQg0t/uZhfe+gxh
 Xi8gCL86b/NbZbIp9nA==
X-Authority-Analysis: v=2.4 cv=RYIFmFtv c=1 sm=1 tr=0 ts=6afd7f26 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=5Kbu-F-uTTPTLeMpapkA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180041

smpboot_register_percpu_thread() creates a thread for every online CPU
and registers the descriptor for subsequent CPU hotplug operations.
There is currently no way to restrict these threads to a subset of
CPUs, even when the user only needs work performed on that subset.

For example, an idle injection device targets a specific CPU mask.
Creating threads outside that mask consumes resources unnecessarily.
Supporting multiple such devices also requires each descriptor to
manage only the threads associated with its own CPUs.

Add an optional CPU mask to struct smp_hotplug_thread and apply it
throughout the thread lifecycle. Registration creates threads only for
online CPUs in the mask. CPU bring-up creates threads for selected
CPUs that were offline at registration, while parking and unparking
are restricted to the same mask.

Apply the restriction to thread destruction as well, both during
unregistration and registration failure cleanup. This is necessary
when descriptors with disjoint masks share the same per-CPU task
storage: tearing down one descriptor must not stop or clear threads
owned by another descriptor.

Reject registrations that share task storage with an existing
descriptor and have overlapping CPU masks. Check for overlaps under
smpboot_threads_lock before creating any threads, warn once and return
-EBUSY on a conflict. Checking the masks also covers offline CPUs,
whose task pointers may not yet be populated. This prevents descriptors
from sharing a thread and interfering with each other's teardown.

Default a NULL mask to cpu_possible_mask at registration, preserving
the existing all-CPU behavior and allowing the lifecycle helpers to
use the mask unconditionally. Use scoped guards for the registration
locks so all error returns release them in the correct order.

The caller must keep the mask valid and unchanged until the descriptor
is unregistered. smpboot serializes the overlap check and descriptor
registration against other registration and unregistration operations.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 include/linux/smpboot.h |  6 ++++++
 kernel/smpboot.c        | 45 ++++++++++++++++++++++++++++++++---------
 2 files changed, 41 insertions(+), 10 deletions(-)

diff --git a/include/linux/smpboot.h b/include/linux/smpboot.h
index 9d1bc65d226c..57b945d51b19 100644
--- a/include/linux/smpboot.h
+++ b/include/linux/smpboot.h
@@ -5,6 +5,7 @@
 #include <linux/types.h>
 
 struct task_struct;
+struct cpumask;
 /* Cookie handed to the thread_fn*/
 struct smpboot_thread_data;
 
@@ -27,6 +28,10 @@ struct smpboot_thread_data;
  *			unparked (cpu online)
  * @selfparking:	Thread is not parked by the park function.
  * @thread_comm:	The base name of the thread
+ * @cpumask:		Optional mask of CPUs on which to create threads. Must remain
+ *			valid and unchanged until the descriptor is unregistered.
+ *			Registration defaults NULL to cpu_possible_mask. Descriptors
+ *			sharing @store must have disjoint masks.
  */
 struct smp_hotplug_thread {
 	struct task_struct		* __percpu *store;
@@ -40,6 +45,7 @@ struct smp_hotplug_thread {
 	void				(*unpark)(unsigned int cpu);
 	bool				selfparking;
 	const char			*thread_comm;
+	const struct cpumask		*cpumask;
 };
 
 int smpboot_register_percpu_thread(struct smp_hotplug_thread *plug_thread);
diff --git a/kernel/smpboot.c b/kernel/smpboot.c
index 4503b60ce9bd..f997fe85f088 100644
--- a/kernel/smpboot.c
+++ b/kernel/smpboot.c
@@ -168,6 +168,9 @@ __smpboot_create_thread(struct smp_hotplug_thread *ht, unsigned int cpu)
 	struct task_struct *tsk = *per_cpu_ptr(ht->store, cpu);
 	struct smpboot_thread_data *td;
 
+	if (!cpumask_test_cpu(cpu, ht->cpumask))
+		return 0;
+
 	if (tsk)
 		return 0;
 
@@ -225,6 +228,9 @@ static void smpboot_unpark_thread(struct smp_hotplug_thread *ht, unsigned int cp
 {
 	struct task_struct *tsk = *per_cpu_ptr(ht->store, cpu);
 
+	if (!cpumask_test_cpu(cpu, ht->cpumask))
+		return;
+
 	if (!ht->selfparking)
 		kthread_unpark(tsk);
 }
@@ -244,6 +250,9 @@ static void smpboot_park_thread(struct smp_hotplug_thread *ht, unsigned int cpu)
 {
 	struct task_struct *tsk = *per_cpu_ptr(ht->store, cpu);
 
+	if (!cpumask_test_cpu(cpu, ht->cpumask))
+		return;
+
 	if (tsk && !ht->selfparking)
 		kthread_park(tsk);
 }
@@ -267,6 +276,9 @@ static void smpboot_destroy_threads(struct smp_hotplug_thread *ht)
 	for_each_possible_cpu(cpu) {
 		struct task_struct *tsk = *per_cpu_ptr(ht->store, cpu);
 
+		if (!cpumask_test_cpu(cpu, ht->cpumask))
+			continue;
+
 		if (tsk) {
 			kthread_stop_put(tsk);
 			*per_cpu_ptr(ht->store, cpu) = NULL;
@@ -279,28 +291,41 @@ static void smpboot_destroy_threads(struct smp_hotplug_thread *ht)
  * 					    to hotplug
  * @plug_thread:	Hotplug thread descriptor
  *
- * Creates and starts the threads on all online cpus.
+ * Creates and starts the threads on online CPUs selected by the descriptor's
+ * cpumask, or all online CPUs if no mask is specified.
+ *
+ * Return: 0 on success, -EBUSY if a registered descriptor shares the same task
+ * storage and has an overlapping CPU mask, or a thread creation error.
  */
 int smpboot_register_percpu_thread(struct smp_hotplug_thread *plug_thread)
 {
+	struct smp_hotplug_thread *ht;
 	unsigned int cpu;
-	int ret = 0;
+	int ret;
+
+	if (!plug_thread->cpumask)
+		plug_thread->cpumask = cpu_possible_mask;
+
+	guard(cpus_read_lock)();
+	guard(mutex)(&smpboot_threads_lock);
+
+	list_for_each_entry(ht, &hotplug_threads, list) {
+		if (ht->store != plug_thread->store)
+			continue;
+		if (WARN_ON_ONCE(cpumask_intersects(ht->cpumask, plug_thread->cpumask)))
+			return -EBUSY;
+	}
 
-	cpus_read_lock();
-	mutex_lock(&smpboot_threads_lock);
 	for_each_online_cpu(cpu) {
 		ret = __smpboot_create_thread(plug_thread, cpu);
 		if (ret) {
 			smpboot_destroy_threads(plug_thread);
-			goto out;
+			return ret;
 		}
 		smpboot_unpark_thread(plug_thread, cpu);
 	}
 	list_add(&plug_thread->list, &hotplug_threads);
-out:
-	mutex_unlock(&smpboot_threads_lock);
-	cpus_read_unlock();
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(smpboot_register_percpu_thread);
 
@@ -308,7 +333,7 @@ EXPORT_SYMBOL_GPL(smpboot_register_percpu_thread);
  * smpboot_unregister_percpu_thread - Unregister a per_cpu thread related to hotplug
  * @plug_thread:	Hotplug thread descriptor
  *
- * Stops all threads on all possible cpus.
+ * Stops all threads associated with the descriptor, including offline CPUs.
  */
 void smpboot_unregister_percpu_thread(struct smp_hotplug_thread *plug_thread)
 {
-- 
2.43.0

