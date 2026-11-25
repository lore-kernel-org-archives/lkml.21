Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795571452;
	b=HQh46/zm4N51kazkJgyxJV6TaLQIYcHWApWENi4bpdAifJVJC+Frb2n0FIWe2daftrLm
	 NsixjE4Qx4i41+VIFn/WcI3pjDwaQeFjfgdsWGjRjVz4U0AtYKvjRHoCjgDvtUk6A3uK2
	 az8TN5ddVW7Eo7NjvOdleY5szgSzSGMoZIqgOoenugazfUGXrfdLPuKDH+P9AxcrLSgSg
	 lFgH4jiVjoRUg5rDASqbtRL+bERa8HFNk0+RDhIuyo3YVNizV0oyC5zxbC5LMNOEAirn9
	 5lBkoyHAaPZL6L/dWfagQM+B9iv2RtCM03f8yNN6D69jKeRjhWdwXrXxrHRzWPC9jpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795571452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=g6ajiaLX79xZ2pP8/AqPpiIp3ujXvfjF+l+DxCu09WU=;
	b=vu5ixq9vWfSI3uGQkk+VFiN5y44dkmc6KrLy6k6y/PAUHiEEWxCBaj2dDuPVLBwxnTZi
	 uyY4hLns5fmk9ExzQVuAtJAMZkhh5pLzSUahPhQDIZOStf0WOh1DC+adX8JVUrYYcLHi7
	 +hEHbil/gwTcYabhXgDi/7U4Kml+PdAyUJWrVJBVCVLT6zvOymhX532kOoCl6QLvWruuy
	 AL8Ux89L7b+gqxGxQGaM14cFvLS03K4UKLi9/g/NGDHjD+E0RCbYumGs2BYzMgf2Eq0k4
	 HckB7BiVeQwBnXaCO8jMfdH390kIyNiPWp5HcgQT+OZA6zNeXBSfRvXPIuU9HmCLsng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nLWEAXV7;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0B6606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:50:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D0B6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nLWEAXV7
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1a2af4c8d00so2894667c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795571451; x=1796176251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g6ajiaLX79xZ2pP8/AqPpiIp3ujXvfjF+l+DxCu09WU=;
        b=nLWEAXV7HwfQBgkKbWyEqPROWngeUh7Z9dnSIcRJLqz3TMCVmwxNwlyrVU4z4tVfY8
         sTV09JeSfyI25AuDZpdxdMJO+scIi4dVp7UDl8G2crgEekzODaMg7E0fh/zAzynHOFO/
         Ec3ylglXtFSaHnr3j9209/RyJBzfw3ZY+3Y6m5BT2TNJV+p+rfhsvkCwK9of1dLEVFcX
         fIae/lNcgzivVcD+CfSz01n2aYGBMN93YhJe/jbD/cDv0J1qHxa+EiO63E5mcPSHn8a0
         RHAK1xhmfBxl8CwDGmGbEzsWJyiCGYBmEZ8YshJLM1Q8y2emkHvVhhHFli9IP4QVmE/W
         ETuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795571451; x=1796176251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g6ajiaLX79xZ2pP8/AqPpiIp3ujXvfjF+l+DxCu09WU=;
        b=JaxhB3lY3EwCOanvt1u0+1nrpWGVB3NR4VxP27yy6VBD11TLH0Wj4NCwM7l3L7I4L/
         c2xlDeMzW16k1I4UDoAsf/TzWbdZASlftNPGlXYq//uxYeRglj+oIj2N2OQa9lkm84Xi
         J/8Fu5l9V1wJqRUdbfoWwPyq6ePV0CGs2bD/iQOlXs+fdn83vHlYH1gW+z9YLRVRn2Qg
         wR0JmsTX8ekEHToU+eQUSvCzmp/yi2jZOmPRp/oWzAezNguEzcJuJwSR7Mxp+Cjjq7Sx
         8/KuZAF3qKKd28RZGa+U8WtfJ+liavYlGS3n1tKHKAaXhmo+4xP2htNi723ruYUYi/fL
         Ul9Q==
X-Forwarded-Encrypted: i=1; AL+hErE1zuo9JYYfMDM5s+NRjnMbHHaceO0ihzVEJHSIIhbM9KFjU1cqQriQiK7WqBkmfXeMHgDD0FyAKsu1Zbg=@vger.kernel.org
X-Gm-Message-State: APuU4Z851uZgUyhGGssjguIlKKHZpjBxDk6lb45wy1P51RmX3gBN61O4
	wJPegGYgGogDOU1QtfapHG/pIpjQ08Spe4POeldH9bnq1PAsG184To0LtrXy5o4bKm4=
X-Gm-Gg: AZFdTZehJBG7lqJPtRpSuf9tdUOF0MwH8sXf/i1R/+/MVoeOckGNGByzpgamIPyDaZs
	gOv1AWJt0QyiUh+KBhAZL4Ru0+gjoJgMk/dy3qGQK3a5eQlbgr5caml3GCzGTIIbMKWuhYq0Ijl
	tHayvFgiZJCjrxVElmsraa4+fI/Uhfouf4RDxBMfmGuznw7FSIJIE5CRrlr+4GNWl2N/zRu8g+H
	43wgRMcYZmqQHPOwMfBHesx/ylBkkwvlJjvBeBxqhHgeWpHfs8cIdg7IMhPtvbXCRENbiaHHBBk
	sgQ/qpah9Z6ec4GUG58p+2LhilBQnWt7OxG7wBHG0K795ZSX2ty8F43O7lkqUr9Jbco8MU4G+Np
	aopXs6u7KHo9FDyYSFU91a6+aGXzR3XpD3FeKmVHLXxvPVOZ89qPHpFmTd1oZETv/9OzVxMidve
	BiWO9z+wD6VHU2Dcnv1z+nb+bzic6vBEAg8F09cvT1zzFvnwzXfOWvZbyBevUBXCFhIdyeOatMq
	CUIoX2rlluXRzpA7KUBQ6Fx6K2JAr7ngpknxcarczEXddu6lIWbyK/Ux605Olx8nreEGxjdZoQE
	j0T4xmzz8RiUwQ==
X-Received: by 2002:a05:7022:2207:b0:166:b307:5855 with SMTP id a92af1059eb24-1b556688160mr23952392c88.0.1795571451130;
        Tue, 24 Nov 2026 17:50:51 -0800 (PST)
Received: from arch ([2605:52c0:1:507:9873:d4ff:fe61:a965])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b562a82b3fsm43061705c88.5.2026.11.24.17.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 17:50:50 -0800 (PST)
From: Zheng Shuyang <yhshzh0@gmail.com>
To: Fuwei Xie <12313607@mail.sustech.edu.cn>
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Eren=20=C3=96zen?= <erenozen@protonmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v3 0/5] platform/x86: huawei-wmi: expose native firmware power profiles
Date: Wed, 25 Nov 2026 09:50:46 +0800
Message-ID: <20261125015046.23870-1-yhshzh0@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <4F34E5193B4633F6+20261124172651.37716-1-12313607@mail.sustech.edu.cn>
References: <4F34E5193B4633F6+20261124172651.37716-1-12313607@mail.sustech.edu.cn>
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

I retested RFC v3 (all 5 patches) on the same HONOR MagicBook Pro 14
(2025, Mainland China SKU C233, DMI: HONOR / FMB-P, Core Ultra 5 225H,
BIOS 1.16, Arch Linux 7.3.5-arch1-1, power-profiles-daemon 0.30). All
five patches applied cleanly to v7.3's drivers/platform/x86/huawei-wmi.c
and built with W=1 without warnings.

Results:
- WMI bus binding: huawei-wmi-method bound ABBC0F5B-...-5 and
  huawei-wmi-events bound ABBC0F5C-...-6 while keeping
  /sys/devices/platform/huawei-wmi intact.
- Capability probe found \GTUB/\STUB and registered platform_profile
  ("balanced performance") without changing the active mode (stayed
  performance / GTUB=1).
- Sysfs writes, powerprofilesctl (performance, balanced, power-saver),
  and Fn+P updated platform_profile, ppd 0.30, GTUB, and INTC1042:00
  odvp1/odvp2 cleanly, with no "Unknown key pressed" logs for
  0x02a0/0x02a1/0x02a6.
- Pure AC unplug from performance (without pressing Fn+P afterward)
  updated the cached platform_profile, ppd, GTUB, and ODVP to balanced,
  so FMB-P emits 0x2a0 on unplug and the cache does not go stale here.
- Writing "performance" on battery returned 0 in 0.4 ms (cached
  performance, GTUB=1), and by 51.0 ms 0x2a6 triggered the sync back
  to balanced (GTUB=0), with ppd following within 0.5 s and no warnings.
- Existing features (battery thresholds 70/90, fn_lock_state, micmute
  LED, debugfs call) and module unload/reload were clean.

Note: Gemini helped with the test scripts and
drafting this report; I performed the physical steps on the machine and
verified the results.

Tested-by: Zheng Shuyang <yhshzh0@gmail.com> # HONOR MagicBook Pro 14 (FMB-P), BIOS 1.16

Thanks,
Zheng Shuyang
