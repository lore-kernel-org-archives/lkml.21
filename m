Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795290392;
	b=Az/1XJ4ir6Gi5rRYk/B10mEJPAn7vAQeg+xRyad7kjI2liZxYmozevPJ3Fk79k+gHEhm
	 owoSzkItC+d2TWnQuMvUuBO9/3LcfUAcYDQTKB8R+KtCxaJyl80Mf5g+mVw7jk4taSQYv
	 8o9CqrFbZXrDC1qslWWMgcV8uCjzoXDfnpUIDLD3c2YCR5uZ8csal2O8pNmQaPMHP5ach
	 GYtb1zBR9y+MIZLpgZ+X9sM1iYNymMTAoHXTxqHpvBqVW1vBFtQe9cmvRD6+JduKEL4aG
	 VUh9CzpuOv697NEg0FoACMvmTQvwILb93tym88D0VWpbezr5WwoRbyveMvnokLznikg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795290392;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yJc+Wt4fOXv9lKIbLRudbJ8bjzhr642vvze5CNqSCc0=;
	b=yF9XfvHTDcWCwbrFOXDrV1AEYG7c6pBIJCEw31N8WNQ7n0dKLA6hvT/dZ97rb6BwWzvL
	 dw4U+sO4xbMM+NihaS319qKbgXROx49U6CuZy00D5ySeMULnXHmIORiOMfUOFqYa4dKxR
	 SCMllWyN3oXbbzYUuTvyn7lqApmzCF0cdZo+dPxTxpHJG2Ih5JMU6JkJ4uN+iyB9YxZXp
	 XJ6B1ZJjsPWK0lSk4uJwqNKcDBif6/IViDERJdp1Kw6w7o1diXxKEL6WNISVaxM5r4FHN
	 j7YkEqwpMcWReMkW6JM5pwlJtiYuWLeoebApSaDoQNhHOZvl9Shn0Q55oCQKp3Y6+rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DnTDwszp;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADE8606A32A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 19:46:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4ADE8606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DnTDwszp
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-49a92144733so983919f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 11:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795290390; x=1795895190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yJc+Wt4fOXv9lKIbLRudbJ8bjzhr642vvze5CNqSCc0=;
        b=DnTDwszpB8ZxdI+yOG8+YfZb8EhJeSqj7lJhE3umK4LXme64ndDQXUBASwSUca8QZP
         Xd1XEe+FFXSMtTxZJcLr4hvV0nQDV8vBI2uu2FccXimeK1iwrqEeiOHxpdnPUXaK7Juv
         Jy+CoFX3KSQRBhSZwVPD6bPZTpzWwRP6fexjfzcDQLKeYLJKWwMjd6YBxJaKbF3w+cqu
         robjyqD6B7EwcyEk1/GfqGMyMkQ1RcE5Uejru7jnMvLbZE15JUBvtkWh7V638WdklrNi
         PGQfsXduiBRAnTgPgXj+cnMORuvP46NtJU3LAhN+uBN+DumKCmpJZB3oGNW8NGq2OCC4
         WOYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795290390; x=1795895190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yJc+Wt4fOXv9lKIbLRudbJ8bjzhr642vvze5CNqSCc0=;
        b=kqckdFMZx3iEZxUws9FDatiWxjATTkcR2QRCu3QI6N7OAC1xdKqHBs6L+mo6ybQHCX
         O/b3CgazR4pR1Z8IaRYJJ19nblPQC8KGz4Ei7liCsaPJEtgaZP2amKF85bMYHMZiCdz4
         PKNbk9ykTA1Q3E7aKLYrITvjak7aCaDVR46pDmG/oD0lyB7oJqaw/KW4bzRyvCTrZGV5
         xQQ1zhwCfHtm0aj1vlkp7MSlWkMMUs/cBBsVhzSNFYMr9yhkQkg76s2+2519zV08q306
         ZhfSflXve4fJmRL6yqzOud9IGrDj/Ip0UzwvtGNVaihwF9xp4h3ZiLgcJzNhe/t1ma3l
         WI/Q==
X-Forwarded-Encrypted: i=1; AL+hErFj3Pm3WoNbg2I+4za/KkbXplXObE5kquSjJNVhEwU46WIYlO5YMDA5bgSj2VUInSXnHj2VgIzNbxjZ+MU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5uFhgj3YCw8HaIj1iLOIwzHzMN5o161XgO55pkMFUky7o6N3S
	ph4i2tCzyQzmUyN5vO4NcJcNKc9uy44eTa9UTO8VbdRkTn0biIxMpLBQ
X-Gm-Gg: AZFdTZdjWxlflw8N+wvbX0aVLwt1QOSsbCIylqSnpYR05zjGScshSTwLkp0lvFfhQP2
	zWam+AVA41kb6Fe4xsPqJYAtVMnKcBjGLC7WdmiaGFE4txbwaTK6DiHaZ3JNchyc+l6u/lRGe25
	+hLKDJPpbN50t/8u9/b6mbQl85TXTVRPpQq7/tRWv4wP35VIilNXX7HhRrwZFXPDlFLGLLsiWn0
	6EQT+lX0xYmstwl0/5++hBJ3AMjE2qYGLTZLLQRZhx1GfnF6gyE4ZsVn7gECyUorQQEq8aBwwOg
	bNwDT3t9Fz/OIwbr3U5BO2/cZ1Du0BQ8VdEqjZbm3kCf20ODMbu0t3agypDzQbp73pzt00BKdx3
	bEIdrlBKnKeJJqLg1SGJ644sDd37lscFJKQpfwBJU08mxYNkB+xsRcXWlsjfI+QqVMIowDIbZJ8
	D7GrwLiIEOjdTGXbv62ugdB3RVaEKX43Y1AB7cw9RN1VkVkr7U2uaXAGiZ4ZEHQz8EaHA/+504M
	ct7PlqD98QTEymgFUlp+zlaCRJLEDp7Er6ZrILW+9XNaZetva55n7pojPa8EXN+mLBVV4J+1zxl
	MavrUsj9tqPfK87s+aUQuXdXmOsEBukct9M=
X-Received: by 2002:a05:6000:26c1:b0:48e:5e20:1371 with SMTP id ffacd0b85a97d-4abacfea2c9mr15674261f8f.4.1795290390484;
        Sat, 21 Nov 2026 11:46:30 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf61b8sm11830367f8f.19.2026.11.21.11.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 11:46:28 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Ping-Ke Shih <pkshih@realtek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH RFC rtw-next] wifi: rtw88: raise the TBTT hold time while beaconing
Date: Sat, 21 Nov 2026 20:46:28 +0100
Message-ID: <20261121194628.604026-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <95610ac92e284b3b7b32981e14c380fcda09fcb7@linux.dev>
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

Hi Luka,

> Your captures fit a beacon transmit deadline. The RTL8822CU vendor
> header says data queues can also wait during the hold, so I'd measure
> latency around TBTT under load.

A station pinged the AP every 5 ms for 20 s, idle and with TCP in each
direction, 0x064 and 0x0ff taking turns, on an RTL8822BU on channels 36
and 6 and an RTL8822CE on channel 6. Each ping was placed in the beacon
interval from the sniffed beacons.

On channel 36 the idle median was 1.7 to 1.9 ms all through the first
10 ms after the TBTT, with both values. On channel 6, where the
neighbour's beacons pass our TBTT, the RTL8822BU pings of the first
8 ms after it had a median of 3.4 to 6.7 ms with 0x0ff and 2.5 to
4.5 ms with 0x064, and 2.3 to 3.4 ms with both from 15 ms on. So data
does wait there while the beacon waits for the medium. The RTL8822CE
showed no such difference. Under TCP load the median was 20 to 80 ms
from queueing, and neither the time after the TBTT nor the hold value
stood out.

> I'd start with 0x0ff and cap it for short beacon intervals. At 10 TU
> that leaves 2.08 ms before the next TBTT. I'd measure beacon loss and
> data latency before raising it on RTL8822CE.

v2 will use 0x0ff, capped at a quarter of the beacon interval but not
below 0x064, and write it again when the interval changes. I will leave
the RTL8822CE at that.

> I'd expect the old template if the MAC has already fetched it and
> still sends. Your v13 tests also saw missed beacons during a write.
>
> At 100 TU a late CSA worker can pass rtw_fw_csa_hold() at 6 ms after
> TBTT, inside the 8.16 ms window. Could the guard account for the hold
> and beacon airtime before a rewrite or switch completion? It currently
> skips intervals of 20 ms or less.

I have no measurement of which beacon goes out then.
rtw_fw_write_data_rsvd_page() clears BIT_EN_BCN_FUNCTION for the
download, so I would keep downloads out of that window. v14 of the CSA
series scales its margins with the interval and runs no step less than
5 ms after a TBTT. That covers 0x064 and a beacon of about 200 bytes at
1 Mb/s, not 0x0ff, so v2 of this patch will make the guard the hold
time plus the beacon airtime, and I will repeat the countdowns while
the neighbour's beacons pass our TBTT.

> To me it looks like a station scan on RTL8822C can pause AP beacons
> through rtw_hw_scan_chan_switch() and rtw_core_enable_beacon(), leaving
> 0xff programmed. The vendor driver restores 0x64 on scan pause. Could
> we update the hold on scan pause and resume too?

Yes. With this patch on an RTL8822CE and an RTL8822CU, a station scan
next to the AP cleared BIT_EN_BCN_FUNCTION off channel while the hold
stayed 0x0ff. v2 will also write the hold in rtw_core_enable_beacon():
0x064 when a scan pauses the beacons, the beaconing value when it
resumes them.

Mehmet
