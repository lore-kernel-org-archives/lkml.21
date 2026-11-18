Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794965993;
	b=qF+TKFzUo6h/ee1ncvyGn3sE3BjLKAugNBYiaU5Dwjri2zmjqy2HHbwB0QWZO+C0CwHV
	 XGvoY8cBHamO8KCpNraFESBn1FXw+KIlo5EsCnVqTJK1HWoWjKQoDV5N2o3x5hpxeGl+6
	 1Hp7PP9Eteq1Z1X+qJX+RPsl0mEXy1c9FgjZOLyLM41qwVNnAx7unUKuLJG+txhd6LJiG
	 AeMifNqhfd96H9mk78xVVEcW/p1+v74+MQ1Uz5yFwIR9SlKQ6AON1vob9di9Ao6AZsmai
	 jcdkAX7nKCtaUA/080tmmDDo8r1fCpytL+mjvnoWzIJ0DoGXyjrg0tZitazL+6LQ70w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794965993;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FL8ANFon5ENqSX4yIKoBGka1UPTwcod4PyctvSZRjZw=;
	b=5H9zVaOy9NW9nV12x/88O6xwDrFAE6nZ6K8JLqdqPfL0i2nYSArjDNirX/C1HbwwDtXj
	 BW1wzBaAwKIGaPBBhSWQgknawnmTrRMHnLYQ2BfZK/+pA/d2zU66s1pHoQsNcyHdyEbZe
	 sasdP7FZCEpVVZv9FwTpPcYlx2dNXHuoGaxUhLBkmx56gVXN9mRhTkXR6bG6NWsODpG4K
	 oSe9BKw2QzgTn862efmq61KbTV1669uKPssBvf2k0yQcfDJprioYXQcicws7N+iK5JMuS
	 Jx0Snevyq1ZTe9KyEL2j8uZJvpiCpEx/IbEoOWoieoDYuCk8/ovZXqBjz2qdZMf0/Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z0i46jbq;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5849606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:39:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5849606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z0i46jbq
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-382f4710a17so104658eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794965992; x=1795570792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FL8ANFon5ENqSX4yIKoBGka1UPTwcod4PyctvSZRjZw=;
        b=Z0i46jbqd+POen/ZXqTyzeTffdj1k8yTXWlkyzmsObqg2cf5UOo1N+JpxMxvtWJ6rw
         hDfIRvrr65N6i71+9rTmikR+v2WvKYolNHy7nfLOEeTitg/MnO2hq45QSk60k2JUapch
         uNyv2BsH5XPbvrNl1OC2ciDyxSe/5/j9KSwS4d2Q0MlBFpS9y6J53q2AIF/khyQ/eKYS
         oXLLl8FPj62A7hyJ+tpH5X2az0P/NoiFZ1jyOCfCn7VCv0Xh1KglNomqu0GYtqmT4ael
         4+NeXj+kt48LnO9EQMwM1NeIEdsMn6S/zwMNSfEpRXnVg4VnnN1EahWNDgm8j7NgXBF1
         zHTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794965992; x=1795570792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FL8ANFon5ENqSX4yIKoBGka1UPTwcod4PyctvSZRjZw=;
        b=XUl+UlN94TrhVQBypGWiJ+F3fiHwFIAoPc2N0UjesUkbIkx6tX4NcTT2tIZb+AKomK
         as++8hn9tVdZgEaT1Sn0ZvuNEqjK+v0DZDJfym7AbgRQUu09Dkm6HVyHIbDPywa0vn+6
         mxGvZonNBSU0dPK99z2R8y+NPJqVM3SA9s0Niwp0PwEVZNMhNjOB6on1RkZyi9nHWQiQ
         3Jz19MnX1KHnq/r4mhc3lO4WLrqVWbkk6QbbVn1HMJBllRKslKYJKyXRe40weHTNFwBE
         th0UAp3YjawY2clasE2dGMDsAwkktY0q1aXOh+uWcfWDVWlQ1PAsvK6+M5XMfa/w4gg2
         92tQ==
X-Forwarded-Encrypted: i=1; AL+hErEAhn9biN0F5Q81jvV4YgzOlPKrX4sm91G4LMRy3RJWHPVcz8xSomcRPZMUcCcAW37bfhtje7+UJyY5tSk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yZsgZUGQt0XnIfKWEdjo28Go8KwSTYTgH6uGK56WmzlwdvK+I
	n1e+Huj03rFBx/hARtGA5LemIs2Kb25h3sgd+FvhUDO7PusVK8VqmXWJ
X-Gm-Gg: AZFdTZdV8/TtsJdyKLqOtL153vG/BlTYPvC/Xig8CoTMGSIEQIUod5Er8QbsbX98iIs
	UkqgNEZPZc0do+L38+KZ/iM8G6EGkmw41Yei2q87yw3VJR9W+43ofrCynL8j5BBMmj0U0nETU0v
	/stLkbUjExCBS44DFO2kLe0hzTXXNZu7ZZBrDSiiWnPh/H8Dt9SuJr8DSXkPki8xhcQQosdaXBw
	2oBWODM2A50Rzwu4EOUJMU3qV5VD3vQa0tF0NxpxRxBvh5BXIRu3Y0yK5DnK+1ZXYo857CYwMr6
	bbOxhGmtx/MvmkrAYbHpcTIez45yORKV/jSXmEez87/2oNiDoKdO872KIe2MxWknzJWmR++ueAL
	Rj8U7iICwtSadlkU8ozLBA8zP3rJEt+Ril8DOCspUPJkFKEmWfGF5zP3wCRhLEPmtEgctdbbni2
	smzCSIj1ihTJ91vBWCXNtm1pwHAJoOyvi7BnrOea3oQ3VdlsRSTEFL020cVk8O/B4AuD3+W0a/o
	r+qnX7CxA1FPZxMI6E57J0hyNOth+9Aobjff6SlDYK6ywWoAQkBLL0gayTDt/xxgoQ9NQr3Lc8o
	Qv86dU/BJzcNNsDUaKzd9R47W0XSGls0udyLcDMtW3ZdVwlEJF1jVWx3RHPTZ/cG136xkNBpwd6
	Ms9lsAGBMfDxbxvcyFUZ1fXA7crOeWfCtIx16ew==
X-Received: by 2002:a05:7300:f793:b0:369:daea:812a with SMTP id 5a478bee46e88-3828171b3a5mr828476eec.30.1794965991709;
        Tue, 17 Nov 2026 17:39:51 -0800 (PST)
Received: from overlord.home.arpa (ip68-107-67-45.sd.sd.cox.net. [68.107.67.45])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a79c96b2sm2141942eec.24.2026.11.17.17.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 17:39:51 -0800 (PST)
From: jasmeet.bhatia.us@gmail.com
To: tiwai@suse.com
Cc: perex@perex.cz,
	g@b4.vu,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Jasmeet (Jazz) Bhatia" <jasmeet.bhatia.us@gmail.com>
Subject: [PATCH v2] ALSA: usb-audio: Reset Blue Yeti firmware 0.20 after system resume
Date: Tue, 17 Nov 2026 17:39:48 -0800
Message-ID: <20261118013948.73155-1-jasmeet.bhatia.us@gmail.com>
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

From: "Jasmeet (Jazz) Bhatia" <jasmeet.bhatia.us@gmail.com>

Blue Yeti Classic microphones (046d:0ab7, bcdDevice 0x0020) may
remain enumerated after system suspend/resume while capture fails with
-EIO.  USB resets, unbind/rebind and USB_QUIRK_RESET_RESUME do not
recover capture on this firmware.

Send the device-specific AudioControl SET_CUR command to restart the
Yeti's MCU and USB logic, allowing it to disconnect and re-enumerate.
Since the command disconnects the device, defer it to a freezable work
item after the last ALSA interface completes its system-resume
bookkeeping instead of sending it inline from the resume callback.

Keep a single work item in the card, avoid overlapping reset requests,
and serialize scheduling against the disconnect shutdown transition.
Drain the work item before ALSA resources are released.  On a failed
control transfer, allow a later system resume to retry while the device
remains connected, without immediately requeuing the running work.
Disable runtime autosuspend for the affected firmware so that a
runtime-suspended interface does not bypass this system-resume path.

On the affected device, five consecutive system suspend/resume cycles
caused automatic disconnect and re-enumeration, with capture working
without a manual replug.  Unplug/replug and suspend while unplugged
followed by reconnect were also tested. ftrace confirmed that the
firmware-reset worker completed in about 2 ms.

Signed-off-by: Jasmeet (Jazz) Bhatia <jasmeet.bhatia.us@gmail.com>
---
v2:
  - Rebase onto ALSA commit 01f46c3244c9.
  - Use one embedded work item per card instead of dynamically
    allocating work and managing module references.
  - Queue after ALSA system-resume bookkeeping completes.
  - Synchronize reset scheduling with shutdown and drain work
    during disconnect.
  - Retry failed transfers on a later system resume.
  - Disable autosuspend only for the affected firmware.

v1: https://lore.kernel.org/lkml/20261021231754.16928-1-jasmeet.bhatia.us@gmail.com/
 sound/usb/card.c     | 17 +++++++++++++-
 sound/usb/quirks.c   | 61 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 sound/usb/quirks.h   |  4 ++++
 sound/usb/usbaudio.h |  6 ++++++
 4 files changed, 87 insertions(+), 1 deletion(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 59979b7..e681cb8 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -756,6 +756,7 @@ static int snd_usb_audio_create(struct usb_interface *intf,
 	atomic_set(&chip->active, 1); /* avoid autopm during probing */
 	snd_refcount_init(&chip->usage_count);
 	atomic_set(&chip->shutdown, 0);
+	snd_usb_init_resume_quirk(chip);
 
 	chip->usb_id = usb_id;
 	INIT_LIST_HEAD(&chip->pcm_list);
@@ -767,6 +768,8 @@ static int snd_usb_audio_create(struct usb_interface *intf,
 	INIT_LIST_HEAD(&chip->mixer_list);
 
 	snd_usb_init_quirk_flags(idx, chip);
+	if (snd_usb_yeti_fw_020(dev))
+		chip->quirk_flags |= QUIRK_FLAG_DISABLE_AUTOSUSPEND;
 
 	card->private_free = snd_usb_audio_free;
 
@@ -1104,12 +1107,20 @@ static bool __usb_audio_disconnect(struct usb_interface *intf,
 				   struct snd_usb_audio *chip,
 				   struct snd_card *card)
 {
+	unsigned long flags;
+	bool first_disconnect;
+
 	guard(mutex)(&register_mutex);
 
 	if (platform_ops && platform_ops->disconnect_cb)
 		platform_ops->disconnect_cb(chip);
 
-	if (atomic_inc_return(&chip->shutdown) == 1) {
+	/* Exclude new reset work before waiting for pending work to exit. */
+	spin_lock_irqsave(&chip->resume_reset_lock, flags);
+	first_disconnect = atomic_inc_return(&chip->shutdown) == 1;
+	spin_unlock_irqrestore(&chip->resume_reset_lock, flags);
+	if (first_disconnect) {
+		cancel_work_sync(&chip->resume_reset_work);
 		/* wait until all pending tasks done;
 		 * they are protected by snd_usb_lock_shutdown()
 		 */
@@ -1248,6 +1259,7 @@ static int usb_audio_resume(struct usb_interface *intf)
 	struct snd_usb_stream *as;
 	struct usb_mixer_interface *mixer;
 	struct list_head *p;
+	bool system_resume = false;
 	int err = 0;
 
 	if (chip == USB_AUDIO_IFACE_UNUSED)
@@ -1291,12 +1303,15 @@ static int usb_audio_resume(struct usb_interface *intf)
  out:
 	if (chip->num_suspended_intf == chip->system_suspend) {
 		snd_power_change_state(chip->card, SNDRV_CTL_POWER_D0);
+		system_resume = chip->system_suspend != 0;
 		chip->system_suspend = 0;
 	}
 	chip->num_suspended_intf--;
 
 err_out:
 	atomic_dec(&chip->active); /* allow autopm after this point */
+	if (system_resume)
+		snd_usb_apply_resume_quirk(chip);
 	return err;
 }
 
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -11,6 +11,7 @@
 #include <linux/usb.h>
 #include <linux/usb/audio.h>
 #include <linux/usb/midi.h>
+#include <linux/workqueue.h>
 #include <linux/bits.h>
 
 #include <sound/control.h>
@@ -1708,6 +1709,66 @@ int snd_usb_apply_interface_quirk(struct snd_usb_audio *chip,
 	return 0;
 }
 
+/* Blue Yeti Classic firmware 0.20 stops capturing after system resume. */
+bool snd_usb_yeti_fw_020(struct usb_device *dev)
+{
+	return le16_to_cpu(dev->descriptor.idVendor) == 0x046d &&
+	       le16_to_cpu(dev->descriptor.idProduct) == 0x0ab7 &&
+	       le16_to_cpu(dev->descriptor.bcdDevice) == 0x0020;
+}
+
+/* The device-specific SET_CUR command reboots the MCU and USB device. */
+static void snd_usb_yeti_reset_work(struct work_struct *work)
+{
+	struct snd_usb_audio *chip =
+		container_of(work, struct snd_usb_audio, resume_reset_work);
+	static const u8 reset_cmd[] = { 0x00, 0x09, 0, 0, 0, 0, 0, 0 };
+	int err;
+	unsigned long flags;
+
+	if (atomic_read(&chip->shutdown))
+		return;
+
+	err = usb_control_msg_send(chip->dev, 0, UAC_SET_CUR,
+				   USB_DIR_OUT | USB_TYPE_CLASS |
+				   USB_RECIP_INTERFACE,
+				   0x0a00, 0x1900, reset_cmd,
+				   sizeof(reset_cmd), USB_CTRL_SET_TIMEOUT,
+				   GFP_KERNEL);
+	if (err && err != -ENODEV)
+		usb_audio_warn(chip, "Blue Yeti resume reset failed: %d\n", err);
+	if (err) {
+		/* Retry only on a later system resume if still connected. */
+		spin_lock_irqsave(&chip->resume_reset_lock, flags);
+		if (!atomic_read(&chip->shutdown))
+			chip->resume_reset_queued = false;
+		spin_unlock_irqrestore(&chip->resume_reset_lock, flags);
+	}
+}
+
+void snd_usb_init_resume_quirk(struct snd_usb_audio *chip)
+{
+	spin_lock_init(&chip->resume_reset_lock);
+	INIT_WORK(&chip->resume_reset_work, snd_usb_yeti_reset_work);
+	chip->resume_reset_queued = false;
+}
+
+void snd_usb_apply_resume_quirk(struct snd_usb_audio *chip)
+{
+	unsigned long flags;
+
+	if (!snd_usb_yeti_fw_020(chip->dev))
+		return;
+
+	/* Keep queueing atomic with disconnect's shutdown transition. */
+	spin_lock_irqsave(&chip->resume_reset_lock, flags);
+	if (!atomic_read(&chip->shutdown) && !chip->resume_reset_queued) {
+		chip->resume_reset_queued = true;
+		queue_work(system_freezable_wq, &chip->resume_reset_work);
+	}
+	spin_unlock_irqrestore(&chip->resume_reset_lock, flags);
+}
+
 int snd_usb_apply_boot_quirk(struct usb_device *dev,
 			     struct usb_interface *intf,
 			     const struct snd_usb_audio_quirk *quirk,
diff --git a/sound/usb/quirks.h b/sound/usb/quirks.h
index 0a723c2..2b0ce93 100644
--- a/sound/usb/quirks.h
+++ b/sound/usb/quirks.h
@@ -15,6 +15,10 @@ int snd_usb_apply_interface_quirk(struct snd_usb_audio *chip,
 				  int iface,
 				  int altno);
 
+bool snd_usb_yeti_fw_020(struct usb_device *dev);
+void snd_usb_init_resume_quirk(struct snd_usb_audio *chip);
+void snd_usb_apply_resume_quirk(struct snd_usb_audio *chip);
+
 int snd_usb_apply_boot_quirk(struct usb_device *dev,
 			     struct usb_interface *intf,
 			     const struct snd_usb_audio_quirk *quirk,
diff --git a/sound/usb/usbaudio.h b/sound/usb/usbaudio.h
index c6d5921..1ef0f33 100644
--- a/sound/usb/usbaudio.h
+++ b/sound/usb/usbaudio.h
@@ -7,6 +7,8 @@
  *   Copyright (c) 2002 by Takashi Iwai <tiwai@suse.de>
  */
 
+#include <linux/spinlock.h>
+#include <linux/workqueue.h>
 #include <sound/core.h>
 
 /* handling of USB vendor/product ID pairs as 32-bit numbers */
@@ -43,6 +45,10 @@ struct snd_usb_audio {
 	unsigned int system_suspend;
 	atomic_t active;
 	atomic_t shutdown;
+	/* Protects reset queueing against concurrent device shutdown. */
+	spinlock_t resume_reset_lock;
+	struct work_struct resume_reset_work;
+	bool resume_reset_queued;
 	struct snd_refcount usage_count;
 	u64 quirk_flags;
 	unsigned int need_delayed_register:1; /* warn for delayed registration */
-- 
2.47.3
base-commit: 01f46c3244c9df036f751d12e4d2037a029f3891
