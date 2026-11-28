Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795880253;
	b=Dv5/D6/UKrop4LwGNroqZjB5P8FtTvzmEEdjKW3AabBqq/YwwBIWcmUH81SKGuZiBeRd
	 q5yyGurQ1vbJ0cusuD34YppEprt5OF+hbdzt/EDaB7YrnrkCEJr1vSqGvLDJvV0ydjpQm
	 kzY8c2MwllZ7fFi8DnGV3Thh7rzng/4TvULyDKrxdm8K5Tpg13gUyzpKo0AvV8qOFQd31
	 eyfXwk1YZ9RdUFomcgKnIPiqcynNbOBeIKQKEtUxOhcfJ5kN4+lc7ezuboWIHucZQSJ0v
	 R8mtVm5bBhqQsltkabOXVWj+Svj5MjrwEJNuc3SekbaWxTNxgZEyuHHNJR2J183/8sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795880253;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tAUYIpIg6ERx4thJvYFrFqZXVL969C5RBu7LcxRaFqc=;
	b=nDsHeqmloYZXLTgswc8gD3kpK1JXpwc32wRFE5Q/Fs0/Jli07DB54jxs9AxEggbk7Ivc
	 QJWnxfpIs6MrXAkFzI83l61UGK3VC/REnc3z+oGw01BHLsaYWid3e/yXbYTiA7NU8PVA5
	 i86Rk4SBFc2ZePyuOwlej68eMJsLZsSz9sTAztf9Nlg627g4hK2hd2J+AsWIcCQfq5M/q
	 P4WJYOpnwz+54cUJces0DlXvufEHQL/gcfS728GfzQa92OGlzpisJ0PGKpMQYzZN2MufR
	 05kz5m/SIw9V7JKhev60FaHpcyyEj4YKrnhtumuWnHge5+DSewEJ0U9LXZJuAMBy76A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P70hHyoS;
	arc=none smtp.remote-ip=74.125.229.2
Received: from mail-dy2-f2.google.com (mail-dy2-f2.google.com [74.125.229.2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9F5606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 15:37:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD9F5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P70hHyoS
Received: by mail-dy2-f2.google.com with SMTP id 5a478bee46e88-327b1d5824fso6794687eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 07:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795880252; x=1796485052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tAUYIpIg6ERx4thJvYFrFqZXVL969C5RBu7LcxRaFqc=;
        b=P70hHyoSEeIPAvGIn0ZYPcspgiBpHcPTSF0+0ZJe9+SCXjZDHjwn/cP3zb1LlaQ9GP
         GZoSKcLAkqGrjOmea+JmG5i+R3yKNtwT5MvPli4Yx0+rpjvwqfuKdn9x/QMee8ddZ9IQ
         BXqKNYRYGkIxxSsUekogh081c/V6x6cIMUFYr9YZvLzesB9ZWLg+kTBSNPUh/B6jRJIa
         XfpL5cLS6gkXWtKCY9Yt/bYKPKspT8fAVok+M0jDeq3O2J+Q31FtZUtAX+nq3U9Imhyt
         DBRkN1gnWKbaQLcCWv+GE44OaL96rxjVPd4JkxY2b9u6QK8qVnfbBS2+chgHwICoSjf+
         Sryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795880252; x=1796485052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tAUYIpIg6ERx4thJvYFrFqZXVL969C5RBu7LcxRaFqc=;
        b=Sn/XEtTDHBVv5iyG6jE0xCwmkiM2dGYzLJBArehsBb7J8v3/spwxTT1x0QJBupodML
         j4VA7QoQYb7xJJwmHOEk3IAuw9FWdgtDQMP171vopFTV5F4dK9LWzAgKsjh7Pp8TsBea
         KaAnfho7nW6wfRZRD/oX09j+nnqXmIVN3S7vvDWgBEZz0Ez/DS9xC/Lg/clmqn+p0STS
         KzNFS4ecMmVfwlaSjK+4BwWxX/ga5+GRxHISljKaKRRqx35pYDkjHV50bBzRXT5YzMnC
         +PiKijpQtah8Wels8DZmTvl1cka8uKxvIG0tEltqAwIkzAPHNhXIrjkKg43mGLZNQ68X
         rKfQ==
X-Forwarded-Encrypted: i=1; AL+hErFw4j7jJCRpGPRjix2mFPIVr53gswRIH4NIEOR92zDCDsQZiIcubwkpicJqbJJt65s7tUwaeYDVDV1W/dY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9aAQALu7wr3Xd7aFLSLHtqpPTygHeO2W/G7v73ya7GWYCjB4Xh
	baKXbTPAzfpbIojSjHDrI1bCjaMRop8w7GbHdIeFEpB+65W6615hZo30
X-Gm-Gg: AZFdTZeOtLEPBpfW06IGDO9zLMuBw3BqZtyyLiRPgIrzPWy/i4Lirzh22anWz6I610/
	IlpWuYC+39h1U/SikuCcTO9h3wIERYTAeGscR4ZOzUS+IwR5pmev0Tv93+OVsrDkL0kqBZ1sZKG
	R7KiAskcUS6abSfhC4FRdHGAQQuiV/64ZghM02SUBHSZ4eJuMaLTRPayS5dDxMieGnrDKTRNX7G
	oTzmSqLHqnEjbwcJqt8L1mk0WnvfDPuhG9jej95hZEkMF9m5IvFFRTWNFa+OhQsA20/h79V41Fn
	Uvdyh7zOUvM0XWTEsTnCG9MjqTWcNEQCNCBhexMM/SI41sjV2ClvRbI0LaSoB9gx7bZCdyy99dB
	KDV7/c3WoclPjHgKotJqj4/XxJtE8AR9NLiQl6BGiv84R9xaSgjtUjTkVGiNuH1iIklc27pGHA0
	9QjE6V18/3d5H/B0X+k+HXDQMCJ/9xDRIkCeZwkbbaH9FoEKNVRDOg96CVg/WLC+kKwSlvYOiih
	V76sTByvrfYLEOlVeyK5LIfKRuI0p6utI3pN+23us2QIxzVoFgPGQRYE6gP0nb8rQG9uUM/+9QN
	C5DFHkEHtu/PHQ0OYgbmWmV2lE7bsnaNBqtnXbM=
X-Received: by 2002:a05:701b:465f:10b0:1b2:48db:23dd with SMTP id a92af1059eb24-1b5568cfbcdmr28253412c88.16.1795880251716;
        Sat, 28 Nov 2026 07:37:31 -0800 (PST)
Received: from WannaCry ([2405:201:a418:c1d0:90a2:f39d:9eab:aa4d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ff27bsm75420907c88.6.2026.11.28.07.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 07:37:31 -0800 (PST)
From: Adhyansh Verma <adhyanshverma2010@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Carlos Llamas <cmllamas@google.com>
Cc: =?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <brauner@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rust_binder: decrement requested_thread_count on BR_SPAWN_LOOPER write failure
Date: Sat, 28 Nov 2026 21:07:19 +0530
Message-ID: <20261128153719.143637-1-adhyanshverma2010@gmail.com>
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

In Thread::read(), when more threads are needed for the binder thread pool,
self.process.needs_thread() is called to request a new looper thread.
needs_thread() checks that requested_thread_count is 0, and if so,
increments it to 1.

Subsequently, writer.write(&BR_SPAWN_LOOPER) writes the command to the
userspace read buffer. If this write fails (for example, if userspace
provided an invalid or faulting address), the error is propagated using
the '?' operator. However, requested_thread_count is never decremented on
failure.

Because userspace never received the BR_SPAWN_LOOPER command, it will
never register a new thread via BC_REGISTER_LOOPER (which is the only
place where requested_thread_count is decremented). Consequently,
requested_thread_count remains permanently set to 1. Any subsequent calls
to needs_thread() will see requested_thread_count != 0 and return false,
permanently starving the process binder thread pool from spawning looper
threads.

This mirrors the C Binder driver (drivers/android/binder.c), which
explicitly decrements proc->requested_threads if put_user(BR_SPAWN_LOOPER)
fails.

Introduce undo_needs_thread() on Process to decrement
requested_thread_count if the BR_SPAWN_LOOPER write fails.

Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
Signed-off-by: Adhyansh Verma <adhyanshverma2010@gmail.com>
---
 drivers/android/binder/process.rs | 7 +++++++
 drivers/android/binder/thread.rs  | 5 ++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index 1f4cb43f1de..a6d49e7dd84 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -1269,6 +1269,13 @@ pub(crate) fn needs_thread(&self) -> bool {
         ret
     }
 
+    pub(crate) fn undo_needs_thread(&self) {
+        let mut inner = self.inner.lock();
+        if inner.requested_thread_count > 0 {
+            inner.requested_thread_count -= 1;
+        }
+    }
+
     pub(crate) fn request_death(
         self: &Arc<Self>,
         reader: &mut UserSliceReader,
diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
index 4ce6fc53320..d36ecd12dfe 100644
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@ -1658,7 +1658,10 @@ fn read(self: &Arc<Self>, req: &mut BinderWriteRead, wait: bool) -> Result {
                 req.read_size as usize,
             )
             .writer();
-            writer.write(&BR_SPAWN_LOOPER)?;
+            if let Err(err) = writer.write(&BR_SPAWN_LOOPER) {
+                self.process.undo_needs_thread();
+                return Err(err);
+            }
         }
         Ok(())
     }
-- 
2.56.1
