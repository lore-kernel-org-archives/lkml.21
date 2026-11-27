Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.68
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774963;
	b=d4oXYcOeDl0XZJ8ahIO5JQdFU3TZEDQmWaGcfLZoEP7dJaA6enaNELNn6mMNeSkiq9d/
	 GvlarmkbZfvPVSQ4adzDh7UdfzxYXF+W+hf8rjGhMkxaUM6bq3+YKJudSSKBwNpO1umuu
	 lgrwZHTxZBQ/aNOxnAM/V9MyUFn00ruEsy/7D03bCSi6PG/x/144Oz8fM3mqyQkkGE1aj
	 2SIHlo2n+0lD9H2A1lDyPwAmHNn394O/3R2AHsI31N+ozftK9pjH7fa7oeslfuV9r5JH+
	 t1JShJBw6n+SK+ksXx1ohbBhafVn9qhoznI/cDQwVxkWwvZ/FsqswOWbvsTHijU0CHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774963;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6/jX12W92VjHvQwsqs/WyP2fOtVu/lPYryGB5gVljG0=;
	b=SHYAbyaCOLDQjOwsLaBEAZEpKPnWfVr7dddmrixO/GsJvXZIep+BgsqRzflzCgFP9jvA
	 z/4MqPkqkX8/VO0gx99M1YqrpppogPT7e2MYZ8YhbcmRF55UQZafyxezSXeY8JaVYlWL0
	 ERwByT4DMPPMuGggiEIt2l+6tonL/oJxV8CurPg+NzuetQNrtvo5gGDksOcKC0g6LKRmB
	 E3+xdeQfQ1efMInc9DXc2Fa5pJkNJd0Etzzvu1kZ/OZY8qc+KzF7Fooks/5WlQb46uZkp
	 BwZIrjfht82qt9cnncGbaW0l8c/ezPOJ7s6ZikrH07S+BWtpuC0msH9xarihoNJVFxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vd8ozl5M;
	arc=none smtp.remote-ip=74.125.82.68
Received: from mail-dl1-f68.google.com (mail-dl1-f68.google.com [74.125.82.68])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA20606A334
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:22:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBA20606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vd8ozl5M
Received: by mail-dl1-f68.google.com with SMTP id a92af1059eb24-1aefd1bf74aso4363421c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774962; x=1796379762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6/jX12W92VjHvQwsqs/WyP2fOtVu/lPYryGB5gVljG0=;
        b=Vd8ozl5MitepFsW7Er+FwXLuVm0MJdJtqddltqXG5nWpwZu4iiIRch7xRVi0DpSGmC
         yHapwfJ73TnQdklxw7yM+rr67SCp9hMcyOwm2B9t7rr6JytBt0PvoiAEvdtCKFKJDkR9
         /R8nLbmT1RHyOzlbtJE+dCjGnXAjkDCXscPthCTj7XqAgL5ey6o69GrP4kEjy9FTEHVK
         EaRPGP7T8msETD1V0+8n7QFF8boJnrZKgOb4Nknv7gYO2kTzHnbHCNs2q1TKnb93dz+g
         5O/ECvJHbXKcqwzLs4FFxG9mebxwWB+FYTvalltaw3FKgJxrK4kYerHX9xsB/0/e1i58
         zmqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774962; x=1796379762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6/jX12W92VjHvQwsqs/WyP2fOtVu/lPYryGB5gVljG0=;
        b=PCyOse9+Mc57OALWuuH1CvpkrHz5Z1ruVy3C39lkdAUURb+nFBscKzX9AUW6lUF+W6
         jRG8bAkyiU7shyzcvSidsrtxhU0Eqdm3BBIc5MAZHPIOku7//x7VAtX4q7GZnFrBnuZX
         HN8D/ZSiGLn+mhrkBtmI7F+G6t+FXZ7vjE40LSSPZcCcudDJaQbzcFI7OhsU+Q6RkT4c
         sGVu3wi58wHjtURztyjDrWoCJVgtzfvh8YBMD+D/USsEhR7dXaQ4Qml8otMtlczMS8Pe
         1c5yBcve+/MZxhmNi8yVIVg+jVn10tMvcJWTtEiJvlWjNc0MElDp/2OOR2kc4fEgysbj
         h7Ig==
X-Forwarded-Encrypted: i=1; AL+hErGtvHFrlqWwDoleE+Dy/io9YAEXNSGVF6Dyy4AdxgA+9e78geCgkiHxs9VCtzlRIymPPXO0Rzo23ILe7/A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GRpPVFPrkSQPIotr0Wodzr2CBLfmkW+7EgYHW5hGCXJsasrUJ
	1wEADfJoby4gX8fRXhEWLCVnUg/swXTLYozvAVEg+2q2DghvuzL5dAeh
X-Gm-Gg: AZFdTZfwj8BNUq2gxiLIwB32H6rDcrIWeSoQD5wWTgs7T6o9vh7wNJuwAyHc93QMkSA
	YDron+uiH4OnMfAFNtCD95kFMZ+u6v+iPueLytj1U3vkV9CE5glUyDLuDZ8YPYNxkklCdfoQ7Aj
	PScmjV2xJnZNFuLIeY33zkHrfIMvsvipyJSTOmGUP6uRQlJKp1dFiF2KuHNwuA6HxlPTa7dDgyJ
	oc1XycXIvzBT5mzd7anQdc1fmzir1dFC89tCvo6YkRBNnyKx3iZqjH43hPILuUHYuk1Sq0Nj+Qg
	CV5JaKtKbfeab89OpVHGIV5up5/PIz5bDIfk9Rn5d30g0CMs7G60MeGpNg5ipZ7GHkI5OE6QvMY
	LuDT8FOsXWALcX9UdWqmhJ0gTof4XPiYh5l9seh/Xz1maD8Zv4B2WHYQa7K+k9O+07FNB7CaWeR
	7xSGDnqXndL3BSL4vntQHMsQhFr+g/Aft3PhGcTNdhEdNJGxEE8KvArGU3+1E/LcH3P+YHgTb8Y
	YD0uHmdCDTBsz/C/yUUqjKRUphUoxCGP8mjRsT++YLWeV6H2Cobh17YEZQdhgTVhNsyo/FIlYc2
	hVmSOq8KlUqvYHaaXmH5CCpzJrV7nasYfe3nOQY=
X-Received: by 2002:a05:7022:3f0d:b0:1b5:32d6:6784 with SMTP id a92af1059eb24-1b5525f1012mr24325367c88.20.1795774961922;
        Fri, 27 Nov 2026 02:22:41 -0800 (PST)
Received: from WannaCry ([2405:201:a418:c1d0:90a2:f39d:9eab:aa4d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm62987251c88.13.2026.11.27.02.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:22:41 -0800 (PST)
From: Adhyansh Verma <adhyanshverma2010@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Carlos Llamas <cmllamas@google.com>
Cc: =?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <brauner@kernel.org>,
	linux-kernel@vger.kernel.org,
	Adhyansh Verma <adhyanshverma2010@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] rust_binder: retry ready threads or fallback to proc queue on dead thread
Date: Fri, 27 Nov 2026 15:52:32 +0530
Message-ID: <20261127102232.74796-1-adhyanshverma2010@gmail.com>
X-Mailer: git-send-email 2.56.1
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

When ProcessInner::push_work() attempts to deliver work to a waiting
thread from ready_threads, it previously checked only the first thread
with an 'if let'. If that thread has exited while waiting in the pool,
thread.push_work_inner() returns PushWorkRes::FailedDead(work).

Matching on FailedDead immediately returned Err(BinderError::new_dead()),
aborting the delivery and dropping the work item. This incorrectly
treated the entire process as dead, even though the process itself was
alive, other live worker threads might be available in ready_threads,
and the process work queue (self.work) was ready to accept the work.

Change the lookup to a 'while let' loop so that if a popped thread is
dead, push_work() continues checking any remaining ready threads. If no
ready threads remain, fall back to queuing the work on self.work, only
returning an error if self.is_dead is actually true.

Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
Cc: stable@vger.kernel.org
---
 drivers/android/binder/process.rs | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index 1f4cb43f1de..b7b53b99689 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -184,23 +184,27 @@ fn new() -> Self {
     pub(crate) fn push_work(
         &mut self,
         proc: &Process,
-        work: DLArc<dyn DeliverToRead>,
+        mut work: DLArc<dyn DeliverToRead>,
     ) -> Result<(), (BinderError, DLArc<dyn DeliverToRead>)> {
         let sync = work.should_sync_wakeup();
 
         // Try to find a ready thread to which to push the work.
-        if let Some(thread) = self.ready_threads.pop_front() {
+        while let Some(thread) = self.ready_threads.pop_front() {
             // Push to thread while holding state lock. This prevents the thread from giving up
             // (for example, because of a signal) when we're about to deliver work.
             match thread.push_work_inner(work, sync) {
-                PushWorkRes::Ok => Ok(()),
+                PushWorkRes::Ok => return Ok(()),
                 PushWorkRes::OkNotifyPoll => {
                     proc.notify_poll(sync);
-                    Ok(())
+                    return Ok(());
+                }
+                PushWorkRes::FailedDead(dead_work) => {
+                    work = dead_work;
                 }
-                PushWorkRes::FailedDead(work) => Err((BinderError::new_dead(), work)),
             }
-        } else if self.is_dead {
+        }
+
+        if self.is_dead {
             Err((BinderError::new_dead(), work))
         } else {
             // Didn't find a thread waiting for proc work; this can happen
-- 
2.56.1

