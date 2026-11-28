Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.201
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795880138;
	b=nZfiTgI05e2Y9zWWRaIoa273q5CKUn1VnwqikIHTVGIlZyGMZ5o61Xoojfw2q5mZkTs1
	 Oq06tssEBrzbltjEU2gsN30J3s0lNP+5Nzx4GHFMW1LEnZHGjaZzC4ozIakDjh+QIoQXD
	 x2XAG7gU0On0qpx9wr5tQ6jrGb522m7rh3Aj6JsnBixgeUe90/vkOo6qe4HJTtoBo243/
	 P41tdZhYjr7XcTCQdxtuPumN5p9hm/cy5bq8OqeMQcrCuGAfqtJO3xkHUpp8xlFxv4pgf
	 jrUN7pjuruRShKjaCF4Nd8aa4cVm3BO407eeD9z/iu4eeVl8CGSABtKE5xPyxHlFXFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795880138;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CZb0j9sicCSTGTsmlIY6mXtGHjwJ55gV+/BGAPdHHjg=;
	b=AusUbCmWApDrCERJK2EBA5YnsC3XY1iJoQT5C+hg6uRgnUf9o9sHEgCeGqAIopC7oBlg
	 5nYjL8OEJhlEMZHsu+fMXBbNd7t63TZ3wUNb9xGovUsde1BjdLbIucRsM1c+dTobhUH3/
	 d2HinYwi62K5OeZukHqSNfFipW5T5AawttzByV9hOyJGg6MxOeJ9uphx/u+wHVwLwhci7
	 GKt863d5kkrq5eLmbpRjLsNKAzqUVjoMa+qQxH0ozRcWfKn8knsF4Zk1AGzGMFgYXTy2i
	 /Yo+lS6zRH0QciXw11BkVanEagPZ/2cgGuWk67R7wD/6+6i+3CpfozB+9MmhX16DwcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hk2F858F;
	arc=none smtp.remote-ip=74.125.227.201
Received: from mail-pi2-f9.google.com (mail-pi2-f9.google.com [74.125.227.201])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B11606A321
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 15:35:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63B11606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hk2F858F
Received: by mail-pi2-f9.google.com with SMTP id 41be03b00d2f7-cdb8dad8ea5so1761796a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 07:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795880138; x=1796484938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CZb0j9sicCSTGTsmlIY6mXtGHjwJ55gV+/BGAPdHHjg=;
        b=Hk2F858FAT06543sxVz3fX8rLlrNucwxMRhTvs1rvtku18NpGM0RQS2ohSh7GWv2EY
         jhX2mhQ1l2zDC0/Ml/CRYhyRmdSxOdLOLa5lawdQbJWT5tPI4Xsp0tKu2dXxZHyJ3NJJ
         D5ZV1K18PU50MZHnNks3PjBD6iGQruGRpeSgPDQu+PphpAEIpHO45Xe8scUyd4eqHdVL
         z90UCA8dqqorESxfVThdyIr751ME/N261spwG4/xkNkRwBPR+/3vPcGclqsvhwaR+mq0
         MMh6QIh8J70l+sSWP4GXr5XzgT7a82l6/eeF/d3mtEKqElKS83Ur+sLUIWr+dXYm7oHy
         XQ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795880138; x=1796484938;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CZb0j9sicCSTGTsmlIY6mXtGHjwJ55gV+/BGAPdHHjg=;
        b=esqCyNg2GiDSnoZNZY2Tg3E5UEg7Wd5uyPXHX5bwfd/HXDgr6BFxAY5sRjKmj0g7W9
         Cx5l8/V+al/xqF/i3p/Ju0QeDo/sKWWUz1e8B2su9JD1wHBeBrVYfCShs0Cqb+ZmbalV
         plNtRhdoqkbQV3f/XYE/DsDzFEeTbt1Q6j13OmLreOkKkZi3Vd75f0Vt6/xnYlMb8wXw
         GS+jxX1DCL+4C9SuSZSx3QYx1M6/9F4J1AFRFb1ST7ScMrNANnKwHp1YkfKun8Vqa3dQ
         gDQ6M3Ij7iAJddHyJVvldyiy0A1Q3I2ijHRR7p0L9u4o6d3Iy1jvxjpYR/g3qeSaF1yT
         J34A==
X-Forwarded-Encrypted: i=1; AL+hErHL5JEaQVnKGo3iL0Go0krUTOq5oGa12QXjQHBAn6a8/qOvcOPH09WLCjSjMhRswseORYtw1W85SCy5gQg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FgEXZxo5SS/nvYOpuJtiooAcS884WcJSM5x/aajdNLcHfZsJ9
	qYspUszeHttIfPZztpXX5ase7uvm8qa694HmMFgWPyK1ckrUSXFDHUI0
X-Gm-Gg: AZFdTZdzBfn5iiReypIGxI5rRlFsAFpY0H6E/fK6KSOgLzEznqM2LqXn9c1YOczayH3
	T7wWaP+xTbsge8p9LOEFjqL+Nk0dHCIbTsTOlMDwuTh2X5/Uo+0sHqNUdtSPcJOZKSX92SR4e+a
	uev4lLjXLyejqCzHzP3sJj8Bbi+Tu+4MOOJY0B7fBYfP9gYgH6aEuJubnXLL/rqVsCxqpT5kPpn
	Jal6xDQGNKJe+CWAbCWYezpcP+LhGSmmcudNXLlQ4rDJPZtX0oeCp2bhW7356Z0HcTpmMWVo29+
	V/t/V53fYWFaBgm9SdEz+0XZyoswst2l3/yJ+aR7xawnQFhfeloCmI+ag5mDmw3PBh87a9P7b57
	9mrZufe4lnQxHDaxPxefY2ydqn2V9x7dBylWaE3/dA3PTyQan2qv7u3MLHX6ex5yqKHPM5VYBHg
	VjbjSI+A9ceak1wJfBz08ZjSHfVme2J1jT+/qMS7vBXe7tyNCsLvVZ3apq8RGWKp6RHnvyUx3BJ
	lf5D4LJQL60kYpbXBLfAP6GpVphwPK2WnN37SKQ6qsIQnWQWZhMDfaiH0/NWZ5VlK3qzJxI4Nri
	t/yDKYRa7uyqLazMDdNw3FIUZaJ9GeT9EMVC4JU=
X-Received: by 2002:a05:6a00:179f:b0:8a0:70ff:ab2c with SMTP id d2e1a72fcca58-8c87daf62a7mr27305745b3a.57.1795880137569;
        Sat, 28 Nov 2026 07:35:37 -0800 (PST)
Received: from WannaCry ([2405:201:a418:c1d0:90a2:f39d:9eab:aa4d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm14098062b3a.21.2026.11.28.07.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 07:35:37 -0800 (PST)
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
Subject: [PATCH] rust_binder: return ENOMEM on shrinker allocation failure
Date: Sat, 28 Nov 2026 21:05:29 +0530
Message-ID: <20261128153529.143070-1-adhyanshverma2010@gmail.com>
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

In Shrinker::register(), __list_lru_init() is called to initialize the
list_lru. When it succeeds, ret is 0. Subsequently, shrinker_alloc() is
called to allocate the shrinker. If memory allocation fails, shrinker is
null and the error cleanup path executes:

    unsafe { bindings::list_lru_destroy(self.list_lru.get()) };
    return Err(Error::from_errno(ret));

Because ret is still 0 from the earlier successful __list_lru_init(),
Error::from_errno(0) is called.

Per rust/kernel/error.rs, passing 0 to Error::from_errno() is considered
a kernel bug. It triggers a pr_warn! warning ("attempted to create Error
with out of range errno: 0") and falls back to EINVAL instead of
returning ENOMEM to indicate the allocation failure.

Fix this by returning Err(ENOMEM) directly when shrinker_alloc() returns
null.

Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
Signed-off-by: Adhyansh Verma <adhyanshverma2010@gmail.com>
---
 drivers/android/binder/page_range.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/android/binder/page_range.rs b/drivers/android/binder/page_range.rs
index b0c797523bc..a1f432560a5 100644
--- a/drivers/android/binder/page_range.rs
+++ b/drivers/android/binder/page_range.rs
@@ -84,7 +84,7 @@ pub(crate) fn register(&'static self, name: &CStr) -> Result {
         if shrinker.is_null() {
             // SAFETY: We initialized it, so its okay to destroy it.
             unsafe { bindings::list_lru_destroy(self.list_lru.get()) };
-            return Err(Error::from_errno(ret));
+            return Err(ENOMEM);
         }
 
         // SAFETY: We're about to register the shrinker, and these are the fields we need to
-- 
2.56.1
