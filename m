Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795661025;
	b=urE5I07o7eI9Vj2+hDd5D0Er7rNsRswPsV5ZAuXblRKccUeCA1otJvFGZBaDbxfy4a4u
	 TxeQsejkNnyviVOjcfoiifKaBzV/Qe54oQE7YRxZCtyf4nuGNvbkG5hXGkVXjGwBG52rR
	 t2sFLnIyVIClgMsWrPUmOsLDe/1J64S2VFpREEbuZKLe0fmpojCWauhq8CAJH9U3MCYWN
	 wFLqe8i35QmlqkUS05ct5OOKfgM0j8BQFOux0rgZTK7bEo3hUief2yruvTNiB9GaQUcCj
	 ERG5oj2d4m+N33zCpe7dxjvyBg+j9jB1XmkubqAfBruXhGwNsNAui6C7GNyh3s7GOLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795661025;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=2s/G/b1FYIMZ47gP2ccnxd5i0/ZdtDVq3vi7/8u2GaQ=;
	b=JD5xXPvDusG0XjFE0rU0CD/vr781r1DJ7bWguPYilwcKvnmU9AykQwofjvqApMl2hUHU
	 i2HlmQyNZtZYaN/38EQxWWe9Zojok5JUCniu1eaNJIoeGet5DIh6Xe9kTeZYkM73PbupA
	 3qgaSZ3IMeAUQBXizkUNabxfPk402ns3SiCVkEqvd0DTg04K3xJAhY9vED3pkMDjzjPzO
	 t0a3DU1VRMMvOGNoxd73ax+G1RT+pclpFvWjKNNmN04QHf2/S1wbneN31Lqzhq6Xhi4YQ
	 eI6mr9U0HM2caFRXSxk0oN9+GPQ3pwBboJ7x7M/Q+H5liQVyMvTD6BvMhqjhqpnJMDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--svv.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=I3Q79zge;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CCC606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:43:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0CCC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--svv.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=I3Q79zge
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386b8624cf7so3149171eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795661024; x=1796265824; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2s/G/b1FYIMZ47gP2ccnxd5i0/ZdtDVq3vi7/8u2GaQ=;
        b=I3Q79zgevz8od4Zy8zC5TxpMo7/RmIZiDwU3YaqiOMMZd/dpImlc3sI3pkqJHxaPy3
         oX5OxMDtdGScCDcnIpvE+AvEEiUeST9bS08HqA+ggc0qSoL8MXHvt0KnG52vnmPAUwo8
         6ZWxR+MvCmPi61A8xOdN/59YICt3DGJbhq2OwMY7g6HElXP0LOCSOSCplQtnVMuVe4mj
         54KOFlI7/+7fXRtQU2X5puRvf5k4oFGFszl0c1rxFqYGuhj9RVsBXVoi4m0VXrRC72hc
         RUZE+PE5v1PJjSCfNkCHRwd1ryIhVk5op6xOnujMMOFiypHZlOYKEhAOdVhIYF11qYIK
         HEIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795661024; x=1796265824;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2s/G/b1FYIMZ47gP2ccnxd5i0/ZdtDVq3vi7/8u2GaQ=;
        b=semzjMIX/bgbavuSKtPPIquPf1R5ZBXO1VJlL2ccjhYsRLWcFlukU+2oxdLa2OU8RJ
         OX51xjt+SOyGAjtzLuzPydDsZ5CqAPMenBIbsATG+6F2m0k/oLnwMVH2AqUUOVuQkikb
         H3QTVxhMH25pRjUXHFpUqaskmM48JJqOx1t7BBEZSgvQCWC0l1ABK/42XGI0NVcagWGU
         IoED5ezGjKz4nihz3+FYyj0OgRyN7DT7TaO/VluYxhOQffV3/BGEnLpJsA84uivHp5/8
         2XXM95lj3R3qVvHVAg8kjCZsele5lbmaEvw4ha3tJ+ACUj7fnTmdK9p/7J/DBcD9bLri
         Jhlg==
X-Forwarded-Encrypted: i=1; AL+hErHXc2zBLXoU/mUmd9KTQt/kFaqoRNjNE3eIBdKezpuPL1sXjxSjKqt8KgCjL7FG6EWTkjJifu/OqL2Ho+Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vF9VjTVTNsQ6pOM4sZhOsTO6+nqT5SxG6dJVi998CaGarlH3z
	/WcKhIaeFQYApprcUQPZNKlykbORaO+XgAtNArI2x6aiRn7CWaREs7TgeSkIz2pJFbrKBw==
X-Received: from dlbts17-n2.prod.google.com ([2002:a05:7022:b051:20b0:1b3:a015:cfb2])
 (user=svv job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:260e:b0:1a9:c52f:655c
 with SMTP id a92af1059eb24-1b556900476mr22230882c88.36.1795661023461; Wed, 25
 Nov 2026 18:43:43 -0800 (PST)
Date: Wed, 25 Nov 2026 18:43:34 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.911.g883d8bcb20-goog
Message-ID: <20261126024337.4168845-1-svv@google.com>
Subject: [PATCH v2 0/3] Input: add ABS_TWIST and support it in HID and Wacom
From: Siarhei Vishniakou <svv@google.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Ping Cheng <ping.cheng@wacom.com>, 
	Jason Gerecke <jason.gerecke@wacom.com>
Cc: Jason Gerecke <killertofu@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Siarhei Vishniakou <svv@google.com>
Content-Type: text/plain; charset="UTF-8"

Some styli can report rotation along their long ("barrel") axis,
commonly referred to as "twist". While the HID specification defines
this usage as HID_DG_TWIST (0x000d0041) in the Digitizers page, there is
currently no corresponding evdev axis code to expose it to userspace.

Because evdev has no MSC_SCAN equivalent for axes, drivers and OEMs
currently work around this by mapping stylus twist onto unrelated axes
such as ABS_Z or ABS_RZ. As a result, userspace input stacks must
maintain device-specific workarounds to know which axis carries twist.

This series introduces a dedicated ABS_TWIST (0x1d) axis for single-tool
devices such as styli and wires it up in the HID subsystem:

1. Input: Define ABS_TWIST (0x1d) in input-event-codes.h, add its name
   to hid-debug.c, and document its semantics in event-codes.rst.
2. HID: Map HID_DG_TWIST (0x000d0041) to ABS_TWIST in hid-input, compute
   its resolution in units/radian, and add KUnit test coverage.
3. HID: wacom: Report un-offset pen twist on ABS_TWIST (zero at top/-Y)
   while keeping the shifted ABS_Z axis (zero at left/-X) for backwards
   compatibility with existing applications.

v1: https://lore.kernel.org/linux-input/20261110020632.4003499-1-svv@google.com/

Changes in v2:
- Rebased onto v7.4-rc4 (8d7fe9885c62, including hid-for-linus-2026112301).
- Patch 1 (Dmitry):
  - Moved ABS_TWIST directly below ABS_SND_PROFILE in event-codes.rst.
  - Expanded event-codes.rst with precise value semantics: clockwise
    rotation when viewed down the barrel toward the surface, zero when
    the neutral reference faces the top (-Y, north) of the surface,
    support for both non-negative [0, 360) and signed [-180, 180)
    full-revolution ranges with wraparound, units/radian resolution,
    and the distinction from ABS_MT_ORIENTATION.
- Patch 2:
  - No changes.
- Patch 3 (Jason):
  - Added comments explaining the forced angular resolution_code in
    wacom_map_usage(), the order-dependent double-mapping in
    wacom_wac_pen_usage_mapping(), and explicit ABS_Z emission in
    wacom_wac_pen_event().
  - Emit un-offset twist (zero at top/-Y, matching ABS_TWIST
    documentation and HID_DG_TWIST) on ABS_TWIST across all three pen
    rotation paths, while preserving the +1/4 revolution offset (zero at
    left/-X) on legacy ABS_Z.

Testing:
Hardware-tested with a Wacom Intuos Pro and Art Pen 2 (HID_GENERIC
path): verified ABS_TWIST reports 0 when the barrel button points to the
top (-Y) edge, increases clockwise when viewed from eraser toward tip,
tracks ABS_Z with a constant +450 (+90 deg) offset, resets cleanly to 0
on proximity exit, and exposes min -900, max 899, resolution 287.

Siarhei Vishniakou (3):
  Input: add ABS_TWIST event code
  HID: input: map Digitizers Twist usage to ABS_TWIST
  HID: wacom: report ABS_TWIST alongside ABS_Z for pen twist

 Documentation/input/event-codes.rst    | 23 +++++++
 drivers/hid/hid-debug.c                |  1 +
 drivers/hid/hid-input-test.c           | 87 ++++++++++++++++++++++++
 drivers/hid/hid-input.c                |  5 ++
 drivers/hid/wacom_wac.c                | 94 ++++++++++++++++++++------
 include/uapi/linux/input-event-codes.h |  1 +
 6 files changed, 189 insertions(+), 22 deletions(-)

base-commit: 8d7fe9885c62fc9a95bf55d9db244d9672a8aadc

-- 
2.56.1.911.g883d8bcb20-goog

