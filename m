Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795537556;
	b=qEbn6PPWkEgXB4S9ZodNRrqsdtukkVO22S8SO2pKF0sMmkJpH86lrLas+uQG6XQHR0tS
	 t8CFi+H8LQrEedYl+hP3MOmiM5KaHZLe/Oi0TOet6rM6gSYbq3xADMsz11B/iTsVsHQb2
	 1ZxzHi4mRbTAqaXst7JnlVY6IUaxV+lduhp2eFG2x8lWBbbXa0cUhFS/G1TG1TaUoj4eh
	 2TABNy55dfqH5YxW8iTo1nVg4tUqsbMc4oixGSyHVKLzfPPDtPDbgRd1sM1F2fMwr/YQz
	 Iwi+LC5DSLrmIf2Xe0glc5RnjB3/q1tDnxBaEmQhm8cx6oiBnHSDKRRFlV1l3gRLnFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795537556;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=L0W8i1OS9SDCjc0+NVBmFTnmWDDq5TW8bbBOO//Ub9A=;
	b=BkIPt/Dc9zxbdlVJJ6ZOI0ikm49Dkm4nB60QXMKyZ9x6Ij2gEGqM6qU0kC7R+HVzSAN3
	 VvIBXk3g2YnnUb50tANwa483oXW5d9C9zEXsNKSFamtaNSS/XOeDXJoKyWY6ajXNRrP8y
	 e4wcYFMTkeLVBxETIO8o2liYT9MKLvDd09iFagO6+lOevsb6tyF1ywb4slYuHrTiy6EAw
	 g3PthyZJRk+YO8EBcH2QqemFds+1iOrhNywGmi1mvT2OejF4DY83vmXklGEdLC5kuE6+J
	 qJ5jNUeM06hGiXOP3nSLyCnLregWZqcwR38Ti2jF5wVFhCX1SO+UySpm9GydLsXA8GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0um4QUfh;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF58606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:25:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CF58606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0um4QUfh
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-385d8a00598so6890564eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795537554; x=1796142354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L0W8i1OS9SDCjc0+NVBmFTnmWDDq5TW8bbBOO//Ub9A=;
        b=0um4QUfhUqDYcZfPs04H920dlZzpbp/AAE5iwVqMT0bmbB2EE27lEig3AIP5n84TKV
         lo8E/TxzZrvYYBHGPowWFei99BNpC7HfqfDl2ukyqg2pypBreTUQE22wC8D2cMsyt0uO
         aR/UeOvT0XMn4jyc8uDqFAsIqj53UmS2HzVgEPYOGHQ7RrZ9aiZxFeFYvuh+Uvam5iD4
         Yr7JRmxFGAUiEyEOKSlCwnsjmCpNDvqSQXsflIf03Ryw0BfMuYtIQSeEVYiY0qWWtZe2
         O9rHIAGYU9c7EakK5NdbzPZiAjxHwPH0LzqCseDZL5WhoSdo662yR0K53eRv2R5GFiYV
         YuZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795537554; x=1796142354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L0W8i1OS9SDCjc0+NVBmFTnmWDDq5TW8bbBOO//Ub9A=;
        b=z/ts/IPcwYWiiay2sSHUy2wVQKoMdCe3OiFjubbh0T81lGMMNNNdJWmQqUBLpPdNZs
         XheqpXnGL8BA4JVLN47gpnEI5d3Yu0LsvpXSNDc/p190/aoT1D1LnrT1zsxEaTIgPq0/
         anJw37tkS7CcKQ2UdN0QV5vvFFiHDYvem1EWnWlopiUQmAzJZ4kd6u2tgCS0uns0m9LJ
         9hk/7vYk9JA1e+AclE7RzpMKjlDSenanuzuJ06C8ziKBfkRLROBloWHezpyIL7Vw7Aeg
         F12KadCv9Mqbku7gOC5ic9oqDxzpSpZ6h1qRgQdFqAEIU4DT96kiLGOmRVvxGAnxZJJN
         f2nQ==
X-Forwarded-Encrypted: i=1; AL+hErHdEMj/+nNI38AidX9lH+4iOeWx7TYeklh30UxHy5gnt7FD77/qXGqRjpRXSuFMYqVCbrScLZj0ealBnbk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/spXViLhGGrXmssVlc2rgJCao4+xZXrHs6vkCZKQFzUpJn1ybB
	PL53DL5rkog0+26czvTB2Ry/KvEV8lw2o52TuzduGHuY9O6UGpNSL31o
X-Gm-Gg: AZFdTZceuu6WvFLPWONWwBMG3VuvcqxgYfZ6nm41sfS1+TChWeA+JWpf73KXNRV1EOW
	l5di0vHz/WbTpvOKMMk025HIq6+aEg8n+M7mhzuoj4Z0HX5scmDz6aZA71r3L1LpsgyxfGvxD0Z
	RBES9MSExYdivp9U+jWeNvtRf/ZHekC7goDJmRGHatM1Jknj84cHFRdjaRKhCyWrWIBW9Lf5Gdx
	g4Yapp4GWpJmd7Ym4qzjtVSJFwS+/AiYeBlqDT6kUxLKql5pE651Ftwss0ncox5MQETlaHZ6gUn
	BYSzVCxR5CX8dxAJbIDSftpd/AmXjs5FPbl6jPXtiyjKIjvgJcBKThMI7U0bsINZka2b6k08kPX
	O4Qb+8VgplXFRbUkfS6fngGQ8pOlMgF7wHQQAsxQawo/BT7xlBtWdSgSnEUyOy3UUTijvzsRZDR
	e1N3D346oSA5FOIukxt4yGKMjuDW6gKPH+zFaF9zh6eaaRf5LFh7De9V0rZHfuTbVq9Ll4IwNBE
	u8Qu97r80Drd5DFnFIAi7ArAzMQnDzDxY/oLjf/Ikkx4jB+1WTlU2UR6M3QfNLoM4686YmAdEO1
	IcVgPbwnNehfmcaHFlox+QD/rUaqf86qA2A=
X-Received: by 2002:a05:7301:f02:b0:378:7434:a526 with SMTP id 5a478bee46e88-3856f8519d9mr15236084eec.14.1795537554005;
        Tue, 24 Nov 2026 08:25:54 -0800 (PST)
Received: from arch ([2605:52c0:1:507:9873:d4ff:fe61:a965])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm45549014eec.23.2026.11.24.08.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:25:53 -0800 (PST)
From: Zheng Shuyang <yhshzh0@gmail.com>
To: Fuwei Xie <12313607@mail.sustech.edu.cn>
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	=?UTF-8?q?Eren=20=C3=96zen?= <erenozen@protonmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 0/2] platform/x86: huawei-wmi: native Turbo profiles with capability detection
Date: Wed, 25 Nov 2026 00:25:48 +0800
Message-ID: <20261124162548.55861-1-yhshzh0@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <69C3BBDEF214121E+20261118161311.17252-1-12313607@mail.sustech.edu.cn>
References: <69C3BBDEF214121E+20261118161311.17252-1-12313607@mail.sustech.edu.cn>
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

Hi Fuwei,

I tested RFC v2 on an HONOR MagicBook Pro 14 (2025, Mainland China SKU C233,
DMI: HONOR / FMB-P, Intel Core Ultra 5 225H, BIOS 1.16) running Arch Linux
(kernel 7.3.5-arch1-1, power-profiles-daemon 0.30). Both patches applied
cleanly to v7.3's drivers/platform/x86/huawei-wmi.c and built as a module
without warnings.

Test results:
- Capability detection found \GTUB and \STUB and registered platform_profile
  ("balanced performance") without altering the active mode (remained
  performance / GTUB=1 across module load).
- Writing "balanced" / "performance" via sysfs and switching via
  powerprofilesctl (balanced, performance, power-saver) updated GTUB and
  flipped Intel DPTF INTC1042:00 odvp1/odvp2 as expected.
- Fn+P updated both /sys/firmware/acpi/platform_profile and
  power-profiles-daemon 0.30 (powerprofilesctl get) immediately, with no
  "Unknown key pressed" logs for 0x02a0/0x02a1/0x02a6. (Unlike Eren's
  tuned-ppd observation, stock ppd 0.30 followed Fn+P right away.)
- Unplugging AC in performance mode dropped platform_profile, ppd, GTUB,
  and ODVP back to balanced.
- s2idle suspend/resume preserved consistent profile state and switching
  continued to work afterward. Existing features (battery thresholds,
  fn_lock_state, micmute LED) and module unload/reload were clean.

Regarding your questions:
1. Capability gate: On this HONOR Arrow Lake unit, probing \GTUB/\STUB
   worked out of the box without any DMI allowlist.
2. Keeping 0x2a6 in the refresh path: Strongly yes. On FMB-P BIOS 1.16,
   0x2a6 is also emitted when a mode switch is rejected (on battery or
   below 20% charge). Moreover, writing "performance" to platform_profile
   on battery returned 0 in ~0.8 ms because \STUB writes CRWM=1
   synchronously and the immediate \GTUB readback at 0.9 ms still sees 1;
   within ~50 ms (observed at 51.8 ms) the EC asynchronously reverts CRWM
   to 0 and emits 0x2a6. Having 0x2a6 trigger the deferred refresh is what
   brought both platform_profile and power-profiles-daemon back to balanced.
   (Note: BIOS 1.16 can also emit 0x2a5 for TBF2-restricted transitions.)

Tested-by: Zheng Shuyang <yhshzh0@gmail.com> # HONOR MagicBook Pro 14 (FMB-P), BIOS 1.16

Thanks,
Zheng Shuyang
