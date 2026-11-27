Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795807385;
	b=Tr9VN32vrEhYNDOnmWf4syFzLRKbQDHGpNUFodgoquGW3wsK4zfiBeVx95RCdtJ1H2QX
	 ru8L2nLx46k/H4sdswN6uE3hq2k8zrN9DaYRtB2ikcfxpahepQyTegzGxlxNST8oxQgBI
	 InFiI4MaI7K8qpgAJua7RHk5TlZaReQrtCHIvIOvq2nsyJS9+GFNyLiSeVkwgYzHYMN0d
	 vA5YpGql8bcP0WP7Zeybt18oXSC6LDdBI2psK3SYIkstChm1S11aA2K/Fcedqsm7ouyz0
	 I0jhuB/DnWkz++Zpif9DEujLLTzv2OoDGvAluCv/Dgyxsh513ypznvxS7dEpkpLg3rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795807385;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	bh=A5PBwT6ZNCwVmsIPiFh4/k3C2FoMFCyG+qeDVaNXFlU=;
	b=Cu3gAAe6cpo7Yy/XDo/m+B6yuFHoay39RAlu7sxRbtrL4oG1syXGlEhs/RXNz5XTa4Hx
	 ywlzlnPQnjRRPQl1VaNLgOUl8cg8ATlHt24RfFSXiRKpk6T0pKQ+/N+4ycu8MrNIXtcCr
	 Rlt/tc/1VsRniZBJDTLCrYCzzGJJSp32IkBkJAny3VMldeqiWaF6k1F6/jsZmLjQ0u484
	 jtN8aL20oNrmZGVcQMCYSIj5v/j1HU4KYr70hVdNAyqMbz0iiyWRZHz+2YDExZIrKN7mG
	 i6wbOZkM/4jsvSQQp36gF8/+sX/XLxoeNNAUa9nmZbw8/L4Gfx0jwXsB3avoUWk1tJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dNcX51hv;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA80606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:23:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EA80606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dNcX51hv
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1b589050416so2363756c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795807384; x=1796412184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A5PBwT6ZNCwVmsIPiFh4/k3C2FoMFCyG+qeDVaNXFlU=;
        b=dNcX51hvKeWVxsSS7Rod5LgR0BkAW7PcUWKWqg61xwcTweTcPN0mqgLymc6nYPLo+8
         vGk2cvNZ9iuuakxLYyGZBK6xPVRDPYaiAMUNWKG+e9bkWV76htEq/DWwG16b0dYlDqIM
         zr6F085pac3Jy3ttY2COv6VWulEvdtAlsRG3cPAPdchcuKS7SG8Ipk18zI3B9ZJs5gcI
         qdbgxwKX60dR9ysa3H2wnm3lotZ1FdNHiuP3uCI/YyySik403p0ppPcgL18G2gNsu+VM
         haEgCcojOGeYmNdlDM0wrarhd0oK0NDOwAoBrixEEC970bdWTWxg6gVBqC6GFtzb5Wfw
         075w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795807384; x=1796412184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A5PBwT6ZNCwVmsIPiFh4/k3C2FoMFCyG+qeDVaNXFlU=;
        b=t1ZsXiGOMGjuEGKV/Xj71VojqQ8qq0MJKcRCAokvQO9jhGYTuxEMMSNy99qYSy4rQt
         4CwgH5eJVFP3DInSgOIE/bT6P4Bv/3BPIeFBH8I+lR+3hOebj/Qa2JQlvraIJEwrio+G
         TqbnSI5NM3RZXOln8P05eUxYdh9JIOnK13NsRZVIb+dBBbk1BLFJyP1YTFeOZ0nRGrhW
         Y+qo6G/aqPuwXvSf78IGDZuX96A1fqB1haJw1Fh4h01HQSnhDVNjvvRgAsrD6dhJDAQ1
         9sBpAtirru7u6x0qnrdGDYBdfNXOgdcFwUDSjbGtWcG0Sm/t0euYiQUCtWFEN63GFUT9
         7C5A==
X-Forwarded-Encrypted: i=1; AL+hErE7bUOLzUo3E5VCpAv4DsDZKIRAQ0RXZaDRjLKrhu7Ypdno6MeHgb6o2B06w05ij8jyMe7iKZcRItmCV7A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zxvv7/44uSmEyvtaEqjmLyBhUqwIkKKqMWcW6uSBTZay6gEnd
	IHM9F6PJzOSxXGd1gKRCRUpFkN2PwXDBtZ4+IzbxcO06PxeJUqiuOond
X-Gm-Gg: AZFdTZdEeWIXsdU239DAyvbo9S/4fqVcFii+p9zAlsROkkGh7G1TgYjhzL8JTpVNk9d
	T76nsjZD5QUkSAVElZIIzG3e1YMX5WKe/vhEyDVTnXhWOH2AJ3miw8NXoT43/voQRnUade0Cw3i
	K/HurcXzF25gOBRwXhMkcAGZMqtlIeKmkCaPBxt8uU5VqeI7WgqUXGD7sqjxJNuUWoQ7S6jNPVK
	bAfEHB+KvbIZ37yATp/Fl3zczl43CwRMJTM3TKq2gC5EdoWiQuhcAorku9H+wVn5gQS2jAo+WM3
	xUIImtC2HHDaNo8uzOwmUfTp95Gt8088GDzrez3nbxsWt54MPBJIb7MQFhpuY/h+nzb/h/1Z7Uf
	kJgQJGK9xfVxMcYAhs6gPHXM3S+M02stUsXAk7R2A6xRA7JrJp0gApH4nKLNtDHjAkajpJKr7Uh
	ev5VkCbAagt8YQuwsV8BmtNkYz5EEs7xtO10xtAMM+mwoTlteKk/SqKOelUWPmH4Rl6AeFGTBld
	nHFRAstBaiPaVj1+pMC7n5BjgRpyw77j5Ij6GuwZBdAXNX9wpOMGKv++FffGtDPPKX76BBRZaXy
	4cQoQ1EhW0i6IpfzjF2avmfJykbihjBHuwopwml8kJ1uaeek31MDdfaGDTZEi9pcgv8+o4sVurP
	5vDZEwCOrKi6vyaJxL/pgTrwbMyVsvHpGRw8uoxDs05+CWeBzElnfp0Nf1HTO2A==
X-Received: by 2002:a05:7022:1585:b0:147:8a40:cdf3 with SMTP id a92af1059eb24-1b5568f00a6mr24043670c88.24.1795807384501;
        Fri, 27 Nov 2026 11:23:04 -0800 (PST)
Received: from Mac.net (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm97005883c88.9.2026.11.27.11.23.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 11:23:03 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	arkadiusz.kubalewski@intel.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	jiri@resnulli.us,
	jonathan.lemon@gmail.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	milena.olech@intel.com,
	olteanv@gmail.com,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	vadim.fedorenko@linux.dev
Subject: [PATCH net v7 0/7] ptp: fix OCP routes and SJA1105 pin direction
Date: Fri, 27 Nov 2026 11:22:55 -0800
Message-ID: <20261127-timecard-driver-v7-0-ahmadexp@gmail.com>
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

These driver fixes apply without the PTP-core series. The OCP detach
path and the shared-PPS shortcut are unchanged.

Changes since v6:
  - Drop patch 8. Removing OCP's early timestamp disable needs the core
    cleanup change and separate validation before it can be proposed.
  - Serialize OCP route changes across sysfs, PTP pin configuration
    and DPLL. Reject unrepresentable 10 MHz plus auxiliary routes
    without writing the mux. Document the selector encoding and the
    nominal-frequency readback rules, including ART.
  - Decode both input and output enable bits when binding configurable
    FB and ADVA pins. Leave fixed-direction boards unchanged.
  - Put SJA1105 PEROUT pin selection inside the existing enable block.
    Existing SJA1105 enable and timer lifecycle concerns are not part
    of these enable-only mux fixes.
  - Correct the disabled-selector explanation, align the author name,
    use contiguous trailers, and retain the DCF Reviewed-by on the
    unchanged code.

Validation (local fixtures): strict PTP and SJA1105 PTP builds on x86_64
and i386, allmodconfig and allyesconfig. Source-derived tests exercise
serialized selector changes, nominal-frequency readback, rejected and
accepted 10 MHz requests, 768 rebind states and SJA1105 pin behavior.
No physical card or switch test was performed.

Coding-assistant support was used to review the reports, refine the
SMA changes and tests, and prepare changelogs.

v6: https://lore.kernel.org/r/20261126-timecard-driver-v6-0-ahmadexp@gmail.com/

Ahmad Byagowi (7):
  net: dsa: sja1105: keep pin function on EXTTS disable
  net: dsa: sja1105: keep pin function on PEROUT disable
  ptp: ocp: preserve timestamp routes on DPLL frequency changes
  ptp: ocp: recover SMA direction from both enable bits on bind
  ptp: ocp: report disabled SMA inputs as zero Hz
  ptp: ocp: correct the DCF output frequency
  ptp: ocp: match ART DPLL frequencies to selectors
