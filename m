Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795285687;
	b=f2oBvrfaoNgaRCViSI9L2mcvn/jUC5dqTuFa/o1FAgbrsUOH/vtmeCDD/eNyez77z0wJ
	 4RZ9pdrGMlyQP0am9mY+1n5zcDhHne7l1U6wC2mNfSnuh/1rZR1LRas3H9rMQ8RRXRHM/
	 yMNfAaLuBekAsh6irY3e94QXcdvwHgaiuqorB+XsiWTT0me4gIGx9PFnuG3oYqm/sRtr8
	 d83PXCwiLqLPCqPDysFEwd4jDXyrV9F1okfEjMyN5hBt18BU0tp31rdXejPXbB53RQqgf
	 42SyxwdqEc/97iw5EsjpdhgDeOk0s2YcXcm3DX7EXTqiy2y0k4XTTZCNkrPzfIaMktA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795285687;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=yCcssTD+yjuJjPO5oBtaLbwjf70aLXXs2hchJn8Qrh8=;
	b=JwzgZQyBQFYPu/dXimCj61wiJDSGU3y+xYrAhRB3oOAkVXBWVTNrIeXD0UinWdzulh5Z
	 JZm0KDVZ3nGv8PE3LyydieiGYC5iCH9Ui+R+AqI53yuiDfSjvVzzoj0Yc8CFCkMYKdLxZ
	 8u2sMcQNKHO67rYD2gvwf+nV164ZqYx6IIwvjKFKbrYOBMK1oeMdD/P0DHK3FZl+Gv+V2
	 NJRIU4Z8YdQKfOt3BKkwOEorH0W9d3AXHyHSR0wyRm1nwrKUxmHyxcKYVq/0G5yKo6iJQ
	 vgSERT5GiLbuZUc8Qojfu1kCcDH5vN6zZmhqeBdHf6baACFcMYF1dALlkOCqW5Hucdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=T2oAa6xl;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C806606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 18:28:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C806606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=T2oAa6xl
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-386a65fca25so59549eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 10:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795285686; x=1795890486; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yCcssTD+yjuJjPO5oBtaLbwjf70aLXXs2hchJn8Qrh8=;
        b=T2oAa6xl6/LZvHB4W7BbgT4C0xtwjEiogX4UkC8eSDPGff0K+yTBZKR0gwh89nJykK
         ms5Lnr16ohyeD/WHwxvtppoVPlxHBLGxxPgwW1xRExx1ZWl97sjWIqP+uQxuA94I25Ue
         YardoQZy3VsIXw4s2itO5h53r7C9+Ya8kZZ091Zdqz2NAzjxygbKiceimpJr9K1wX1kX
         sP44qEnuKGKItc+MAQrW8LnvjpuleKtPCqD4Z0izE7T2diNsc1p4Y389EYQL6rIZY1xd
         Abk4x5CPToybUZ78maOsdDTr20DID0XUKESWz8Cyz+C5SydAo645x0mr0zyDuCEfpVR1
         Z+LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795285686; x=1795890486;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yCcssTD+yjuJjPO5oBtaLbwjf70aLXXs2hchJn8Qrh8=;
        b=D2TLpZXuOlmmKmVn818YOMeO0Kow0xXuNW4uJxNCUDizFybqJN41c0CEOFt6JmyvKP
         YvjNSDveC7Oigvdrq52FNGKEUSbIbj3/GaSHqvSsGM1ZokY6XpId8C0uLTjrQut1NMR9
         WdiXkL07LVFdGFplA1e0SZxFV0UQmJE6WHiiLoSjJnFUOuGY2HDKNrr3HYjREOmmmaTv
         kpzOa3cFKqtf7PQcyrNxnoS46qAeTcnRsLUhnS8pm3jx3XVLlPqE67LaVdaJjvszTDdA
         +zqRFln9aaY4mB28QamaOr86S1864xEX4BOM6sjgmbV/LDj4WOBkETuGpaaV8AOQs7CH
         zNVQ==
X-Forwarded-Encrypted: i=1; AL+hErFrfjA7mWz0Qdep10EgDjKrBcjgOEvBiJKfc+awOcgrAVe2YlX3L+sDne7yYsM9Kub5PnAgdIXdxl3sud8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2nA4cJrlLOUW3FWtB0sCpACg8o3YRS0AKYOMkwcCz3McEYKGu
	/becSNRjrxc6prTwnrv9yOsUMHZxWwzOWKWnGirZ2kEhieShzBPQhmEsbA6D+kLH6IGUCjnRiJC
	biIX0sPTcpwlCWw==
X-Received: from dyu12.prod.google.com ([2002:a05:693c:810c:b0:35d:1771:4816])
 (user=cmllamas job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:dd83:b0:386:5adb:ac29 with SMTP id 5a478bee46e88-3865adbb03fmr4466333eec.7.1795285685610;
 Sat, 21 Nov 2026 10:28:05 -0800 (PST)
Date: Sat, 21 Nov 2026 18:28:02 +0000
In-Reply-To: <--in-reply-to=20261118112933.477541-1-aliceryhl@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <--in-reply-to=20261118112933.477541-1-aliceryhl@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261121182803.2600723-1-cmllamas@google.com>
Subject: [PATCH v2] rust_binder: disallow binder fd transfers
From: Carlos Llamas <cmllamas@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, 
	Alice Ryhl <aliceryhl@google.com>
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Transferring a binder device fd via BINDER_TYPE_FD or BINDER_TYPE_FDA
has no valid use case and can create direct reference cycles that
prevent Process::release() from running when a queued transaction is
left unread. Moreover, a binder file is bound to the opening process's
task, credentials, and mmap state, so transferring it to another
process breaks binder's per-process ownership model.

Disallow binder device fd transfers by returning EINVAL in
Allocation::info_add_fd().

Signed-off-by: Carlos Llamas <cmllamas@google.com>
---
v2: switch to atomic_load instead of volatile as suggested by Alice.

v1:
https://lore.kernel.org/all/20261117231927.2200674-1-cmllamas@google.com/

 drivers/android/binder/allocation.rs | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/android/binder/allocation.rs b/drivers/android/binder/allocation.rs
index 927bf47d5d20..f998744f075d 100644
--- a/drivers/android/binder/allocation.rs
+++ b/drivers/android/binder/allocation.rs
@@ -9,7 +9,11 @@
     bindings,
     fs::file::{File, FileDescriptorReservation},
     prelude::*,
-    sync::{aref::ARef, Arc},
+    sync::{
+        aref::ARef,
+        atomic::{atomic_load, Relaxed},
+        Arc,
+    },
     transmute::{AsBytes, FromBytes},
     uaccess::UserSliceReader,
     uapi,
@@ -182,6 +186,13 @@ pub(crate) fn info_add_fd(
         buffer_offset: usize,
         close_on_free: bool,
     ) -> Result {
+        // SAFETY: `file` is valid and any concurrent `f_op` writes are atomic.
+        let f_op = unsafe { atomic_load(&raw mut (*file.as_ptr()).f_op, Relaxed) };
+        if core::ptr::eq(f_op, &crate::rust_binder_fops.0) {
+            // Binder FD transfers are not allowed.
+            return Err(EINVAL);
+        }
+
         self.get_or_init_info().file_list.files_to_translate.push(
             FileEntry {
                 file,
-- 
2.56.1.809.ga0b61035b5-goog

