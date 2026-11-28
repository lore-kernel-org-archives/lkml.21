Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795863981;
	b=f9kNexdW4yk5ZfMhIJReqibuE+9O+y2rMvjj2rRsimrRH0zfqFa8AFwAbsMrlxAXL5a0
	 PxboE9V7nKyG4vs2Zdm1RpiX1yjXITZbydrc118h2pdrYnXk+/s8v7ynLSaFZrRecu+7R
	 PtVhpmZ9ASXhsllcKSL5i1D64H6R2mmIhiRmGc6xqEsbLJ1jbIpHjNuZ4v4JZK5gSzLOJ
	 ebEC02XEbKMYrmtDg0Jq2Dh7ifePfynnRegcv1mekkz8tAXkKVDeQO/uo5+UKRoGe8EhH
	 Nb3b+OHEskb9vl1q3LmOOOIEZ3EwBV8R1xYetelsGgNHX9eUtqFylOwuqrsrpkGv+dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795863981;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hBmsLpccqSYtfeFqDArwX/Cjh8UQaY86qSPYDgJAT6I=;
	b=Rkd++6mz1ynnofd3Gz9akobGsiSaL3wLiFKV1CY9WjcY6RmPpT7ToCGv48VLSQx3bBZ0
	 ZENQjhSpeOKX3KUrCdsaIueQFCfqb/ntmyx7lwoUIf9L4vb6irMvw55tbuTGaTr2gUBgI
	 uW7AMKN4P306S6d/My9KlNhYLA2lgh1zUGag2RVmhEtCyaD21kwfvKvwYG4XqOl0fxuVg
	 cjW4LsnwlWDtVRETggTuaZrFdHHqT85WIdD7k/eHYxGks8SXuwrVuNZEZqbFJ3P1ZL+wR
	 6phmvDtZEiqoTS3PK5SLhM8XnIT8YtS8qc/GTxWLMAg9Sv58Tq8yoslP4jAkq8gF8Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B0ajgfau;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729D1606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 11:06:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 729D1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B0ajgfau
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-38190551625so16922400eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 03:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795863981; x=1796468781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hBmsLpccqSYtfeFqDArwX/Cjh8UQaY86qSPYDgJAT6I=;
        b=B0ajgfauXmNsKGAfCGeuV0oWYZhmecn9WdJJRKopeJnSAKBDGwBCvz17dNHqXuAiWu
         5ryQffGo7gIURs/1WMuZcDMpUYKHoyOk+3hPhp4h0ODWbLaKt3O9Bx73lf6HDsM/ODWd
         FGOIeI+pKYtYQunF3ECJq0OEf/49igS9Bmpl8V+PPseRFoHSlrHnfPpgif8eTz5WKKxl
         STsGOxGxJKq7neUXshXAfC9fby2dsUECpW67VcRKR0DchIOT4NgeRsq7I/N6FiUo4yAI
         Nqr8RD24fHOo/dItBTTplpEOiorQ4VLYuhgi8ebHHPh9JryV3ZpU8zlOXVAwVD300LbE
         z9qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795863981; x=1796468781;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hBmsLpccqSYtfeFqDArwX/Cjh8UQaY86qSPYDgJAT6I=;
        b=PWS8nLt0Q0c5HgDTbURo0w8E1GHdu+onYTNCFPgaTSeCLE02rA+5/lhv2fYdAjLbCz
         IvbL3yvQUoCA3GedEmqpXEpEtWO7VFavgY+8VV74HsKHocOsbwYTc9XdZWPY6raGsZTo
         SjYQbVi9rktGSjElyujyPmGnFYtjWLSxZb+Gdd7y8pRRJZigG88qK6WowcOf/At+NSj0
         DrtB6ZGZLzg2Z2S36xXrhoveEEQIGfpjgrWCgW088H4bYH1owt9WhkSp7uTKDgYfATB5
         KeVlgtDFyPq4eYmO1vg3skwZ4l8fkRP0zuG+O4/F30l+LfxHqU+b58dMkC1kKGuYK2o4
         h6qg==
X-Forwarded-Encrypted: i=1; AL+hErEFBnteQq2RDYZ4MJ8UgbAY6Oqy3IQHNBXYYW7jGzg8edWUehAYlohXFLTNF7+zVFIiB4vnpzEj07RRgGI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3iH5pXlyRCsHqtM21jPIGMxnZR2WPpoat1aSCO+dpQM58mhl0
	tfkM3PYyeicfmFmSvyGOr45b0qiNaUPUgxbZUIV1kYGDfG4JTInNCdNj
X-Gm-Gg: AZFdTZdy0ozI7aY9RV2j6w+BoLK8Z7iw0U6q6l9+rk0ZFsvPCcYtt+wi0b71p1ZgPkk
	km8I0Dik+lW0LBuc8zgvvgakLNWt5P45zEAo5mBiGfn7nqcjSy697ieUKby7ZYlnPll4QjoWhB8
	lxbVWLslDITzk6t1XTF3zkBLvG8Pvtn/ULpyh9QvkQVaBd8D7VXRge69b/03qa4WJa+YX9YRnQm
	OgAkTVJBQ1Fg1GOQzAvJJsyvGRCPGLpFCyQMSrz8eCJDUdYkOJAfW/J/J0M6+ZVb4vZ8YdjC5bN
	yIBQTjcW2gq1baFVrySM30nJ1STn9XVuT6Zvvvnyo1VbGgxRv9U206C1he+4ybuTm2Ch6rzm12A
	Pj5G5KXgo0QxaPFKCk9C+P2gWkqlKlkO69jM1RBGPCnNxxVHzzMi0ilm+JXefH7PAnOJfHfr2kJ
	GzgJqu0cQVcP8333LpTsPo6f+wF9uLqJUu+GZJePZe4e0UEqwSMYso/xRZ4tFZW/7Hk5JLJNB0Z
	Lraqv3cfdengHA8Q9q6o/EBQBCh1P+D1redGBMXzaXKgB5aJ4rQaoNZ3psXT8Hq/qw6AQm0LtsC
	wr1VsdNVNSmuRtcupvWfbEOtvnKTDfXVpY7YhZfC0e0rP6NeWsZlUMzZnAxdPjMEVUlw4QFJBfr
	M1Exsgomd8AOwdl4ZOjdCjDKzg72Indkfvr3QAUt3uVju9cgDqblfhzQ7eL8FwpZr3der5C+XFJ
	UKaRxmkrai1989gY4cUg6GC3S44EJn8LvqHh2sfVAHnDCOQZbBNkoC4YameYA2p2d7Q2s=
X-Received: by 2002:a05:7300:2301:b0:385:4c54:3c8c with SMTP id 5a478bee46e88-3856c0c9403mr38890998eec.1.1795863980420;
        Sat, 28 Nov 2026 03:06:20 -0800 (PST)
Received: from spark-da2e.tail8e743c.ts.net ([211.105.22.106])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386c7c62a91sm40958970eec.17.2026.11.28.03.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 03:06:19 -0800 (PST)
From: Jinmo Yang <jinmo44.yang@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Jinmo Yang <jinmo44.yang@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: HID: magicmouse: battery timer makes a sleeping HID request
Date: Sat, 28 Nov 2026 11:04:06 +0000
Message-ID: <20261128110415.772810-4-jinmo44.yang@gmail.com>
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
No patch is attached; I am reporting the context bug first and can test
candidate fixes with the standalone reproducer.

Kernel: mainline 7.2.0-ge46c86b19f4b (arm64, KASAN)
File:   drivers/hid/hid-magicmouse.c
Impact: scheduling while atomic and subsequent scheduler corruption; DoS
Repro:  standalone C, approximately 62 seconds

## Report

  BUG: scheduling while atomic: swapper/1/0/0x00000102
   schedule_timeout
   __uhid_report_queue_and_wait
   uhid_hid_get_report
   uhid_hid_raw_request
   hid_hw_raw_request
   hid_hw_request
   magicmouse_fetch_battery
   magicmouse_battery_timer_tick
   call_timer_fn
   run_timer_softirq

The preempt count 0x102 and PID 0 show that the request slept while a timer
softirq was running in the idle task.

## Analysis

magicmouse_battery_timer_tick() is a timer callback and therefore runs in
atomic context.  It directly calls magicmouse_fetch_battery(), which issues:

  hid_hw_request(hdev, report, HID_REQ_GET_REPORT);

Whether this sleeps depends on the transport.  With uhid,
uhid_hid_raw_request() waits for a userspace UHID_GET_REPORT_REPLY through
__uhid_report_queue_and_wait(), which uses schedule_timeout().  hid_hw_request
therefore cannot be assumed atomic-safe.

The standalone reproducer creates a USB Magic Trackpad 2 uhid device with a
battery feature report, permits the probe-time request to finish, then keeps
the fd open without replying to the request made by the 60-second battery
timer.  It reproduced the warning at about 62 seconds.  Subsequent reports in
the same runs showed failures in __schedule and unrelated task stacks, so I
classify the impact as denial of service rather than a harmless warning.

The usual shape of a fix would be to have the timer schedule work and perform
the HID request in process context, with teardown synchronously cancelling
both timer and work.

## Upstream status

Rechecked against mainline, linux-next, HID maintainer branches, including
the magicmouse branch, and lore through 2026-11-28.  The defect remains
unpatched and I found no matching submission.
