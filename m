Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795260743;
	b=zE5xuRUOKzuSMnSulhd8McEDcHdsH0dBvOr94A6unyNK3JIXnL7fzZ9DPSFcigBs6YQN
	 oQZlnJSxeblDBEsDiIGDos8z+X8/0In7mKDle1EQDh4961mdt1WopxHQzUvGje2bLa7yX
	 26DojsVGRL5fUPJoyvUq+/jnNF1wvgGAHYEoG7/rieWu3mrYV3g/snO7BPgULXLJX8JBZ
	 HzPMszmp9cM4+zWic96gs5InfKpurWg1Pvdure4TTlm14OuPxvXIkGoosK+ZF+nqcp2/M
	 XadYKOzr3kfEtHYHnbtlbt3r235ToeRMuqcVgEB2nlkHXVzqA46DTU206Y7fLZcJEGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795260743;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ZXuntybJT1A6GUEbL91LqiaVHs19KjdwrOYp+ImkAiY=;
	b=29pTgXcUuQB0EMjacWZW6/91L/HxZQXX/wIhMQAh5yql07K4i6KrhIjuognNPDUWarPE
	 ZSPiXRS5vTSAVgVwvoT7bE4IoMcXKAYwDYQthbcDLM4ayY/cZmHak4USQEbGam+l+kAC7
	 j7oZiBLq+NawjaNxIiofFL0rkp5PNdWaAOYMdq0U0n/oPqLAOYUv9o7+vr+HEvIyNpL37
	 OlvxveVoCsVAkkp+p8pvGq6hxKXYX+hdRy96hz/mE2kl4hO+O2q8l9WwYtVLW9M7RtmoX
	 0mwTpGFhRCAj9u43ubhZnk6rjhH2zbhZ0fI1NW2R86noGpiklJfHeB0Ma1GzUDAbVYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=awXHIMFU;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CB9606A32C
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 11:32:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7CB9606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=awXHIMFU
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8a4c72951b8so1261735b3a.3
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 03:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795260742; x=1795865542; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZXuntybJT1A6GUEbL91LqiaVHs19KjdwrOYp+ImkAiY=;
        b=awXHIMFU2iGkBZe5K4YcymCQ39mQgTUowtrLC42Vg6JWNnGurpc57y9EQ5kW2qJO2G
         ycxwGQgRMLOWJ53Lo/YFyBjUXoyFGyF1490dIYY+rismXiSzV8jfoz9FYQXth0gqR8zr
         iJrkabmvUyY7aYE5E6QIsU2YSAX3gF6A0NbAVg7aA+BAyTiRn2+7NGQUeOOzcIUcoylm
         0YWhQcDYZOZIryPLNkXy+CD0C9TYUcAF2xhtxAO4Vjw6qOtr0/roLgvn9De/7vjSOPdV
         QgfG+sK3FyLTCftx8IslTww9d/iCzuwBD1pacPaEsd01I2pSqFRaMs7tR8uVi6bwuGo9
         oRWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795260742; x=1795865542;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZXuntybJT1A6GUEbL91LqiaVHs19KjdwrOYp+ImkAiY=;
        b=gJjJtEZF/7qHcTpIPP9Tv9Atgv6t0bAu72TUyFGfOJlXop9gWgr4DV8zjjlLEt9aS7
         zYTqTQi1lkeNdoEhF8XPJyju8cO5ti56gggxJB6RE4HPIKxngzli+me+TjPDrqyyDqSI
         t5fC6vTECByl15Arprt26thO+suvoQKbdBB0o97qTvRq4/+JiU4jOBxfnamh4pX+QakT
         qYaGizVgSRnIrj9TySPghwRf8odZP94bAR/98dLQcf8uUsxF79QtG/YUCmzhrsXaBu8b
         BkkTucp+uPwMrr7pnTE9ajHnhyzSdbBoUb4HHlz9cz/2EzxJEp0pe7QAxIQ7eXhX1ur5
         jDHw==
X-Forwarded-Encrypted: i=1; AL+hErHTZ1X7JX1YHSPWFV7l4tDyEMVeEZk8yVGszwlR3ZJe+sIGcsaGEqmIOz2ARyjk+7a2CC67WIDLFAzUA0w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QT7QG6L6ihZlu4IOFMp1GMilrwc48k2I8xy+gMdyLFqmw9YFb
	TIkTKsm8jrThqIErXKFRqKfmIyNU2jzURvra/qJrVpve2oAInRXTGEmW
X-Gm-Gg: AZFdTZemzaCJQMetr6NmOmG6t+lUwgbJpRDioSGL4ap/hFBk/Xsh+QTZPPrdd+Ax27F
	XFkqVvjBo6pBKBZVkLWTrmF2ZpRIoeD6h/CuCvRovFV3/yEUt6eT6nX+FMBJJbSlllbcVmvRK5b
	gNJwaEymrUV21Zn3AXuq5h8bCpd+YEcL34hkdoKtwfTxbzGEXjvrOErC1xosHTy4ZdmVHsnWW6a
	SWpn6ixhVv/x9KBb+0tFH57/EcExIqtvUVeu4Vec8C0LPf7jyT1WaLTJ3L3P+wwm9OXvLesMwYC
	iOg7ERKd2uu3Ts01E4G3CLRW8cVbnvdnLffSq4zG8qFUqO0TouXjuQdKi4njaykLoRPQAnKaexG
	rL6kYcJfGIyhd1ZeJvtjNkvtIlIqy82csJ2Eh1whqDnHskrBCr1N6l/crHUFmih6aHidFS7Ogaw
	zZCGr8zAqT65S2XAxsagcZbLj1ncSeTAX8FTTYKTMHLlliB5oSdjKOKOePMhPNzxpgR2UYWfqCx
	w+DFdLbtwsctVYiVunUoaXqSmthJSNHGuOir1B4bXc43zaIRFFSG8TsuQ/gFifyLyRZ8kHug6xE
	ITRBY7+q6QYaUWnAwWTd9QntmFzksOkVuM4/Rfp58Q==
X-Received: by 2002:a05:6a00:1818:b0:899:67fe:3c52 with SMTP id d2e1a72fcca58-8c87b4efad8mr6004537b3a.15.1795260742071;
        Sat, 21 Nov 2026 03:32:22 -0800 (PST)
Received: from [127.0.1.1] ([220.196.193.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c908a56acfsm2149772b3a.23.2026.11.21.03.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 03:32:21 -0800 (PST)
From: Chaosheng Qu <chaosheng.qu.linux@gmail.com>
To: linux-trace-kernel@vger.kernel.org
Cc: Steven Rostedt <rostedt@goodmis.org>, Tomas Glozar <tglozar@redhat.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] rtla: handle SIGTERM and test abnormal exits
Date: Sat, 21 Nov 2026 19:31:27 +0800
Message-ID: <cover.1795258353.git.chaosheng.qu.linux@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

v2 mixed the SIGTERM fix with fixes to the test harness and repeated the
commit summary at the top of the commit body.  v3 splits the test changes
into their own patch and writes both messages so that git am does not
duplicate the summary.

Patch 1 adds the handler that was missing.  SIGINT, the -d/--duration
timer and a failing --on-threshold action already reach the cleanup path;
SIGTERM terminates the process and leaves its tracefs instance behind.

Patch 2 adds the test for those paths.  Its content is unchanged from v2,
which was run against 7.3-rc7 in a guest for the SIGINT, SIGTERM, timer,
action-failure and repeated-interrupt cases.  Sashiko also pointed out that
a signal delivered between instance creation and set_signals() can still
escape cleanup.  That window is real and pre-existing; moving the handlers
earlier changes the cleanup ordering and is left out of this fix.

v2: https://lore.kernel.org/linux-trace-kernel/1794300001.11111.1234567890@gmail.com/
v1: https://lore.kernel.org/linux-trace-kernel/20261017122359.402696-1-chaosheng.qu.linux@gmail.com/

This replaces the v1 submission and the v2 series.

Changes since v2:
- split the test changes into a separate commit
- drop the repeated subject from the commit body; the harness changelog is
  gone from the commit message and the previous-version links are here
- no functional change to either patch

Testing: v2 was built and run in a 7.3-rc7 guest.  v3 only splits and
rewrites the commits, so the code under test is identical.

Chaosheng Qu (2):
  rtla: handle SIGTERM during a run
  rtla/tests: cover cleanup on abnormal exits

 tools/tracing/rtla/src/common.c               |   2 +
 tools/tracing/rtla/tests/cleanup.t            |  70 ++++++
 .../rtla/tests/scripts/check-cleanup.sh       | 211 ++++++++++++++++++
 3 files changed, 283 insertions(+)
 create mode 100644 tools/tracing/rtla/tests/cleanup.t
 create mode 100755 tools/tracing/rtla/tests/scripts/check-cleanup.sh

-- 
2.43.0


