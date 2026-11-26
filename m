Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686835;
	b=aebq8tFPFtMgVzz5k7IaKkuhL2OxOUqf7ptm/dEGLmckgnSECD2Y7Yyq1hcOQKxnQNkG
	 RjFbdNQpDB5Tj7gXpSBL7cNCWDuPc8tqAja7bxZ/LxZDlAuSH2U7JtnXG8lwMSxZ3s6p/
	 P+RBbxVDdX4jM4tiZLgzHV1w4rwACp1qFuLqcl4PnHkiq5vEw53hp4NXgcpR/RLKn7p5i
	 xE1SXZhk6B7KqtG8ThQwQ17qYJn9Wu94ptAjHy23sJmNAFtEiUl9+9Rcvj/ri7IsoVy6P
	 fOuTpCWlg5m9HhUgYFxRgxcapTihhK3t/UK6ZKIi7ifsPVCUFQvmmngCxxulBiz9P6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686835;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=CuzfEbpK6SMX5s62D8VhwwFSgZwewNQ++RDy8jpJRaA=;
	b=Nymf/sGXrGd3hlVIsFHMbupEaQmo04cN3/XxBLdEIqKSQYu4hXM1gduSsYcUHNIrO7ru
	 3blk/re3o7hsiwGJULXm+tUJEQnW9zBwPNyEVLrM5Rv1GUUNwn1OhVNXgiNB1gcSTRyUF
	 68XH1WcJfTMB6uR8wZpNuXbwiUaA6pdE/0FZRrFihDIvlVjiw9srxFXknH4Ik6wtlgKah
	 y8yrYpP8hbpEqtUGqdMLJIoXhDwPg5DCvi7xjd7ib/vxUbaqGR3jn5iw7+/nY2NRxov3g
	 I2/iTvngbab204pVE1zq3F4FBaikw6Yug8Y1x2DHPZ7BL7k7++8gtTUieCglgPB1lQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mFIRwbj3;
	arc=none smtp.remote-ip=209.85.128.69
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A57C606A6BD
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:53:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A57C606A6BD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mFIRwbj3
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a20e41008cso30634005e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795686833; x=1796291633; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CuzfEbpK6SMX5s62D8VhwwFSgZwewNQ++RDy8jpJRaA=;
        b=mFIRwbj3mXaR9Vjjmnly7m578PJZkNRattVk0JGhh2ojgFYN+qBS6zgthCnwAgLes4
         mIZ2oH0GJSW42rsO9HkeCHMG5CZ8pTpEQMUtvua/terxVVJtMVC0DNegVaGhSZDi9kTn
         lmfvFAOSpiQ7vyTnZfZ8pdbZnbGTtLBjBYiJWq0TOpmpR5ESWJbIRNltI3Fb9aipCp0h
         zf8n7p/8zAC22O7JM4w7/vHISmnY6012f5JEDd7Za1KrTRA95jNi7JslbceLLWioXuSu
         RHZDspcU4+gL6IWyJFmwcs3FMK9/za2WfUqKwwIUFRlxaYPf3uPr4OBTN+bTj/yImBzq
         r/YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795686833; x=1796291633;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CuzfEbpK6SMX5s62D8VhwwFSgZwewNQ++RDy8jpJRaA=;
        b=VPVRbWmY2qp31IXePmv9IEdcycqgt+H47PuZEJUhXlNJaEC/LSuT/WlcOGLRZjE630
         YCZGDW8uDjOfaPWc7Gc6SqOk/xH/+w3q7DeY+BMC5gkxv/BKTpCD9JFpWnSQX0/Q4aLw
         uuGNhM3Mj1z8C6Xm4j3fYnrCpWKz8Y4kwGfXQKlpbcs5i+wpvyhddZV1jj4hfulOvpza
         lpdnfqxiK5UlibpF3kaPUKC5ET0qg4pIuixFbPETrGBB4ZnDDo2y6t//+9ehqYdx2i7w
         e7r70En95XFsU0AdsR+DDV5nBlGESxIJ8ui01LjWNiRrryhcyjVjvXkjMfTOk5wy88Fb
         WcRw==
X-Forwarded-Encrypted: i=1; AL+hErEKPXa5BtafhJ+4ctNVK/rKG0MiPRn2onSv0n7fiv+zAR8AY3eIF0uWJFyLc2DORekC6BwoX8zia4X2OBw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2yUUodFCftJLlSCX8kp+hMTQUM6OICmy5StBUVsWlStJAYKpk
	yCKd2SfaNw0/QQxJ1ZVvTqDL1qFmhxR35talATZieWNLCdQ1P9Ina1u4UGSL0M/TkW5HtF/do2j
	4DdfxQJHeF1qEugvxcA==
X-Received: from wmbef18.prod.google.com ([2002:a05:600c:6612:b0:4a1:dfb3:2e66])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e02:b0:4a4:4d57:8462 with SMTP id 5b1f17b1804b1-4bb88812b1cmr414847705e9.24.1795686832411;
 Thu, 26 Nov 2026 01:53:52 -0800 (PST)
Date: Thu, 26 Nov 2026 09:53:42 +0000
In-Reply-To: <20261126-binder-32bit-fixes-v1-0-22fc21baf6f8@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261126-binder-32bit-fixes-v1-0-22fc21baf6f8@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2059; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=D/f9oxKyC+0/56/KEOw74+zJmNkPLDR+DYLqojHESgU=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBrCAGq33LkyEM1Kp5UxVgcoJPi82CGjjlbyW1go
 ahuN4hggKaJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCawgBqgAKCRAEWL7uWMY5
 RqvFD/wKbJV5Opv9yGzOIOj7YSge6Ul/q4nRnBl6PIP7+HRm2NsUEirOWCZL3JAV+GPTJnyiYwL
 FySoprLoLWePqkB9lFeKVuPU2A9rjKHDvykgHh72qBIylWucgWEkcRhSP4Eri5mfXid7dtKcGrA
 G11kUg1gESq6dcdkkaYvcqXYk0AqJ0InRLtS0JafmecqbkQYX8cWEcmfBzFjqCYXTMSZMiNAuro
 wr9ccf7rphqEybBFlbEh21d+JgBge701bdCF8VFuUNopTKyhspwH5NP++Vh3xOG6BmtWemzNNTy
 uL4NaPrpSxpVR9r87JOI9wrmQXvnu7jWUS93A6k/jO+MNT6tlMbt+JUAIdqdd/AWq3eVTNgbDFq
 a5XfQoS3YH1smj7Pu4kGddaQoS2dPT5Xmv63agMAQrTkHhgbsy2+nKIt0S8C9ydcStE67h+xx55
 YODeLu9nvziegqHRnevTIZXCNAhSnMbO3sPrGIgKv7EshXx+juCkyAQD/cA42EcQmGHNBNjBF0o
 D+IuYq2mfST0xOQSV9NNbJIBAeTkKTyEdRf/G9llcSESkd6Z3w4mG7Upm+lKxddW3pPaKAcAzWB
 aRwiDoZjAPfnjH+uyieMjdeehb5A9GbDWMn3fxuZHUA81TA0DiR7q4OPH3H2gCbRS/U7hK/KLZj wrw1Rgw46hSErTA==
X-Mailer: b4 0.14.3
Message-ID: <20261126-binder-32bit-fixes-v1-3-22fc21baf6f8@google.com>
Subject: [PATCH 3/5] rust_binder: reject transaction sizes exceeding usize::MAX
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On 32-bit kernels, casting `data_size`, `offsets_size`, and
`buffers_size` from u64 to usize when reading transaction metadata
silently truncates values exceeding `usize::MAX` instead of failing as
on 64-bit kernels. Note that C Binder also silently truncated these
u64 sizes to size_t on 32-bit kernels.

Thus, saturate values exceeding `usize::MAX` to `usize::MAX`, which
`copy_transaction_data()` rejects with `EINVAL`.

Cc: stable@vger.kernel.org
Fixes: 5326a18e3e64 ("rust_binder: introduce TransactionInfo")
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/thread.rs | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
index 8357313875d5..23367dfbf393 100644
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@ -1310,10 +1310,12 @@ fn read_transaction_info(
         info.code = td.transaction_data.code;
         info.flags = TransactionFlags::from_bits(td.transaction_data.flags);
         info.data_ptr = UserPtr::from_addr(trd_data_ptr.buffer as usize);
-        info.data_size = td.transaction_data.data_size as usize;
+        // Saturate sizes exceeding `usize::MAX` to `usize::MAX`, which is
+        // guaranteed to be rejected as `EINVAL` in `copy_transaction_data`.
+        info.data_size = usize::try_from(td.transaction_data.data_size).unwrap_or(usize::MAX);
         info.offsets_ptr = UserPtr::from_addr(trd_data_ptr.offsets as usize);
-        info.offsets_size = td.transaction_data.offsets_size as usize;
-        info.buffers_size = td.buffers_size as usize;
+        info.offsets_size = usize::try_from(td.transaction_data.offsets_size).unwrap_or(usize::MAX);
+        info.buffers_size = usize::try_from(td.buffers_size).unwrap_or(usize::MAX);
         // SAFETY: Above `read` call initializes all bytes, so this union read is ok.
         info.target_handle = unsafe { td.transaction_data.target.handle };
 

-- 
2.56.1.839.g22a8290db9-goog

