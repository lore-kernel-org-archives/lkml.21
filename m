Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795648305;
	b=rZXEYLzUut2DRP+3MTyE49eRBRUqbo9+kY4Bozg+iBVsW9oFGMvWVGOjQyOXwv+gGBdY
	 VobT63gGvUmkNilyh1s5SVrvqxrtXwvsLPHm55cPlG8jxz4JUlxKv3Kod7B2zDgngEEuL
	 PBS7dh9YeRKWYqQ0y54+Q5UFUWvQTkzt3xoebnRcfPh3c3+5w3an4w+I23vAYffgv92rQ
	 yF1zlRlvcwG8DI9ngWp508Fpchmtc1skPslXCILEv8jVLTLZ6/WjojWZEYWO1N3fSI/0P
	 l0Uj7gCskDSpPOjvQPcOyxaysSactR6Q1w404nSc0Gw/bdr6mtgbSjJsag0TBaQQHjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Q7ZUsp1hrrDcICCRItI94bCSWyJZ5L3LzBKk541X1yQ=;
	b=f7Lvgf2eHCpUgfyMgM/WMsP1PoLOHDgmuu43Ag/DSJ5YuvyJjlJzRnip4BGLNz3A7Xt7
	 sHSb0Po6o/hNLzn+eqQ25kXf3sUVew7RvII/LG4KuirOz5TusyYxHmhj6/EJ77dLehe6Z
	 4QqyAAo4T0GnGLhCd0APfeIU3/MBhdp9H1sUE5B9pvzFfz2S6Kjp7d4ATGnskiOZ9qLhe
	 ZWfDoUNjy0j4UJyaOROv2lf0uwwFBV7qDfBdICKHrzchdGa0nRxQQn3wrgp72vwaK+bEs
	 XZn+w/7BmRrWeNiF9uWE+S36iMYlzmsI4Rx9tgYZgzZLJk9WcQ0ISpyuB73binhqMZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KTtYghzT;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCEB606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:11:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DCEB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KTtYghzT
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-38431138772so8309662eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795648304; x=1796253104; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q7ZUsp1hrrDcICCRItI94bCSWyJZ5L3LzBKk541X1yQ=;
        b=KTtYghzT5mD1SNNLheKYtMCBcZ9F+4cg4AlpMsZuvxZjhLoDcqfvwhfZnkR0KG2VJz
         xbANemyEFx54MG5qekl7tP8XUD7lPYxPHzZ8bmLa9XSoh301JX8zVIMEl7IEQ1lz+2Gr
         ABKnvBQCvG8ynmwzHkQb22YF6AgY1RZTJgmKg27OXUGTrqHPSC7qjzpkl2qqzq0yzupw
         0atTLu4a5cB5w9KtXooLQEh7AyEwlNCijlnYnl3Q/82UNdHo4o2wFNIZ/VQ3xjkI2jlo
         529PSrkJOT2vrk9Za9nC67bG5ikMt61RejYjRQZot4GKbuuAGPQlb7mYUHN9AAnUjFuD
         y19Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795648304; x=1796253104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q7ZUsp1hrrDcICCRItI94bCSWyJZ5L3LzBKk541X1yQ=;
        b=iGM+vjKPO6awaFkw34L98amhy5zefKwmBeOYHPjRUNI7s+FqN1Qsey0yeaSSADjTJQ
         +nU8BgvfbE/r1yer5gB+LbjiBzH8Xfow+Uc45R2l+feMIoWbH+57jOSQT1NwdukWLGi4
         QElQCutqw3PpuZ75SjS5lFYdhbyywH+Gv/5uFt8u2c+mb0jgzBW0TSnnabqlbDuLI2PL
         jKu+l8mJfkBiTwXdKPGZFZJL7qPJ1gaZnsUwGzqviUaq4xh2jFAOrv++x3ppsp6JEMcO
         2Q8xhhmBkrWr7HfRJXeKHvNA9cpEXkHPerLwEUypRTyZE6r+w4iBh6N/vrJdBRElUJA5
         Wnlw==
X-Forwarded-Encrypted: i=1; AL+hErFCABqrj7a29f+IYHJYEvS3zZidf5fckY+yaCqSfWWDcquqz08S7g8VGgV994ku4GgHgB2Gx0ZIiWRSvrU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9eeqfTI63ObQufWNlnxwpcjlPwjiGv+t27dQmbtc7WvfpdP2VZ
	jRQhfVVcOMQkIaWfdEsAxK+4HFTSMTeplFmuKmNHVwGGSLXgAJg4vFEn
X-Gm-Gg: AZFdTZfSgBfQEjq+GxksQbP7GImVuhdngr5N0HrW1jGA0UVUprCizZSs/ox9pxh0qZi
	2S2cs+MJ2d2yzrq4Ma1B2K5Eo2Fo/ABgpFm8EwZsjdJkWrO4xy0wRa3RQIDpK1qdK1x5HJE5o/E
	6rTRcLkgFCcf9AZ9h5PhIWoo66E+PIyJKwSd+NBGnT7LK6DiNX7Hf0hCR7uZTA0JJCbyrzytXN9
	XLvPk1K2pYHkpsmLDHDJBTpSk0jroq0bP8oyTK7y+wJE0WtTbB05odwH2ryex28+Pb9YIM33Z3g
	3KlXVl9/rQ/SeM3TEF3945DRa/79R3yCI6WaEfsdv41h+mAHv1bK2ggR0mIl2iAQL0C47oZaSgm
	iOsSlNC8AHzCwU4LWVPh1oohL2i5sEpp6rHVW0szin7WBj314YB9VpMxBaxqLrX7uPVoZO2DOCF
	Nvk+aY1bFZAQnH99lnBDkg4nFIu/vVyorsNOm0gQdjvE21T1ZKeOMokH/pwiPcQQWmiUgHx4cy8
	HO65y+Ksz4vtqmGaOvIpCbayPxCk3xlxAc+i7l+0VmSwFngpjhJQhu550rhh3FKXhsVIK9XOavO
	0FXp6f/gx8hWeDhLY7V0QNuLBHRhHG1MhPYHSBqtqbHjCQaonzpCi215zoKLZBbWOEJLgXOK5uH
	AdmB7uj9aFg52N4rIquQ=
X-Received: by 2002:a05:7300:cc9c:b0:386:a217:aade with SMTP id 5a478bee46e88-386a217e7cemr14225508eec.29.1795648304307;
        Wed, 25 Nov 2026 15:11:44 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:f528:8797:fe51:9f7e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm64430145eec.26.2026.11.25.15.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:11:43 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 25 Nov 2026 15:11:19 -0800
Subject: [PATCH 6/8] platform/x86: thinkpad_acpi: convert
 hotkey_thread_data_mutex to a spinlock
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-thinkpad-acpi-hotkey-poll-v1-6-6dee57519c2e@gmail.com>
References: <20261125-thinkpad-acpi-hotkey-poll-v1-0-6dee57519c2e@gmail.com>
In-Reply-To: <20261125-thinkpad-acpi-hotkey-poll-v1-0-6dee57519c2e@gmail.com>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, Rong Zhang <i@rong.moe>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, 
 ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev

hotkey_thread_data_mutex only protects a few in-memory integer reads
and updates across hotkey_kthread(), tpacpi_hotkey_driver_mask_set(),
and hotkey_source_mask_store(), with no sleeping calls inside any of
its critical sections.

Convert it to a statically initialized spinlock_t
(hotkey_thread_data_lock), which also allows dropping the conditional
mutex_init() call from hotkey_init().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 58500b72d9d2..0ebaea0ab96b 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -67,6 +67,7 @@
 #include <linux/sched/signal.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
+#include <linux/spinlock.h>
 #include <linux/string.h>
 #include <linux/string_choices.h>
 #include <linux/string_helpers.h>
@@ -1814,19 +1815,19 @@ struct tp_nvram_state {
 static struct task_struct *tpacpi_hotkey_task;
 
 /*
- * Acquire mutex to write poller control variables as an
+ * Acquire spinlock to write poller control variables as an
  * atomic block.
  *
  * Increment hotkey_config_change when changing them if you
  * want the kthread to forget old state.
  */
-static struct mutex hotkey_thread_data_mutex;
+static DEFINE_SPINLOCK(hotkey_thread_data_lock);
 static unsigned int hotkey_config_change;
 
 /*
  * hotkey poller control variables
  *
- * Must be atomic or readers will also need to acquire mutex.
+ * Must be atomic or readers will also need to acquire spinlock.
  */
 static u32 hotkey_source_mask;		/* bit mask 0=ACPI,1=NVRAM */
 static unsigned int hotkey_poll_freq = 10; /* Hz */
@@ -2143,7 +2144,7 @@ static int tpacpi_hotkey_driver_mask_set(const u32 mask)
 	guard(mutex)(&hotkey_mutex);
 
 #ifdef CONFIG_THINKPAD_ACPI_HOTKEY_POLL
-	scoped_guard(mutex, &hotkey_thread_data_mutex) {
+	scoped_guard(spinlock, &hotkey_thread_data_lock) {
 		hotkey_driver_mask = mask;
 		hotkey_source_mask |= (mask & ~hotkey_all_mask);
 		hotkey_config_change++;
@@ -2446,7 +2447,7 @@ static int hotkey_kthread(void *data)
 	t = 0;
 
 	/* Initial state for compares */
-	scoped_guard(mutex, &hotkey_thread_data_mutex) {
+	scoped_guard(spinlock, &hotkey_thread_data_lock) {
 		change_detector = hotkey_config_change;
 		poll_mask = hotkey_source_mask;
 		event_mask = hotkey_source_mask &
@@ -2469,7 +2470,7 @@ static int hotkey_kthread(void *data)
 		if (t > 0 && !was_frozen)
 			continue;
 
-		scoped_guard(mutex, &hotkey_thread_data_mutex) {
+		scoped_guard(spinlock, &hotkey_thread_data_lock) {
 			if (was_frozen ||
 			    hotkey_config_change != change_detector) {
 				/* forget old state on thaw or config change */
@@ -2726,7 +2727,7 @@ static ssize_t hotkey_source_mask_store(struct device *dev,
 	if (rc)
 		return rc;
 
-	scoped_guard(mutex, &hotkey_thread_data_mutex) {
+	scoped_guard(spinlock, &hotkey_thread_data_lock) {
 		hotkey_source_mask = t;
 		hotkey_config_change++;
 	}
@@ -3329,10 +3330,6 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 	TPACPI_ACPIHANDLE_INIT(hkey);
 	mutex_init(&hotkey_mutex);
 
-#ifdef CONFIG_THINKPAD_ACPI_HOTKEY_POLL
-	mutex_init(&hotkey_thread_data_mutex);
-#endif
-
 	/* hotkey not supported on 570 */
 	tp_features.hotkey = hkey_handle != NULL;
 

-- 
2.56.1.839.g22a8290db9-goog

