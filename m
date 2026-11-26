Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688598;
	b=ax4hsv+JnSnLy7wck1rLpwZu31tqRUo2ALKUsZXTpuLa4yiuREq85ArcA78w7Au/9KyT
	 xQhwVnEZR+qnQdQbi5HpH0X30c2xvnuvxPRKJPN+yrpidkWm4ULfK6rjpO6vVmRSTDkrE
	 kMSvq+vAu7LbjLEvuYj2y1Sv+ZdyHsGPSxGkFWAUx4FZH8x9lfb11qqtaCQRLjF6JvVDJ
	 iey1SiXybq51Zs9ZltZpqHX0QMW53UVmhk14QC0B8zUJ1qrbEH351zDxVOJqMxrFWueLL
	 ickUAkjEOiP4ppRjKnvBrG/58My4Xdv4QQ8C0OzT6lxbJSqqp+LpSsYJsM40KuZ7R6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688598;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=H6N0X50m/DSlTn3HtbgXOmagDGxOT5v+Biy9jycT3iw=;
	b=4ued+Qzz6Fg/yEnc6LOYgICult+Pw28KmAMPVAgvnxHwzwECZWgvrdHi6Gzb9raZF4hT
	 8yv2JVJzvDluGDfjIL2eh6UcgBXSTdQrlIrBzH23FD/lPh1a/KWsEB5KpqB2mmagHZac6
	 uYf3gbO1XOgqB70EiCaIlZ2ACV25N7ZtIyL5sCEX0ssWPOvAbdbzUO/PdaydxxV6xzzG+
	 2ccFK3SbqEIz3Ihixrc+8TaxHvSaTn3dXauTPiBTRN9UEzPIXanq9TFIVF59vpTHGzwSA
	 u6SodXhvSZqHQHQ1PfY8s0qDgKl4Ki+Dw/fc6zJduJQVCDbwqrCm4c7OTRM+sQMh1Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lUWUwqh1;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32DB606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:23:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B32DB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lUWUwqh1
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b4f6f98587so353635a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795688597; x=1796293397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H6N0X50m/DSlTn3HtbgXOmagDGxOT5v+Biy9jycT3iw=;
        b=lUWUwqh1//I1+LAJzb4Bzn8jaKQ3owOuo2IGg6EQUm0jdSwW2IJmNpwQ0Iwm1G2Hfk
         KiIc887qpbEOK8lGwHWOA3GWhF4eNtK8vY+JsO1KzKgcrZR8NXpdwJJBUSy+lLG6jkp6
         6vArsjUBS/AvDvOSnKKZGgWamlXZoGUrEl2T0B6ZP2LlfA58F+qfqLkajUmgvKxPaB1Q
         jMkaX5+Rq4h6jcOtLqK0P6HQTW5wYMn1amgUD5YgVy5d+kmU7WfmjDHADxh7rEP+G/47
         /lMCJhFLuO+cj0hKGvQTYrLIzCXfebdF5Kz72NPUf/Qik/lf1cKsj32v8CcxmSWeZoFs
         PIFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795688597; x=1796293397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H6N0X50m/DSlTn3HtbgXOmagDGxOT5v+Biy9jycT3iw=;
        b=X0j8saQ3zYZbcX21deaqvy1zKI/wLYZNwSPFYfWBJWiBUirwFIbcgX/LY6hUdCbcHU
         crivLOe3I5djxUrok8CHzrJ3D4qv4q9mb0p0gcg59+tu+qDz2icw8Iqdkg5wS7AkvMVa
         95TSgqPlJJi1knRLqwn1vKOce/eTQGhd0toXeHVanOgE18gnkzhKZ7npTU9KdjkT2FJ4
         IHpQiMpZszrXYtvWjYTMfTdxlyzoPc43AI5kgMmuEyLbJ3kuBHUxaArBwCsxwWpfBQcz
         W+BatiN4XTDjpY8MO4J1M3zh6UhZ4eO4urUBBYVvIBjxked4d9x/6s/Q/hWuWs9FcgG8
         nDdA==
X-Forwarded-Encrypted: i=1; AL+hErHfJBapGn2w3qbyshpQCpE6H5+P/58Pot//3GDT44j/fIg7jL7uXWtBjRew7NelRr1cvDLrNYCYFpHn/mg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eoD4dvvBKZMb+bSY+L5z8UXLAKZuF/h8OZC6Up238pKe57e1B
	KD4PnplUr1EVvvukaK0Y5x2pa4IDcCaX/ci26D0jyF7uVblzivMPqZRd
X-Gm-Gg: AZFdTZcWEUNLDIatXHz1bgH5fC5jGileczNI23EOzkCHoIVOTpckUNF+6QsRdis+SbP
	qFCkLBWHkybRamWrz5zhPiCttkX982qrAma7Z1QZ82SRMpl02Qiqdryqfu76PE6nBJ+/rsnZQJT
	fAwMlYdxlEoFCXYhf2JOADwzO46d0NRi+4vOk0H6MxsOsktm/a/IWIJ2LZ2ZHYQggVzmknLMVeY
	kcEKdnQec/IMdbptRLM2aUkGjuUB1O/YOyOgBb2CuYUi6tYDOy9fusS4rRd+ueO9imJWNfGSZmk
	q0V8UyzjfpUdxKkDkW/sQU/xipKnWC5QF+GlVuIvJksPkE0nzIXfhv1A8TgUx7OuQ0RTugMM6U5
	6EaKCgZkmBHk2JKNf6e5yzGcAGY82GHFE5yON5iK0CR7biNdLeJKltektRFyljcKC46y8goW4+V
	BbyCUAls1yZmysdQPfLgjJNErdncb3F30fdZTpsNCalPo0uCp3AWJ1HHaYPuq0fsU4GntuMiQf+
	3hWpeNLlkKzKSlV+eBJAv+semetxpyVyfgXXCUeJIxsMlizs8xDIuv287BtYx61/0eNQZXJW9YJ
	3aL47Z71M87E1DuCzWPZNZ/kQ8o/jeuDKvvh1L6huKlPbM6g8vurDukeAj64KE5ur1qcjY8REje
	WF7atGpZXIQyM
X-Received: by 2002:a17:90b:498c:b0:3ac:73c7:9c07 with SMTP id 98e67ed59e1d1-3b41c55b914mr29450973a91.0.1795688596883;
        Thu, 26 Nov 2026 02:23:16 -0800 (PST)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc6130sm10758422a12.7.2026.11.26.02.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:23:16 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Vadim Yuzifovich <vadim@yuzi.co>
Cc: gregkh@linuxfoundation.org,
	thinhnguyen@synopsys.com,
	inochiama@gmail.com,
	linux-usb@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] usb: dwc2: gadget: descriptor DMA fixes for BNA, found on Sophgo SG2002
Date: Thu, 26 Nov 2026 18:23:06 +0800
Message-ID: <20261126102309.859777-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116070433.2813951-1-vadim@yuzi.co>
References: 
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

Hi Vadim,

I tested v2 on a Milk-V Duo 256M (SG2002), on top of 65e4fd942f72
(v7.4-rc3-406), with "p->g_dma = false;" removed from
dwc2_set_cv1800_params() and dr_mode set to "peripheral" in the board
DTS. The params file in debugfs shows g_dma 1 and g_dma_desc 1. The
gadget is a configfs composite of ECM, mass storage (a 16 MiB file) and
UAC1 with req_number 8, on an x86 host with xHCI, high speed.

Three kernels: A without the series, B with patches 1 and 2, C with all
three. On each:

- iperf3 over ECM, 60 s in each direction
- dd of the whole LUN with O_DIRECT, one write and 20 reads
- sg_turs -n 200000 on the LUN, while the board copies a 32 MiB file
  in tmpfs to /dev/null in a loop
- speaker-test playing a 440 Hz sine into UAC1 for 5 minutes. After
  30 s the board writes a 120-character KERN_ERR line to /dev/kmsg
  every 2 s, so each line goes out on the 115200 baud serial console,
  about 10 ms like the hold in your test.

                        A           B           C
  iperf3 in/out Mbit/s  138/94.9    149/97.9    142/95.9
  dd write/read MB/s    6.6/18.8    5.8/23.6    8.9/23.5
  sg_turs per second    3432        3279        3359
  UAC1 runs wedged      3 of 4      0 of 2      0 of 1

iperf3 is host to board / board to host. No retransmits, no sg_turs
errors and no dd errors on any kernel.

On A, two runs wedged within about 45 s of playback with the console
lines: speaker-test failed with -EBADFD and the host reset the port.
The third went through the 5 minutes and wedged when playback stopped.
The SET_INTERFACE to alt 0 timed out on the host (-110), and at the
port reset the board logged

  dwc2_hsotg_ep_stop_xfr: timeout GINTSTS.GOUTNAKEFF
  dwc2_hsotg_ep_stop_xfr: timeout DOEPCTL.EPDisable

after which the host could not enumerate the device again. Rebinding the
UDC on the board failed; only a reboot recovered it. This looks like
what you describe for patch 1, EP0 not answering after the stall, but I
cannot show the BNA itself: on A it is dev_dbg and my config has no
CONFIG_DYNAMIC_DEBUG, so the link to BNA is from the symptoms only.

On B and C no run wedged. After the console lines, arecord on the board
captured the sine, and after playback stopped the gadget was still
configured with no port reset.

On C I also ran everything together for 30 minutes: the sine, the
console lines, the copy loop, iperf3 -R for 1800 s and sg_turs
9 x 200000. iperf3 moved 11.0 GB at 52.3 Mbit/s on average with no
retransmits, sg_turs had no errors, and
the host logged no reset. Afterwards arecord on the board still
captured the sine.

The "BNA, DxEPINT" warning from patch 2 did not appear on B or C, and A
showed no bulk errors either. My copy loop is much lighter than your
H.264 encode, so patches 2 and 3 ran here without being exercised; for
those this shows only that nothing regressed. The UAC1 counts are also
small, 4, 2 and 1 runs plus the 30 minutes.

Tested-by: Chen-Yu Yeh <chenyou910331@gmail.com> # Milk-V Duo 256M

Thanks,
Chen-Yu
