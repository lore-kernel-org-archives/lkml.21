Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795137112;
	b=qsqPzVcfuNTpMQV3Qp6+sdtOXtobCz/zXcuwpH3PINLljLAkCEOQJdZvTW9K1ZVXGRCP
	 F+cr9LjK8gHk7+9GJCAEtabuXQ0nkGsAKyPdMkbNaO0ZCd7vd4glaJ/qtL0wNlmtBAHz9
	 4qzpP+BrstEdMbMJe/IvOdH16xvEHJXXl0p7v4ZvsHBhZWI14Ndb/YXIvaW4QjZDfZSMF
	 +nCSE8NpS51YSemUdwR0J7qgJM2ySI2O7x4dPBoMFPeOnAnbkqF4gNuVMwtEWF5eDUuB2
	 5J1Az+DyFxRKIH7d6m6GUZagy0E6J/nYV+vjuM0PWJ0mYNG5atP5nzo2iBgnSdnfiHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795137112;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=+WauXmzgjTADvjBBTuDw9ddxWh3mS9R+yZFc6+jn+U4=;
	b=gHvoCjZohTsGer9UI9ROkDODg1Cq33bdSkEf6Wmz2UvDKAn5WrebJ25XViVGPxFlHi5D
	 phR++h//lfQeFhSkpXHM5loBPeUmwLBa1Q2Ffbme74TxhoLXj8/koG5WVcIamdZvlcrmH
	 WfEpBLXcfe4Dt24QWvH714t3rm9Rt+9T533GFl7JlsWYv1+MRYRZf8C6kDI8chTYhnB+v
	 ldgsE0rJYiFYFIzg7I0AYj7UhLSePfGxyAsHY+vykMEQnWoV7dtC73ifxekEB9UmUoSqa
	 aMzwBkw9A2M0UhqANOcfJrYe1Ad7+etBoEYecOjUhpW2OvGFia5ujbZtdg17UUXA8rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AsJxZNms;
	arc=none smtp.remote-ip=74.125.227.136
Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70781606A326
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:11:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70781606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AsJxZNms
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-3b40283c001so86561a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795137111; x=1795741911; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+WauXmzgjTADvjBBTuDw9ddxWh3mS9R+yZFc6+jn+U4=;
        b=AsJxZNmszeOmf1P6FoD0ZvPkULx6VuhNHhNoP35uartk7q3/nSMkJlYOf6yueuMrlI
         5rUFjDiLJpw3jewnIekcwE8Fb/ABsrk3cWYcbWo/qMDSk/kCrTnzfmyJ4ZaeMr5v9fY8
         zpt8AVlZVCuJhBXKzglnK6saQp3dvp9lXhoAoPmapLCth8xICO+5rUPc+BER5EqBJapn
         CiHl7pFqBHYMnE7x+uDF+IOOddA3ragPxAk1EgAtVDKg6dpGW7BGex6yUqBFRRVVIXzE
         oAfIhFc0kAsegIkD1PfBMLJa9+3/W4AoUIH4ChL5qWACy8FxfpS+Nf1Zk+RPTNgMnvQs
         6vWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795137111; x=1795741911;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+WauXmzgjTADvjBBTuDw9ddxWh3mS9R+yZFc6+jn+U4=;
        b=aqNxXs3yEH9ygpIsptwK8gVxqynL8l/+vNB3rc2hGtY6yCs3NqJvXOfnI13aTZxrxC
         J6of+D12iE7w5KOGPyHhG/drsy1WFciN2T/YhnZnaGtjaCThgyhdsYABEmbnyu8yMFak
         EWMj+I4LxtU+CtG7FOxVdfljZyQEAT8zXrj2GvdEOMBG37lO9qEV3E9TwpGGI0Cl71wr
         xxVQ7ox0LOZo5kKVja+OJZY+1AgRIbhL4DrCy0AH+ljLFAlg3mQOj5Zefb90y7rEd8c/
         4fosL1w6MDka1M7Ue/X8Vg9/CQ9iMWupsQRTy0CyG1xVlAKQ4+FflcGvWjWfafbE2dFr
         Bttg==
X-Forwarded-Encrypted: i=1; AL+hErH1o/7wCQ2qI5vNQLXDC10AdNQfy7lKR3YX+f0fjDE3RS11K07qtIOkCPwE8bupVCp86Yxoh34jAyX/zfg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+53SP4PQv5PQQ9jE7geyTN/bCl0zUh3nyCX7T/xzni1lwK5R8V
	7U5T0ACin8uFhYGlJyZjO86GcWkdWj5E2kTMLJtwhDg+W69tTkxMg6J9l8us6GoP
X-Gm-Gg: AZFdTZeT0MJcDavpzZ7OaVoNBrLE8jmBjeId8gj6wt9at0klA9HntWbsi1tT+v8ANDG
	yWxicDj9DONw3RrhViCB9Ll3qrGJm6w6G/B0xfC0SQWywOq6jvrkPBECQGegiLSaR0AOsbgayTT
	1nS+KgXUz3Lh1y06Zr/BbEfftxKIdX5HJ0AnpSJR+c9TkZrGhnXbCNZqhd6Z0KAF5EgszXRE6it
	J96j+Q9X8wfZGMCL7pzC/gYBfrgrPw6ELmzeGbDv1Vl7kue50S75+nZhhT5GU+j71qTVNj4wa1m
	B6We55CsYJIk3yJ0cxbt9Y/+IMLdFdVB2fpzJ644ZT7MJ7RlnpBityN9uBXUr274TJeblEMvKKK
	j0GYuoLB9uRaBTv4XvQXLrGnh2kdo/Jkgm8exS41jPOdip0PR1ZsUP2oQThPB/TNFb94EoIeSqu
	uG57tSmeAtBSo13NAkBHh7ywpiLg4EIL12NBqNOZ7q5SmMCZM+OiFmQTeaWlAGSFNZty553q+Id
	E6fmv1Yu+V4Iu5yKAXjd5Y43cYVqcg7gaWiCyiBSTncRmGMzX44NbY9ZfRrbVQadBy/yQRfAeSb
	6kIMAAauhXY+6gQ+5qldD+YXx8cnMY04WZyDqtVSCiBBwMVkfnX0Iry3WfxygkpcLP5GQD+MHOf
	wK6XparRxNY84
X-Received: by 2002:a17:90b:2f8f:b0:3b3:b0f4:1bf7 with SMTP id 98e67ed59e1d1-3b41c8d460emr1098385a91.23.1795137110648;
        Thu, 19 Nov 2026 17:11:50 -0800 (PST)
Received: from localhost ([50.7.253.42])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41d243eb1sm622215a91.3.2026.11.19.17.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 17:11:50 -0800 (PST)
From: Aveline Noir <jm5905938@gmail.com>
Subject: [PATCH RESEND v2 0/2] HID: picolcd: Fix output-request and
 framebuffer locking
Date: Fri, 20 Nov 2026 12:05:46 +1100
Message-Id: <20261120-mail-picolcd-v2-resend-20261120-v2-0-d7531fa8061b@gmail.com>
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
Content-Transfer-Encoding: quoted-printable
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WNTQvCMBBE/0rZs4tJxCCe7dWDHsVDPla7UtOSa
 BFK/7tJRS8eZ+Yxb4REkSnBthoh0sCJu5CDWlTgGhOuhOxzBiWUllIJvBtusWfXtc7joDBSouD
 xtzvya7PReuWlgPzSR7rwazac4FAf6/0Ozp8+Pe2N3KPcF9KaRGijCa4pVREt/0Uz9bXBNL0Bd
 +SW7MIAAAA=
X-Change-ID: 20261120-mail-picolcd-v2-resend-20261120-ced5a8663d10
To: Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, deller@gmx.de, 
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 =?utf-8?q?Bruno_Pr=C3=A9mont?= <bonbons@linux-vserver.org>, 
 Clark Williams <clrkwllms@kernel.org>, bigeasy@linutronix.de, 
 linux-input@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, 
 Takashi Iwai <tiwai@suse.de>, 
 syzbot+912222e4cb82423535fa@syzkaller.appspotmail.com, 
 linux-rt-devel@lists.linux.dev, simona@ffwll.ch, 
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
X-Mailer: b4 0.16.0

Hi Jiri,

Thanks for catching that. Both patch emails were line-wrapped in
transit, so I'm resending the full v2 series. The commit messages and
diffs are unchanged. I checked that a copy of patch 1/2 sent to myself
applies cleanly with git am.

This series fixes two PicoLCD locking problems. The first moves output
requests into sleepable context and serializes LED state updates. The
second breaks the last-close/deferred-worker lock dependency using a
private framebuffer update mutex.

The first patch was tested separately with the original syzkaller C
reproducer and bounded concurrent sysfs/UHID-destroy workloads on
PREEMPT_RT. The complete series additionally passed repeated framebuffer
open/write/close and persistent-open framebuffer tests. Pre-fix modules
reproduced the respective failures. Physical hardware, prolonged stress
and suspend/resume have not been tested.

Patch 2's Fixes tag identifies the fbdev change that began draining
deferred work from fb_release() while holding info->lock. Patch 1's Fixes
tag was checked against the upstream transport-conversion diff.

Changes in v2:
- Address Sebastian Andrzej Siewior's feedback: clarify that the issue
  is not specific to PREEMPT_RT and identify picolcd_data::lock as a
  spinlock_t in patch 1. The code changes are identical to v1.

Helge acked patch 2/2 in the original thread.
https://lore.kernel.org/linux-input/CANOyQmGfmBdTRaEamVdGuMBToVLeXGi6qLrnX=
=3DxkA9acsL9TSQ@mail.gmail.com/

Thanks,
Aveline Noir

Aveline Noir (2):
  HID: picolcd: Move output requests out of spinlocked sections
  HID: picolcd: Avoid framebuffer last-close deadlock

 drivers/hid/hid-picolcd.h           |  4 +++
 drivers/hid/hid-picolcd_backlight.c |  7 ++--
 drivers/hid/hid-picolcd_core.c      | 46 +++++++++++++++---------
 drivers/hid/hid-picolcd_fb.c        | 56 ++++++++++++++++++-----------
 drivers/hid/hid-picolcd_lcd.c       |  7 ++--
 drivers/hid/hid-picolcd_leds.c      | 31 +++++++++-------
 6 files changed, 93 insertions(+), 58 deletions(-)


base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
--=20
2.55.0
