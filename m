Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017646;
	b=f+RQAbTfHhX2LONtEPpjW+xBjF0sAa6u2Lof7KNTaiKtRHljUBGNyoY1bJH/8+lIzdpF
	 iEM1FYd6N1jfC82VIU+VXRp4PfvZprl6ljNOK2ZbcmVTVAF/sJ+bzxHx4R0HMCC+rVuMY
	 qCmfLfpHzU1MT5FsCXk4v3g2nT6k8Rih/vjjOm/WUrW7YqGz3HiTkwqvbO/7CWlDgX/le
	 9290gHpUYOA+fnla+WHwvAfM5Q6Ql2Jv+IrU2n72wfwjExvO8PDC8EomaFgs4pHomozA3
	 zDeVKhAm875hmX9yDspN93r4/FzVWf0Gq7zR9FVVOMomuBkSFjcV+mLugFgcTqS33NA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017646;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=/eUnpfGijmmacs6gMeFB9nlJBGT8B/OrjwsgWkYiIPM=;
	b=Z3IElu5Wio0+3LNzNP/TxGQXTuIGyYtF34dA3NA2skXqqby1V2UGNZlPdOZPNa2ZL+1k
	 wTK/OV404zFXB1gKXzdXrU0ziDz3Pnq836wb8yJVTc+8nRhpUA8YTtzcSJsE/nJx1I8vW
	 Mz36GdlXvvhWNvCz3/oJ+g31pWUT2RvvnIZ8mliETIg88iUVnMxqTkrUsoEzKBmhqLGvz
	 fqekNEmS+B9T9RP9XHOKCi5rvF6E5av5RHTTxuIvgm6mp9gyVGSOd60RXBPifd3Vv6OGJ
	 5Zxp4g7h+KKuCeI++HUhmS1G2GeRSA3lBtVPfTjRmu2uNLAk8jdzWXZFSXogQJKfzqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jNLmMzj+;
	arc=none smtp.remote-ip=95.215.58.47
Received: from mta1.migadu.com (out-47.mta1.migadu.com [95.215.58.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4DA606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:00:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA4DA606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jNLmMzj+
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=7VeXSmZ3/hUkdPciRRL585AMCPSZFly0ImGRWGDZsag=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795017643; v=1; x=1795622443;
 b=jNLmMzj+LWIEyTsXHqJY/sFju3iEkY8eNZmswrqQ3+o/tdhuTanGZGPjBS4QVzEZXnvxe3Df
 RoQOr0nkcaYMWOCm0tx5xvTulEQxI5GZ+48JZAbb9rV+/J5/Lc/xQxTygPoy3afAp/NqKnNbduI
 yXQPYPgbl+mh+y+IDKYYOqxw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a1dd53c957c54ffa;
	Wed, 18 Nov 2026 16:00:43 +0000
X-Mizu-Trace-ID: a1dd53c957c54ffa
X-Migadu-Flow: FLOW_OUT
Date: Wed, 18 Nov 2026 16:00:43 +0000
From: Bradley Morgan <bradley.morgan@linux.dev>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, rafael@kernel.org,
 tglx@linutronix.de
CC: Andrew Morton <akpm@linux-foundation.org>,
 Peter Ziljstra <peterz@infradead.org>, Heiko Stuebner <heiko@sntech.de>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Thomas Gleixner <tglx@kernel.org>, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_1/2=5D_smpboot=3A_Allow_res?=
 =?US-ASCII?Q?tricting_per-CPU_threads_to_a_CPU_mask?=
In-Reply-To: <7a1e55d24c39d70caa157e6e2c823d9be5db07e7.1794992905.git.daniel.lezcano@oss.qualcomm.com>
References: <cover.1794992905.git.daniel.lezcano@oss.qualcomm.com> <7a1e55d24c39d70caa157e6e2c823d9be5db07e7.1794992905.git.daniel.lezcano@oss.qualcomm.com>
Message-ID: <0453960B-FF17-4E49-8672-FC0FDA3EF5DE@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 18 November 2026 10:33:48 GMT, Daniel Lezcano
<daniel.lezcano@oss.qualcomm.com> wrote:
>smpboot_register_percpu_thread() creates a thread for every online CPU
>and registers the descriptor for subsequent CPU hotplug operations.
>There is currently no way to restrict these threads to a subset of
>CPUs, even when the user only needs work performed on that subset.
>
>For example, an idle injection device targets a specific CPU mask.
>Creating threads outside that mask consumes resources unnecessarily.
>Supporting multiple such devices also requires each descriptor to
>manage only the threads associated with its own CPUs.
>
>Add an optional CPU mask to struct smp_hotplug_thread and apply it
>throughout the thread lifecycle. Registration creates threads only for
>online CPUs in the mask. CPU bring-up creates threads for selected
>CPUs that were offline at registration, while parking and unparking
>are restricted to the same mask.
>
>Apply the restriction to thread destruction as well, both during
>unregistration and registration failure cleanup. This is necessary
>when descriptors with disjoint masks share the same per-CPU task
>storage: tearing down one descriptor must not stop or clear threads
>owned by another descriptor.
>
>Reject registrations that share task storage with an existing
>descriptor and have overlapping CPU masks. Check for overlaps under
>smpboot_threads_lock before creating any threads, warn once and return
>-EBUSY on a conflict. Checking the masks also covers offline CPUs,
>whose task pointers may not yet be populated. This prevents descriptors
>from sharing a thread and interfering with each other's teardown.
>
>Default a NULL mask to cpu_possible_mask at registration, preserving
>the existing all-CPU behavior and allowing the lifecycle helpers to
>use the mask unconditionally. Use scoped guards for the registration
>locks so all error returns release them in the correct order.
>
>The caller must keep the mask valid and unchanged until the descriptor
>is unregistered. smpboot serializes the overlap check and descriptor
>registration against other registration and unregistration operations.

Cheers,

Reviewed-by: Bradley Morgan <bradley.morgan@linux.dev>

>
>Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
>---
> include/linux/smpboot.h |  6 ++++++
> kernel/smpboot.c        | 45 ++++++++++++++++++++++++++++++++---------
> 2 files changed, 41 insertions(+), 10 deletions(-)
>
>diff --git a/include/linux/smpboot.h b/include/linux/smpboot.h
>index 9d1bc65d226c..57b945d51b19 100644
>--- a/include/linux/smpboot.h
>+++ b/include/linux/smpboot.h
>@@ -5,6 +5,7 @@
> #include <linux/types.h>
> 
> struct task_struct;
>+struct cpumask;
> /* Cookie handed to the thread_fn*/
> struct smpboot_thread_data;
> 
>@@ -27,6 +28,10 @@ struct smpboot_thread_data;
>  *			unparked (cpu online)
>  * @selfparking:	Thread is not parked by the park function.
>  * @thread_comm:	The base name of the thread
>+ * @cpumask:		Optional mask of CPUs on which to create threads. Must remain
>+ *			valid and unchanged until the descriptor is unregistered.
>+ *			Registration defaults NULL to cpu_possible_mask. Descriptors
>+ *			sharing @store must have disjoint masks.
>  */
> struct smp_hotplug_thread {
> 	struct task_struct		* __percpu *store;
>@@ -40,6 +45,7 @@ struct smp_hotplug_thread {
> 	void				(*unpark)(unsigned int cpu);
> 	bool				selfparking;
> 	const char			*thread_comm;
>+	const struct cpumask		*cpumask;
> };
> 
> int smpboot_register_percpu_thread(struct smp_hotplug_thread
> *plug_thread);
>diff --git a/kernel/smpboot.c b/kernel/smpboot.c
>index 4503b60ce9bd..f997fe85f088 100644
>--- a/kernel/smpboot.c
>+++ b/kernel/smpboot.c
>@@ -168,6 +168,9 @@ __smpboot_create_thread(struct smp_hotplug_thread *ht, unsigned int cpu)
> 	struct task_struct *tsk = *per_cpu_ptr(ht->store, cpu);
> 	struct smpboot_thread_data *td;
> 
>+	if (!cpumask_test_cpu(cpu, ht->cpumask))
>+		return 0;
>+
> 	if (tsk)
> 		return 0;
> 
>@@ -225,6 +228,9 @@ static void smpboot_unpark_thread(struct smp_hotplug_thread *ht, unsigned int cp
> {
> 	struct task_struct *tsk = *per_cpu_ptr(ht->store, cpu);
> 
>+	if (!cpumask_test_cpu(cpu, ht->cpumask))
>+		return;
>+
> 	if (!ht->selfparking)
> 		kthread_unpark(tsk);
> }
>@@ -244,6 +250,9 @@ static void smpboot_park_thread(struct smp_hotplug_thread *ht, unsigned int cpu)
> {
> 	struct task_struct *tsk = *per_cpu_ptr(ht->store, cpu);
> 
>+	if (!cpumask_test_cpu(cpu, ht->cpumask))
>+		return;
>+
> 	if (tsk && !ht->selfparking)
> 		kthread_park(tsk);
> }
>@@ -267,6 +276,9 @@ static void smpboot_destroy_threads(struct smp_hotplug_thread *ht)
> 	for_each_possible_cpu(cpu) {
> 		struct task_struct *tsk = *per_cpu_ptr(ht->store, cpu);
> 
>+		if (!cpumask_test_cpu(cpu, ht->cpumask))
>+			continue;
>+
> 		if (tsk) {
> 			kthread_stop_put(tsk);
> 			*per_cpu_ptr(ht->store, cpu) = NULL;
>@@ -279,28 +291,41 @@ static void smpboot_destroy_threads(struct smp_hotplug_thread *ht)
>  * 					    to hotplug
>  * @plug_thread:	Hotplug thread descriptor
>  *
>- * Creates and starts the threads on all online cpus.
>+ * Creates and starts the threads on online CPUs selected by the descriptor's
>+ * cpumask, or all online CPUs if no mask is specified.
>+ *
>+ * Return: 0 on success, -EBUSY if a registered descriptor shares the same task
>+ * storage and has an overlapping CPU mask, or a thread creation error.
>  */
> int smpboot_register_percpu_thread(struct smp_hotplug_thread
> *plug_thread)
> {
>+	struct smp_hotplug_thread *ht;
> 	unsigned int cpu;
>-	int ret = 0;
>+	int ret;
>+
>+	if (!plug_thread->cpumask)
>+		plug_thread->cpumask = cpu_possible_mask;
>+
>+	guard(cpus_read_lock)();
>+	guard(mutex)(&smpboot_threads_lock);
>+
>+	list_for_each_entry(ht, &hotplug_threads, list) {
>+		if (ht->store != plug_thread->store)
>+			continue;
>+		if (WARN_ON_ONCE(cpumask_intersects(ht->cpumask, plug_thread->cpumask)))
>+			return -EBUSY;
>+	}
> 
>-	cpus_read_lock();
>-	mutex_lock(&smpboot_threads_lock);
> 	for_each_online_cpu(cpu) {
> 		ret = __smpboot_create_thread(plug_thread, cpu);
> 		if (ret) {
> 			smpboot_destroy_threads(plug_thread);
>-			goto out;
>+			return ret;
> 		}
> 		smpboot_unpark_thread(plug_thread, cpu);
> 	}
> 	list_add(&plug_thread->list, &hotplug_threads);
>-out:
>-	mutex_unlock(&smpboot_threads_lock);
>-	cpus_read_unlock();
>-	return ret;
>+	return 0;
> }
> EXPORT_SYMBOL_GPL(smpboot_register_percpu_thread);
> 
>@@ -308,7 +333,7 @@ EXPORT_SYMBOL_GPL(smpboot_register_percpu_thread);
>  * smpboot_unregister_percpu_thread - Unregister a per_cpu thread related to hotplug
>  * @plug_thread:	Hotplug thread descriptor
>  *
>- * Stops all threads on all possible cpus.
>+ * Stops all threads associated with the descriptor, including offline CPUs.
>  */
> void smpboot_unregister_percpu_thread(struct smp_hotplug_thread
> *plug_thread)
> {
>


--- Thanks!
