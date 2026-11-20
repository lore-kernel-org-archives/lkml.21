Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795195023;
	b=Mz9WQjc5E2bOErXk+eZPmAW0/RXyXk0vNFpdNtAT9rVl0Yb2fkzsqNNGnsUYVkuq98I6
	 8zLR/RUTw5GV2Pf1a3JjyGyCZZXc5oDqm6yTBr2ZAYKH2UyzvZauz8t+4St1W3RC3xBnQ
	 86eoubZ5bzGSK90wKQ/qmQrwEB7ku1OxO/Oy0bORq7BkLRIcXuGK01haLmGvoSU4YIwnN
	 liR5SzO5ZRHVKkJ5vH5SxaJOtrh15TgrEoLSGFK3iLXuSQqI6/QPB27mFp8MPoEkQl9yn
	 jCDZLvbkf0Ue19pNwEbGdLXd3k6f/tt3cpTILpwis/xlKB60Yd+v2PL6YF/0JCIYavw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195023;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=34T1vbwhbUf0eaDSpKy55OnBQe5NZsgJkt02ffrjIwo=;
	b=xB7Ls2f9hsuv9Mj2r0zvydOOkVO9w5dZcf2q91OQjRoxmmh4UYGflJ13Blg0PQm9R8dl
	 zhuxrpxO1TUDTgnd8yMFJbKiVs6lFFEy2I0+epqTgSJi0JqMlYWhxZEOH/YfqXZ0bOVFo
	 ft+CGmMZ+qdIC89x+T+BuNezFcEgRXt30leV5J/xOtxzZmsFvFvz3yUwGTUtPHnOIOvbs
	 ycwPo9OvgSDlJRHapI7/Gj358XqMhgekMPb9ZIs6XnLkbaA/T6190Z4s92xydQDGFn8v1
	 gnp0CQXzqD1MnQO6LEmZF6IgBXAQT8/5d3b4HG2iiZuP2YMJ4LiNbIfAYee1CVFfS7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=su67vz9N;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=ej8INKVK;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC765606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:17:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC765606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=su67vz9N;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=ej8INKVK
Date: Fri, 20 Nov 2026 18:16:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795195020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=34T1vbwhbUf0eaDSpKy55OnBQe5NZsgJkt02ffrjIwo=;
	b=su67vz9Nm+kGUb+Q9AE0bA2kP6KIjsu8ubVELyyx0cv5SSZZ2u4FtQyTFTuwqUl/aMuO7l
	1vuFsYHVWDD6t3so3JcZpriQWmG5WylGNZVkPKE28/5e7b7LHX1NEx241J6d/0MTJiQ1HL
	OcLEL8AwVSDhiutqoMvyn2JvdWPqNwTsm4bEeun514gTngPkug2wovElpJ2Y3fuTMH8vaC
	zRpzIaa73oj1BkH+hS6ljOkYP7l5xuLYCTlyGijxpCp7Wv2rSzZbadirnyVdU72SZaQAhA
	fogicyaXOrkaTB5wDj1ezsOpv1/T+nfjwHooVpGjPenvWnbnl6yum2x1m3nigQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795195020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=34T1vbwhbUf0eaDSpKy55OnBQe5NZsgJkt02ffrjIwo=;
	b=ej8INKVKARRAHdx+R85i+DR0v+2E1HQuWjzxJnFsg6Vs9J+A09ZKg3fkih7A0qclJBrxaI
	zhdcj4/GggaIbDAw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-kernel@vger.kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>,
	syzbot <syzbot+6835d5c11145e4f77057@syzkaller.appspotmail.com>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>
Subject: [PATCH v3] sched: Reset cpumask if __migrate_task() failed for
 migration_cpu_stop()
Message-ID: <20261120171658.Cf9qIU-Y@linutronix.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

syzbot reported a race of assigning a CPU affinity during CPU hotplug
operation.
After the affinity of an IRQ has been changed, the IRQ-core sets
IRQTF_AFFINITY and wakes the relevant interrupt threads which need to
adjust their affinity mask. The thread will then invoke
set_cpus_allowed_ptr() to update the mask. Based on the new mask a CPU
is chosen on which the thread should run.

It is verified that this CPU is online however there is no guarantee
that this CPU remains online while affine_move_task() is moving _this_
task. Since the current task requests the migration the stopper/
migration_cpu_stop() is involved at which point the task pauses for a
while. If the CPU goes offline (or is no longer cpu_online_mask) then
__migrate_task() (due to is_cpu_allowed() reject) will return the rq of
the CPU on which the task is currently running (which does not match
it's task_struct::cpus_mask).

The aftermath:
The IRQ-thread's CPU and task's cpus_mask do not match. A
migrate_disable()-> schedule() will change task_struct::cpus_ptr
ensuring that the following migrate_enable() will update the task to the
requested affinity mask. At this point, affine_move_task() expects
task_struct::migration_pending set but it is NULL because noone
requested an affinity change while the task was in migrate-disable
section.

There are a few spots where set_cpus_allowed_ptr() does not use
cpus_read_lock(). In the IRQ thread case, there will be an update
following if the CPU goes offline so it is not really needed to block
CPU hotplug during the update.

If __migrate_task() fails, set the CPU mask of the task to runqueue it
is currently on. Use do_set_cpus_allowed() for this so it also invokes
class' set_cpus_allowed callback.
Remove the comment about __migrate_task() failing.

Reported-by: syzbot+6835d5c11145e4f77057@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/6a9919ac.94649fcc.25487e.0005.GAE@googl=
e.com/
Fixes: af449901b84c9 ("sched: Add migrate_disable()")
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---

This survives my testcase without any warnings.

v2=E2=80=A6v3: https://lore.kernel.org/all/20261012103946.aOSAmrRe@linutron=
ix.de/
  - Drop RFC and with it the irq_thread_check_affinity() since the
    problem is not limited to it.
  - Instead of manually setting the CPU mask bit, use
    do_set_cpus_allowed() which should handle the DL bits correctly.

v1=E2=80=A6v2: https://lore.kernel.org/all/20260907085825.f-CZ1Q5y@linutron=
ix.de/
  - Repost with collected notes.

 kernel/sched/core.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 5ed660f099a55..c95d16ba9fe36 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -2710,17 +2710,16 @@ static int migration_cpu_stop(void *data)
 		if (task_on_rq_queued(p)) {
 			update_rq_clock(rq);
 			rq =3D __migrate_task(rq, &rf, p, arg->dest_cpu);
+			if (rq !=3D cpu_rq(arg->dest_cpu)) {
+				struct affinity_context ac =3D {
+					.new_mask  =3D cpumask_of(rq->cpu),
+				};
+
+				do_set_cpus_allowed(p, &ac);
+			}
 		} else {
 			p->wake_cpu =3D arg->dest_cpu;
 		}
-
-		/*
-		 * XXX __migrate_task() can fail, at which point we might end
-		 * up running on a dodgy CPU, AFAICT this can only happen
-		 * during CPU hotplug, at which point we'll get pushed out
-		 * anyway, so it's probably not a big deal.
-		 */
-
 	} else if (pending) {
 		/*
 		 * This happens when we get migrated between migrate_enable()'s
--=20
2.55.0

