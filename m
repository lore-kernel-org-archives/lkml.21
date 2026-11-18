Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795021808;
	b=NijrorZUVLNV07L/lK+Ff0nRdhoU/Ue5VX1p49D/Ip4/9yxV3C3G4+hGdfm2c1Ep/RXy
	 ROTDzcYiaQbn4GQ+VPwWbOr0sJraMRwAenR3PIZqVnOk3X8t2rgi2WAuuETuA65cFXbMh
	 rzTPYqHqEy2XuZuaL71o83YXncdtiuHl0a5OrmfFVSzTbfPC5LU6u4rHKLVXVS8gOUzDF
	 IDb2YDQsxhXaUVQhe644BD6XW+OIX/dy/aV1AgIgPlepJ8aXfaHYfw/WiaqV+FRP6iBoz
	 rZedYbatSaDoS4M5Kf9WEbxncSGStbF/Bm20gSYWtDAexmQgSDQZnqP6QgD96KQmbkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795021808;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=upxsZjZd23/rE94pnRNu7XdEGLc2MTF7owyJv89u1r0=;
	b=BrOpXbHOOqM+UxMpkH4Q8D2zHMLtXLpUh/wDaP1QaBQ9RF6R76x9jzcjnbXEJLF3rU0K
	 a0n+iYbxUp/vwjshIAWzwEE7o5kiMkENeL3OZJTK+BozL99rC5IwOC7lBEFd9UiaHUXUn
	 h0SRRsM/LEznNJ9NVXRczx1GDy4mIdJ7WUannlX+yTodmYf7VaV3rFvaqMmvf0C59SMis
	 SxW6rsizt1g9xt1WpXKjvoby++HO+m5Q8Xt9o9nFJe+eZDIC25eJ4X0HhYl+btYFkQkdm
	 KBOY4gAURdqSUPvXEMBpjgyx7MpqbeUALyIiAFdForRDCwQQ/27SLDQ0oBymm2NPYWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=E7BFRAzH;
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EAD60A2607
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:10:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02EAD60A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=E7BFRAzH
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a359c7f47bso10442715e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795021806; x=1795626606; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=upxsZjZd23/rE94pnRNu7XdEGLc2MTF7owyJv89u1r0=;
        b=E7BFRAzHwOu8MPdDKyvAsqHvgNd5UTFf3H+TKU7c/gSlCGgN/HUGtjJ3kwlwEEG087
         VoFwrs5R37nkI6Bg90E8/oz/tr8l5ZhL9IJFIpGi3BGsx7P6YH5jQBBiBCiDPn4pnhFs
         kapdXD2Iek4cq5Fj9SeXy2IDys87M63CZ8HuMSV9l0B6zy1lmk9lkgjrdMAACnHIEobA
         XPh9NtKCDyfDF/O3wnrY3OCCkrxZKZzFCC/uivkab7QR5Fa/objxqJedHIw8mNixhQuP
         xr5ol2mbRioxmNokYSN9UTnFED8asM/wYeC0ffjeTquk40IRywCGodTdGRmpsK0yZIlv
         QbWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795021806; x=1795626606;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=upxsZjZd23/rE94pnRNu7XdEGLc2MTF7owyJv89u1r0=;
        b=PhV14tBvGviF/mjaX2wvFomElhxLRNKPnXvzfZ+v91K4A1bJg5dfywjI1V9DX0m25d
         hSs8oA1EhgkNBX4WQMgGOmCDrNhopPOvJ/m8pOe6dKVTkR8zoTOgGp+Qd4M/ZvSZ1gqG
         /tJVOD6MxUAD63W03f5uTnNyghzh9YPADYQ3HHIdPP6PLOJFyui30wQ9yrQaCGK9FvkX
         XXHIeoiXVlk5kWjemuMS1kbHtHWIADfmtKVoRSfK0EfPGu8RtIqozy1uukUSfX+1FtBB
         UJNLC22yxxFWYfjtyc8OxhLZdMay1ti0EKImUtJf6a3tnHW13gv/816em6F/jF/e1q/z
         JkAA==
X-Forwarded-Encrypted: i=1; AL+hErGBPWXbjXTQ3sd9w1QIrPGdIGVEROO2wrV8A7f6oRh9logtzn7647A8C8Dx6PPk7L8mdaKW3NqmgyFDiCk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+761B9/+Z/qfTrhx+0B922J1jRuB6foX+lR1O4PJvr5tRuPwqY
	EbVbybYp15FgaPFhIXalONRIloaJjlO+CGgh4uZatGGIpXxSpCMvmcyhtxviDa2ZeBua8FzGjNC
	aDxCdMCVlzr8KC4sQrQ==
X-Received: from wmbdr23.prod.google.com ([2002:a05:600c:6097:b0:4a2:8b4:78e1])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e11:b0:4bb:6a2d:b438 with SMTP id 5b1f17b1804b1-4bb7d578be5mr70523065e9.0.1795021805907;
 Wed, 18 Nov 2026 09:10:05 -0800 (PST)
Date: Wed, 18 Nov 2026 17:09:52 +0000
In-Reply-To: <20261118-ordered-wq-cancel-v1-0-916e01f9affe@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261118-ordered-wq-cancel-v1-0-916e01f9affe@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4847; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=Xu/sW3b3m/uzBSmDGW/8Hbncj3Ai/sXo4vu+FkRqaDo=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBq/dvox4g8vhDKk566WX3T16iHQaAmZHkBk//92
 M3vG/2KvN2JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCav3b6AAKCRAEWL7uWMY5
 Rl1iEACFig3wS7IisPl6v58G8IIV6kpnKlfzz4ioHVi7mJSEZEqn1rcY+49YkZeNgku1WTXkS0N
 qn0/Jp+ekIQWGwpD9dWHZneJxYl2pR5sRE4fas5iZzNyEVcLFK5COJp+7agxaFupYZfcJm/F+tE
 QfkyqYS0BfgX6SaDNcL6TMuj7CWtxvsssd+t8pLqZvTXHs7tq5TUMXQluBNK0zETysWX1R07xck
 8ggnMly7tyvb5670Y68i2f2xUhwBGABAHgwEmWwflYO2AWE10wpOcOlkhxHJtO0ouD5kgSDgNmO
 RMyzC+Nq6rW79km+XtWQtUOtYLXYEAnhllPwYDyuz6W7J5NXbz6DvqRuXjPugBix4I+ucx8kV5m
 glJxGZzi+Lg7a27aRAAMXtjfamDL3rS2lS8ejxH06zB6MDWDRe3i177OWw3FtnRCUCU92yVmBub
 HaWw/jLpnjOEYo2e7NO08NpPEUcWBK7wiStRDQk3YdxdiJiPcVH2y8oJk8l2LNnkUJcyb6VfLqc
 JST6/COHadrQD61G8iVlrZd8mYeZd2tF5z/nwHbLZ1Y/U9Eff2Ng2hCQAJnGF9E5aDIFa8yLu6p
 AHZmZBvMT3PyHhGYTqn/GbK8uFQSlCe2hlxBK+XSqc8KxRKySZrUUh7iRQ6J3Yo9O64wuCuYArE 2FDvU6bcoKF3n1A==
X-Mailer: b4 0.14.3
Message-ID: <20261118-ordered-wq-cancel-v1-2-916e01f9affe@google.com>
Subject: [PATCH 2/2] workqueue: doc: clarify cancel_work_sync()
 cross-workqueue behavior
From: Alice Ryhl <aliceryhl@google.com>
To: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>
Cc: Boqun Feng <boqun@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>, 
	Matthew Brost <matthew.brost@intel.com>, 
	"=?utf-8?q?Christian_K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>, 
	"=?utf-8?q?Thomas_Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, "=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, 
	dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

The kernel-doc comment for cancel_work_sync() claims that it waits for
@work to finish even if @work "migrates to another workqueue". However,
this has not been true since commit 606a5020b9bd ("workqueue: gut
flush[_delayed]_work_sync()") replaced the all-pools scan with
start_flush_work(). Consider the following scenario:

1. @work starts executing on wq A (pool A).
2. While @work is still executing on pool A, it is queued onto a
   different workqueue wq B (backed by pool B). Because __queue_work()
   only redirects to last_pool when re-queueing onto the same workqueue,
   @work is queued on pool B (where it may even start executing
   concurrently with pool A) and work->data is overwritten with wq B's
   pwq / pool B.
3. flush_work(), cancel_work_sync(), or disable_work_sync() is called on
   @work.
4. start_flush_work() only inspects the single pool recorded in
   work->data (pool B) and returns once @work is no longer pending or
   executing on pool B, while @work is still executing on pool A.

Queueing an in-flight work item onto another workqueue already violates
the documented non-reentrance conditions in
Documentation/core-api/workqueue.rst. Thus, update the kernel-doc
comments for flush_work(), cancel_work_sync(), and disable_work_sync()
along with workqueue.rst to stop claiming that cross-workqueue migration
is supported, and link directly to the non-reentrance conditions
section.

Fixes: 606a5020b9bd ("workqueue: gut flush[_delayed]_work_sync()")
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 Documentation/core-api/workqueue.rst |  7 ++++++-
 kernel/workqueue.c                   | 17 ++++++++++++-----
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/Documentation/core-api/workqueue.rst b/Documentation/core-api/workqueue.rst
index bb770f556568..007dee698ede 100644
--- a/Documentation/core-api/workqueue.rst
+++ b/Documentation/core-api/workqueue.rst
@@ -769,6 +769,8 @@ The work item's function should be trivially visible in the stack
 trace.
 
 
+.. _workqueue_non_reentrance:
+
 Non-reentrance Conditions
 =========================
 
@@ -784,7 +786,10 @@ executed by at most one worker system-wide at any given time.
 
 Note that requeuing the work item (to the same queue) in the self function
 doesn't break these conditions, so it's safe to do. Otherwise, caution is
-required when breaking the conditions inside a work function.
+required when breaking the conditions inside a work function; in particular,
+flush_work(), cancel_work_sync(), and disable_work_sync() only track the last
+queued instance and may return while an earlier execution on another workqueue
+is still running.
 
 
 Kernel Inline Documentations Reference
diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index d7acedfb8b27..5c7018ea0b48 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -4634,7 +4634,9 @@ static bool __flush_work(struct work_struct *work, bool from_cancel)
  * @work: the work to flush
  *
  * Wait until @work has finished execution.  @work is guaranteed to be idle
- * on return if it hasn't been requeued since flush started.
+ * on return if it hasn't been requeued since flush started and the
+ * :ref:`non-reentrance conditions <workqueue_non_reentrance>` in
+ * Documentation/core-api/workqueue.rst hold.
  *
  * Return:
  * %true if flush_work() waited for the work to finish execution,
@@ -4764,9 +4766,14 @@ EXPORT_SYMBOL(cancel_work);
  * @work: the work to cancel
  *
  * Cancel @work and wait for its execution to finish. This function can be used
- * even if the work re-queues itself or migrates to another workqueue. On return
- * from this function, @work is guaranteed to be not pending or executing on any
- * CPU as long as there aren't racing enqueues.
+ * even if the work re-queues itself. On return from this function, @work is
+ * guaranteed to be not pending or executing on any CPU as long as there aren't
+ * racing enqueues.
+ *
+ * Care must be taken if :ref:`the non-reentrance conditions <workqueue_non_reentrance>`
+ * in Documentation/core-api/workqueue.rst are not upheld for this work item.
+ * In that case, this function only waits for execution on the last queued
+ * workqueue.
  *
  * cancel_work_sync(&delayed_work->work) must not be used for delayed_work's.
  * Use cancel_delayed_work_sync() instead.
@@ -4843,7 +4850,7 @@ EXPORT_SYMBOL_GPL(disable_work);
  * @work: work item to disable
  *
  * Similar to disable_work() but also wait for @work to finish if currently
- * executing.
+ * executing; see cancel_work_sync().
  *
  * Must be called from a sleepable context if @work was last queued on a non-BH
  * workqueue. Can also be called from non-hardirq atomic contexts including BH

-- 
2.56.1.703.gf848ed807c-goog

