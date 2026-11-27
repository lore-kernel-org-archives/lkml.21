Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774138;
	b=E9fZiCBD/vkG5RpWYhwUO/IYsCgJuhFSkzBS/25Ws8E1oDtsPxinbG5CQLAuSEhK2A2C
	 uHRxWi1EIcmXAKUKyE0SE3K8rnfS222kxfX8L59/IaPC0ZqB1kDC8HcwFnnMZYG9P04aB
	 5uT3dvedcCAj59eK7n2hyuEJLjtNYf5uOXdGBW2e++/EtkNboSu1RoxVgwIh8LUAmomUn
	 LEx6zK+TqDLMeETuAm3JGAJAP5bxGGUXjdekhWJSuV7fGCH0/fV3tZlphrSBofofbsgEC
	 znSxV8m21AuAjanrTaEkgbQYSFlA+6grsLBvsDS1tTAT37e0gjiAoszy1dwcGmQJGDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774138;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XqXc+9culWsYz+zBXUjTPcvhT7+JZX2wVQqN5hm8+Pk=;
	b=oKss8nFHyfgvYBCs3pqsAlQ8QrzUizkAaVE2oNhj8AvCdNzex+mOfULoib1FSIMo5w2e
	 XfIKModsajo87awzaUF0K6ZOIEUksByeeCJ1rrPiDnZtN9bvBYyCzvRDETbkVjk5juGiF
	 eb8OKmUf76abizdST42/inH3QiDx9lcTXKLuur2L0hI6YXd46+aq00uF21houXV6PWDHB
	 ByVXim/DYtCO/b0IF26d2JH42BO3687UmFHIO+eGZ+Thgx+TN7QS6kxtttYP/Rk1tqSlR
	 MCPTOGDyKRkUndsrOVABxl6S0YEiAhyZZyshuoDE99DkGwnB3aAhCZHrT9N9+H3D6nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uc1SmsM3;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4C7606A326
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:08:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD4C7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uc1SmsM3
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-386e226acaaso424044eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774137; x=1796378937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XqXc+9culWsYz+zBXUjTPcvhT7+JZX2wVQqN5hm8+Pk=;
        b=Uc1SmsM3hk2OtD+TqjXt7AyjIF70KLAto3CnaqlIDXowrqH9GgWnTHOKkSUoIIb8J3
         Vj3UYxz5jRXFtfsOO6Sr7sT4mDdPb9adZz+I2d0hTM0CdfTlafL47lax7bSI+g+Zhzbs
         PcYbvR1sP+5uxgPLNfwnlvZYLP+XC0ytFo/W9CZj+ttpjuuX+/L5oNwMU6Gyl44VHlmj
         v3QfdpBgonRf1OLmX76dVBT00gav3/M+T73OI4TcgjmxWNt7owTxYocQQ+UbYDVHHLAx
         24JnjIJGAxd9hqzKLeh6Xg5QIUgKbzsnoIfCG1kfIiv6RANv9aaHJp0ktRqS6XvHi6R0
         FgXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774137; x=1796378937;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XqXc+9culWsYz+zBXUjTPcvhT7+JZX2wVQqN5hm8+Pk=;
        b=GVcbt6WN1J0JyxMvPNaPr3ZnS2fmEss82AGk/P5tmzYYirv+AGnrMg9kejN3dIZ+FT
         F3xgTKUVC6eWdjONr86jKwRbTfELdO3leOwXhIzsPmf9HOV61Dgc4Cf3kyzbd17hUvr6
         CHsU5bNfesORk7NUNWA6rycpZ+qYi4a9dIO6402BXyL+gR3NA7ZtslSrQtvQgDCppo3c
         I+UUWZHbCxdn4aLCRFYAr2ZPv3bU+UQHyBqxdZsF0YkSpJQNmjqGjg42xMXmdY/LqY4G
         amD7gHHJazRr2GZlmCu82Pcz7WDK9j9Bod6E+AjwVtReSFNWi3RBdlVaznBK6FnPHJX/
         X1Rw==
X-Forwarded-Encrypted: i=1; AL+hErGHaalTVCNqbABHf5rtS+ZQbGTESJab5KxJW6n08h6P7wdSmMpqDAFYNIJURFa/2dTCXWBG+7KCQsJZcQY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+h+zlvVZYSEc1LR1WmMtMHMBUlbRKlYHGQ8lp0wCRW1csYNbHu
	socv9raJS7Jk+3uhQKwaIdr761f1QJN3ffOHxpy4sE32kQK4P48N3ZTy
X-Gm-Gg: AZFdTZeuqiBWSUeV7qSjwKqrEgb7mUtn69uv5mz4R9jrHJxnZKZBhaAv5MyTRRuAlvZ
	IHwLo44EWsKsiKNiCkryvbhS2ZubwJCgnVJAYCGB2eU41WYSqhsE1AOw0z6oYjKR71y5s+k17PL
	Nizxni+CuL/nLwQLoukEJ6XIj1MeXLLZfwOqSxhdQPQw3rJCiMewo9elSWa6ZR5hIw/qvvGMKLv
	l7vmdvbHgJHQHMsLdQuCLzOx4OrDmqoZnSp1ONb0SVCj+7ezxcIjixan59svXfhFMicOFeE5tvC
	YuIFpUS2Tm1Uc/U1N7elQfAD0PvQaijhpnbykBlQ34npQ4Z8i7QYBDU1oPF7rdKXllFE6B9Ozms
	tl+PMii+A/obk8WO6ewfOVjQTT3osLvMbnWQANKIJzLkkIq1f7sBB1EkEnCxv+gdOiR8kieaAEV
	NGO7acdBETOOw99GhXiMyhUDLW6SHau4SHmtLwn6zcbXpy721omfO0GHYDoIJGJpA4uk7hkYamX
	z+4ZmnjlDJwd80gS6Fg1azZCtjjjjT5HrvhclbwlH6NNr8TiP5H7pZEFmR7B59WVYwC/QXkdVfV
	FZmpdlpTVEpv4glLbRybrFAzbyYvUrpwg3/HPGU=
X-Received: by 2002:a05:7300:fb97:b0:381:6ac8:ef2e with SMTP id 5a478bee46e88-3856ff5db0bmr33036922eec.25.1795774136935;
        Fri, 27 Nov 2026 02:08:56 -0800 (PST)
Received: from WannaCry ([2405:201:a418:c1d0:90a2:f39d:9eab:aa4d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385c6830815sm64127427eec.20.2026.11.27.02.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:08:56 -0800 (PST)
From: Adhyansh Verma <adhyanshverma2010@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Carlos Llamas <cmllamas@google.com>
Cc: =?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <brauner@kernel.org>,
	linux-kernel@vger.kernel.org,
	Adhyansh Verma <adhyanshverma2010@gmail.com>
Subject: [PATCH] rust_binder: fix process leak on proc file creation failure
Date: Fri, 27 Nov 2026 15:38:46 +0530
Message-ID: <20261127100846.67589-1-adhyanshverma2010@gmail.com>
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

In rust_binder_open(), Process::open() allocates and initializes a new
Process struct, registering it into the binder context's process list
(Context::manager.all_procs) via Context::register_process(). Because
Context holds an Arc<Process> in all_procs, and Process holds an
Arc<Context>, a cyclic reference is established.

Immediately following Process::open(), rust_binder_open() attempts to
create the proc file via BinderfsProcFile::new(). If this call fails
(e.g. under memory pressure when allocating the proc file dentry or
inode), rust_binder_open() returns err.to_errno() immediately.

Because open() returned an error, VFS drops the struct file and will
never invoke the ->release() file operation (rust_binder_release()).
Consequently, Process::deferred_release() is never scheduled, and
Context::deregister_process() is never called to remove the Process
from all_procs.

As a result, the cyclic reference prevents the Process from being
dropped, permanently leaking the Process struct, credentials, and task
references in kernel memory, while leaving a stale entry in all_procs.

Fix this by explicitly calling process.ctx.deregister_process(&process)
on the BinderfsProcFile::new() failure path to break the reference
cycle and allow the Process to be freed when exiting rust_binder_open().

Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
Signed-off-by: Adhyansh Verma <adhyanshverma2010@gmail.com>
---
 drivers/android/binder/rust_binder_main.rs | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/android/binder/rust_binder_main.rs b/drivers/android/binder/rust_binder_main.rs
index 56c78647523..7ca70dae659 100644
--- a/drivers/android/binder/rust_binder_main.rs
+++ b/drivers/android/binder/rust_binder_main.rs
@@ -401,7 +401,10 @@ unsafe impl<T> Sync for AssertSync<T> {}
     match unsafe { BinderfsProcFile::new(inode, process.task.pid()) } {
         Ok(Some(file)) => process.inner.lock().binderfs_file = Some(file),
         Ok(None) => { /* pid already exists */ }
-        Err(err) => return err.to_errno(),
+        Err(err) => {
+            process.ctx.deregister_process(&process);
+            return err.to_errno();
+        }
     }
 
     // SAFETY: This file is associated with Rust binder, so we own the `private_data` field.
-- 
2.56.1

