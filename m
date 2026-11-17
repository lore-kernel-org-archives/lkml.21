Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794957573;
	b=pPlM8i5ku8TvK1L/DuNNJFj/Sh2xkxE0O8Kay9XYvXoxdsg/Tu2Blm4s8CnxExBXzkfQ
	 55IJSEUChzojn4JETHblqoUtgXh+vq+uW1BCu0IY/HZeL4kBqEIRLFv8cc6Zgp/FRSKAJ
	 /XBLdO34yGUKSjlnoxhtb6YOchi+y7aKME6HhBtq7ckZkfq5Q6eFAsTTKmFYAJ/A1vNEj
	 dDbJvYPoggSrJqcMdINgmL5bMeqpI/aO2zArQ92/exK0uEpCbKUGEF//M7oHOILbaGIpJ
	 uJrNwqSAnIzI8COdtb8xiDuz47ShPYEKzTQKB8UdW1ZHAj9MRXOyGmYpGPwhyD6/7Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794957573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=gUGlqWYHoDvFFPdsJt6mn1HEJRjMR+qNjaGOxe+inKk=;
	b=KlZnmXhftfTET0jQsq2XfKGPsJu6wV12sAgJ7RvbxhQiqagddoTgir1+AaelLlqsQP51
	 uQmicxkaTmXu1VzkxZ2zOqhV/UltKWWzUocL6lMQ1V1GeyCXilxc0hTlf1kFbZmLo/LYs
	 BopogPNsyBmT0RItbz6YNJQfZn4G+lThoh/nbVURgHpvudz5z3AunrejKbOjmVheIiob1
	 C4a1EgD6rMyHYjSteOuA/qRIVDruoVVyKRCLrebF1SRt7Oo2bz9+ZoYyB7A7IbnhJlcWc
	 /MMuN6SpPEJ9KAyFinLtUAAg2/B61oWDmt/uTHEtVG7L1292atcCX29Nzadryah0LDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OEldnhS5;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B972D606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:19:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B972D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OEldnhS5
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso561218eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794957572; x=1795562372; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gUGlqWYHoDvFFPdsJt6mn1HEJRjMR+qNjaGOxe+inKk=;
        b=OEldnhS5zkaO6vUwK0z1qiQWsR2ZqmvTx8qO8c0QNLsDb+rs7mgEEpBHHynZfrne/r
         lR5vdO2FVpSvAqoOArwEpS5i0tYj+rtoRWKJdTNEkb2yvdiUL2viY5b1YIK44ggqrkiN
         P19Gj+k0RnIx5JFqLctE5VIH0dEUxtN/ij9tmOb73uZ0KPnRzyFFKmS3mpAuLB1PR1sZ
         dEf9XKRIuswuC6tcnLrl1obzswCycmz9mZuXkZOrB3aImbJjkF/GudwtiT8vS1pXoUJA
         /Rid1NJGaaFDADX5sLF/4eUYMhwZOWTUplZwzZKpPsl4ggryWoOq0tYi578Jhuo2p4kR
         NjeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794957572; x=1795562372;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gUGlqWYHoDvFFPdsJt6mn1HEJRjMR+qNjaGOxe+inKk=;
        b=D2DPNMsxrrxOuDBEASYWp1Fgbmlx3YhblwJLLEX8Q1WnrmlVXfxdW392C/Enk7IDbH
         QIBPqYijCBstGkl9PHL0R3H/4w7GpmFbrKuPgAHQ7/FNSWMg+2It5Tb9ApEesTEqSKlE
         wHowFWdjfBinLCSo1piYW5u7+4NOOeZf0b0YwRb4cYR/WP8A+/akYewRL95svG21RjES
         tly9iQJpzR8I5FZjqpPBjqFtvHoxkpn2i71xUXxc7avXDAzhnJGD3F8OSsW4aNHkga7b
         GUep7giCMxw4AezqQL0jUR84QdgEnLcLQ958//4gY5mxMDP0W5pBV77p4KstKPj+zt87
         XyXA==
X-Forwarded-Encrypted: i=1; AL+hErGgpRSlzWAQTvDnsrqlgPVUmljy9ycE/LE9slxdYsWRZkZ8L9t4fWRbY7HW7FBURUUd8U+F/tvq7Yseq0c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Bmr+7/h5OJq/d2cgPEp4ZNDF5XuiFA6glPp9q5cbrOoPsQLHu
	swLcZZUh+c2yuPL/SNNwdisKKz9ECEjndkDDF6ZgEFCevH2ePL3oFTehKDy64tlTOqOlEwpciIq
	b6YP+t8nyVX6ezw==
X-Received: from dybqd1.prod.google.com ([2002:a05:7301:6401:b0:36d:3429:f79f])
 (user=cmllamas job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:88c9:10b0:36f:350b:3838 with SMTP id 5a478bee46e88-3828121ba36mr958286eec.31.1794957571614;
 Tue, 17 Nov 2026 15:19:31 -0800 (PST)
Date: Tue, 17 Nov 2026 23:19:26 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261117231927.2200674-1-cmllamas@google.com>
Subject: [PATCH] rust_binder: disallow binder fd transfers
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
 drivers/android/binder/allocation.rs | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/android/binder/allocation.rs b/drivers/android/binder/allocation.rs
index 927bf47d5d20..8cd4c2a4402a 100644
--- a/drivers/android/binder/allocation.rs
+++ b/drivers/android/binder/allocation.rs
@@ -182,6 +182,13 @@ pub(crate) fn info_add_fd(
         buffer_offset: usize,
         close_on_free: bool,
     ) -> Result {
+        // SAFETY: `file` is valid; read `f_op` with `READ_ONCE` semantics.
+        let f_op = unsafe { (&raw const (*file.as_ptr()).f_op).read_volatile() };
+        if core::ptr::eq(f_op, &crate::rust_binder_fops.0) {
+            // Binder FD transfers are not allowed.
+            return Err(EINVAL);
+        }
+
         self.get_or_init_info().file_list.files_to_translate.push(
             FileEntry {
                 file,
-- 
2.56.1.703.gf848ed807c-goog

