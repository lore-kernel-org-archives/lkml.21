Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795778975;
	b=INk6LUcCHAqzmZZRIttt/PA7GwEPlLuqnapXRquSN2j08KDRj+ZbShB+WyuZk9HR5N28
	 6Cvh2vk3Pwmy3mOxscOjuXVm8MY9G+BXnPYCWRFEbzd+kqZqH2M9WxTmvPyk95F/XB3aE
	 9Tn8Y41xBynE+sGvWSV6/aCF4OWmg6HsUe9MQFdPMs6+p9faafDcTLEo6aTLw+wEtmSuu
	 i0706pic/gg6GS0WVC945FIyJu35b9yI4kYITUXb9yf4Cc/e6Td1Iu3tEbMTSBZigk/gw
	 h1OG4qm4/8gcJk5j/zOG4q/h1lo9G3tVngciiVKk7nuI1ZcL649cjuHsewZHT7dbwxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795778975;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-B4-Tracking:
	 X-Change-Id:X-Developer-Key:X-Developer-Signature:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=1ANkrmfMFrvpyiRa4lPkzfM9t4gFZOEBQHA6RfERmMA=;
	b=1SaKdhxFtGVHgM90nbVBUHZk33ZyGiq7hL3TJB6Mr2aSH50EVXLQDHtdbXjlnZogrUtf
	 UwHqXZxnL47kHfOEwg2Saum1ix+Bqw8xvQfL+4bMWiEA1WUu66IINHxgmRgE5qz9/cSgw
	 hPe60nURevcx/BYgJexvDKnfBo12infsZzPjQKh0LhF8jmJ1SvjlJXEaGjvEoGnJJqe3t
	 wEJ0/nyJ6njYzjJY7lopgJRSmnci3r7oeXnQVx1W2z753YPctgsu3jhZDJF0t2cRj2ext
	 TCHDn+ew4lixaPjWrtJLupDdHJGQzTZ4wp4DIsVtUvN3Oi5L5q1TB9qB2YHH2BQBZcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MtNjF3F3;
	arc=none smtp.remote-ip=209.85.221.71
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795E6606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:29:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 795E6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MtNjF3F3
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4ab855a8c21so6253660f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 03:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795778973; x=1796383773; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1ANkrmfMFrvpyiRa4lPkzfM9t4gFZOEBQHA6RfERmMA=;
        b=MtNjF3F3ue4BQZbA7P27kvnkLMXKa4DLZlWs9h5DrwtOEVHvLmkEkeuqBXM3mDys38
         h7V2UxhWUocL70OsFSJGITejeE25EM30kepRufAgu1+tH59sgHkvkhJ19LCXui7pAaGX
         Kzh7wvn7PKfwm+YV1RXWWVFr3zEc+hgJcV1O26hUld1gGzVhIl6EpEYp8vR6N2bU+9l6
         sY+j8FZZTA2ZG6qvbQ2cGbZvPQrkFIdw3U3pSjIukTDB5e2wM19cNqkGLYthfV+4nP+8
         Hc6mvAbBMkPAUVSuPFGaqX1Egp3xkiosyGDLks9o3ZFcFBShqizOgoWDqXIv3XfGAeRE
         O10A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795778973; x=1796383773;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1ANkrmfMFrvpyiRa4lPkzfM9t4gFZOEBQHA6RfERmMA=;
        b=RfQbKXvRC7Om6QhacviY9wZdMiKQ4oYGvGI3371nGgvLOXWLmU7SXEXPXIIAjbE1FR
         cZ5rv51WoKw1c+H1f5RNFw0xCGBz375jQONQ8TK7ZZUbvjGqS4vuWwILRAwVGJQAGcTP
         nzXL5KZfPW6zQqJpRVkbZBHjFKDOGpZl/Xy+U+j7l4bFnMA7FXqI9dm671CXniFTfXWn
         UT5MaGTRNZoey2JheDOutwpKOTwQnF9xNW6vDjcgqJUjTajDzSZvuTFNAWmoDjMu6F5h
         eEioee3JstxjpsjYv5chwi1X4Xmzdip846XCHbqdvgrKBGJtbhsNLrd+S2Nm1Klmnnt3
         3BJg==
X-Gm-Message-State: APuU4Z91uM+vMmoCVeSrmU0KDU1rmLf9ZqmNcfvcz4Itnet72/6s7vGo
	8TuJbJNnTi4ZCvyfasWw9kKPsqcdWxNutQ/jI0KL7ea37MRxFr35KooRIvr/RfmumjLWQHjknWj
	ui8cCWXOgrHZGsPm1oA==
X-Received: from wrvq18.prod.google.com ([2002:a5d:61d2:0:b0:4a3:99b3:25c8])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:310c:b0:487:27f9:844 with SMTP id ffacd0b85a97d-4abb627ed47mr58407004f8f.57.1795778972531;
 Fri, 27 Nov 2026 03:29:32 -0800 (PST)
Date: Fri, 27 Nov 2026 11:29:25 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJRpCWsC/x3MTQqAIBBA4avErBtI6Ye6SrRInWogNMaSILp70
 vJbvPdAJGGKMBQPCCWOHHyGKguw2+xXQnbZoCvdKqVbtMG7NAu6YJH9SSLXcbLZCTttTN01te2 Ng9wfQgvf/3uc3vcDq1dc92sAAAA=
X-Change-Id: 20261126-condvar-doc-interruptible-72bb4754c9bd
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1878; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=E4n/kS/woo67/T3UC5fTwH7TZdTnEn6HvJSp9Je6L8k=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBrCWmWkxS+dBAWHnkI733O9C2UNjCPVi+JKnp0d
 Lm4ACHoUGmJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCawlplgAKCRAEWL7uWMY5
 Rq+BD/45pRBgwCN0gCCC8sjB5wRw2Tqd61R2ADtkeeNvOHFBxQwL9prZUrCfYgjVqjXMPA4IZLg
 7+a3eVKrIHIL3v3eku4YsxGRbE3J3cce1VkaooWLhdefe+LO9RShoyxlcqk3ALR0jINEcgBojtE
 jFlnuc4aVCgwZoG5KugY3zWpcKo4xgQ0H9NU+wNJMWw6UErgFVE0esUA8t/QxQoW381SLp9Aiif
 If/JmrnUl5a6B6FaQ1Vyg2wlFNZ7b8qhevB0badxyM9opvb0ECs5J5AG7On4bINNCFpi+2YR59x
 vtzepdvJsTa13nsHnqZypygJx4/qaY3uK/fXaKlP4Y8jcCchXpmQwzKMc4brMxVT0dn7N53e50s
 3WHMOPFJhBOW0SIHnC3TLj7cp7jhDSCOPxkhqAowacOIo4/5jsXKvjwBzLwIUjRHPna6QkUzlkR
 SEHIBE3N849aNSRXWvoL0Ebw3R9dlrFmPhrJ2ogPanKTBOT0u3Jq1bUL9pwQLaf+GYiXDUBcHA3
 gL6od+qdInQL7ZcF8htgMk2LhBLwJELVBHtk8LfEa7BuXylsUTA+gH20s5sgZzUEhi6cyoSRlPc
 MTVQ0p0mA0arKKVpztFgAM0d9bjNZ6I4OSLRt1+6T8eiZqxMBBJKn/+B2pCjQ1/FOFywKgR/sAH d/udzlJCUg5WmOw==
X-Mailer: b4 0.14.3
Message-ID: <20261127-condvar-doc-interruptible-v1-1-d61a13fb0c36@google.com>
Subject: [PATCH] rust: sync: condvar: show interruptible wait in CondVar doc example
From: Alice Ryhl <aliceryhl@google.com>
To: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, Lyude Paul <lyude@redhat.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	"=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, Miguel Ojeda <ojeda@kernel.org>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Sid Nayyar <sidnayyar@google.com>, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

The top-level `CondVar` documentation example currently only shows an
uninterruptible `wait()`, even though interruptible waits are usually
preferred so waiting tasks can respond to signals. Add an interruptible
wait function alongside the uninterruptible one in the example.

This came up while I was teaching the Rust for Linux course.

Suggested-by: Sid Nayyar <sidnayyar@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/sync/condvar.rs | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/sync/condvar.rs b/rust/kernel/sync/condvar.rs
index 69d58dfbad7b..fba82650842c 100644
--- a/rust/kernel/sync/condvar.rs
+++ b/rust/kernel/sync/condvar.rs
@@ -54,8 +54,22 @@ macro_rules! new_condvar {
 ///     value_changed: CondVar,
 /// }
 ///
-/// /// Waits for `e.value` to become `v`.
-/// fn wait_for_value(e: &Example, v: u32) {
+/// /// Waits for `e.value` to become `v`, returning `Err(ERESTARTSYS)` if a signal is received.
+/// ///
+/// /// Prefer interruptible waits when the caller can handle interruption, so waiting tasks remain
+/// /// killable.
+/// fn wait_for_value(e: &Example, v: u32) -> Result {
+///     let mut guard = e.value.lock();
+///     while *guard != v {
+///         if e.value_changed.wait_interruptible(&mut guard) {
+///             return Err(ERESTARTSYS);
+///         }
+///     }
+///     Ok(())
+/// }
+///
+/// /// Waits uninterruptibly for `e.value` to become `v`.
+/// fn wait_for_value_uninterruptible(e: &Example, v: u32) {
 ///     let mut guard = e.value.lock();
 ///     while *guard != v {
 ///         e.value_changed.wait(&mut guard);

---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
change-id: 20261126-condvar-doc-interruptible-72bb4754c9bd

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

