Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795122865;
	b=zZDMqicKI4ngG0cFgFQu94Z+HiO3epdTbcu5TZWhb3FyH9qrZmnpjdI/Wz7N5bhaKv1/
	 RIuew5kBJLxbFvXnindx5cBo8GAH9KxShA6TvjC8Ras41N9k4TiBdzXfpdB0+6DOw7i47
	 2QDMW6/SEuF093iHf1Sxi7SbmvHWdg5tmXJj6VR9ZlcFmaHGuKEjUJfEkQOQ/jQYoX+7e
	 aDJmMCP7deD8V22AW7u6fhvUSafe+6BQPF6iRCv+3tb+hfUzt4sH2jFgINMWukWP3VIRT
	 +Ygx68pWBqZIMV8lnJP88KrqVhmXdGW71aztoml3w64lDauSwtfAB+a/oXYYRmD3YmQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795122865;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=jOUlxiFKSn4QuotEPH1aCGfzH7MWZvtDLjCXKUPkqHs=;
	b=F7cZDEIPjtoqre7N1fXbbnQCPKx0+p3SzanAZ9nxa3jH0T5mY0ssStFVTR4pEm2BsjDA
	 x6PXlVltU5NW758jEKrAjAiXhCAkFeXVEWS0w4w4tUgaj3mEWYs84GSkf8dOy+jnYvNDk
	 duwWv/MXI4ej6+nMj1N08coScvIV+uZKXZP0IjfdEmaEnMSjw3CovykKPzAXKUdTKG00g
	 9sHp+vSz3NsRlxZ5OE1WQeHU/Rrrl/rLRK0iUhdyYqfa8kpUlFJHedvQorsgZfO/rBoSJ
	 cCFaGFbD9GSSQTPNMzntr097WBKOFjvfhLe0yDV3eT8yJqMiHsNI724mF6iniFbGKqw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="CmYaSS/J";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D265D606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 21:14:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D265D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CmYaSS/J
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so1363035e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:14:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795122863; cv=none;
        d=google.com; s=arc-20260327;
        b=NEsnj3qYDFaQvALvYjHYQhmI53z1yBOh8NQf2Y0TCwa5eb+tO6D/yAzkMK63GXlooV
         pISklflYA2CzeM+UvD7IfMuzH5WL1fT5iiZ6MQZNL4SShC9J1b3bmDYsc9L5Px9pYqh6
         C6Na3S9jrXlpW1gIBxnRtIAVox/9vAW/XS7kS1Pc+3kjOB/WWe9Zr9Mt0mv2hdcZsJht
         pkJEfnLwPMdUb5wXn0k8YNK6z3rl6hoK6HX63cFpp91rdXd4JcieecV1VsIbYGi9pRBX
         sRAIy6ffbY+ZiHv2rVczWwhw9pjlzFwP5h9i2x3/XYeNvfMeCb5trLv8BMMeUilWEdQF
         LK6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=jOUlxiFKSn4QuotEPH1aCGfzH7MWZvtDLjCXKUPkqHs=;
        fh=J1yf+nGV5xlCA4F1ScCBK/nW/srmQLXm4tPOtfYc+6o=;
        b=GhlcZjee8GvAeC42+uH/dU2j/Jimhhfw6G5Kl1dp8mAILMJbAsvF+vlI0V7BiXU4Mp
         dcWjLU1h1Ac4WiKo1YaQ+s6/aE6KcR/hVWNOOCSLYRQpSnEQe41iFOUzqTtzYrfgazTv
         DOM5azKbGan40KGLkLGwfMpYZ1BG93C+ZuZpxKkV9JQgI6w0AIo9cQUF7Jegcl8sIfaz
         ANKqQgPFLLIrrBwnti8lOVyxYyfqoVjgoAGAHWn0wTQ0iwk696tXP/ZcnzmNClq4gcmp
         yo632pZHi0fnzKSw7sLoNeoQOASWzKu6jachLj5cTI5LJdSmAiIqy9w1sma0VpfERQhr
         HuuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795122863; x=1795727663; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jOUlxiFKSn4QuotEPH1aCGfzH7MWZvtDLjCXKUPkqHs=;
        b=CmYaSS/Jwjw+qO8vgrEtOyC5GOHynN2H03OaUK3GGUaJ07zd9stNQGKDKPkv+erZiL
         66WEONJYcvqH0iCmUCkSQwfTjeUFvbKXCV/k3RZlaDz0YwX8y88GMg71FbWl+s1ggtj3
         p1kLPP8m/rCS/TXewucjqJkGlACRuefuCT6NMLLbkRT//1JVk1ejYDAkBYDw5IqihpoP
         uJ9Be3scBygZNl0213GwmxtAZR6DLUNHeSDf5d+HLR4oO7hlQdxiHtCt6h5cdpGzF7kp
         QkP56Im3lJLqpWQScKnjCzJuGs37S/ZlkYnNXQLn/8vjB38xObXj/pz8pI4L1G0czP5P
         hb+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795122863; x=1795727663;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jOUlxiFKSn4QuotEPH1aCGfzH7MWZvtDLjCXKUPkqHs=;
        b=jSV4Z+QkfFNv+3CY/TNP74ccnn1oQYPFSmacq5RX+QqrxmlV7S0obYBlLHanVcTIbc
         vAgamRCZx2tGquqkeFs1Jx8PJzcZ623LraJoMZFTsokT56FguNSuXoSUzNf0M8QMRgfL
         Ba4isfluU2FimhbZ9f2rbwAvraXNBK+R28S7+LVef1aWsm7WRbXY6yY7UpxXE/o9YuU/
         9vc6tEEM+qpyjsV/SmFfan/lgA7AY0c6jsqbBiA9aHeZnzDdgFjxmQkvRueOQewA8tcQ
         aSdh5/Yh8QZRng9h3hzeleq7U0LIHRx89kaVp0QeVb5HPyIWk+d8f1OMvh+QLgy5ja3A
         UYxg==
X-Gm-Message-State: APuU4Z+7CyLzTN1d28bNTG6dUEyKFB2lO00SiZjRa9CaK4K9w2U5TZVk
	dA4Enw0+hOHZbqYN9HTUBUfykD2rbqnjpLTsmicpMDDBg0Qbu1yXsU+T/w0Sl0RFg+H9X593n9y
	jaCK28wMbBBitYsnCiWedS48LOK9nl04HvhL4zqys8Q==
X-Gm-Gg: AYBFou0DWxNLQYYpqeJ/jDT3dRzpCt1Sn/L0BbZ6rmn8P4/T8nS2YJYbA+NN/YXOZSf
	8dWPqyNC8V3PDoKR6mCsMv1VvhQDVRU8jPguWUAkpu2G6sgYuK2H8n2Q0230vVnSyWESBWZ+Itd
	X9ouFmZEaOuS3rgjJp9rFOjWPdpLj8b4TlsInkUS8EUMlWQ+sakbhvOSVr7XU2UzNRGRQ4tC9rO
	gXwGXhCkd+Vcp3geLgHmi26b7L4c6CxqsTgVSXrx3dxxDHnlAqySBFW8Cqg1xV0plU6YLBFsz2a
	hZlqDwBTeKZMotNQS2OJvpc0I+72Ledcjr/yrHOZ2gwrh0VMMn4re/8nLW5zkWm+Tuv9w25LHDt
	QPNnwm9l6iTipzDhNKSinxGZfiEV5es06KEsJUP1t89syZOxHMS3rj021hSGsapsS2y8lmR6ME0
	wJvb0H4+55wpZBPCtj+iVv2g==
X-Received: by 2002:a05:600c:4f10:b0:4a1:88de:9e8b with SMTP id
 5b1f17b1804b1-4bb88807909mr17131885e9.5.1795122862959; Thu, 19 Nov 2026
 13:14:22 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: =?UTF-8?B?THVpcyBEYXZpZCBHYXJjw61hIFdhbMOz?= <luisdavidgarciaw@gmail.com>
Date: Thu, 19 Nov 2026 21:13:56 +0000
X-Gm-Features: Aa3M54pgDT_B4ZQbxIxyfssiAx3_A8diPKwWuh9escba8dP3hgknEEXnDXRUbSI
Message-ID: <CAAqvKDD_3QbeJb-OKYQn0q9FAHMej3_9UfcaLgDS--4YcPJKHQ@mail.gmail.com>
Subject: ACPI: video: backlight non-functional on HP OMEN 16-am0015ns -
 _BCM/_BCL/_BQC under NVIDIA subtree, native path inert
To: linux-acpi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I am reporting a backlight control failure on an HP OMEN 16-am0015ns
(Intel Arrow Lake-P iGPU + NVIDIA RTX 5060 Max-Q, hybrid/Optimus). I
filed it as Bugzilla #221648 in June; it has had no maintainer
response in five months, so I am bringing it to the list.

Hardware / firmware
-------------------
- HP OMEN Gaming Laptop 16-am0015ns, SKU BP4Q7EA#ABE
- BIOS F.14 (latest published by HP), DSDT OEM ID HPQOEM 8D2F, OEM
revision 01072009
- Kernel 7.3.4-300.fc45.x86_64 (Fedora 45)

Symptom
-------
Panel backlight cannot be adjusted. Brightness keys, GUI sliders and
direct sysfs writes all have no visible effect on the panel.

Firmware layout
---------------
The _BCM, _BCL and _BQC methods are located under
_SB.PCI0.PEGP.PEGP.DEDP, i.e. the NVIDIA subtree, rather than under
GFX0 (the Intel iGPU node).

_BCM does write to the Intel IGD opregion fields BCLP and ASLC, so the
firmware path is internally coherent. i915 never invokes it, because
it only searches for these methods under its own ACPI node.

The WMI GUID 603E9613-EF25-4338-A3D0-C46177516DB7 required by
nvidia_wmi_ec_backlight is also absent from this firmware, so that
driver cannot bind.

Full disassembled DSDT is attached to Bugzilla #221648.

How this differs from the known quirks
--------------------------------------
This looks close to two cases already handled in video_detect.c, and I
want to be explicit about where mine diverges, so it is not mistaken
for a duplicate:

- "ACPI: video: force native backlight on HP OMEN 16 (8A44)" (April
2026): same family, same reported symptom of writes updating the
software value without changing physical brightness. There, forcing
native was sufficient.

- The Acer Nitro AN515-58 / AN515-46 quirk (September 2026): firmware
advertising the NVIDIA WMI EC backlight GUID on a hybrid system with
the internal panel wired to the Intel iGPU, where
acpi_backlight=native let intel_backlight register and restored
control.

On this machine, forcing native is NOT sufficient.
/sys/class/backlight/intel_backlight is registered, accepts writes and
reports the new value back, but the panel does not change. So the
usual quirk would register an interface that is already present and
already inert.

Also tested and ruled out: all acpi_backlight= variants (vendor,
video, native, none), dpcd_backlight, and NVreg parameters.

Questions
---------
1. Given that the native interface registers but is inert, and _BCM is
reachable but under the wrong node, is there an existing mechanism to
point the ACPI video layer at _BCM methods located outside GFX0?

2. If not, what would be the preferred shape of a fix here? I am
willing to prepare and test a patch if someone can tell me which
direction is acceptable.

3. Is there any diagnostic you would want first - I can provide full
dmesg, acpidump, or instrumented runs on request. The hardware is
permanently available to me.

Thanks,
David
