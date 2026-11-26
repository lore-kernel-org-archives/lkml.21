Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795678285;
	b=m91ys+j9KiyNynIIeDiiDcqjRG4lYwCtQ9l1giSH3+fwBFJuxedWPvEcRPCjWT0BjoRk
	 ry1df/8v2fDAYN0rJYKaUzbZndfEhsveH1dv3FijFWzumJ5GKNN/fhlaG20kim4M+rcBa
	 nDlvj263xURlBKcktmaGop95Hfb7enA0L+C+5MetNh5G8R52Kz1XcLrskv2pX/k9lf/Pr
	 bm40ruRFkNr4J6zD5W+eCoJsEj3Gek2UAxCIq8HseeYfM6xUebbIh9XBaSA9IhoSEpGXg
	 gEnc3FpjtzZqOezJ5INpXHHs2tINKifbMvYgdGUgiuVGyTMep9fOmGS7Hv5h4BIn6Ug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795678285;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=0MO5Sggy9dIKYUZzgsC6cSV3LFpYteqN8TEvQ5hWShQ=;
	b=uI3yFEeD/Q4beA6ITzB4HsADpj78WYWvm46ZEIm4iWXZx90IZSna5u2cX35xRyC9ZIdO
	 dBSPwIxTuwb9BSqkNHAlZQ0qhIVmfC2RV0WFAmuRwWelY+4p0LktBoJxEWsfWxc6bwyNi
	 qD5mtR0KjPgdHVmEtk2qnLQeR/+6xs95JCvgDaZWiAgMbViBOaf35SijFD3hDKx6KGKf5
	 WwQIuFUxWC7S3vsipomDRazt4FXVRR22y29MNSG5K7hyza2Ef3wEzW+y2ZdEZBJ2jzSZm
	 P9X3wWMaAItYc8TP1AsPzDiaMg2lcp3Kno+xhePc2+FekECvfrCvmz8CPvtXD2UBBfg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zSCItGFg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636B9606A338
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:31:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 636B9606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zSCItGFg
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-716c0217635so8035641eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:31:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795678284; cv=none;
        d=google.com; s=arc-20260327;
        b=qsEelVK4hgnOf3WeLgnjMosXu33Alzaa1qnwQUeg7LnsRTUWQ4mTXZBs9oj6Gm38jz
         DywUToKH7e7yKtfLsku8bS2ZwTMJ3QxtE3gMqtyyT2dlb5J8Tpe1VK0rtMPFiFrXq45i
         J86Y2z4g4F6IXCw4feeOfm/D/tT699Ch3EL8Eu02pmf+OlkUqBsOCXui+GIUJNAwjm4E
         VzJFsB9/eY/Q6riKPUplIVxcr7FC9/K/agSO8TGGEe8Qa68N/eIopBsSM9n1dEGb8Gm1
         tir1gCV3RvLBj9GrzqEzSt/6KS5BG/dRlt8IDkmGjQGo1M9j9v4vI+9osGy3Hp5KqrYh
         /wjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=0MO5Sggy9dIKYUZzgsC6cSV3LFpYteqN8TEvQ5hWShQ=;
        fh=OD7k6oYWhs0cSq0KevA5qykdnh59rfWVUmGzNn3L74s=;
        b=j9Za177tqbv0/EeoMBzMkLfeSSHMpqNO5i2tDHIwoRQuc5QgTNVrvqKGaPiog/K7wz
         Ue52n0b/Mm751ebUliys/zPFw/cuUGKQpYGYcHjFKzeEk4ggJ35jafwEYgzPxGlr9JTR
         Tuy3UZajIyAW2j7EsWwtjgiXrCdRKYPnhgTvufc2Rl265Ph/QOhPoLu5+wibkpmABfQ6
         8bNcppId7IaQrisO0+W/c9Hx6gr22yK7L0K4J//Ya8XJO3zc9v0n5qDY4w2TS+NoFVb1
         GfYbdRYuFYsKbEkLf1PU8DOr+tl1hB+qqnd4inZKiifiSnR6nzHWDF76q0J+wC3QHH49
         d3Hw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795678284; x=1796283084; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0MO5Sggy9dIKYUZzgsC6cSV3LFpYteqN8TEvQ5hWShQ=;
        b=zSCItGFgjikK+EzDGuJrjO2zxnjTktx5pyLB+lZc4K45wJzk74hs1TD68+RWi8ktnV
         1pXRLVWowwQGEhYv7cnesFN5kE4NYJidyl1+5KkKJBT/IL1utO+/hNKsz4SZ5HpVE52t
         jJS+u8sXAFId1Hz2nwV7LvgEUqd2qu6+Gue2uVjZGVOqQrVSKBT6ROlAkCiHAgJblCPd
         ZDaD7F6tYfWwb4T5ekJniFKHU9PMNjqltSJBsFpex5iQ9pwZsIAjRgJ7HnP9TYYvMiU9
         275cNahrjvqrWj0YNDe2BmNTZGxdMI0CnYLkv76jQcOS7/lBfQJoWjmfiB+ZuM9XvE0X
         LoDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795678284; x=1796283084;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0MO5Sggy9dIKYUZzgsC6cSV3LFpYteqN8TEvQ5hWShQ=;
        b=ZLa0n5Rt+Ma0rCtyOMZMkiQkgk57IH/IYMU2/2q0lcJkwJNUv76SzuxqvcIpvv4HU0
         4y9mnIodqhpoBTcznhnoQtMCKxiYWTSIF5HViZ9I67npxTzkDo1psPvjPcHA6kob2bne
         9zv8YajlHO3wFdNfMbKShqaHcbQ1+pFSVttunV0jBqEVBGfGBKdNzhSfdJEAvRK8eiXr
         ZyIh9N9CRvLAwvAPouxvXl2zYJNFA1rIvHnBZduNlCh6ZpYskQTVLSsrm+7Uasfofldf
         /m6mGHrx+Yizb6srAgPmpXDeUKJAXagVf0E3q8aMgB9yRcsyWbj/A2oV7EhWWIbrKzrw
         bnxw==
X-Forwarded-Encrypted: i=1; AL+hErGN7UJILBUJKp6pBzZ9kn8bRNljQsFMEeEEtYETQFCzUR+avTEFdJFhRtX7fXejeRN0aJYldDEnpLysCss=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tXKwZV+O/vMNiAIQsum813Y0jo+ntdCz6s4rvB8RNY9XiFBij
	aMYqUjIfn+4bE8gykUqRr75nfJCtg1hx3r4vQcenYTZbpXMedyi/B7PuSrh3Jru39OoZw0+Rbni
	vYys2kX2L2Zwew5D2+GtczeUahnzp+l8IX58i
X-Gm-Gg: AZFdTZcC1uDlvh7wZ5l/LpboxbqFxFcOpOVux9swjZxgiNzYAgXlbEpDqXTl3esx/At
	cQZKhr26tHVBFk4A7jTlmhgO/NP4ZPLoiXBCqWm4O72rI7YFKJnz4inrjuX/Nvi9CzBfxzHHdKZ
	91Ey6XbtLvuZBe34CDtk9z7taz7MwAyKmOubgEZH6otNkin45zfnOf9wjdwqrlMATE5fwxH3DEd
	vPJYNcJ/nIQuAxNOT2jbtpqB4U6PH6ls+0S8XrPdl1hTJ1VWpTpsEa4PcU21tLGxEPNLBwAXoZf
	sAMR0yUMBwOpLDSD4w6j6RctgkwiaNJovnZHmZZa8qg/u1zha7JofGSRmsvw7tngimj/10HyK5A
	fijwKCAIMPz74d/I9kr8Ia2hlgd6HaVsJpls5dsnSjhEjKNLnQuYManFFdxlYc/C0Yg==
X-Received: by 2002:a05:6820:f02f:b0:71b:7deb:6545 with SMTP id
 006d021491bc7-71b7deb6b6fmr2348857eaf.15.1795678284270; Wed, 25 Nov 2026
 23:31:24 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 26 Nov 2026 01:31:23 -0600
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Lee Youngjoon <getfeus@gmail.com>
Date: Thu, 26 Nov 2026 01:31:23 -0600
X-Gm-Features: Aa3M54pLCS9IJOK2jzXO-IchEHoyTH6C6_20WaxUIm41poi1YX-z4yURil-io3I
Message-ID: <CA+m4KrA14J-3ovbau1EGjvwc1R4Maya3wzqD+n-_khotDhcRFQ@mail.gmail.com>
Subject: [PATCH v1 0/2] usb: typec: ucsi: gaokun: Validate and defer port updates
To: Pengyu Luo <mitltlatltl@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

On the Huawei MateBook E Go the EC reports UCSI connector changes (0x21)
and USB port updates (0x22) on the same threaded IRQ. The connector
callback currently waits up to two seconds for an event that this IRQ
thread would dispatch. Also, a failed port-register read is handled like
a valid empty mask and can generate a PAN acknowledgment.

Patch 1 validates the EC reply before selecting a port or sending an
acknowledgment. Patch 2 moves the missing-event recheck to per-connector
delayed work. A real USB update retires only the matching recheck. The
existing two-second interval and the first-set-bit policy for a real USB
event are preserved.

The IRQ wait and the mutable port-count bound were also raised in this
earlier review:
https://lore.kernel.org/r/20260607214621.9586A1F00893@smtp.kernel.org

Testing was done against usb-next, building an arm64 Image and modules
at each commit. To exercise the firmware-facing behavior without moving
cables, substitute the D3 register reply at gaokun_ec_ucsi_get_reg()
and capture the connector argument to gaokun_ec_ucsi_pan_ack(). For a
two-port reply, use update mask 01 and port data 04 00 02 00. Queue a
right-port connector change and let the timeout expire: there should be
one D3 read and no D2 write. Next deliver a real 0x22 with update mask
02 and port data 04 00 09 19: the driver should process the right port
and request an ACK for port index 1. A valid zero mask on a real 0x22
retains the no-port ACK. These cases replay EC outputs on the host and
observe the resulting firmware inputs. They do not emulate the EC's
decision to generate a new interrupt.

The two patches use the existing EC API. The separate EC transport fix
is needed for the parent to report all short I2C transfers reliably.
This series does not add speculative firmware ACKs or change DP training.
The isolated series has been tested in host-side replay. System suspend
and resume on hardware remain unverified.

OpenAI Codex assisted with source inspection, the fixes, regression tests
and drafting this series.

Thanks,
Lee Youngjoon

Lee Youngjoon (2):
  usb: typec: ucsi: gaokun: Distinguish empty updates from EC errors
  usb: typec: ucsi: gaokun: Defer missing USB events per connector

 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 138 ++++++++++++--------
 1 file changed, 85 insertions(+), 53 deletions(-)


base-commit: 90d6263e867be7089b3d3323bef8d2accd327c77
