Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596495;
	b=CrERQ2bI8nCQ1azHfgfm7OqlaSOzVIDMpqtcN45EE0eIugAJKobvBnElO/v4QJjYP45x
	 1jNITSJN8rs3DMKwdSFut3Us0oI6A7CcAi9y1CgTovu835KOpaK8xtcWd9VGIlqNOk16n
	 g/OWQv4b3JpcrlKbJB0JxBznBrifBp35Z9G16lEq+NZGWmiHnD4Wl0//5/+//Dr8/N5i+
	 4DdHwxn1CuW1XamLbo/TZ4A3xroQz4lXLiAjs0eAqBxC+q+fM+Xa4ApCMcuwGey4EscLp
	 TediKD2NLS6g54kXkVqEkJI7V0/PcfpwaH5esJbsO2LAx5pfGHsBVgYjwHrSrVtczIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wv9c8S5oFF0tJwBxIAPQ2CpHZNWF2YXmchzsVyS3ZOg=;
	b=Qi9OXcCmALdoJhjJyHDVfxlR3zqbQqYP8c4eMGXO61Xby+UcuXfppH32bn70pP/2/qvr
	 SsMwKsa72JemcsoY82+xtS9PMuQh9fkPMpa+PNVDvJdsSQMX+6j/vDN1Mq5WaMi47Ajxv
	 WAI8Hb4IEVVA5FBm/n80syijOi8Fd4YkIeTtEYEriMlmHP7pnCm5hAKoOsruJfmrKNxsE
	 dR9qXDbyW7cDna+sVA4v0ReQ7Hh66uX9S9tY/XithZeuv/kHoxhXstqLkP7KXE+96uzVf
	 5RVv+588BAzWS9IJOagXfnjY7SfSMnk5JNGC9lwrVGrOwYgSzdr42Cut2zqtNWxzOuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TENQTGKO;
	arc=none smtp.remote-ip=74.125.229.4
Received: from mail-dy2-f4.google.com (mail-dy2-f4.google.com [74.125.229.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192E5606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:48:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 192E5606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TENQTGKO
Received: by mail-dy2-f4.google.com with SMTP id 5a478bee46e88-36f2f262b19so2020603eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795596494; x=1796201294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wv9c8S5oFF0tJwBxIAPQ2CpHZNWF2YXmchzsVyS3ZOg=;
        b=TENQTGKOk6g7kZ9FlbbGSf1mfOxsE4KdhEi4uBuv6FblPFCagzMtMYAhrIOtlqTdGp
         oZRX8JuntDuRfyqeWy4QE0EK0fdyN/bmkpqSlfpWWNx5ax9ZlYIdae+8Agz9kmb+bEsE
         ngSXEqXjxmIsyrMh3ciZyq7EKMUN1VQQqaU04fHJ7T09wYcWfVcR3yrJCeeyutVBEDWa
         g5F23NSaKzIsNSVPXpSr66u1PyekeKjQDgPrlO/exthUpqZDrmLMEhOb0c2neMZ4trOf
         h0kmobjg0rvjzTxSI9EV65MbB9L+Jj6QH5Yc21isYEFuqvh+7zFfpHTF1BY0eFjCdtOl
         9T0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596494; x=1796201294;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wv9c8S5oFF0tJwBxIAPQ2CpHZNWF2YXmchzsVyS3ZOg=;
        b=ef2Z39YSHdZ70+1sRNVI5MfwQa/FcJvHLMVeWeJVJu7aIla3XFIaD/i66vH+nUptzo
         ijo5IfeimndiHIT6u4bOC7lq8572w1OZ29/8gBla8EMJESTZ3C8Joum6wS/Z0JOg32M/
         COhSRAIpc8NwhihkWl3gTat6FDsIyqBok32EToZgirFNiLN6Y1Lpw1+xxD9oSnjr83Nr
         jKlrEySVTZczz5y7zux/86giLohso8bgLggBvpcJL9A9wH1z0VQn7DAV4wA4QpE6FkeN
         MotUJ848KNqc7X9Q/f+pI/IK6LQsDvbPaphfT0vQsrP9AFbJNvMqChrHDfuhBIy9w2Cj
         Jj+g==
X-Forwarded-Encrypted: i=1; AL+hErFecCNA3JWMfWOVpjeuLHlkrxsR+UwGq02wpI6/O/UrkCUr/NEGgsDxAWEq2rDSs3A6RpRujCEL8GOoYfk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BWlAVflRvl86GVH0ieqMc+oevwIq+ZQfjt/7f0wg0Lp41zc1f
	HE8+XzKtgj6xs3lTedDZHXUnCnG1sOKfYaByCnEjOEZTtvk9Q1YdMM4wesbhQngLNUD5sQ==
X-Gm-Gg: AZFdTZe8jpyNDmStHSKUaQRFuBOC9lCc25ZAjemwxZO0u0ZHvbZFZyzlryRPYlRM4S7
	gx3kq32xHHoG53rzVhmbcxpihyOIeA3r8AYGLntlkUz3hKaBSSbzW2BHMeDAG2osv8UFjE31GOV
	pi/210BoxGc5ieEGuknyM9y+yAH+PzxxyYSySw2nXQQGZo0yl+DVJcXdlZaqjgJx4Vzs9BMU9oL
	pA7EMZcLR2bfTQaAPnz4Y9/Hy7X8LoOxRKWJQUJAG2CExe11rwFX5oMgEZnDz9+euuRa5WW8vSe
	mwf2jyGvcc6xC3OPEBX+ur25qreSm3bFZPCh6vp9dmjb1sSRNvgNybrfFCyvUoEb7cVKUPqJzHS
	HxqiXDidQ/iagQkCAE8tFaEgsjECqj9JHVmL2TFUl8lJXVG0eg/lC/qnyXyAMfKI1H7YPiWLlBS
	8pFc8Kjcdc1alsXdAOD0P8SdIURpO7botSz5oTBzIwzH0MWWbDFv2BFcps4MuPGAfwZeMHBJFuS
	CplkHiZaqc6OraHkn4ImYqFl2z9TQ1Ucal0Qsf54IEVk2q4kYTdS9UUfbPLh/dpGO5nm1Yp1dUS
	4+TscX9Y63SZ3q/YDP2FmB0Nub4z
X-Received: by 2002:a05:7300:b089:b0:386:9c9f:83d8 with SMTP id 5a478bee46e88-3869c9f86bbmr14134981eec.17.1795596494078;
        Wed, 25 Nov 2026 00:48:14 -0800 (PST)
Received: from ThinkPad ([192.220.23.71])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm18879252eec.9.2026.11.25.00.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:48:13 -0800 (PST)
From: Qiling Zhu <kmatzkaczor244@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Rong Zhang <i@rong.moe>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	linux-leds@vger.kernel.org,
	vishnuocv@gmail.com,
	vsankar@lenovo.com,
	Andrea Rabbaglietti <rabbagliettiandrea@gmail.com>
Subject: [PATCH v4 0/6] platform/x86: thinkpad_acpi: Add a keyboard backlight auto-mode trigger
Date: Wed, 25 Nov 2026 16:46:37 +0800
Message-ID: <20261125084644.137506-1-kmatzkaczor244@gmail.com>
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

Hi all,

On supported ThinkPads, Fn+Space can select automatic keyboard
backlight control.  This series exposes that mode through the private
LED trigger "tpacpi-kbd-auto".  The first patch fixes an out-of-range
brightness value that was reported to make UPower stop tracking hotkey
changes on a ThinkPad X9-14 Gen 1.

This is v4 of the thinkpad_acpi keyboard backlight auto mode series.
Many thanks to Rong, Mark and Vishnu for the reviews and the firmware
side answers so far, and to Andrea for the report behind the first
patch.  I have tried to follow the v3 comments one by one; where I was
not sure how to read a comment, I say so below and would be glad to be
corrected.

As Rong asked, this version starts a new thread.  For reference, v3
is here:

  https://lore.kernel.org/r/20261114174814.62153-1-kmatzkaczor244@gmail.com/

and my reply with the sleep test data is here:

  https://lore.kernel.org/r/av14Sp6_nKwU5F-i@ThinkPad/

The series went from seven patches to six: the two suspend/resume
patches of v3 are replaced by one, which now sits before the trigger
patch.

  1/6  Report auto keyboard backlight mode as off          (stable)
  2/6  Extract kbdlight notify helpers                  (refactor)
  3/6  Don't poke keyboard backlight's LED core brightness (writes)
  4/6  Restore keyboard backlight level ourselves       (sleep/wake)
  5/6  Detect auto-mode capability via MLCG             (groundwork)
  6/6  Add a keyboard backlight auto-mode trigger         (feature)

Changes since v3, by comment:

- 1/6 does the mapping in a small helper with an int return type, as
  Rong suggested while reviewing the trigger patch; 4/6 reuses the
  helper for brightness notifications.  With 1/6 on its own, on kernels
  that still use the LED core suspend/resume path, a backlight that
  went to sleep in auto mode comes back off after resume, where the
  unmapped value used to be written back; 4/6 restores the level the EC
  had.  I kept 1/6 small so that it can go to stable on its own, and
  would like to hear if this trade-off looks wrong for stable.

- 2/6 takes the title Rong suggested, states the locking contract with
  lockdep_assert_held() instead of a comment, and drops the braces.
  The helpers are placed where the later patches need them, in the
  hope that no later patch has to add a forward declaration.

- 3/6 takes Rong's title.  Of the two software write paths, only the
  proc path reports changes through brightness_hw_changed; the sysfs
  path just writes the level and updates the cached one.  Fn+Space
  changes continue to be reported.  The text after the --- line is my
  attempt to explain why leaving the LED core's cached brightness alone
  seems acceptable to me; if the reasoning there falls short, please
  tell me.

- 4/6 replaces v3 5/7 and 7/7.  With the driver unloaded on my
  machine, the backlight went out when entering s2idle and
  hibernation; on wake from s2idle the EC was back at its previous
  level, and on wake from hibernation it was at 0 for each of the four
  starting levels.  So kbdlight_suspend() is gone and kbdlight_resume()
  writes the cached EC level back on resume, for every model rather
  than only auto mode ones.  The cached level becomes the raw EC level
  in this patch, so that resume treats the auto mode like any other
  level.  I did not add a check on LED_SUSPENDED: this LED does not set
  LED_CORE_SUSPENDRESUME, and with the suspend callback gone I do not
  see what would set the flag for it; my understanding of Rong's reply
  was that such a gate might not be needed.  The patch comes before the
  trigger patch so that no intermediate commit has the trigger together
  with the old LED core suspend/resume path.

- 5/6 uses a symbolic name for bit 20, as Rong asked.

- 6/6 routes trigger activation through the helper that also updates
  the cached level, which I believe addresses the stale cache Sashiko
  reported.  It also skips the trigger notification when the trigger
  could not be registered, pulls the registration into a small helper,
  and still makes the trigger the default one at init when the EC is
  already in auto mode, now with a comment on the case this is meant
  for, as Rong suggested on Nov 19.  The title was changed to say more
  precisely what the patch adds.

On the Reviewed-by tags: the changes to 1/6 and 5/6 are small, but the
diffs are no longer the ones Mark reviewed, so I dropped his tags there
and noted it under the --- line.  Mark, when you have the time, could
you take another look at these two?

I could only test on a ThinkPad X1 Carbon Gen 14 (linux-next
next-20261030): the software paths (selecting and dropping the trigger,
brightness returning -ENODATA in auto mode), the trigger following
Fn+Space in and out of auto mode, and suspend/resume from manual
levels and from auto mode, with s2idle and with S4.  No S3-capable
machine and no other model was available to me, so testing elsewhere
would be very welcome.  Vishnu, Mark, thank you for offering.

One observation from testing with a desktop session, since it can look
like a driver bug at first: the level restored on wake was sometimes
overwritten again a few seconds later.  KDE's power management writes
back the keyboard brightness it last knew about after resume, and a
level written directly through sysfs does not appear to reach it;
changes made with Fn+Space or through the desktop itself did not seem
affected.  I do not think there is anything for this series to do
about it, but I wanted to mention it.

One naming note: kbdlight_brightness now holds the raw EC level,
including the auto mode, rather than a brightness; a comment above the
variable says so, and the name is unchanged.

The only checkpatch.pl --strict warnings I see are for three commit
IDs that are missing from my shallow clone.

This series was developed with LLM assistance; I reviewed every design
decision against the framework sources and validated the behavior on
real hardware myself.

Regards,
Qiling Zhu
