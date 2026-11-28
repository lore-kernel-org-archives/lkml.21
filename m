Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795863967;
	b=P0AO901TlEV3TczhVFk9YN2fJRfFxRKZre1H+hYdJdcP9j/YiNljUkfKgce00kC915zt
	 9LGzdNjowEJZqNdLulWzKwg4S25AgUoPBhuDIpWCPvWWKKspmsBt5/VmimxVI7CuLaxEn
	 2ZfiLduLVWfr1lGmWTEsaI5zsPciQjeMEndHXCUmafJn21u0z3hRpYyGk7AhZWCunRXyC
	 cs9EP8d0MonTp5xVWlEYyz+2pyqOAPIcUDGthPSGUR7GOyQTdm3EYv2NniPiaX9OITEIE
	 o0mkjspDagdxgOwchLLAPUdkRqPPK8v9kuJg76+jzJK/7jth0s6rJJMpKDF/hkmnHow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795863967;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9elUEGS8ZMCG5n67rjT/NP1myfuDmUd44dHD3MtYbHw=;
	b=CJCpGNEFoxfwIXT3uJRXtdX27QTAteLkSeqHibO4tz8VlcMq+rQn6w244i7YVsUtxydW
	 oyY6PBTwvOET62YwO2TuqSssii1J2KAXZZZbltpUhxhcmPgAcQAtRAzc37clxtpVucHHQ
	 dgKRNa+nvKkHiXStkVLRwiy8XdeSQuDFg0gmW3OLEQpGunf2nlkSwKg5pojrGvCAyhYoj
	 jW49wzTVmfMg82bZ5fF4Eb932BRyWnYKO3W+W2NqgYgtRILP00dvhl91o7ohvjIb3OFXW
	 IiSv6P1fRCwmctmo6sbKH49otx6fGwzUDC6ffGm+1Yqo6hb6TInQA53oB8s9A5gkGqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lzMSW5Xv;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854E6606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 11:06:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 854E6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lzMSW5Xv
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-386c4d2e2ccso7279296eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 03:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795863967; x=1796468767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9elUEGS8ZMCG5n67rjT/NP1myfuDmUd44dHD3MtYbHw=;
        b=lzMSW5XvBZa0Km+PMZ53MbleVvm8VgMV+HSwO3D/MBIwJwFGTrRaPMAhap9mNF8In8
         llBvC5YzKaHvU5Amsd/GQVKh7qQFcUMxp+al3gtZUDa83cyFeNs2KsDy2xkg26TBhS5+
         KE+lnfzgi3ydFs7eFK85AJpX1J7yo0+lG8NQ+b6KYyAalUyD4L89QwveW41FUgy0gdyV
         MA71DPjVHVvFrKmaDGGRIQuoc0qGKhvtNq0Y3vnVUOhM4SIfMx3I+4GMJZuH7sRxCfaj
         8mSNkga1wPS3mziJyN0XK+se5Voi+qZduXGfe33/dmH00fKGM3XZ3dF7vTbEB4N1fjHP
         67iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795863967; x=1796468767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9elUEGS8ZMCG5n67rjT/NP1myfuDmUd44dHD3MtYbHw=;
        b=NWUD0G9vlr4nNX03M2VlzvmHUEdo6c+B2e8601oFMkQXm0Sm1OT1t5IDgaM8YFnlCx
         AAGqAl6IXGhBqlKXB7MSt6TTMcmljnzpBLPCIfoxEUl54P1+8RX/6KsHJHeG1wj8+wze
         cBnBYh0Fjj+FSCqwAROox4gljn+AdDSzmXQspPfavIQ3N1ZL03DZ/q2/nr7NZhkRv0Wk
         FJc5hrQgNdxWRp7R6mi5QII5ZLPk6zbgqSpS536y0rZZC58trf3YLza3+AQ9jiEVbT3T
         yofZAej7uc0wqiX2Re3jOWelALnmz1vg85dkAowfr5gzyK1LmJs6uZS0UvySrS7Y5HcB
         HwBg==
X-Forwarded-Encrypted: i=1; AL+hErH8YyVNSelKPAwXkkoTRoke8dsZr37lGzYl5sFi8UGDAapDpY6XLeP433kWKqtffSaqKg2dKnkt4QJffyc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xpNfHhvM+4Q57sKkgJMP6tPBBT9zrZ5aWCldyzy1MI4kMyIs4
	iDsvfU/mNRDWTyhfhzhKj5BlDULT6dTIv6gR1cHhnRYYygDDnaHvPwkQ
X-Gm-Gg: AZFdTZe4Ihyu/lNArdmVmwkZqjbyzsBrQt/E94VX0B3VgQvN5LtJOoRrp6nw3DWMEjw
	1GKSHxKqTzB4QGl1Pm3TCMkXI1D4Qk57jBcl/x4CTG4jpMehUUcoQIiCh3TtbmJNeXau2bPyhXT
	PKRaBtJhgjF0elmNTuW1F0bEFaFl7kTl64bb0n0u7ZLpEkGd1ue4qE0IqSH62fdJBDbH/WtUaOv
	fYxDGSaf/Q7fKk4NK/GvDAqxC9PNglLr+KxPAtjOIE3qAMZLXnkTUsItfRKf1/QewY99vSMQONG
	B5TXrd3xVlwa4W9L5pzZptqx5BL0SycFpSZt7+zZlcL/RuoPR2cgM8d8QmlA3r612ZHLZS+ZQZ/
	+BM1BrDS+T3gaUlMCSW/So7V19FAOXWwfxkVYIHoib4ClhHU1ZhB03pXbeX3ItnWWiUqAFU31ER
	hSyo7Tq1p3u7vPiEp/oLQQaO5bTptT/sDavvjqA2X9fDevOg3u6uwt1dZGPiU0ShnIfyHk2NSP1
	DrkUHKSFPhtV/4r5DrYsRRuIx+RGDMJ7KmT1mspJLjPJATmWsNl45F6FSOQ8nA3vistiyuUFF0D
	C5FECbBept9UAu2Z7i5nyTtd09g8sW8uNFUePiOYJ4KL//Sfg1WF7ZIo/ZMkSVMCr0QA9fJl7AS
	Zl2u8lWDY7FfRMh7KdLpKQB9CWprYU7mO0l4RNxUdDXGpiAmqSPwcrrQeI6zheVKRTiGTsc/B59
	lSN9svWHA9P7TQo1IHnjq2BUtxsqhnxlOewI/pEEjogUOP9w==
X-Received: by 2002:a05:693c:69dc:b0:386:aff0:6109 with SMTP id 5a478bee46e88-386aff061f8mr18761873eec.2.1795863966589;
        Sat, 28 Nov 2026 03:06:06 -0800 (PST)
Received: from spark-da2e.tail8e743c.ts.net ([211.105.22.106])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386c7c62a91sm40958970eec.17.2026.11.28.03.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 03:06:06 -0800 (PST)
From: Jinmo Yang <jinmo44.yang@gmail.com>
To: Ping Cheng <ping.cheng@wacom.com>,
	Jason Gerecke <jason.gerecke@wacom.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Jinmo Yang <jinmo44.yang@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: HID: wacom: battery teardown races with input reports
Date: Sat, 28 Nov 2026 11:04:03 +0000
Message-ID: <20261128110415.772810-1-jinmo44.yang@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Found by coverage-guided fuzzing of the HID subsystem through /dev/uhid.
No patch is attached; I am reporting the lifetime issue first and can test
candidate fixes with the standalone and syzkaller reproducers.

Kernel: mainline 7.2.0-g66498c75b4f8 (arm64, KASAN)
Files:  drivers/hid/wacom_sys.c, drivers/hid/wacom_wac.c
Impact: use-after-free write; kernel panic
Repro:  standalone C and syzkaller; also reproduced on a Pixel 9 Pro

## Report

The clearest report is a write into a freed struct power_supply:

  BUG: KASAN: slab-use-after-free in test_and_set_bit
  Write of size 8
   queue_work_on
   schedule_work
   power_supply_changed
   wacom_notify_battery
   wacom_status_irq
   wacom_wac_irq
   wacom_raw_event
   __hid_input_report
   uhid_char_write

The object was allocated by devm_power_supply_register() from
wacom_battery_work(), and freed by power_supply_dev_release() through
devres_release_group() in wacom_destroy_battery().  The freeing worker and
the uhid writer were different tasks.

## Analysis

wacom_destroy_battery() releases the devres group before clearing the
published pointer:

  if (wacom->battery.battery) {
          devres_release_group(&wacom->hdev->dev,
                               &wacom->battery.bat_desc);
          wacom->battery.battery = NULL;
  }

At the same time, the input-report path does:

  if (battery->battery)
          power_supply_changed(battery->battery);

This leaves an immediate freed-but-non-NULL window.  Merely reversing the
two statements is not sufficient: an input path can load the old pointer,
be overtaken by teardown, and then call power_supply_changed() on the freed
object.  The create/destroy side and report side need lifetime
serialization, for example using the same exclusion already held by the
input-report path.

The reproducer alternates the wireless-module bit in Wacom status reports,
causing battery creation and destruction while continuing to inject input.
It requires only /dev/uhid.  Besides the KASAN report, the standalone
reproducer caused a Pixel 9 Pro kernel panic in power_supply_uevent() after
about 11 seconds.

## Upstream status

Rechecked against mainline, linux-next, HID maintainer branches, and lore
through 2026-11-28.  The defect remains unpatched and I found no matching
submission.
