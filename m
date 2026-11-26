Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795661119;
	b=UXv4Ki1B83VT/xqHVUkPwHnYyu5ZE1sqrmkbzRHZcnZRHZmEYFStbo1Jai9ogZqlFCIl
	 pgUf+8k4grqTM6mq387CVZ1jpjarjBVWc//naPblhyR7PlboE+AMuo6RctjNVmFVj9i3I
	 qe8zBzYD42dgmALH6CCgulUYfYUWR25KfxR1xI5To2ESW64WX8e//cM9LoNyQZUpwrKLO
	 hOfcuDzBfb95mKm9ADfn1dqlzlYJRblqaXDKtxWpAbA4TE/OGR8LGICF32EZTRy5pKu2d
	 KkWRMQyW5zdS/bV3kJxkmgvm5ZeZRbth8s/oCTfR1pkrRIpnXEq96Vg0wBx7xEk0CLQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795661119;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=qyZ3Z/w9Fggbci4w4XggEaIjph37o7PsqDHHOvsTEb4=;
	b=AHwC7pjqWwCCNRvmHqVKe0Lh/AovJyO/nKox2xYciJZcRf0NRAVITKeYKv7Vwp79XzuV
	 YSdg/rU9Xlfw5zWfdmPF/DZTBsQyG5XnGBafHMQZ4fMvCYziILh0spwHc8VxTy29S9/3t
	 lEW2nGJQC3Qu6C1XRTmI8a6cTLozXb8/NDPr9jw7aDhjNIFstfGa8qzvMxLOqvhK5jtCv
	 XG4sMmpIRK1G65RrA5CIrxo2LDZ3uWhcsAirSIv6NbQtXk7i+Aw+qANacl2SeZAiZpm3V
	 0L2948JHgKc5/wBOajXvxtF/jKjOR2+QwIxU85Wg4w1H+AeEUxVaU1Z/9T26RRFbPbw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=certik.com;
	spf=pass smtp.mailfrom=certik.com;
	dkim=pass header.d=certik.com header.i=@certik.com header.a=rsa-sha256 header.s=google header.b=HrEBjPHq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF10606A68C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:45:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CF10606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=certik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=certik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=certik.com header.i=@certik.com header.a=rsa-sha256 header.s=google header.b=HrEBjPHq
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-67583c777abso6849049d50.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:45:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795661118; cv=none;
        d=google.com; s=arc-20260327;
        b=WMzyZtKmGKq1N63U799G/tmUQF4S/YKcZms2Nl+5vPVaTXMQYd9/mt4E3UTcDxkvcQ
         CLYYGPaVKCX3jTmYHmtAmiHj0kVLS/J+McwGUaJuZVR4eMqmFsimKFlgNLTKp9D52MrJ
         FNYW4jj9RyAqFHybTLekpHYFys8FNS5JGNZv6aQlQcpnKY2NYClIV2QqJ9U8zUwVYKqI
         VupMb1VxFmSCpNixE1mbtBTC/MHvWjaT9qCTRYRugu7ZOCpQK/tny1dV/pSWd66LAYkx
         yh3SwWRdCNSDBRENK0WYa5++EB+x0nvJ/IGsRFfWPb8JwEu7HgRz7FdGjpVw+vW3hwFw
         YxPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=qyZ3Z/w9Fggbci4w4XggEaIjph37o7PsqDHHOvsTEb4=;
        fh=V8lqY7ksgkWiXQAy67tkR9W7fjD/eTp+MlI9QdWbAC8=;
        b=ortBt9fGEQ0fyggTSASZe+W4KJZmWgm8cyuxDe3S/viJ1VC+3c2AlyrmjpUzJDhaur
         zoJ/sbXQOcAEjp9Q0SpFEN3fMYeVnA08kq8ME0vVIj96PcKNb59o/xoAle0wEu+2/pTT
         rwg1GkEfkKfS1lcPW0nNZiVON22wo8xkDwFcVDairtD35iygyGvJZ36hHZ3K/VfXffOl
         5NQcazcg/OeYCh5lNr5TiCTmy3M0LuaZuVSvZaJg2NimHZzNRdxq4xGTcyGEIJ3u8SUb
         9dGM6f7n8ZM/Qs6pJ9qHSGGsXEilTWMqFZOm2duC46MN5LGZ12/Du9HNaHZI0riXDMMI
         ZWVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=certik.com; s=google; t=1795661118; x=1796265918; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qyZ3Z/w9Fggbci4w4XggEaIjph37o7PsqDHHOvsTEb4=;
        b=HrEBjPHqvFckSbp20U4PYhmcVd0d7yDI+xF63Vhxvb09eZ3NPzGWHq4Qf4o4o7hGdb
         aSFJJ4AfTFJDISadOuKKOTkJxI9rDP5A2C7YaJAV7MyuG+BzD5Z/SJdzmK86lwXOkerP
         uySVlG5MN8ZUsuHjn2qjHa8XpCKliStV1EzKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795661118; x=1796265918;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qyZ3Z/w9Fggbci4w4XggEaIjph37o7PsqDHHOvsTEb4=;
        b=SujQ4QJ/o/lowVfONwF6gFsRYXU3bDmsczSEoc7K7FP+ExfmrNb7Ywi9oCnrpO+qOS
         aqPsTtDcW4JoUjrBbl6qW8GowwUu73o3DVFUhhWc+Fu9HYYTUkOv7sqjEaP3OvwQEeD3
         egWxOYrryFlLJjCdIMB6wGV4lzp4npY46u87VHuGqe/KUYEggQ+i3G+0d1jnP9xaUlUw
         bh/QamVZuLDTL6/CM3fMF/13FP4XjcxGylYBgixq8EHxH3tt0MUkykuHj+E45/q7dolt
         96xJ3BxV/CEDf/DFVUszqE2ZlS69b8jQN/TH5NN3XGWn4UIa4doViTI9KNqxVmIAMhtL
         pepg==
X-Forwarded-Encrypted: i=1; AL+hErFnQXWyi2sXq/zXuVIzGUHVq7PZurNeGjtV/QKJr4QlV734oX+FmYfuOvLTsChJrU3cMcCDKrTSH/uoJjg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vNLOmWVJoHmtSUAQOOSP7LpahbQbqw7OLwwsJAHRqtnDF1b6h
	m8L+dEnoC7eBoItUF6xQd04waCRw2nEsAwLj3TjqKHMLwcY5DEHoYQbiyY3AI3GLdfrHh9q+dnB
	k/RdG0xADZSzAFTIQ2VWx94LZ4Ev/PamTm44W4ZLG0w==
X-Gm-Gg: AZFdTZf5fX4ogs3Q6uifaoYUicw0Q4Anh//BS5rLMze0dwVqIe4rxkQR+ISuHfyNABH
	XhhkxH+bU8+u7fk2bswZr4QbuW8QyrzuhbK2v/oTeJSWxTc+EKcervy81K8SKf/iWPNK6J4z1Y3
	1Zaqk85munyqmY0TK9/JG0dsrJY/5QHGI5aNoZkEmqAr5OlQZT81WBC88nOzDXMdBFnYd+lT3iS
	8m8zUd3ef9TgpH4bYu1f2XjHgEgb434vMtlZwF4GaLv+3BVk8qj6/xuWD9tsOxdcVkupCjM75wH
	BU5nlikUQxRH7BfqgDNIABalpqv98xrf5m/eGpZgw3HzRImmspRHbUKMjXhnoULAyYoR/ZN53VO
	084q1Wl8GXTS0o342rpE+CkxhkJETyJ4LiL4ypXr1x6wbuZclCQcDz7TWlgcA+DldHBl2ZhH5dS
	GmD+sqNQ4/M7gvh3gDlAeIH7O3pQc7LhH0OAdvh7uSbovDXyOnQ8DRQGedj4Z2MVBO2TEzZrJeA
	7SnK8Bhy2+lWZzT/OlAsN/CbbePn0mdTDYW
X-Received: by 2002:a05:690e:1c09:b0:67d:bc4d:4524 with SMTP id
 956f58d0204a3-67dec47a61bmr9629241d50.30.1795661118097; Wed, 25 Nov 2026
 18:45:18 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 25 Nov 2026 20:45:17 -0600
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Dickson Wu <dickson.wu@certik.com>
Date: Wed, 25 Nov 2026 20:45:17 -0600
X-Gm-Features: Aa3M54qDUVBD0UobwvN0Np77hp-ieqmfIJ36B90oCQ98uHa_LiRVanYCvb5mk9I
Message-ID: <CAFaZ9epYnFzn_EE9Q+g_hn-rmPc70PPC07TXm+9yScHN68hLEA@mail.gmail.com>
Subject: [PATCH 5.15.y 0/2] pid_namespace: prevent TIF_NOTIFY_SIGNAL from
 interrupting the reaper
To: stable@vger.kernel.org
Cc: Christian Brauner <brauner@kernel.org>, Oleg Nesterov <oleg@redhat.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

This backports the fix for CVE-2026-99244 to 5.15.y:

  22b7f491be8f signal: allow taks to temporarily block TIF_NOTIFY_SIGNAL
  5c0985dd3c32 pid_namespace: prevent TIF_NOTIFY_SIGNAL from
interrupting the reaper

6.1.y and newer already have both. Two changes for 5.15:
- 0x00800000, the bit upstream uses for PF_NO_NOTIFY_SIGNAL, is still
  PF_SWAPWRITE here, so patch 1 uses the unused 0x01000000 instead.
- Patch 2 calls no_notify_signal_save() and no_notify_signal_restore()
  directly instead of guard(no_notify_signal)(), restoring at the
  function's single return. guard() in the middle of that block adds a
  W=1 declaration-after-statement warning on this branch.

Tested on v5.15.226:
- x86_64 allmodconfig W=1 build of the touched signal and pid namespace
  objects, base vs patched, no new warnings
- defconfig boots under QEMU/KVM, and the existing pid_namespace
  regression_enomem selftest passes on base and patched
- No existing test forces task work to interrupt the reaper, so that
  path itself is untested.

Same two as the 5.10.y series I just sent.

The two patches follow as separate mails with the same "5.15.y n/2"
subjects. My mail setup can't thread them under this one, sorry about
that.

The backport and the test runs were prepared with AI coding tools
(OpenAI Codex agents, with review by Claude). I went over the result
before signing off.

Thanks,
Dickson
